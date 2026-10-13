Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF67502D76
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 15:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906442; cv=none; b=Gn6apIpWGJIFShIWwSu4kY0Fec5e92uq/hm9A57n3azfsx1yBEm1iDcv/uZqhTMT0goMRn7SZJ55rG+D1Lu1R7S6ZshZ1EUq/37QFS2aocEJJPCUxZ8Skoe0DZy8xh9neWzEA49bqom4TW6ZmFKBcVj77LeK/1oAEPi/4js6QAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906442; c=relaxed/simple;
	bh=nqpdu9CR59AC2tddVN45hFHH0IJa5teU9ruMmfaeU+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmLGhHkfwtm49pqOKRvUBg5HPWzweYDvSWJu0yVZ27mvsmrl0n7loGsttebB/eFAcyq0q6RMmuneBNCa/+smUjMyondJKepK8IrTCzx0O/ccOePiXjpgfaKfuhE+1i3CRcIQZAJM7EobItoNjBOPwA6JTMfZw5x3f8ylEoU3dC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CM5yLK14; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CM5yLK14"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e915887d9dso6310905ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 08:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791906441; x=1792511241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XfdqMX/IxO6QSDu5r1ASHaftLBVU1+YpLM2EfGo/COM=;
        b=CM5yLK146p6HclsKHvKM9bKAhBqPZPzEA7o6NeLR4HLwEWtwQJQOiQTsDgNaeDcAgN
         MXmteXLPA+IiFFp0zGPUTtgFWs3RK4ZgpTrIqB3uqnE6s/J7Bma52S6klmT00iYbQBKy
         2gxXtEnHudg4gWZmWB3Zb/o8xIB3DF27cWKE9/jtknNGrD+Hrv/1qXas+mPm3f1rxczA
         h0R0ZfK8TyBHAmu36D/sUMgGBokOhthTz1IR4bjLLAQEEGFkR4f6Lq77WsbLX80wQzg4
         kJfCwQbbYdBfQLXgFiAtwXML9NwuB3N6zoIxgU0YqFiI88vPKNR5ajqHCaP3gEyxFZoe
         I+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906441; x=1792511241;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfdqMX/IxO6QSDu5r1ASHaftLBVU1+YpLM2EfGo/COM=;
        b=jvli+kS9E3qqhdV6d6gpAwb0MRFWlGMfEU5az68Qzkz55ZfuaIkzj6qLAZvTVl8Ybl
         OB9L4Xb+HEp8W5L6+iwSh4f93yYMMaqel17oZJXzk+x2FP5GKJxvNi8kA9dD8dCroUb3
         3UHZ2oVuEUvPzszlC6foK+3/N2cwtB6VhWH7QqgokB7/llcp6Io5JSCAnzT+p9W8sl0r
         McTgcmQgWQe/4iY5B/ozqrwh+j8XRHmFnr8phXRLWki9K4qJSwVym6NLJQ4FUAxI31Rl
         TVuXjp4uvFcj8PzGIxlunU21TU7HLqQ3A2g8csEeGCulKhe75gIcJUIFjxXEYthm622X
         P1Zw==
X-Forwarded-Encrypted: i=1; AKwUvByOrKqqiaQWqhhEZoSXGW1mXb1ySQGxHmR7evkZ3ugVHgCDyVf/bruSGfNEdQOJce9/lx5banyikDSBjSaS88Wp@vger.kernel.org
X-Gm-Message-State: AFq9FYJEbJ+9QfF0EbnjeqI2uZNP93vvc7NgjNUtZcd5SpzJjtu6U1pH
	j0xIabh2/2XeL5QEPrjKcmWYtyhz7jIva4/7woYIgUnH+yen041X5IzCdl1R7CNgFwE=
X-Gm-Gg: AYBFou3MhO4QpRhpDzQo6Jxm14VONm9FdV2e4iE2U32FHLI/hhC+G8+rQjog6cIybgl
	JXom356Huf51vd7MoYtRBRDEh3fVnlBQND+mHbl5x7r0sRpi8w482AiU4axf2HK0Mh8eWddK3pI
	b67J5GxRQ9e6BIC8FzWxS9q6kEcE3tPM/arDN/YnINfHqh4R8KLjTI0nND0IPVfBk393ExDPKFv
	HKE0lWuG2rvdFi14Q1qPwxCY0y8ISJsCSOHTtFWFNdNbOADiRAhIJ7Qv1X8h1mKphEJUMgpHJ4X
	DaA1mDvyI77biY6UzbDlKYgPSvMu0u+Z6gQlZqwnzlYI2erWST2fEDjk8sD1/JJY7vD6isHOQ5b
	hYxUhabXSJpJ7w7Ig1KJYtqdtnMJlfl6Zy6SyqU9+QrcApIKteZf0XvytV0BAuSLgZGUH3haYmh
	bnC3KGL88uXe8KzdXVehk62VyoiaeFNC4Cb5QBOcMIZq5H1lF8Zp6MXP1pw3mQiFdp9fBA4L8g9
	mzYBVipnFfOng==
X-Received: by 2002:a17:903:37c8:b0:2e6:c39:b25b with SMTP id d9443c01a7336-2e90cb5290bmr23619435ad.14.1791906440730;
        Tue, 13 Oct 2026 08:47:20 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:adc4:c3cd:7c5f:3991])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a0124csm58828005ad.5.2026.10.13.08.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:47:20 -0700 (PDT)
Date: Tue, 13 Oct 2026 09:47:18 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: virtio: Synchronize virtqueue teardown
 with rproc_vq_interrupt()
Message-ID: <as5Shj4EKjk2H2AU@p14s>
References: <20260926041943.1124650-1-oss.patchbox@gmail.com>
 <askjD1DxFvrV5ND3@p14s>
 <CAGG=RgA04aBS1QkTWoW-yjMZ0MxB0x3bTM47_MZr-yK04DPDVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGG=RgA04aBS1QkTWoW-yjMZ0MxB0x3bTM47_MZr-yK04DPDVg@mail.gmail.com>

On Fri, Oct 09, 2026 at 05:23:42PM -0400, Yuho Choi wrote:
> On Fri, 9 Oct 2026 at 13:23, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> >
> > > -     list_for_each_entry_safe(vq, n, &vdev->vqs, list) {
> > > +     list_for_each_entry(vq, &vdev->vqs, list) {
> >
> > How is list_for_each_entry_safe() no longer needed?
> 
> The first loop only clears the pointers with RCU_INIT_POINTER(). It does not
> modify the list, so the 'safe' variant is not needed there.
> synchronize_srcu() is
> then called once, after that loop, to wait for in-flight readers. The
> actual removal
> still happens in the second loop, which keeps list_for_each_entry_safe().

I agree with your assessment.  I will merge this patch patch when 7.4-rc1 comes
out.

Thanks,
Mathieu
