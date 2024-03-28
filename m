Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F37720DF7
	for <linux-remoteproc@vger.kernel.org>; Thu, 28 Mar 2024 04:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711600950; cv=none; b=gCLWJLUhAr5dsBTqDOVqvSIPI4vvRd10XDGNRVWqIwf/BRLD8e/5jqTnrSBJHvrP2Vt8IxIfjOUvFUer5DbpEtw7G9FBogbmL5M1k0LIe19b7J4nLq4EHnh9/pfv1UgKyDdSPwciVdOruX4xPgz37eGQSNz4Fzn+691/57TUxh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711600950; c=relaxed/simple;
	bh=lke8Mb/+VlM0WFVcd6AGtqJ7F4qGSoxqh/tNas4oTT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oh2Edj2LZpy8beihrAeMDI+0nKB7rxEF3Nrh6C+7CV3cpolXeCRv+cmSqKqYxwD2GBOtwg9rYA4XMj3NfaH+ZlaQcce2bNIfpFXqSuqUMzc9He0RA8xbrHEjl0HbK248gE7FMYfyxqPM/CVh+r6SV2Sf5sclzTWgUa7C9JQxXLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BUWtDvUn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BUWtDvUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711600947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lke8Mb/+VlM0WFVcd6AGtqJ7F4qGSoxqh/tNas4oTT0=;
	b=BUWtDvUnAnIP3vOUCsMV3Zl4WsEThtO6dj50v3AHhtqxjmBqp8t97BR3nkqBS/QmhSs3u3
	de1BAv1PRgirrhgB3KhbRl7kPnHyrXKSRtlmgD4u+j8sb7j8a3qjvZMEkokuEwOL1LAasi
	Zu/nHBLMp7KZu9Y0X4yVrugpIe5QKw0=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-k6MwVCgeNM-ZtoRbNq1XwQ-1; Thu, 28 Mar 2024 00:42:25 -0400
X-MC-Unique: k6MwVCgeNM-ZtoRbNq1XwQ-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-5c66a69ec8eso362341a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 21:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711600944; x=1712205744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lke8Mb/+VlM0WFVcd6AGtqJ7F4qGSoxqh/tNas4oTT0=;
        b=QnQlP9qOWogjCJ7kJpY7ihRQjZTKvfquPXXEWgPuNCmEHsnzLN0wT/9I7MPWsw57hj
         bHqH1eQbnBKECnf4CLt+UBQP76kX119vTjMaREIcw2XxLzHg3vnjKuITkBbwVHU2fsss
         w6292S/MibnCw+QnS8CjwHJlFEYX1MGBrn8Z7Zyhz4b5zFElhEtb+hVshJtiRPXcmNse
         L8s8jFRgGllLCv+KvA8Bm2Pmyy7yOx+DTfG04sMVZRBZPBF+TtARg/bNrndztb+Vr3vX
         7qulkjywmP4mMz42WOEf0f0FpZnH7VIu+UbX73A3nlUEtecOjEKLuhMPh+9IOSa1tXox
         NnWA==
X-Forwarded-Encrypted: i=1; AJvYcCVdrLSxrK5Tx+qSPSgaRw03wQJT6s5mlZELivfH0yuSnJZdg8J+mMf3GeNnM2iwFgtITan3/sI+rWUvdQSbonOfO4V1OjJIkZbtLAN5fTWXRw==
X-Gm-Message-State: AOJu0YyiefD+nF6zUvhbzzVu0kqeruUqjcqgU1P2Ko0292PSGofzHxgB
	JuvdFPCNyuJfWfdxCkLQl5yG+IPxaqohodzuEFRxVhKWxSEuQNYD05yCATr+bbfxjCH2cOgQj4B
	agOA5Qx8/VZ8YiMMC4A1Ji5Esxm+KoXj5O8NQnIuib6L4RCBjqK5PhmEbiLzxU6EZSwuuDKHCkQ
	pM8hwpbYIRTsIlH3Y1YvmJZixhnkoWnRC13iUJnB8bmg==
X-Received: by 2002:a05:6a20:3943:b0:1a3:aecb:db60 with SMTP id r3-20020a056a20394300b001a3aecbdb60mr2612166pzg.9.1711600944752;
        Wed, 27 Mar 2024 21:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGqMeGlScFLGjuf9ntL+wJAbmcBUMH9qH8VV+quAV82wNT4oC4BMh5FM/UUwwoJlJBLwmVhiSP74tk9QYL8V8=
X-Received: by 2002:a05:6a20:3943:b0:1a3:aecb:db60 with SMTP id
 r3-20020a056a20394300b001a3aecbdb60mr2612140pzg.9.1711600944494; Wed, 27 Mar
 2024 21:42:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327095741.88135-1-xuanzhuo@linux.alibaba.com> <20240327095741.88135-7-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240327095741.88135-7-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Mar 2024 12:42:13 +0800
Message-ID: <CACGkMEsViOCh-DGuRqZr=XGT+wJcG68CFAdiTcLc-q_2CtZ8tg@mail.gmail.com>
Subject: Re: [PATCH vhost v6 6/6] virtio_ring: simplify the parameters of the
 funcs related to vring_create/new_virtqueue()
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

On Wed, Mar 27, 2024 at 5:58=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> As the refactor of find_vqs()/vring_new_virtqueue()/vring_create_virtqueu=
e
> the struct cfg/tp_cfg are passed to vring.
>
> This patch refactors the vring by these structures. This can simplify
> the code.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

