Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909301AAA10
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 17:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086365; cv=none; b=NIBEQP//Ah/+Q/tEAIEqUwRhOmmpSYUZYU10t+CugB+fYXIsssh0pO8+jhd+OmSqur5WHZaBXp4Je4IU9A+XsAwKYe9TzW32sY06QKwgQqUxQlCi6heBnLpGSaKCJ0Fggo6Fy+ACaCkQfa0aLo/UGLFzbeuCFkr8GZeWSyJPmgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086365; c=relaxed/simple;
	bh=3glwhkFXni4EDwTqZM37nLMeMsPghr8SXH+joUz9ooQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJPA6PV9GgX0pB3H4vMacv7TkbnLlZTZmqUNqw1vrAbta02iFAR+R+i37xgUnTiySODJk/8Du8WXYKtf9q59duf86kXPY9U+uFRaMUsFG85MFQPj1Q6avmU75QHQFtu/PDw9MQwHCUpCJ9nJj+fagqyZKxSK5Ko7xeXU4NbdiEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qRDkG129; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qRDkG129"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361f796586so66428425e9.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 09:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738086362; x=1738691162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WwNUjQuY2XcozKgwiHjOdkV2TraxeVYGl1wo5+AU1E4=;
        b=qRDkG129+S2jWAqofnw3zwpNgIT7ufvOiGQjqHMyfgVRf41kBibqJh5DkuOvh8oz7j
         tvAKwWcxAO/7SnVyV2nttw0fKGB9v1HhfnGIhE3Vdh7Kgp2D/HZgvJnKaM5Q2ZaQ4/ge
         JBsbrYoO+EqiVbxw9l+PepKimVjywu28UkHaJ5mk05FR+E45srwhbGPjC2JHuxsM1hNG
         9YxMTqvJGs2e76oOF3VqzJ99S8vWMPV5ceeTafs3W6GLFnLYpkB+Nm7tzklNnym5hykB
         FHceNu3OmuNYH1RKwJdu6ltClMBRMq7PRru6FMjS42FQJ8JzRO+ZvZeSaLgGaL+w+FIV
         XEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738086362; x=1738691162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwNUjQuY2XcozKgwiHjOdkV2TraxeVYGl1wo5+AU1E4=;
        b=REZ9oVzmuH64ViTkjQSUNhwGroaU4Y80/doFR8Nv4ps1vD1YBPLFrOOFVkjlfS6g/k
         yvMiQ5/2cAKX1P/zgoPhGrK7CvNQTI/EGFOZEFeiHKmU40iEayAXJXZMV0BxY460sRIM
         U6+ohDMw7wrGGP7JxFz2OxFDwzOzPRyHni28cljpNpmHbKpax8viBvshfUv/PWBocYwG
         +8O66IXYM5MmmRvtJK9Jv2VErWAxscDPivQ+wdHLcS/oOJ8EGz55/K49rqUCLuEPbK4z
         I16bR4St3Huu+tgIh6Pm39yEtZToXPyDkTVN1wq9YARvMzxJ4jz1r5D90MfisIC8yzY0
         5Y7g==
X-Forwarded-Encrypted: i=1; AJvYcCWKx5syy6c7eIJyp4KaGldyhL62bjQ0rIkFcE7u8eFyXrlIjUhrsmnBSOe0uvKRTUgL5lRjZdLtK+RbsDXlEQrR@vger.kernel.org
X-Gm-Message-State: AOJu0YzrLPF0TFEb8osHtJGhlItjDFvHvEt/BH833TL7KdkYO5Mofq8l
	o9pDcxNQAqmDHJoEyatfOgTFphO8aacqFf3vHugL0R5SQapdmD2FJZhDHeS2+yM=
X-Gm-Gg: ASbGncslm+Jde3IMVIQA6rCYST+nhsbUvR6Zt7gTCQz7m58XJXzTnxnFM4JmuMuZyxD
	yk3sxsYNZPOsjAvJ7VWAcBUU/wqhh7ti9xdgBVZWImdZCu0ASntY7zuW9shprRlbOr8ybJXy765
	G6JghDUttsfByvzuj/N1/QiMYaGxuhR5WcGF4qjCVAmI5RT5ObXsqoMTzNEMm+F/cuQsWCZwu/8
	fJLcJu4YI4yqVaHybo0vIpy6j+V+6EDCKvNpAxD5hNnxziP/mRzYpjNR401HRe9aag47IVVFqDr
	aYQjqWZtP0DafsUxcXpkslF6rho=
X-Google-Smtp-Source: AGHT+IElPimTr0gsN6tkD/RbgzVWstGwRShL1r5zfMXA4HjvTsBvJ2mVdvGfoyf3s3rhsSDziEE/7g==
X-Received: by 2002:a05:600c:35c3:b0:434:f131:1e71 with SMTP id 5b1f17b1804b1-438913cf2e0mr426345775e9.8.1738086361761;
        Tue, 28 Jan 2025 09:46:01 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:3210:3bfd:4b47:59da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f120sm180637695e9.2.2025.01.28.09.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 09:46:01 -0800 (PST)
Date: Tue, 28 Jan 2025 18:45:57 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/13] ARM: dts: qcom: Introduce dtsi for LTE-capable
 MSM8926
Message-ID: <Z5kX1YZ6xlCzwASM@linaro.org>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-11-67e968787eef@lucaweiss.eu>
 <Z5iQQQRtuUzTDRVW@linaro.org>
 <12596489.O9o76ZdvQC@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12596489.O9o76ZdvQC@lucaweiss.eu>

On Tue, Jan 28, 2025 at 05:46:09PM +0100, Luca Weiss wrote:
> On dinsdag 28 januari 2025 09:07:29 Midden-Europese standaardtijd Stephan 
> Gerhold wrote:
> > On Mon, Jan 27, 2025 at 11:45:43PM +0100, Luca Weiss wrote:
> > > MSM8926, while being 'just' an LTE-capable variant of MSM8226, the dts
> > > needs to slightly change since the modem doesn't use the ext-bhs-reg and
> > > needs mss-supply, therefore it gets a new compatible.
> > > 
> > > Since we already have two -common.dtsi files which are used on both
> > > APQ8026/MSM8226 and MSM8926 devices, change the setup a bit by removing
> > > the SoC include from those and requiring the device dts to pick the
> > > correct one.
> > > 
> > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > ---
> > >  arch/arm/boot/dts/qcom/msm8926.dtsi                           | 11 ++++++
> +++++
> > >  arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts  |  1 +
> > >  arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-common.dtsi     |  6 +++++-
> > >  arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dts     |  1 +
> > >  arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dts   |  1 +
> > >  arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts  |  1 +
> > >  .../boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi    |  6 +++++-
> > >  arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts             |  2 +-
> > >  .../arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dts |  1 +
> > >  arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts       |  1 +
> > >  arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts    |  2 +-
> > >  arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dts    |  1 +
> > >  12 files changed, 30 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/qcom/msm8926.dtsi b/arch/arm/boot/dts/qcom/
> msm8926.dtsi
> > 
> > I'm personally not a big fan of mixing the naming with and without qcom-
> > prefix. But anyway:
> 
> Same, but already all PMICs were renamed to get rid of the pmXXXX- prefix, and 
> there's even some new dts files that don't have the qcom- prefix anymore.
> 

:/

Omitting the qcom- prefix for .dts files is kind of broken. On ARM32,
the vendor subdirectories only exist inside the kernel source. When
installing the dtbs they are still placed in a single directory. This
means there would be a risk of naming conflicts (granted, very
unlikely). More importantly however, it makes it more difficult to find
the DTBs belonging to a certain vendor... :/

IMHO the naming convention for ARM32 DTBs should just have been
preserved the way it was before, but well that's how it is now I
suppose.

Stephan
