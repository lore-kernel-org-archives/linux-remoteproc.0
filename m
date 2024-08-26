Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5A3450EE
	for <linux-remoteproc@vger.kernel.org>; Mon, 26 Aug 2024 16:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724691066; cv=none; b=GSC+zphJmxUE1At+KiHvZiC/ZczGhqxmJmDCqrd7Zw/fWnTqgjNy/HHveSGw+LUVF8rHzEdNaWK/w/bsLW8Nqr+4xCfRFQstp6b/mAGVRHkqWpnAvMzstkCGKdA5WnxbNVDtIY/H0QyY7L0iAZ5svesvyO+oGyJWkcUmCWw8LY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724691066; c=relaxed/simple;
	bh=gZZMB8Bj6ewUw/zL5+DN3IoB33pIYJ8nX6JWmHUpliA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5a/tHnzAynBXZpf19P5VLIDfNFFuLogEor4eAfrMKrJBGcN4n1uW5LMZXQmoqBJotXZnbKi0kK11qkenn040DHBfeVFw4vsI4Pw116sKP0xAfPllekQJbis0qxqtyQ0UbuzHhzPOZbPPBh5hjw1QqDtaRZFV/Fn1zpzyFoxzG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qfSUXb60; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qfSUXb60"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37196681d3bso2768773f8f.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Aug 2024 09:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724691063; x=1725295863; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yvUcvsBoy7ZpyrmgXo9xzimpUYMh0nJr80CML8LANHI=;
        b=qfSUXb60iZbhoV20D6TsO2icKnAsi8CA2LauKXD9eymU/WPS6Ax7wfd6MHMKn7+SRv
         3XFqLXDyAuJVW8qfbzerve1JqXzLz7W08LdwvqTiohudHxWJS1XWx9pcVP/cYQij78XS
         n1FjTahv1ql80qDpxdbVuDVEvTfcfp++efaIOmO802bueXWuk3tOD4t1BgD1mAPmg93o
         5hGbV5Rk20QzSiZ5o3hIXt1EIeIhDRfSTBOfa8TK9PJnO+T58lLWF5R+rBOH1Jq3VQgF
         9+TySr2FpBzXLtAB+Ol0Yl+quVuvsUgUdrrHmfRvIn5yhXGzAlmgrFg2Z/wXAU1yZlbZ
         SSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724691063; x=1725295863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvUcvsBoy7ZpyrmgXo9xzimpUYMh0nJr80CML8LANHI=;
        b=XtcMdioDiGn/74BCFuMH7BOXVrqZqsDE89XEYAFGqyYDTVlIaI81mPel6AJZpJ+X2V
         Dam9MzCZODRjU0/jniBwlCATdPPuRUz4TWCEzLrUpJ7wBbXl+5pFhW6gIJjMs+HnGRdX
         pszEQasIdOxm+Y+jFTHhILRRyflW/ewcUL1aVE0FfltidfGl/CTN3/ua438OJkWnUYtz
         9zVMRftf8ipq+6wF+5cmVvy1Tsrp6cqhcLBsq7IGmp7GmD3aaj++NCZHN8GltkamC2re
         R4y0k8li/dNe9oTvRm7AP9Ma7gUnsb58aCxcLiZTsQxaaSHfCo2VLLZpqauUtG8toMIv
         sDoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWSq2bMGKib9jMqWDLVCs5Q1hgLMTQETPlD/Mnv0aTL727v2qGBSnUTVT7jmVhdLB0FSoDpA8kNu+eEPO4rL8d@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9KtvRBJBU5GKdMMrS0pzFLzEEHnMLAsEzb/S4RqceU14M8TjK
	atCwsK3U8j4pezCK+iOwvDmW32o/EyZZYCLDFZSk9oiCnSZpvT6cT9nqIrvw21s1IfHL+/x5xs1
	JWHL2ODTh95ioRl9WGLPdEE3ZLpvirt4NEtJuzw==
X-Google-Smtp-Source: AGHT+IHGdEHeE5B2o/lXFkvWhJMgnFwPUB4hYuQYQWI4lUUWisu7VenVHtd86tioZ/lsdvyeECpQiDbKPw7RLcXOFGA=
X-Received: by 2002:adf:fa90:0:b0:371:8ea2:7767 with SMTP id
 ffacd0b85a97d-373118b8c47mr6674550f8f.27.1724691062971; Mon, 26 Aug 2024
 09:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <133c1301-dd19-4cce-82dc-3e8ee145c594@cornelisnetworks.com> <842aef7f-d6e1-490a-97b9-163287ddfe2d@cornelisnetworks.com>
In-Reply-To: <842aef7f-d6e1-490a-97b9-163287ddfe2d@cornelisnetworks.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 26 Aug 2024 10:50:51 -0600
Message-ID: <CANLsYkx2OThcBjs1Qn_Bgd0LE1+EN7c0Dh7NE=1dEBB4xqS9cQ@mail.gmail.com>
Subject: Re: Using RPMSG to communicate between host and guest drivers
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: Doug Miller <doug.miller@cornelisnetworks.com>, linux-remoteproc@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, OFED mailing list <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Apologies for the late reply - this got lost in the vacation email backlog.

On Mon, 26 Aug 2024 at 10:27, Dennis Dalessandro
<dennis.dalessandro@cornelisnetworks.com> wrote:
>
> On 7/31/24 4:02 PM, Doug Miller wrote:
> > I am working on SR-IOV support for a new adapter which has shared
> > resources between the PF and VFs and requires an out-of-band (outside

It would have been a good idea to let people know what "PF" and "VF"
means to avoid confusion.

> > the adapter) communication mechanism to manage those resources. I have
> > been looking at RPMSG as a mechanism to communicate between the driver
> > on a guest (VM) and the driver on the host OS (which "owns" the
> > resources). It appears to me that virtio is intended for communication
> > between guests and host, and RPMSG over virtio is what I want to use.
> >

Virtio is definitely the standard way to convey information between a
host and a guest.  You can specify as many virtqueues as needed
(in-band and out-of-band) and it is widely supported.  What
information is conveyed by the virtqueues and how it gets conveyed is
entirely up to the use case.  Have a look at the specification of
existing virtio drivers to get a better idea [1].  If the driver you
are working with hasn't been standardised, I highly encourage you to
submit a draft for it.  If it has then add to the current
specification.

All that said, you could use RPMSG as the protocol that runs on top of
the virtqueues - that should be fairly easy to do.

Thanks,
Mathieu

[1]. https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html

> > Can anyone confirm that RPMSG is capable of doing what we need? If so,
> > I'll need some help figuring out how to use that from kernel device
> > drivers (I've not been able to find any examples of doing the
> > service/device side). If not, is there some other facility that is
> > better suited?
>
> Hi Bjorn and Mathieu, any advice here for Doug? Adding linux-rdma folks as that
> is where this will eventually target.
>
> -Denny
>
