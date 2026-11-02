Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639285;
	b=oebGK3fTQjInGwuiyDzswz8EtbrkNz0Uu19WyON3Jvy8uRAXNn8j17CAfTuTE0BFYE6Z
	 MexsseoI4up6IELqolbLS9xh4yWwbMv7FUu01lTMAI/EHkQ0fdfICvwbRnc4XEPT9plnz
	 bhcg+8b+HbqFfxRfajCDV1BZKYlJDej47SRWRaW13pOk9GouctVjy36FmlfO9TaY+ve6k
	 tSH4spvig+ZE6Bq9nHX6Vfgo2shTGxAvq6juYr1DxFB06qe+0D1OqqaR2NSn34p3TWXJy
	 6TFmr2oxrTmzupHSNh7dm6DQAF0NgoRyBpS7MfmgcgVuuA3xi0AsiI5yWS5rBEta5UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UYRlvkRRkqR/zP7OPgsHD/KjMLCppi5VVqe3sonPGkk=;
	b=oOXfA4ruB0F1Il7n8bX9lrvw7nX6ve09YIBnVzhn0ogy+DukF6r3lqrSF5EWqT84UybM
	 NWcjEIhA6h4c0n3UNDXQCU3dlj4zZ9LsXl7B4PHP5b8HwXslUCN4l5Yh/fouQAra7cUa4
	 kKx3zsC2lZJ8be2LIU5otKQ67jRY1tE+ue3OQyA50bGVUAtscKzjh/NHSK/xKx2RnxDTk
	 aC9zVgz2biARhOdiBlBCRdV7Ye9fjbJ7713P9cpna9EkpJtE6BOYupHjAr32hZeCJtBZy
	 G9mlxxiomPG6GlNcDuUEwFlbNT2ivdCqeXRfxj+t7mSLNYKCZW1GAiNritEpdhia17Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ly+YjSo9;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB736082BDD
	for <linux-remoteproc@vger.kernel.org>; Mon,  2 Nov 2026 17:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDB736082BDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ly+YjSo9
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so2753998a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Nov 2026 09:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793639284; x=1794244084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UYRlvkRRkqR/zP7OPgsHD/KjMLCppi5VVqe3sonPGkk=;
        b=ly+YjSo9964637Q5hZz/Zv59Lrh35CMU7QkyhFHdt3lLJxiQLhpxGS3oO8cB+3/fi0
         n7GT2duTeUNe4EDJhqitnHamRNLwtXzs6tRR1/uanV090tVxTNNSWRMQQTckkQrLtJ3o
         aw/cGq2kUKKfoVg455YMqIf98cutWa1BoGhN1IK4JMrw0Y/myCj87OBx/HfKO1Cka55X
         rzu1T5bx47CTU2VgvOasvq6kjrKagqCpgLSFcss7tWEqYM+IhyBP9Ua/nyd6gAHcNrn5
         MLYODtD/GYwX6ZyLytvcYNYo2UWr/mq3CNeRyqfrvaQrShfp4vr5E5oeCaYJuGlv+7Z5
         i4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639284; x=1794244084;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYRlvkRRkqR/zP7OPgsHD/KjMLCppi5VVqe3sonPGkk=;
        b=qjJeJp1LtJuBJ5WK9eQmuf+oxfXaYYJDfErU4I1K7xrqFnaYZ5D3CFRsRjHKR3b1hp
         RoDN5BmpPhyM77Ev8TTg7ETSsOE7fJPvJPxs8cGwfyOEMANNqnf9ryrwJxocKhUHGQhm
         vm3TwyZltf562rX85LRO2qpMs84fzPcvzwBvztp9kD2fkxnoSzgZ4ssN21eCHlYJd+1g
         wNReTy8WDTQwgCg8cU8jcdSVGTmGhay/B1Z4W3oO/KIgTqvsmPKqbmBZJdGXKFQmXZa9
         f4XDtjylf6pUqhVusL1tEtW3pdwhBaCeTZ1JcFHx/FxV/+xQ9QgOQlA2uF8P68lnqNgb
         9/9g==
X-Forwarded-Encrypted: i=1; AKwUvBzgb8wJrjsvSq3EtwWgv2VmC7FRoq3jxVTgQbUqW5cBUZOirbxkWmOsuKjtkh87Rx4ZRzRNysG66p2S6j2JZ7z9@vger.kernel.org
X-Gm-Message-State: APuU4Z9biT60a1SzxZS7g0NgaVbbfW1v6e/7gQEV1gg3oMX/LfkNAsJ0
	gwIrYcVHl/hDKceR398TLYOlFxV1se7Uxe0qgeRBShE5TOmPBmKcXnNuHz1iZjMI8ynujBD60uC
	75E0w
X-Gm-Gg: AYBFou1DEP4P6ahZjCEoeojAate9K1ADiNPdYJoE9y4/6jI7KULpgPYgSga/gNOBn9R
	G0AatDnlNngKSZmebj432LXkOgSYf5p8Nsz8QO27nUP5DNpbqw3UKSH2hLUiqgbzke2lxm5l6U4
	JuGsylmw86gNflcfzRZykoKlBWpfLWKpOuwPdsKDGg2NYqTpX6DYMoUX4AsTMdEGRfqnjd6FWrb
	iidpk6V+Cob2Yu/4yu8e03zJpUk8Xu3IhlJKDyfU1PtedmR7fb7fTgRUgK8BB3xqH9nAfWOML2Q
	bn6NBkpXb87X28Pg7P+mXmzk1J7NW9PcEAkPhW752cCfJ0ZiXw5UYQDb06Df8XtNT1pxU1fd+fR
	wBSHLl9WmJmjXN37tH1JenG/gsFZ62+rIHYIei5cuO4WwGKDoFDmPjR/B8bC/h2fj/ULmZT38/J
	ffPPKuwLnSckIFQwKUUT6fJVoKc4cGMVtzOcf/CtZeY4gjX0D5b9AiOyGkqdytSPhkGf82G1APn
	bn3LtEQDIskgXqnuLVdWwEQAWVzkBYg3M2KR03AjGpG0QPdygeBf8pbIp6UGXkVHu7xFiKISJ1V
	d/R4ofX47jDIjbMKKjL1TQEl3X9LIVk=
X-Received: by 2002:a17:90b:4b90:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3ae89851099mr8646712a91.52.1793639283927;
        Mon, 02 Nov 2026 09:08:03 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:810a:982d:b93e:e497])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7e1d3esm10064a91.3.2026.11.02.09.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:08:03 -0800 (PST)
Date: Mon, 2 Nov 2026 11:08:01 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: virtio: Synchronize virtqueue teardown
 with rproc_vq_interrupt()
Message-ID: <aujDcTjvpWbIJ8wm@p14s>
References: <20260926041943.1124650-1-oss.patchbox@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926041943.1124650-1-oss.patchbox@gmail.com>

Hi,

This patch doesn't apply on rproc-next - please rebase and resent.

Thanks,
Mathieu

On Sat, Sep 26, 2026 at 12:19:31AM -0400, Yuho Choi wrote:
> rproc_vq_interrupt() looks up rvring->vq and passes it to
> vring_interrupt() without synchronizing against __rproc_virtio_del_vqs(),
> which clears rvring->vq and frees the virtqueue. rproc_stop() and
> __rproc_detach() stop the subdevices, and so delete the virtqueues,
> before the remote processor is stopped or detached, so the remote can
> still signal a vring meanwhile. The interrupt path can then pass a NULL
> or already freed virtqueue to vring_interrupt().
> 
> Protect rvring->vq with SRCU: rproc_vq_interrupt() uses the virtqueue
> inside a read-side section, and __rproc_virtio_del_vqs() clears the
> pointers and waits for readers before freeing the virtqueues. Plain RCU
> is not usable because rproc_vq_interrupt() is also called from process
> context, where vring callbacks may sleep.
> 
> Fixes: 7a186941626d ("remoteproc: remove the single rpmsg vdev limitation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
> ---
> Changes in v2:
> - Rework the fix: v1 only loaded rvring->vq once, which closes the NULL
>   window but not the use-after-free once the virtqueue is freed after
>   the load (Mathieu Poirier). Use SRCU so __rproc_virtio_del_vqs()
>   waits for rproc_vq_interrupt() before freeing the virtqueues.
> - Update the subject accordingly.
> 
> v1: https://lore.kernel.org/all/20260922190159.509836-1-oss.patchbox@gmail.com/
> 
> Compile-tested only (arm64 and x86_64 defconfig + REMOTEPROC/RPMSG_VIRTIO, 
> W=1, sparse).
> 
>  drivers/remoteproc/remoteproc_virtio.c | 35 +++++++++++++++++++++-----
>  include/linux/remoteproc.h             |  2 +-
>  2 files changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index d5e9ff045a28a..cd8f3a8b4870a 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
> +#include <linux/srcu.h>
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
>  #include <linux/virtio_ids.h>
> @@ -26,6 +27,14 @@
>  
>  #include "remoteproc_internal.h"
>  
> +/*
> + * Protects rproc_vring->vq: rproc_vq_interrupt() uses the virtqueue inside a
> + * read-side section, and __rproc_virtio_del_vqs() waits for those sections to
> + * finish before freeing it. Sleepable RCU is used because vring callbacks may
> + * sleep when rproc_vq_interrupt() is called from process context.
> + */
> +DEFINE_STATIC_SRCU(rproc_vq_srcu);
> +
>  static int copy_dma_range_map(struct device *to, struct device *from)
>  {
>  	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
> @@ -88,15 +97,24 @@ static bool rproc_virtio_notify(struct virtqueue *vq)
>   */
>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int notifyid)
>  {
> +	irqreturn_t ret = IRQ_NONE;
>  	struct rproc_vring *rvring;
> +	struct virtqueue *vq;
> +	int idx;
>  
>  	dev_dbg(&rproc->dev, "vq index %d is interrupted\n", notifyid);
>  
>  	rvring = idr_find(&rproc->notifyids, notifyid);
> -	if (!rvring || !rvring->vq)
> +	if (!rvring)
>  		return IRQ_NONE;
>  
> -	return vring_interrupt(0, rvring->vq);
> +	idx = srcu_read_lock(&rproc_vq_srcu);
> +	vq = srcu_dereference(rvring->vq, &rproc_vq_srcu);
> +	if (vq)
> +		ret = vring_interrupt(0, vq);
> +	srcu_read_unlock(&rproc_vq_srcu, idx);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(rproc_vq_interrupt);
>  
> @@ -153,8 +171,8 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
>  
>  	vq->num_max = num;
>  
> -	rvring->vq = vq;
>  	vq->priv = rvring;
> +	rcu_assign_pointer(rvring->vq, vq);
>  
>  	/* Update vring in resource table */
>  	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
> @@ -168,11 +186,16 @@ static void __rproc_virtio_del_vqs(struct virtio_device *vdev)
>  	struct virtqueue *vq, *n;
>  	struct rproc_vring *rvring;
>  
> -	list_for_each_entry_safe(vq, n, &vdev->vqs, list) {
> +	list_for_each_entry(vq, &vdev->vqs, list) {
>  		rvring = vq->priv;
> -		rvring->vq = NULL;
> -		vring_del_virtqueue(vq);
> +		RCU_INIT_POINTER(rvring->vq, NULL);
>  	}
> +
> +	/* Wait for rproc_vq_interrupt() callers still using the virtqueues */
> +	synchronize_srcu(&rproc_vq_srcu);
> +
> +	list_for_each_entry_safe(vq, n, &vdev->vqs, list)
> +		vring_del_virtqueue(vq);
>  }
>  
>  static void rproc_virtio_del_vqs(struct virtio_device *vdev)
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index a44368737b39a..919d19fe99198 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -340,7 +340,7 @@ struct rproc_vring {
>  	u32 align;
>  	int notifyid;
>  	struct rproc_vdev *rvdev;
> -	struct virtqueue *vq;
> +	struct virtqueue __rcu *vq;
>  };
>  
>  /**
> 
> base-commit: aa98230e410f0ed212b6788c46b1e4d49e0ff7ca
> -- 
> 2.43.0
> 
