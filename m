Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD7B338594
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Jan 2026 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768585884; cv=none; b=i8ChAQC9rMLTuVpIKc/TVp6JWstWp8ZZGsreo+CwFQzGBpcDWHJrgnwrT0R+8eN60VHlGPZmg/OdYxTc8C9ihUV5LT15DrtNc55KkuOwIMVg9r+Wlq7iz5J2FMB+Gu/kmvmQFJVyr+Pce7H6KRR3jrnj2eaBPma5R967XEfhoXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768585884; c=relaxed/simple;
	bh=nv5rtAReGpoV803unDvpYbEUl/QCehWqG8euAV+CHCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkjvftEvYFD1NAoHMduoQfql0eTpAyHe0iWKfa7bM558Jc3kessqx2e9ENS5bDOgH7YMdE+CBMCF0PVYe1e/c6RT25YtkfJc+o7pKKycWkj+MIxFFNxZ1ORk2EwwP55MLyQnCHZxAeRe8GiJmjdvJbJqFA9x4/7qz/s+PXYMWpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nbkn3YVS; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nbkn3YVS"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64b608ffca7so3587068a12.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Jan 2026 09:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768585881; x=1769190681; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t+f9X0ca+9K+KN+ouHkTy41XPStpAzUEe61gXgOIJlE=;
        b=Nbkn3YVSi58WLlKpyaTTiG0SN1nX2zcX9yg0i1fOmqubKbBH59urDOgizW5YFwC9Us
         uhaDtMUyquTrRFEMHWP5ukJtGex7PrznMhHclzdS/3vjVzAdPlb6Xib6vFjwP6MfZdD2
         uvPswYRSIttpkmq4zuiPrNI5xqq3XMMDZVrncqSveo2ylPOWRcagvCt2gf5JLkjTdVTd
         If6+Cq0q5gWu9WI9S4KEfruywTzMrY5oCBIsRSZAgqs4jv/zUdMMR+fQFp9err7tB/Xc
         mzxlM5cRbgdERGzsvSxbwhRLsID0yjSkhnAx9iZPYRza2gLpqSnbC+Wf4SUpTyUwXSeL
         7x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768585881; x=1769190681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+f9X0ca+9K+KN+ouHkTy41XPStpAzUEe61gXgOIJlE=;
        b=eEgnWIm78J1ztjywb8vOzdPCmMdrZtrvQHoi4uLa0RfqbmFWsmGpafdkUOoSTSN7Uo
         3gshBAl27+LJm8O76Z8TbpAmS7/VRL0MN8ymqPWaNRs5VIj5cJUf7NFXa1UsD+AMLBfR
         UBf/azwH5xmo1f+nXAOMykiSKJH4vYkDxhm8rzj5mrE7kyQA2hLWnBsEl9pDL0nREtEV
         gIvEainKrvET13GjlMlTD3zAMy6MXuKqjgHLEIp3Rp5J0Q/p2+4IkD2v9Bjujv6V9rv7
         oKoQhGGDzhKNcTBOwaK36Vk127rouVTKKNIVRwcL3K4OsSxh+XcG/jNw7f4/B4xW4DW2
         Lq1A==
X-Forwarded-Encrypted: i=1; AJvYcCWDVFDf1wAfmyruOryseciWXGVWXexQTDnyNv2A4VdA1B8EpFpphS+RdByx/1hoox6xNX+iMlKeSTqBS8e//0TL@vger.kernel.org
X-Gm-Message-State: AOJu0YxEDGzcpDXkup0/IzcH1OftEfAY0MsqI2SV0ZA9ldDt/A7pLRb9
	H+goiwZXjFYZ0R9rI1h7Z19AuMW0o2bGe26bezioSifu/PeN56E89Mz4/WGQ41TSsdjjGWxHgCc
	RdYWBRru8n1ry04nZCR/n63MPKNS+f6M05syrubdPmA==
X-Gm-Gg: AY/fxX5Uki19+5dKa4kNAQJVuA6I5U6ELEo51M1/SdKoSZnZtzmqFLjZk6Nsf7AulB9
	IApEyxl6kMG3lUGCPrq8lWJmks44RJI7znourhyMbNfwpgLv10zkegCxo5Ibs8LB1/K8SNxJr2F
	xEVusvsYkDasaUMv1943kYl6pdQf4CmCQLlZFttOCusqo0Ws4R7c4VuVBpPmQ8C3MZ8tjqJTfip
	0G6gAX+JlUjdni9JNbc8YwJqETnsBT3BBVL6lHMn7H5Bt2kx6feBopQOB7Hwy7hwUxObkFjmen2
	cvlHFJ5z6QcVVrqa0woGxDJylWV3A5C0fQPN1XoO
X-Received: by 2002:a05:6402:524d:b0:649:cec1:6cf1 with SMTP id
 4fb4d7f45d1cf-654ac00290emr2575856a12.0.1768585881040; Fri, 16 Jan 2026
 09:51:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 16 Jan 2026 10:51:10 -0700
X-Gm-Features: AZwV_QhtJIlvC8lax7reCIuuwunpA2-9R9Z6379FfXEQO74d5fi8ERBctyrcGDE
Message-ID: <CANLsYkzU8YDv_PzSMjj3+zAg-js8Yo8uFWotzzz2r_nYDK3M_Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mediatek: Replace Tinghan Shen in maintainers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Jan 2026 at 10:29, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Emails to Tinghan Shen bounce permanently with "550 Relaying mail to
> tinghan.shen@mediatek.com is not allowed (in reply to RCPT TO command)",
> so switch to AngeloGioacchino Del Regno - Mediatek SoC platform
> maintainer.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml | 2 +-
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> index 88575da1e6d5..508b8c2f13a2 100644
> --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: MediaTek mt8186 DSP core
>
>  maintainers:
> -  - Tinghan Shen <tinghan.shen@mediatek.com>
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
>  description: |
>    MediaTek mt8186 SoC contains a DSP core used for
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 179c98b33b4d..bdbb12118da4 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Mediatek SCP
>
>  maintainers:
> -  - Tinghan Shen <tinghan.shen@mediatek.com>
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
>  description:
>    This binding provides support for ARM Cortex M4 Co-processor found on some

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> --
> 2.51.0
>
