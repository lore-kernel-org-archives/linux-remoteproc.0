Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D834E50A70
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Mar 2024 06:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710831483; cv=none; b=bcb4eQPELVok0xbBRam+1ifFCG1unOpUkoyNFg3CcvfSS0MehDcUljrHo8r141m76WA/KNfs9MoZ/h1RV837dBB9TfsCWgXTLn4kCvs1ZvS9z0MM8feBZKmGH06eoilNEmUwM+D5A9+IIOPs/HLRuld3GnAeyAMDkcPfr0aOj+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710831483; c=relaxed/simple;
	bh=sHkV9c2cCvUDbeVxr0z64spNW2KJ43//daE/hxW1fLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUCZXOnzo5EhH4TBfs1PNkAEbuQ3XdC/JAaPoxgsFkbjoo6Q96sXX+V+ZvWrdBOCwN5R3JfY36ROwmaADz2YSrNBYDOfl1SyKl4Cv1h1+Y9IT951yP85RwEoEfKIDh8QjrEDIxlPwRKu3JgRydlkODYuDA9gU4GhroRKHIjhpk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B9HWhu7V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B9HWhu7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710831480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKRneGfnw6MSOgt3Bh59h7eI+wlS3o3Ic4CAJ/J4VaI=;
	b=B9HWhu7V+HNsDZZc4v2VP10ERXW2pmimrCyCEDZ86wDOC+yHnfrvpRASqbGcqImlJnHT/B
	kSwPPr2JEfGu4nrxg92DEZL7eMRbA51VpSies7aqWIDz8cLu+ZN0Owl+jYRnYes2UkkDRX
	/Wy5FWJXI18p9UrsLmqaK1+XUCYuU2A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-EEikgasFPMORGc726ATLKQ-1; Tue, 19 Mar 2024 02:57:59 -0400
X-MC-Unique: EEikgasFPMORGc726ATLKQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a46d2e7ac3bso59873466b.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Mar 2024 23:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710831478; x=1711436278;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WKRneGfnw6MSOgt3Bh59h7eI+wlS3o3Ic4CAJ/J4VaI=;
        b=lEiahGUyMefb8eWJAmNS7P2Nz8eHsLk6h27mrJgimapve1bt3j41U4jqfRNHLhc2bX
         FxGNIcQdSM7C5yexvOCfB0itiFfGIaai+7ine90SsDqUOnY2ZbV/Aev8c2gnktpAHvRi
         62jkcPVW+uD53KkQV4g2R3NXdQcim1LEDITfIcIM7W4P3MpPg9fhPzf1t89c42230b7P
         AgueTDBpggDFTGybnzhWSk6rhCu/aJFyKoOIrG4I2lzJgbWxwkB47kAMOh2EEWmhtiwP
         l8OwUiwR8m9kVB119L0bq7VHmSaoTz8B5YXzhTZ/r1imK0srHiUTMuiO49opy8w1OCJi
         5j9w==
X-Forwarded-Encrypted: i=1; AJvYcCUg0q6bvwanRxgGia20l6joR/83rRU6jb59jll+iLtixFTj8sfEBFEtIjJSgZoAzWwDW14kwvejWaSiVahde8u9hC/OW7yTuxXrb/IX5apZwQ==
X-Gm-Message-State: AOJu0YwDQuR8wXyvdfSDe00oThuKUFDIIWNGQtSVYQvKg3pJr5uQVeMQ
	2bDeLlyxrUpit/f9pvC/qUAwqsUvbnkvI29cLRcm8BsGowX+EI4EYen3pkbiOCkySIcR0GZ2/ar
	/j5Pj3c3lT320ehmQZQ+ePGIwIz0bpdmZM3v6x8o89Ybo/RQNVW28aS43cSf/fKLIjCfEfgurku
	c=
X-Received: by 2002:a17:906:eece:b0:a46:c11d:dd01 with SMTP id wu14-20020a170906eece00b00a46c11ddd01mr4018598ejb.50.1710831477847;
        Mon, 18 Mar 2024 23:57:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe8W4rxWk1HBUws9HJcN3Gt6tuPLOzUx2clDG/sopbKziEHlsuK6XGj9oSKeqgDXzCCBt6Rg==
X-Received: by 2002:a17:906:eece:b0:a46:c11d:dd01 with SMTP id wu14-20020a170906eece00b00a46c11ddd01mr4018565ejb.50.1710831477263;
        Mon, 18 Mar 2024 23:57:57 -0700 (PDT)
Received: from redhat.com ([2a02:14f:175:ca2b:adb0:2501:10a9:c4b2])
        by smtp.gmail.com with ESMTPSA id bi20-20020a170906a25400b00a46b9e36636sm2331023ejb.0.2024.03.18.23.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 23:57:56 -0700 (PDT)
Date: Tue, 19 Mar 2024 02:57:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Jason Wang <jasowang@redhat.com>, virtualization@lists.linux.dev,
	Richard Weinberger <richard@nod.at>,
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
	Sven Schnelle <svens@linux.ibm.com>, linux-um@lists.infradead.org,
	platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH vhost v3 1/4] virtio: find_vqs: pass struct instead of
 multi parameters
Message-ID: <20240319025726-mutt-send-email-mst@kernel.org>
References: <20240312021013.88656-1-xuanzhuo@linux.alibaba.com>
 <20240312021013.88656-2-xuanzhuo@linux.alibaba.com>
 <CACGkMEvVgfgAxLoKeFTgy-1GR0W07ciPYFuqs6PiWtKCnXuWTw@mail.gmail.com>
 <1710395908.7915084-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEsT2JqJ1r_kStUzW0+-f+qT0C05n2A+Yrjpc-mHMZD_mQ@mail.gmail.com>
 <1710487245.6843069-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEspzDTZP1yxkBz17MgU9meyfCUBDxG8mjm=acXHNxAxhg@mail.gmail.com>
 <1710741592.205804-1-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1710741592.205804-1-xuanzhuo@linux.alibaba.com>

On Mon, Mar 18, 2024 at 01:59:52PM +0800, Xuan Zhuo wrote:
> On Mon, 18 Mar 2024 12:18:23 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > On Fri, Mar 15, 2024 at 3:26 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > >
> > > On Fri, 15 Mar 2024 11:51:48 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > > > On Thu, Mar 14, 2024 at 2:00 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > > > >
> > > > > On Thu, 14 Mar 2024 11:12:24 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > > > > > On Tue, Mar 12, 2024 at 10:10 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > > > > > >
> > > > > > > Now, we pass multi parameters to find_vqs. These parameters
> > > > > > > may work for transport or work for vring.
> > > > > > >
> > > > > > > And find_vqs has multi implements in many places:
> > > > > > >
> > > > > > >  arch/um/drivers/virtio_uml.c
> > > > > > >  drivers/platform/mellanox/mlxbf-tmfifo.c
> > > > > > >  drivers/remoteproc/remoteproc_virtio.c
> > > > > > >  drivers/s390/virtio/virtio_ccw.c
> > > > > > >  drivers/virtio/virtio_mmio.c
> > > > > > >  drivers/virtio/virtio_pci_legacy.c
> > > > > > >  drivers/virtio/virtio_pci_modern.c
> > > > > > >  drivers/virtio/virtio_vdpa.c
> > > > > > >
> > > > > > > Every time, we try to add a new parameter, that is difficult.
> > > > > > > We must change every find_vqs implement.
> > > > > > >
> > > > > > > One the other side, if we want to pass a parameter to vring,
> > > > > > > we must change the call path from transport to vring.
> > > > > > > Too many functions need to be changed.
> > > > > > >
> > > > > > > So it is time to refactor the find_vqs. We pass a structure
> > > > > > > cfg to find_vqs(), that will be passed to vring by transport.
> > > > > > >
> > > > > > > Because the vp_modern_create_avq() use the "const char *names[]",
> > > > > > > and the virtio_uml.c changes the name in the subsequent commit, so
> > > > > > > change the "names" inside the virtio_vq_config from "const char *const
> > > > > > > *names" to "const char **names".
> > > > > > >
> > > > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > > > Acked-by: Johannes Berg <johannes@sipsolutions.net>
> > > > > > > Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > > > > >
> > > > > > The name seems broken here.
> > > > >
> > > > > Email APP bug.
> > > > >
> > > > > I will fix.
> > > > >
> > > > >
> > > > > >
> > > > > > [...]
> > > > > >
> > > > > > >
> > > > > > >  typedef void vq_callback_t(struct virtqueue *);
> > > > > > >
> > > > > > > +/**
> > > > > > > + * struct virtio_vq_config - configure for find_vqs()
> > > > > > > + * @cfg_idx: Used by virtio core. The drivers should set this to 0.
> > > > > > > + *     During the initialization of each vq(vring setup), we need to know which
> > > > > > > + *     item in the array should be used at that time. But since the item in
> > > > > > > + *     names can be null, which causes some item of array to be skipped, we
> > > > > > > + *     cannot use vq.index as the current id. So add a cfg_idx to let vring
> > > > > > > + *     know how to get the current configuration from the array when
> > > > > > > + *     initializing vq.
> > > > > >
> > > > > > So this design is not good. If it is not something that the driver
> > > > > > needs to care about, the core needs to hide it from the API.
> > > > >
> > > > > The driver just ignore it. That will be beneficial to the virtio core.
> > > > > Otherwise, we must pass one more parameter everywhere.
> > > >
> > > > I don't get here, it's an internal logic and we've already done that.
> > >
> > >
> > > ## Then these must add one param "cfg_idx";
> > >
> > >  struct virtqueue *vring_create_virtqueue(struct virtio_device *vdev,
> > >                                          unsigned int index,
> > >                                          struct vq_transport_config *tp_cfg,
> > >                                          struct virtio_vq_config *cfg,
> > > -->                                      uint cfg_idx);
> > >
> > >  struct virtqueue *vring_new_virtqueue(struct virtio_device *vdev,
> > >                                       unsigned int index,
> > >                                       void *pages,
> > >                                       struct vq_transport_config *tp_cfg,
> > >                                       struct virtio_vq_config *cfg,
> > > -->                                      uint cfg_idx);
> > >
> > >
> > > ## The functions inside virtio_ring also need to add a new param, such as:
> > >
> > >  static struct virtqueue *vring_create_virtqueue_split(struct virtio_device *vdev,
> > >                                                       unsigned int index,
> > >                                                       struct vq_transport_config *tp_cfg,
> > >                                                       struct virtio_vq_config,
> > > -->                                                   uint cfg_idx);
> > >
> > >
> > >
> >
> > I guess what I'm missing is when could the index differ from cfg_idx?
> 
> 
>  @cfg_idx: Used by virtio core. The drivers should set this to 0.
>      During the initialization of each vq(vring setup), we need to know which
>      item in the array should be used at that time. But since the item in
>      names can be null, which causes some item of array to be skipped, we
>      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>      cannot use vq.index as the current id. So add a cfg_idx to let vring
>      know how to get the current configuration from the array when
>      initializing vq.
> 
> 
> static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned int nvqs,
> 
> 	................
> 
> 	for (i = 0; i < nvqs; ++i) {
> 		if (!names[i]) {
> 			vqs[i] = NULL;
> 			continue;
> 		}
> 
> 		if (!callbacks[i])
> 			msix_vec = VIRTIO_MSI_NO_VECTOR;
> 		else if (vp_dev->per_vq_vectors)
> 			msix_vec = allocated_vectors++;
> 		else
> 			msix_vec = VP_MSIX_VQ_VECTOR;
> 		vqs[i] = vp_setup_vq(vdev, queue_idx++, callbacks[i], names[i],
> 				     ctx ? ctx[i] : false,
> 				     msix_vec);
> 
> 
> Thanks.


Jason what do you think is the way to resolve this?

> >
> > Thanks
> >
> > > Thanks.
> > >
> > >
> > >
> > >
> > > >
> > > > Thanks
> > > >
> > > > >
> > > > > Thanks.
> > > > >
> > > > > >
> > > > > > Thanks
> > > > > >
> > > > >
> > > >
> > >
> >

