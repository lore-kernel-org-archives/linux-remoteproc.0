Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3DA1E47A6
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Feb 2025 15:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153256; cv=none; b=ASAJx1S/7EI/V4WYhQkFdeupT/zAQmQoXf2A9LvRfQnBKBYWaZtLp793rNZg0x7ffIT8b/DFeYXB5xeslFL/s2qLTyqTvwWBMCMZmGJEFTT3gBtIifivHqWXIwoXH0B4lX7elIN63geWBcION6KLwzhBky8/Pi76jl7CeFqJjw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153256; c=relaxed/simple;
	bh=CfCvpuTqzzhtP20uji2W7izjB3m2XqIJiZMIaE37t6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6emK36pkq4H+q7JS+59bw0N0zT8DPQa0H3SIWpgHwDFu5O3KgX3ZPsTa77x9chWGZdcuboywzvJhv9RdedU6tpdynV1jiih2PZ2Nmk7VYpBwdEaRwnchkJG6l/buZXPlAlhFYKN1UaahiOK0wkTeHqFmIf6/h8HEbx1TcE+dxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sI7rcoyx; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sI7rcoyx"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abb7d5a6577so27639466b.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Feb 2025 07:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740153250; x=1740758050; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EzQ0Vltnd1y3D0bPYM5ely+Sh/YWbfp392aoVTkuNCM=;
        b=sI7rcoyxR7KavyGtkZtC8+U//s3qiy87i80U/7XzFnsfMziANaUEsK25X3GqdlDP2g
         O+2U8OdWnklM59OGThNIxMO+OV0HEwDN+6XAdyZ2H+6kjJXDF+88N7jR+I7jQFrXsedf
         KFqOzfqAVAoMT+OlxMfq9kGqubu+4FiqPCQQ6QOj8WltxiFpnXVQw5Dxs7suI9FzORsq
         KOY6N7+z/7SqCkkUfzlDh2N1ZqIqtrVdeHBMFKyZ2J66fwy9BOiQbTmUu9o5kNBVQVo2
         40iddnCyx2fKTCowaOSuETpDGLVZIzgfnNwGBOUQQvhL9VaUW6S/Z3xxFDq0YZBvt9UD
         5DDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740153250; x=1740758050;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzQ0Vltnd1y3D0bPYM5ely+Sh/YWbfp392aoVTkuNCM=;
        b=CvTToza/Bi8GDydclTRaLJEMw+Y3mXJ4jJx1Fs965RZ+sp/uhe3KHvFkeIdaG65XRv
         D19TmyhpkUFUw0g1Cztx/zVSdi9q+Lb+N6nJnfGYXu14LA56/kWZrpZ7IPLyyIP/4XgU
         RZPnQiFXigKVx2iWDHUCP2My0zkXWbqy4eN8hXbU5x2YE+2RrlnrSmYr1mAb78Ipy1Mz
         vM6pWfU1/DUPDvhaxKc1WHT/r1hKY1EOpYOQLQ1iB4peQSc6AvC2/LMLZBetM4IVehb+
         Qxi4cAba9WUNmJCFtB0748LVT4SCzZHyon7iHOZ5WSG+VL3aWrAFZmVJAV22jqgCCPAB
         n0tQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6C3vK3TcG25/+GWxt8k6ZSCpOWmmdr4lxXXDlfllF9JdyZJSh4QMiEP4H0oBQ4//1sywkTVq60F4ivnKBOXMu@vger.kernel.org
X-Gm-Message-State: AOJu0YzVu9RH7dgD+mIV8d6jN8GLpx74Ke84/3gDdrP9d+Mm5u+n90wP
	VvlAj2QeDvJSM/6SL1hVHxxp5ELuIZck/cxOZXzg0982EOmIV1+P1s1mns3mJc8=
X-Gm-Gg: ASbGnctOooZcufJcsd4DZmOdEvIU1ZmTmX9WngecOdryOpXlX+rwMIeBg6+mmEn65DG
	0kcIFhyNLXUZrQZaBat8sTJcphkczL3MNiUolBngttyEZcW/sI14pJz5mvZUXXi/NDlhMX9/Ob0
	nAvYHYkvJGkI5NeW0elGAK/NkwIyre6vve7CvwcKn6sE7tiZYXhOLTwXHo/5QV8+NHXeX0lNOkn
	OTW9HF83OgDUMYBOPMqAY8OVHL2fkzhJwdBMGdWoE57lIkd3mtBPYGU7m1q79ZnhWCQnYcuM/P7
	5lSHPgAeHyl5gE90TwJ/efb6FnBOs/ofmx95yaGjqnL5Hpd6jsht+2T/5WneUd0iIJvQ8M3uJiA
	+sbnHqw==
X-Google-Smtp-Source: AGHT+IHCxNakJnPxBfmF3PThAWb7w33DYWx2nK7ZR/nCbdPYSZPxxF9wogu035bPESWbRTKcZDlEZg==
X-Received: by 2002:a17:907:2ce3:b0:ab7:cb76:1b0f with SMTP id a640c23a62f3a-abc09c13ac8mr152984266b.12.1740153250156;
        Fri, 21 Feb 2025 07:54:10 -0800 (PST)
Received: from [192.168.0.104] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba3d765acsm918800766b.130.2025.02.21.07.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 07:54:09 -0800 (PST)
Message-ID: <72bb815d-4992-42f0-ac5c-90e971d7a62c@linaro.org>
Date: Fri, 21 Feb 2025 16:54:08 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/2] dt-bindings: remoteproc: Add SM8750 MPSS and
 CDSP
To: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
References: <20250220154132.199358-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250220154132.199358-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2025 16:41, Krzysztof Kozlowski wrote:
> Add remote processor PAS loaders for SM8750 MPSS (modem) and CDSP
> processors.  Both are compatible with earlier SM8650 with minor
> differences:
> 1. SM8750 CDSP has one more sixth shutdown interrupt.
> 2. SM8750 MPSS lacks fifth memory region for Qlink Logging, according to
>    downstream sources.  There might be other differences, because the
>    modem currently crashes after starting.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---


As Dmitry suggested:
https://lore.kernel.org/all/7ge5bnzqggaeoyme57sjbchehdla5icblyjc6jiop6f64bfk5y@gobmmlvp3cie/

I will split CDSP and MPSS, so this can be applied gradually (if needed).

Best regards,
Krzysztof
