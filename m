Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C8639D3FB
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 16:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779382698; cv=pass; b=moIfRem4KNzBr3aNNZanzZzylvQJ3lfv99MYISoAEV4OnwS4rcXNyVCu2S01NwgvGdKDSh6vLl+yDq/NTR9bV5qOZM2pVu0Y6PeR7ylLtcDiwC8f4vqOJ8hPG8KL459PsN4KfaHB1O+V3LOUkobWDZau21E8Rc0QnfCROhdz+/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779382698; c=relaxed/simple;
	bh=cUJJHNKLH6NqwOalZWTvyrZw6qMOH6ZJe0mzdin71uI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjOP6yq1885Na6lGYi3CbbXLCdM3ExuFCQdbyCQuvL9SjjFwrm/nc+LQvger3nYSAbsB8XTnPaqIBDPRRRbhUEoNuQVbcbXRndLNO2e2IFoW5P5UEEhZ/7p677yki2SmY5jkgKtwk2GFv25DYd/xmwrkjRB+yoapv/UiUuLdlW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PgU6rqHo; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PgU6rqHo"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6804e24803bso13320139a12.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 09:58:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779382692; cv=none;
        d=google.com; s=arc-20240605;
        b=FSs9OzvtVn5lnWM5BfAhJ0ULufkYf2yiuVk3MS8wfW/wa/2ebH1qf7Cd0k2dXBi1Ov
         KkPdstcOanPMUbqINdvKvA2tk1s7f8GReFc34B3kgHS2uP5Vx9X8ElcA+VvKf/7AkF0j
         NAirfwPPreNUGqmI14NMjfqLq8vatn0oA2XT/6etzjayYg8Lje86WbYJjboMskZCnIZ1
         hzIilBR642VrcD1uQUopM4NkV5EsRLF3X9DYb37dYM5HVUsp7gvpS+jI0qDxwHSK3ujp
         r6eUQCv8e3PEKcsXd/Jn6AQ38ONn+f8fTuMpmTA0lnVnfxUP3VnjeBSMGJJuViRkCn6l
         B7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QBYAjcA+sBglTXJhXrBWPZTrXUsQYAZvyreTFn/dgTI=;
        fh=3LCygud6Fz7sCtZCcpzI0VjxCcJPJpxFtiWG/Uh+KZE=;
        b=fMtU1+MuQAii92nCPdgPULC3UD1STh4tsmAAWE76b50Fu+oYGd1XEmLTdwhCfHDfnC
         AG04LvsiAQWtIVBm7sXhrDbCweFowX5DwLH7VHuyLEIgslU1ZxxLwXhxMjs5UksuNzfq
         iilcDNdFtDq3x/XraIi1zbj9dW1BxEgjGkWoIr5NroogsiO6ykg69fr/RVnKt4RSSKxt
         S/ClNU4kYkwsAleyntRujRkIQxV1VXT4xU4NWEHYYx4rjTOy9RKmfb6U70Y6//1kU1/7
         9jz7IaZxfbVtPaweTQx0bVT2+ChaFLfxu0uk906IUsqX2UW39OJ77Gyb1X1RYbxV7DMf
         UH1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779382692; x=1779987492; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QBYAjcA+sBglTXJhXrBWPZTrXUsQYAZvyreTFn/dgTI=;
        b=PgU6rqHoysebdkMlaAtL+vUv9sBpahVxbjC/9IqcvlyEq17pcH8FaJNLoDAWdB/dEM
         YTOGPXvG1lpY2gDHQ8Et5WBu7UB6tFC5N4PCEi7RCXYgr6o/gueNrSbq7OYG//zi9xd3
         Xvs3H3H3UdnwzZijzcVbjJMXx39QcXitJicCsKAnGN8WgdL9Ng6bE7XdphEvnjszhGaG
         0qTlIwlr6r9l2inUZW8mpNKEgip3vXx5Ut3LNoAlwki/khqcH/rbR/GC/VSkIS45IkKP
         8CFuFV04E+lT27jVxv9XM5okhhCK5oMxs+QXO+fFrrVfka8HXibrmRdVc6Rv+O+VaDM4
         kWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779382692; x=1779987492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBYAjcA+sBglTXJhXrBWPZTrXUsQYAZvyreTFn/dgTI=;
        b=WSltbMPek+Gqv/fBQAsD+1UtclQa2UiftGquaITi/1iTiuNrKN8VJIvA0KZfufrB7r
         H7g0Far5PwEi3lMi+FmdNp4qBH0t7QW6a8JO2nqfTM+zNt1ttPjy5y8gIHswFKOzLD+k
         XYkcrR+muMM6jS5xny0I3Q0odSJ54xmHB8biSXOQ6LzsDiTW8antA2620ZzjafPH1iOd
         wbimqsFYN77BzXUnB/qzzM6Y5u7Pe2rA3FESlCtT5W84nuX1YnZJkaw0f2bZH7ZfDkqO
         Q6tCzo8LoSPoKCGj9txq0+hPvolbA/mghZoJhI3FDq5g7mHxD7j01bEw+uMlm/CBo+hN
         uIrA==
X-Forwarded-Encrypted: i=1; AFNElJ/bMjLQ79wmoBiJSbPcrIxPmhDXJN5Dl0AiMVnVAislj8cTEg+6iudMaaq4tLY4ww+hTU8wgrp8x8uiSj/6Cc07@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt1i10gYPjps0zQYscod13qsVn9gMXlLpUlY1vxHGeRvqC8q0B
	1riz3ErbKAwAfVu/mrhEJChVI+XbzAI0xthh0x7bNOYTtblEVRDkf1BNDo9lzpgAsveQ1Jp1Tlb
	ZpAq7tzC5uaI76baADnFq/uzA2K0W+QMYoWfo7yzMnN7S5hlFdAFi
X-Gm-Gg: Acq92OE32Y0gwU3D6Q/WElC+o0VotSQz6XGflsD75Njq3rQOJwu5kQdJT9dWasn+DsS
	ZSl6DYmjyN2B8BQQokrf9Rx1InsY/A5DIJzkUfJ1MtTclSTD//dlTZ9nyjuUl5uJ5tCinXyuV5u
	seA372PWhkaAlw8Vn1OgGM82RTknt9eU1ONjp8eQo58NQpOdAfNkUagVY0n0/oC9ssY79F84jdR
	J/c18kh64h5szlJ02Y1APD7Q6JztgcFYGWWGZ475pXFFykb3bOX1OYBQrAIq/LaUfvmNF3O9rr+
	cRirXN8kDKCxIxG2d6Y7EtrzwDU6MU6iESFKj3NTNA==
X-Received: by 2002:a05:6402:241d:b0:67e:96a8:40d0 with SMTP id
 4fb4d7f45d1cf-68836bce0cdmr1990390a12.21.1779382692355; Thu, 21 May 2026
 09:58:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429161052.528015-1-tanmay.shah@amd.com> <20260429161052.528015-3-tanmay.shah@amd.com>
 <agyfr-pxwQ4oKMAF@p14s> <0ea5801b-c435-4f67-b811-aed696bd64b7@foss.st.com>
 <313c02dd-0a19-48d4-bdaf-c53e2be1131b@amd.com> <e9b697dc-52b8-482a-8d54-da3c4700f049@foss.st.com>
 <649f461a-58ff-4246-8839-e0c852be2931@amd.com>
In-Reply-To: <649f461a-58ff-4246-8839-e0c852be2931@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 21 May 2026 10:58:00 -0600
X-Gm-Features: AVHnY4JAfQNAYclmXHQpLXfTmNWkfHI8TZu44kSbJMzfXpFl_Xw7TFaeFX6G8MA
Message-ID: <CANLsYkyKxaMi1nLGrFviepqQee7W=ULDn+RZ2-h=sTpGBWZ4tg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: tanmay.shah@amd.com
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, andersson@kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 May 2026 at 09:08, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 5/20/2026 10:43 AM, Arnaud POULIQUEN wrote:
> >
> >
> > On 5/20/26 16:55, Shah, Tanmay wrote:
> >>
> >>
> >> On 5/20/2026 2:44 AM, Arnaud POULIQUEN wrote:
> >>>
> >>>
> >>> On 5/19/26 19:36, Mathieu Poirier wrote:
> >>>> On Wed, Apr 29, 2026 at 09:10:52AM -0700, Tanmay Shah wrote:
> >>>>> 512 bytes isn't always suitable for all case, let firmware
> >>>>> maker decide the best value from resource table.
> >>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> >>>>>
> >>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>>>> ---
> >>>>>
> >>>>> Test done:
> >>>>>     - Verify this patch works with the existing firmware
> >>>>>     - Verify this patch works with the firmware that configures
> >>>>>       differt tx & rx buf size
> >>>>>
> >>>>> Changes in v2:
> >>>>>     - %s/sbuf_size/tx_buf_size/
> >>>>>     - %s/rbuf_size/rx_buf_size/
> >>>>>     - fix typo
> >>>>>     - do not use ALIGN on buf size, rely on allocator
> >>>>>     - make err msg more explicit, %s/vdev config:/bad vdev config/
> >>>>>     - fix license and add AMD copyrights in the header virtio_rpmsg.h
> >>>>>     - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
> >>>>>     - use __virtio32 over __u32
> >>>>>     - add version field to virtio rpmsg config structure
> >>>>>     - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
> >>>>>
> >>>>>    drivers/rpmsg/virtio_rpmsg_bus.c   | 70 +++++++++++++++++++++
> >>>>> +--------
> >>>>>    include/linux/rpmsg/virtio_rpmsg.h | 27 ++++++++++++
> >>>>>    2 files changed, 79 insertions(+), 18 deletions(-)
> >>>>>    create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
> >>>>>
> >>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
> >>>>> virtio_rpmsg_bus.c
> >>>>> index e59d8cf9b975..8116d94413cc 100644
> >>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>>> @@ -20,6 +20,7 @@
> >>>>>    #include <linux/rpmsg.h>
> >>>>>    #include <linux/rpmsg/byteorder.h>
> >>>>>    #include <linux/rpmsg/ns.h>
> >>>>> +#include <linux/rpmsg/virtio_rpmsg.h>
> >>>>>    #include <linux/scatterlist.h>
> >>>>>    #include <linux/slab.h>
> >>>>>    #include <linux/sched.h>
> >>>>> @@ -39,7 +40,8 @@
> >>>>>     * @tx_bufs:    kernel address of tx buffers
> >>>>>     * @num_rx_buf:    total number of buffers for rx
> >>>>>     * @num_tx_buf:    total number of buffers for tx
> >>>>> - * @buf_size:    size of one rx or tx buffer
> >>>>> + * @rx_buf_size: size of one rx buffer
> >>>>> + * @tx_buf_size: size of one tx buffer
> >>>>>     * @last_sbuf:    index of last tx buffer used
> >>>>>     * @bufs_dma:    dma base addr of the buffers
> >>>>>     * @tx_lock:    protects svq and tx_bufs, to allow concurrent
> >>>>> senders.
> >>>>> @@ -59,7 +61,8 @@ struct virtproc_info {
> >>>>>        void *rx_bufs, *tx_bufs;
> >>>>>        unsigned int num_rx_buf;
> >>>>>        unsigned int num_tx_buf;
> >>>>> -    unsigned int buf_size;
> >>>>> +    unsigned int rx_buf_size;
> >>>>> +    unsigned int tx_buf_size;
> >>>>>        int last_sbuf;
> >>>>>        dma_addr_t bufs_dma;
> >>>>>        struct mutex tx_lock;
> >>>>> @@ -68,9 +71,6 @@ struct virtproc_info {
> >>>>>        wait_queue_head_t sendq;
> >>>>>    };
> >>>>>    -/* The feature bitmap for virtio rpmsg */
> >>>>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
> >>>>> notifications */
> >>>>> -
> >>>>>    /**
> >>>>>     * struct rpmsg_hdr - common header for all rpmsg messages
> >>>>>     * @src: source address
> >>>>> @@ -128,7 +128,7 @@ struct virtio_rpmsg_channel {
> >>>>>     * processor.
> >>>>>     */
> >>>>>    #define MAX_RPMSG_NUM_BUFS    (256)
> >>>>> -#define MAX_RPMSG_BUF_SIZE    (512)
> >>>>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
> >>>>>      /*
> >>>>>     * Local addresses are dynamically allocated on-demand.
> >>>>> @@ -444,7 +444,7 @@ static void *get_a_tx_buf(struct virtproc_info
> >>>>> *vrp)
> >>>>>          /* either pick the next unused tx buffer */
> >>>>>        if (vrp->last_sbuf < vrp->num_tx_buf)
> >>>>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
> >>>>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_sbuf++;
> >>>>>        /* or recycle a used one */
> >>>>>        else
> >>>>>            ret = virtqueue_get_buf(vrp->svq, &len);
> >>>>> @@ -514,7 +514,7 @@ static int rpmsg_send_offchannel_raw(struct
> >>>>> rpmsg_device *rpdev,
> >>>>>         * messaging), or to improve the buffer allocator, to support
> >>>>>         * variable-length buffer sizes.
> >>>>>         */
> >>>>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
> >>>>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
> >>>>>            dev_err(dev, "message is too big (%d)\n", len);
> >>>>>            return -EMSGSIZE;
> >>>>>        }
> >>>>> @@ -647,7 +647,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
> >>>>> rpmsg_endpoint *ept)
> >>>>>        struct rpmsg_device *rpdev = ept->rpdev;
> >>>>>        struct virtio_rpmsg_channel *vch =
> >>>>> to_virtio_rpmsg_channel(rpdev);
> >>>>>    -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
> >>>>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
> >>>>>    }
> >>>>>      static int rpmsg_recv_single(struct virtproc_info *vrp, struct
> >>>>> device *dev,
> >>>>> @@ -673,7 +673,7 @@ static int rpmsg_recv_single(struct virtproc_info
> >>>>> *vrp, struct device *dev,
> >>>>>         * We currently use fixed-sized buffers, so trivially sanitize
> >>>>>         * the reported payload length.
> >>>>>         */
> >>>>> -    if (len > vrp->buf_size ||
> >>>>> +    if (len > vrp->rx_buf_size ||
> >>>>>            msg_len > (len - sizeof(struct rpmsg_hdr))) {
> >>>>>            dev_warn(dev, "inbound msg too big: (%d, %d)\n", len,
> >>>>> msg_len);
> >>>>>            return -EINVAL;
> >>>>> @@ -706,7 +706,7 @@ static int rpmsg_recv_single(struct virtproc_info
> >>>>> *vrp, struct device *dev,
> >>>>>            dev_warn_ratelimited(dev, "msg received with no
> >>>>> recipient\n");
> >>>>>          /* publish the real size of the buffer */
> >>>>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
> >>>>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
> >>>>>          /* add the buffer back to the remote processor's virtqueue */
> >>>>>        err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
> >>>>> @@ -824,6 +824,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>>>        int err = 0, i;
> >>>>>        size_t total_buf_space;
> >>>>>        bool notify;
> >>>>> +    u16 version;
> >>>>>          vrp = kzalloc_obj(*vrp);
> >>>>>        if (!vrp)
> >>>>> @@ -855,9 +856,41 @@ static int rpmsg_probe(struct virtio_device
> >>>>> *vdev)
> >>>>>        else
> >>>>>            vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
> >>>>>    -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
> >>>>> +    /*
> >>>>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then
> >>>>> configure buf
> >>>>> +     * size from virtio device config space from the resource table.
> >>>>> +     * If the feature is not supported, then assign default buf size.
> >>>>> +     */
> >>>>> +    if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
> >>>>> +        /* note: virtio_rpmsg_config is defined from remote view */
> >>>>> +        version = 0;
> >>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
> >>>>> +                 version, &version);
> >>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
> >>>>> +                 txbuf_size, &vrp->rx_buf_size);
> >>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
> >>>>> +                 rxbuf_size, &vrp->tx_buf_size);
> >>>>> +
> >>>>
> >>>> A check is also needed to make sure the version received from the
> >>>> resource table
> >>>> is '0'.
> >>
> >> I think we should start with versaion = 1. So, can I check the version
> >> number for 1 ?
> >>
> >>>>
> >>>>> +        /* The buffers must hold at least the rpmsg header */
> >>>>> +        if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
> >>>>> +            vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
> >>>>> +            dev_err(&vdev->dev,
> >>>>> +                "bad vdev config: rx buf sz = %d, tx buf sz = %d\n",
> >>>>> +                vrp->rx_buf_size, vrp->tx_buf_size);
> >>>>> +            err = -EINVAL;
> >>>>> +            goto vqs_del;
> >>>>> +        }
> >>>>> +
> >>>>> +        dev_dbg(&vdev->dev,
> >>>>> +            "vdev config: version=%d, rx buf sz = 0x%x, tx buf sz =
> >>>>> 0x%x\n",
> >>>>> +            version, vrp->rx_buf_size, vrp->tx_buf_size);
> >>>>> +    } else {
> >>>>> +        vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> >>>>> +        vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> >>>>> +    }
> >>>>>    -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
> >>>>>> buf_size;
> >>>>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> >>>>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
> >>>>>          /* allocate coherent memory for the buffers */
> >>>>>        bufs_va = dma_alloc_coherent(vdev->dev.parent,
> >>>>> @@ -875,14 +908,14 @@ static int rpmsg_probe(struct virtio_device
> >>>>> *vdev)
> >>>>>        vrp->rx_bufs = bufs_va;
> >>>>>          /* and second part is dedicated for TX */
> >>>>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
> >>>>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
> >>>>>          /* set up the receive buffers */
> >>>>>        for (i = 0; i < vrp->num_rx_buf; i++) {
> >>>>>            struct scatterlist sg;
> >>>>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
> >>>>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
> >>>>>    -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
> >>>>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
> >>>>>              err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
> >>>>>                          GFP_KERNEL);
> >>>>> @@ -965,8 +998,8 @@ static int rpmsg_remove_device(struct device
> >>>>> *dev, void *data)
> >>>>>    static void rpmsg_remove(struct virtio_device *vdev)
> >>>>>    {
> >>>>>        struct virtproc_info *vrp = vdev->priv;
> >>>>> -    unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
> >>>>> -    size_t total_buf_space = num_bufs * vrp->buf_size;
> >>>>> +    size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> >>>>> +                 (vrp->num_tx_buf * vrp->tx_buf_size);
> >>>>>        int ret;
> >>>>>          virtio_reset_device(vdev);
> >>>>> @@ -992,6 +1025,7 @@ static struct virtio_device_id id_table[] = {
> >>>>>      static unsigned int features[] = {
> >>>>>        VIRTIO_RPMSG_F_NS,
> >>>>> +    VIRTIO_RPMSG_F_BUFSZ,
> >>>>>    };
> >>>>>      static struct virtio_driver virtio_ipc_driver = {
> >>>>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/
> >>>>> rpmsg/virtio_rpmsg.h
> >>>>> new file mode 100644
> >>>>> index 000000000000..285918be68b9
> >>>>> --- /dev/null
> >>>>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> >>>>> @@ -0,0 +1,27 @@
> >>>>> +/* SPDX-License-Identifier: GPL-2.0 */
> >>>>> +/*
> >>>>> + * Copyright (C) Pinecone Inc. 2019
> >>>>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
> >>>>> + * Copyright (C) Advanced Micro Devices, Inc.
> >>>>> + */
> >>>>> +
> >>>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
> >>>>> +#define _LINUX_VIRTIO_RPMSG_H
> >>>>> +
> >>>>> +#include <linux/types.h>
> >>>>> +#include <linux/virtio_types.h>
> >>>>> +
> >>>>> +/* The feature bitmap for virtio rpmsg */
> >>>>> +#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
> >>>>> notifications */
> >>>>> +#define VIRTIO_RPMSG_F_BUFSZ    1 /* RP get buffer size from config
> >>>>> space */
> >>>>> +
> >>>>> +struct virtio_rpmsg_config {
> >>>>> +    __virtio16 version;
> >>>>> +    /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
> >>>>> +    __virtio32 txbuf_size;
> >>>>> +    __virtio32 rxbuf_size;
> >>>>> +    __virtio32 reserved[14]; /* Reserve for the future use */
> >>>>
> >>>> 66 byte for the configuratio space?  I'm puzzled about the
> >>>> reserved[14], how did
> >>>> you come up with that number?
> >>
> >> I kept the reserved bytes from the original series as it is. The
> >> original series did not contain version field. With version I don't
> >> think we need reserved field at all. At best, if we want to append
> >> padding bytes, then I think __virtio16 reserved; makes sense. That will
> >> make the structure aligned to 4 byte.
> >>
> >>>
> >>> Is it useful to define the reserved field?
> >>
> >> I think reserved field is only useful to keep the structure size aligned
> >> to 4 bytes.
> >>
> >>> The version should allow us to determine the content.
> >>
> >> Correct, but I think the structure can be aligned if used correct
> >> reserved bytes.
> >>
> >>> An other solution is to introduce a'size' field to determine the size of
> >>> the structure:
> >>
> >> I think, the resource table already contains config_len field which is
> >> size of the structure:
> >>
> >> https://github.com/torvalds/linux/
> >> blob/27fa82620cbaa89a7fc11ac3057701d598813e87/include/linux/
> >> remoteproc.h#L275
> >
> >
> > The resource table is the solution for the remoteproc virtio backend,
> > The solution should be able to work with some other virtio backends.
> > In such case we can not rely on the resource table.
> >
>
> For now we have only the remoteproc virtio backend. If we ever introduce
> new backend, then can we update this structure with new 'version' num
> and include size field at that time? Since, now there is no real use of it.
>
> > The resource table is a solution for the remoteproc virtio backend.
> > However, the solution should also be able to work with other virtio
> > backends.
> > In that case, it may not be possible to rely on the resource table.
> >
>
> Another concern is, do we need the size of the structure in the
> first-place even to retrieve the 'size' field from the structure or
> verify the integrity of the structure?
>
> For example:
> https://github.com/torvalds/linux/blob/27fa82620cbaa89a7fc11ac3057701d598813e87/drivers/remoteproc/remoteproc_virtio.c#L301
>
>
> Here to verify the integrity of the resource table, we are using virtio
> config space size.
>
> If we do then it's better to provide the 'size' field some other way
> before parsing of the rpmsg config space in any virtio backend. Like in
> the remoteproc virtio backend it's provided via the resource table.
>
> Let me know if I am overthinking :-) and we want the 'size' field in the
> config space. I am just trying to make it as minimal as possible.

I think it is better to have a 'size' field in the structure.

>
> Thanks,
> Tanmay
>
> > Regards,
> > Arnaud
> >
> >>
> >>> struct virtio_rpmsg_config {
> >>>      __virtio16 version;
> >>>      __virtio16 size; /* size of the configuration space */
> >>>      /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
> >>>      __virtio32 txbuf_size;
> >>>      __virtio32 rxbuf_size;
> >>>      __u8 private[0]; /* customized config */
> >>
> >> Do we need customized config? I think I should remove this comment from
> >> the original patch as well.
> >>
> >> Thanks,
> >> Tanmay
> >>
> >>> };
> >>>
> >>>>
> >>>> The rest looks good to me.
> >>>>
> >>>
> >>> Looks good to me too.
> >>>
> >>> Thanks,
> >>> Arnaud
> >>>
> >>>>> +    /* Put the customize config here */
> >>>>> +} __packed;
> >>>>> +
> >>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> >>>>> --
> >>>>> 2.34.1
> >>>>>
> >>>
> >>
> >
>
