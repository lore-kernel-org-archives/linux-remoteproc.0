Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 7 Nov 2017 11:18:01 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/5] soc: qcom: Introduce QMI helpers
Message-ID: <20171107191801.GX28761@minitux>
References: <20171107052042.22569-1-bjorn.andersson@linaro.org>
 <20171107052042.22569-3-bjorn.andersson@linaro.org>
 <5d6b232c-341d-ed97-edc4-7492dbe3674b@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d6b232c-341d-ed97-edc4-7492dbe3674b@codeaurora.org>
To: Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 07 Nov 08:27 PST 2017, Arun Kumar Neelakantam wrote:
> On 11/7/2017 10:50 AM, Bjorn Andersson wrote:
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > index 91b70b170a82..9718f1c41e3d 100644
> > --- a/drivers/soc/qcom/Kconfig
> > +++ b/drivers/soc/qcom/Kconfig
> > @@ -37,6 +37,7 @@ config QCOM_PM
> >   config QCOM_QMI_HELPERS
> >   	tristate
> > +	depends on ARCH_QCOM
> I feel It should depend on QRTR instead of ARCH_QCOM

make currently skips drivers/soc/qcom when ARCH_QCOM is not set (Kbuild
doesn't), so this "depends on" ensures that anyone selecting this will
get a "unmet dependency" warning from Kbuild if they don't also depends
on ARCH_QCOM.

Not specifying a dependency on QRTR does increase build test coverage
somewhat, but as we're still limited by ARCH_QCOM it's not that big of a
gain. So I'll add this, as you suggest.

[..]
> > diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
[..]
> > +static void qmi_send_new_server(struct qmi_handle *qmi, struct qmi_service *svc)
> > +{
> > +	struct qrtr_ctrl_pkt pkt;
> > +	struct sockaddr_qrtr sq;
> > +	struct msghdr msg = {0};
> > +	struct kvec iv = { &pkt, sizeof(pkt) };
> > +	int ret;
> > +
> > +	memset(&pkt, 0, sizeof(pkt));
> > +	pkt.cmd = cpu_to_le32(QRTR_TYPE_NEW_SERVER);
> > +	pkt.server.service = cpu_to_le32(svc->service);
> > +	pkt.server.instance = cpu_to_le32(svc->version | svc->instance << 8);
> > +	pkt.server.node = qmi->sq.sq_node;
> > +	pkt.server.port = qmi->sq.sq_port;
> > +
> > +	sq.sq_family = qmi->sq.sq_family;
> > +	sq.sq_node = qmi->sq.sq_node;
> > +	sq.sq_port = QRTR_PORT_CTRL;
> > +
> > +	msg.msg_name = &sq;
> > +	msg.msg_namelen = sizeof(sq);
> > +
> > +	mutex_lock(&qmi->sock_lock);
> > +	if (qmi->sock) {
> > +		ret = kernel_sendmsg(qmi->sock, &msg, &iv, 1, sizeof(pkt));
> This NEW_SERVER message is send to name server then it will be broadcasted
> to all nodes in network by name server right.

Correct, above you can see that I use the sq_node of our socket as
destination node and QRTR_PORT_CTRL.

The name service will forward the information about the new service to
any registered nodes and will keep track of it and advertise it to
future appearing nodes.

[..]
> > +/**
> > + * qmi_send_indication() - send a request QMI message
> Look incorrect function name is used

Yes, a copy-paste error of mine. Will fix.

> > + * @qmi:	QMI client handle
> > + * @sq:		destination sockaddr
> > + * @txn:	transaction object to use for the message
> > + * @msg_id:	message id
> > + * @len:	max length of the QMI message
> > + * @ei:		QMI message description
> > + * @c_struct:	object to be encoded
> > + *
> > + * Returns 0 on success, negative errno on failure.
> > + */
> > +ssize_t qmi_send_request(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
> > +			 struct qmi_txn *txn, int msg_id, size_t len,
> > +			 struct qmi_elem_info *ei, const void *c_struct)
> > +{
> > +	return qmi_send_message(qmi, sq, txn, QMI_REQUEST, msg_id, len, ei,
> > +				c_struct);
> > +}
> > +EXPORT_SYMBOL_GPL(qmi_send_request);
> > +
> > +/**
> > + * qmi_send_indication() - send a response QMI message
> Look incorrect function name is used

Dito.

Thank you,
Bjorn
