Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA383A292
	for <linux-remoteproc@vger.kernel.org>; Fri,  1 Mar 2024 19:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709321258; cv=none; b=I631no9ux49pcLcbgZ9dBDD3Wg4rJ+fz8kd2P/LA906s6QtUPAslAJ7qP7OruW7Qx0Ca9wheLpsRRIkDq66iPDs2ofltz11F9oywoop+xQCN9tcglgiAVcAhbGGPqoS7eopxlgRwPkhNoJuyuz+Pt5bJugEK5PlZvcHXQAWjKuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709321258; c=relaxed/simple;
	bh=3SPJ05RL58/5ZjVtXXCUK7X7HZLiiNivuJJCDF3p/Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0BLa60Weq9R92SraI/oxkXyQ1PlsW3V0T7ygHcRwn3JxVPFCzQAr0PsdkuSuHYL8tkzHz/rDvZUrKmRgyqPFufCpLpxI/EplmMSE4vSUjt9WL4Ti4olHuVJdlkE485hhRfBaojeOtY3zx9+hdv+kzsagL1x3Cz8RHtHoYGVjEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EV3fC4ED; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EV3fC4ED"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-565d1656c12so4397856a12.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 01 Mar 2024 11:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709321255; x=1709926055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r05fhKMu/fhnW65A8rEmq1zNewcr8Tq1Kh6RnpEpJiM=;
        b=EV3fC4EDt5NsTGZ7HnQAjlgs7cAR0j5Q35RFALhhNPXhIKPm7VOL0mncCMmDNj1FXa
         2EEHbn6CS8BUA11zos0QqzjXjJZo97s9O3GnUFMLGz898scdkl/KcDY1frAyPhwM0S0T
         jft1/LoRnV4oLfW4/XhTWXonP3Ct8ADMOCtUOJ2GShJWnrohXam97pHnItoq3bG70M+J
         yXc6dCLvl2PqsupGCgnCQpYV9WVMNX7pU6cI+zsS2pLV5gcGAXo5Mq62yv+imvjr7tNE
         MJw5ZIc3p9htvTWxitBT1aNtCEKMAZcF4yrOk8kcfwYZYQKNsMGXl295CWqC2AFG1cWQ
         fVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709321255; x=1709926055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r05fhKMu/fhnW65A8rEmq1zNewcr8Tq1Kh6RnpEpJiM=;
        b=VTNp+qDryEDNsMS1pGnBteWAOOQydFXTiD+q0QyfuUUkHpZVSkh0QiyWUDZNavoqCo
         DvIDbS7+xafiYXie/cFU2wQCOANAILlzAneNq0Eb/yK4i3QkOrY1vly6lmehDuqbAbN8
         I6JCVlMGmd9PoI48fE8cH4x8VnD+EjJqrTu8YtWN9SQuUKntLypfDZts4+TWMqaNdE5Y
         miuQTengFHWUNttJ6ONi9FokPrGu9UpMCbUBRxLDlFd4vYpKX/N0a9UmqzOPn1gGInP1
         ODNtSKBWnkvbNXiXwSDs2Ca6IjZKWOh2bZKUIH1dQYbcZMhWz3sKfdhnvnZZu7GZ2JhF
         KUuw==
X-Forwarded-Encrypted: i=1; AJvYcCVUdx/+CIozoGAh6uK27LPfTHVWM4+4hcFvcfZeAfUL+gey0J7bUAeE/JZlhkNjgFffKQfPIAW5kEBMvWWqaCGmYCD14jkKf0xZc0OMMgRGbQ==
X-Gm-Message-State: AOJu0YxCD+LCudaTXFXScQ+4+f9Y+7blzxULM6Pib8J+pPFGl8wHzupm
	JzXZ5XSEZcwtw+8oClrjYc4aIix7qKK0Y3sqpQOc+QHSY9/T5JpgDJWoPWYe0Lo=
X-Google-Smtp-Source: AGHT+IGLaqQure+tiJnp+bdS1ep5HnvBBQJYiv7rpvBOzb0HyTG/jY0zZUOhx/T9dHgs/oyfPWXFxQ==
X-Received: by 2002:a05:6402:230f:b0:566:13f8:bcc with SMTP id l15-20020a056402230f00b0056613f80bccmr2177761eda.0.1709321255138;
        Fri, 01 Mar 2024 11:27:35 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id bf26-20020a0564021a5a00b00566ad448c25sm1516898edb.18.2024.03.01.11.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 11:27:34 -0800 (PST)
Message-ID: <104e0845-9af8-49d8-9f2b-4d9960691017@linaro.org>
Date: Fri, 1 Mar 2024 20:27:32 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: Add corstone1000 external system device
 node
Content-Language: en-US
To: abdellatif.elkhlifi@arm.com, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew.Reed@arm.com,
 Adam.Johnston@arm.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20240301164227.339208-1-abdellatif.elkhlifi@arm.com>
 <20240301164227.339208-3-abdellatif.elkhlifi@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240301164227.339208-3-abdellatif.elkhlifi@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/03/2024 17:42, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> add device tree node for the external system core in Corstone-1000
> 
> Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> ---
>  arch/arm64/boot/dts/arm/corstone1000.dtsi | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/corstone1000.dtsi b/arch/arm64/boot/dts/arm/corstone1000.dtsi
> index 6ad7829f9e28..67df642363e9 100644
> --- a/arch/arm64/boot/dts/arm/corstone1000.dtsi
> +++ b/arch/arm64/boot/dts/arm/corstone1000.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0 OR MIT
>  /*
> - * Copyright (c) 2022, Arm Limited. All rights reserved.
> + * Copyright 2022, 2024, Arm Limited and/or its affiliates <open-source-office@arm.com>
>   * Copyright (c) 2022, Linaro Limited. All rights reserved.
>   *
>   */
> @@ -157,5 +157,13 @@ mhu_seh1: mailbox@1b830000 {
>  			secure-status = "okay";     /* secure-world-only */
>  			status = "disabled";
>  		};
> +
> +		extsys0: remoteproc@1a010310 {

Looks not really ordered.

> +			compatible = "arm,corstone1000-extsys";
> +			reg = <0x1a010310 0x4>,
> +				<0x1a010314 0X4>;

And this needs alignment.


Best regards,
Krzysztof

