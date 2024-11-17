Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF52D322E
	for <linux-remoteproc@vger.kernel.org>; Sun, 17 Nov 2024 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731848927; cv=none; b=sfu+0vAw/ZqWNZ8emZWRL07y2X3p1BPFxaJOmqN7bB86zm+r9IGqnwKArlMqQtju8T9vaY49WkFXzZfRusZXaEja2Chd4LOJc/JXvNIGSdDUKN5CIw1CfNvPvTBSxTryu70TJETdeoygWQnJH2rKzdljAGlUgIIv2krPKBj2HlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731848927; c=relaxed/simple;
	bh=GrZ+DyXJhogiFXvtPbLhc0NLu6xmb7Co8Ss70qrimGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSM0U5ToiVLklMzF639BZJcYhcDCDYMTZgXUvYLvRQ4MlCryN07xoZvKRaZp+myi7gm/uLHGFUlDPlB129ygWHdhMZdg8U0wcBNa4fSEyA/2ZZpQKdRr0wkrAGQNCru9XgzzTKoPlIvSVO5lhJ+oOAi6Z9Jh19aghxK50Y0sXh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RbB2plzl; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RbB2plzl"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53da4fd084dso3431231e87.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 17 Nov 2024 05:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731848924; x=1732453724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lMiqxnachPtnrwIxnjXl0VUgpWUzd3BnOxQS8OflklU=;
        b=RbB2plzlXkZiuFNGgGOuNzGJk0DqHPeZ5U1wtnc6eN/XmP7RdDFV2UUIQfG0psm71L
         poX2xvM9+HGQeXkK68inJv0LHcxAgTq91VdbxkI1u5rja5I/qQDul+yXMDKaklirvN7A
         Za48PwwzFrL9IUJeW6ukBnXDOXMMtvgHDGMxEXmk2UTKF7uEbQtte4Hs657RguxbjGcx
         LutFe30Oj3pvLhAClT5WGsVWKHALtbhaVZpXX3GtnhNW3roBeDFBNO7IeIwAEwMSEUBg
         8kL3BkAjVq/ySjICQeeKurTJeZ9UuDHtGbYE7zMHixOgzTiEieK1CzvV/3UCyCuqlsPb
         5FZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731848924; x=1732453724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMiqxnachPtnrwIxnjXl0VUgpWUzd3BnOxQS8OflklU=;
        b=Hh3r0CiNBMo0xG7e3ipvlulP3gFKCKWSFxV2wZTTmrO3SQa7lo2395TjL4d/auHrfz
         dvvTMrn/gqZ1khFTOudlu3m5FySe+2ZaoOHMIGSFa54ccWVuWWtU6WF5EbBKx1jg5SCz
         x4SdUDn5LkKrVvFfcjUERgsn4mVnTGC5aEJPN6qh11NaUNWn6Ez8AHsfywsqjnEzVZUH
         SAgHoxWemX/eeT5g8D3SgAIuFe3A1+Ig3rWAHyvUYmKmZS2EjSGMq0IBHBHCE8T63sYX
         LVsu61gNZVOmJ6aJJ6k+JwssDhaYpWu7xJw1QjDMMYcWE049P40iZcqSF8kMA9ShctFx
         BrZg==
X-Forwarded-Encrypted: i=1; AJvYcCUt6LO2u0Gt3y1CqkKxskCA5FYzkv5OwkZclYwGlpLgYfNdm17QuYFU6Ei9S9FJIuSaYGRVJ4E6rRvyeLpL3Jsd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6WrAZRfbFfx9QjGEuPyIsEgn4ws1lF91lGjgHgUKKdVfG3nmr
	oi5ILJf4xmnfrv9ceItn4rgOpOPG6sn/01HkLkgIAnt4gRy6nduQ6MPCKTefa+w=
X-Google-Smtp-Source: AGHT+IHfOwPcoxs93PW+NNDxxa8NcE7Qb1fhdry4R+keozA7Ik5cUc+igrNyIsrm9x1rQvOeWYIqnw==
X-Received: by 2002:a05:6512:304f:b0:53d:a998:51b4 with SMTP id 2adb3069b0e04-53daafdbbd0mr2679853e87.3.1731848923677;
        Sun, 17 Nov 2024 05:08:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53db3733506sm350459e87.189.2024.11.17.05.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 05:08:42 -0800 (PST)
Date: Sun, 17 Nov 2024 15:08:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: Consolidate SC8180X and SM8150
 PAS files
Message-ID: <whzblscqqyeyltfceik55t5bimvl5jyx2scewefurpv4ye6sa3@cqtij3upryk5>
References: <20241116-topic-sc8180x_rproc_bindings-v1-1-ae5d3f7ab261@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241116-topic-sc8180x_rproc_bindings-v1-1-ae5d3f7ab261@oss.qualcomm.com>

On Sat, Nov 16, 2024 at 12:40:04PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SC8180X PAS bindings are plain wrong, resulting in false-positive
> dt checker errors. SC8180X's remoteprocs happen to be identical to
> SM8150's from the kernel point of view, so reuse that binding instead.
> 
> Fixes: 4865ed136045 ("dt-bindings: remoteproc: qcom: pas: Add SC8180X adsp, cdsp and mpss")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,sc8180x-pas.yaml      | 96 ----------------------
>  .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  7 ++
>  2 files changed, 7 insertions(+), 96 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
