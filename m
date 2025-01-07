Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6F01E0DAF
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jan 2025 12:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736252522; cv=none; b=bPmxITDpscygfcuGziGIyC1inhfY7aXhLLXaMmUslwpLeys36QriEjeORzUXII4wVLli/skQ5j492gOmu6Gs1vEaqD/iSYkvQnYyIuri879Z2BBZ7BztTTN8ZBdSLkWZmlXNrgM+AuK7DqOi4aZcsommHEtsXogKNt6xiuja0ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736252522; c=relaxed/simple;
	bh=1tXML+DqArbNQcM5iHDtMwJQHGdw0eE0Ilz2jJAf2Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1osKuxzce+L2z2Muwf3LzRHmakW+Jo5qH/3vbMP5FbuBolbviIFjWhsQs8+wQ/U/L2PT/6V/EXvqw4XIuLEZTwvINrVK+2th+nAZPFqN4s0GI+MHk7Oc4bnNuyBFw3TsRGTOJjeRgNMZqKKr5EhTeu/WtnOKHbxDY6xLUbzSfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OUsJZvtk; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OUsJZvtk"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3022c6155edso96294991fa.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jan 2025 04:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736252517; x=1736857317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q7WHqrbNCsXH9lx2ZZlw8KhRZ8OlQCctj3WmpLhtiwM=;
        b=OUsJZvtkFAQQKJp6NDlvsztDpw86mas56oPQfG8ixV05G+swtYZEXOEyYWv68E5NXV
         wqIuSC1TBneW0IaW+Pvx+JSM/O8qSOCNJlS/1hIwsVO9QXkkw9W4jIIZ9rcx5UQB4BT+
         VvIIMRfT/dRveuCqRT5DMA84PEnrXzEdjwTNLOZ0C02sQtaCyVkFuym9CbE3NHr7d6H4
         C+unNYyk6g9BgOTXwobNpidv6No5Y5Q2daYf7bLrafqYtS9qYfBvjzFkeWcv2YxbQdxi
         okKICKFRK14QD9nEOnYuCbM3No1TYXkEX3HcZFsBN4FKCqcQoofxZ5MBrmDHy/8KRk/c
         rweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736252517; x=1736857317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7WHqrbNCsXH9lx2ZZlw8KhRZ8OlQCctj3WmpLhtiwM=;
        b=gfQJ6wHqKx5ZQQZWmG2++ukLRN8aj7u6yekOnqPIwcl5EuD3rMY4GVLubmXFid5JDf
         HlKLD/DMYpZIuAiHfttRCuloofFfAILbtZJfKkIiLyGQ6boDzVB6a4R2IFoJvp4N5SUM
         3lzVCsEEeKfcal/VaugvDAzMUKxnWVppv/EO17sXh4GCXc+XLQtppAv1oRdyB1m9f6Js
         EIrKxIQzCDXEPQEnG8tyz7D1jUwy24RhITapFCsuj5awA4det9gFoEWkwh/oKM3kUZrb
         EmAVh4yskD75NcWUbcAtRJwm0ojH2unh58dGaWxCWYbhuFEFxH1IIjJmeesCMjPmyjRr
         tEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjL6B+zKpZjwCBQOKSfShiPO1hAa8nxl39SrFAWBCOG+NZE+yyZ9mhg7A/gwI/eUdJQGprW6zsdXS+2BFnQ9li@vger.kernel.org
X-Gm-Message-State: AOJu0YyI3iAMfG+MjUIn/mv/gJqI8eGFfimomPN/kZV+BHbosUX47mGm
	c3tDPd/O3PFgc2pttN/8t738DwNcCO26ui63w4u/KGRgjj6Ah51zdGQ35vAuzVo=
X-Gm-Gg: ASbGncveYKEJRnvn3IKvel1Fae0JOCWkLOPmzNTXOIuS/2GnwIqVbBFGMpxBQQErUUQ
	HGQ01js1oD5C8LZ3rTf9SbXoaYZSNfQM0FAIGlIVzf2VDqlHYcNG+nChSIYwe86sMSaDzjvDk5U
	vambJHXQDSpcuHY6qrrBHqAL0ISudcwj4YYgX6mvs6q5q5zpkcv6umqtZc1P8UGic6Iu+D/S2Kx
	1Elmi8TUTtYKngQAhJjLlGQtHdXeU4cobflXoVh8kDamsfEumncbVId+/6NCb4zb35NOOR4jnXS
	0gfs8t6sX1g5evxXesaf9ua+ZPWiiYpcX6nt
X-Google-Smtp-Source: AGHT+IGz2+dh2vxy8nlD1Uzcmc8AaD/p2yo1ruK2qzEoXxjO0xfTBqejpwfhh77FPHjT/ewS7KI7BQ==
X-Received: by 2002:a2e:b888:0:b0:302:4115:190 with SMTP id 38308e7fff4ca-3046850a29amr188778881fa.6.1736252517203;
        Tue, 07 Jan 2025 04:21:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad99d29sm57886811fa.36.2025.01.07.04.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 04:21:55 -0800 (PST)
Date: Tue, 7 Jan 2025 14:21:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	konradybcio@kernel.org, quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	quic_viswanat@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH V3 2/8] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
Message-ID: <pjm5wrxnfutixopeeqzgb6q75z6cilpgfcd2maigqlu4i34mta@2k6trubvrkp2>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-3-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107101647.2087358-3-quic_gokulsri@quicinc.com>

On Tue, Jan 07, 2025 at 03:46:41PM +0530, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Add new binding document for hexagon based WCSS secure PIL remoteproc.
> IPQ5332, IPQ5424 and IPQ9574 follows secure PIL remoteproc.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../remoteproc/qcom,wcss-sec-pil.yaml         | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
> +    remoteproc@d100000 {
> +      compatible = "qcom,ipq5332-wcss-sec-pil";
> +      reg = <0xd100000 0x4040>;
> +      firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mdt";

Nit: .mbn


-- 
With best wishes
Dmitry
