Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF5C196D81
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jul 2024 18:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720636778; cv=none; b=S5rHfW8iFp5peaJhWzWsyKusJzPdkrog+7brbipdbdRjmJ+mSSh/oolYyG3WV2fl/72K5sS+0+NRPzwy1FMUkWyGCAR+DLJjU9PNCaFT7pcHXRI3qSj5PLSrCgoCJX7wRm0OeQvjTibYv4llW7t+qF3zRTyomYq/7qDD363I0xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720636778; c=relaxed/simple;
	bh=jl/G74jU3/LJKTndyg9Ir8ZK6ZCpRMd0UXIwTJV5u7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rU/C8foB/TdQIratv6/4fFfWsfr5GV8qHCnUlNf8P5wUARCmYysyw42B+WXzJS/HTbYMqYUvAseqeO7JdaNUSBQn0DZggHDGbWOfQT8PB5w9DR9UVg1SQ3RlHS8bezBTrtf1jbpVPOIGzCibt6IO/hsjxi7f2dyX4QMt7YaZ/sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=anaSJgvO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="anaSJgvO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720636776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Wa91XRdvflqoUl4ERsLfqpwV8EWmy2Wo2L5wqHiP4U=;
	b=anaSJgvOIwJwa65IfD5jBI8+zO8QOsO2kUpftC53H0Gd5k9bDFO0EJl+oz7gJr4e4/S921
	4RWUO+VRI7cj7++fzbpgVfHCGdLd0O96jqw5N2RxZXGIzDBnx6HeCWbkSkgmrEMMjFJ6GE
	PMyu6FXoFxer8cDM92uOIq1GxmDtBg8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-Uc9P11xrM--BrG0mJ9CVHg-1; Wed, 10 Jul 2024 14:39:34 -0400
X-MC-Unique: Uc9P11xrM--BrG0mJ9CVHg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42725d3ae3eso430945e9.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jul 2024 11:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720636773; x=1721241573;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Wa91XRdvflqoUl4ERsLfqpwV8EWmy2Wo2L5wqHiP4U=;
        b=w3GukrL6Kkf4RQggttUDtUODSBBNTPPnUCfExoRcGVZ/4l9GMHkVO2S4NPtRzUGDrC
         IxS7s1/LCpyETNvE94RfY/j2pN/U4DD+7PC/p8Uc/RWu8phttF8ID/VmbiNjIESW3kH2
         /JyErS/AbPjfHWMBRfTg2FQF8nHBv6yMVPweAqcgbIrUcpbr++Fyijc5WeKxHh/CrUgK
         SRQtAsVMbyBdzLJmOk32iq5joOY4dzsmxRcBG4F5F3iutjED/1FpfMvzYfknhXzDCut/
         Sf0W8qXeov3KkPcR9kUT762MPsJD2LYfqG9aXbZLIYMQfw99Lab329aDeQDXLylBH2wV
         S7uw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ+bdL6fuvVDWucWCi0Dln8PsfgphgQS/QtQigssAWH7JUWyttRvOdxqbWzP9RLjO8LRXgK7jWk25XJZcL8H1pyV2w0gbSELOtUXopaVVOQw==
X-Gm-Message-State: AOJu0YwSh7nkMubE/SNJlG949v+tqyrB2gXacpgbRMWveGJL2M1KARL1
	iywR0kWQzaWzvuB0mpSJI8TNjsU4JJTHezfF4qWmhGWC2e2E2s0G/EelarClzEJveKLtt3q0z+W
	ltBskcpnUBnkojlHeHECnAbNwkdcNmRN/qb68jeRE0tinuh3VlLTZwdRCjWSNqnA4BCw=
X-Received: by 2002:a7b:c458:0:b0:426:64f5:b10d with SMTP id 5b1f17b1804b1-426707db59bmr38554045e9.14.1720636773020;
        Wed, 10 Jul 2024 11:39:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG74ZhHPUOEWOdKZQANHlo67lTxvcQgP6YunxBETGdCT6l5hx3iAl/9nDeoE0ZV+lKH4kLIVQ==
X-Received: by 2002:a7b:c458:0:b0:426:64f5:b10d with SMTP id 5b1f17b1804b1-426707db59bmr38553905e9.14.1720636772416;
        Wed, 10 Jul 2024 11:39:32 -0700 (PDT)
Received: from redhat.com ([2a02:14f:174:f6ae:a6e3:8cbc:2cbd:b8ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427270238a6sm57772915e9.20.2024.07.10.11.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 11:39:31 -0700 (PDT)
Date: Wed, 10 Jul 2024 14:39:26 -0400
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
Message-ID: <20240710142239-mutt-send-email-mst@kernel.org>
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


Oh, thanks a lot for pointing this out!

I see so this patch is no good as is, we need to add a workaround for
virtio-fs first.

QEMU workaround is simple - just add an extra queue. But I did not
reasearch how this would interact with vhost-user.

From driver POV, I guess we could just ignore queue # 1 - would that be
ok or does it have performance implications?
Or do what I did for balloon here: try with spec compliant #s first,
if that fails then assume it's the spec issue and shift by 1.


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

