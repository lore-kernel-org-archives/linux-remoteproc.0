Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6063A3E173C
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 17:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781199073; cv=none; b=A9r2K3z0MV4cDvHS4qpkdJd4SwcFrsPHxy9XYocnQdQLBInNi1tvYc70CngFczSKaLPT4ebBqmvCDE2mg+yfp/nn7UwNzO5fLUi8NTHmxqZQNRPN6u8K5xJdEB7kjkaFdI92IKk9dIW1v000WhhcBKD1JOAKAqfIHz7llgNcSNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781199073; c=relaxed/simple;
	bh=y63P7i1M2w8xoMTAbCRaxH24K6LhHz42tUXHBihrZMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kt4qLaDElUAJa0eUt3tnaip+P8fRV8KprDucPTDn999xXR5EYuFicV+IZazo4p914CkPvhJ/EfUuni37rI5Ameq9ZumRRnfIfOBtKQmXXAFPVL7YyW3bHzn1P4ldccpjtGfUKRMRyuOGFpQMqFAte7I4C4voFpMtbx0hvPL07WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lmvPpg7J; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lmvPpg7J"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84232e83ca9so106624b3a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781199070; x=1781803870; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7grTS2Qn8u8517CPhuQu+PNwpWVxiJfdQ30YSMm3Hi8=;
        b=lmvPpg7JfRHmZQqGwkhUPb9zt2FKQRI/MJHb4S6alYGJvakQNuazl/cQfUyEx0qdBe
         g0rdlhGskMSij6BSGmkqLasjk32K2nkD+VgJ284hB6TYdhRPbyPrPpDGbGZBCsInfiVP
         P+9C4TqfhZBVJ9tLnImM+IMPERLDgAn6gGOiyLz/GzBLBmQ93cvxq1t95VZIWlzUe6ZB
         lam3ftZJU3NKe6e8QqOW3TAlKJQMV7fNr2j4UCZR3coBAKeUTaTmffEbRk6mjI4eDPzw
         iejbKCYnoZ2oORws4MWqvXXOG/WhRrkP+S67t6QvrMOMSa1qZmWOUvkS0iBNQVIrTa/G
         R9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781199070; x=1781803870;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7grTS2Qn8u8517CPhuQu+PNwpWVxiJfdQ30YSMm3Hi8=;
        b=mv+H4Q6la24aWe5tTcLL/o2RKRJXhL6DGxJm9kLfz6U6fIp7lIG9yl7M/296TowUqo
         uPNKe5BzDUNAPz+r7Cfhx2A9mWmflKD/4WxRUZ5AcZSeYOofWU3Rsld/v2VlQ3EKePwk
         iBVmRSnI+Zc2ZQCpR2IhXZ+mLOs9413KAvDRITH6mGa4wCNzZOCRz2uhuq4EvmDEWyjI
         bUofuA7HULLcUgOgWXkhz5riNTNnBTHbAHWXz9LjqeFKt4xFKTnShugXwKct8GOVY/TR
         EyvabE7//bm/WDbKxM/IEEtXmj3VcQAZwYmn1u7Up7N9snYHCNr0nQ+KTJaFxyBcQGgr
         M4yQ==
X-Forwarded-Encrypted: i=1; AFNElJ98GMC641+JyqTZI2H8iXVdqBOJPJ+XXRgbxBEfxlx/THmgJVUFdC8QZTuS8TenGzWIRqnuuxwwM5WobsqHoYJj@vger.kernel.org
X-Gm-Message-State: AOJu0YxxLVBArGKDyaTP267A0EjJlBjKgdGv8den6tb9Dr9kfgh1AwH7
	90XMLsAFf5DrpcVInXXOrTeuzhK6/U1GE0rADwBBaSiLpmdDoS7ZDC7JloZ2blNkMX0=
X-Gm-Gg: Acq92OEoVRxnS7O0SGcBGpAWOl9QNcMYPXR/z0c/oJ5nENGiCxFMR0q8sf3vp4VqARd
	wHqQ7D+sS66Zm0QkoETN+ao3LcLm/PFr3u+D0uXxx2C0L7MK/ss0KGZDrT0XUFrCQ7ryQ7a3s+i
	jVsfZD51ZlR+1TuypwnIx5xGn25tg3FoEzHrveyrfpu8ud22nebOwYQeTxUwXjbfE07ePm7rMvj
	CiFPFPbX9GAnWu2bCRJ7D+Kc5PNqznHwTh9xRmtmoNnTbEjeQg4vfkXCbspLF+D/MXM6CGrhzEn
	yCkTsS1E6zJVvFCxYdKcSo5y10R3zEPQg2HppQ68B8TUjnMwEx2iM+Q1ZZ348PhdiZYVoU0vN7J
	2vHVXTOGBCiyjG4/02TRKgbDPlkHKtXy9fX5rWM2gOrhXYJqGSfhU4D9m707HY+cDUUldtqTtjr
	YohQfFgloApuzmTxYZMlyuJRMiUvE=
X-Received: by 2002:a05:6a00:148a:b0:82a:780f:a187 with SMTP id d2e1a72fcca58-84336a9e6e1mr4295280b3a.36.1781199069554;
        Thu, 11 Jun 2026 10:31:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5bde:8634:433a:e780])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c92edsm2454715b3a.32.2026.06.11.10.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 10:31:08 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:31:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, andersson@kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	divin.raj@arm.com
Subject: Re: [PATCH v3 3/4] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
Message-ID: <airw2gzWn9pSbqbg@p14s>
References: <20260529164327.1827121-1-tanmay.shah@amd.com>
 <20260529164327.1827121-4-tanmay.shah@amd.com>
 <2e4b5ce9-f106-4218-bf65-2fb675d99e66@foss.st.com>
 <8d59e741-4cfa-4042-bd45-35838641aa31@amd.com>
 <b87ceda3-a021-46e3-83d2-d4e6207142fd@foss.st.com>
 <ccf95382-f219-45ed-8880-38166ab1f66f@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccf95382-f219-45ed-8880-38166ab1f66f@amd.com>

On Tue, Jun 09, 2026 at 12:33:47PM -0500, Shah, Tanmay wrote:
> 
> 
> On 6/5/2026 3:25 AM, Arnaud POULIQUEN wrote:
> > Hi Tanmay,
> > 
> > On 6/4/26 22:31, Shah, Tanmay wrote:
> >> Thank You for the reviews, please find my comments below:
> >>
> >> On 6/2/2026 3:25 AM, Arnaud POULIQUEN wrote:
> >>> Hi Tanmay,
> >>>
> >>> On 5/29/26 18:43, Tanmay Shah wrote:
> >>>> 512 bytes isn't always suitable for all case, let firmware
> >>>> maker decide the best value from resource table.
> >>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> >>>>
> >>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>>> ---
> >>>>
> >>>> Changes in v3:
> >>>>     - change version field from u16 to u8
> >>>>     - introduce size field in the rpmsg_virtio_config structure
> >>>>     - check version field is set to any non-zero value.
> >>>>     - check size field is not 0.
> >>>>     - Remove field for private config, as not needed for now.
> >>>>     - add documentation of rpmsg_virtio_config structure
> >>>>
> >>>>    drivers/rpmsg/virtio_rpmsg_bus.c   | 90 +++++++++++++++++++++++
> >>>> +------
> >>>>    include/linux/rpmsg/virtio_rpmsg.h | 34 +++++++++++
> >>>>    2 files changed, 106 insertions(+), 18 deletions(-)
> >>>>    create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
> >>>>
> >>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
> >>>> virtio_rpmsg_bus.c
> >>>> index 99df1ae07055..f1ab8e792f3d 100644
> >>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>> @@ -20,6 +20,7 @@
> >>>>    #include <linux/rpmsg.h>
> >>>>    #include <linux/rpmsg/byteorder.h>
> >>>>    #include <linux/rpmsg/ns.h>
> >>>> +#include <linux/rpmsg/virtio_rpmsg.h>
> >>>>    #include <linux/scatterlist.h>
> >>>>    #include <linux/slab.h>
> >>>>    #include <linux/sched.h>
> >>>> @@ -39,7 +40,8 @@
> >>>>     * @tx_bufs:    kernel address of tx buffers
> >>>>     * @num_rx_buf: total number of rx buffers
> >>>>     * @num_tx_buf: total number of tx buffers
> >>>> - * @buf_size:   size of one rx or tx buffer
> >>>> + * @rx_buf_size: size of one rx buffer
> >>>> + * @tx_buf_size: size of one tx buffer
> >>>>     * @last_tx_buf: index of last tx buffer used
> >>>>     * @bufs_dma:    dma base addr of the buffers
> >>>>     * @tx_lock:    protects svq and tx_bufs, to allow concurrent
> >>>> senders.
> >>>> @@ -59,7 +61,8 @@ struct virtproc_info {
> >>>>        void *rx_bufs, *tx_bufs;
> >>>>        unsigned int num_rx_buf;
> >>>>        unsigned int num_tx_buf;
> >>>> -    unsigned int buf_size;
> >>>> +    unsigned int rx_buf_size;
> >>>> +    unsigned int tx_buf_size;
> >>>>        int last_tx_buf;
> >>>>        dma_addr_t bufs_dma;
> >>>>        struct mutex tx_lock;
> >>>> @@ -68,9 +71,6 @@ struct virtproc_info {
> >>>>        wait_queue_head_t sendq;
> >>>>    };
> >>>>    -/* The feature bitmap for virtio rpmsg */
> >>>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
> >>>> notifications */
> >>>> -
> >>>>    /**
> >>>>     * struct rpmsg_hdr - common header for all rpmsg messages
> >>>>     * @src: source address
> >>>> @@ -128,7 +128,9 @@ struct virtio_rpmsg_channel {
> >>>>     * processor.
> >>>>     */
> >>>>    #define MAX_RPMSG_NUM_BUFS    (256)
> >>>> -#define MAX_RPMSG_BUF_SIZE    (512)
> >>>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
> >>>> +
> >>>> +#define RPMSG_VDEV_CONFIG_VER 1
> >>>
> >>> I would rename it
> >>>
> >>> #define RPMSG_VDEV_CONFIG_V1 1
> >>
> >> We might not need this define at all. I should have removed it in this
> >> patch. Please see below [1].
> >>
> >>>
> >>>>      /*
> >>>>     * Local addresses are dynamically allocated on-demand.
> >>>> @@ -444,7 +446,7 @@ static void *get_a_tx_buf(struct virtproc_info
> >>>> *vrp)
> >>>>          /* either pick the next unused tx buffer */
> >>>>        if (vrp->last_tx_buf < vrp->num_tx_buf)
> >>>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
> >>>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_tx_buf++;
> >>>>        /* or recycle a used one */
> >>>>        else
> >>>>            ret = virtqueue_get_buf(vrp->svq, &len);
> >>>> @@ -514,7 +516,7 @@ static int rpmsg_send_offchannel_raw(struct
> >>>> rpmsg_device *rpdev,
> >>>>         * messaging), or to improve the buffer allocator, to support
> >>>>         * variable-length buffer sizes.
> >>>>         */
> >>>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
> >>>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
> >>>>            dev_err(dev, "message is too big (%d)\n", len);
> >>>>            return -EMSGSIZE;
> >>>>        }
> >>>> @@ -647,7 +649,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
> >>>> rpmsg_endpoint *ept)
> >>>>        struct rpmsg_device *rpdev = ept->rpdev;
> >>>>        struct virtio_rpmsg_channel *vch =
> >>>> to_virtio_rpmsg_channel(rpdev);
> >>>>    -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
> >>>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
> >>>>    }
> >>>>      static int rpmsg_recv_single(struct virtproc_info *vrp, struct
> >>>> device *dev,
> >>>> @@ -673,7 +675,7 @@ static int rpmsg_recv_single(struct virtproc_info
> >>>> *vrp, struct device *dev,
> >>>>         * We currently use fixed-sized buffers, so trivially sanitize
> >>>>         * the reported payload length.
> >>>>         */
> >>>> -    if (len > vrp->buf_size ||
> >>>> +    if (len > vrp->rx_buf_size ||
> >>>>            msg_len > (len - sizeof(struct rpmsg_hdr))) {
> >>>>            dev_warn(dev, "inbound msg too big: (%d, %d)\n", len,
> >>>> msg_len);
> >>>>            return -EINVAL;
> >>>> @@ -706,7 +708,7 @@ static int rpmsg_recv_single(struct virtproc_info
> >>>> *vrp, struct device *dev,
> >>>>            dev_warn_ratelimited(dev, "msg received with no
> >>>> recipient\n");
> >>>>          /* publish the real size of the buffer */
> >>>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
> >>>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
> >>>>          /* add the buffer back to the remote processor's virtqueue */
> >>>>        err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
> >>>> @@ -824,6 +826,8 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>>        int err = 0, i;
> >>>>        size_t total_buf_space;
> >>>>        bool notify;
> >>>> +    u8 version;
> >>>> +    u16 size;
> >>>>          vrp = kzalloc_obj(*vrp);
> >>>>        if (!vrp)
> >>>> @@ -855,9 +859,58 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>>        else
> >>>>            vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
> >>>>    -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
> >>>> +    /*
> >>>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure
> >>>> buf
> >>>> +     * size from virtio device config space from the resource table.
> >>>> +     * If the feature is not supported, then assign default buf size.
> >>>> +     */
> >>>
> >>> Seems to me that It would be nice to document the config space in
> >>> rpmsg.rst
> >>>
> >>
> >> Ack.
> >>
> >>>> +    if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
> >>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
> >>>> +                 version, &version);
> >>>> +        if (version == 0) {
> >>>
> >>>          if (version != RPMSG_VDEV_CONFIG_V1) {
> >>>
> >>
> >> [1] Here we have to allow any non-zero version to be valid, and make
> >> sure any future version is always backward compatible.
> >>
> >> For example, if we need v2 of the structure, then that should be
> >> compatible with v1. So, old kernel keeps working with the new firmware
> >> with limited functionality supported by the kernel. And new kernel keep
> >> working with the old firmware, with the limited functionality supported
> >> by the firmware.
> >>
> >> That is just my view. I am open to more ideas, thank you.
> > 
> > My concern is that you allow any version here, while we define only a V1.
> > If we need a V2 we will probably have to modify this part of the code.
> > 
> 
> So that means, the firmware that has v2, will never work with the old
> kernel that supports only v1. I would like to design in a way, where
> firmware has v2, but it is back compatible with v1. New firmware can
> still work with old kernel with only functionality that was supported in
> v1.
> 
> Mathieu do you have any opinion on this? I don't know if there is any
> standard accepted design pattern for this type of compatibility.
> 
> 
> use  | Linux  | firmware |
> case | kernel | version  |  Note    |
>      |        |          |          |
>   1  |    v1  |    v1    |   works  |
>   2  |    v2  |    v1    |  old firmware features work.
>   3  |    v1  |    v2    |  new firmware features won't work.

Scenario #3 is expected and desired.  There is no point in trying to guess what
features a new firmware revision, i.e v2, will have.

I agree with Arnaud, right now we aim to support v1 and nothing else.  We can
provision to support newer versions at the time they become available.

> 
> In use-case 3, Do we want to fail completely and say old Linux will not
> support new firmware at all ?
> 
> Thanks,
> Tanmay
> 
> 
> >>
> >>>> +            dev_err(&vdev->dev, "invalid version of vdev config\n");
> >>>> +            err = -EINVAL;
> >>>> +            goto vqs_del;
> >>>> +        }
> >>>> +
> >>>> +        /*
> >>>> +         * The size field is not used for the remoteproc virtio
> >>>> transport,
> >>>> +         * but kept for any future transport to use
> >>>> +         */
> >>>
> >>> I suggest to not mention the virtio transport, indeed we should decouple
> >>> the virtio device from the virtio transport.
> >>>
> >>
> >> Ack.
> >>
> >>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
> >>>> +                 size, &size);
> >>>> +        if (size == 0) {
> >>>
> >>>      if (size != sizeof(virtio_rpmsg_config)) {
> >>>
> >>
> >> So, I think sizeof(virtio_rpmsg_config) on the remote side may not be
> >> the same as in the linux kernel. Remote side can have its private
> >> variables which might not needed on the linux side:
> >>
> >> For example, the open-amp library defines the structure differently than
> >> linux:
> >> https://github.com/OpenAMP/open-amp/
> >> blob/23d4c5d7a5c5dd08b74d4ba828243988592337cb/lib/include/openamp/
> >> rpmsg_virtio.h#L70
> >>
> >> There is 'split_shpool' extra variable which is not needed by the linux.
> > 
> > The 'split_shpool' setting is currently an internal OpenAMP configuration
> > and is not part of a configuration space. If there is a need to split
> > memory regions for RX and TX buffers, the implementation should use another
> > method, perhaps with DA and PA addresses that specify the RX and TX buffer
> > locations, as for the vrings in the resource table.
> > I would suggest to not address this in version 1.
> > 
> > From my perspective, the configuration space is a common structure that
> > the device and the driver share. In that case, checking the size makes
> > sense.
> 
> Ack.
> 
> > Thanks,
> > Arnaud
> > 
> >>
> >> That is why restriction on the size isn't needed IMHO.
> >>
> >>>> +            dev_err(&vdev->dev, "invalid size of vdev config\n");
> >>>> +            err = -EINVAL;
> >>>> +            goto vqs_del;
> >>>> +        }
> >>>> +
> >>>> +        /* note: tx and rx are defined from remote view */
> >>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
> >>>> +                 txbuf_size, &vrp->rx_buf_size);
> >>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
> >>>> +                 rxbuf_size, &vrp->tx_buf_size);
> >>>
> >>> I wonder if we should not impose a size aligned on 64-bits
> >>>
> >>
> >> I think you mean size should be aligned to 64-bits.
> >> Ack for that.
> >>
> >>>> +
> >>>> +        /* The buffers must hold at least the rpmsg header */
> >>>> +        if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
> >>>> +            vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
> >>>> +            dev_err(&vdev->dev,
> >>>> +                "bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
> >>>> +                vrp->rx_buf_size, vrp->tx_buf_size);
> >>>> +            err = -EINVAL;
> >>>> +            goto vqs_del;
> >>>> +        }
> >>>> +
> >>>> +        dev_dbg(&vdev->dev,
> >>>> +            "vdev config: version=%d, rx buf sz = 0x%x, tx buf sz =
> >>>> 0x%x\n",
> >>>> +            version, vrp->rx_buf_size, vrp->tx_buf_size);
> >>>> +    } else {
> >>>> +        vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> >>>> +        vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> >>>> +    }
> >>>>    -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
> >>>>> buf_size;
> >>>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> >>>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
> >>>>          /* allocate coherent memory for the buffers */
> >>>>        bufs_va = dma_alloc_coherent(vdev->dev.parent,
> >>>> @@ -875,14 +928,14 @@ static int rpmsg_probe(struct virtio_device
> >>>> *vdev)
> >>>>        vrp->rx_bufs = bufs_va;
> >>>>          /* and second part is dedicated for TX */
> >>>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
> >>>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
> >>>
> >>>
> >>> We should have a cache or 64-bit alignement here. or perhaps such
> >>> constraints should be specified in the config space?
> >>>
> >>
> >> I prefer to specify in the config space.
> >>
> >>>>          /* set up the receive buffers */
> >>>>        for (i = 0; i < vrp->num_rx_buf; i++) {
> >>>>            struct scatterlist sg;
> >>>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
> >>>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
> >>>>    -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
> >>>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
> >>>>              err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
> >>>>                          GFP_KERNEL);
> >>>> @@ -965,8 +1018,8 @@ static int rpmsg_remove_device(struct device
> >>>> *dev, void *data)
> >>>>    static void rpmsg_remove(struct virtio_device *vdev)
> >>>>    {
> >>>>        struct virtproc_info *vrp = vdev->priv;
> >>>> -    unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
> >>>> -    size_t total_buf_space = num_bufs * vrp->buf_size;
> >>>> +    size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> >>>> +                 (vrp->num_tx_buf * vrp->tx_buf_size);
> >>>>        int ret;
> >>>>          virtio_reset_device(vdev);
> >>>> @@ -992,6 +1045,7 @@ static struct virtio_device_id id_table[] = {
> >>>>      static unsigned int features[] = {
> >>>>        VIRTIO_RPMSG_F_NS,
> >>>> +    VIRTIO_RPMSG_F_BUFSZ,
> >>>>    };
> >>>>      static struct virtio_driver virtio_ipc_driver = {
> >>>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/
> >>>> virtio_rpmsg.h
> >>>> new file mode 100644
> >>>> index 000000000000..77a530514d86
> >>>> --- /dev/null
> >>>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> >>>> @@ -0,0 +1,34 @@
> >>>> +/* SPDX-License-Identifier: GPL-2.0 */
> >>>> +/*
> >>>> + * Copyright (C) Pinecone Inc. 2019
> >>>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
> >>>> + * Copyright (C) Advanced Micro Devices, Inc.
> >>>
> >>> No year specified for AMD copyright?
> >>
> >> Ack, will fix.
> >>
> >>>
> >>>> + */
> >>>> +
> >>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
> >>>> +#define _LINUX_VIRTIO_RPMSG_H
> >>>> +
> >>>> +#include <linux/types.h>
> >>>> +#include <linux/virtio_types.h>
> >>>> +
> >>>> +/* The feature bitmap for virtio rpmsg */
> >>>> +#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
> >>>> notifications */
> >>>> +#define VIRTIO_RPMSG_F_BUFSZ    1 /* RP get buffer size from config
> >>>> space */
> >>>> +
> >>>> +/**
> >>>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
> >>>> + *
> >>>> + * @version: version of this structure. current version is 1.
> >>>> + * @size:    size of this structure. unused for the remoteproc virtio
> >>>> backend.
> >>>
> >>> reference to remoteproc to remove
> >>>
> >>
> >> Ack.
> >>
> >>>> + * @txbuf_size: Tx buf size from remote's view. For Linux this is rx
> >>>> buf size.
> >>>> + * @rxbuf_size: Rx buf size from remote's view. For Linux this is tx
> >>>> buf size.
> >>>> + */
> >>>> +struct virtio_rpmsg_config {
> >>>> +    u8 version;
> >>>> +    __virtio16 size;
> >>>> +    /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
> >>>> +    __virtio32 txbuf_size;
> >>>> +    __virtio32 rxbuf_size;
> >>>> +} __packed;
> >>>
> >>>
> >>> As mentioned above
> >>> - The size should be be a multiple of four to ensure 64-bit alignment.
> 
> Here, do you mean to document that size should be a multiple of 4 ? How
> to enforce the alignment to 4? We can only document right?
> 
> Thanks,
> Tanmay
> 
> >>> - I would add an alignment field to align the address of the TX buffers
> >>> to the cache line.
> >>>
> >>
> >> Ok, I will change and test.
> >>
> >>> Thanks,
> >>> Arnaud
> >>>
> >>>
> >>>> +
> >>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> >>>
> >>
> > 
> 
