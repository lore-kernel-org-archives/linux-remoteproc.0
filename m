Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510D578674
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Mar 2024 19:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711135013; cv=none; b=EAY2ejQ/lubmh2rF/6wS7oGQGuagqIMxQnjc6UF19t3cSOKGaWHNGZzNQKpf1sDU1e5Y7roGmfI4doBE5VqKLZakC0HOkxRznFzA7lOUgq8BY77SjhO2aPsOxcdaxZoD9V4VWxzTYLh1MKdoeaNdlfwSMC8kODBIDLA7cmU5hLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711135013; c=relaxed/simple;
	bh=75iHcA9RFOUt3YMY5SehfwsBmnLNCyI0S4Wb9m834B8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zs0+0djA2awd8CzO6MO2HebOUu5kiiLiCPLIUY/uCniLJOmKIa/cqdf+NP+65aAl5FIwtsHZOQ69Da/bGWIRdKTYDiotZzZ8JhjJZXCp0s3B/ZY7vQHK2dymSchOeV6iYU/xjK7FsFKxo5h+IZm2FJmgvllae4RzlAn6qXoS5Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fbp40RoV; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fbp40RoV"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56ba6c83805so3014128a12.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Mar 2024 12:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711135009; x=1711739809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75iHcA9RFOUt3YMY5SehfwsBmnLNCyI0S4Wb9m834B8=;
        b=Fbp40RoVAsq2zk1ka1gJaBVxa6uz99wpoMLenh/9yBLVvpceTB4KQRr06SkTJpUJGi
         24TQjFD2aHPnfYS7i8pZJT6nAQebyCJgkrlbzxuOpz+KCS479Y16t4nuQ2BC7onZOU8N
         qvKmaD5PZST5LydVDOLyyckCC2Jmf/vf25y6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711135009; x=1711739809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75iHcA9RFOUt3YMY5SehfwsBmnLNCyI0S4Wb9m834B8=;
        b=ft+tzJgYTzvRR5vfCxXnsjDLI315Tz31h04D71oRO2IR//MUNEDPZepfdeInfUHLa5
         WLmP2HUrcnQ8iWK9sGhG4hUKmmYHHl8raQ6TryUPsHYWfrgLs5PoGqMWkk4iyoOBziTk
         m4lRY29QUPdX9JxDmFsYOX9IhvLwMK3tPIwxXUHyiYmSNvY9OKqgapk4Vy8ElKYqnqdy
         JIL2yURW1PVu9U6Ri+UFyw/xFdkFGu0oshG1aHXqvpogYbU+W2x48t1A0QgHznt7ohVJ
         7Vl6psXdHU965dIIYyHw2SRG8ZcyDQPh7oXJ0XmSxSWKW+gKrFFnsw55UjmgIgQuMexY
         sC3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXj159GCcx7Z5loT0zwV5H6jeNom6sQjqN/WYjm7cjZ2iGWC31y60wGWwUA7Q7GHTfi27iDB84GJ2bxvCK3VmyiqCaPk4pnUMxZ94CrhMRUsg==
X-Gm-Message-State: AOJu0YwC1bKYwTKd2mqMU6R2wxXNmQmgAvIKXTe4LkIR6gHi9O6hg5SE
	yZlEHk0tAIIw1tMh9zwZbg1uTeTDmrd7h5f7e/GckgObxJpBhZrsd7NEJGuAOcteA5tvY4gPMk+
	o7g==
X-Google-Smtp-Source: AGHT+IEaIDbRka/VI2GK7NpV2WNYRVs5zL5qz+MEvK7vJcMzcXTUllXNbJk+YPVIeyDcBz/hrxE4+Q==
X-Received: by 2002:a17:906:2688:b0:a46:8c40:7a3a with SMTP id t8-20020a170906268800b00a468c407a3amr495275ejc.26.1711135009453;
        Fri, 22 Mar 2024 12:16:49 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id g6-20020a17090670c600b00a4519304f8bsm134172ejk.14.2024.03.22.12.16.48
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 12:16:49 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4146f2bf8ecso18515965e9.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Mar 2024 12:16:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUcZD8fl2XSd07+aArLjBeLN4HMawnsydWUDkfvRCB5fdivQ5mGCUc+GGi53FWGtM2uZNwCgIjMGQeZsLk9nWMf/kN0vDx3RZNmTPoWlGJ2g==
X-Received: by 2002:a05:6512:32b2:b0:513:4b90:ae9a with SMTP id
 q18-20020a05651232b200b005134b90ae9amr255604lfe.67.1711134987739; Fri, 22 Mar
 2024 12:16:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321101532.59272-1-xuanzhuo@linux.alibaba.com> <20240321101532.59272-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240321101532.59272-2-xuanzhuo@linux.alibaba.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Fri, 22 Mar 2024 12:16:00 -0700
X-Gmail-Original-Message-ID: <CABVzXAkwcKMb7pC21aUDLEM=RoyOtGA2Vim+LF0oWQ7mjUx68g@mail.gmail.com>
Message-ID: <CABVzXAkwcKMb7pC21aUDLEM=RoyOtGA2Vim+LF0oWQ7mjUx68g@mail.gmail.com>
Subject: Re: [PATCH vhost v4 1/6] virtio_balloon: remove the dependence where
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
	David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-s390@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 3:16=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> Currently, the init_vqs function within the virtio_balloon driver relies
> on the condition that certain names array entries are null in order to
> skip the initialization of some virtual queues (vqs). This behavior is
> unique to this part of the codebase. In an upcoming commit, we plan to
> eliminate this dependency by removing the function entirely. Therefore,
> with this change, we are ensuring that the virtio_balloon no longer
> depends on the aforementioned function.

This is a behavior change, and I believe means that the driver no
longer follows the spec [1].

For example, the spec says that virtqueue 4 is reporting_vq, and
reporting_vq only exists if VIRTIO_BALLOON_F_PAGE_REPORTING is set,
but there is no mention of its virtqueue number changing if other
features are not set. If a device/driver combination negotiates
VIRTIO_BALLOON_F_PAGE_REPORTING but not VIRTIO_BALLOON_F_STATS_VQ or
VIRTIO_BALLOON_F_FREE_PAGE_HINT, my reading of the specification is
that reporting_vq should still be vq number 4, and vq 2 and 3 should
be unused. This patch would make the reporting_vq use vq 2 instead in
this case.

If the new behavior is truly intended, then the spec does not match
reality, and it would need to be changed first (IMO); however,
changing the spec would mean that any devices implemented correctly
per the previous spec would now be wrong, so some kind of mechanism
for detecting the new behavior would be warranted, e.g. a new
non-device-specific virtio feature flag.

I have brought this up previously on the virtio-comment list [2], but
it did not receive any satisfying answers at that time.

Thanks,
-- Daniel

[1]: https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01=
.html#x1-3140005
[2]: https://lists.oasis-open.org/archives/virtio-comment/202308/msg00280.h=
tml
