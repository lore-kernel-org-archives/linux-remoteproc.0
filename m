Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC530C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Oct 2021 16:22:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7B9361381
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Oct 2021 16:22:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236482AbhJEQYf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Oct 2021 12:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236107AbhJEQYe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Oct 2021 12:24:34 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F69AC061749
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Oct 2021 09:22:43 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so26556283ota.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Oct 2021 09:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0iDxCDUbJZEtsInCF0VI19qSw9EILeIM3q4Rb38pchY=;
        b=KnVGpJA6MNPtFCXwf0kBZTz96mduFZVvNvXpZfVohdcldJ7O1xlDVYEHYC4wrQfn/5
         ApCIB3b/I1swSE2sQe2vl4CMl4OmOitNBE/pG1MlgPuQfR5vQO/yszMbmkpBgf228os9
         eLh4gL/ZubXxV7jnuIvBL8F99rtjSwNbLrEnnZCKm/IiuwXF/ZcMGMOzkg1h9WMDeISI
         NmGuLmObZJqApXR/0H11SOt9ygQaehi06OD0nNmzkAzPQDrgrkygLwamz8eR1ifBfw3e
         /1xwuRXYT6r48pgCYHOg47nbHOSkN3OSkqlSnXLGprupaDaxhaLrbh+zzmf+rlKsTcvv
         KV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0iDxCDUbJZEtsInCF0VI19qSw9EILeIM3q4Rb38pchY=;
        b=rRxzEENGBE8WZFJXPRqT4ogaeNyH1dfovBEHIFBdgjtxF6I773DnXuRDRuKdBA2mxu
         9hy1s2l1JEt6ybjx/9D1SCwrN+Zz+B6VE3eHIsXgpSfpwu8GCczWseqw5cj3jvnBKLRW
         IfxKsaRJK6zVlQtSAf4w3q8ZEcX2dtUcnu64IiqKrhXjAskIiPo9Xr/QbdOjw102oc2c
         rTrOSmEcHkEt+grqgix6baqCSgIn+DHsmyLAMzIuDCKwIXuzB++2GfbG0RtxjComuXe9
         i7JCWH+EHNmwKSDDjyFvzsn2d1Wq6A4yHqurHw3IBJqmZMs4owogmZ8G2mvg0jbTltE4
         Rr/Q==
X-Gm-Message-State: AOAM533VIz9ccgkfdc+ftIcmiGNuS7yAzvMOENzBscz9stvB/gXFA9Ql
        59gV+rNnzFuT5XYj/N2Y65/yAQ==
X-Google-Smtp-Source: ABdhPJyZ718hxVqtaUzE40mz8eqAfaT/bHp4zD0AuXZRWu/Vb3gXElvYwkWZ//QuEF2LaWFpOQST/g==
X-Received: by 2002:a9d:3ae:: with SMTP id f43mr14671393otf.320.1633450961314;
        Tue, 05 Oct 2021 09:22:41 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id i25sm3649241oto.26.2021.10.05.09.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 09:22:40 -0700 (PDT)
Date:   Tue, 5 Oct 2021 09:24:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Suman Anna <s-anna@ti.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v8 2/2] tty: add rpmsg driver
Message-ID: <YVx8N0fmZI/jzkiM@ripper>
References: <20210930160520.19678-1-arnaud.pouliquen@foss.st.com>
 <20210930160520.19678-3-arnaud.pouliquen@foss.st.com>
 <YVtgG01o5pyB3Tc8@ripper>
 <04f62e46-74ca-b7b5-a229-fdf6651343be@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04f62e46-74ca-b7b5-a229-fdf6651343be@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 05 Oct 09:00 PDT 2021, Arnaud POULIQUEN wrote:

> Hello Bjorn,
> 
> On 10/4/21 10:12 PM, Bjorn Andersson wrote:
> > On Thu 30 Sep 09:05 PDT 2021, Arnaud Pouliquen wrote:
> > 
> >> This driver exposes a standard TTY interface on top of the rpmsg
> >> framework through a rpmsg service.
> >>
> >> This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
> >> per rpmsg endpoint.
> >>
> > 
> > I think this looks pretty good, but it's a while since we discussed
> > this, reading your patches again makes me wonder:
> 
> That's fair, the last discussion on the topic was over a year ago.
> 
> > 
> > 1) With all the efforts related to virtualization and adding things such
> > as I2C support there, what are the merits of putting a tty driver ontop
> > of rpmsg in comparison with directly on virtio - which would be used for
> > virtualization as well.
> 
> As mentionned in the cover letter, the main advantage of the RPMsg vs virtio is
> that RPMsg is able to mix the services on an unique virtio instance. Using
> Virtio console implies to add a new virtio instance for each service (or
> instance of a service) with associated mailbox channels.
> Taking advantage of the RPMsg service mixing is important for platform (such as
> stm32MP1) on which coprocessor is limited in term of memory mapping.
> 

The limitations related to mapping additional virtio pipes does seem
like a reasonable one. I just hope we don't end up duplicating much of
the virtualization effort, with the recently concluded I2C client
support coming to mind.

> I also expect that this service would be available for some other backend than
> the virtio one.
> 

Last time we discussed this I believe I mentioned the AT command
channels found in Qualcomm modems. Since then that got pushed into
drivers/net/wwan, for the few other cases rpmsg_char works fine.

> > 
> > 2) What prevents you from pointing your userspace tool at an rpmsg_char
> > endpoint?
> 
> You are right rpmsg_char could be an alternative. But advantage of the TTY is:
> 
> - It possible to reuse existing applications/tools relying on TTY devices.
> An example is a TTY RPMSG device dedicated for coprocessor traces that can be
> simply redirect to a log file or mixed to the kernel logs by scripts.
> Another exemple is the ability to ease migration from a 2-processors system
> solution (with UART-based IPC) to a system solution with an internal
> coprocessor. We received such requirement from some ST customers.
> 

I presume the transport itself provided by rpmsg_char would work just
fine for this, but that these applications expects something from the
tty framework, with its known ioctls etc?

> - For rpmsg_char you have to share device between TX and RX (only one fopen
> allowed per device), while TTY allows you to manage one device in 2 independent
> threads/appliaction.
> 

At least in the Qualcomm case, where the channels have a state and
clients opening and closing the rpmsg_char will affect that state it
simplifies things a lot not to support a multi-client model. So I think
there's merit to this difference.

> - TTY framework manages intermediate buffer that allow to free Rx RPMsg buffers.
> 

rpmsg_char does the same thing, by putting incoming messages on
epddev->queue.

> So rpmsg_char and rpmsg_tty don't seem to me to cover exactly the same requierement.
> 

No, you're right there's some differences here.

Regards,
Bjorn

> Thanks,
> Arnaud
> 
> > 
> > Thanks,
> > Bjorn
> > 
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  Documentation/serial/tty_rpmsg.rst |  15 ++
> >>  drivers/tty/Kconfig                |   9 +
> >>  drivers/tty/Makefile               |   1 +
> >>  drivers/tty/rpmsg_tty.c            | 275 +++++++++++++++++++++++++++++
> >>  4 files changed, 300 insertions(+)
> >>  create mode 100644 Documentation/serial/tty_rpmsg.rst
> >>  create mode 100644 drivers/tty/rpmsg_tty.c
> >>
> >> diff --git a/Documentation/serial/tty_rpmsg.rst b/Documentation/serial/tty_rpmsg.rst
> >> new file mode 100644
> >> index 000000000000..b055107866c9
> >> --- /dev/null
> >> +++ b/Documentation/serial/tty_rpmsg.rst
> >> @@ -0,0 +1,15 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +
> >> +=========
> >> +RPMsg TTY
> >> +=========
> >> +
> >> +The rpmsg tty driver implements serial communication on the RPMsg bus to makes possible for
> >> +user-space programs to send and receive rpmsg messages as a standard tty protocol.
> >> +
> >> +The remote processor can instantiate a new tty by requesting a "rpmsg-tty" RPMsg service.
> >> +
> >> +The "rpmsg-tty" service is directly used for data exchange. No flow control is implemented.
> >> +
> >> +Information related to the RPMsg and associated tty device is available in
> >> +/sys/bus/rpmsg/devices/.
> >> diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
> >> index 23cc988c68a4..5095513029d7 100644
> >> --- a/drivers/tty/Kconfig
> >> +++ b/drivers/tty/Kconfig
> >> @@ -368,6 +368,15 @@ config VCC
> >>  
> >>  source "drivers/tty/hvc/Kconfig"
> >>  
> >> +config RPMSG_TTY
> >> +	tristate "RPMSG tty driver"
> >> +	depends on RPMSG
> >> +	help
> >> +	  Say y here to export rpmsg endpoints as tty devices, usually found
> >> +	  in /dev/ttyRPMSGx.
> >> +	  This makes it possible for user-space programs to send and receive
> >> +	  rpmsg messages as a standard tty protocol.
> >> +
> >>  endif # TTY
> >>  
> >>  source "drivers/tty/serdev/Kconfig"
> >> diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
> >> index a2bd75fbaaa4..07aca5184a55 100644
> >> --- a/drivers/tty/Makefile
> >> +++ b/drivers/tty/Makefile
> >> @@ -26,5 +26,6 @@ obj-$(CONFIG_PPC_EPAPR_HV_BYTECHAN) += ehv_bytechan.o
> >>  obj-$(CONFIG_GOLDFISH_TTY)	+= goldfish.o
> >>  obj-$(CONFIG_MIPS_EJTAG_FDC_TTY) += mips_ejtag_fdc.o
> >>  obj-$(CONFIG_VCC)		+= vcc.o
> >> +obj-$(CONFIG_RPMSG_TTY)		+= rpmsg_tty.o
> >>  
> >>  obj-y += ipwireless/
> >> diff --git a/drivers/tty/rpmsg_tty.c b/drivers/tty/rpmsg_tty.c
> >> new file mode 100644
> >> index 000000000000..0c99f54c2911
> >> --- /dev/null
> >> +++ b/drivers/tty/rpmsg_tty.c
> >> @@ -0,0 +1,275 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
> >> + */
> >> +
> >> +#include <linux/module.h>
> >> +#include <linux/rpmsg.h>
> >> +#include <linux/slab.h>
> >> +#include <linux/tty.h>
> >> +#include <linux/tty_flip.h>
> >> +
> >> +#define MAX_TTY_RPMSG	32
> >> +
> >> +static DEFINE_IDR(tty_idr);	/* tty instance id */
> >> +static DEFINE_MUTEX(idr_lock);	/* protects tty_idr */
> >> +
> >> +static struct tty_driver *rpmsg_tty_driver;
> >> +
> >> +struct rpmsg_tty_port {
> >> +	struct tty_port		port;	 /* TTY port data */
> >> +	int			id;	 /* TTY rpmsg index */
> >> +	struct rpmsg_device	*rpdev;	 /* rpmsg device */
> >> +};
> >> +
> >> +static int rpmsg_tty_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
> >> +{
> >> +	struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
> >> +	int copied;
> >> +
> >> +	if (!len)
> >> +		return -EINVAL;
> >> +	copied = tty_insert_flip_string(&cport->port, data, len);
> >> +	if (copied != len)
> >> +		dev_dbg(&rpdev->dev, "Trunc buffer: available space is %d\n",
> >> +			copied);
> >> +	tty_flip_buffer_push(&cport->port);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int rpmsg_tty_install(struct tty_driver *driver, struct tty_struct *tty)
> >> +{
> >> +	struct rpmsg_tty_port *cport = idr_find(&tty_idr, tty->index);
> >> +
> >> +	if (!cport) {
> >> +		dev_err(tty->dev, "Cannot get cport\n");
> >> +		return -ENODEV;
> >> +	}
> >> +
> >> +	tty->driver_data = cport;
> >> +
> >> +	return tty_port_install(&cport->port, driver, tty);
> >> +}
> >> +
> >> +static int rpmsg_tty_open(struct tty_struct *tty, struct file *filp)
> >> +{
> >> +	return tty_port_open(tty->port, tty, filp);
> >> +}
> >> +
> >> +static void rpmsg_tty_close(struct tty_struct *tty, struct file *filp)
> >> +{
> >> +	return tty_port_close(tty->port, tty, filp);
> >> +}
> >> +
> >> +static int rpmsg_tty_write(struct tty_struct *tty, const u8 *buf, int len)
> >> +{
> >> +	struct rpmsg_tty_port *cport = tty->driver_data;
> >> +	struct rpmsg_device *rpdev;
> >> +	int msg_max_size, msg_size;
> >> +	int ret;
> >> +
> >> +	rpdev = cport->rpdev;
> >> +
> >> +	dev_dbg(&rpdev->dev, "Send msg from tty->index = %d, len = %d\n", tty->index, len);
> >> +
> >> +	msg_max_size = rpmsg_get_mtu(rpdev->ept);
> >> +	if (msg_max_size < 0)
> >> +		return msg_max_size;
> >> +
> >> +	msg_size = min(len, msg_max_size);
> >> +
> >> +	/*
> >> +	 * Use rpmsg_trysend instead of rpmsg_send to send the message so the caller is not
> >> +	 * hung until a rpmsg buffer is available. In such case rpmsg_trysend returns -ENOMEM.
> >> +	 */
> >> +	ret = rpmsg_trysend(rpdev->ept, (void *)buf, msg_size);
> >> +	if (ret) {
> >> +		dev_dbg(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	return msg_size;
> >> +}
> >> +
> >> +static unsigned int rpmsg_tty_write_room(struct tty_struct *tty)
> >> +{
> >> +	struct rpmsg_tty_port *cport = tty->driver_data;
> >> +	int size;
> >> +
> >> +	size = rpmsg_get_mtu(cport->rpdev->ept);
> >> +	if (size < 0)
> >> +		return 0;
> >> +
> >> +	return size;
> >> +}
> >> +
> >> +static const struct tty_operations rpmsg_tty_ops = {
> >> +	.install	= rpmsg_tty_install,
> >> +	.open		= rpmsg_tty_open,
> >> +	.close		= rpmsg_tty_close,
> >> +	.write		= rpmsg_tty_write,
> >> +	.write_room	= rpmsg_tty_write_room,
> >> +};
> >> +
> >> +static struct rpmsg_tty_port *rpmsg_tty_alloc_cport(void)
> >> +{
> >> +	struct rpmsg_tty_port *cport;
> >> +	int err;
> >> +
> >> +	cport = kzalloc(sizeof(*cport), GFP_KERNEL);
> >> +	if (!cport)
> >> +		return ERR_PTR(-ENOMEM);
> >> +
> >> +	mutex_lock(&idr_lock);
> >> +	cport->id = idr_alloc(&tty_idr, cport, 0, MAX_TTY_RPMSG, GFP_KERNEL);
> >> +	mutex_unlock(&idr_lock);
> >> +
> >> +	if (cport->id < 0) {
> >> +		err = cport->id;
> >> +		kfree(cport);
> >> +		return ERR_PTR(err);
> >> +	}
> >> +
> >> +	return cport;
> >> +}
> >> +
> >> +static void rpmsg_tty_release_cport(struct rpmsg_tty_port *cport)
> >> +{
> >> +	mutex_lock(&idr_lock);
> >> +	idr_remove(&tty_idr, cport->id);
> >> +	mutex_unlock(&idr_lock);
> >> +
> >> +	kfree(cport);
> >> +}
> >> +
> >> +static const struct tty_port_operations rpmsg_tty_port_ops = { };
> >> +
> >> +static int rpmsg_tty_probe(struct rpmsg_device *rpdev)
> >> +{
> >> +	struct rpmsg_tty_port *cport;
> >> +	struct device *dev = &rpdev->dev;
> >> +	struct device *tty_dev;
> >> +	int ret;
> >> +
> >> +	cport = rpmsg_tty_alloc_cport();
> >> +	if (IS_ERR(cport)) {
> >> +		dev_err(dev, "Failed to alloc tty port\n");
> >> +		return PTR_ERR(cport);
> >> +	}
> >> +
> >> +	tty_port_init(&cport->port);
> >> +	cport->port.ops = &rpmsg_tty_port_ops;
> >> +
> >> +	tty_dev = tty_port_register_device(&cport->port, rpmsg_tty_driver,
> >> +					   cport->id, dev);
> >> +	if (IS_ERR(tty_dev)) {
> >> +		dev_err(dev, "Failed to register tty port\n");
> >> +		ret = PTR_ERR(tty_dev);
> >> +		goto  err_destroy;
> >> +	}
> >> +
> >> +	cport->rpdev = rpdev;
> >> +
> >> +	dev_set_drvdata(dev, cport);
> >> +
> >> +	dev_dbg(dev, "New channel: 0x%x -> 0x%x : ttyRPMSG%d\n",
> >> +		rpdev->src, rpdev->dst, cport->id);
> >> +
> >> +	return 0;
> >> +
> >> +err_destroy:
> >> +	tty_port_destroy(&cport->port);
> >> +	rpmsg_tty_release_cport(cport);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static void rpmsg_tty_remove(struct rpmsg_device *rpdev)
> >> +{
> >> +	struct rpmsg_tty_port *cport = dev_get_drvdata(&rpdev->dev);
> >> +
> >> +	dev_dbg(&rpdev->dev, "Removing rpmsg tty device %d\n", cport->id);
> >> +
> >> +	/* User hang up to release the tty */
> >> +	if (tty_port_initialized(&cport->port))
> >> +		tty_port_tty_hangup(&cport->port, false);
> >> +
> >> +	tty_unregister_device(rpmsg_tty_driver, cport->id);
> >> +
> >> +	tty_port_destroy(&cport->port);
> >> +	rpmsg_tty_release_cport(cport);
> >> +}
> >> +
> >> +static struct rpmsg_device_id rpmsg_driver_tty_id_table[] = {
> >> +	{ .name	= "rpmsg-tty" },
> >> +	{ },
> >> +};
> >> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_tty_id_table);
> >> +
> >> +static struct rpmsg_driver rpmsg_tty_rpmsg_drv = {
> >> +	.drv.name	= KBUILD_MODNAME,
> >> +	.id_table	= rpmsg_driver_tty_id_table,
> >> +	.probe		= rpmsg_tty_probe,
> >> +	.callback	= rpmsg_tty_cb,
> >> +	.remove		= rpmsg_tty_remove,
> >> +};
> >> +
> >> +static int __init rpmsg_tty_init(void)
> >> +{
> >> +	int err;
> >> +
> >> +	rpmsg_tty_driver = tty_alloc_driver(MAX_TTY_RPMSG, TTY_DRIVER_REAL_RAW |
> >> +					    TTY_DRIVER_DYNAMIC_DEV);
> >> +	if (IS_ERR(rpmsg_tty_driver))
> >> +		return PTR_ERR(rpmsg_tty_driver);
> >> +
> >> +	rpmsg_tty_driver->driver_name = "rpmsg_tty";
> >> +	rpmsg_tty_driver->name = "ttyRPMSG";
> >> +	rpmsg_tty_driver->major = 0;
> >> +	rpmsg_tty_driver->type = TTY_DRIVER_TYPE_CONSOLE;
> >> +
> >> +	/* Disable unused mode by default */
> >> +	rpmsg_tty_driver->init_termios = tty_std_termios;
> >> +	rpmsg_tty_driver->init_termios.c_lflag &= ~(ECHO | ICANON);
> >> +	rpmsg_tty_driver->init_termios.c_oflag &= ~(OPOST | ONLCR);
> >> +
> >> +	tty_set_operations(rpmsg_tty_driver, &rpmsg_tty_ops);
> >> +
> >> +	err = tty_register_driver(rpmsg_tty_driver);
> >> +	if (err < 0) {
> >> +		pr_err("Couldn't install rpmsg tty driver: err %d\n", err);
> >> +		goto error_put;
> >> +	}
> >> +
> >> +	err = register_rpmsg_driver(&rpmsg_tty_rpmsg_drv);
> >> +	if (err < 0) {
> >> +		pr_err("Couldn't register rpmsg tty driver: err %d\n", err);
> >> +		goto error_unregister;
> >> +	}
> >> +
> >> +	return 0;
> >> +
> >> +error_unregister:
> >> +	tty_unregister_driver(rpmsg_tty_driver);
> >> +
> >> +error_put:
> >> +	tty_driver_kref_put(rpmsg_tty_driver);
> >> +
> >> +	return err;
> >> +}
> >> +
> >> +static void __exit rpmsg_tty_exit(void)
> >> +{
> >> +	unregister_rpmsg_driver(&rpmsg_tty_rpmsg_drv);
> >> +	tty_unregister_driver(rpmsg_tty_driver);
> >> +	tty_driver_kref_put(rpmsg_tty_driver);
> >> +	idr_destroy(&tty_idr);
> >> +}
> >> +
> >> +module_init(rpmsg_tty_init);
> >> +module_exit(rpmsg_tty_exit);
> >> +
> >> +MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>");
> >> +MODULE_DESCRIPTION("remote processor messaging tty driver");
> >> +MODULE_LICENSE("GPL v2");
> >> -- 
> >> 2.17.1
> >>
