Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7AF1FDA6F
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737971066; cv=none; b=S9sARnQX6hw/cy2gdxHVaCn2kbtm0Dcz983gjhu3yMPOKu/+mRVpJYTMeBLmNtotDgutfiYyUiXbiZtiPBrsCPEW1T+D808gPvGzw77aAMZoIpa1vBZgdadJfkJeFvLyETDadFbEdmXlZguAzvLFEAIvocIBhYsxqN/sIV69Bgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737971066; c=relaxed/simple;
	bh=9jJZyeUyg0zikH4UtIlg5nWLIpseFqe533l5KP1qBOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJTvM2kROH4zLMyLCukaoVNpFYi78nIyre40UNeoru/iDZo0SaNpvwTZq+KGUnQyWIIaM0UByYTjM6CEolIZl0Ij411pmgqeAvfz8TLl+66uyvSS3ZX4lI1tx6ORH40mUwZV/PnRUHtn1fC/xYRAJtJVCzgrgTglgQ5rtpDFDWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oxs1J9uH; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oxs1J9uH"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaec111762bso904736866b.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 01:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737971062; x=1738575862; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+g42ZZsF9uGOWVqjqCc38LCDEOFw2n1iiO+fEJtZ9qs=;
        b=oxs1J9uH0IVQoHJLkYHDlqMJIoofT6NLaOvnxREbuLRyh2SqtlSmHmHapfriyEXK1/
         ihUHtVNfTFrYBWoCDMtIvaBmVhmprvrXiL040FNxbFkz7ONi/zna4EhA+xvDPYnG2Isn
         5daFUTCTpPDWp7XRe2CjeZVEe1l0DgSOxh2bVT0HWNes6u+CKSSuboj14sFQg3ABBnCZ
         Dl0BbJjS0USAQ89xn8Iaccgwvl4Ut6s7qBwEBSpnZc367FfQY5vROIuIZYY5RugzpG0Y
         3BxE7q9Lsa1+ojPraFqmkJ3GSRTelkWv2UOq+C84XNOXqR4qmBQpdkJs+sFgElNzXbR8
         Tzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971062; x=1738575862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+g42ZZsF9uGOWVqjqCc38LCDEOFw2n1iiO+fEJtZ9qs=;
        b=ZYGqeI0CW3CtCVYQKVH8mnpo1ZpiJfGNG1/5as2TFU2fyqohGvwFsZpRAxG3GbntXm
         AygwJirRlFA6awWPCNrA90i+E9CuIn+DVuYlcIsH/US18AwDK/jn2v7G42vVIqf8qL7l
         wDGw7zcYb1S6rcnK/OC6PBkzoXsQmFgah1U3LFiitXqOJo4phA+x2/znUByl5odUtm1z
         uk7ps6yfSoiuxdIVcgVsp4doBrVs1tly/sNnSpeeECQNJNJB6XhYLBbjL/iOdHaMXzvN
         TkjzN4tBfnCUaEJ5tS9EyyFNmZZQlWDhinsPSvB8notk95eWlnyT+RlAn9wZvs7hxHsK
         yvQw==
X-Forwarded-Encrypted: i=1; AJvYcCWDsEgAsvIO0Je5ocQC6F8lWWnCnjU9Q5W/N2Uickts+vmKQMJcnVQwsIiCQ5JZOGCVh4/n7oUKVnRR6Ko3XkI2@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ73hgGh/IYmZBk/1m6B8STWmmmQCXRUoK6Lkt/zQL+FA5EJi4
	wzQLyydNwMDVSElbppc5DB1AosUxw5+Dhc7jsAS0ovUHJXSuLg83yJOQtVbsTHs=
X-Gm-Gg: ASbGnctenb5B5HyGRgccJd0AYeuCIFffUP4PUFuythB67NpxQqJJXrDrxWFGCmdiDaO
	czLGUaJxaEY54QM2YgeeW30k79MhEl4tveiMIfdWiTVEUhyZU7gdkm7QxzaSS/OzI0Y6m9ahECd
	JFOm7LtAfSnCJ0fgPKmoEJIR9y6llJNoDfdPKQyhFLlmc8hQSvQCFov20hhH4yMsBw59xhShCIn
	6yDv7JRAzOqq6KKemtOP8MYEw0YXrvRnt/dII48v9vxNwpvXC2NRI0gcyhdd9yKCuDmEDBeJ6Ce
	QuhrheN1jjdnryRb
X-Google-Smtp-Source: AGHT+IGSnkZoIxf5l4DY7TrfG+TC93Dg72qOcjfSrizHd0Z/5y8zaPbCHfMSy2ZUXYKHJebPCxzUHA==
X-Received: by 2002:a17:907:d1b:b0:aab:cd45:5d3c with SMTP id a640c23a62f3a-ab38b3c7729mr3974838666b.50.1737971062028;
        Mon, 27 Jan 2025 01:44:22 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:f64e:7d70:e55f:6da8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e67814sm551424566b.74.2025.01.27.01.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:44:21 -0800 (PST)
Date: Mon, 27 Jan 2025 10:44:19 +0100
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
Subject: Re: [PATCH v2 9/9] ARM: dts: qcom: msm8226-samsung-matisse-common:
 Enable modem
Message-ID: <Z5dVc9yTynAsPDcZ@linaro.org>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-9-e88d76d6daff@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-msm8226-modem-v2-9-e88d76d6daff@lucaweiss.eu>

On Sun, Jan 26, 2025 at 09:57:28PM +0100, Luca Weiss wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Enable modem remoteproc on samsung,matisse-wifi & matisselte.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> index fbd568c7d6b7415d240aa1a2329d07cf9135274c..4155bfb2136022f2a85d69451c34f06ed2a700ac 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> @@ -225,6 +225,13 @@ &blsp1_uart3 {
>  	status = "okay";
>  };
>  
> +&modem {
> +	mx-supply = <&pm8226_l3>;
> +	pll-supply = <&pm8226_l8>;

Hmmmmm, so I was looking at msm8926.dtsi downstream and it seems to
override the msm8226.dtsi modem/mss definition [1]:

 1. ext-bhs-reg is dropped
 2. vdd_mss-supply is added

This common include seems to cover both apq8026 (matissewifi) and
msm8926 (matisselte).

Do we need to handle this difference?

First time I see such a difference between variants of a single SoC.
Looking at all the overrides in msm8926.dtsi, it seems like they made
quite some rework for the "LTE variant".

Thanks,
Stephan

[1]: https://github.com/GalaxyTab4/android_kernel_samsung_matissewifi/blob/45f97bab323176fead18c8ddc20dc57d979904a3/arch/arm/boot/dts/msm8226/msm8926.dtsi#L32-L40
