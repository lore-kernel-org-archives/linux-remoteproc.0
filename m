Return-Path: <SRS0=BBTQ=BH=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EFBC433EA
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Jul 2020 09:51:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB91520838
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Jul 2020 09:51:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YsahpB3m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbgG1JvX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 28 Jul 2020 05:51:23 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22660 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728253AbgG1JvX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Jul 2020 05:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595929880;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OveMERudfC/DsVOiFA6eo5mZN4jRZPPsfEDSjV0fciw=;
        b=YsahpB3m4aYG6Up0B0fAMuruY99err3CgvZWuN/+7oM+UJCluaOZpRmR1F/4nch85GYrOC
        id1uwmE5qf89EiHN9JHe9QaJpwv+ACjSfVdoq9JrO0OkMnnwNa8mSPGmP1H89gwbKrz+5P
        oPtE91q35ROcdRUgnxx4ow55POebNxg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-ZtHIxWe-M_-58v0iaS0EUQ-1; Tue, 28 Jul 2020 05:51:17 -0400
X-MC-Unique: ZtHIxWe-M_-58v0iaS0EUQ-1
Received: by mail-wm1-f71.google.com with SMTP id f74so8684106wmf.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2020 02:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OveMERudfC/DsVOiFA6eo5mZN4jRZPPsfEDSjV0fciw=;
        b=RGWbW62PM2UbDAj22W+LpGMH5BJCxRrJs/BNd8/UvpLSe3a3+WVFwDkwz/IRn1S6mU
         p3rh+X+IbJJBUW48VF4FDvkDDvw7SbZMk0VU24do35j8amj4nKii9vop/EnaqmvpRBX8
         1qBtrOaPneZSmI5Cs00iKAcKIB/7zxB6T9KIWsZad9FIiq4bUf4DCQgzZWGlkPwjx4km
         SbaNxgKSBo+N2ruOTDR4wACTqA31o0yYp1Y+0PfZUhT/sCXEqGrc9GL4h47R46MkD1G7
         zWwGBxLXkRGgHnXV8j0R/P+iQfMHuw8l0aczjfgut+zdXw10PHKUuLOeMpdze8FzvjjA
         uR4g==
X-Gm-Message-State: AOAM530D9DbWHLJzvinFFB/vziAeUWXtt9c08R73f8sXZ/XVPPKnmhqJ
        ATowqOUp3x8C2gB7gOk2f/s/v+X5khcoJmMLFGi3EHtusdUY87BT1Tuv2F6Vf9DOrINyuLfL2Lw
        B8S/bg9dx2zxr4AdHk5nCshC7IUJbIA==
X-Received: by 2002:adf:ec04:: with SMTP id x4mr22924963wrn.28.1595929875974;
        Tue, 28 Jul 2020 02:51:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/Zec2blatTrV17YGbcqxMectgW1eVyjj6KqAjDfXou1lHapr+dyY5J3ibfX3fDgrZpt7dDQ==
X-Received: by 2002:adf:ec04:: with SMTP id x4mr22924939wrn.28.1595929875703;
        Tue, 28 Jul 2020 02:51:15 -0700 (PDT)
Received: from redhat.com (bzq-79-177-50-205.red.bezeqint.net. [79.177.50.205])
        by smtp.gmail.com with ESMTPSA id t13sm15713599wru.65.2020.07.28.02.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 02:51:14 -0700 (PDT)
Date:   Tue, 28 Jul 2020 05:51:11 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH RESEND v4] rpmsg: virtio: add endianness conversions
Message-ID: <20200728053528-mutt-send-email-mst@kernel.org>
References: <20200701055912-mutt-send-email-mst@kernel.org>
 <20200706124716.GA5457@ubuntu>
 <20200706125657.GB5457@ubuntu>
 <20200706133835.GC5457@ubuntu>
 <c5a4b0c7-859e-24ad-cf1e-3f80a2f15f38@st.com>
 <20200707153436.GA5970@ubuntu>
 <CANLsYkwuPsm+5uCWc91NLF4oxANvxVvgQ9NcRnoPAoVRGk+H5w@mail.gmail.com>
 <20200721085638.GA3815@ubuntu>
 <20200727120522-mutt-send-email-mst@kernel.org>
 <CANLsYkywLjN9QgUB5-b4nppJTV6mx4u+QDLogE8JuM=p5qhGEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkywLjN9QgUB5-b4nppJTV6mx4u+QDLogE8JuM=p5qhGEw@mail.gmail.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jul 27, 2020 at 10:09:43AM -0600, Mathieu Poirier wrote:
> On Mon, 27 Jul 2020 at 10:07, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Jul 21, 2020 at 10:56:38AM +0200, Guennadi Liakhovetski wrote:
> > > According to the VirtIO 1.0 spec data, sent over virtual queues must
> > > be in little-endian format. Update the RPMsg VirtIO implementation
> > > to enforce that but let legacy configurations continue use native
> > > endianness.
> > >
> > > Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> > > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Pls feel free to merge.


> > > ---
> > >
> > > Ping: 2 weeks since the original submission. Also added back the updated
> > > "reviewed-by" tag.
> > >
> > > v4: fix a left-over use of an LE value in calculation - thanks to Arnaud for
> > > catching!
> > >
> > > v3: use the virtio_byteorder.h header
> > >
> > > v2: Following suggestions from Michael and Mathieu switch to using virtio16/32
> > > types and conversion functions.
> > >
> > >  drivers/rpmsg/virtio_rpmsg_bus.c | 63 +++++++++++++++++---------------
> > >  1 file changed, 34 insertions(+), 29 deletions(-)
> > >
> > > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > index 07d4f3374098..9006fc7f73d0 100644
> > > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > @@ -23,6 +23,7 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/sched.h>
> > >  #include <linux/virtio.h>
> > > +#include <linux/virtio_byteorder.h>
> > >  #include <linux/virtio_ids.h>
> > >  #include <linux/virtio_config.h>
> > >  #include <linux/wait.h>
> > > @@ -84,11 +85,11 @@ struct virtproc_info {
> > >   * Every message sent(/received) on the rpmsg bus begins with this header.
> > >   */
> > >  struct rpmsg_hdr {
> > > -     u32 src;
> > > -     u32 dst;
> > > -     u32 reserved;
> > > -     u16 len;
> > > -     u16 flags;
> > > +     __virtio32 src;
> > > +     __virtio32 dst;
> > > +     __virtio32 reserved;
> > > +     __virtio16 len;
> > > +     __virtio16 flags;
> > >       u8 data[];
> > >  } __packed;
> > >
> > > @@ -106,8 +107,8 @@ struct rpmsg_hdr {
> > >   */
> > >  struct rpmsg_ns_msg {
> > >       char name[RPMSG_NAME_SIZE];
> > > -     u32 addr;
> > > -     u32 flags;
> > > +     __virtio32 addr;
> > > +     __virtio32 flags;
> > >  } __packed;
> > >
> > >  /**
> > > @@ -335,8 +336,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
> > >               struct rpmsg_ns_msg nsm;
> > >
> > >               strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> > > -             nsm.addr = rpdev->ept->addr;
> > > -             nsm.flags = RPMSG_NS_CREATE;
> > > +             nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> > > +             nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_CREATE);
> > >
> > >               err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
> > >               if (err)
> > > @@ -359,8 +360,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
> > >               struct rpmsg_ns_msg nsm;
> > >
> > >               strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> > > -             nsm.addr = rpdev->ept->addr;
> > > -             nsm.flags = RPMSG_NS_DESTROY;
> > > +             nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> > > +             nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_DESTROY);
> > >
> > >               err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
> > >               if (err)
> > > @@ -612,18 +613,18 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> > >               }
> > >       }
> > >
> > > -     msg->len = len;
> > > +     msg->len = cpu_to_virtio16(vrp->vdev, len);
> > >       msg->flags = 0;
> > > -     msg->src = src;
> > > -     msg->dst = dst;
> > > +     msg->src = cpu_to_virtio32(vrp->vdev, src);
> > > +     msg->dst = cpu_to_virtio32(vrp->vdev, dst);
> > >       msg->reserved = 0;
> > >       memcpy(msg->data, data, len);
> > >
> > >       dev_dbg(dev, "TX From 0x%x, To 0x%x, Len %d, Flags %d, Reserved %d\n",
> > > -             msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
> > > +             src, dst, len, msg->flags, msg->reserved);
> > >  #if defined(CONFIG_DYNAMIC_DEBUG)
> > >       dynamic_hex_dump("rpmsg_virtio TX: ", DUMP_PREFIX_NONE, 16, 1,
> > > -                      msg, sizeof(*msg) + msg->len, true);
> > > +                      msg, sizeof(*msg) + len, true);
> > >  #endif
> > >
> > >       rpmsg_sg_init(&sg, msg, sizeof(*msg) + len);
> > > @@ -704,13 +705,17 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> > >  {
> > >       struct rpmsg_endpoint *ept;
> > >       struct scatterlist sg;
> > > +     unsigned int msg_len = virtio16_to_cpu(vrp->vdev, msg->len);
> > >       int err;
> > >
> > >       dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
> > > -             msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
> > > +             virtio32_to_cpu(vrp->vdev, msg->src),
> > > +             virtio32_to_cpu(vrp->vdev, msg->dst), msg_len,
> > > +             virtio16_to_cpu(vrp->vdev, msg->flags),
> > > +             virtio32_to_cpu(vrp->vdev, msg->reserved));
> > >  #if defined(CONFIG_DYNAMIC_DEBUG)
> > >       dynamic_hex_dump("rpmsg_virtio RX: ", DUMP_PREFIX_NONE, 16, 1,
> > > -                      msg, sizeof(*msg) + msg->len, true);
> > > +                      msg, sizeof(*msg) + msg_len, true);
> > >  #endif
> > >
> > >       /*
> > > @@ -718,15 +723,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> > >        * the reported payload length.
> > >        */
> > >       if (len > vrp->buf_size ||
> > > -         msg->len > (len - sizeof(struct rpmsg_hdr))) {
> > > -             dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg->len);
> > > +         msg_len > (len - sizeof(struct rpmsg_hdr))) {
> > > +             dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
> > >               return -EINVAL;
> > >       }
> > >
> > >       /* use the dst addr to fetch the callback of the appropriate user */
> > >       mutex_lock(&vrp->endpoints_lock);
> > >
> > > -     ept = idr_find(&vrp->endpoints, msg->dst);
> > > +     ept = idr_find(&vrp->endpoints, virtio32_to_cpu(vrp->vdev, msg->dst));
> > >
> > >       /* let's make sure no one deallocates ept while we use it */
> > >       if (ept)
> > > @@ -739,8 +744,8 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> > >               mutex_lock(&ept->cb_lock);
> > >
> > >               if (ept->cb)
> > > -                     ept->cb(ept->rpdev, msg->data, msg->len, ept->priv,
> > > -                             msg->src);
> > > +                     ept->cb(ept->rpdev, msg->data, msg_len, ept->priv,
> > > +                             virtio32_to_cpu(vrp->vdev, msg->src));
> > >
> > >               mutex_unlock(&ept->cb_lock);
> > >
> > > @@ -846,15 +851,15 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
> > >       /* don't trust the remote processor for null terminating the name */
> > >       msg->name[RPMSG_NAME_SIZE - 1] = '\0';
> > >
> > > -     dev_info(dev, "%sing channel %s addr 0x%x\n",
> > > -              msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
> > > -              msg->name, msg->addr);
> > > -
> > >       strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
> > >       chinfo.src = RPMSG_ADDR_ANY;
> > > -     chinfo.dst = msg->addr;
> > > +     chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
> > > +
> > > +     dev_info(dev, "%sing channel %s addr 0x%x\n",
> > > +              virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
> > > +              "destroy" : "creat", msg->name, chinfo.dst);
> > >
> > > -     if (msg->flags & RPMSG_NS_DESTROY) {
> > > +     if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
> > >               ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
> > >               if (ret)
> > >                       dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
> >
> >
> > Question: are all these calls taking place *after* feature negotiation
> > happened? Because virtio32_to_cpu will not DTRT before ...
> 
> After
> 
> >
> > > --
> > > 2.27.0
> >

