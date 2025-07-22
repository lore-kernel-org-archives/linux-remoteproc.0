Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EDD248896
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Jul 2025 15:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753197422; cv=none; b=rPuI+eziZQ3DX7c68WDJPlGNW+t+fJE/LAYDDxoYVSNXx5Jswyw4hbgLn+2gDDR8x1y8PI6l4uVk2AAM297M+JaU5O7z9t4I1+s5bl3BIjkasHhH4Vj91UzDbkUCUkIYEqLJhduwFnDkc4DhYf0Wh/M/vjv+v9P2VQAwXST/eZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753197422; c=relaxed/simple;
	bh=PdMBMBDbTmgkREq8Szn7ylbIItPWbL2sfvCT+Ci/LFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OoIgqwfYk6UqBsqv2iGj0ewPEOLSeArszOs8A+oQZf+eiGJRaJFgOqxJRR8g2RA/mDpJ4CZysLdJZhhBP23xCF5ZoM67pl6+F0qVFb0ADBQLGZCtdT630qAksA4nzzyPhRCbu1Ptkxxtak+3gmZjnCa0tZGYiyoLD0Uk56y6ABQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LWewC+kF; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LWewC+kF"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74264d1832eso7113941b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Jul 2025 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753197420; x=1753802220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ngGHnN+wVTePIbSvvDu8hrTxMCBEaKhAX0lcY1Jf1Tg=;
        b=LWewC+kF7b/cC1HTK25mQjAlCAlZKQhBmcKVZrOo5a7xZYYfYTF817JHONc9By32L/
         wghxhinZpL92juW35Rwsjh3SbJGpbAprbPFl9rqy82zB9LO63BywbUOGtJO8FpJx3JJK
         edNickmvWBMUpFc2gF8I9orzMOgcO0HGF8u5cZGLX+XYnA3RjU1nXTzu4Lq8iQVIkaLK
         3vilprfDzjfORSwPs3fL93oPJMZLQJh45bcLW/ZhXAA/KRjLOuiIlesGKVZMopMsP2Fk
         3kFTNxDcJh9U4cz6f3VC9VQdWRYFslmsvCMuuKw1AcUAtcCzj/HNsAwYh6mnndk3v2ti
         77lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753197420; x=1753802220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngGHnN+wVTePIbSvvDu8hrTxMCBEaKhAX0lcY1Jf1Tg=;
        b=EOhxi1k+6SuAxDxwuYAYCT21ru6wNKCTTyvu6Y4eGt0FGOVEjvbd3X+4Shjtt8V1hh
         ux0BGXn37MQs17leKVruklNMt5QI9b46IsFerW9ojHhmSUtmrKkTe0ifN556NftArEnL
         lfChT3rMZoYILEpSVeT6WBoedPYFw2VZ42gmACkPOimI9RtjHQgd8f1Px07xq80aiZhd
         /bvllj0TEQXMYzU16pgkiFYdAmflnuqqzQvjRYtGazxQVZcR+uYIQcuuRBdENc3F/zdg
         7MfKSdNTO0+jcu0FZUcqTHjLryWtTPCSfJf51Qt+O0y/6dgP2FxCLfLRKrpWP211sZ9d
         kQbA==
X-Forwarded-Encrypted: i=1; AJvYcCV4eruqUZa0z3/1tJ9AaFCjWctUNV+f7HLfiGAGoTXdY9IFTi01Fm3zvbs9iQI3UB9oRAf8mS+nROr89OKBOH6O@vger.kernel.org
X-Gm-Message-State: AOJu0YywLL5g7X2kGQ5XUKUSaJToFEpPovl+2UMq/EXtzvH9dAvHhFUo
	q2QSGGg3gtXIENDvh1gTmaHEre1Tja56DHwV6vHV8gk4vjP9JTSgpvfhGgPvL8m2NRjop5PjwFq
	FarOfsLo=
X-Gm-Gg: ASbGncsCVh2Cu/LwSiAcK9Vb4b+n/C2Fn4KbWiDHqJVSBK8I4D8tCcwOinyQYxdif0g
	twzEQ+7HZains+wPdlpIogwbaa/fSTXNGsNA0zUVKVy9HLfK8RPXmqGi6j6qZa3MsOctZtfQijo
	UP45mLpoMWo//QUi2s9wyVtX/UEb3jA54NhjPZLiljktlqsASzw2v8YjqzRISijdX7sBe6jI2QB
	+IK8GrybHiwbRIDGoiEnm25L8WsLDkEVB6qjbq+mT175EORnSNJxU3Wjj3lj5t3G2oTtzaI948W
	nQw0HzSfwApZUtr35u3G2fRL/Pg3qYK9MYOUIbm+mo0tH5Lk1eTfPQrRn/gOqNRHA+DHq6avivg
	RxMPtYAWXuGhZ1uERJxF2OlFlug==
X-Google-Smtp-Source: AGHT+IERDsmZrSb6T3xrKFJ5eyMKVGje4EKWy128gDJPtvFbEZ2lIVjD/hPVUzYvwIvIMuIoNCXtWA==
X-Received: by 2002:a05:6a20:a109:b0:232:1668:849f with SMTP id adf61e73a8af0-2381376841bmr39703159637.38.1753197420257;
        Tue, 22 Jul 2025 08:17:00 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:20c2:197e:4b2b:9e1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe67facsm7329696a12.9.2025.07.22.08.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 08:16:59 -0700 (PDT)
Date: Tue, 22 Jul 2025 09:16:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: xlnx: disable unsupported features
Message-ID: <aH-raYufMNNipI7u@p14s>
References: <20250716213048.2316424-1-tanmay.shah@amd.com>
 <20250716213048.2316424-2-tanmay.shah@amd.com>
 <aH5bynQwaHbCJR3f@p14s>
 <ada00b1e-b717-4051-9b33-3f43b5c08097@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ada00b1e-b717-4051-9b33-3f43b5c08097@amd.com>

On Mon, Jul 21, 2025 at 11:37:23AM -0500, Tanmay Shah wrote:
> 
> 
> On 7/21/25 10:24 AM, Mathieu Poirier wrote:
> > Good morning,
> > 
> > On Wed, Jul 16, 2025 at 02:30:47PM -0700, Tanmay Shah wrote:
> > > AMD-Xilinx platform driver does not support iommu or recovery mechanism
> > > yet. Disable both features in platform driver.
> > > 
> > > Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> > > ---
> > >   drivers/remoteproc/xlnx_r5_remoteproc.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > > index a51523456c6e..0ffd26a47685 100644
> > > --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> > > +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> > > @@ -938,6 +938,8 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> > >   	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
> > > +	r5_rproc->recovery_disabled = true;
> > 
> > If recovery is not supported, and it is set explicitly here, does it mean the
> > present upstream code is broken?  And if it is broken, how was this tested in
> > the first place?
> 
> I think upstream code can be improved to change "recovery_disabled" to
> "recovery_enabled" and set it in each platform driver if feature is
> supported and keep it disabled by default.
> 
> When upstreaming base driver I wasn't aware that there is recovery feature
> in remoteproc until recently when I started working on it. I guess too
> focused on fixing base driver features. That is how I missed to add
> recovery_disabled and test it as well.
> 
> That is why it's better idea to replace "recovery_disabled" with
> "recovery_enabled" and keep recovery feature disabled by default. Same as
> "has_iommu". So platform drivers enable it if they actually support it.
> 
> I will add recovery feature for xlnx platform later, but until then it's
> better to disable it in the platform driver.
>

I have applied this set.
 
> Thanks,
> Tanmay
> 
> > 
> > > +	r5_rproc->has_iommu = false;
> > >   	r5_rproc->auto_boot = false;
> > >   	r5_core = r5_rproc->priv;
> > >   	r5_core->dev = cdev;
> > > -- 
> > > 2.34.1
> > > 
> 
