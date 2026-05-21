Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56553385D75
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 16:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779382550; cv=pass; b=nwIv9Y0395s2NPOZddjJ7BkIFxqBoeOoVfNEbrCwthFSe7YwLPhjb1Ty5QI0NhpGHah3Hzp7esgWAg4xp1xxSpMF8Rz9tIou174W0vrQ4H36pmDJlgaH4sFSEaO5VedzXTWfrFS+GrJAWp2axpb0zFw9JsR+V9fjhhWa68QWONk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779382550; c=relaxed/simple;
	bh=xWR/Cnpeix+o+aGlWd8uWhXG6HAmk8pW6dLf7fpTvBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQ2MjjW6w7vC0R30hiEIx4aukT1pA2pg9LdcDM6cBZ9mQRznfo4DhOFErunCuZRnyjAnvFChvO05z2OXX1wGDm+cEbiahE+phNvY9bS+atJZXP6bzkTRdk9G0N5jce/kzQpz9Onv29xI+zggVP+Ozxc201ACr0ag4RFSQ/1HbbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z4SXB9i6; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z4SXB9i6"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67c9616b4feso11209422a12.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 May 2026 09:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779382547; cv=none;
        d=google.com; s=arc-20240605;
        b=iZG6NFsHuqTQ9x29JcLDhFJbc0i6NSfupojsjsuMdDOQqvzJQtSgG2ljrC9YO3bRJj
         w0vFNxU94ku91oyHG0L+grapFaJg3e5T+3CtXiiDnGD3mE4BbFQV2HePNX974tpBEn7n
         FdDp1RGy4gjeJWIt0axk28lf561ScrDI+dGIpWgQhlI08G7bw9+4RFZxxr+6pB3aKCjc
         44ygsJIkCehkEEB5SCzugdfMqv9g5ZXepC7xQG9rYGV9pezn/x8jlqUFJ/8WSfz2qeMh
         IepZIhovcXBqMHSQRvFKXQSX0GOBj+FJUs5p9Qs1JPt1xeqNTP09l4mzDfUxYvvKUfbv
         JKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5+1zlLBl0uDK4B6igs0c5r1BHHz3aQE9N/s+LGMxZVI=;
        fh=TSLZ2sBV7IhRYVEIg7MzcRFiPpLBvfb7HTYwSDH/M1I=;
        b=UQHiTUUVeMlo/4J43x9jXCndxiawScuIKWY9Qx3Cw9SMhmIjcZOoE5rSYvkY4xKl6V
         t7io33mYDuoMjN+U1/3antWkU3n8gX/KbN6/nDy4fPyjYZsQCMWFWQNBOWezlvSJOTi7
         HyWGaPXQon72o3Q6BuBDNARUM+PsC6FmI/DcmXh/jXf0QPaUHA+mN5Zj/7P8AfclfYu3
         I5owBND5QIzTZaJxiGzltAtBByeOeJ13PvZLGvvPIsj61Zt6u0I3iPwn91aF4aVaRM1H
         j3XY0hwZWGzmTQFRIrRTgFUTag3LDgM5xdtgp5psnubvwkLfzIDmdwOIZ12oYUAiZF6Q
         DMBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779382547; x=1779987347; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5+1zlLBl0uDK4B6igs0c5r1BHHz3aQE9N/s+LGMxZVI=;
        b=z4SXB9i6d1PE1YwdotaDMjD0mKuora0sCbOWI+0W6QReErCJDOfQAb+YnOeBWrQE2y
         +FgGC1RvSZZ1/tSpZx9vvmEG4rbEM+dbTmH0/9nMooZp70I4OU7aOM81oSh0BHbY4kvQ
         4UX2N8r2Oof2VmmfipQmT10QXQxR+qGr/VlX3fw8AbiWVkkg/RLWFgcKL9QLXoydy9Qb
         HoeWHGpu2D3h7QXBtvxtwNEFHIbF7p7oYQXnVU+XX6k/60Me3nGUndQVAcW/dgx4ny1z
         9QHg+XExMseBVESL8yhJF0QRt7rSkIB25KTbSmqZJpm6TFBd1rCPGvTJgZ7fF4ipdumZ
         uFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779382547; x=1779987347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+1zlLBl0uDK4B6igs0c5r1BHHz3aQE9N/s+LGMxZVI=;
        b=Mbrz+jyxK5JCRCnf8v/1W2DaJIcX8rNB1lTsonVxBDPVdrQVymxjDG5Za8GvMMm7Qm
         5q8hPys138UqYdNEF4WszJ3bVyeA995a3gDqmDQqWbCPlU/r+vqcBw9TrRJtLrNH1r83
         loTCy0g3AkbJseo6FjY3cNMh9Xb+8njPThmzH2oePLxqna76p7idSoJzBly3UlGtELgj
         Cu88So+RO8Sf0w6ldWHhLzwdxOWx7OVnPLmaVseKk6VUK5tICx0rrbHXJTQ1LqnSupEY
         tufAO1RKoWCSxkd/NvwcmGg82jJFNxXlmb3DYZs8wCi8/TvnM1nbonDE87bh5oWs1QM4
         vxmg==
X-Forwarded-Encrypted: i=1; AFNElJ99n6c1EMrWL4++XrwVioehdwIh/o+zGXoyV8mS2zhqtyrC4cDj5DPMSQmlUfBuBgtgWDgN+Rafskx/A5G7tNZz@vger.kernel.org
X-Gm-Message-State: AOJu0YwZT1iNlHxEH32xKlsli/CBYa13hmrCDi2Cr0Zx/9Pt6EeM+kUe
	InU9A0/3wMECfeaKGv8L6FfpB1NELxm+nZgjKC8qgoNnjeRBeRzTP214LtfiRSxWG49Ku7FOc8d
	RthFyJ9av9ghDazsqaHaKBKsgeBFRyYy3kTETCbo10g==
X-Gm-Gg: Acq92OFpcMslmXeZUv87l0bYRSkthHd1pVXB0/I03u+AWNNP4nDNl/1PepOIhdo1Mbx
	fGSo3WLg7Kpz/bDDr5E0GiSsxntDI1HaOHgdQsEiOp9ObZJ4wYvjCrPCNOsJrhXQWafxUywxFSX
	ECwn94ScxH5A6gX6boJ3nT4AuYll2TZA1+OaUKpP0E10y3K4yIO5udmZ1reCH2TyeaEOovAVDnv
	ZQXmka32heD1jUBvDa09pTy5d2zKNPCtaSw63bSvyKKCdSQ8bJe9Em6hfVGSguCSWe0jHO6PBy5
	0P29jOVNRAb+gsb3G0plyC4zt69Wga0KLtPjA7cg+g==
X-Received: by 2002:a05:6402:42d6:b0:687:2ca9:e93d with SMTP id
 4fb4d7f45d1cf-688360e69d3mr1988730a12.9.1779382546489; Thu, 21 May 2026
 09:55:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429161052.528015-1-tanmay.shah@amd.com> <20260429161052.528015-3-tanmay.shah@amd.com>
 <agyfr-pxwQ4oKMAF@p14s> <0ea5801b-c435-4f67-b811-aed696bd64b7@foss.st.com>
 <313c02dd-0a19-48d4-bdaf-c53e2be1131b@amd.com> <ag30vj5zRZwgWWTJ@p14s> <00e9bfa9-90b3-40b9-9c00-44b4dd17f3cf@amd.com>
In-Reply-To: <00e9bfa9-90b3-40b9-9c00-44b4dd17f3cf@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 21 May 2026 10:55:35 -0600
X-Gm-Features: AVHnY4JAs9RW6nVR69oTmskfUBXYGdVt-NvB9wKSAvg6WrxasRo5XZy5rpYAxOA
Message-ID: <CANLsYkww8-WBCgKtsPvOKuioK5-rCMvfNBgpERvoOLR-ROdcig@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: tanmay.shah@amd.com
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, andersson@kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 May 2026 at 07:23, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 5/20/2026 12:51 PM, Mathieu Poirier wrote:
> > On Wed, May 20, 2026 at 09:55:33AM -0500, Shah, Tanmay wrote:
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
> >>>>>    - Verify this patch works with the existing firmware
> >>>>>    - Verify this patch works with the firmware that configures
> >>>>>      differt tx & rx buf size
> >>>>>
> >>>>> Changes in v2:
> >>>>>    - %s/sbuf_size/tx_buf_size/
> >>>>>    - %s/rbuf_size/rx_buf_size/
> >>>>>    - fix typo
> >>>>>    - do not use ALIGN on buf size, rely on allocator
> >>>>>    - make err msg more explicit, %s/vdev config:/bad vdev config/
> >>>>>    - fix license and add AMD copyrights in the header virtio_rpmsg.h
> >>>>>    - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
> >>>>>    - use __virtio32 over __u32
> >>>>>    - add version field to virtio rpmsg config structure
> >>>>>    - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
> >>>>>
> >>>>>   drivers/rpmsg/virtio_rpmsg_bus.c   | 70 ++++++++++++++++++++++--------
> >>>>>   include/linux/rpmsg/virtio_rpmsg.h | 27 ++++++++++++
> >>>>>   2 files changed, 79 insertions(+), 18 deletions(-)
> >>>>>   create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
> >>>>>
> >>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
> >>>>> virtio_rpmsg_bus.c
> >>>>> index e59d8cf9b975..8116d94413cc 100644
> >>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>>> @@ -20,6 +20,7 @@
> >>>>>   #include <linux/rpmsg.h>
> >>>>>   #include <linux/rpmsg/byteorder.h>
> >>>>>   #include <linux/rpmsg/ns.h>
> >>>>> +#include <linux/rpmsg/virtio_rpmsg.h>
> >>>>>   #include <linux/scatterlist.h>
> >>>>>   #include <linux/slab.h>
> >>>>>   #include <linux/sched.h>
> >>>>> @@ -39,7 +40,8 @@
> >>>>>    * @tx_bufs:    kernel address of tx buffers
> >>>>>    * @num_rx_buf:    total number of buffers for rx
> >>>>>    * @num_tx_buf:    total number of buffers for tx
> >>>>> - * @buf_size:    size of one rx or tx buffer
> >>>>> + * @rx_buf_size: size of one rx buffer
> >>>>> + * @tx_buf_size: size of one tx buffer
> >>>>>    * @last_sbuf:    index of last tx buffer used
> >>>>>    * @bufs_dma:    dma base addr of the buffers
> >>>>>    * @tx_lock:    protects svq and tx_bufs, to allow concurrent senders.
> >>>>> @@ -59,7 +61,8 @@ struct virtproc_info {
> >>>>>       void *rx_bufs, *tx_bufs;
> >>>>>       unsigned int num_rx_buf;
> >>>>>       unsigned int num_tx_buf;
> >>>>> -    unsigned int buf_size;
> >>>>> +    unsigned int rx_buf_size;
> >>>>> +    unsigned int tx_buf_size;
> >>>>>       int last_sbuf;
> >>>>>       dma_addr_t bufs_dma;
> >>>>>       struct mutex tx_lock;
> >>>>> @@ -68,9 +71,6 @@ struct virtproc_info {
> >>>>>       wait_queue_head_t sendq;
> >>>>>   };
> >>>>>   -/* The feature bitmap for virtio rpmsg */
> >>>>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
> >>>>> notifications */
> >>>>> -
> >>>>>   /**
> >>>>>    * struct rpmsg_hdr - common header for all rpmsg messages
> >>>>>    * @src: source address
> >>>>> @@ -128,7 +128,7 @@ struct virtio_rpmsg_channel {
> >>>>>    * processor.
> >>>>>    */
> >>>>>   #define MAX_RPMSG_NUM_BUFS    (256)
> >>>>> -#define MAX_RPMSG_BUF_SIZE    (512)
> >>>>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
> >>>>>     /*
> >>>>>    * Local addresses are dynamically allocated on-demand.
> >>>>> @@ -444,7 +444,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
> >>>>>         /* either pick the next unused tx buffer */
> >>>>>       if (vrp->last_sbuf < vrp->num_tx_buf)
> >>>>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
> >>>>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_sbuf++;
> >>>>>       /* or recycle a used one */
> >>>>>       else
> >>>>>           ret = virtqueue_get_buf(vrp->svq, &len);
> >>>>> @@ -514,7 +514,7 @@ static int rpmsg_send_offchannel_raw(struct
> >>>>> rpmsg_device *rpdev,
> >>>>>        * messaging), or to improve the buffer allocator, to support
> >>>>>        * variable-length buffer sizes.
> >>>>>        */
> >>>>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
> >>>>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
> >>>>>           dev_err(dev, "message is too big (%d)\n", len);
> >>>>>           return -EMSGSIZE;
> >>>>>       }
> >>>>> @@ -647,7 +647,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
> >>>>> rpmsg_endpoint *ept)
> >>>>>       struct rpmsg_device *rpdev = ept->rpdev;
> >>>>>       struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> >>>>>   -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
> >>>>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
> >>>>>   }
> >>>>>     static int rpmsg_recv_single(struct virtproc_info *vrp, struct
> >>>>> device *dev,
> >>>>> @@ -673,7 +673,7 @@ static int rpmsg_recv_single(struct virtproc_info
> >>>>> *vrp, struct device *dev,
> >>>>>        * We currently use fixed-sized buffers, so trivially sanitize
> >>>>>        * the reported payload length.
> >>>>>        */
> >>>>> -    if (len > vrp->buf_size ||
> >>>>> +    if (len > vrp->rx_buf_size ||
> >>>>>           msg_len > (len - sizeof(struct rpmsg_hdr))) {
> >>>>>           dev_warn(dev, "inbound msg too big: (%d, %d)\n", len,
> >>>>> msg_len);
> >>>>>           return -EINVAL;
> >>>>> @@ -706,7 +706,7 @@ static int rpmsg_recv_single(struct virtproc_info
> >>>>> *vrp, struct device *dev,
> >>>>>           dev_warn_ratelimited(dev, "msg received with no recipient\n");
> >>>>>         /* publish the real size of the buffer */
> >>>>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
> >>>>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
> >>>>>         /* add the buffer back to the remote processor's virtqueue */
> >>>>>       err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
> >>>>> @@ -824,6 +824,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>>>       int err = 0, i;
> >>>>>       size_t total_buf_space;
> >>>>>       bool notify;
> >>>>> +    u16 version;
> >>>>>         vrp = kzalloc_obj(*vrp);
> >>>>>       if (!vrp)
> >>>>> @@ -855,9 +856,41 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>>>       else
> >>>>>           vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
> >>>>>   -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
> >>>>> +    /*
> >>>>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
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
> >
> > I've been thinking about that and I agree it should be something else than '0'.
> > Since we have a u16, I suggest to make bit 15-8 a magic number (surprise us!)
> > and bit 7-0 the actual version number.
> >
>
> Hi Mathieu,
>
> For xlnx platform driver, one magic number is already used for the
> resource table metadata structure which is used to retrieve the resource
> table. We can use magic number for the virtio config strucutre, but
> after that we should limit the introduction of the magic numbers to any
> future structures. We don't want too many magic numbers.


I looked at several device configuration format in the OASIS
specification and none have a magic number, so just forget I ever
mentioned it.

>
>
> So I wanted input on this: Do we want to use magic number for 'version'
> field of this structure or we want to keep use of the 'magic number'
> reserved for any future use case? If we use it now, the I prefer to not
> introduce in the future, as there will be too many magic numbers at that
> point.
>
> Thanks,
> Tanmay
>
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
> >>>>>   -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
> >>>>>> buf_size;
> >>>>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> >>>>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
> >>>>>         /* allocate coherent memory for the buffers */
> >>>>>       bufs_va = dma_alloc_coherent(vdev->dev.parent,
> >>>>> @@ -875,14 +908,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>>>       vrp->rx_bufs = bufs_va;
> >>>>>         /* and second part is dedicated for TX */
> >>>>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
> >>>>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
> >>>>>         /* set up the receive buffers */
> >>>>>       for (i = 0; i < vrp->num_rx_buf; i++) {
> >>>>>           struct scatterlist sg;
> >>>>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
> >>>>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
> >>>>>   -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
> >>>>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
> >>>>>             err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
> >>>>>                         GFP_KERNEL);
> >>>>> @@ -965,8 +998,8 @@ static int rpmsg_remove_device(struct device
> >>>>> *dev, void *data)
> >>>>>   static void rpmsg_remove(struct virtio_device *vdev)
> >>>>>   {
> >>>>>       struct virtproc_info *vrp = vdev->priv;
> >>>>> -    unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
> >>>>> -    size_t total_buf_space = num_bufs * vrp->buf_size;
> >>>>> +    size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> >>>>> +                 (vrp->num_tx_buf * vrp->tx_buf_size);
> >>>>>       int ret;
> >>>>>         virtio_reset_device(vdev);
> >>>>> @@ -992,6 +1025,7 @@ static struct virtio_device_id id_table[] = {
> >>>>>     static unsigned int features[] = {
> >>>>>       VIRTIO_RPMSG_F_NS,
> >>>>> +    VIRTIO_RPMSG_F_BUFSZ,
> >>>>>   };
> >>>>>     static struct virtio_driver virtio_ipc_driver = {
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
> >>>>> +    __virtio32 reserved[14]; /*: Reserve for the future use */
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
> >> https://github.com/torvalds/linux/blob/27fa82620cbaa89a7fc11ac3057701d598813e87/include/linux/remoteproc.h#L275
> >>
> >>> struct virtio_rpmsg_config {
> >>>     __virtio16 version;
> >>>     __virtio16 size; /* size of the configuration space */
> >>>     /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
> >>>     __virtio32 txbuf_size;
> >>>     __virtio32 rxbuf_size;
> >>>     __u8 private[0]; /* customized config */
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
>
