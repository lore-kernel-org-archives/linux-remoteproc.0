Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98D6238C07
	for <linux-remoteproc@vger.kernel.org>; Sun, 21 Sep 2025 21:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758490269; cv=none; b=Ta0ruOqeYx+ojiJNHzAp3mIGSb41LnjnIMelkXNTTZ88hUxQ70so8wUrf+9mzT8wfjbX6jyICyGx4VzctWr5ca+qJoGeVTTsy8wiuzTMx/HK/9xCYLcv+fTydfZuw0tkv44tuBCaNp/xe4KJnHtMCgytpoiA/ardxuvmzIbklhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758490269; c=relaxed/simple;
	bh=DZpkHI4TD2hvKTQKBnBvZs/BblBW5gA4aYkqMLJjl5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EbrXqyQAF0GIIrjFbm8KxkH7Y3bazMBtKbeuucj2Dh9acwgA+eguYq7RLyGLbGJCHbGGKsTHD3aE7RzKDwyb3CiygOWiQma7kzF54iOchcNqR7RfC/9TcI+hgcat8RgDq2RFRrDTP/CQkE52l/kKT/EVDOCFLaFD4ZjDQJDSnl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NP5Y6sVj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NP5Y6sVj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-468973c184bso11922815e9.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 21 Sep 2025 14:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758490266; x=1759095066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbZQorlrgA6b5A6SBj4ZBWzjR7Vw60RlID9QDg6+Jl0=;
        b=NP5Y6sVj36oU6fN92/xtCrZ6OAlf7AcTqY3omPIlLwr01wX6cXkYOItLz34qzq73cV
         s+MR+JcOv35XKG1/0rVfIex8u5755wSMXSbIMQfH6/lr+8smjIbSolW8sSJJQiJnskja
         JSWuzH2P57A9p3KQxrfWcJa0u34qt5tUYM4M+wcRrcAaa90YIwPDKNyu9uJiCltHOnMZ
         jhbzKsDQUUUm57u+CmA696QMzr9vRdzyOX0s4SowzTZ99QDILJ+b+WXwME+ioc8RR2JC
         3YCe9zhIip2LxYnZ5jODsyiybhseXiwFLaYLCHe8AJzxcZG19iIAWxX7Wjpupb9aKsmx
         zvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758490266; x=1759095066;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbZQorlrgA6b5A6SBj4ZBWzjR7Vw60RlID9QDg6+Jl0=;
        b=IjvZgSMzdF7Ln7q4sbTAblC61EPtZib2fXcOPWY/aSmNGaCYNI2INP54xolYmAG7ba
         XcYkBwb8JJ9vzYoSeE2KX9UsReDH01a3vl0DrsC2xRu5SNfeCv3iFrcX2jbAI8QiBbRi
         rfMYf0TbjQgO27bupzVB6i9q1Uo7XOX/pCm5/i9xWyD/DlDowmTdZmzNaNf4Zl/f18ZB
         vnv2IkztZf++gaGzLwlI8Re7ANHOGnepEIUhd8rf8nAYSF3DBRMqT3DH0eQIzOoc1Y3a
         PsOqiHYDcRSTPiKY1IyCGnTXB6m+xYIrCU/sHkP+7d06a+LAZ+L4wHX0yp6jbVG6jHFv
         hu/g==
X-Forwarded-Encrypted: i=1; AJvYcCUUm6pbWij7opHfPCgZoIO8Pu8UFUMDm/9aCZ4yq1j+V9urNhB65rNB9TAHFh6Y1iPRAFfqSwk+mX9ynD35Smnu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq6jErugnRJKx1km43A8IaszqOcKFur4VJGzDriApiPX5hRngy
	T5mj7CGnKXntMjBJftP/eQBCUZXHvf7BCGOhVLIXJc4ytFSsUS82Scus9d/Ag07NbeM=
X-Gm-Gg: ASbGncuOLpvUMqd/yJqpQq7gYdnT2HNQi6aXL0aXyuLln9upFbe67ONogMQPZRTs4hU
	JZvV+2B6IRw9jfkLOQN3l0rH2Bqu8+b8slf+IHVKi7TWeljZjBqbPFvIQznuAq3aOzGzZuqoZHt
	3WxpEv/h+kNHi6uGJYf4S1TbB3VYb2mF4icidSqDVOLIxaasAZ7A9VUoZbfXaejWzan8cmPABLG
	u4KwgQhBypA7TIWQcim5p83zaAqxgHN58uTMLGqsb0PUerBqsJiG1jbOZtaPspCYhFVCbcTidql
	SbAcgh59CW+FD990/g7gAZvel/wkdIU1mlGeelCBgDqf/ZNOHEOwTR2M7JFnabTZWwXuKRCWxuS
	jJwh8qw+3Y4O6Tu2jd0FZIqSimPGAskBDMp1kY/XYnskeeMhv0Pz1qsupaGfe0DJSqscvkSob3y
	YYwY+g8q5aeWAUJAiRAGU=
X-Google-Smtp-Source: AGHT+IGqFUiCUYgfnAodCkYRdOYe88jnjHMAVwRc+cHVKvA44NreuIhB2IHj2+gqeBMuaZ+h+lm2Ow==
X-Received: by 2002:a05:600c:450b:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-467eaa86fddmr108599635e9.31.1758490265825;
        Sun, 21 Sep 2025 14:31:05 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613e09f879sm214454715e9.19.2025.09.21.14.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 14:31:05 -0700 (PDT)
Message-ID: <fb4ce572-5fd7-4533-a783-f98c191dc910@linaro.org>
Date: Sun, 21 Sep 2025 22:31:03 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] firmware: qcom_scm: Rename peripheral as pas_id
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <h5BhHaTRDvnuxhBvoD8fUGJ_NA7Kg29dqnpXWxtR36TI4j3KPZ1lC5cARb92L7F9mPrWcZtsjIb3aI7ASr0V8w==@protonmail.internalid>
 <20250921-kvm_rproc_pas-v3-2-458f09647920@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250921-kvm_rproc_pas-v3-2-458f09647920@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2025 20:41, Mukesh Ojha wrote:
> Peripheral and pas_id refers to unique id for a subsystem and used only
> when peripheral authentication service from secure world is utilized.
> 
> Lets rename peripheral to pas_id to reflect closer to its meaning.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c       | 30 +++++++++++++++---------------
>   include/linux/firmware/qcom/qcom_scm.h | 10 +++++-----
>   2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index e777b7cb9b12..3379607eaf94 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -562,7 +562,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>    * qcom_scm_pas_init_image() - Initialize peripheral authentication service
>    *			       state machine for a given peripheral, using the
>    *			       metadata
> - * @peripheral: peripheral id
> + * @pas_id:	peripheral authentication service id
>    * @metadata:	pointer to memory containing ELF header, program header table
>    *		and optional blob of data used for authenticating the metadata
>    *		and the rest of the firmware
> @@ -575,7 +575,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>    * track the metadata allocation, this needs to be released by invoking
>    * qcom_scm_pas_metadata_release() by the caller.
>    */
> -int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> +int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>   			    struct qcom_scm_pas_metadata *ctx)
>   {
>   	dma_addr_t mdata_phys;
> @@ -585,7 +585,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>   		.svc = QCOM_SCM_SVC_PIL,
>   		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
>   		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> -		.args[0] = peripheral,
> +		.args[0] = pas_id,
>   		.owner = ARM_SMCCC_OWNER_SIP,
>   	};
>   	struct qcom_scm_res res;
> @@ -658,20 +658,20 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
>   /**
>    * qcom_scm_pas_mem_setup() - Prepare the memory related to a given peripheral
>    *			      for firmware loading
> - * @peripheral:	peripheral id
> + * @pas_id:	peripheral authentication service id
>    * @addr:	start address of memory area to prepare
>    * @size:	size of the memory area to prepare
>    *
>    * Returns 0 on success.
>    */
> -int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size)
> +int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
>   {
>   	int ret;
>   	struct qcom_scm_desc desc = {
>   		.svc = QCOM_SCM_SVC_PIL,
>   		.cmd = QCOM_SCM_PIL_PAS_MEM_SETUP,
>   		.arginfo = QCOM_SCM_ARGS(3),
> -		.args[0] = peripheral,
> +		.args[0] = pas_id,
>   		.args[1] = addr,
>   		.args[2] = size,
>   		.owner = ARM_SMCCC_OWNER_SIP,
> @@ -699,18 +699,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
>   /**
>    * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
>    *				   and reset the remote processor
> - * @peripheral:	peripheral id
> + * @pas_id:	peripheral authentication service id
>    *
>    * Return 0 on success.
>    */
> -int qcom_scm_pas_auth_and_reset(u32 peripheral)
> +int qcom_scm_pas_auth_and_reset(u32 pas_id)
>   {
>   	int ret;
>   	struct qcom_scm_desc desc = {
>   		.svc = QCOM_SCM_SVC_PIL,
>   		.cmd = QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
>   		.arginfo = QCOM_SCM_ARGS(1),
> -		.args[0] = peripheral,
> +		.args[0] = pas_id,
>   		.owner = ARM_SMCCC_OWNER_SIP,
>   	};
>   	struct qcom_scm_res res;
> @@ -735,18 +735,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
> 
>   /**
>    * qcom_scm_pas_shutdown() - Shut down the remote processor
> - * @peripheral: peripheral id
> + * @pas_id:	peripheral authentication service id
>    *
>    * Returns 0 on success.
>    */
> -int qcom_scm_pas_shutdown(u32 peripheral)
> +int qcom_scm_pas_shutdown(u32 pas_id)
>   {
>   	int ret;
>   	struct qcom_scm_desc desc = {
>   		.svc = QCOM_SCM_SVC_PIL,
>   		.cmd = QCOM_SCM_PIL_PAS_SHUTDOWN,
>   		.arginfo = QCOM_SCM_ARGS(1),
> -		.args[0] = peripheral,
> +		.args[0] = pas_id,
>   		.owner = ARM_SMCCC_OWNER_SIP,
>   	};
>   	struct qcom_scm_res res;
> @@ -772,18 +772,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_shutdown);
>   /**
>    * qcom_scm_pas_supported() - Check if the peripheral authentication service is
>    *			      available for the given peripherial
> - * @peripheral:	peripheral id
> + * @pas_id:	peripheral authentication service id
>    *
>    * Returns true if PAS is supported for this peripheral, otherwise false.
>    */
> -bool qcom_scm_pas_supported(u32 peripheral)
> +bool qcom_scm_pas_supported(u32 pas_id)
>   {
>   	int ret;
>   	struct qcom_scm_desc desc = {
>   		.svc = QCOM_SCM_SVC_PIL,
>   		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
>   		.arginfo = QCOM_SCM_ARGS(1),
> -		.args[0] = peripheral,
> +		.args[0] = pas_id,
>   		.owner = ARM_SMCCC_OWNER_SIP,
>   	};
>   	struct qcom_scm_res res;
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index a55ca771286b..a13f703b16cd 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -72,13 +72,13 @@ struct qcom_scm_pas_metadata {
>   	ssize_t size;
>   };
> 
> -int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> +int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>   			    struct qcom_scm_pas_metadata *ctx);
>   void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> -int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
> -int qcom_scm_pas_auth_and_reset(u32 peripheral);
> -int qcom_scm_pas_shutdown(u32 peripheral);
> -bool qcom_scm_pas_supported(u32 peripheral);
> +int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
> +int qcom_scm_pas_auth_and_reset(u32 pas_id);
> +int qcom_scm_pas_shutdown(u32 pas_id);
> +bool qcom_scm_pas_supported(u32 pas_id);
> 
>   int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
>   int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
> 
> --
> 2.50.1
> 
> 

Thanks, thats a more comprehensive patch than I had expected.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
