Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659323769E0
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 17:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779299991; cv=none; b=ADxHAduNzTqleZzZqI2rN8ufVcucZgsqm5PiVnwBUlzOByA8tTccDaTtVKar8TXklYM+IbY07jKTWqkso90vLz4l+5ZGS1in7omVAORIFZ2hCNtju4N0SfWuGHQFQWbjexJMBtuFK/uy0jkwemTK+2M6trJisXuiLKrKHl3CtwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779299991; c=relaxed/simple;
	bh=yUYQ7RmeBPSZ5QIVBpoHb3L2lfSe+sROOt2kPJCJqX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyCNe/0CZuHzehI6l+4K8095N47unjJDte88A1oSlBQ6T+UTuNCnu9AkmDSIZaQegyuBFIMrSgVJHrIWWZtmiGUbXViykP6zpuf5O5XZHz24Kzer0isTwfqyYjBmCVFyrftNjUepsYa4y+ZQU6DVUOjMk3W2RGi5OcOUl23qYpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H9EzKmAh; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H9EzKmAh"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c795f441ff7so4183151a12.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 10:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779299989; x=1779904789; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TKV+NtiCl8YF4YdmlzAi7pGrLz4Pr8ApNbd04TJvVDY=;
        b=H9EzKmAht+3NwtLSejFXWAvULOXUmXacxpBLxwOF6x8j2EPjg6EuJM2IdKLyzfKkwb
         KEL5rqPyN624XM9QEdmPacEXGZZAaEHcANsTLV/xlhs3C8B0AjwrCVV/JFRLjZAWa4Qa
         fDkZfYGFxvktrs2mrz49bwXRHqb0x+OLYPRIQlfddysc2JUl0FXfSh6o50bwpJ7JbzwF
         EN20qpCTlB35guCHdqV9Aapg79zGj6nJFux4qE623azHL4xF1muDL+UW143vkzFokBNp
         5TeFPGGuEIA0Ze5hTyB6Y05kvX1MNIbmPR6ObA19fNOsUV2cD+DfDFQEmRKLLlz8AYPR
         kl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779299989; x=1779904789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TKV+NtiCl8YF4YdmlzAi7pGrLz4Pr8ApNbd04TJvVDY=;
        b=OWnHdK8Bkh88RthLQTwvg7KU4vbPSeO9OWdMw3vpTvuXKoc7Rrs62V1TaAQZ1QDAoP
         riYSvloFjZZr+t3iQ99jy29Kba6+tyDMkWeGm9UB+4sn/WyjfeLJ2B/qrJNzjwm0e/zf
         o5AoTNPaMUFSRVU3RnAX1gGjy+a3pvEXWzf9jvZCJr20jWMkEDvlClZyc0r1eV1q+rBG
         HP+AVauponkpW7DI/bRgpNcqFjypC7W2gQ7fAAW7wUluLm9u1JXI4h+ss4tRDDlvA0I6
         fWE2GPMZfIysv4mlTRn5kXBzgd7aY3TRXft0M9HSXVoP5jT3759nBl4w3fPq7Hh1sA6z
         sfAA==
X-Forwarded-Encrypted: i=1; AFNElJ8yLnaEnCN+IrURM7guraofk3V3nq4pI/dagvz79AJCADVx+0GIJvFR8eK2vrJmiGnBUWcX0JOBfIptDMEpudiJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwTX8Ur3xfz4YtjmimPzf/nlF3Ur+mfQfR8a5wQIvY7O3CRrNE/
	OsbMSTz3i8w0UL1GMoZPBole1RNxTGhdssuqZbHl1rfyqVRmoIti1DW8OhyE2M8RGH4R72GR177
	lBLAQ
X-Gm-Gg: Acq92OGN/jHZ+QgxqSKY9szzjIR/hlb8dULH3rJ4ReQWOW59UFSp0T0hBchdRE28p9u
	1apWlq2oqf9LzHFqZTTgo+pjWDY3pV1tAeBwTWjevXqNlEcg/59Dub/N2UN9JZ0Co5h8fQDKBjV
	EuEBxvKY5IyW+Cw2bPMcM1rM519+ZOj/yJs7xuA2hxsJJP54PFhuLaiqK8chZQam05IMhYm0G+Q
	gB9ZWmWSKuHScsMnkS8pzZrqzW5/OVwL/66VnbKj1Z4OmhKk0TDych7+psGZ4RHgeC5gQ5mhP1w
	KsTj24W2qFypS9TvNMjIyseJM2K20IjvU2TgnpYZU/+DNEtataZkRjX7NK854Apz3sAxo328cv/
	8F/DjkdmSl1p/foz3pnqvs001X7s4fvUKSQ48/rD176iOo+wA0YjoNAb2X6CDeLz8GNeCDul5mZ
	lyDOwS5G/5ISDx9wR86u/etDzK3w==
X-Received: by 2002:a05:6a20:2454:b0:3a3:addc:8f47 with SMTP id adf61e73a8af0-3b22ec64553mr28508767637.42.1779299521316;
        Wed, 20 May 2026 10:52:01 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:87f:b712:e05a:7e28])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07d2f2sm19827943a12.10.2026.05.20.10.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 10:52:00 -0700 (PDT)
Date: Wed, 20 May 2026 11:51:58 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, andersson@kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
Message-ID: <ag30vj5zRZwgWWTJ@p14s>
References: <20260429161052.528015-1-tanmay.shah@amd.com>
 <20260429161052.528015-3-tanmay.shah@amd.com>
 <agyfr-pxwQ4oKMAF@p14s>
 <0ea5801b-c435-4f67-b811-aed696bd64b7@foss.st.com>
 <313c02dd-0a19-48d4-bdaf-c53e2be1131b@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <313c02dd-0a19-48d4-bdaf-c53e2be1131b@amd.com>

On Wed, May 20, 2026 at 09:55:33AM -0500, Shah, Tanmay wrote:
> 
> 
> On 5/20/2026 2:44 AM, Arnaud POULIQUEN wrote:
> > 
> > 
> > On 5/19/26 19:36, Mathieu Poirier wrote:
> >> On Wed, Apr 29, 2026 at 09:10:52AM -0700, Tanmay Shah wrote:
> >>> 512 bytes isn't always suitable for all case, let firmware
> >>> maker decide the best value from resource table.
> >>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> >>>
> >>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>> ---
> >>>
> >>> Test done:
> >>>    - Verify this patch works with the existing firmware
> >>>    - Verify this patch works with the firmware that configures
> >>>      differt tx & rx buf size
> >>>
> >>> Changes in v2:
> >>>    - %s/sbuf_size/tx_buf_size/
> >>>    - %s/rbuf_size/rx_buf_size/
> >>>    - fix typo
> >>>    - do not use ALIGN on buf size, rely on allocator
> >>>    - make err msg more explicit, %s/vdev config:/bad vdev config/
> >>>    - fix license and add AMD copyrights in the header virtio_rpmsg.h
> >>>    - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
> >>>    - use __virtio32 over __u32
> >>>    - add version field to virtio rpmsg config structure
> >>>    - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
> >>>
> >>>   drivers/rpmsg/virtio_rpmsg_bus.c   | 70 ++++++++++++++++++++++--------
> >>>   include/linux/rpmsg/virtio_rpmsg.h | 27 ++++++++++++
> >>>   2 files changed, 79 insertions(+), 18 deletions(-)
> >>>   create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
> >>>
> >>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
> >>> virtio_rpmsg_bus.c
> >>> index e59d8cf9b975..8116d94413cc 100644
> >>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> @@ -20,6 +20,7 @@
> >>>   #include <linux/rpmsg.h>
> >>>   #include <linux/rpmsg/byteorder.h>
> >>>   #include <linux/rpmsg/ns.h>
> >>> +#include <linux/rpmsg/virtio_rpmsg.h>
> >>>   #include <linux/scatterlist.h>
> >>>   #include <linux/slab.h>
> >>>   #include <linux/sched.h>
> >>> @@ -39,7 +40,8 @@
> >>>    * @tx_bufs:    kernel address of tx buffers
> >>>    * @num_rx_buf:    total number of buffers for rx
> >>>    * @num_tx_buf:    total number of buffers for tx
> >>> - * @buf_size:    size of one rx or tx buffer
> >>> + * @rx_buf_size: size of one rx buffer
> >>> + * @tx_buf_size: size of one tx buffer
> >>>    * @last_sbuf:    index of last tx buffer used
> >>>    * @bufs_dma:    dma base addr of the buffers
> >>>    * @tx_lock:    protects svq and tx_bufs, to allow concurrent senders.
> >>> @@ -59,7 +61,8 @@ struct virtproc_info {
> >>>       void *rx_bufs, *tx_bufs;
> >>>       unsigned int num_rx_buf;
> >>>       unsigned int num_tx_buf;
> >>> -    unsigned int buf_size;
> >>> +    unsigned int rx_buf_size;
> >>> +    unsigned int tx_buf_size;
> >>>       int last_sbuf;
> >>>       dma_addr_t bufs_dma;
> >>>       struct mutex tx_lock;
> >>> @@ -68,9 +71,6 @@ struct virtproc_info {
> >>>       wait_queue_head_t sendq;
> >>>   };
> >>>   -/* The feature bitmap for virtio rpmsg */
> >>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
> >>> notifications */
> >>> -
> >>>   /**
> >>>    * struct rpmsg_hdr - common header for all rpmsg messages
> >>>    * @src: source address
> >>> @@ -128,7 +128,7 @@ struct virtio_rpmsg_channel {
> >>>    * processor.
> >>>    */
> >>>   #define MAX_RPMSG_NUM_BUFS    (256)
> >>> -#define MAX_RPMSG_BUF_SIZE    (512)
> >>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
> >>>     /*
> >>>    * Local addresses are dynamically allocated on-demand.
> >>> @@ -444,7 +444,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
> >>>         /* either pick the next unused tx buffer */
> >>>       if (vrp->last_sbuf < vrp->num_tx_buf)
> >>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
> >>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_sbuf++;
> >>>       /* or recycle a used one */
> >>>       else
> >>>           ret = virtqueue_get_buf(vrp->svq, &len);
> >>> @@ -514,7 +514,7 @@ static int rpmsg_send_offchannel_raw(struct
> >>> rpmsg_device *rpdev,
> >>>        * messaging), or to improve the buffer allocator, to support
> >>>        * variable-length buffer sizes.
> >>>        */
> >>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
> >>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
> >>>           dev_err(dev, "message is too big (%d)\n", len);
> >>>           return -EMSGSIZE;
> >>>       }
> >>> @@ -647,7 +647,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
> >>> rpmsg_endpoint *ept)
> >>>       struct rpmsg_device *rpdev = ept->rpdev;
> >>>       struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> >>>   -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
> >>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
> >>>   }
> >>>     static int rpmsg_recv_single(struct virtproc_info *vrp, struct
> >>> device *dev,
> >>> @@ -673,7 +673,7 @@ static int rpmsg_recv_single(struct virtproc_info
> >>> *vrp, struct device *dev,
> >>>        * We currently use fixed-sized buffers, so trivially sanitize
> >>>        * the reported payload length.
> >>>        */
> >>> -    if (len > vrp->buf_size ||
> >>> +    if (len > vrp->rx_buf_size ||
> >>>           msg_len > (len - sizeof(struct rpmsg_hdr))) {
> >>>           dev_warn(dev, "inbound msg too big: (%d, %d)\n", len,
> >>> msg_len);
> >>>           return -EINVAL;
> >>> @@ -706,7 +706,7 @@ static int rpmsg_recv_single(struct virtproc_info
> >>> *vrp, struct device *dev,
> >>>           dev_warn_ratelimited(dev, "msg received with no recipient\n");
> >>>         /* publish the real size of the buffer */
> >>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
> >>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
> >>>         /* add the buffer back to the remote processor's virtqueue */
> >>>       err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
> >>> @@ -824,6 +824,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>       int err = 0, i;
> >>>       size_t total_buf_space;
> >>>       bool notify;
> >>> +    u16 version;
> >>>         vrp = kzalloc_obj(*vrp);
> >>>       if (!vrp)
> >>> @@ -855,9 +856,41 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>       else
> >>>           vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
> >>>   -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
> >>> +    /*
> >>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
> >>> +     * size from virtio device config space from the resource table.
> >>> +     * If the feature is not supported, then assign default buf size.
> >>> +     */
> >>> +    if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
> >>> +        /* note: virtio_rpmsg_config is defined from remote view */
> >>> +        version = 0;
> >>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
> >>> +                 version, &version);
> >>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
> >>> +                 txbuf_size, &vrp->rx_buf_size);
> >>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
> >>> +                 rxbuf_size, &vrp->tx_buf_size);
> >>> +
> >>
> >> A check is also needed to make sure the version received from the
> >> resource table
> >> is '0'.
> 
> I think we should start with versaion = 1. So, can I check the version
> number for 1 ?

I've been thinking about that and I agree it should be something else than '0'.
Since we have a u16, I suggest to make bit 15-8 a magic number (surprise us!)
and bit 7-0 the actual version number.

> 
> >>
> >>> +        /* The buffers must hold at least the rpmsg header */
> >>> +        if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
> >>> +            vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
> >>> +            dev_err(&vdev->dev,
> >>> +                "bad vdev config: rx buf sz = %d, tx buf sz = %d\n",
> >>> +                vrp->rx_buf_size, vrp->tx_buf_size);
> >>> +            err = -EINVAL;
> >>> +            goto vqs_del;
> >>> +        }
> >>> +
> >>> +        dev_dbg(&vdev->dev,
> >>> +            "vdev config: version=%d, rx buf sz = 0x%x, tx buf sz =
> >>> 0x%x\n",
> >>> +            version, vrp->rx_buf_size, vrp->tx_buf_size);
> >>> +    } else {
> >>> +        vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> >>> +        vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> >>> +    }
> >>>   -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
> >>> >buf_size;
> >>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> >>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
> >>>         /* allocate coherent memory for the buffers */
> >>>       bufs_va = dma_alloc_coherent(vdev->dev.parent,
> >>> @@ -875,14 +908,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>       vrp->rx_bufs = bufs_va;
> >>>         /* and second part is dedicated for TX */
> >>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
> >>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
> >>>         /* set up the receive buffers */
> >>>       for (i = 0; i < vrp->num_rx_buf; i++) {
> >>>           struct scatterlist sg;
> >>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
> >>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
> >>>   -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
> >>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
> >>>             err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
> >>>                         GFP_KERNEL);
> >>> @@ -965,8 +998,8 @@ static int rpmsg_remove_device(struct device
> >>> *dev, void *data)
> >>>   static void rpmsg_remove(struct virtio_device *vdev)
> >>>   {
> >>>       struct virtproc_info *vrp = vdev->priv;
> >>> -    unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
> >>> -    size_t total_buf_space = num_bufs * vrp->buf_size;
> >>> +    size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> >>> +                 (vrp->num_tx_buf * vrp->tx_buf_size);
> >>>       int ret;
> >>>         virtio_reset_device(vdev);
> >>> @@ -992,6 +1025,7 @@ static struct virtio_device_id id_table[] = {
> >>>     static unsigned int features[] = {
> >>>       VIRTIO_RPMSG_F_NS,
> >>> +    VIRTIO_RPMSG_F_BUFSZ,
> >>>   };
> >>>     static struct virtio_driver virtio_ipc_driver = {
> >>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/
> >>> rpmsg/virtio_rpmsg.h
> >>> new file mode 100644
> >>> index 000000000000..285918be68b9
> >>> --- /dev/null
> >>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> >>> @@ -0,0 +1,27 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0 */
> >>> +/*
> >>> + * Copyright (C) Pinecone Inc. 2019
> >>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
> >>> + * Copyright (C) Advanced Micro Devices, Inc.
> >>> + */
> >>> +
> >>> +#ifndef _LINUX_VIRTIO_RPMSG_H
> >>> +#define _LINUX_VIRTIO_RPMSG_H
> >>> +
> >>> +#include <linux/types.h>
> >>> +#include <linux/virtio_types.h>
> >>> +
> >>> +/* The feature bitmap for virtio rpmsg */
> >>> +#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
> >>> notifications */
> >>> +#define VIRTIO_RPMSG_F_BUFSZ    1 /* RP get buffer size from config
> >>> space */
> >>> +
> >>> +struct virtio_rpmsg_config {
> >>> +    __virtio16 version;
> >>> +    /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
> >>> +    __virtio32 txbuf_size;
> >>> +    __virtio32 rxbuf_size;
> >>> +    __virtio32 reserved[14]; /*: Reserve for the future use */
> >>
> >> 66 byte for the configuratio space?  I'm puzzled about the
> >> reserved[14], how did
> >> you come up with that number?
> 
> I kept the reserved bytes from the original series as it is. The
> original series did not contain version field. With version I don't
> think we need reserved field at all. At best, if we want to append
> padding bytes, then I think __virtio16 reserved; makes sense. That will
> make the structure aligned to 4 byte.
> 
> > 
> > Is it useful to define the reserved field?
> 
> I think reserved field is only useful to keep the structure size aligned
> to 4 bytes.
> 
> > The version should allow us to determine the content.
> 
> Correct, but I think the structure can be aligned if used correct
> reserved bytes.
> 
> > An other solution is to introduce a'size' field to determine the size of
> > the structure:
> 
> I think, the resource table already contains config_len field which is
> size of the structure:
> 
> https://github.com/torvalds/linux/blob/27fa82620cbaa89a7fc11ac3057701d598813e87/include/linux/remoteproc.h#L275
> 
> > struct virtio_rpmsg_config {
> >     __virtio16 version;
> >     __virtio16 size; /* size of the configuration space */
> >     /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
> >     __virtio32 txbuf_size;
> >     __virtio32 rxbuf_size;
> >     __u8 private[0]; /* customized config */
> 
> Do we need customized config? I think I should remove this comment from
> the original patch as well.
> 
> Thanks,
> Tanmay
> 
> > };
> > 
> >>
> >> The rest looks good to me.
> >>
> > 
> > Looks good to me too.
> > 
> > Thanks,
> > Arnaud
> > 
> >>> +    /* Put the customize config here */
> >>> +} __packed;
> >>> +
> >>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> >>> -- 
> >>> 2.34.1
> >>>
> > 
> 
