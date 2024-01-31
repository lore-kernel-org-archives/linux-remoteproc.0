Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5749067E65
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Jan 2024 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706692345; cv=none; b=omaxR8/yqMMnvvFxLQEXkMgx+Vn3/mBUCWkeIWBs0LdCu0CkeXG9PSq0g6YKSTRye57YORZK2Gc2qTqgCKLk8hkiyEUAoWbmbfBcDC3ROBsltwKSE2p/U1VEnuZSul233qgDA8X1PgFCuz9IAQE7z9Z1wkMludR53X8hGzlSoNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706692345; c=relaxed/simple;
	bh=F+LXEdvariXw6k3eT3r4qbtwZoi+V/LnKUO9+lO8CbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z43rVwlsDM4Aw9Gv57lOKTqw+N2Iyz0L30BxRKEyFyw35McK7gLBNKYPuIyQNFQRQsMM82muRwwmAA/czvrC1W5ublGBLmwJqbQ8HIb9WSXBnvp6yd5lqkd/B7IundubpdiK1mDIBVzZu+Fnrj23vCzJDUBbyfNOPRtbD/lXgmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g79jk8iF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g79jk8iF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706692343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJ+jKTMQJGFtJxaVD3p8fA3naqwcYxXT6QmKNrH4jT4=;
	b=g79jk8iFZdmOvfhh/W0Mo1FkDWFoc3q3M9kKmTSLP6u9PHP9ea52/dScj/QLOH2xC7jyNJ
	d9Pf5TllETOcjXbtalkOvwkQxkN3IrNGL+MJLrsRWJlsXw/rd10u5VgPMambSGG9KpN/YH
	jT1PToGtFntBITDNdwzwdavnh/lpTxw=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-N7v-YmLpPNWnzzb9QZyG7w-1; Wed, 31 Jan 2024 04:12:20 -0500
X-MC-Unique: N7v-YmLpPNWnzzb9QZyG7w-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6dfc22e98ccso545725b3a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 31 Jan 2024 01:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706692339; x=1707297139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJ+jKTMQJGFtJxaVD3p8fA3naqwcYxXT6QmKNrH4jT4=;
        b=lGMhhtQydt1wL8ljuq81tKaGbzd6qDha2xOSh9LTNheTohwUpQq3m9CQPdBALiOVA3
         hDvk4NV7PbeFvruC0e2POYCkOj1OQ54UpDPeXgKIEUiq99LXcSPAovPd+zquYuV7KOaV
         2XCqIVf2rdx3i00y8Vp3D4ngyyenV78OYJ7BMuCLDbJ+93cwMtxSGeQ4GEKmM3dE6SQA
         UC4gvGz5RJ0CJEh4fCJismMvghFNuRbR7X6bJKbPCBQFRt4e7m8nb2ClKMTLOOdAhITk
         3OFv2epRQoCU37ttC3ElfBd+EUe3ycUvB8mz2wF5KLpJ78diWRgWcIcKK+7xFlbRCicO
         AQ2Q==
X-Gm-Message-State: AOJu0YxjnluxNAFp74s9wnxZGZJCrh0+mIemjTTcx5DkaCMsDNUQQsg3
	KA8hsZbDGXEKDznYOetc+6TNuzGd1meRTpkaExz2WEJZYpHA+zqT6Oz7NIPfLPcNEGSbUk/9msy
	0uFtNYfl4r2kVGnczU5QamOhWr8eTukFsch64CW5yMCuQ0v+il8I2CLA9vbvHwM0fqou0H0kSnE
	McoZs/YXpnTNzZFIWhc8mP77jonpN5Z6ObBwZV5r2d8Q==
X-Received: by 2002:a05:6a20:9c97:b0:19c:93ee:b0ad with SMTP id mj23-20020a056a209c9700b0019c93eeb0admr1177505pzb.31.1706692339193;
        Wed, 31 Jan 2024 01:12:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmM479Cl5hy9Rh2S2MeFkPZK97XeCIQ/W+WuJDw6bc/3YGrYz5ABB3TPxpsK6OFnyn5gpDGlLKohRyPGIa5F4=
X-Received: by 2002:a05:6a20:9c97:b0:19c:93ee:b0ad with SMTP id
 mj23-20020a056a209c9700b0019c93eeb0admr1177464pzb.31.1706692338808; Wed, 31
 Jan 2024 01:12:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130114224.86536-1-xuanzhuo@linux.alibaba.com> <20240130114224.86536-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240130114224.86536-2-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 31 Jan 2024 17:12:07 +0800
Message-ID: <CACGkMEsi4B7Rz7Uu-3sTEH=9XRBRDmNSacZkVt6zxaC-FbYqhg@mail.gmail.com>
Subject: Re: [PATCH vhost 01/17] virtio_ring: introduce vring_need_unmap_buffer
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	"Michael S. Tsirkin" <mst@redhat.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Benjamin Berg <benjamin.berg@intel.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, linux-um@lists.infradead.org, 
	netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 7:42=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> To make the code readable, introduce vring_need_unmap_buffer() to
> replace do_unmap.
>
>    use_dma_api premapped -> vring_need_unmap_buffer()
> 1. false       false        false
> 2. true        false        true
> 3. true        true         false
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

