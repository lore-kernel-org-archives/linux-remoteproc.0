Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 2/5] soc: qcom: Introduce QMI helpers
References: <20171115201012.25892-1-bjorn.andersson@linaro.org>
 <20171115201012.25892-3-bjorn.andersson@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f4dbc5f7-04aa-b493-da22-2a8df465496b@linaro.org>
Date: Thu, 16 Nov 2017 12:11:13 +0000
MIME-Version: 1.0
In-Reply-To: <20171115201012.25892-3-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 15/11/17 20:10, Bjorn Andersson wrote:
> Drivers that needs to communicate with a remote QMI service all has to
> perform the operations of discovering the service, encoding and decoding
> the messages and operate the socket. This introduces an abstraction for
> these common operations, reducing most of the duplication in such cases.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Fix typos
> - Checkpatch fixes
> - Use non-GPL EXPORT_SYMBOL
> 
> Changes since v1:
> - Squashed notion of qmi vs qrtr in interface, to simplify client code
> - Lookup and service registration is cached and handled by core on ENETRESET
> - Introduce callbacks for BYE and DEL_CLIENT control messages
> - Revisited locking for socket and transaction objects, squashed a few races
>    and made it possible to send "indication" messages from message handlers.
> - kerneldoc updates
> - Moved handling of net_reset from clients to this code, greatly simplifies
>    typical drivers and reduces duplication
> - Pass transaction id of QMI message to handlers even though it's not a
>    response, allows sending a response with the txn id of an incoming request.
> - Split qmi_send_message() in three, instead of passing type as parameter - to
>    clean up handling of "indication" messages.
> 
>   drivers/soc/qcom/Kconfig         |   1 +
>   drivers/soc/qcom/Makefile        |   1 +
>   drivers/soc/qcom/qmi_interface.c | 849 +++++++++++++++++++++++++++++++++++++++
>   include/linux/soc/qcom/qmi.h     | 157 ++++++++
>   4 files changed, 1008 insertions(+)
>   create mode 100644 drivers/soc/qcom/qmi_interface.c
> 

I have tested this patch along with slimbus ngd for wcd9335 analog audio 
  playback.

Tested-By: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Few minor comments though!!
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 91b70b170a82..9718f1c41e3d 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -37,6 +37,7 @@ config QCOM_PM
>   
>   config QCOM_QMI_HELPERS
>   	tristate
> +	depends on ARCH_QCOM

This bit is confusing!!, first patch added this symbol and this patch 
added the depends. either we move this to first patch or move out the 
QCOM_QMI_HELPERS from first patch and include in this patch

>   	help
>   	  Helper library for handling QMI encoded messages.  QMI encoded
>   	  messages are used in communication between the majority of QRTR
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 625750acfeef..b04b5044775f 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
>   obj-$(CONFIG_QCOM_PM)	+=	spm.o
>   obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
>   qmi_helpers-y	+= qmi_encdec.o
> +qmi_helpers-y	+= qmi_interface.o
for better reading.. i would suggest..
qmi_helpers-y	+= qmi_encdec.o qmi_interface.o


>   obj-$(CONFIG_QCOM_SMD_RPM)	+= smd-rpm.o
>   obj-$(CONFIG_QCOM_SMEM) +=	smem.o
>   obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
> diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
> new file mode 100644
> index 000000000000..6651257f15a4
> --- /dev/null
> +++ b/drivers/soc/qcom/qmi_interface.c
> @@ -0,0 +1,849 @@
> +/*
> + * Copyright (C) 2017 Linaro Ltd.
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/platform_device.h>

Do we need this?

> +#include <linux/qrtr.h>
> +#include <linux/net.h>
> +#include <linux/completion.h>
> +#include <linux/idr.h>
> +#include <linux/string.h>
> +#include <net/sock.h>
> +#include <linux/workqueue.h>
> +#include <linux/soc/qcom/qmi.h>
> +
> +static struct socket *qmi_sock_create(struct qmi_handle *qmi,
> +				      struct sockaddr_qrtr *sq);
> +
> +/**
> + * qmi_recv_new_server() - handler of NEW_SERVER control message
> + * @qmi:	qmi handle
> + * @node:	node of the new server
> + * @port:	port of the new server
> + *
service and instance is not documented here.

> + * Calls the new_server callback to inform the client about
> +	msg.msg_name = &sq;
> +	msg.msg_namelen = sizeof(sq);
> +
> +	mutex_lock(&qmi->sock_lock);
> +	if (qmi->sock) {
> +		ret = kernel_sendmsg(qmi->sock, &msg, &iv, 1, sizeof(pkt));
> +		if (ret < 0)
> +			pr_err("failed to send lookup registration: %d\n", ret);
> +	}
> +	mutex_unlock(&qmi->sock_lock);
> +}
> +
> +/**
> + * qmi_add_lookup() - register a new lookup with the name service
> + * @qmi:	qmi handle
> + * @service:	service id of the request
> + * @instance:	instance id of the request
> + *

version not documented.

> + * Returns 0 on success, negative errno on failure.
> + *
> + * Registering a lookup query with the name server will cause the name server
> + * to send NEW_SERVER and DEL_SERVER control messages to this socket as
> + * matching services are registered.
> + */
> +int qmi_add_lookup(struct qmi_handle *qmi, unsigned int service,
> +		   unsigned int version, unsigned int instance)
> +{
> +	struct qmi_service *svc;
> +
> +	svc = kzalloc(sizeof(*svc), GFP_KERNEL);
> +	if (!svc)
> +		return -ENOMEM;
> +
> +	svc->service = service;
> +	svc->version = version;
> +	svc->instance = instance;
> +
> +	list_add(&svc->list_node, &qmi->lookups);
> +
> +	qmi_send_new_lookup(qmi, svc);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(qmi_add_lookup);
> +**
> + * qmi_add_server() - register a service with the name service
> + * @qmi:	qmi handle
> + * @service:	type of the service
> + * @instance:	instance of the service
> + *

version not documented.


> + * Returns 0 on success, negative errno on failure.
> + *
> + * Register a new service with the name service. This allows clients to find
> + * and start sending messages to the client associated with @qmi.
> + */
> +int qmi_add_server(struct qmi_handle *qmi, unsigned int service,
> +		   unsigned int version, unsigned int instance)
> +{
> +	struct qmi_service *svc;
> +
> +	svc = kzalloc(sizeof(*svc), GFP_KERNEL);
> +	if (!svc)
> +		return -ENOMEM;
> +
> +static struct socket *qmi_sock_create(struct qmi_handle *qmi,
> +				      struct sockaddr_qrtr *sq)
> +{
> +	struct socket *sock;
> +	int sl = sizeof(*sq);
> +	int ret;
> +
> +	ret = sock_create_kern(&init_net, AF_QIPCRTR, SOCK_DGRAM,
> +			       PF_QIPCRTR, &sock);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
> +
> +	ret = kernel_getsockname(sock, (struct sockaddr *)sq, &sl);
> +	if (ret < 0) {
> +		sock_release(sock);
> +		return ERR_PTR(ret);
> +	}
> +
> +	sock->sk->sk_user_data = qmi;
> +	sock->sk->sk_data_ready = qmi_data_ready;
> +	sock->sk->sk_error_report = qmi_data_ready;
> +
> +	return sock;
> +}
> +
> +/**
> + * qmi_handle_init() - initialize a QMI client handle
> + * @qmi:	QMI handle to initialize
> + * @max_msg_len: maximum size of incoming message
do we need this??


> + * @handlers:	NULL-terminated list of QMI message handlers
> + *
recv_buf_size and ops not documented

> + * Returns 0 on success, negative errno on failure.
> + *
> + * This initializes the QMI client handle to allow sending and receiving QMI
> + * messages. As messages are received the appropriate handler will be invoked.
> + */
> +int qmi_handle_init(struct qmi_handle *qmi, size_t recv_buf_size,
> +		    struct qmi_ops *ops, struct qmi_msg_handler *handlers)
> +{
> +	int ret;
> +
>
.....

> + */
> +ssize_t qmi_send_response(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
> +			  struct qmi_txn *txn, int msg_id, size_t len,
> +			  struct qmi_elem_info *ei, const void *c_struct)
> +{
> +	return qmi_send_message(qmi, sq, txn, QMI_RESPONSE, msg_id, len, ei,
> +				c_struct);
> +}
> +EXPORT_SYMBOL(qmi_send_response);
> +
> +/**
> + * qmi_send_indication() - send an indication QMI message
> + * @qmi:	QMI client handle
> + * @sq:		destination sockaddr
> + * @txn:	transaction object to use for the message

txn is not required here?

> + * @msg_id:	message id
> + * @len:	max length of the QMI message
> + * @ei:		QMI message description
> + * @c_struct:	object to be encoded
> + *
> + * Returns 0 on success, negative errno on failure.
> + */
> +ssize_t qmi_send_indication(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
> +			    int msg_id, size_t len, struct qmi_elem_info *ei,
> +			    const void *c_struct)
> +{
> +	struct qmi_txn txn;
> +	ssize_t rval;
...

> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
> index 5df7edfc6bfd..9b4f4fa5bed6 100644
> --- a/include/linux/soc/qcom/qmi.h
> +++ b/include/linux/soc/qcom/qmi.h

Looks like this patch added few things like list, wq and so to this 
header file, should we not add headers for those ??

> @@ -105,6 +105,158 @@ struct qmi_response_type_v01 {
>   
>   extern struct qmi_elem_info qmi_response_type_v01_ei[];
>   
..
> +struct qmi_handle {
> +	struct socket *sock;
> +	struct mutex sock_lock;
> +
> +	struct sockaddr_qrtr sq;
> +
> +	struct work_struct work;
> +	struct workqueue_struct *wq;
> +
> +	void *recv_buf;
> +	size_t recv_buf_size;
> +
> +	struct list_head lookups;
> +	struct list_head lookup_results;
> +	struct list_head services;
> +
> +	struct qmi_ops ops;
> +
> +	struct idr txns;
> +	struct mutex txn_lock;
> +
> +	struct qmi_msg_handler *handlers;
> +};
> +
> +int qmi_add_lookup(struct qmi_handle *qmi, unsigned int service,
> +		   unsigned int version, unsigned int instance);
> +int qmi_add_server(struct qmi_handle *qmi, unsigned int service,
> +		   unsigned int version, unsigned int instance);
> +
> +int qmi_handle_init(struct qmi_handle *qmi, size_t max_msg_len,
> +		    struct qmi_ops *ops, struct qmi_msg_handler *handlers);
> +void qmi_handle_release(struct qmi_handle *qmi);
> +
> +ssize_t qmi_send_request(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
> +			 struct qmi_txn *txn, int msg_id, size_t len,
> +			 struct qmi_elem_info *ei, const void *c_struct);
> +ssize_t qmi_send_response(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
> +			  struct qmi_txn *txn, int msg_id, size_t len,
> +			  struct qmi_elem_info *ei, const void *c_struct);
> +ssize_t qmi_send_indication(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
> +			    int msg_id, size_t len, struct qmi_elem_info *ei,
> +			    const void *c_struct);
> +
>   void *qmi_encode_message(int type, unsigned int msg_id, size_t *len,
>   			 unsigned int txn_id, struct qmi_elem_info *ei,
>   			 const void *c_struct);
> @@ -112,4 +264,9 @@ void *qmi_encode_message(int type, unsigned int msg_id, size_t *len,
>   int qmi_decode_message(const void *buf, size_t len,
>   		       struct qmi_elem_info *ei, void *c_struct);
>   
> +int qmi_txn_init(struct qmi_handle *qmi, struct qmi_txn *txn,
> +		 struct qmi_elem_info *ei, void *c_struct);
> +int qmi_txn_wait(struct qmi_txn *txn, unsigned long timeout);
> +void qmi_txn_cancel(struct qmi_txn *txn);

Same comment as first patch, should we consider adding dummy functions 
to facilitate COMPILE_TEST for drivers using this apis?

> +
>   #endif
> 
