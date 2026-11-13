Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596635;
	b=zTtxSaIMuKwodVfkEPT9itwFqDcIE9bxXHYeYdyXlUgkEsObPpLEeess4x+hr4BAnGF7
	 JJ3UdiBLJlxNLK53qgBLhTo/4tfot/NQNMnQRQ/5mYll9HxoTI5fYmE6a3oRhyfF/TOsC
	 ToWyVNLxip9St17uiwnfw+wn1/P+kQalCGxZRG2TwjV73zoYIyPUNjNOnBdTbu/fnql7D
	 69+QbMltNOwis8xiZMr7/4hzlYoqGA8yPsTD6Ld3UFdPCSaf0ml3VeFupQooPKAYfmuED
	 nvVNTMDVX0DD8IyQjWtTu3maYEAqSky6TH7jB08Gzu3X/OtxpW/njiJBYXS0BGud9ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8DhktJUUGysUbtfb0tmJTo5XW0cehShNaBR9ivWue5A=;
	b=OHmNuwNDD99Fc8HonwStHDIXpOJGY0+wBlpTzt0I9JptEOssvFWjyIRYVoZY1m1Agz+u
	 ZaqaD7YgBZwXaXBtEmKMmalqeBJo36Z7fwvlvWeGh2xwbcS0TGm2sDlxMnXyPUZCONQ0n
	 gdYdstCkEpNNsyEKYx1nKYTeMVbax6y7V/ZcnCHn7dihY5ekZT+u5BOuqI88kcyB8gIMx
	 qOz3+VAWSDVyPu10lnRISdehft2Z7JPEMnSGJZwwc7LsCj7TSVoQEWGoEh76JRQ+2Dly8
	 u1yOGZ3JwXkulAbZ2VE6TQf0yR+MRiJDqJ3FE1oURvl09BlAU94zVUGjYcelLyB8WWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=ExICz8P4;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C636F606A32E
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 19:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C636F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=ExICz8P4
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67bf3c6654fso1503530d50.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 11:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794596634; x=1795201434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DhktJUUGysUbtfb0tmJTo5XW0cehShNaBR9ivWue5A=;
        b=ExICz8P4fXxjgxs3giLZpJeiyL04Vuw8hAxUaB6CTLnhd54zVSuoAcn5AC1HAzUtnz
         a7g6gthrLeu+e6gO+HXo7VglgGprVg1gviCW7di95hANPwlzvOQ3HWCBCSG9CGL94xRZ
         wkZVwYoIONyGjl71EkMD/0AG2LGy4p7s2P6Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596634; x=1795201434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DhktJUUGysUbtfb0tmJTo5XW0cehShNaBR9ivWue5A=;
        b=CTzOboTIbdYRl7tX+pAJV1AbfOxmgKuZtI1h95mfojOZrBHLMPP1WMCQmjqS934YYB
         Wp6ml2O4R1wXBA17s/ZSxtgzLUhtAjgMMzYStxSVmtAzHGYpjIZ3QfgzwdOC1DbPsRfS
         bpVHHHwhMOkaJLlRTZUuVO5j2O9m8jvabfW132erdD3Af8luKowMiqyABsij+gfru3Q0
         Kb2C617DHDwbHaI283gHPWYDF8i8bMCKvWBXV5/Bfb4InYfR6zIV1xZrZmfUdDa1EJaP
         WXWRa5SM0wGUkpLPquyzAjD2ApEd/6HmsW76geGxPYNUj/zLZsTlPLR1lygScokV9mDa
         LROg==
X-Forwarded-Encrypted: i=1; AL+hErENxjtcRGD+QGJecvFT7ZSU4LQSa53wnCBba7bL0HGc73F+Sp5cPyShgaX53uxS1p1IkCb+AHA3MTfJ67qIybbY@vger.kernel.org
X-Gm-Message-State: APuU4Z/qPjWGHGlgGra2DzdP6+Ddq2RPDgwqtICRpyUrdnfagPrS4pFK
	ryKpcwvL2R81Qh+KRWfaLWvJukCP/qvFIERsgcJtidML8uEbDha3iQapO5bKExbd1g==
X-Gm-Gg: AYBFou1CEPz4ldAwDRdSRUlSXq4rUsHksMaFvj8NHPnjSgPYJ1apjOCVtjBw0eNLNx0
	OAwqi7fXfVE9hASPvY2nOdA7JMUYogn4ydnGQtxjWGb/CUiURIsAXZXASx8Ox3QrrkapSyvn0Qn
	geEe1V/LWUtH0Qnla1oDhTCN6O6hNaSp7eRntu9IK9EzRn8C9G5FsgQPB0THXi4wc4mKgMT3A+w
	ykIax7ebglmI/+yYyT/n1C4eq7UmdYX2HPuGya0z+BRc6sgGDtdINuS2U/O9ZupaL7N4QX7mJcn
	VeCZbASrdWDg6xNncohMRZd2Gvmd8JSv73+9ZSdqyDOWKPRSX17Dd7EeZKTDzzf2a/b40nXl3HS
	2E8WrFcrwooA5sCN3525Ylw3F7uHiBGB11UeORzUSQBctbIzjhxy7X/17wY9r+y+QTcC3Jb4WvP
	2jXPROm3wFBc/MGjroMyhf+vYokA7GguCoLZVgH9cAUJa22IGf83TmIkuVeWcZ6QEL1srewL31H
	8TsQoMp2qExOeGE756tsS4E1gLk/rJhKO0UEFEYBID1e7G/izSY2jn0VF4y4rNaNoAQWhd8bNh0
	MAgH9g9ecOmPBg3Gi17ktV8Y
X-Received: by 2002:a05:690e:168d:b0:67b:eda0:b411 with SMTP id 956f58d0204a3-67d895e6290mr1728922d50.48.1794596633744;
        Fri, 13 Nov 2026 11:03:53 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-91f23d780e8sm27000686d6.27.2026.11.13.11.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:03:52 -0800 (PST)
Message-ID: <bbadc472-655f-442f-86fd-9d56ff84abfc@ieee.org>
Date: Fri, 13 Nov 2026 13:03:49 -0600
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] firmware: qcom: pas: add qcom_pas_context_init()
 for pre-allocated context
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeff Johnson <jjohnson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
 <20261113185009.157893-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261113185009.157893-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 12:50 PM, Mukesh Ojha wrote:
> devm_qcom_pas_context_alloc() allocates and initializes a struct
> qcom_pas_context using devres.  Several callers, however, either live
> entirely on the stack (short-lived helper functions) or embed the
> context in a larger structure that is already managed by other means.
> Forcing those callers through the devm allocation path is wasteful and,
> in the case of functions called on every power cycle, causes a devres
> entry to accumulate on every invocation.
> 
> Add qcom_pas_context_init() that initializes a caller-supplied struct
> qcom_pas_context in place using memset + field assignment, with no
> allocation at all.  Rework devm_qcom_pas_context_alloc() to delegate
> to qcom_pas_context_init() after the kzalloc, so both helpers share
> the same initialization logic.
> 
> Update the kernel-doc for qcom_mdt_pas_load() to reflect that the PAS
> context may now be initialized by either qcom_pas_context_init() or
> devm_qcom_pas_context_alloc().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

This looks good to me.  Thank you for implementing it.

Signed-off-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/firmware/qcom/qcom_pas.c       | 26 ++++++++++++++++++++++----
>   drivers/soc/qcom/mdt_loader.c          |  4 ++--
>   include/linux/firmware/qcom/qcom_pas.h |  2 ++
>   3 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
> index d74dd7b4f332..fdf62003fbf1 100644
> --- a/drivers/firmware/qcom/qcom_pas.c
> +++ b/drivers/firmware/qcom/qcom_pas.c
> @@ -14,6 +14,27 @@
>   
>   static struct qcom_pas_ops *ops_ptr;
>   
> +/**
> + * qcom_pas_context_init() - Initialize a peripheral authentication service
> + *			     context for a given peripheral
> + *
> + * @ctx:	  Caller-provided PAS context to initialize
> + * @dev:	  PAS firmware device
> + * @pas_id:	  peripheral authentication service id
> + * @mem_phys:	  Subsystem reserve memory start address
> + * @mem_size:	  Subsystem reserve memory size
> + */
> +void qcom_pas_context_init(struct qcom_pas_context *ctx, struct device *dev,
> +			   u32 pas_id, phys_addr_t mem_phys, size_t mem_size)
> +{
> +	memset(ctx, 0, sizeof(*ctx));
> +	ctx->dev = dev;
> +	ctx->pas_id = pas_id;
> +	ctx->mem_phys = mem_phys;
> +	ctx->mem_size = mem_size;
> +}
> +EXPORT_SYMBOL_GPL(qcom_pas_context_init);
> +
>   /**
>    * devm_qcom_pas_context_alloc() - Allocate peripheral authentication service
>    *				   context for a given peripheral
> @@ -39,10 +60,7 @@ struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
>   	if (!ctx)
>   		return ERR_PTR(-ENOMEM);
>   
> -	ctx->dev = dev;
> -	ctx->pas_id = pas_id;
> -	ctx->mem_phys = mem_phys;
> -	ctx->mem_size = mem_size;
> +	qcom_pas_context_init(ctx, dev, pas_id, mem_phys, mem_size);
>   
>   	return ctx;
>   }
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index 0d55e9e0af3f..c6ec67e1da09 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -476,8 +476,8 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
>    * firmware segments (e.g., .bXX files). Authentication of the segments done
>    * by a separate call.
>    *
> - * The PAS context must be initialized using devm_qcom_pas_context_alloc()
> - * prior to invoking this function.
> + * The PAS context must be initialized using qcom_pas_context_init() or
> + * devm_qcom_pas_context_alloc() prior to invoking this function.
>    *
>    * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
>    * @fw:         Firmware object representing the .mdt file
> diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
> index 1d132e89536e..458075868bf5 100644
> --- a/include/linux/firmware/qcom/qcom_pas.h
> +++ b/include/linux/firmware/qcom/qcom_pas.h
> @@ -36,6 +36,8 @@ static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
>   }
>   
>   bool qcom_pas_is_available(void);
> +void qcom_pas_context_init(struct qcom_pas_context *ctx, struct device *dev,
> +			   u32 pas_id, phys_addr_t mem_phys, size_t mem_size);
>   struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
>   						     u32 pas_id,
>   						     phys_addr_t mem_phys,

