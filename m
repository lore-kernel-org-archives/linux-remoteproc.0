Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8C423CE
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Oct 2024 15:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727883409; cv=none; b=bdf1syAQIU6cUOt4tIWN7b0OanWYEWGucG4h9FpkUqJxVcJsRnnLvWllm01H+D+5met16eI5WXjBzFDLgI+47wd0cNXi85+PAmeh2hGMHXFJlCQ78ufScgdo2JrFsT7UrzydPbWFiUv0e+I1XE3MhtRy4B+Bo46AqR3a3NjVVjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727883409; c=relaxed/simple;
	bh=WNDVuJVYRzoATG9Ou+1RPn3y5hF6zGTSgTzDLHMArws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAZ1cBhDA8a+H7QjbzOIccQLnro9AJqz2iu8VVA9UdrNHpvAxbbiCFciEu4aiBjo+jLkmkQUR2gfPopMKxqWRLCXmIrQ3dy489X+A2utPBu66K0tjakiUl2XjajAKmfZu9lwfc0H3SfF2UM7dB8sUOcGnXoVqxpJJGSvCk4SX/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CSMMpw4m; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CSMMpw4m"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71971d2099cso5609806b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Oct 2024 08:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727883406; x=1728488206; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OTB+PF2DdHacG+b6eao+ymQdh7xOwx1kJuRK+tH/lb0=;
        b=CSMMpw4mbbBFYit+nO0NdbsABQNOpO6BsUlB4lJE3MXOL9dg4x5jfTwtfZDIGyOWhD
         03ZWIan4ktPKhXZAqpBeSLrCwH/qMMGHl1+A8ksixCohV08bbhvKc+bwsPjsdHcPrDv6
         79ssRFcD2pLssU1YIu9fvYtewf/7fK0yFRVERr0iouskQNCSI7PtUoKlPv14vySEmWHV
         3OP/wyTo1xv+EeFbHpJEK6L0O3xNHnWziAju9B5fkrXw8/+VXpDj+cYTQsmJQ3qTtYS9
         57G5iGpr22BJCb4aq6W/CznRiwmYjegUZrRdhW6TvLM/VM+qaDA4nEgJcArhM0jgZzIT
         5rGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727883406; x=1728488206;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OTB+PF2DdHacG+b6eao+ymQdh7xOwx1kJuRK+tH/lb0=;
        b=F4ZjaZLzji9ocJmLKGw70cZS23J/xnDE2WNoDORC3pqiwYyvl6UY2ABB+42ny00Otq
         6U9NQbjflSqexryTl6pV9okTzvJSqzX95a+IRuuguqIMnqmvHx3x6DIS9ArlNGmJXHJ5
         siXKo14HaaaSHVae9wUYPH22qfTm85oEW+Zgbq+fnVLQ+yDSX+XhorPx+wYKZw3L6Hr9
         LVlpVyTKa3n6WSCjDUQKLG8KNeuc6CjRAAtZlH3bYLPhr0LXXPvUWaBSjTwstZ4kw4og
         tEhUI27BZECkYbjmxfyfu/Q5V1rxAidfx3FpReIb9FjhJAOFNLz7ZidBZID8s1iaMDNj
         hfOw==
X-Forwarded-Encrypted: i=1; AJvYcCUL/ZHdHHdVWgElPs25t38YCDOxaBdyAotoE4GCKg58QEXcKvc9Vr1VrdC+ojdnSB812+GP7CWhxZ3jomADNWoX@vger.kernel.org
X-Gm-Message-State: AOJu0YxZe+2umACGGfv2TvckYpySh/3chYyXUUegBX39u/lO4NHwQT9q
	CoKuZoGeYu0E+xWWRwqFe9QH4uBwCO6kqdFlS+/m75sSvxa+wytc7E+LDfSHpEg=
X-Google-Smtp-Source: AGHT+IH/7GBO+FC7LZe14Gvhx3upKoEFUNAKdET9bmKw2fLWvE3OojbtfIet/HJEf1PECAomvcGvtQ==
X-Received: by 2002:aa7:9990:0:b0:717:94d2:43c3 with SMTP id d2e1a72fcca58-71dc5d5bf6bmr4257868b3a.18.1727883406513;
        Wed, 02 Oct 2024 08:36:46 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:80f9:2130:90df:197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26518787sm9919544b3a.124.2024.10.02.08.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 08:36:45 -0700 (PDT)
Date: Wed, 2 Oct 2024 09:36:43 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Mark-PK Tsai =?utf-8?B?KOiUoeaym+WJmyk=?= <Mark-PK.Tsai@mediatek.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"andersson@kernel.org" <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	JY Ho =?utf-8?B?KOS9lemnv+W9pSk=?= <JY.Ho@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	YJ Chiang =?utf-8?B?KOaxn+iLseadsCk=?= <yj.chiang@mediatek.com>
Subject: Re: [PATCH] remoteproc: virtio: Add synchronize_cbs to
 remoteproc_virtio
Message-ID: <Zv1oi2xfBrptNLHB@p14s>
References: <20240920091659.3933-1-mark-pk.tsai@mediatek.com>
 <109aa022a017648be7b1c583ec21af74d8a23dc7.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <109aa022a017648be7b1c583ec21af74d8a23dc7.camel@mediatek.com>

On Fri, Sep 27, 2024 at 02:51:38AM +0000, Mark-PK Tsai (蔡沛剛) wrote:
> Hi,
> 
> Could someone help to review it or provide suggestions?
> Any comments are welcome.
> 
> This patch is intended to allow the rproc driver to handle the
> following use-after-free issue:
> 
> 
> ### UAF log

What does "UAF" means?

> [  337.540275][  T470]  virtqueue_add.llvm.10153462284424984632+0xb48/0
> xcc4
> [  337.546969][  T470]  virtqueue_add_inbuf+0x44/0x6c                
> <--- vqs are freed in vring_del_virtqueue
> [  337.551755][  T470]  rpmsg_recv_done+0x1fc/0x2c4 [virtio_rpmsg_bus]
> [  337.558023][  T470]  vring_interrupt+0xa0/0xe0
> [  337.562462][  T470]  rproc_vq_interrupt+0x34/0x48
> [  337.567160][  T470]  handle_event+0x28/0x48 [mtk_pqu_rproc]
> [  337.572742][  T470]  irq_thread_fn+0x4c/0xcc
> [  337.577009][  T470]  irq_thread+0x1d0/0x360
> [  337.581189][  T470]  kthread+0x168/0x1cc
> [  337.585107][  T470]  ret_from_fork+0x10/0x20
> 
> ### stack trace of obj free
> [  339.253063][  T470] die_helper:       <-
> vring_del_virtqueue+0x16c/0x198
> [  339.259757][  T470] die_helper:       <- kfree+0x274/0x35c
> [  339.265236][  T470] die_helper:       <-
> vring_del_virtqueue+0x16c/0x198
> [  339.271929][  T470] die_helper:       <-
> rproc_virtio_del_vqs+0x3c/0x58
> [  339.278535][  T470] die_helper:       <- rpmsg_remove+0x8c/0x12c
> [virtio_rpmsg_bus]
> [  339.286189][  T470] die_helper:       <-
> virtio_dev_remove+0x64/0x174
> [  339.292622][  T470] die_helper:       <-
> device_release_driver_internal+0x1a8/0x32c
> [  339.300270][  T470] die_helper:       <-
> bus_remove_device+0x130/0x160
> [  339.306789][  T470] die_helper:       <- device_del+0x224/0x518
> [  339.312702][  T470] die_helper:       <- device_unregister+0x20/0x3c
> [  339.319047][  T470] die_helper:       <-
> rproc_remove_virtio_dev+0x20/0x44
> [  339.325913][  T470] die_helper:       <-
> device_for_each_child+0x84/0x100
> [  339.332696][  T470] die_helper:       <-
> rproc_vdev_do_stop+0x30/0x5c
> [  339.339130][  T470] die_helper:       <- rproc_stop+0xcc/0x200
> 

None of the above is showing me where this use-after-free happens.


> On Fri, 2024-09-20 at 17:16 +0800, Mark-PK Tsai wrote:
> > Add synchornize_cbs to rproc_virtio_config_ops and a
> > synchronize_vqs callback to the rproc_ops to ensure vqs'
> > state changes are visible in vring_interrupts when the vq is
> > broken or removed.
> > 
> > And when VIRTIO_HARDEN_NOTIFICATION is not set, call
> > rproc_virtio_synchronize_cbs directly in __rproc_virtio_del_vqs
> > before virtqueue is free to ensure that rproc_vq_interrupt is
> > aware of the virtqueue removal.
> > 
> > The synchronized_vqs is expected to be implemented in rproc
> > driver to ensure that all previous vring_interrupts are handled
> > before the vqs are marked as broken or removed.
> > 
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---
> >  drivers/remoteproc/remoteproc_virtio.c | 12 ++++++++++++
> >  include/linux/remoteproc.h             |  4 ++++
> >  2 files changed, 16 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c
> > b/drivers/remoteproc/remoteproc_virtio.c
> > index d3f39009b28e..e18258b69851 100644
> > --- a/drivers/remoteproc/remoteproc_virtio.c
> > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > @@ -74,6 +74,14 @@ static bool rproc_virtio_notify(struct virtqueue
> > *vq)
> >  	return true;
> >  }
> >  
> > +static void rproc_virtio_synchronize_cbs(struct virtio_device *vdev)
> > +{
> > +	struct rproc *rproc = vdev_to_rproc(vdev);
> > +
> > +	if (rproc->ops->synchronize_vqs)
> > +		rproc->ops->synchronize_vqs(rproc);
> > +}
> > +
> >  /**
> >   * rproc_vq_interrupt() - tell remoteproc that a virtqueue is
> > interrupted
> >   * @rproc: handle to the remote processor
> > @@ -171,6 +179,9 @@ static void __rproc_virtio_del_vqs(struct
> > virtio_device *vdev)
> >  	list_for_each_entry_safe(vq, n, &vdev->vqs, list) {
> >  		rvring = vq->priv;
> >  		rvring->vq = NULL;
> > +#ifndef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> > +		rproc_virtio_synchronize_cbs(vdev);
> > +#endif
> >  		vring_del_virtqueue(vq);
> >  	}
> >  }
> > @@ -334,6 +345,7 @@ static const struct virtio_config_ops
> > rproc_virtio_config_ops = {
> >  	.get_status	= rproc_virtio_get_status,
> >  	.get		= rproc_virtio_get,
> >  	.set		= rproc_virtio_set,
> > +	.synchronize_cbs = rproc_virtio_synchronize_cbs,

Where and when is this called?

This patch is very confusing and doesn't have a user.  As such it is
impossible for me to understand what is going on.  

Thanks,
Mathieu

> >  };
> >  
> >  /*
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index b4795698d8c2..73901678ac7d 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -381,6 +381,9 @@ enum rsc_handling_status {
> >   * @panic:	optional callback to react to system panic, core will
> > delay
> >   *		panic at least the returned number of milliseconds
> >   * @coredump:	  collect firmware dump after the subsystem is
> > shutdown
> > + * @synchronize_vqs:	optional callback to guarantee all memory
> > operations
> > + *			on the virtqueue before it are visible to the
> > + *			rproc_vq_interrupt().
> >   */
> >  struct rproc_ops {
> >  	int (*prepare)(struct rproc *rproc);
> > @@ -403,6 +406,7 @@ struct rproc_ops {
> >  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware
> > *fw);
> >  	unsigned long (*panic)(struct rproc *rproc);
> >  	void (*coredump)(struct rproc *rproc);
> > +	void (*synchronize_vqs)(struct rproc *rproc);
> >  };
> >  
> >  /**
> 
