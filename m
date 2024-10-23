Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C401C4605
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Oct 2024 15:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729697738; cv=none; b=Da+HYNaLP+FEfR6drehxYm2ufiqvVepJosNFAOxhCSA+bcmMvGbdobI/62KPvNESWqCpIuvP8Kt2q+YNydkxXS0uxsvyligc6XkJJpg93tIOEr1hHkIXlg4jfkOYhiCvjBRn4dNta3gyw5h61hnbGMSjA8ELbjXyzXA2aJwBdE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729697738; c=relaxed/simple;
	bh=JEiFqaiHbJ5O9qpGbnATSfozpf1WVA+k3B8AGzEoILs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qL8jjWLa0kTzQExtD+eTKkw8mmm7VeGZKvW61FzAyUvedSUjRaDYzsudjgrVmum/hHwUgi5NDl9uaAQEf4FVGCNlgaJ2PCOcWSHkNclYQiobdtR2scVdUjvpZycFM+BWT1VU2gfuCff0/3kntB1yQRcG6xrEDOSpIgwVwVOaygI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xrphja/X; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xrphja/X"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c937b5169cso963791a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Oct 2024 08:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729697735; x=1730302535; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p28uc21fWFodaB6on+PruEO3BbZIAcbTdzEIX0nHYoE=;
        b=Xrphja/XXX6pZHmWTcyk8WMkgghBOwvUeQrPKdKBLgFQqpkOcIRkwOzKCVvG+dpnqC
         0RusUJ+ufScL+S0G2y667I0dxU7efVBOmXlSMxhmBWX7jsNqFLRmzLoUglyA9YgXc0Fq
         Z5H4+NfZafiP6jiWG76OKkPO7XnaOoH4XsXaXdhaAe0KbiqLNOv4/hxBxi9JP4IJMrt7
         xmFq90G7cXWDW0PYH9l3MYrzhrR2qn0hVogTteD5PfcnbBUAXPdX2/K2Un8eF+4ee8uc
         iV2NVEpMe3D9B6nCrlS3d4O3cuKUbPI9Hm1cAvv1z5kw44TJYJEyx1qmVkgdvMulcBOE
         QacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697735; x=1730302535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p28uc21fWFodaB6on+PruEO3BbZIAcbTdzEIX0nHYoE=;
        b=YU1uqIzJBB1uZITxwZESNBHLlWbP7zXlc6ftwdsarHuVd4JlAgvx4KiNjgxEfBoElI
         EIEcQ6RpHIKuAhYeXAq1nOMQEjEU7ECdKNRNdQz+WJeqNEkWk2OOYlHEoEyln1GCbgPt
         TRj8aB9Lk5ECnV3hp/WProODyw73KdQGkmiUuT6E0mOinx7wde1nwtBiohNf75R+K/UP
         8lHG5NUB9Ug56cxpq/HDCJ8TfmcApEacW291tFsAUmP3PUFiGMEeAxSdpPc2d2bxVf+y
         TMzfFlgErGUfoLz94cj5fWwgZBBV+gbjoIQ4j+++Bpu7kKalJRTVw93BrERD7PBYjcw1
         61og==
X-Forwarded-Encrypted: i=1; AJvYcCUhFKNBVXtdegzc8KW4Cl47FoESLHRzxOM/xWXnTaDmSKUmuCroBgchsVCjbbE1ejGh6vFJDqzSAj9d4/0uMa4f@vger.kernel.org
X-Gm-Message-State: AOJu0YyMAUz0YGC1ns9zkuAQy9ovGBbV6sQeAGZryI2ISQ6lkWeAhN3C
	t40oO5M+XLbkT8KnVSFxfNVPsHrS2OVt9vxuR0YjKpzr+BpSEv6H8u7v3Vw8CXAiAo0SR1tRlgr
	lxnnuzBYtyJsjugrEUrLDXSz5ex0wCgwiJ9cTXQ==
X-Google-Smtp-Source: AGHT+IFDu/ofejso4Js1LrscXtrQ2iS21X03+5ghxi5THGUm+IhbV0H9o95IMf+2KcTs/9Akb+ABfU9jyXps9vBix+Y=
X-Received: by 2002:a05:6402:270c:b0:5c9:813a:b1c1 with SMTP id
 4fb4d7f45d1cf-5cb7944cd65mr8062677a12.1.1729697735452; Wed, 23 Oct 2024
 08:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023053357.5261-1-yesanishhere@gmail.com> <87a5evncxf.fsf@trenco.lwn.net>
In-Reply-To: <87a5evncxf.fsf@trenco.lwn.net>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 23 Oct 2024 09:35:24 -0600
Message-ID: <CANLsYkyq7wJHa77ahJBD5kXhhZB74XazU78aDHtUzgRgFdTrNQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] remoteproc documentation changes
To: Jonathan Corbet <corbet@lwn.net>
Cc: anish kumar <yesanishhere@gmail.com>, ohad@wizery.com, bjorn.andersson@linaro.org, 
	linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 07:53, Jonathan Corbet <corbet@lwn.net> wrote:
>
> anish kumar <yesanishhere@gmail.com> writes:
>
> > This patch series transitions the documentation
> > for remoteproc from the staging directory to the
> > mainline kernel. It introduces both kernel and
> > user-space APIs, enhancing the overall documentation
> > quality.
> >
> > V4:
> > Fixed compilation errors and moved documentation to
> > driver-api directory.
> >
> > V3:
> > Seperated out the patches further to make the intention
> > clear for each patch.
> >
> > V2:
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202410161444.jOKMsoGS-lkp@intel.com/
>
> So I think you could make better use of kerneldoc comments for a number
> of your APIs and structures - a project for the future.  I can't judge
> the remoteproc aspects of this, but from a documentation mechanics point
> of view, this looks about ready to me.  In the absence of objections
> I'll apply it in the near future.
>

Please hold off before applying, I will review the content in the coming days.

Thanks,
Mathieu
