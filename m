Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2324C388F7
	for <linux-remoteproc@archiver.kernel.org>; Wed, 11 Nov 2020 00:37:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 497BF21D40
	for <linux-remoteproc@archiver.kernel.org>; Wed, 11 Nov 2020 00:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WAmonG57"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732023AbgKKAh3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 10 Nov 2020 19:37:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730254AbgKKAh1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Nov 2020 19:37:27 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BE8C0613D1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Nov 2020 16:37:26 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id z2so360167ilh.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Nov 2020 16:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9iy7f0K89wvY61xKmADKMAdTIaj5AolN85aHW3dzEQ0=;
        b=WAmonG57eEEogd9ge0lVhqoC3kpwLm5gsx98kTMokeKy+3w6m5LJ21oiQnjMJDLrvP
         F3Z5+QkDQKeFGPvnPsVl+43bFzLWzSPnfrhnZULhd/3OvbhxNZytNNUaMyTXbk+FGxbD
         R3IPemLYcEiLmphBOF7Y05o8OPYL3MRUgfFJxeR3eQpPcRZSR02ITTcpGLKxn4bsS1JT
         2h4Cx6ypOJzAaFNOLv9RDEBuuc6ObpxtkCdNMQeg/epwaoM3h86OBLDOJONbdMnXrKzT
         8QGXWisguwM9uxUL8VX+zO7hLt63194TYyCL7PJSYuTknoDOw4sFjLUbKIUlpWt46Qiv
         z7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9iy7f0K89wvY61xKmADKMAdTIaj5AolN85aHW3dzEQ0=;
        b=tBs79Ww4T81EypsU+0wg0gjOwWoa1R/pkvsfMZm8nxPXCJeUVvAKxK37Q5p07K5242
         2qpfs8WnrdhPWRTaJHNV3c14WFpniUPskJZthBuuqTT0GP/ADxJq7dFCr0Aqh79z+cu7
         NLd7OAU6jki35yelZPRjxh/FWVK2Jn/OSwoHQKTUCYwd8CwRa4v6saLJJQq2XmD6jBfU
         xMWCkicW3aFETW7rvvKhRCp9DtxljWRYn/Tgxbv3195qDUQ59pW/K5R1OCV5s6Tya5dD
         XtrynJhd1nIhLtofBriL1Jfp4CTG/vMJjumdCIg4tMKjY3SOcr1Erkik3ME1Zcs+L0+4
         FZKw==
X-Gm-Message-State: AOAM531jtvi66DCrubsgKa7Lf95lR2cEadIgcddhgxWlBUsqKlWHqPec
        zi/r8v4ExyTz9XDP+utCu7qhU7qKg4uuIC1mlcRQXQ==
X-Google-Smtp-Source: ABdhPJy0WnzJJOilFG2bPenW5EiNXtQC/lhWngG8uEqcY53W8A7XXMZsasIrdtznD4YL1W7lOuvvuXcM6fW73PFJajE=
X-Received: by 2002:a92:6403:: with SMTP id y3mr16376748ilb.72.1605055045850;
 Tue, 10 Nov 2020 16:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
 <20201105225028.3058818-9-mathieu.poirier@linaro.org> <20201106131545.GA10889@ubuntu>
 <20201106140028.GB10889@ubuntu> <20201106175332.GB3203364@xps15>
 <e7dedfb6-1e9c-4246-9db1-e14a2e16c68c@st.com> <20201109102023.GA17692@ubuntu>
 <20201109175536.GD3395222@xps15> <eb7f6707-4483-3e1a-1e39-7f32fbf437e0@st.com>
In-Reply-To: <eb7f6707-4483-3e1a-1e39-7f32fbf437e0@st.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 10 Nov 2020 17:37:14 -0700
Message-ID: <CANLsYkyVMnmBY6WJGRem7WOep8eSSS57BmsqmttSYDZExTp=pg@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 10 Nov 2020 at 11:18, Arnaud POULIQUEN <arnaud.pouliquen@st.com> wrote:
>
> Hi Mathieu, Guennadi,
>
> On 11/9/20 6:55 PM, Mathieu Poirier wrote:
> > On Mon, Nov 09, 2020 at 11:20:24AM +0100, Guennadi Liakhovetski wrote:
> >> Hi Arnaud,
> >>
> >> On Mon, Nov 09, 2020 at 09:48:37AM +0100, Arnaud POULIQUEN wrote:
> >>> Hi Guennadi, Mathieu,
> >>>
> >>> On 11/6/20 6:53 PM, Mathieu Poirier wrote:
> >>>> On Fri, Nov 06, 2020 at 03:00:28PM +0100, Guennadi Liakhovetski wrote:
> >>>>> On Fri, Nov 06, 2020 at 02:15:45PM +0100, Guennadi Liakhovetski wrote:
> >>>>>> Hi Mathieu, Arnaud,
> >>>>>>
> >>>>>> On Thu, Nov 05, 2020 at 03:50:28PM -0700, Mathieu Poirier wrote:
> >>>>>>> From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> >>>>>>>
> >>>>>>> Make the RPMSG name service announcement a stand alone driver so that it
> >>>>>>> can be reused by other subsystems.  It is also the first step in making the
> >>>>>>> functionatlity transport independent, i.e that is not tied to virtIO.
> >>>>>>
> >>>>>> Sorry, I just realised that my testing was incomplete. I haven't tested
> >>>>>> automatic module loading and indeed it doesn't work. If rpmsg_ns is loaded
> >>>>>> it probes and it's working, but if it isn't loaded and instead the rpmsg
> >>>>>> bus driver is probed (e.g. virtio_rpmsg_bus), calling
> >>>>>> rpmsg_ns_register_device() to create a new rpmsg_ns device doesn't cause
> >>>>>> rpmsg_ns to be loaded.
> >>>>>
> >>>>> A simple fix for that is using MODULE_ALIAS("rpmsg:rpmsg_ns"); in rpmsg_ns.c
> >>>>> but that alone doesn't fix the problem completely - the module does load then
> >>>>> but not quickly enough, the NS announcement from the host / remote arrives
> >>>>> before rpmsg_ns has properly registered. I think the best solution would be
> >>>>> to link rpmsg_ns.c together with rpmsg_core.c. You'll probably want to keep
> >>>>> the module name, so you could rename them to just core.c and ns.c.
> >>>>
> >>>> I'm pretty sure it is because virtio_device_ready() in rpmsg_probe() is called
> >>>> before the kernel has finished loading the name space driver.  There has to be
> >>>> a way to prevent that from happening - I will investigate further.
> >>>
> >>> Right, no dependency is set so the rpmsg_ns driver is never probed...
> >>> And  name service announcement messages are dropped if the service is not present.
> >>
> >> The mentioned change
> >>
> >> -MODULE_ALIAS("rpmsg_ns");
> >> +MODULE_ALIAS("rpmsg:rpmsg_ns");
> >
> > Yes, I'm good with that part.
> >
> >>
> >> is actually a compulsory fix, without it the driver doesn't even get loaded when
> >> a device id registered, using rpmsg_ns_register_device(). So this has to be done
> >> as a minimum *if* we keep RPNsg NS as a separate kernel module. However, that
> >> still doesn't fix the problem relyably because of timing. I've merged both the
> >> RPMsg core and NS into a single module, which fixed the issue for me. I'm
> >> appending a patch to this email, but since it's a "fixup" please, feel free to
> >> roll it into the original work. But thinking about it, even linking modules
> >> together doesn't guarantee the order. I think rpmsg_ns_register_device() should
> >> actually actively wait for NS device probing to finish - successfully or not.
> >> I can add a complete() / wait_for_completion() pair to the process if you like.
> >>
> >
> > Working with a completion is the kind of thing I had in mind.  But I would still
> > like to keep the drivers separate and that's the part I need to think about.
>
> I reproduce the problem: the rpmsg_ns might not be probed on first message reception.
> What makes the fix not simple is that the virtio forces the virtio status to ready
> after the probe of the virtio unit [1].
> Set this status tiggs the remote processor first messages.
>
> [1]https://elixir.bootlin.com/linux/latest/source/drivers/virtio/virtio.c#L253
>
> Guennadi: I'm not sure that your patch will solve the problem , look like it just reduces the
> delay between the rpmsg_virtio and the rpmsg_ns probe (the module loading time is saved)
>
> Based on my observations, I can see two alternatives.
> - rpmsg_ns.c is no longer an rpmsg driver but a kind of function library to manage a generic name service.

That option joins Guennadi's vision - I think he just expressed it in
a different way.  The more I think about it, the more I find that
option appealing.  With the code separation already achieved in this
patchset it wouldn't be hard to implement.

> - we implement a completion as proposed by Mathieu.
>
> I tried this second solution based on the component bind mechanism.
> I added the patch at the end of the mail (the patch is a POC, so not ready for upstream).
> Maybe something simpler is possible. I'm just keeping in mind that we may have to add similar
> services in the future.
>

Wasn't familiar with the "component" infrastructure - I suppose you
stumbled on it while working on sound drivers.  I have to spend more
time looking at it.  But if you have time and want to spin off a new
revision that implements the library concept, I'll invest time on that
instead.

> Regards,
> Arnaud
>
> From f2de77027f4a3836f8bf46aa257e5592af6529b7 Mon Sep 17 00:00:00 2001
> From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> Date: Tue, 10 Nov 2020 18:39:29 +0100
> Subject: [PATCH] rpmsg_ns: add synchronization based on component mechanism
>
> Implement the component bind mechanism to ensure that the rpmsg virtio bus
> driver are probed before treating the first RPMsg.
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  drivers/rpmsg/rpmsg_ns.c         | 26 ++++++++++++-
>  drivers/rpmsg/virtio_rpmsg_bus.c | 65 ++++++++++++++++++++++++++++++++
>  2 files changed, 89 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
> index 5bda7cb44618..057e5d1d29a0 100644
> --- a/drivers/rpmsg/rpmsg_ns.c
> +++ b/drivers/rpmsg/rpmsg_ns.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
>   */
> +#include <linux/component.h>
>  #include <linux/device.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -55,6 +56,24 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>         return 0;
>  }
>
> +static int rpmsg_ns_bind(struct device *dev, struct device *master, void *data)
> +{
> +       dev_info(dev, "rpmsg ns bound\n");
> +
> +       return 0;
> +}
> +
> +static void rpmsg_ns_unbind(struct device *dev, struct device *master,
> +                           void *data)
> +{
> +       dev_info(dev, "rpmsg ns unbound\n");
> +}
> +
> +static const struct component_ops rpmsg_ns_ops = {
> +       .bind = rpmsg_ns_bind,
> +       .unbind = rpmsg_ns_unbind,
> +};
> +
>  static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
>  {
>         struct rpmsg_endpoint *ns_ept;
> @@ -63,6 +82,7 @@ static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
>                 .dst = RPMSG_NS_ADDR,
>                 .name = "name_service",
>         };
> +       int ret;
>
>         /*
>          * Create the NS announcement service endpoint associated to the RPMsg
> @@ -76,7 +96,9 @@ static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
>         }
>         rpdev->ept = ns_ept;
>
> -       return 0;
> +       ret = component_add(&rpdev->dev, &rpmsg_ns_ops);
> +
> +       return ret;
>  }
>
>  static struct rpmsg_driver rpmsg_ns_driver = {
> @@ -104,5 +126,5 @@ module_exit(rpmsg_ns_exit);
>
>  MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
>  MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
> -MODULE_ALIAS("rpmsg_ns");
> +MODULE_ALIAS("rpmsg:rpmsg_ns");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 30ef4a5de4ed..c28aac1295fa 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -11,6 +11,7 @@
>
>  #define pr_fmt(fmt) "%s: " fmt, __func__
>
> +#include <linux/component.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/idr.h>
>  #include <linux/jiffies.h>
> @@ -67,11 +68,16 @@ struct virtproc_info {
>         struct mutex endpoints_lock;
>         wait_queue_head_t sendq;
>         atomic_t sleepers;
> +       struct component_match *match;
> +       struct completion completed;
> +       int bind_status;
>  };
>
>  /* The feature bitmap for virtio rpmsg */
>  #define VIRTIO_RPMSG_F_NS      0 /* RP supports name service notifications */
>
> +#define BIND_TIMEOUT_MS 1000
> +
>  /**
>   * struct rpmsg_hdr - common header for all rpmsg messages
>   * @src: source address
> @@ -768,6 +774,17 @@ static void rpmsg_recv_done(struct virtqueue *rvq)
>         unsigned int len, msgs_received = 0;
>         int err;
>
> +       /* Wait for all children to be bound */
> +       if (vrp->bind_status) {
> +               dev_dbg(dev, "cwait bind\n");
> +               if (!wait_for_completion_timeout(&vrp->completed,
> +                                       msecs_to_jiffies(BIND_TIMEOUT_MS)))
> +                       dev_err(dev, "child device(s) binding timeout\n");
> +
> +               if (vrp->bind_status)
> +                       dev_err(dev, "failed to bind RPMsg sub device(s)\n");
> +       }
> +
>         msg = virtqueue_get_buf(rvq, &len);
>         if (!msg) {
>                 dev_err(dev, "uhm, incoming signal, but no used buffer ?\n");
> @@ -808,6 +825,39 @@ static void rpmsg_xmit_done(struct virtqueue *svq)
>         wake_up_interruptible(&vrp->sendq);
>  }
>
> +static int virtio_rpmsg_compare(struct device *dev, void *data)
> +{
> +       return dev == data;
> +}
> +
> +static void virtio_rpmsg_unbind(struct device *dev)
> +{
> +       /* undbind all child components */
> +       component_unbind_all(dev, NULL);
> +}
> +
> +static int virtio_rpmsg_bind(struct device *dev)
> +{
> +       struct virtio_device *vdev = dev_to_virtio(dev);
> +       struct virtproc_info *vrp = vdev->priv;
> +
> +       dev_dbg(dev, "Bind virtio rpmsg sub devices\n");
> +
> +       vdev = container_of(dev, struct virtio_device, dev);
> +       vrp->bind_status =  component_bind_all(dev, NULL);
> +       if (vrp->bind_status)
> +               dev_err(dev, "bind virtio rpmsg failed\n");
> +
> +       complete(&vrp->completed);
> +
> +       return vrp->bind_status;
> +}
> +
> +static const struct component_master_ops virtio_rpmsg_cmp_ops = {
> +       .bind = virtio_rpmsg_bind,
> +       .unbind = virtio_rpmsg_unbind,
> +};
> +
>  static int rpmsg_probe(struct virtio_device *vdev)
>  {
>         vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
> @@ -892,6 +942,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>         /* if supported by the remote processor, enable the name service */
>         if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS)) {
>                 vch = kzalloc(sizeof(*vch), GFP_KERNEL);
> +
>                 if (!vch) {
>                         err = -ENOMEM;
>                         goto free_coherent;
> @@ -911,6 +962,20 @@ static int rpmsg_probe(struct virtio_device *vdev)
>                 err = rpmsg_ns_register_device(rpdev_ns);
>                 if (err)
>                         goto free_coherent;
> +               /* register a component associated to the virtio platform */
> +               component_match_add_release(&vdev->dev, &vrp->match,
> +                                           NULL, virtio_rpmsg_compare,
> +                                           &rpdev_ns->dev);
> +
> +               vrp->bind_status = -ENXIO;
> +               init_completion(&vrp->completed);
> +               err = component_master_add_with_match(&vdev->dev,
> +                                                     &virtio_rpmsg_cmp_ops,
> +                                                     vrp->match);
> +               if (err) {
> +                       dev_err(&vdev->dev, "failed to bind virtio rpmsg\n");
> +                       goto free_coherent;
> +               }
>         }
>
>         /*
> --
> 2.17.1
>
>
>
>
