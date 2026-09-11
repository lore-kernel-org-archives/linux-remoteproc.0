Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1D735F163
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Sep 2026 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138674; cv=none; b=gcuvJCprcUSDtcWgN/exA1WRVCJfrEyIEaBZ6Cjlz/JlX9HwqmWB1WWPe3kC7nN9QRAseTnu+2N4NBq2qGQ6RPjZ2nciGIqa5WfvidL1C0MaqccpyHwyggutguRtn+jufcdL5l9RAG4VGSdpDW2449qK75fGKwkgOQ5Euy+VWDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138674; c=relaxed/simple;
	bh=D/cqQW3YEor1RaVzk6JWcbIBIdJAe18Cvto2+OHn1DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWQczJDUVQiD94SQaAHkIvoZ0/uRdQBAqtpCDrlNSt2MzPsoa2yBhO5zXnQLn4z9/OJYAeMgWvLTeNulDREqwW/LW4Vp+UwQKipPsepMLS8Sf/dT1nOxheTuD9hVTSYHV6WtjgAnmtPFoaQ6ydo8BNg4+hZDay164XJS2bYk9j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j4nHvQn0; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4nHvQn0"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-85377c8bc96so953996b3a.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Sep 2026 07:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789138672; x=1789743472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mTItDG+SPCPjDvjs6iUyky113T76JdD5XYB7K8F6/zA=;
        b=j4nHvQn0RoMecy5tamdWgBjUaMGJBPqqgv/4qocaC35l5RDnd6yxydUCRM/eXCSkld
         HbrME+vqlbmiY6reNRUjbOiK5N9rwwIj8mij0VsszC7oTdXD991Eivz22CM5NIt3du2w
         057LMLJnA5LRlCUec+8c5MZBG3BKkvyrcPBfxyPMXHv26+A0JfTbklo/iK1SO8TGV6L8
         p8E8gBPuNCIzwT0smW6vzCpdi4wahupT0GraclYN9b/uAPBRgERzhTgVvu65sptR3DDD
         99DVa1y9DM1ot4uSvaTmkeJOwD/HLWojd6SZpLSxyQ5jC9G/NwXl2F1+TzM1AFu8IwoB
         8rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789138672; x=1789743472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTItDG+SPCPjDvjs6iUyky113T76JdD5XYB7K8F6/zA=;
        b=FV/6sOzMVlsAP3pUj8IiMHYZsPhueQLPbFV8nWFULQ5+mTZ0a8EyVeH1ShboSHc1KT
         uD/o7/zxKz6Wg2u6CTty7bLQvrKF8WqefZCxmJNhpW2S2Q2F6WBfWfLb6Ar+tuHK8j9F
         TdolzHDVrw/C2ExZfKqJfu4RKAFgIl7HsSqhBJFE/YfeGw1zI+7Utxu36yotVh8Y+aWg
         ZxmzsQoXJl47rPvDdQKoVZ+8x2sMO7hxZHTFS4UilehZMfptzAwCEvr3N9pZbqgBXvh+
         0AiR/BrYldqum5tRtiBQY5Fgzsahl1F7xqHbxQZsGzX0sSHG7ZqRePKQS5+QwvO/b1C9
         0ojg==
X-Forwarded-Encrypted: i=1; AKwUvBxj2m2D3htV6P+bX9zPbmI0dBgaJOlKJA0astenbN77Ipf3pNCCCTp4246KVam/JMYP59i0licGL5BgfuECidTf@vger.kernel.org
X-Gm-Message-State: AFuF++k8Y2VSfzKa/bsOTx8PYNcADpSw5qLlIs9f5Qt0T4BptrMQdmoO
	i5HDuReq7xXryPgg2Xxo+h5YxsO/SC7Bmllrgw4LLgSYLldER5raQHampIjpSdzJq38=
X-Gm-Gg: AYBFou3yW3ZbpQ9+WWPulgHmVpXDoduoFyaoNyAqA2ZGVRNiz2Pn/h4GzEdyZKUG+BJ
	Mm/dPzUUIm1ZQXFCZi2/meo8XL2FE9c6gQbEVPlR5GnU+E4w7q2Fr4nDi9IoCv12QR4QqnuRUQz
	CUF0NjgpMwA+yFuykUTXUdSXiMxcxWK9o/wdf33IAUq3FUW9HC/tZhWwu9DA3lkLESVraqXJRlO
	ctoedQOMd/y3vzIsfE46TYMI01PXlSYmRT92jwcZcKPbR1NSFdWGiW7YyzYwLZDshrqGniWtycr
	o4IoMwj5czMExvcwwzKsiJbUlk2QbdBQ7CjmkwEhESkYQHw9OhGxsKhtf7+HTxvIYNvV2rri7iG
	POyO6ujzR8rdPQQ9S+CI2MnQr14fZrRENrJuAx06cbMTe2JD0USfWlsOv7tj5WTdatBjCu2h5sT
	D/NNxtZql7h2tO3Gzyveas2/pvNgg0UXa8+eHlpnUqGdNW8y6qsej6t4/D1Em/JQ/+XKVGXp1XS
	i4=
X-Received: by 2002:a05:6a00:981:b0:861:2029:4f59 with SMTP id d2e1a72fcca58-86b2eaf0dd9mr7157609b3a.3.1789138672154;
        Fri, 11 Sep 2026 07:57:52 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:bb01:88ad:cfcb:1cee])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb933sm1259021b3a.41.2026.09.11.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:57:51 -0700 (PDT)
Date: Fri, 11 Sep 2026 08:57:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: add acknowledged vdev
 reset
Message-ID: <aqQW7eOsFE7jRTXT@p14s>
References: <20260902214453.634339-2-tanmay.shah@amd.com>
 <aqBNoaF7m_JEiVYY@p14s>
 <281ad636-7963-43ad-b88a-8a196eab217b@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <281ad636-7963-43ad-b88a-8a196eab217b@amd.com>

On Tue, Sep 08, 2026 at 02:21:53PM -0500, Shah, Tanmay wrote:
> Hello,
> 
> Thank you for the reviews.
> 
> On 9/8/2026 1:02 PM, Mathieu Poirier wrote:
> > Good day,
> > 
> > On Wed, Sep 02, 2026 at 02:44:54PM -0700, Tanmay Shah wrote:
> >> The existing remoteproc virtio reset path clears the vdev status locally
> >> without notifying the remote processor. As a result, the host cannot tell
> >> whether the remote side has observed the reset request or completed its
> >> cleanup.
> >>
> >> Add a new resource type, RSC_VDEV_V2, for virtio vdevs that support an
> >> acknowledged reset protocol. For these resources, encode a reset request
> >> in the virtio status byte, kick the remote processor using the vdev notify
> >> ID, and wait for the remote side to clear the status back to 0.
> >>
> >> Keep the existing RSC_VDEV behavior for backwards compatibility by
> >> clearing the status locally. Also reset remoteproc-created virtio
> >> devices before unregistering them, and expose RSC_VDEV_V2 reset state
> >> in debugfs.
> >>
> >> Assisted-by: Codex:GPT-5
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c     |  3 +-
> >>  drivers/remoteproc/remoteproc_debugfs.c  | 29 +++++++++++++++-
> >>  drivers/remoteproc/remoteproc_internal.h | 21 +++++++++++
> >>  drivers/remoteproc/remoteproc_virtio.c   | 44 ++++++++++++++++++++++--
> >>  include/linux/rsc_table.h                |  5 ++-
> >>  5 files changed, 97 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index 1ed406714849..31d79684977c 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -471,6 +471,7 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> >>  static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >>  			     int offset, int avail)
> >>  {
> >> +	struct fw_rsc_hdr *hdr = ptr - sizeof(*hdr);
> > 
> > Spurious change.
> > 
> 
> Ack will remove it.
> 
> >>  	struct fw_rsc_vdev *rsc = ptr;
> >>  	struct device *dev = &rproc->dev;
> >>  	struct rproc_vdev *rvdev;
> >> @@ -485,7 +486,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >>  		return -EINVAL;
> >>  	}
> >>  
> >> -	/* make sure reserved bytes are zeroes */
> > 
> > Same
> 
> Ack, will be removed.
> 
> > 
> >>  	if (rsc->reserved[0] || rsc->reserved[1]) {
> >>  		dev_err(dev, "vdev rsc has non zero reserved bytes\n");
> >>  		return -EINVAL;
> >> @@ -1009,6 +1009,7 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
> >>  	[RSC_DEVMEM] = rproc_handle_devmem,
> >>  	[RSC_TRACE] = rproc_handle_trace,
> >>  	[RSC_VDEV] = rproc_handle_vdev,
> >> +	[RSC_VDEV_V2] = rproc_handle_vdev,
> >>  };
> >>  
> >>  struct rproc_rsc_cb_data {
> >> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> >> index b86c1d09c70c..1fe99749f5b4 100644
> >> --- a/drivers/remoteproc/remoteproc_debugfs.c
> >> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> >> @@ -274,7 +274,7 @@ static const struct file_operations rproc_crash_ops = {
> >>  /* Expose resource table content via debugfs */
> >>  static int rproc_rsc_table_show(struct seq_file *seq, void *p)
> >>  {
> >> -	static const char * const types[] = {"carveout", "devmem", "trace", "vdev"};
> >> +	static const char * const types[] = {"carveout", "devmem", "trace", "vdev", "vdev_v2"};
> >>  	struct rproc *rproc = seq->private;
> >>  	struct resource_table *table = rproc->table_ptr;
> >>  	struct fw_rsc_carveout *c;
> >> @@ -336,6 +336,33 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
> >>  			seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
> >>  				   v->reserved[0], v->reserved[1]);
> >>  
> >> +			for (j = 0; j < v->num_of_vrings; j++) {
> >> +				seq_printf(seq, "  Vring %d\n", j);
> >> +				seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
> >> +				seq_printf(seq, "    Alignment %d\n", v->vring[j].align);
> >> +				seq_printf(seq, "    Number of buffers %d\n", v->vring[j].num);
> >> +				seq_printf(seq, "    Notify ID %d\n", v->vring[j].notifyid);
> >> +				seq_printf(seq, "    Physical Address 0x%x\n\n",
> >> +					   v->vring[j].pa);
> >> +			}
> >> +			break;
> >> +		case RSC_VDEV_V2:
> >> +			v = rsc;
> >> +			seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
> >> +
> >> +			seq_printf(seq, "  ID %d\n", v->id);
> >> +			seq_printf(seq, "  Notify ID %d\n", v->notifyid);
> >> +			seq_printf(seq, "  Device features 0x%x\n", v->dfeatures);
> >> +			seq_printf(seq, "  Guest features 0x%x\n", v->gfeatures);
> >> +			seq_printf(seq, "  Config length 0x%x\n", v->config_len);
> >> +			seq_printf(seq, "  Status 0x%x\n", v->status);
> >> +			seq_printf(seq, "  Number of vrings %d\n", v->num_of_vrings);
> >> +			seq_printf(seq, "  Reset request pending %s\n",
> >> +				   rproc_rsc_vdev_reset_requested(v->status) ?
> >> +				   "yes" : "no");
> >> +			seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
> >> +				   v->reserved[0], v->reserved[1]);
> >> +
> >>  			for (j = 0; j < v->num_of_vrings; j++) {
> >>  				seq_printf(seq, "  Vring %d\n", j);
> >>  				seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
> >> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> >> index 3a742ef6ef60..f07a96ff82a4 100644
> >> --- a/drivers/remoteproc/remoteproc_internal.h
> >> +++ b/drivers/remoteproc/remoteproc_internal.h
> >> @@ -14,6 +14,7 @@
> >>  
> >>  #include <linux/irqreturn.h>
> >>  #include <linux/firmware.h>
> >> +#include <linux/virtio_config.h>
> >>  #ifdef CONFIG_HAS_IOMEM
> >>  #include <linux/io.h>
> >>  #endif
> >> @@ -42,6 +43,26 @@ struct rproc_vdev_data {
> >>  	struct fw_rsc_vdev *rsc;
> >>  };
> >>  
> >> +/*
> >> + * RSC_VDEV_V2 requests an acknowledged reset by writing an otherwise
> >> + * impossible virtio status pattern: DRIVER and FAILED set while
> >> + * ACKNOWLEDGE is clear. Other status bits are left unchanged.
> >> + */
> >> +static inline u8 rproc_rsc_vdev_reset_status(u8 status)
> >> +{
> >> +	status |= VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_FAILED;
> >> +	status &= ~VIRTIO_CONFIG_S_ACKNOWLEDGE;
> >> +
> >> +	return status;
> >> +}
> >> +
> >> +static inline bool rproc_rsc_vdev_reset_requested(u8 status)
> >> +{
> >> +	return !(status & VIRTIO_CONFIG_S_ACKNOWLEDGE) &&
> >> +	       (status & VIRTIO_CONFIG_S_DRIVER) &&
> >> +	       (status & VIRTIO_CONFIG_S_FAILED);
> >> +}
> >> +
> >>  static inline bool rproc_has_feature(struct rproc *rproc, unsigned int feature)
> >>  {
> >>  	return test_bit(feature, rproc->features);
> >> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> >> index d5e9ff045a28..e682caa546b2 100644
> >> --- a/drivers/remoteproc/remoteproc_virtio.c
> >> +++ b/drivers/remoteproc/remoteproc_virtio.c
> >> @@ -13,6 +13,7 @@
> >>  #include <linux/dma-map-ops.h>
> >>  #include <linux/dma-mapping.h>
> >>  #include <linux/export.h>
> >> +#include <linux/iopoll.h>
> >>  #include <linux/of_reserved_mem.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/remoteproc.h>
> >> @@ -234,12 +235,48 @@ static void rproc_virtio_set_status(struct virtio_device *vdev, u8 status)
> >>  static void rproc_virtio_reset(struct virtio_device *vdev)
> >>  {
> >>  	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
> >> +	struct rproc *rproc = rvdev->rproc;
> >>  	struct fw_rsc_vdev *rsc;
> >> +	struct fw_rsc_hdr *hdr;
> >> +	int ret;
> >> +	u8 val;
> >> +
> >> +	/*
> >> +	 * During crash recovery, vdev can be stopped. But the driver can't reset
> >> +	 * the device, as device is already crashed. In this case, reset becomes
> >> +	 * no op.
> >> +	 */
> >> +	if (rproc->state == RPROC_CRASHED)
> >> +		return;
> >>  
> >>  	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
> >> +	hdr = (void *)rsc - sizeof(*hdr);
> >> +
> >> +	if (hdr->type == RSC_VDEV_V2) {
> >> +		/*
> >> +		 * RSC_VDEV_V2 encodes an acknowledged reset request in the
> >> +		 * status byte. The remote is expected to complete the reset
> >> +		 * and then clear status back to 0.
> >> +		 */
> >> +		rsc->status = rproc_rsc_vdev_reset_status(rsc->status);
> >> +
> >> +		/* after setting reset request, kick the device */
> >> +		rproc->ops->kick(rproc, rsc->notifyid);
> >>  
> >> -	rsc->status = 0;
> >> -	dev_dbg(&vdev->dev, "reset !\n");
> >> +		/*
> >> +		 * When device completes reset, it is expected to set status
> >> +		 * to 0.
> >> +		 */
> >> +		ret = readb_poll_timeout(&rsc->status, val, val == 0,
> >> +					 1000,      /* 1ms between reads */
> >> +					 3000000);  /* 3s total timeout */
> >> +		if (ret)
> >> +			dev_warn(&vdev->dev, "vdev reset timed out\n");
> > 
> > The problem here is that we are introducing behavior that is not compliant with
> > the virtio specifications.  One way to acheive the same behavior could be for
> > the remote processor to check rsc->status before sending a interrupt of using
> > the virtqueues.
> > 
> 
> That is what remote is supposed to do. But what if remote do not
> respond? If remote is deadlocked for some reason, then the Linux will
> hang at this point too. That is why we need some kind of timeout.

If the remote is dead then a watchdog timer should fire at some point.
Moreover, that situation won't be different from other circumstances where a
remote processor locks up.

Looking at your patch, sending a kick() won't do anything for a dead remote
processor.  If the remote processor is alive, it should monitor rsc->status and
take action when it is set to '0' by the host.  If it is locked-up, the normal
lockup procedure should apply.

I'm not sure what problem this patch is trying to address.

> 
> I think timeout mechanism is better for AMP systems over waiting forever
> for remote to clear the status.
> 
> Thanks,
> Tanmay
> 
> 
> >> +	} else {
> >> +		/* back compatible for RSC_VDEV type of rsc vdev */
> >> +		rsc->status = 0;
> >> +	}
> >> +	dev_info(&vdev->dev, "reset !\n");
> >>  }
> >>  
> >>  /* provide the vdev features as retrieved from the firmware */
> >> @@ -469,6 +506,9 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
> >>  {
> >>  	struct virtio_device *vdev = dev_to_virtio(dev);
> >>  
> >> +	/* reset virtio device before unregister */
> >> +	virtio_reset_device(vdev);
> >> +
> > 
> > Regardless of this feature, I think it is wise to reset the device before
> > unregistering with the virtio subsystem.
> > 
> 
> Agreed. I intend to keep this.
> 
> > Thanks,
> > Mathieu 
> > 
> >>  	unregister_virtio_device(vdev);
> >>  	return 0;
> >>  }
> >> diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
> >> index 71b60125310e..2398a6d7033e 100644
> >> --- a/include/linux/rsc_table.h
> >> +++ b/include/linux/rsc_table.h
> >> @@ -66,6 +66,8 @@ struct fw_rsc_hdr {
> >>   *		    the remote processor will be writing logs.
> >>   * @RSC_VDEV:       declare support for a virtio device, and serve as its
> >>   *		    virtio header.
> >> + * @RSC_VDEV_V2:    declare support for a virtio device whose reset request is
> >> + *		    encoded in the virtio status byte.
> >>   * @RSC_LAST:       just keep this one at the end of standard resources
> >>   * @RSC_VENDOR_START:	start of the vendor specific resource types range
> >>   * @RSC_VENDOR_END:	end of the vendor specific resource types range
> >> @@ -83,7 +85,8 @@ enum fw_resource_type {
> >>  	RSC_DEVMEM		= 1,
> >>  	RSC_TRACE		= 2,
> >>  	RSC_VDEV		= 3,
> >> -	RSC_LAST		= 4,
> >> +	RSC_VDEV_V2		= 4,
> >> +	RSC_LAST		= 5,
> >>  	RSC_VENDOR_START	= 128,
> >>  	RSC_VENDOR_END		= 512,
> >>  };
> >>
> >> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
> >> -- 
> >> 2.43.0
> >>
> 
