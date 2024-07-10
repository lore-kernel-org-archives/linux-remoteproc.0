Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19647196434
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jul 2024 18:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720636836; cv=none; b=NZ+u3GF3CAAFWFfP03l3MrSVDTXvMkg/1VPFCjTbar6hVlFZyD3pDzC+38jOp5/7eym1+tViNpPgGEm8O74oMvZkt9CNDVNgOMzTOoAmaSwH+VthE/P8btvh7r2FuvXtiPhGZeTgbEp9D3IgF+aviXB0qMh6eUNd8L9ZP96DugE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720636836; c=relaxed/simple;
	bh=cpmhhhVhRKvhrC/g+4t7qnyh17qX5WLx6FJHCFwK3Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V62SgmFgZDZ9y4f20oKo56YzVnnY+ysZD1AVhdjjVgv0MKs9RUr5qHR4KxCmgtk1CvVJ+kPvmmkegsMgK1Wm5XPZEPklTX9TykVTcS4f7rLUzBd1+70twkSPmbZg2kErM+Iyq8Y17s7/SLHIrWfSqkGIbK+oUk0MytsTCiVSRhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S1dqXGcF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S1dqXGcF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720636833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nOMGW3S5XfF0umS0MhtMBuBfpR4wOzwlUDWp6i5Agkc=;
	b=S1dqXGcFrNUAc3Loe3JEl4k1Y7vyhY+UPN5ie4FoitohonKgL6YXgnFKwzp6Os94xzzylb
	HP4+CpXT9uB5jd7RJLTfjsTKmbI7SU6Xjtqi74OhxO3Xb2cmaweJTCF67GrT7QFKmraVNO
	W2dtrjlb3uqKNFabQsPRJ0o6vBvppM0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-VyDYTNlVONOlzMtjA8D1jQ-1; Wed, 10 Jul 2024 14:40:31 -0400
X-MC-Unique: VyDYTNlVONOlzMtjA8D1jQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42490ae735dso739925e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jul 2024 11:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720636830; x=1721241630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nOMGW3S5XfF0umS0MhtMBuBfpR4wOzwlUDWp6i5Agkc=;
        b=VhNKbqor0ceXtM7bP24rBXEFiHQYTb1mHwzVun04JNH48pQ9Vvg4Mdi+mZ14Tf+pra
         3+DI6njW2p/tnvW7UWpXseNbqqGHCQ359u8Oj7YI/444cqA/1IOt1p6KsSpaIL0ca/8K
         UoIudDIhNg/SD9NHkDA3VJ2RBfi2eTx7bKBTSU+Y5mv4jqF1uJSHCBzJ+t97qaYSet2F
         GQdkvq80MvaFjnkgHA0rvRD6WFlStPvO76KnckJmamJJx6fGNhaoh2scMeG2i2scNFy3
         7Uf0PbIJeJgEvtc2Y4u7q3dvHFDZkAdWwfd/CtS8GkpIeut7LaqonP/E2AQhfdSgX411
         4G3g==
X-Forwarded-Encrypted: i=1; AJvYcCU+/82tOnKLJNiOHbXEI6oSQ4O8a7NosQpgB5up4hAbTU3dEHSKwRhO8St815XBc7Y4279LCh34utzcIgy7rp9tVlRrkXuAUlpaWDu5eXb2Ng==
X-Gm-Message-State: AOJu0Yx5GlWVUWItE+gwMWGHWS35wGtKLbe+HOStcoqcnKFpi5kKtk6i
	88dHpOM+1qNANO5fC9hk8nVgnptrBZfdJSi/MC5dITb4c0zAVXEqd5Hfs3clc9aaoPyRYQa7Cae
	oTJfr6+nOxGLiHTjh8x6KgyCCY3woubK0CSeVrPcVd3O7yAW8fRBASl1UF2LgSqzg8Ic=
X-Received: by 2002:a1c:4b0e:0:b0:426:5b76:13bd with SMTP id 5b1f17b1804b1-426708f2127mr51924525e9.38.1720636830445;
        Wed, 10 Jul 2024 11:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW6BXHt7TvysChZRc5l+/HKuwpL6Ky9xwFKNWqpa0ClAMfEvn97X0Cu0s4c3ufKnu0Y+84KA==
X-Received: by 2002:a1c:4b0e:0:b0:426:5b76:13bd with SMTP id 5b1f17b1804b1-426708f2127mr51924105e9.38.1720636829731;
        Wed, 10 Jul 2024 11:40:29 -0700 (PDT)
Received: from redhat.com ([2a02:14f:174:f6ae:a6e3:8cbc:2cbd:b8ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e039sm5973934f8f.2.2024.07.10.11.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 11:40:29 -0700 (PDT)
Date: Wed, 10 Jul 2024 14:40:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel Verkamp <dverkamp@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
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
	Jason Wang <jasowang@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	linux-um@lists.infradead.org, linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org, virtualization@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] virtio: fix vq # for balloon
Message-ID: <20240710144012-mutt-send-email-mst@kernel.org>
References: <cover.1720611677.git.mst@redhat.com>
 <3d655be73ce220f176b2c163839d83699f8faf43.1720611677.git.mst@redhat.com>
 <CABVzXAnjAdQqVNtir_8SYc+2dPC-weFRxXNMBLRcmFsY8NxBhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABVzXAnjAdQqVNtir_8SYc+2dPC-weFRxXNMBLRcmFsY8NxBhQ@mail.gmail.com>

On Wed, Jul 10, 2024 at 11:12:34AM -0700, Daniel Verkamp wrote:
> On Wed, Jul 10, 2024 at 4:43 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > virtio balloon communicates to the core that in some
> > configurations vq #s are non-contiguous by setting name
> > pointer to NULL.
> >
> > Unfortunately, core then turned around and just made them
> > contiguous again. Result is that driver is out of spec.
> 
> Thanks for fixing this - I think the overall approach of the patch looks good.
> 
> > Implement what the API was supposed to do
> > in the 1st place. Compatibility with buggy hypervisors
> > is handled inside virtio-balloon, which is the only driver
> > making use of this facility, so far.
> 
> In addition to virtio-balloon, I believe the same problem also affects
> the virtio-fs device, since queue 1 is only supposed to be present if
> VIRTIO_FS_F_NOTIFICATION is negotiated, and the request queues are
> meant to be queue indexes 2 and up. From a look at the Linux driver
> (virtio_fs.c), it appears like it never acks VIRTIO_FS_F_NOTIFICATION
> and assumes that request queues start at index 1 rather than 2, which
> looks out of spec to me, but the current device implementations (that
> I am aware of, anyway) are also broken in the same way, so it ends up
> working today. Queue numbering in a spec-compliant device and the
> current Linux driver would mismatch; what the driver considers to be
> the first request queue (index 1) would be ignored by the device since
> queue index 1 has no function if F_NOTIFICATION isn't negotiated.
> 
> [...]
> > diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
> > index 7d82facafd75..fa606e7321ad 100644
> > --- a/drivers/virtio/virtio_pci_common.c
> > +++ b/drivers/virtio/virtio_pci_common.c
> > @@ -293,7 +293,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned int nvqs,
> >         struct virtio_pci_device *vp_dev = to_vp_device(vdev);
> >         struct virtqueue_info *vqi;
> >         u16 msix_vec;
> > -       int i, err, nvectors, allocated_vectors, queue_idx = 0;
> > +       int i, err, nvectors, allocated_vectors;
> >
> >         vp_dev->vqs = kcalloc(nvqs, sizeof(*vp_dev->vqs), GFP_KERNEL);
> >         if (!vp_dev->vqs)
> > @@ -332,7 +332,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned int nvqs,
> >                         msix_vec = allocated_vectors++;
> >                 else
> >                         msix_vec = VP_MSIX_VQ_VECTOR;
> > -               vqs[i] = vp_setup_vq(vdev, queue_idx++, vqi->callback,
> > +               vqs[i] = vp_setup_vq(vdev, i, vqi->callback,
> >                                      vqi->name, vqi->ctx, msix_vec);
> >                 if (IS_ERR(vqs[i])) {
> >                         err = PTR_ERR(vqs[i]);
> > @@ -368,7 +368,7 @@ static int vp_find_vqs_intx(struct virtio_device *vdev, unsigned int nvqs,
> >                             struct virtqueue_info vqs_info[])
> >  {
> >         struct virtio_pci_device *vp_dev = to_vp_device(vdev);
> > -       int i, err, queue_idx = 0;
> > +       int i, err;
> >
> >         vp_dev->vqs = kcalloc(nvqs, sizeof(*vp_dev->vqs), GFP_KERNEL);
> >         if (!vp_dev->vqs)
> > @@ -388,8 +388,13 @@ static int vp_find_vqs_intx(struct virtio_device *vdev, unsigned int nvqs,
> >                         vqs[i] = NULL;
> >                         continue;
> >                 }
> > +<<<<<<< HEAD
> >                 vqs[i] = vp_setup_vq(vdev, queue_idx++, vqi->callback,
> >                                      vqi->name, vqi->ctx,
> > +=======
> > +               vqs[i] = vp_setup_vq(vdev, i, callbacks[i], names[i],
> > +                                    ctx ? ctx[i] : false,
> > +>>>>>>> f814759f80b7... virtio: fix vq # for balloon
> 
> This still has merge markers in it.
> 
> Thanks,
> -- Daniel

ouch forgot to commit ;)

