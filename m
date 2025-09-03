Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D232D6604
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Sep 2025 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756911795; cv=none; b=BcXbCttOiKKeVeCtXFtrnkXYuxYrk+Ky0g8Wt8BCWzSwUlAmiIj8rDqh8bPyp/td7hab+7V+fN3GZqL3VUoRwVA7cFn1QClCTruYqsaGKS4JufLzNwXuTxW80QP9w4La8fnRzwN2U5dEakrQNvwtfSe8R/KJv58/OxU2fBcegaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756911795; c=relaxed/simple;
	bh=LekdRFzFZGbphNAI7RPhmxPwnfPr7M4Uz0MSWilmzVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dTF78fFsVfaUgNVePlscZgSUcEgK77QM8U8iMgYnDMvZc7ZQpttC19b5xo9WETv1ja0aj1+KDuudzExR1jGLJNHTKuJ/Fy6SO6AU3LpCWaeVM/MvnPcmli8NYh1MdI5lEEi0FLey6bR7YksTeNy4Uy9hnm0aSqRqofyLTtrxOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fpzIAgek; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fpzIAgek"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b7d485173so381735e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Sep 2025 08:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756911790; x=1757516590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vb9H2OtYCm0pJa79dfHcS+lvaJaqfNpw4BGLzTlGfN4=;
        b=fpzIAgekbJMFuAfGlyDtbM8qv24ttuPeykmCLbD++EHmwTNJ2OFtb6Cm4Ll8Ukgjcx
         rzMGSMS/8i/cAq49BFA8eKEB1H3Q2aWZGFUy3Zvsoa2Cp7f+mkHpOJXlxGTaBRutzYn8
         fwExekkwwZJryHpGtVyRE+MtAAEm57wocU8AwP+ZcifzaPXr5cgA3MgP4Hi/fyDZXQnt
         O/nImKi6zqbrFmQO4malDZqwfuITEUqxV5les70sW+8boNX+rQfNoO8TfHkJ2SZTTTFD
         WDjx5yzceJaUNjmJl2xPM8zK4eWf0Cbact2U2wiYXe0/ZMdTubdCsH2D7DqCVluweoT/
         e/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756911790; x=1757516590;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vb9H2OtYCm0pJa79dfHcS+lvaJaqfNpw4BGLzTlGfN4=;
        b=RaA4v+6rtWLtEnEV4+1gJM+LjC96hjkzOjGl2rz4oBGz+MZwkE5Pg90NJ0a3bCUe1Y
         GaB3IWvHgeI0tWOgraLAw3gbYWF55JWzWaORY8E0iJttYWpPhjwv4MAADVW4uAUZ5ip5
         nvOgLtdJvUlA8D+7SpMC40hEyhjgjONzJn79sj8nuAKRex/tDqffafn5EIlijlybsHR9
         PhcTDWn8UGBdUL54BJrO2GIFtVlUB3P0GNpXNKyKqFa+gFaxoUPWsBxA0R8VpjF/21C5
         O7ZW2VgYYRaYMam/42VTC1O+Z7gBaJYh/rYhk6NzwwSsBkO9k/BH/2K8mR2eA6vakmMR
         EDbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe/XWZe6iak4Omwk2BIXt8rXYZqNUbOlONwVPCj3VN1BhuWjdLWCWsLPPQ+5Ps/ZBp8XbzFD6I+KEPb4KWWtZT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7+OLg4ERKxhR5q3/tMoXFcMHexV1i2n2RJM18/682w33/J+A0
	aPkkUO0HjFlWCCjXa6heqUTiKOjyPgmQU+zd3x3k8Y9a8PspqTFVnt4paZ93iDjCd3g=
X-Gm-Gg: ASbGncu/8Zdzifg7fwTHrjweJaHZwCVKj8AFzE+77n8xomRjogC59iWL8ThwEcd9ZSd
	HlRml22ehTR0IcR9YEpVAzyswd25OMLwBFY6BINKGIVtbHv1qtpKgwTugbeyvjH9JB4ltcwQh3V
	paRfD0YrtECkiSXDFDz6qwS7Hf2AdkUK1nM/Fv+sc8Tp96iJPeEB9X36SpBIa2fypj39nmNvRm3
	iA+ju/4U/CNGUZQSWU9jflN/sJuxu6PaS8GFw1/dmTcusI2CQ5aenpmr83ygw8oLlOWBZcUBr6b
	4XH33QgGb66ibiYEv+377bbLoZVmsALrBEML7ezkpe+kR+FzlONxQUj0ifWXvI//UyaDYBh8SH9
	u7wnCyB8xtdqWogp29/DivA2lr1IA9ey0B75T/8Ln3GNR9nrZjJYVeGOStuupTCg3dcfm2hs1dN
	rw5KPwgJp8dXYqToovYiurGMg8BLKf3A==
X-Google-Smtp-Source: AGHT+IHgxGzSBKO2RRcMFfLj2ZBw0StjQrIND6sOj2Qk5dHscpmAOqzGzyVkeDc8krrGAjKPU2Waxw==
X-Received: by 2002:a05:600c:310b:b0:459:e3f8:92ec with SMTP id 5b1f17b1804b1-45b85532b05mr140779095e9.10.1756911789005;
        Wed, 03 Sep 2025 08:03:09 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b73c52735sm306287285e9.22.2025.09.03.08.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 08:03:08 -0700 (PDT)
Message-ID: <0b4472cb-0c73-4eb8-a360-22b40aae44f5@linaro.org>
Date: Wed, 3 Sep 2025 16:03:05 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] soc: qcom: mdtloader: Add context aware
 qcom_mdt_pas_load() helper
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-3-mukesh.ojha@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250819165447.4149674-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2025 17:54, Mukesh Ojha wrote:
> Currently, remoteproc and non-remoteproc subsystems use different
> variants of the MDT loader helper API, primarily due to the handling of
> the metadata context. Remoteproc subsystems retain this context until
> authentication and reset, while non-remoteproc subsystems (e.g., video,
> graphics) do not require it.
> 
> Add context aware qcom_mdt_pas_load() function which uses context
> returned from qcom_scm_pas_ctx_init() and use it till subsystems
> is out of set. This will also help in unifying the API used by
> remoteproc and non-remoteproc subsystems drivers.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

I'm struggling with the logic here a little bit.

You take this function which calls qcom_mtd_load_no_init();

>   
> -		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> -					pas->dtb_pas_id, pas->dtb_mem_phys,
> -					&pas->dtb_pas_metadata);
> -		if (ret)
> -			goto release_dtb_firmware;
> -
> -		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> -					    pas->dtb_mem_region, pas->dtb_mem_phys,
> -					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
> +		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware, pas->dtb_firmware_name,
> +					pas->dtb_mem_region, &pas->dtb_mem_reloc);

and then turn it into

> +int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
> +		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
> +{
> +	int ret;
> +
> +	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->peripheral,
> +				  ctx->mem_phys, ctx->metadata);
> +	if (ret)
> +		return ret;
> +
> +	return __qcom_mdt_load(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
> +			       ctx->mem_size, reloc_base);

Surely you want to qcom_mdt_load_no_init ?

On current kernel
return __qcom_mdt_load(ctx->dev, fw, firmware, mem_region, ctx,
		       mem_phys, ctx->mem_size,
		       reloc_base, true);

but that's a functional change

> +}
> +EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
the no_init version of this looks like this:

int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
                           const char *firmware, int pas_id,
                           void *mem_region, phys_addr_t mem_phys,
                           size_t mem_size, phys_addr_t *reloc_base)
{
         return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region,
			       mem_phys, mem_size, reloc_base, false);
}
EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);

So is it really the intention of this patch to change the callsites 
where qcom_mdt_pas_load() away from the init version to the no_init 
version ?

Maybe its a symptom of patch collision but hmm, having a hard time 
cherry-picking this to test.

---
bod

