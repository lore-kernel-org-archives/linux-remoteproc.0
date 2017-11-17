Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 16 Nov 2017 22:30:54 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/5] soc: qcom: Introduce QMI helpers
Message-ID: <20171117063054.GT28761@minitux>
References: <20171115201012.25892-1-bjorn.andersson@linaro.org>
 <20171115201012.25892-3-bjorn.andersson@linaro.org>
 <f4dbc5f7-04aa-b493-da22-2a8df465496b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4dbc5f7-04aa-b493-da22-2a8df465496b@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 16 Nov 04:11 PST 2017, Srinivas Kandagatla wrote:
> On 15/11/17 20:10, Bjorn Andersson wrote:
[..]
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > index 91b70b170a82..9718f1c41e3d 100644
> > --- a/drivers/soc/qcom/Kconfig
> > +++ b/drivers/soc/qcom/Kconfig
> > @@ -37,6 +37,7 @@ config QCOM_PM
> >   config QCOM_QMI_HELPERS
> >   	tristate
> > +	depends on ARCH_QCOM
> 
> This bit is confusing!!, first patch added this symbol and this patch added
> the depends. either we move this to first patch or move out the
> QCOM_QMI_HELPERS from first patch and include in this patch
> 

Ohh, that's not right. The depends should be in the same patch.

And we don't really depends on ARCH_QCOM here, but without it Kconfig
doesn't know that make won't enter drivers/soc/qcom so we will end up
with a link error. I'm hoping we can fix this issue, to get some more
compile testing of these things.

> >   	help
> >   	  Helper library for handling QMI encoded messages.  QMI encoded
> >   	  messages are used in communication between the majority of QRTR
> > diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
[..]
> >   obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
> >   qmi_helpers-y	+= qmi_encdec.o
> > +qmi_helpers-y	+= qmi_interface.o
> for better reading.. i would suggest..
> qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
> 

Sounds reasonable.

> 
> >   obj-$(CONFIG_QCOM_SMD_RPM)	+= smd-rpm.o
> >   obj-$(CONFIG_QCOM_SMEM) +=	smem.o
> >   obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
> > diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
[..]
> > +#include <linux/platform_device.h>
> 
> Do we need this?
> 

I don't think so.

[..]
> > +/**
> > + * qmi_recv_new_server() - handler of NEW_SERVER control message
> > + * @qmi:	qmi handle
> > + * @node:	node of the new server
> > + * @port:	port of the new server
> > + *
> service and instance is not documented here.
> 

Thanks for noticing, will fix these.

[..]
> > +/**
> > + * qmi_handle_init() - initialize a QMI client handle
> > + * @qmi:	QMI handle to initialize
> > + * @max_msg_len: maximum size of incoming message
> do we need this??
> 

We need a buffer into which we can receive incoming packets, so either
we allocate a large enough buffer up front or we have to ask qrtr before
each packet how much space we will need.

I think largest possible buffer is 64kB, but typically we need much
less. And the IDL compiler seems to output this constant, so it seems
reasonable to pass it here.

> 
> > + * @handlers:	NULL-terminated list of QMI message handlers
> > + *
> recv_buf_size and ops not documented
> 

Looks like I've renamed max_msg_len to recv_buf_size, and forgot to add
ops. Will fix.

[..]
> > +
> > +/**
> > + * qmi_send_indication() - send an indication QMI message
> > + * @qmi:	QMI client handle
> > + * @sq:		destination sockaddr
> > + * @txn:	transaction object to use for the message
> 
> txn is not required here?
> 

No. Indications are fire-and-forget messages, but still need a
transaction id, so it's confusing for the client to have to create a
txn, use it and then cancel it (or to add another txn operation for
this). Therefor I'm hiding the txn handling inside this function.

Will fix the kerneldoc.

[..]
> > diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
> > index 5df7edfc6bfd..9b4f4fa5bed6 100644
> > --- a/include/linux/soc/qcom/qmi.h
> > +++ b/include/linux/soc/qcom/qmi.h
> 
> Looks like this patch added few things like list, wq and so to this header
> file, should we not add headers for those ??
> 

Will review these.

Thanks for the review!

Regards,
Bjorn
