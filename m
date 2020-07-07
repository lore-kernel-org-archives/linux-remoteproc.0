Return-Path: <SRS0=mmP+=AS=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D61C433DF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 15:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0A36206F6
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 15:38:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u+ugvFEM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbgGGPiu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Jul 2020 11:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728679AbgGGPit (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 11:38:49 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F344C08C5DC
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2020 08:38:49 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id q8so43638650iow.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2020 08:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5fEDBMwc0HB1c8FPY3+ZUfc1CQV+lOrjisa/rFwGDBI=;
        b=u+ugvFEMJizqxcCs0XVDHM6JBCvXNAD9L4938V08TsWLv8X5BjCH5oWzGMmea9Ilw8
         UgzW0QfonjLCpsGy3eRJogQEKmgPMz+fo55UuPGBOq8fLJyyg9kVxtxGppFLQvl2PAKV
         gAPdkkEHoqVtxHxIbOJYc2wfTPlxv+DqGbN9+wU3Q8nO7jjc8M2D8wpkPZC6f+0C6DK0
         OAkUUXYsD014YPHkgtVXJhYXEaRh+Nno/vJwaCnBSp9637EJHQnN0c3vYO3C1hvhXuwb
         GUbhmiiU0CsbMPmW8+O2ukFfi3hlvwaMxnepfokJuvRNp46+274RW6JwaiDDeEbnH5uL
         ba8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5fEDBMwc0HB1c8FPY3+ZUfc1CQV+lOrjisa/rFwGDBI=;
        b=M5uYVZJzbiDEI08/xpMANmDpUN3yqq3pBzDieVg7BG9gaFoUgaEtKuNp0iX3bAqRmu
         LZ7AP3y2yBSnYP1YeG9I/3ehfDhjFws2Y/aZAM+ReUcA3DCIQgajTFa+LldnDjUfbhCw
         wpT2hzxKYshEpTbSpGuL4p7GWUy42a7xpJMN9D4LhGGMBjDURF9Lhu2TCQVvwFVLvzRt
         nXWJV5kiUQ7dzGb3cPhm/9FoROK7BNQcZj3kpmGG+U3DC6IAssOmhds3yY5tTcTSGnnL
         +STfiAuKxefCcXcWb1DflgLwsb+zcg0knHJF5nR2xVDguOtvZfNbAqzMJAoXwGEHi76c
         Dn0A==
X-Gm-Message-State: AOAM532eQlvzzEEdieeuAhzzX3sFxf40IW+69IXaS8fIsXAWF5FCnlLt
        ZDWYzzTX+f10+JYybEI8znUwjN1ma/vKM/+gkvk2y/Lj
X-Google-Smtp-Source: ABdhPJwyPlwafWRY9y10vWrjWQ45ktyNuSaOHpOvrMcQnYcYQFodrVjDahhROFy2xJxr7zWFv8mQ4hU6Z8O8phmN+1E=
X-Received: by 2002:a02:a78f:: with SMTP id e15mr38790574jaj.36.1594136328402;
 Tue, 07 Jul 2020 08:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200608123932.GF10562@ubuntu> <20200615204707.GA231755@xps15>
 <20200616061456.GA2999@ubuntu> <20200616073011.GB2999@ubuntu>
 <20200630175057.GA3831001@xps15> <20200701055912-mutt-send-email-mst@kernel.org>
 <20200706124716.GA5457@ubuntu> <20200706125657.GB5457@ubuntu>
 <20200706133835.GC5457@ubuntu> <c5a4b0c7-859e-24ad-cf1e-3f80a2f15f38@st.com> <20200707153436.GA5970@ubuntu>
In-Reply-To: <20200707153436.GA5970@ubuntu>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 7 Jul 2020 09:38:37 -0600
Message-ID: <CANLsYkwuPsm+5uCWc91NLF4oxANvxVvgQ9NcRnoPAoVRGk+H5w@mail.gmail.com>
Subject: Re: [PATCH v4] rpmsg: virtio: add endianness conversions
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 7 Jul 2020 at 09:34, Guennadi Liakhovetski
<guennadi.liakhovetski@linux.intel.com> wrote:
>
> According to the VirtIO 1.0 spec data, sent over virtual queues must
> be in little-endian format. Update the RPMsg VirtIO implementation
> to enforce that but let legacy configurations continue use native
> endianness.
>
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>
> Mathieu, I had to remove your "Reviewed-by" because this is a modified version...
>
> v4: fix a left-over use of an LE value in calculation - thanks to Arnaud for catching!

It is indeed a good catch

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>
> v3: use the virtio_byteorder.h header
>
> v2: Following suggestions from Michael and Mathieu switch to using virtio16/32
> types and conversion functions.
>
>  drivers/rpmsg/virtio_rpmsg_bus.c | 63 +++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 07d4f3374098..9006fc7f73d0 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -23,6 +23,7 @@
>  #include <linux/slab.h>
>  #include <linux/sched.h>
>  #include <linux/virtio.h>
> +#include <linux/virtio_byteorder.h>
>  #include <linux/virtio_ids.h>
>  #include <linux/virtio_config.h>
>  #include <linux/wait.h>
> @@ -84,11 +85,11 @@ struct virtproc_info {
>   * Every message sent(/received) on the rpmsg bus begins with this header.
>   */
>  struct rpmsg_hdr {
> -       u32 src;
> -       u32 dst;
> -       u32 reserved;
> -       u16 len;
> -       u16 flags;
> +       __virtio32 src;
> +       __virtio32 dst;
> +       __virtio32 reserved;
> +       __virtio16 len;
> +       __virtio16 flags;
>         u8 data[];
>  } __packed;
>
> @@ -106,8 +107,8 @@ struct rpmsg_hdr {
>   */
>  struct rpmsg_ns_msg {
>         char name[RPMSG_NAME_SIZE];
> -       u32 addr;
> -       u32 flags;
> +       __virtio32 addr;
> +       __virtio32 flags;
>  } __packed;
>
>  /**
> @@ -335,8 +336,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
>                 struct rpmsg_ns_msg nsm;
>
>                 strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -               nsm.addr = rpdev->ept->addr;
> -               nsm.flags = RPMSG_NS_CREATE;
> +               nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> +               nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_CREATE);
>
>                 err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
>                 if (err)
> @@ -359,8 +360,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
>                 struct rpmsg_ns_msg nsm;
>
>                 strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -               nsm.addr = rpdev->ept->addr;
> -               nsm.flags = RPMSG_NS_DESTROY;
> +               nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
> +               nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_DESTROY);
>
>                 err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
>                 if (err)
> @@ -612,18 +613,18 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>                 }
>         }
>
> -       msg->len = len;
> +       msg->len = cpu_to_virtio16(vrp->vdev, len);
>         msg->flags = 0;
> -       msg->src = src;
> -       msg->dst = dst;
> +       msg->src = cpu_to_virtio32(vrp->vdev, src);
> +       msg->dst = cpu_to_virtio32(vrp->vdev, dst);
>         msg->reserved = 0;
>         memcpy(msg->data, data, len);
>
>         dev_dbg(dev, "TX From 0x%x, To 0x%x, Len %d, Flags %d, Reserved %d\n",
> -               msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
> +               src, dst, len, msg->flags, msg->reserved);
>  #if defined(CONFIG_DYNAMIC_DEBUG)
>         dynamic_hex_dump("rpmsg_virtio TX: ", DUMP_PREFIX_NONE, 16, 1,
> -                        msg, sizeof(*msg) + msg->len, true);
> +                        msg, sizeof(*msg) + len, true);
>  #endif
>
>         rpmsg_sg_init(&sg, msg, sizeof(*msg) + len);
> @@ -704,13 +705,17 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  {
>         struct rpmsg_endpoint *ept;
>         struct scatterlist sg;
> +       unsigned int msg_len = virtio16_to_cpu(vrp->vdev, msg->len);
>         int err;
>
>         dev_dbg(dev, "From: 0x%x, To: 0x%x, Len: %d, Flags: %d, Reserved: %d\n",
> -               msg->src, msg->dst, msg->len, msg->flags, msg->reserved);
> +               virtio32_to_cpu(vrp->vdev, msg->src),
> +               virtio32_to_cpu(vrp->vdev, msg->dst), msg_len,
> +               virtio16_to_cpu(vrp->vdev, msg->flags),
> +               virtio32_to_cpu(vrp->vdev, msg->reserved));
>  #if defined(CONFIG_DYNAMIC_DEBUG)
>         dynamic_hex_dump("rpmsg_virtio RX: ", DUMP_PREFIX_NONE, 16, 1,
> -                        msg, sizeof(*msg) + msg->len, true);
> +                        msg, sizeof(*msg) + msg_len, true);
>  #endif
>
>         /*
> @@ -718,15 +723,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>          * the reported payload length.
>          */
>         if (len > vrp->buf_size ||
> -           msg->len > (len - sizeof(struct rpmsg_hdr))) {
> -               dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg->len);
> +           msg_len > (len - sizeof(struct rpmsg_hdr))) {
> +               dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>                 return -EINVAL;
>         }
>
>         /* use the dst addr to fetch the callback of the appropriate user */
>         mutex_lock(&vrp->endpoints_lock);
>
> -       ept = idr_find(&vrp->endpoints, msg->dst);
> +       ept = idr_find(&vrp->endpoints, virtio32_to_cpu(vrp->vdev, msg->dst));
>
>         /* let's make sure no one deallocates ept while we use it */
>         if (ept)
> @@ -739,8 +744,8 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>                 mutex_lock(&ept->cb_lock);
>
>                 if (ept->cb)
> -                       ept->cb(ept->rpdev, msg->data, msg->len, ept->priv,
> -                               msg->src);
> +                       ept->cb(ept->rpdev, msg->data, msg_len, ept->priv,
> +                               virtio32_to_cpu(vrp->vdev, msg->src));
>
>                 mutex_unlock(&ept->cb_lock);
>
> @@ -846,15 +851,15 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>         /* don't trust the remote processor for null terminating the name */
>         msg->name[RPMSG_NAME_SIZE - 1] = '\0';
>
> -       dev_info(dev, "%sing channel %s addr 0x%x\n",
> -                msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
> -                msg->name, msg->addr);
> -
>         strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
>         chinfo.src = RPMSG_ADDR_ANY;
> -       chinfo.dst = msg->addr;
> +       chinfo.dst = virtio32_to_cpu(vrp->vdev, msg->addr);
> +
> +       dev_info(dev, "%sing channel %s addr 0x%x\n",
> +                virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY ?
> +                "destroy" : "creat", msg->name, chinfo.dst);
>
> -       if (msg->flags & RPMSG_NS_DESTROY) {
> +       if (virtio32_to_cpu(vrp->vdev, msg->flags) & RPMSG_NS_DESTROY) {
>                 ret = rpmsg_unregister_device(&vrp->vdev->dev, &chinfo);
>                 if (ret)
>                         dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
> --
> 2.27.0
>
