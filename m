Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5386A320
	for <linux-remoteproc@vger.kernel.org>; Thu,  1 Feb 2024 05:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706766457; cv=none; b=Zb5xbbI38CEeaCyIrrmhBPHC5XrRMS58PTird1zzEgaryzgvNB5UVUzJj7O+viFUxRgpPaekMWo8cpMqu3eHR2V0UVMpszdTjlul3WikACSZYHANzfevTcf77ySTw6ZQboWf+LV6VaBbCNbNIrEBgY/EZE8287LHExOHOFedKD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706766457; c=relaxed/simple;
	bh=CBg4S8QmOTSeweCbha4veMntFYrtd8iVVLl9ekfIfl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYLmjewjQwtFRuBo8dNFZpPpzC5AJeUdhSdbZ933POdjBuhYn0LY9uJkc/dy2bkbavIw584xJAfiZpYEpopxpLXpRF6729q+sqKWVz998/O0WGMvVw5+Rn/KCGN+2P5KHsVEN1OraRljsQDQFlfi5+ZzbI8wZyUGzgcfpuR/qI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ikOhAKx2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ikOhAKx2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706766454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CBg4S8QmOTSeweCbha4veMntFYrtd8iVVLl9ekfIfl8=;
	b=ikOhAKx2WAcXvKJHxBuY/riav85BMNxlEg3IAnBabSZVSKo3bak4qrhU4MEL7TURCVTicM
	vQzD6g/6Y+79NmsxFASqEg9qXyiP0JOanpyVPvxtDMQKvVqoXjWxzZxxJBRhjj5RfEKZ/y
	TRhThUGFroeTHRJ1wlQ3hb/imYV1va4=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-C_VPow1-NZqOwpn81t99Lg-1; Thu, 01 Feb 2024 00:47:31 -0500
X-MC-Unique: C_VPow1-NZqOwpn81t99Lg-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-59a25e89211so598853eaf.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 31 Jan 2024 21:47:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706766451; x=1707371251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBg4S8QmOTSeweCbha4veMntFYrtd8iVVLl9ekfIfl8=;
        b=vTz6trOn0w7rMS9EsPcsUZb51xAvVEj4GLr4UH7xWUC+a9PuWBBl5hXU9WwTVvLf5b
         juw3VbJJBz7qG2o8ewEtAExsLCGTR/BgxmlTgrV/o6AjkdHwUg7XTC++bThh4eJVqT+V
         QyvKI/goeusr7MGbX3XOHFbW+SolmV/FBGcC1W1wPpfOJbyILN5lHK/4W6JcxiGqt1Bh
         IIiGQXM1tyjw2ZmqfBr6oEnAiqgzC9XhfhUkF/0s6Tj9KgYetBy17O3qg5w90kr2sPT8
         yAhgExvD2HFyMRGDsLnbRaJJkOq/allqbvrLm6VoZTD49HHbTJJim1p3YsP+qx3vbDl1
         qYaQ==
X-Gm-Message-State: AOJu0YyQ5Rdoju60UAIErKMJb2HM9EeBIbGf2KBeDhVXeCZhpLobtqoR
	j1vr02kwtQ4xrwEiaRSYsYAmLaD5zXYP1S/1unyv+Gspjiw2lp+8jz0uNTZccEMzaLKdDoQIgIj
	x4AIr/HXQ2hGmQDn37olVknIhu0EsNYdWN3H1nFoyCKj8BGJBXAz7nKyMZlNBMogHecooqg8Rxl
	S39K+HEw2IK8vApR0g0EM3Eh7pS4VqIXsH/yDfDMUX+A==
X-Received: by 2002:a05:6358:d39c:b0:176:8f0a:be with SMTP id mp28-20020a056358d39c00b001768f0a00bemr4016594rwb.13.1706766450821;
        Wed, 31 Jan 2024 21:47:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3An1AT31hO5hdkkjtXW6+RRmDXc3skwLBvXnf7TlMSMjKRjtJlegau4gTcU4VNwvLpLMGyNjYJHuT0DVlBR8=
X-Received: by 2002:a05:6358:d39c:b0:176:8f0a:be with SMTP id
 mp28-20020a056358d39c00b001768f0a00bemr4016580rwb.13.1706766450596; Wed, 31
 Jan 2024 21:47:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130114224.86536-1-xuanzhuo@linux.alibaba.com>
 <20240130114224.86536-5-xuanzhuo@linux.alibaba.com> <CACGkMEs-wUa_z_tGYEwBf7EVJAtuJdkX4HAdjqMXHEM1ys-gKQ@mail.gmail.com>
 <20240131044244-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240131044244-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 1 Feb 2024 13:47:19 +0800
Message-ID: <CACGkMEskm6O0q86LOJGndiCmaTCnoqKYWVct_g-0fwV3c+_1fw@mail.gmail.com>
Subject: Re: [PATCH vhost 04/17] virtio_ring: split: remove double check of
 the unmap ops
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtualization@lists.linux.dev, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
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

On Wed, Jan 31, 2024 at 5:43=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, Jan 31, 2024 at 05:12:22PM +0800, Jason Wang wrote:
> > I post a patch to store flags unconditionally at:
> >
> > https://lore.kernel.org/all/20220224122655-mutt-send-email-mst@kernel.o=
rg/
>
> what happened to it btw?

Haven't got time for a benchmark. We can evaluate whether we still
need it here and do the benchmark if yes.

Thanks

>
> --
> MST
>

