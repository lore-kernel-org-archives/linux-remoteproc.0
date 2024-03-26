Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE1E129E70
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 Mar 2024 04:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711426474; cv=none; b=CFiN8Nd1iG6xKZTC7B4vkSF1X7BrDJiPWjkJNYL38/mYY7/61MAfmAzecs0AhOMFKQXdIIeRarskvQ+uC5usg1DKZwjn3Mw4E5IH51FMhmpyZeWm1kf+k7EtHmHXLsgg8YtImG8mNEa5UiEQn/ynwlHGV31o/Cti0sC8UjZJDT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711426474; c=relaxed/simple;
	bh=z5seLBV3yQLKEzxkNLkKpqsB4myVj0SW/ABTJB8Ficg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FH9tJP33scwu18lLgZpSCVMqJBDhv3/9+50uspZQxoXQ5Xawh06i4tBQlDUIYFZ/UO9vTeBemEGGdVzrGA11FsyvJEPiwAzfWRFS0qhCwrjqBky3qeuf0N1Jt1aQz0CaGk+ava5pnLhCEQcn6ZWCpHlfPA0rsimgkuMOUrL1G80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fi8IZcfG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fi8IZcfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711426471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z5seLBV3yQLKEzxkNLkKpqsB4myVj0SW/ABTJB8Ficg=;
	b=Fi8IZcfGjhHYSvXYRArVcDcRO1b/pElNjbtkX0fVz+ONCFd5mMYYbkl8veoCfawSR/hYRi
	wMVD3Pomdb1q6/v2jugtu+7O2WvWA6/qJqhDgncX31G6AYk41tc5YJND4UGVRynA6njcHY
	Gx5koftloiErhSYZBY+eyxevBgSFWxY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-6eBjpMqUMvOxnFluGP6YeQ-1; Tue, 26 Mar 2024 00:14:30 -0400
X-MC-Unique: 6eBjpMqUMvOxnFluGP6YeQ-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1e0c5faf1d0so11018665ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Mar 2024 21:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711426468; x=1712031268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5seLBV3yQLKEzxkNLkKpqsB4myVj0SW/ABTJB8Ficg=;
        b=VkqPUv2fPKoK7gy7iYpdlqY21hm0FQKdfP8obK41lOprYCxCedkR184q9VTAxkmMpe
         8osXEGPrlqp5UoX58thER+GuSERbFRMOoGiMRhsxSQymJo0scKwc/pC+05mM6tzbK5p5
         P9T0Ydeq3aSC4B+EnOt1qHvbfkA4vewzJCApiXckXbuHNQExLVcrNwF02oy0akvRcgaD
         ce21EoXNAe08W8/NCXj1ruVpCsR4Qntgc3Lv83nEU7x9ud/3Eka0cknTFFFNAQlHuuOc
         OwI3kEi433szvPU1MVt5Js3pHOoJvoMLBrjLIcy/vDIe7vPffPY2IfzbSGPZUkWDGioc
         JClQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtsUomxhwlkvWT9UqW5itSSyn2NTwo7L56xCCOiI7U2ftcUYbg2dkyreuyfYL69KAOy3sZWBOxpEdVugMSKY9I8yFAt8do+EY7dHiivkcpmQ==
X-Gm-Message-State: AOJu0Yz4l1DLg23MFhIuDcyudq/3VwM05kmW5EzsMEQTP6rC6x6/4CBX
	PtjYdSqOuaRBtsD0PZNe0cFx2MXBE4NMOUMJDLwrNHD0L5ci0mfUdEwcr/cO/oHFL4+7IXVvLRt
	NV9reAlT4HKPT3Je/JlZA+ccyE2EK8rc9a1KOkG1JHVOuFDagS60tPx8mDu6P3iXUIiNTAOc4Zh
	0eS+MaXqGYYm7sizZx5pcAV5mLmdaBx1t1p+2cEh9hMe/OaN4dsg==
X-Received: by 2002:a17:902:bb8b:b0:1e0:3447:8dc5 with SMTP id m11-20020a170902bb8b00b001e034478dc5mr7853382pls.63.1711426468468;
        Mon, 25 Mar 2024 21:14:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwt4O9JFYe1EZZmEzO6Sbv2fxkM9fzp0kVx8cNiJULf0bko9Urf0e0rh9UwekdZlbEud76q0+6xDYSjR16I7Q=
X-Received: by 2002:a17:902:bb8b:b0:1e0:3447:8dc5 with SMTP id
 m11-20020a170902bb8b00b001e034478dc5mr7853360pls.63.1711426468211; Mon, 25
 Mar 2024 21:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325090419.33677-1-xuanzhuo@linux.alibaba.com> <20240325090419.33677-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240325090419.33677-2-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 26 Mar 2024 12:14:17 +0800
Message-ID: <CACGkMEtBw86fXjFrk6Rt4ytOYOn2q7r5a4WuvsgqPGT8O7tr0g@mail.gmail.com>
Subject: Re: [PATCH vhost v5 1/6] virtio_balloon: remove the dependence where
 names[] is null
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	David Hildenbrand <david@redhat.com>, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-s390@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 5:04=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> Currently, the init_vqs function within the virtio_balloon driver relies
> on the condition that certain names array entries are null in order to
> skip the initialization of some virtual queues (vqs).

If there's a respin I would add something like:

1) the virtqueue index is contiguous for all the existing devices.
2) the current behaviour of virtio-balloon device is different from
what is described in the spec 1.0-1.2
3) there's no functional changes and explain why

> This behavior is
> unique to this part of the codebase. In an upcoming commit, we plan to
> eliminate this dependency by removing the function entirely. Therefore,
> with this change, we are ensuring that the virtio_balloon no longer
> depends on the aforementioned function.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

With the above tweak.

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

