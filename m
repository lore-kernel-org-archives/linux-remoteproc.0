Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EFD1AC22C
	for <linux-remoteproc@vger.kernel.org>; Thu, 20 Jun 2024 11:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883468; cv=none; b=OYc085QKOKz+ndFe2N3dnnuob4eWLKv/QI9zlWIf7eLnaS4rwXVR/zmnHvF+h7S5eMtvaUa3e0PO52MvJCTqpS6vkmqr85WEkoM3xiIEv8dv4fhY/wqxCBvaUQZpUP0mWZ037h9sblKTwiFCPiKBHJSoG8xYtQOuKPhYaP6ckVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883468; c=relaxed/simple;
	bh=+BUuzt0EV0E7b5HL9H0lKiRQzBuiOBmGvgWVpf0cnf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGh7Q3FXFOJ/buav+k7w0mCTaf/RZlgQaMYZRYPfl0I2IflaXCW86Ni9WCXZ83HH0pIAC3ky23tsCP911m07NG6U8oI50CkTfurZpANvzyw0vQ8tw9g/T9x+SK1qrrpNSdZkSJMEqV4qbg9ek0lRogeDen78842DoRz2qcPwaMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MohDjuKu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MohDjuKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718883465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d0vRFjJoymfNkJ7AiCzZKbFSRm1LITjQgITc8revWNM=;
	b=MohDjuKuCIomkoPxCiTN8igFsjQZA8WoXOwdcpPDvMEImR7mlRd+0Xb1rYXbgJlWvMbhGT
	ylHQEN0cEaNP/INoJVot9Rp8TfmxiY+hcH9wfRqCreKOvqFkz9Xeab4cWXKYugyrIxE10Q
	KjqkTrq988FUQ1P51PNF3hg1BUfEwSc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-7sp8gs9xPVetWtS8mGunrA-1; Thu, 20 Jun 2024 07:37:43 -0400
X-MC-Unique: 7sp8gs9xPVetWtS8mGunrA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a6f4af1c655so30640866b.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 20 Jun 2024 04:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718883462; x=1719488262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0vRFjJoymfNkJ7AiCzZKbFSRm1LITjQgITc8revWNM=;
        b=nCwghiUlH9KwVsKb5RejF7/PHU5c2tor3dRz4P/Szru70csDVHgtJEc4oLLtH7+iRi
         ur2M8Qvj54g3AFgO2FYf9+Ukhuvh1YwDuV1Z7SCrEtA+rnyu4RdLok1j/BoHUzAup8wN
         aWK/KdTA+clCGjo78MTH2Qy3B6H0ZK2uq0XhBgxiByxS6Cac1qVdcpKrfncGEGlFi8Wr
         ndo92Ztr+9kFcg6Z5kRsW0NiTiuOeXEjozwPkYpHhQoYUgRyBTnPojpCi7+xSO9hJ6r1
         IXBrFK+sjCDjU0+pZft6+G+uFtcexkkiAF7c/qrhh1BV61EA5te5NCHS8WplVMhlN1Nc
         9Fmw==
X-Forwarded-Encrypted: i=1; AJvYcCUviLCUgkxHZsZUgwOVgtj9njNgJOB4KV5ar0SxrLPPX0YsiA9t1nGv6YsEQ7cROxuQCkedQEmebm7BrxUUNfTJFzpFeDpj3qHhMiF/8h/hwg==
X-Gm-Message-State: AOJu0YzTlNjbauFK2vViyBa7EL8TwTk9jLmczO/SwqIojDTlixtRgq8y
	mCxAfKSg71FXK5O3nPKr/VcSLDBlGgSIamXXym0T9NvakD3GTJqO+JTxEWzted+536LWL+Cok0p
	3jk1yUGztDhGnyiAd7AO1iOlZs9fQzR6wsYdw+N9V/kHX1k3qzQM1528LaqNuoQTFQ0A=
X-Received: by 2002:a17:907:198e:b0:a68:a800:5f7e with SMTP id a640c23a62f3a-a6fab605032mr323035866b.10.1718883461408;
        Thu, 20 Jun 2024 04:37:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDIGM+jwPnAqXhfTi5j68F0TiQKYd3uIDh3xaq5X5qn943fCJOq9d8Dl2broWQ/a34GcpdjA==
X-Received: by 2002:a17:907:198e:b0:a68:a800:5f7e with SMTP id a640c23a62f3a-a6fab605032mr323032466b.10.1718883460605;
        Thu, 20 Jun 2024 04:37:40 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ecdce5sm752536366b.108.2024.06.20.04.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 04:37:39 -0700 (PDT)
Date: Thu, 20 Jun 2024 07:37:32 -0400
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
Message-ID: <20240620073111-mutt-send-email-mst@kernel.org>
References: <20240424091533.86949-1-xuanzhuo@linux.alibaba.com>
 <20240424091533.86949-4-xuanzhuo@linux.alibaba.com>
 <20240620034823-mutt-send-email-mst@kernel.org>
 <1718874049.457552-1-xuanzhuo@linux.alibaba.com>
 <20240620050545-mutt-send-email-mst@kernel.org>
 <1718875249.1787696-3-xuanzhuo@linux.alibaba.com>
 <20240620061202-mutt-send-email-mst@kernel.org>
 <1718880210.0475078-2-xuanzhuo@linux.alibaba.com>
 <20240620070354-mutt-send-email-mst@kernel.org>
 <1718881968.7394087-7-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1718881968.7394087-7-xuanzhuo@linux.alibaba.com>

On Thu, Jun 20, 2024 at 07:12:48PM +0800, Xuan Zhuo wrote:
> On Thu, 20 Jun 2024 07:06:53 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Thu, Jun 20, 2024 at 06:43:30PM +0800, Xuan Zhuo wrote:
> > > On Thu, 20 Jun 2024 06:15:08 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > On Thu, Jun 20, 2024 at 05:20:49PM +0800, Xuan Zhuo wrote:
> > > > > On Thu, 20 Jun 2024 05:14:24 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > On Thu, Jun 20, 2024 at 05:00:49PM +0800, Xuan Zhuo wrote:
> > > > > > > > > @@ -226,21 +248,37 @@ struct virtqueue *virtio_find_single_vq(struct virtio_device *vdev,
> > > > > > > > >
> > > > > > > > >  static inline
> > > > > > > > >  int virtio_find_vqs(struct virtio_device *vdev, unsigned nvqs,
> > > > > > > > > -			struct virtqueue *vqs[], vq_callback_t *callbacks[],
> > > > > > > > > -			const char * const names[],
> > > > > > > > > -			struct irq_affinity *desc)
> > > > > > > > > +		    struct virtqueue *vqs[], vq_callback_t *callbacks[],
> > > > > > > > > +		    const char * const names[],
> > > > > > > > > +		    struct irq_affinity *desc)
> > > > > > > > >  {
> > > > > > > > > -	return vdev->config->find_vqs(vdev, nvqs, vqs, callbacks, names, NULL, desc);
> > > > > > > > > +	struct virtio_vq_config cfg = {};
> > > > > > > > > +
> > > > > > > > > +	cfg.nvqs = nvqs;
> > > > > > > > > +	cfg.vqs = vqs;
> > > > > > > > > +	cfg.callbacks = callbacks;
> > > > > > > > > +	cfg.names = (const char **)names;
> > > > > > > >
> > > > > > > >
> > > > > > > > Casting const away? Not safe.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Because the vp_modern_create_avq() use the "const char *names[]",
> > > > > > > and the virtio_uml.c changes the name in the subsequent commit, so
> > > > > > > change the "names" inside the virtio_vq_config from "const char *const
> > > > > > > *names" to "const char **names".
> > > > > >
> > > > > > I'm not sure I understand which commit you mean,
> > > > > > and this kind of change needs to be documented, but it does not matter.
> > > > > > Don't cast away const.
> > > > >
> > > > >
> > > > > Do you mean change the virtio_find_vqs(), from
> > > > > const char * const names[] to const char *names[].
> > > > >
> > > > > And update the caller?
> > > > >
> > > > > If we do not cast the const, we need to update all the caller to remove the
> > > > > const.
> > > > >
> > > > > Right?
> > > > >
> > > > > Thanks.
> > > >
> > > >
> > > > Just do not split the patchset at a boundary that makes you do that.
> > > > If you are passing in an array from a const section then it
> > > > has to be const and attempts to change it are a bad idea.
> > >
> > > Without this patch set:
> > >
> > > static struct virtqueue *vu_setup_vq(struct virtio_device *vdev,
> > > 				     unsigned index, vq_callback_t *callback,
> > > 				     const char *name, bool ctx)
> > > {
> > > 	struct virtio_uml_device *vu_dev = to_virtio_uml_device(vdev);
> > > 	struct platform_device *pdev = vu_dev->pdev;
> > > 	struct virtio_uml_vq_info *info;
> > > 	struct virtqueue *vq;
> > > 	int num = MAX_SUPPORTED_QUEUE_SIZE;
> > > 	int rc;
> > >
> > > 	info = kzalloc(sizeof(*info), GFP_KERNEL);
> > > 	if (!info) {
> > > 		rc = -ENOMEM;
> > > 		goto error_kzalloc;
> > > 	}
> > > ->	snprintf(info->name, sizeof(info->name), "%s.%d-%s", pdev->name,
> > > 		 pdev->id, name);
> > >
> > > 	vq = vring_create_virtqueue(index, num, PAGE_SIZE, vdev, true, true,
> > > 				    ctx, vu_notify, callback, info->name);
> > >
> > >
> > > The name is changed by vu_setup_vq().
> > > If we want to pass names to
> > > virtio ring, the names must not be  "const char * const"
> > >
> > > And the admin queue of pci do the same thing.
> > >
> > > And I think you are right, we should not cast the const.
> > > So we have to remove the "const" from the source.
> > > And I checked the source code, if we remove the "const", I think
> > > that makes sense.
> > >
> > > Thanks.
> >
> > /facepalm
> >
> > This is a different const.
> >
> >
> > There should be no need to drop the annotation, core
> > does not change these things and using const helps make
> > sure that is the case.
> 
> 
> If you do not like this, the left only way is to allocate new
> memory to store the info, if the caller do not change.
> 
> In the further, maybe the caller can use the follow struct directly.
> 
> struct virtio_vq_config {
>  	vq_callback_t      callback;
>  	const char         *name;
>  	const bool          ctx;
> };
> 
> For now, we can allocate memory to change the arrays (names, callbacks..)
> to the array of struct virtio_vq_config.
> 
> And the find_vqs() accepts the array of struct virtio_vq_config.
> 
> How about this?
> 
> Thanks.


Basically I am not sure how bad a single big patch would be.


> >
> >
> >
> > >
> > >
> > > >
> > > >
> > > > > >
> > > > > > --
> > > > > > MST
> > > > > >
> > > >
> >

