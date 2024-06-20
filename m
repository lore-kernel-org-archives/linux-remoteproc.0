Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04096628
	for <linux-remoteproc@vger.kernel.org>; Thu, 20 Jun 2024 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718878520; cv=none; b=WNS0VZalBd/vmJUbLDgnOE+Fzz4Rmvsmony0pX6LLxguq1FKB0Sp0UhNaNVcOb8Iq7i2jznXw47306SwDQO64iNBjOaoGe35o8Cf3vuWgmAKr0aaB5m0gasGcAEjH6Yf7CvODVyB39TrP/a2bIIWs3u4VUgChLP7JVaWIHJZt5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718878520; c=relaxed/simple;
	bh=KT+gmGxmqPGTmSPB6Wmg2kppdu71XosMa8bHRQqSGhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEepMe0hwFvFY996PF3uAls20zQ6PheLY4zuky5FEuCrlIoQaPzGh0gi0Cz9UG/k+gRa2FPBq4rPJLdJvSq8OR2RxLRInLMFzLfbvySEG5G2ICYc9bjllXzlZdsbHPBIcLCBZR70w1IReocBPehQOSZfXZMQ5qlfWCSPqbqqNYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YTR9iNQB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YTR9iNQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718878518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F5cLrcBZuYCEeePJIc62tRcAqhOXIeLud2uXAMK36HI=;
	b=YTR9iNQBxz8JHO3BoOsYjwyWFp9sZfmtM0IpYBVI5EZjZTnfGFa2jryYz227wu0hfbw7y/
	lk+uBKyPsLxgrl6lRkCEXL1K1FegAiAoSF91AqYJQ/ZINN6zJKglVHJRW+Or0eJN4r05kv
	H3Bk82A26kfWe1P0xMEFBpLaIK1f36E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-sG3onYRqMuqhOcnFdxy2Fw-1; Thu, 20 Jun 2024 06:15:17 -0400
X-MC-Unique: sG3onYRqMuqhOcnFdxy2Fw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a6f2662d050so30547566b.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 20 Jun 2024 03:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718878516; x=1719483316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5cLrcBZuYCEeePJIc62tRcAqhOXIeLud2uXAMK36HI=;
        b=BwalNPQSjkGs0iOK6XjeoXXGnWwwFfFtxVqqLRXNUdIAvmj7RrnE6OhCspt2lUzz8a
         ODahx2xZhELl2nWAPimW/5pHdKJeFag474OEtiSMMCaYA26JXIrQsm6u8La6pOD69RYw
         pb/V4jJg9BuQqcvkdyXjY/jTUC0tSdkStoewEIDWiY/Q4kfKbUSqcson4d/8VhrfwwLE
         38uhMj9ul/MJmghDz5lpuCNbL5XUg3KtVsu4dP7olCl5CDdIPdFXwCH2zglutp4va54N
         q5Elmes9atcJUCAB6d0LIcVlR1ANpdLTVx/o/Tm9JoT92L8U+6xzwHkrTMA7LxTmtRp5
         W5Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVtiCme80JIfZ7R/a5CDijg5XY0w9VxfTKBiDmMsyugbav4dkY9kFkyHfJ4cEgLQTvMU3TCH9HObxBHGjAYcBdJnbDa4bQzum5m2IDL0zIE0A==
X-Gm-Message-State: AOJu0Ywz2CW7QaPXlzcBsFMA4MYBZ+GIXH0+EJiJw4YAth/STVOf/YG0
	isS8ai0biBIwv5j23VBjBHNYE20GlnkK4BCeylCKnmtob1ClOHZN3SGHcwuiHSBEGkUoSOldeHQ
	preBNP7f9HvMNBbgxVGcNAH3jS3vHLYoaehH57CqdHwq92JcjtCeDHpK66aci7RmcAKE=
X-Received: by 2002:a17:907:2d08:b0:a6f:501d:c229 with SMTP id a640c23a62f3a-a6fab60ba19mr339711766b.9.1718878515664;
        Thu, 20 Jun 2024 03:15:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLolJ3t9kBt/FV6CSCM4Ryf1U+wjtgY8UpBQflIEZZb/4e3FwGJgSy2Bl6IqLXHgvitjoz1Q==
X-Received: by 2002:a17:907:2d08:b0:a6f:501d:c229 with SMTP id a640c23a62f3a-a6fab60ba19mr339707566b.9.1718878514780;
        Thu, 20 Jun 2024 03:15:14 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f41a7asm750071366b.159.2024.06.20.03.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 03:15:14 -0700 (PDT)
Date: Thu, 20 Jun 2024 06:15:08 -0400
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
Message-ID: <20240620061202-mutt-send-email-mst@kernel.org>
References: <20240424091533.86949-1-xuanzhuo@linux.alibaba.com>
 <20240424091533.86949-4-xuanzhuo@linux.alibaba.com>
 <20240620034823-mutt-send-email-mst@kernel.org>
 <1718874049.457552-1-xuanzhuo@linux.alibaba.com>
 <20240620050545-mutt-send-email-mst@kernel.org>
 <1718875249.1787696-3-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1718875249.1787696-3-xuanzhuo@linux.alibaba.com>

On Thu, Jun 20, 2024 at 05:20:49PM +0800, Xuan Zhuo wrote:
> On Thu, 20 Jun 2024 05:14:24 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Thu, Jun 20, 2024 at 05:00:49PM +0800, Xuan Zhuo wrote:
> > > > > @@ -226,21 +248,37 @@ struct virtqueue *virtio_find_single_vq(struct virtio_device *vdev,
> > > > >
> > > > >  static inline
> > > > >  int virtio_find_vqs(struct virtio_device *vdev, unsigned nvqs,
> > > > > -			struct virtqueue *vqs[], vq_callback_t *callbacks[],
> > > > > -			const char * const names[],
> > > > > -			struct irq_affinity *desc)
> > > > > +		    struct virtqueue *vqs[], vq_callback_t *callbacks[],
> > > > > +		    const char * const names[],
> > > > > +		    struct irq_affinity *desc)
> > > > >  {
> > > > > -	return vdev->config->find_vqs(vdev, nvqs, vqs, callbacks, names, NULL, desc);
> > > > > +	struct virtio_vq_config cfg = {};
> > > > > +
> > > > > +	cfg.nvqs = nvqs;
> > > > > +	cfg.vqs = vqs;
> > > > > +	cfg.callbacks = callbacks;
> > > > > +	cfg.names = (const char **)names;
> > > >
> > > >
> > > > Casting const away? Not safe.
> > >
> > >
> > >
> > > Because the vp_modern_create_avq() use the "const char *names[]",
> > > and the virtio_uml.c changes the name in the subsequent commit, so
> > > change the "names" inside the virtio_vq_config from "const char *const
> > > *names" to "const char **names".
> >
> > I'm not sure I understand which commit you mean,
> > and this kind of change needs to be documented, but it does not matter.
> > Don't cast away const.
> 
> 
> Do you mean change the virtio_find_vqs(), from
> const char * const names[] to const char *names[].
> 
> And update the caller?
> 
> If we do not cast the const, we need to update all the caller to remove the
> const.
> 
> Right?
> 
> Thanks.


Just do not split the patchset at a boundary that makes you do that.
If you are passing in an array from a const section then it
has to be const and attempts to change it are a bad idea.


> >
> > --
> > MST
> >

