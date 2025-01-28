Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B84F1DC994
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738051947; cv=none; b=onI7dwl5v9Fga8+OqKZsSfvgEzFtVE03AH/wdSyhd59AbEdYhdrk6zPoW+yoQkvlE3EfB4WkeBUi4IQZ/bXwSF9bIIEOMadn8BTAwWDOkhNxmchhfRpV11BKsetvJyNeLeL1RmGUjfm0bfPiTuZNhp/KpSvO4NW41U5bXy/P9XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738051947; c=relaxed/simple;
	bh=sdZEeRkPPJORlWrnLjjmmoa2tGaGFsUYR1+bhJzQ/H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVB0+Gd/QS2ve3j/RNH0nR7kUlZkm+crOexytIKs5h4ZVFlLOPidabXjX/Ez5DkwpXVGKvgs1zEmDTWvsVZISoIHZ0IlH5px4uV/9CiyTsGGi0d0KN7gTbeD5JLPqmjZu6DXrl95gfYSM7XmTBVKgRmp8VOanN91z5ckKpqi04g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ENwjmSrJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ENwjmSrJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so34485585e9.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 00:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738051943; x=1738656743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NPIrIyHDzbr+DneslcmVsjK/zZHn2oEO7WadPutyKCA=;
        b=ENwjmSrJf0cPkH76dK2jABRQvh31fIHF2NbF8wHiY9XkIOS3vcTVhbbhX8AL028f8d
         tuPdDuRAvEuOcHzb4Uigw+EzkhFFn0PRaGcHjlNRvuTRIBOuWIqHJNnEraw11fZsIe4Y
         mi/ohDr4IKU0MZczSdrAzX7WnpWWL1JtuyPK2U5aPM0qyxQiMlMO/tflVj38x7J/WqgR
         30MaG2c98I8/OBpw/BjzUXvxrDfjvVY/9oxMGjqxJwlpW87AklZTHwUDyy9U47iUSJNw
         XRdOtzj5EPixP3ODbJMEFPDicMrqut5+8jd7JYcbedFBQddg+coOI7sJQp+pol8HlMys
         +tPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738051943; x=1738656743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPIrIyHDzbr+DneslcmVsjK/zZHn2oEO7WadPutyKCA=;
        b=BxiyVgO74Du766ViLUglx2UeIIUY7sp7TixAcN95VUQLRo6DUc9KKYW2/fjNk5wGZv
         HD2HPy0xknSSnY0pnPPGFfc6/wZxLaoYAhAidaY+2iDqPeclxYleARUXEL4PhsEf+UCw
         mHMXQ/jwDqYrdiToGmuOkUVAByDry8U8pyLV0JHWXSbqPaS/Qa7q5ffiWhm57ymYQncD
         lGQ+R+FvwJ1AmgHBIb6exwoQdQfBoJbluME2mpHuaoiLmLzgBgxlbS/Wi0y5PSdfii+d
         CHJVGvWL8mfZBfEKnFqiHkm91gNdFhg9chvyPGLaWmSsIszqNf2UebvA52d5GgWbEkNs
         nU+g==
X-Forwarded-Encrypted: i=1; AJvYcCVpvxoQCqHDDo5WjeE0QpxytuV+FBCRW9Y8kwJJ0xxraPpBn0xg6QzmmkP0nisOU/9hjOZSPV1CZnnfhp4xSEJQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwvS0N1DmyqutyGPYS/lFVnIp3n9Nn3JiRql5IIsQumYx9xVZZm
	hR5hfApkRWdTm9JvSt1YFuQB50zJpQzryXigmijjJ3bTJNbGEpkzPOElgjFLVWE=
X-Gm-Gg: ASbGncutnK+Hi7QghIF1l2G9keI88vxB7O9yOvD/oifXkFnKWaurD+dzRNWsxDGqqIP
	Ot/q+Sc3BUtqxMv62QL7lPo3BD9fMacu6cwybPmjNydveoWbsJ9xD1mkeipaL665Zu9nh4nfluD
	8jtuwD2Ud9ItrvWeHQOqDaL7qEMvk9yT0+uzmS5QJrpNsMby/QlkzPitAsmjFtWioiJveiiEh06
	6SUeTTbdAHyOaKNpNjp8Omdci4pI290B7xQNDjh1NkP48av54sRdVVbkQvgA/RJua+fqX97YaGe
	m/Q3NzBe9sKkIVNw3DGYuNzvdAs=
X-Google-Smtp-Source: AGHT+IH+dTcNBsNvGVhKoNcjBS6eABvpub5TXOPw7KJoYmzv+AsASoNKuisBMGeBZHrOTMvp9lwYoQ==
X-Received: by 2002:a05:600c:1908:b0:434:9c1b:b36a with SMTP id 5b1f17b1804b1-438913dbf63mr404130455e9.13.1738051943413;
        Tue, 28 Jan 2025 00:12:23 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:3210:3bfd:4b47:59da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4fa57csm167719345e9.4.2025.01.28.00.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 00:12:22 -0800 (PST)
Date: Tue, 28 Jan 2025 09:12:20 +0100
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
Subject: Re: [PATCH v3 12/13] ARM: dts: qcom: msm8926-htc-memul: Enable modem
Message-ID: <Z5iRZLsPojlT-A5a@linaro.org>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-12-67e968787eef@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127-msm8226-modem-v3-12-67e968787eef@lucaweiss.eu>

On Mon, Jan 27, 2025 at 11:45:44PM +0100, Luca Weiss wrote:
> Enable the modem found on the MSM8926 HTC One Mini 2.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> index d6eaa82cee4daf6a1386902f537f1351811d4a06..cb571aa13c11598182dc020f064fe8268bcc061f 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> @@ -195,6 +195,16 @@ &blsp1_i2c6 {
>  	/* TPS61310 Flash/Torch @ 33 */
>  };
>  
> +&modem {
> +	mx-supply = <&pm8226_l3>;
> +	pll-supply = <&pm8226_l8>;
> +	mss-supply = <&pm8226_s5>;
> +
> +	firmware-name = "qcom/msm8926/memul/mba.b00", "qcom/msm8926/memul/modem.mdt";
> +
> +	status = "okay";
> +};
> +
>  &pm8226_vib {
>  	status = "okay";
>  };
> 
> -- 
> 2.48.1
> 
