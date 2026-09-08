Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A2249CF37
	for <linux-remoteproc@vger.kernel.org>; Tue,  8 Sep 2026 18:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890535; cv=none; b=j1GNr5o+D7/p5GLef95voDmAcP1HI7+LwRbDywRI0JLRlwvATsv2uv4b/FG31kNfc6lvZJ6lLMNSoDMMlZpBL7asdlZ19I4suHPFEVvHiU3pFJFYrH/nWSlGhS1H/fBBnknDWMRRZemBf/zsb4RHjInPE4aokZ6CXHtMa6FOUgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890535; c=relaxed/simple;
	bh=vkByFvx/xSRJDZge4ztLdHppOqU3iMImUjgSHZMGaQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vo0WdM0ZwyknPFkS2uApHDWxdQ8LpQPixxmG4fUQFsSg21o0ljAqhuSAr1DsiZ2HcFdCCYJDcD7dzBHTushTtfB0buJ2LgTgyoaE7MwMwJE/0eO2SvtnGvOGL4zz55IA6INItZEUyRiFW9qFg6PgIbUPdgNpBcveNDWUG7zJmXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IGUCJFNB; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IGUCJFNB"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38759bcd877so5177780a91.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Sep 2026 11:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788890532; x=1789495332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bkSweG2AjV1rpphqtQ+x4kgo6UUQ9p9UEyix7QWjvg=;
        b=IGUCJFNBJHXQQ1x7Rzmmw5FXirYqHPAj/uaIvCEvzf9ZGqq61SOLe7mSKHNrsSA4EH
         nUh8BvmvgJySHMnZ+8s8K85ly0g6qP+Ip8C594vpSA/MZ9SHpMJb4JqBPVFU/Fu0mNxb
         eb0Xss+Vq22eFvz03R86iv/DdYJAN58IfI18IjbvydagtzbD/6hgMOF8RF36pSOaWKvX
         pAB4bgV7h4YETGmHza9YASc+LOlAa3PvhJz9m4AMJmtBnjL9atqeOMHZrgNGC+6GVuDD
         NwOgiqcYWjMQJ7lsei07CSaYttQ2JKTzdC7+JbLsjkWLbvWKV3Nlo6BCoFynAwi17IaQ
         SDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890532; x=1789495332;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bkSweG2AjV1rpphqtQ+x4kgo6UUQ9p9UEyix7QWjvg=;
        b=CuJDcPUsdxv5/BTf0jqKEyUfbogLJNpR8M7bpU9/fArKho/WZYf6IM8y1ObLsgRvNu
         bHdDvc221nWUBm9eRXMYyePo1Rjpqmj3WG0YkhccxG1Wo1CSIuOcp11cIa/VFBmL93qM
         g3seLffmOAEDy5M59fPkLn8jb59dXOt+fEge/3C1onos34uqMit7OcDecbLjSkvSDs/e
         24R8gKDf9H36E3ZyEzT6E8/ga2udQvl9JL10t7DnddrnjRYiv1aItwSdQGWX32TNdVtl
         OohXmnyCzRAxeTeZHtRJPMn9Ge7oWUl5xliAtsf6whQuraF3R+9/lcU7wS6b4cSqb+06
         KrAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKUldiID2RI2sVXJFMimFIShU4kkXk9VvhabBL/NK2zSyXwlccO8CNWnyeAHNmk0d49X/kKFceGnlh6X9H6Cri@vger.kernel.org
X-Gm-Message-State: AFuF++np0aBs/wG8rcIw4EUsFbBqm2GmEBBqAEBPUVyluK5hnqi1NTSz
	qcVhr07wL1DrTjIwE92Y3MlWd5+wR2rH3qlb6BXg08xQcgtCdbWklVx762oFHAfTT/o=
X-Gm-Gg: AYBFou01ISGf2dkM8+MCfTi47h+gaext9xdHwQkqW5JU71QOj0YHuPgY+0XZ6WazQd2
	Up6iRtbV4zPro4G6LxbqeXkIJbknBbHbwvJ/sIt3uhyDPqkkZadPnJt1pLYsRK+jvlBHW0K9pMY
	He0GdOXPGLwMM2zOcrg5O0IWNHUikc7tJ/8yyh6He2kQwQzzOdkYJ3i4G6PzvJRBuRYLb6brTOY
	wZu/3aBoViJy/hMoAUoMnyZS4Hlgrve/Fb41FuQB0i0UNoOhDJHV7KFUJSC1i95GakqkjZedada
	1zxjNvfwrhEdqUNk9duERj8ky0kr8vYN1d10a8x5jxiwovvLApYrlKGf+plEZO3YnK1h7J1yHHQ
	e7XsifYFw2vGJd/b+W/IExpENREXZSXUwD/kjMOsTIZWI2lYEHt8/duwTc+PXbxx4dkJobiVoG+
	zhJWQQh9P+H2e8o3ciu4qLKLG9/w8GvUlWr9Ysr7aIQjG3LsgtyYcKCLk/cV9eENkQvt+4AEcxb
	3M=
X-Received: by 2002:a17:90b:3b8d:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39b2624f10amr44409664a91.22.1788890531955;
        Tue, 08 Sep 2026 11:02:11 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:14af:4aef:7bc8:f5bc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f8d2c5sm28055519a91.2.2026.09.08.11.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:02:11 -0700 (PDT)
Date: Tue, 8 Sep 2026 12:02:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: add acknowledged vdev
 reset
Message-ID: <aqBNoaF7m_JEiVYY@p14s>
References: <20260902214453.634339-2-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902214453.634339-2-tanmay.shah@amd.com>

Good day,

On Wed, Sep 02, 2026 at 02:44:54PM -0700, Tanmay Shah wrote:
> The existing remoteproc virtio reset path clears the vdev status locally
> without notifying the remote processor. As a result, the host cannot tell
> whether the remote side has observed the reset request or completed its
> cleanup.
> 
> Add a new resource type, RSC_VDEV_V2, for virtio vdevs that support an
> acknowledged reset protocol. For these resources, encode a reset request
> in the virtio status byte, kick the remote processor using the vdev notify
> ID, and wait for the remote side to clear the status back to 0.
> 
> Keep the existing RSC_VDEV behavior for backwards compatibility by
> clearing the status locally. Also reset remoteproc-created virtio
> devices before unregistering them, and expose RSC_VDEV_V2 reset state
> in debugfs.
> 
> Assisted-by: Codex:GPT-5
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/remoteproc_core.c     |  3 +-
>  drivers/remoteproc/remoteproc_debugfs.c  | 29 +++++++++++++++-
>  drivers/remoteproc/remoteproc_internal.h | 21 +++++++++++
>  drivers/remoteproc/remoteproc_virtio.c   | 44 ++++++++++++++++++++++--
>  include/linux/rsc_table.h                |  5 ++-
>  5 files changed, 97 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 1ed406714849..31d79684977c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -471,6 +471,7 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
>  static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  			     int offset, int avail)
>  {
> +	struct fw_rsc_hdr *hdr = ptr - sizeof(*hdr);

Spurious change.

>  	struct fw_rsc_vdev *rsc = ptr;
>  	struct device *dev = &rproc->dev;
>  	struct rproc_vdev *rvdev;
> @@ -485,7 +486,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  		return -EINVAL;
>  	}
>  
> -	/* make sure reserved bytes are zeroes */

Same

>  	if (rsc->reserved[0] || rsc->reserved[1]) {
>  		dev_err(dev, "vdev rsc has non zero reserved bytes\n");
>  		return -EINVAL;
> @@ -1009,6 +1009,7 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
>  	[RSC_DEVMEM] = rproc_handle_devmem,
>  	[RSC_TRACE] = rproc_handle_trace,
>  	[RSC_VDEV] = rproc_handle_vdev,
> +	[RSC_VDEV_V2] = rproc_handle_vdev,
>  };
>  
>  struct rproc_rsc_cb_data {
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index b86c1d09c70c..1fe99749f5b4 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -274,7 +274,7 @@ static const struct file_operations rproc_crash_ops = {
>  /* Expose resource table content via debugfs */
>  static int rproc_rsc_table_show(struct seq_file *seq, void *p)
>  {
> -	static const char * const types[] = {"carveout", "devmem", "trace", "vdev"};
> +	static const char * const types[] = {"carveout", "devmem", "trace", "vdev", "vdev_v2"};
>  	struct rproc *rproc = seq->private;
>  	struct resource_table *table = rproc->table_ptr;
>  	struct fw_rsc_carveout *c;
> @@ -336,6 +336,33 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
>  			seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
>  				   v->reserved[0], v->reserved[1]);
>  
> +			for (j = 0; j < v->num_of_vrings; j++) {
> +				seq_printf(seq, "  Vring %d\n", j);
> +				seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
> +				seq_printf(seq, "    Alignment %d\n", v->vring[j].align);
> +				seq_printf(seq, "    Number of buffers %d\n", v->vring[j].num);
> +				seq_printf(seq, "    Notify ID %d\n", v->vring[j].notifyid);
> +				seq_printf(seq, "    Physical Address 0x%x\n\n",
> +					   v->vring[j].pa);
> +			}
> +			break;
> +		case RSC_VDEV_V2:
> +			v = rsc;
> +			seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
> +
> +			seq_printf(seq, "  ID %d\n", v->id);
> +			seq_printf(seq, "  Notify ID %d\n", v->notifyid);
> +			seq_printf(seq, "  Device features 0x%x\n", v->dfeatures);
> +			seq_printf(seq, "  Guest features 0x%x\n", v->gfeatures);
> +			seq_printf(seq, "  Config length 0x%x\n", v->config_len);
> +			seq_printf(seq, "  Status 0x%x\n", v->status);
> +			seq_printf(seq, "  Number of vrings %d\n", v->num_of_vrings);
> +			seq_printf(seq, "  Reset request pending %s\n",
> +				   rproc_rsc_vdev_reset_requested(v->status) ?
> +				   "yes" : "no");
> +			seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
> +				   v->reserved[0], v->reserved[1]);
> +
>  			for (j = 0; j < v->num_of_vrings; j++) {
>  				seq_printf(seq, "  Vring %d\n", j);
>  				seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 3a742ef6ef60..f07a96ff82a4 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -14,6 +14,7 @@
>  
>  #include <linux/irqreturn.h>
>  #include <linux/firmware.h>
> +#include <linux/virtio_config.h>
>  #ifdef CONFIG_HAS_IOMEM
>  #include <linux/io.h>
>  #endif
> @@ -42,6 +43,26 @@ struct rproc_vdev_data {
>  	struct fw_rsc_vdev *rsc;
>  };
>  
> +/*
> + * RSC_VDEV_V2 requests an acknowledged reset by writing an otherwise
> + * impossible virtio status pattern: DRIVER and FAILED set while
> + * ACKNOWLEDGE is clear. Other status bits are left unchanged.
> + */
> +static inline u8 rproc_rsc_vdev_reset_status(u8 status)
> +{
> +	status |= VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_FAILED;
> +	status &= ~VIRTIO_CONFIG_S_ACKNOWLEDGE;
> +
> +	return status;
> +}
> +
> +static inline bool rproc_rsc_vdev_reset_requested(u8 status)
> +{
> +	return !(status & VIRTIO_CONFIG_S_ACKNOWLEDGE) &&
> +	       (status & VIRTIO_CONFIG_S_DRIVER) &&
> +	       (status & VIRTIO_CONFIG_S_FAILED);
> +}
> +
>  static inline bool rproc_has_feature(struct rproc *rproc, unsigned int feature)
>  {
>  	return test_bit(feature, rproc->features);
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index d5e9ff045a28..e682caa546b2 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -13,6 +13,7 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/export.h>
> +#include <linux/iopoll.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
> @@ -234,12 +235,48 @@ static void rproc_virtio_set_status(struct virtio_device *vdev, u8 status)
>  static void rproc_virtio_reset(struct virtio_device *vdev)
>  {
>  	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
> +	struct rproc *rproc = rvdev->rproc;
>  	struct fw_rsc_vdev *rsc;
> +	struct fw_rsc_hdr *hdr;
> +	int ret;
> +	u8 val;
> +
> +	/*
> +	 * During crash recovery, vdev can be stopped. But the driver can't reset
> +	 * the device, as device is already crashed. In this case, reset becomes
> +	 * no op.
> +	 */
> +	if (rproc->state == RPROC_CRASHED)
> +		return;
>  
>  	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
> +	hdr = (void *)rsc - sizeof(*hdr);
> +
> +	if (hdr->type == RSC_VDEV_V2) {
> +		/*
> +		 * RSC_VDEV_V2 encodes an acknowledged reset request in the
> +		 * status byte. The remote is expected to complete the reset
> +		 * and then clear status back to 0.
> +		 */
> +		rsc->status = rproc_rsc_vdev_reset_status(rsc->status);
> +
> +		/* after setting reset request, kick the device */
> +		rproc->ops->kick(rproc, rsc->notifyid);
>  
> -	rsc->status = 0;
> -	dev_dbg(&vdev->dev, "reset !\n");
> +		/*
> +		 * When device completes reset, it is expected to set status
> +		 * to 0.
> +		 */
> +		ret = readb_poll_timeout(&rsc->status, val, val == 0,
> +					 1000,      /* 1ms between reads */
> +					 3000000);  /* 3s total timeout */
> +		if (ret)
> +			dev_warn(&vdev->dev, "vdev reset timed out\n");

The problem here is that we are introducing behavior that is not compliant with
the virtio specifications.  One way to acheive the same behavior could be for
the remote processor to check rsc->status before sending a interrupt of using
the virtqueues.

> +	} else {
> +		/* back compatible for RSC_VDEV type of rsc vdev */
> +		rsc->status = 0;
> +	}
> +	dev_info(&vdev->dev, "reset !\n");
>  }
>  
>  /* provide the vdev features as retrieved from the firmware */
> @@ -469,6 +506,9 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
>  {
>  	struct virtio_device *vdev = dev_to_virtio(dev);
>  
> +	/* reset virtio device before unregister */
> +	virtio_reset_device(vdev);
> +

Regardless of this feature, I think it is wise to reset the device before
unregistering with the virtio subsystem.

Thanks,
Mathieu 

>  	unregister_virtio_device(vdev);
>  	return 0;
>  }
> diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
> index 71b60125310e..2398a6d7033e 100644
> --- a/include/linux/rsc_table.h
> +++ b/include/linux/rsc_table.h
> @@ -66,6 +66,8 @@ struct fw_rsc_hdr {
>   *		    the remote processor will be writing logs.
>   * @RSC_VDEV:       declare support for a virtio device, and serve as its
>   *		    virtio header.
> + * @RSC_VDEV_V2:    declare support for a virtio device whose reset request is
> + *		    encoded in the virtio status byte.
>   * @RSC_LAST:       just keep this one at the end of standard resources
>   * @RSC_VENDOR_START:	start of the vendor specific resource types range
>   * @RSC_VENDOR_END:	end of the vendor specific resource types range
> @@ -83,7 +85,8 @@ enum fw_resource_type {
>  	RSC_DEVMEM		= 1,
>  	RSC_TRACE		= 2,
>  	RSC_VDEV		= 3,
> -	RSC_LAST		= 4,
> +	RSC_VDEV_V2		= 4,
> +	RSC_LAST		= 5,
>  	RSC_VENDOR_START	= 128,
>  	RSC_VENDOR_END		= 512,
>  };
> 
> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
> -- 
> 2.43.0
> 
