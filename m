Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718C254673
	for <linux-remoteproc@vger.kernel.org>; Thu, 28 Mar 2024 08:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711613216; cv=none; b=LdbDbjGsVN4bRvrfuYJm8G68QakW6THwdzmCx/y/mAjczfkcu0LKVUncf/R+PsLnYso94V7r8iHOjAYib38X2dQO9aBdcuzV+TEd3Y4fxOfepixu/FxJ9RG+dk6QuegNyYELgwh5gbFlO7kajz10NrUFAHYbV2kUe74+t+jlVGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711613216; c=relaxed/simple;
	bh=/MW0cHjA5IzOddregUHmjjXRlsROk5qw/WwkRF1E0qA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b3W42M7NFIO8VeOvbbsdS+GKt4TIzIBfsbrmF5ADrINaJG8hn65JrppKq7DySmc1GqEbYvFHCiAFDUuAXYkBsvUKayo95/kEsBAS4kOaUgCEBtpd4hx/uzU16SQWe4dFSFnet+P8cxQWtXKZipzQ9f94p9lor9QugnRj5T0AJXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KUzAT26v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KUzAT26v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711613213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/MW0cHjA5IzOddregUHmjjXRlsROk5qw/WwkRF1E0qA=;
	b=KUzAT26v5EcHwdxWqCJc/t8c44aF7HI6+CdWaWD95ebirxs7l2eY/mPptr7zsKRREh6OCr
	PPYA4sJAzN5u9j4t6GR/trm1Sm+e5roIhPHP+y/lgKDsm3rzh68nN/Xi+rR5LXWMU66bMQ
	+dY8owzbXaPGzz1Ql2gojNcB+EnL6jU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-X4K63GAXOBem6Dw_EI86Wg-1; Thu, 28 Mar 2024 04:06:50 -0400
X-MC-Unique: X4K63GAXOBem6Dw_EI86Wg-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-29dd9bfd4fdso709128a91.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Mar 2024 01:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711613209; x=1712218009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MW0cHjA5IzOddregUHmjjXRlsROk5qw/WwkRF1E0qA=;
        b=nFEdLProIC/XQqrd2QoXsCoXIci+m6x6w/H4CZVB6oX01RES3jhs53ouzDNrHzVuRF
         6XWRYurzt2ovnAvNrnpKlYPeKhZYzFEYXoJh9kXPbSiHLaVrldmwaW7dBrj9WVK/tYrg
         +7ec75HTP1HgG83uFbfbIPicf2KMZF+Nqp0ldMeJk6mXZBgRqsjnswIuv3X4UtE2krjB
         1Sbic9QnVgCZdpTYAl59ebeSI4CsOy6vAv2ivqa5kqyB5EnetP1cZdTiF4VZ9+aL/Tft
         cCjqczOO5vKheZDBHpHYek6uRpxj8UH+LMUFEvl+ZPQIjzg7yXRFaR//UnU7EsG/SpkN
         au/A==
X-Forwarded-Encrypted: i=1; AJvYcCX/9n+QnwxtTcf3IqVza94xm2v1yxiCQGIHMUWTmCPMjDFQRDVW8OUpMsQ6Oel/oAGhCInR79ETSgFt/8zyF8QqICguCy0fOU/LGHFdZ51CVw==
X-Gm-Message-State: AOJu0YxgQ01jHDlVgw0HyYs5QYs1wANxCZmfWDQbOwqGt23XkR7H6Wsi
	EKurVDctUy77scC78DLTtHkyg+sBFQ9Cs35TVx/Q8xOCWH7vJrgwG3mG1wE0mm5XDu2VtWnENI4
	XGb8SfWCW6hzA/gzQlSwbOQpCKxqxThqVSK8/uERk8RtXjpKxn9C//1IfADvMV037LPQ+/BdLBR
	f4gI9ONqPlXl44ZrR4IFQeb7mShJoMbZtojvQS6IqNjw==
X-Received: by 2002:a17:90a:dc08:b0:2a0:4c3b:3454 with SMTP id i8-20020a17090adc0800b002a04c3b3454mr1573883pjv.47.1711613209127;
        Thu, 28 Mar 2024 01:06:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr3cKtOM4ZCyHExJ4R7r8BZoA5SFTXeHHD/kYgfJMhl+KEh6JWHIkXDQz44FirN0E+6Cmhpkbslv31U6+rB3Y=
X-Received: by 2002:a17:90a:dc08:b0:2a0:4c3b:3454 with SMTP id
 i8-20020a17090adc0800b002a04c3b3454mr1573868pjv.47.1711613208786; Thu, 28 Mar
 2024 01:06:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328080348.3620-1-xuanzhuo@linux.alibaba.com> <20240328080348.3620-6-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240328080348.3620-6-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Mar 2024 16:06:37 +0800
Message-ID: <CACGkMEvv5UdAEC4N_AfQRM5TeVnPLC7PWpBvURxn+wSUhjFqrw@mail.gmail.com>
Subject: Re: [PATCH vhost v7 5/6] virtio: vring_new_virtqueue(): pass struct
 instead of multi parameters
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

On Thu, Mar 28, 2024 at 4:04=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> Now, we pass multi parameters to vring_new_virtqueue. These parameters
> may from transport or from driver.
>
> vring_new_virtqueue is called by many places.
> Every time, we try to add a new parameter, that is difficult.
>
> If parameters from the driver, that should directly be passed to vring.
> Then the vring can access the config from driver directly.
>
> If parameters from the transport, we squish the parameters to a
> structure. That will be helpful to add new parameter.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

