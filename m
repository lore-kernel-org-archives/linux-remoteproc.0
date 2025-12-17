Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D6B19CD0A
	for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 21:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766007091; cv=none; b=VKBu6FBYQe7nleK+e9aPVifsscd26jnRpJbBgQNnOUCGHnt5AW6HPc0nfDTCgiM1QSsYye2cF/uP4IuMAUSCKHcZbFxwPZamobzxY+ghrWAvTemM4S3jfV87K7n0FlWMlPIRVHzqRy5do61ZjMXIP7ehwKn2e7qLDUDOLWP9msQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766007091; c=relaxed/simple;
	bh=ZrwbbUW3N9FfT0wYKVT7nAip48ht2GpZQbyeczMtBq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqhG4VdQNBdqOYrx6TG5hgitGQZvwwfzowyK7Mj4UbWUFeBQ+d4PC8g27jYqLphFb1y4H/Nh3vtlVCSpoy3y0JXXaQHtNMvWfqVfjoBmBsLsD8oFzJDLsNgOePgSVNHk4QEPKgDt4cR4ovaEersWKkS3Re/ogXlPSqaZ2IBV1pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PEY/DN0E; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PEY/DN0E"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-34a4078f669so6256914a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Dec 2025 13:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766007089; x=1766611889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f5JApYGuzxiB3a2BPggX8fFjm1eExovTMlFNv757Hsw=;
        b=PEY/DN0EqDb7hVmnPDk4K60GhaaOMYOuHi7dd4SlA7fmyLHEcJGP82pA52aXXC2Epo
         gkZTgoyFaaSP2UamHd9Hr0JlKsgd1O7NYylOTjbeT6V0b84k4MfRYgoBqNSlODuLPn0x
         ltveHrqkJ10M5tLfvgB4hJNri2LRnCSXLORu4GPIO1iA2YpSv6sL59DSeNFLlE3vj1Ly
         1JPJo3nyi9Gy4DVKpFgbjTqrgQJNfJZEoPqJt4D/a9oezvt5dlztHQI6b3hvqxSasKOc
         36VAQQMnFl7/0jTurispgfkt3X2luoGP9jtPXK3oIVp9PJHG/dCN50YWxCW1BYGLHXos
         vpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766007089; x=1766611889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5JApYGuzxiB3a2BPggX8fFjm1eExovTMlFNv757Hsw=;
        b=Y/CLXcEIFwjKWMoUKpNN5wjyiJMa/PrhBAqMN8vL//z3EUFInSVX1DSMM+KyXKkkVK
         MtRlayS5AcJUAotSe6u+q6XN4c6xmH2h1wphajrdK7ntZ+3i2Jd+Y+jmFRk7tiEW3Ts7
         FpI1bx1PrQ0hX234xquMP4GSR6OHzupM5VcUe7DUwpU0WeOEPq7epl+/fy42sPnR87Gu
         VsjnE8kQXeZgdXSXwHqP/4mNihbpAAWAivOxA1SitPZoUNhYjPVpNULD6SxaqpyuLOe2
         sSbOJKqZil2Pd4vnpeLG/clOBnQb8koX4cIkZAGNDSnD+SAveaaUo+aaPXcll+Lg6c+6
         LICw==
X-Forwarded-Encrypted: i=1; AJvYcCWPtr75lK/mOv0JxtGQOPC7YIywE1IPZq7fY94Zh8xec0KiyikT1m5Nix6lQ76Uvo/v6ImiWgPE+fuoq4VXsAgQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyYSJb/+E5u2Kz8hKDo7ohKNUmyr6I8IlaPFLOe/FiBldfcl/8d
	ot/8MKP4hUv4WAtzsUQSDCCpC28MiCffn0vMK/eJj60eUPcXYQ3UypL7YHtv40QJ7AQ=
X-Gm-Gg: AY/fxX5N+IOojgkoAnRzZTS7SorRzcQxIMHmvOClDdF4K/18s+PU6Ouf6QpLSoiAa0S
	iMpOKvV1Er+3dIJbfmiUneE7bhP4+vWH8iDQ8zR6LnA9qqXxWZsTiG5Y52yWL6AW1+rSrD98NbP
	2uTaPjndIACriX1nbayWoRVMw0yeacE8lMajtwi3T/ElBgqRbVEGgGRpKxa4lWIYKDnybxrKpB0
	if1EnbtfOYxydCIOchaj+nIPuIkltT/630Oxyb3EcZt+juWglh4v2Q/IQMA5fV2LzLWxeeSEEqi
	TLLFSdVrPue52Rs3npeskCYxFiIB03krx6ZKIwYndzUqzBsCncdGGMvz6oVAV43LRsKAqrcNd00
	O2ArrdX1Cf5XRzrw4A/40GJq4InAYvO11JJKWoAzyZ2z0e+ZZV4CseFeLB4PGotg3oIgoWpG23N
	l5M8dDPCmbQKi/
X-Google-Smtp-Source: AGHT+IFlj92JtrStaZk3eC4JfdqeXsQIYzDTBERa3lbqEjrJAEjPEyL4DDHJKpCXCawtFFErwViJ3g==
X-Received: by 2002:a17:90b:1fc6:b0:339:cece:a99 with SMTP id 98e67ed59e1d1-34abd6dd2fcmr18316438a91.13.1766007089154;
        Wed, 17 Dec 2025 13:31:29 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:cfb9:c35:9f28:8222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e746cbfb0sm293722a91.14.2025.12.17.13.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 13:31:28 -0800 (PST)
Date: Wed, 17 Dec 2025 14:31:25 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, mst@redhat.com, jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	virtualization@lists.linux.dev, xiaoxiang@xiaomi.com
Subject: Re: [RFC PATCH 0/2] Enhance RPMsg buffer management
Message-ID: <aUMhLc9fe5inQN7X@p14s>
References: <20251114184640.3020427-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114184640.3020427-1-tanmay.shah@amd.com>

On Fri, Nov 14, 2025 at 10:46:38AM -0800, Tanmay Shah wrote:
> Take rx and tx buffer size from virtio device config space in the
> resource table. This allows each firmware to configure RPMsg buffer size
> as needed in each direction.
> 
> Original seris:
> https://lore.kernel.org/all/1548949280-31794-1-git-send-email-xiaoxiang@xiaomi.com/
> 
> Following modificaitons are done to the original series:
>   - Separate dma allocation is not done for tx and rx buffers. Instead
>     allocated chunk of memory is split between tx and rx buffers.
>   - If vdev doesn't support VIRTIO_RPMSG_F_BUFSZ feature then use the 
>     default size of 512 bytes for buffers
>   - Change MAX_RPMSG_BUF_SIZE to DEFAULT_RPMSG_BUF_SIZE
>   - move virtio_rpmsg.h from uapi to linux dir
>   - RPMsg buffer size must be set to hold rpmsg header at minimum in the
>     vdev config space of the firmware.
>   - align total buf size to page size when allocating and deallocating
>     memory
> 
> Xiang Xiao (2):
>   rpmsg: virtio_rpmsg_bus: allow the different vring size for send/recv
>   rpmsg: virtio_rpmsg_bus: get buffer size from config space
> 
>  drivers/rpmsg/virtio_rpmsg_bus.c | 105 ++++++++++++++++++++-----------
>  include/linux/virtio_rpmsg.h     |  24 +++++++
>  2 files changed, 93 insertions(+), 36 deletions(-)
>  create mode 100644 include/linux/virtio_rpmsg.h
>

This set is going somewhere.  Please address the comments that were received and
send a new revision.

Apologies for the long review delay.
Mathieu
 
> 
> base-commit: f982fbb1a6ca3553c15763ad9eb2beeae78d3684
> -- 
> 2.34.1
> 
