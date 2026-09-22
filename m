Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B35549389
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085203; cv=pass; b=gUY0pnnvmgUh7ERI01/Vawnj7Tt0R58jRSeXh8R1aUtoDY9IKl0Pcf5mHRs+A4bfgmxMoqYUrdz28fsnKpNXW+x9COlF/5qy/rI8cu0esCDlI9V1yC38plPils2gDow9NAuUMkltLz2hhHVdNNsfLerJvXl8COYKaPschRn11Sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085203; c=relaxed/simple;
	bh=0hurBNTkrVz1B/9TW5ipWegr4/ZEEZE2GB3faJsOdT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rveZ5qudHfNHc8PBETWiX+y3rAadG0G95jfJrv4JAmujlWEkQStxLeAu0M4wYv+6GPJY8Xjy4UrKnAFtmSj4H4uU8RSMPW9bnS3HQegkUl3VMWA/YZWkWF6CYywSCOvPZeTRpH/ImlvCgFohRUbX0V52SqvfmOo02tNWPRyIxng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBxsn/jR; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBxsn/jR"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso7427990a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 06:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790085200; cv=none;
        d=google.com; s=arc-20260327;
        b=b4pmZPuvEKF11JYRai0wm0kl0wddfuBaTnwcb7df2Zx5fg17jS+hgtgpqK+gb52kh4
         djivG02g77UOvbaew3dFW61LmoCY9HTlWCI0djctmFtpAIzVXZhVwFeSnhGnDkmaHl/q
         vbvXWmyCcMkMbkD2oYnPvWq40Q42pyNcDKJ0oLR/kuwjQ411fNAkL5qONDocfvCdTIQd
         oEGE7Rbdxeu6S0vg4V8mFnaQ5LcClHGbIXdP0JeXB+m94/Cm085VAS/L9TVoso8Fn3kO
         6oAopf53Bo++EUroDj3rtNWOr2SJdzkhpz7zXanaXCLmjM6BJYDTODMUCt+JBmjM+bhy
         HQMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        fh=Fovygw4qoeLghx5Qk1XEKVUwhtR3zxvNdbcmrfqjEE8=;
        b=LONgN4pjjwFBOPS4+P6AbC16zOXgwC1d9s6CCn+Fm+91qCFLXVGmlYmEyI3eVKCx8x
         hWS752Dk2ujjqPsYBsiFopMIpImo/T1t0yOs9+5reh3n7mWRHWRTukHGG7aekWGv9ImI
         Ntxg1OWiln9wMqMB3/c3XOfHm6vmnhgEe85ruf77mKju9C1fc48x/a5eVt6ANRkZ6Yxg
         pElPu3C2EjwT8Vs5T0OlMYLWm3LWPuLDKyGDs4StZU7jJhqjIgKhFO67W01Om6XB6JFU
         GYZtg2FKj69CM3sfqW1oHPy3MEqMJAl+dc3APHxzgiTyBBRaCYsGZ9XC0q9uqgYspNaI
         R0hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790085200; x=1790690000; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        b=JBxsn/jRsaGBMEy12y39mOfB9BBGyuwRxzlayFrew8tXeXkG9tehN7PlX/5mljzimw
         gCF85PXhWZv+i20SnAc0zjcjbnclieOi7XMcA4UyVd2gSS39sSywN8UKdfFPHsmlEeuy
         hxnX5VRNS1ZNkcUT2sApSfd2nMQdUSJ/ERnEiUM1UuuGJZtE/Yz3eJ1BO64q/4zPMqFK
         R/TD9JAKZ3TCtSrybpiEG5nXpme8A9IVnYh6csgQFh6fXUxsVg/njZv4aBcrUHGYiRVl
         0lZO+lKjaj4VRtThlQANUrs5E3fFFqC5I2kGvWb2I6fKCQ0MspGPYqI4FTrpbgb02EfK
         EO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085200; x=1790690000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        b=X8nbkHoXIVI0geokS/bWJ9q1Dk9FUu7pH85HRlVTmdcIiVxnTsmdqQEiovJJv881da
         mwhPXhnKt0GpkJmiBZrC1XV0ENxcfu6NZROyxaDVqy7czXYTbTn7IACOijlkmvkrr2Qq
         8bS3Es2t8+NqQflSFizsIqI813aL+UsP2/qtQA9o4StyiYKt7m4WoM0WbmSty3aqhnJW
         DoAbgtAUVf7vzBx7eE9DDITHS0mdpNLVC8xCc1nVHgzlYuu4zUjB9gTt8TSMsVlcdOjO
         1jwY4VawkMKj6nG/1imwNb+mXJaigziyMhiD0FFk0Kj7Ygph73n0UQ/Xx/BUjueiUB3p
         2wWw==
X-Forwarded-Encrypted: i=1; AKwUvBzYRMYAX1OCjzg5/ttvuaUj1EnvPXMQR6lCm7Boa0i802fVx3FnUL8mXg7lgTejQkQsbRRE+GOZnJD4uQB0mZbI@vger.kernel.org
X-Gm-Message-State: AFuF++l2hCrg8dpGcXorOrh/m/JtbSyIZkIFQzpLJ+1HCUIzU/A9EaZ1
	sL8wjuhkAt5TGqtVNL1aSIIUD+eI++QuXyJm1C3OJDcnW6MPNH9WV7i3G9oQ19UFpXm2AVMWDlr
	P5GXc4tr1rHAJ6evFB5NZgTE2LTq3F1nDCenwi2ScVA==
X-Gm-Gg: AYBFou0FvYCO2Ko57/pqGtTY8QUwh/xgkXNAHLPU3TMbieiNjPM319yJttxF1qH6/l8
	niH73OKzgM7U1ADIGfFnO47iVI0F219r/OUogd7StvEBWd4cI698ab5/Az4HFz9UfIAr3Zutckt
	bkxyp7CUG0Vx6fOqfCBMFK4wy+IVWDn7TA2suwmMT3ZTjOIywh/gPOlYX8ucCrs6aIlTFGN3+CC
	EDzysFucPHF5ddQJ/lb9RE2UljawgmsPLmzDppLcFHEMMbPmT+TA5lDlSRtSeZPfyxZ6tyxH7Cn
	K4Sy+ntW2XtqbK1EY4hIpF030Wsempj15fhEJYwHCTLjxr0YStd4eGvnaKmH8oANv4weh63DE+R
	dujw64+XwslVD
X-Received: by 2002:a05:6402:20c3:20b0:6aa:9210:262 with SMTP id
 4fb4d7f45d1cf-6aa92100342mr3351155a12.22.1790085199929; Tue, 22 Sep 2026
 06:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <aq1sooGCYUiWbhMH@p14s> <aq453yukMHiNb1jp@bywater> <CANLsYkySF+eF-FURnnT6UJv7P5Sg2HdfMSBZnZy_BLyCMvuofw@mail.gmail.com>
 <arIfj-1Ji6HEBHLJ@bywater>
In-Reply-To: <arIfj-1Ji6HEBHLJ@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 22 Sep 2026 07:53:08 -0600
X-Gm-Features: AcwNN1V0zenE0U1QivuzVoqHQLJIIYIxl9SSuy2ocYOHZBqajP-1AfG4uh0OqKk
Message-ID: <CANLsYkzaxwx8NJAOki_wkzauL68ourd12qF8PzzVKW++PJXZfw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 00:29, Francesco Valla <francesco@valla.it> wrote:
>
> On Sun, Sep 20, 2026 at 09:31:11PM -0600, Mathieu Poirier wrote:
> > On Sat, 19 Sept 2026 at 01:33, Francesco Valla <francesco@valla.it> wrote:
> > >
> > > Hi Mathieu,
> > >
> > > On Fri, Sep 18, 2026 at 10:53:54AM -0600, Mathieu Poirier wrote:
> > > > Hi Francesco,
> > > >
> > > > I have started reviewing this set but given the size and implications, it will
> > > > take me a few days to get through.
> > >
> > > I'm going through the review done by sashiko - would you prefer me
> > > sending a v2 with the trivial errors already ironed out before doing
> > > a complete review?
> > >
> >
> > We can wait if the errors are trivial.
> >
>
> Not all of them are. I have been a bit to naive about the bounce buffer
> management w.r.t. what can happen if a memory area is not specified and
> I will need to rethink/rework that part.
>

Ok, I'll keep an eye out for that.  I'm already halfway through your
work, so there's no need for a new version now.

> Regrads,
> Francesco
>
