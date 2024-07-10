Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCE9195F3A
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jul 2024 19:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720641543; cv=none; b=V4ltTu143lrl3LGwX5/4kR4DfhKxdDShEjNwxjFxr5AOLdncBWf7yaNAFdIhJgp23ofXnyt0Z0mSRYW1FHaRpuJtZN9ey0Zx0u24cmTKPz+v3pTdPlEoxzGqKboon16eSTLRpuoeSGVdY+QTvW/KB8C7dmnWf7UGfZ/AHjK138I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720641543; c=relaxed/simple;
	bh=yaZFbOF1F9Ja9FQEvL/ykv3jVOt1v2vsmoWiE05XgDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGui3tqGnsSVqSIBLaHvw/dOroFFqcXV96mBuEAiBTr8HaGe6uNpf5NrKjUl1s/JG1NkRoX2UU/7bqu2ehJObxHpxIbafbJY9/BJePx94ZyefqpEZOw/1IyXnH0Z6XI3ZNbEaqWdhB53RRXjHJ+oRizTwiKYv/F2XKD49+CMGGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y72QKKOK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y72QKKOK"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a77af4cd570so13160666b.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jul 2024 12:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720641540; x=1721246340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaZFbOF1F9Ja9FQEvL/ykv3jVOt1v2vsmoWiE05XgDU=;
        b=Y72QKKOKgRj/tSTGFSphYAMWaI1ji/r3UWL+OPguo5e8sO5R4yCu4aZisXCNX9jMz9
         NX6BFAiPknUEl5UcTGxDZGnymMz/UF0g8nOdk5RMa3YYqcOj/LfSr4eSojVByc+fsKRR
         7gMQZASm9A8XuItWHhv9qHmlcfUm3ciNo6viY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720641540; x=1721246340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaZFbOF1F9Ja9FQEvL/ykv3jVOt1v2vsmoWiE05XgDU=;
        b=WIa03vu7Qb836hzTe3cAfDVk85s811gY6oFoZW9ohSluRCCkRZPp8D8480OXPlpo2X
         0kMVv7gJWnwpcAL3ozk8+J9Eb5iesioy683RAU4HrlzegR+pw9BsQ86cTLbUD+YHjzUn
         SM0Zc5Aomcy/UikmiLXzFrO7Ym5tmMsxv6hTjGsYrsKIpPPrvGjtvwb2zRQrYt0mXqrY
         df+cCfNc7y/S+JwXhEnqaMC7ZTA3jQfOvkbGrSrxvHsakddYBlgQZLHBDhG27ab2PbCN
         UNVpb8XvLQ94EYMogFj6eYHBqQ5TkeMyBb1oHnfiOGo0tc148QW7EVD5IUGitS/1YURv
         PFug==
X-Forwarded-Encrypted: i=1; AJvYcCUxj5ambaFBtqaESWdpsLUZbFjmEKmP+CS0rYms3rm57YRR9Pp9SWyaTHOQbyEzKBdHrLjzov2kGo/j6rsLfmslC5LhrqbVpY/ZEdFcNUNklw==
X-Gm-Message-State: AOJu0YzKS+uQU4hTbgUXQ0xgeG/y1KQ7ItnyImHN9Vtd4vhZuBvuKGDC
	wAq8KBLdobMsTcjtOZeKVDliwUinoEhtecb81v9Eya0lU7Dj9XBAH56TqvdI2QII5XGxvmyZuEN
	9TD/1Rg4=
X-Google-Smtp-Source: AGHT+IGt19iS5qWVhuJWVr7l54X0ud0r//v6Lq+gY4E4IzEfwoZwXLv/nZwX0G2pbRthWfK7yMlG2A==
X-Received: by 2002:a05:6402:40d5:b0:57d:3df:f881 with SMTP id 4fb4d7f45d1cf-594bab80834mr7052400a12.3.1720641539979;
        Wed, 10 Jul 2024 12:58:59 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bd459e08sm2544147a12.69.2024.07.10.12.58.59
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 12:58:59 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a77cc44f8aaso10364866b.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Jul 2024 12:58:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPhqf2wGXLH9Mi0qPJ2NyzqHGO7G+BLN7dkoeIRgt7kMkVk75RRxxEouI1WzwJbO8u8tbmCK1unUq6jXMmrmSyG7MkF1Vuf6cvctd09H3xyQ==
X-Received: by 2002:a05:6512:2111:b0:52e:73f5:b7c4 with SMTP id
 2adb3069b0e04-52eb99a3645mr4058074e87.37.1720641518212; Wed, 10 Jul 2024
 12:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720611677.git.mst@redhat.com> <3d655be73ce220f176b2c163839d83699f8faf43.1720611677.git.mst@redhat.com>
 <CABVzXAnjAdQqVNtir_8SYc+2dPC-weFRxXNMBLRcmFsY8NxBhQ@mail.gmail.com> <20240710142239-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240710142239-mutt-send-email-mst@kernel.org>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Wed, 10 Jul 2024 12:58:11 -0700
X-Gmail-Original-Message-ID: <CABVzXAmp_exefHygEGvznGS4gcPg47awyOpOchLPBsZgkAUznw@mail.gmail.com>
Message-ID: <CABVzXAmp_exefHygEGvznGS4gcPg47awyOpOchLPBsZgkAUznw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] virtio: fix vq # for balloon
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexander Duyck <alexander.h.duyck@linux.intel.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	linux-um@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-s390@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 11:39=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Wed, Jul 10, 2024 at 11:12:34AM -0700, Daniel Verkamp wrote:
> > On Wed, Jul 10, 2024 at 4:43=E2=80=AFAM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > virtio balloon communicates to the core that in some
> > > configurations vq #s are non-contiguous by setting name
> > > pointer to NULL.
> > >
> > > Unfortunately, core then turned around and just made them
> > > contiguous again. Result is that driver is out of spec.
> >
> > Thanks for fixing this - I think the overall approach of the patch look=
s good.
> >
> > > Implement what the API was supposed to do
> > > in the 1st place. Compatibility with buggy hypervisors
> > > is handled inside virtio-balloon, which is the only driver
> > > making use of this facility, so far.
> >
> > In addition to virtio-balloon, I believe the same problem also affects
> > the virtio-fs device, since queue 1 is only supposed to be present if
> > VIRTIO_FS_F_NOTIFICATION is negotiated, and the request queues are
> > meant to be queue indexes 2 and up. From a look at the Linux driver
> > (virtio_fs.c), it appears like it never acks VIRTIO_FS_F_NOTIFICATION
> > and assumes that request queues start at index 1 rather than 2, which
> > looks out of spec to me, but the current device implementations (that
> > I am aware of, anyway) are also broken in the same way, so it ends up
> > working today. Queue numbering in a spec-compliant device and the
> > current Linux driver would mismatch; what the driver considers to be
> > the first request queue (index 1) would be ignored by the device since
> > queue index 1 has no function if F_NOTIFICATION isn't negotiated.
>
>
> Oh, thanks a lot for pointing this out!
>
> I see so this patch is no good as is, we need to add a workaround for
> virtio-fs first.
>
> QEMU workaround is simple - just add an extra queue. But I did not
> reasearch how this would interact with vhost-user.
>
> From driver POV, I guess we could just ignore queue # 1 - would that be
> ok or does it have performance implications?

As a driver workaround for non-compliant devices, I think ignoring the
first request queue would be a reasonable approach if the device's
config advertises num_request_queues > 1. Unfortunately, both
virtiofsd and crosvm's virtio-fs device have hard-coded
num_request_queues =3D1, so this won't help with those existing devices.
Maybe there are other devices that we would need to consider as well;
commit 529395d2ae64 ("virtio-fs: add multi-queue support") quotes
benchmarks that seem to be from a different virtio-fs implementation
that does support multiple request queues, so the workaround could
possibly be used there.

> Or do what I did for balloon here: try with spec compliant #s first,
> if that fails then assume it's the spec issue and shift by 1.

If there is a way to "guess and check" without breaking spec-compliant
devices, that sounds reasonable too; however, I'm not sure how this
would work out in practice: an existing non-compliant device may fail
to start if the driver tries to enable queue index 2 when it only
supports one request queue, and a spec-compliant device would probably
balk if the driver tries to enable queue 1 but does not negotiate
VIRTIO_FS_F_NOTIFICATION. If there's a way to reset and retry the
whole virtio device initialization process if a device fails like
this, then maybe it's feasible. (Or can the driver tweak the virtqueue
configuration and try to set DRIVER_OK repeatedly until it works? It's
not clear to me if this is allowed by the spec, or what device
implementations actually do in practice in this scenario.)

Thanks,
-- Daniel
