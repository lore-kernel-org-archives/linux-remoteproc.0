Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EBA628
	for <linux-remoteproc@vger.kernel.org>; Thu, 20 Jun 2024 09:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718874877; cv=none; b=uh86XjBjN95I0qJIqKjy6002SyV+I4NEdTdFIGfOMu2snI6IMRVsopzAt6S+fssx4L+Y9YtnGDSiAE6NdEu5nHi3Cziq9kr6rKOZuB9NN9MmXBuRHzfXT9iASwhjxPdpB2FbAVkOb7WjDk5ZZAwIdoErEUmfpUdv7Hi6cTpd914=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718874877; c=relaxed/simple;
	bh=AblgfDKsQmxG/rhwuU9LnaVafDArI7B9+bO2yRkgtrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t771ZnFzWkmYB7ExPO0VLj0lNbsAyJ4b53ByszoPPkZZzqYNMV5TKhTtWODX6jM3DnBEyLJ7389AHeW+S/Ew2C2WeXAt8s2NcJquu+AZnuSz1wR0fwD4Mfknz8tM2XfpGUI1DZ1r/aiROdmhIpodZK2ioqkkVAVr96ebidpA9aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=irXsrZLt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="irXsrZLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718874873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7n/q6GHKkD/zFmXGYbmYPlaDuYuUj7aK/70/tkj3IdI=;
	b=irXsrZLtsV9w1DOkpSiklsaRGmo7YidbABELFEliHwulXqXFATiX1T3Lrxk1lIBHNlDnX2
	6ErIDnREBz6Ks2o04Lpo9KmjoRDWwfueKO7XcD7JGeYACuJwkMcbsP3N3y7B1m8wwW8zZb
	oAoM399rPmz6Uq5GoXk3M/gQtLSPOQo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-sggrlG4nN2mc_eGwdrkLDg-1; Thu, 20 Jun 2024 05:14:32 -0400
X-MC-Unique: sggrlG4nN2mc_eGwdrkLDg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a6f4ba2ab1bso27514266b.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 20 Jun 2024 02:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718874871; x=1719479671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7n/q6GHKkD/zFmXGYbmYPlaDuYuUj7aK/70/tkj3IdI=;
        b=Eny/CXJ6D6ufKUM3P39VkDRzdjqXZJBYW6xcxQstjUIM/Vg5X5Twrs+WLz7KpGrKMo
         zoS0By5ZDyUdvB63pLGhEAXFLIuY6S/wzAKUIF6f1hMtZKFa2XXF34P+KV0UCYV5gQVR
         yj66XMZTLWhzh2QrQ1aSiMCKeenKXDEmZ04Y7kyjj90UcpscIwIKjP8XOEhMbz9vYzHX
         q6G6/gl8ouq2vZ9NQBrIzWshLhGn9Rr78M26OBGM9XEiPYecKSPysnn5lYM63PijoBFN
         ni5nvKMvmhStn8A1JuejJP6ztoAACvxZ4MYQtGUxfXr7fSkgK19/JigcUf5NKb/bMzNT
         vqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/Qq16fs5XkWwIaO0YR2IJH2NFKRefOCG4s/mpTj/xbevLGsUlLCFg2ZM3Z6myjXYTfPkb3CSKcP+Y7VNKbt15ysZpQzpPYRuMRo/jCeS0g==
X-Gm-Message-State: AOJu0Yz6YpGomLvdsZcIa9+7yBFLWDwm/4JVfx+lUa9kkKOuIZWCkqIw
	wFVBkd5RxK3O51fY8U0gOMhXGRCLJvYEjJi1ov2DyyxRGSnY7t2C0w3WlkOdJL5u0Yzxg7l8U4X
	TygiauAISl2TxU2nnMZjWNIV2SUMe5VZ1VVOEVpM0xvnXhE8Qd+D412N2bFNJjS+0YgE=
X-Received: by 2002:a17:907:a581:b0:a6f:af4f:ff82 with SMTP id a640c23a62f3a-a6faf500049mr334401466b.25.1718874871297;
        Thu, 20 Jun 2024 02:14:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxdf7P1AFITZr2DVkTfIKfl2IcVnjVg8p04jUd8bO23ArK3RuJSM+iwOfOkWQb1H37WeNIsA==
X-Received: by 2002:a17:907:a581:b0:a6f:af4f:ff82 with SMTP id a640c23a62f3a-a6faf500049mr334396566b.25.1718874870708;
        Thu, 20 Jun 2024 02:14:30 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da3fe5sm759661166b.18.2024.06.20.02.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:14:30 -0700 (PDT)
Date: Thu, 20 Jun 2024 05:14:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-um@lists.infradead.org,
	platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH vhost v9 3/6] virtio: find_vqs: pass struct instead of
 multi parameters
Message-ID: <20240620050545-mutt-send-email-mst@kernel.org>
References: <20240424091533.86949-1-xuanzhuo@linux.alibaba.com>
 <20240424091533.86949-4-xuanzhuo@linux.alibaba.com>
 <20240620034823-mutt-send-email-mst@kernel.org>
 <1718874049.457552-1-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1718874049.457552-1-xuanzhuo@linux.alibaba.com>

On Thu, Jun 20, 2024 at 05:00:49PM +0800, Xuan Zhuo wrote:
> > > @@ -226,21 +248,37 @@ struct virtqueue *virtio_find_single_vq(struct virtio_device *vdev,
> > >
> > >  static inline
> > >  int virtio_find_vqs(struct virtio_device *vdev, unsigned nvqs,
> > > -			struct virtqueue *vqs[], vq_callback_t *callbacks[],
> > > -			const char * const names[],
> > > -			struct irq_affinity *desc)
> > > +		    struct virtqueue *vqs[], vq_callback_t *callbacks[],
> > > +		    const char * const names[],
> > > +		    struct irq_affinity *desc)
> > >  {
> > > -	return vdev->config->find_vqs(vdev, nvqs, vqs, callbacks, names, NULL, desc);
> > > +	struct virtio_vq_config cfg = {};
> > > +
> > > +	cfg.nvqs = nvqs;
> > > +	cfg.vqs = vqs;
> > > +	cfg.callbacks = callbacks;
> > > +	cfg.names = (const char **)names;
> >
> >
> > Casting const away? Not safe.
> 
> 
> 
> Because the vp_modern_create_avq() use the "const char *names[]",
> and the virtio_uml.c changes the name in the subsequent commit, so
> change the "names" inside the virtio_vq_config from "const char *const
> *names" to "const char **names".

I'm not sure I understand which commit you mean,
and this kind of change needs to be documented, but it does not matter.
Don't cast away const.

-- 
MST

