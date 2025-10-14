Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B7530F947
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 08:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430276; cv=none; b=lNJnOL4q4p5E2KShxWRI+LNr18/T/+Ptm+oaqUt6YnqI5vgE73tPbYf6fGe+JCK50knLhV67cKtSnItMCtOgkLq6IGRvDO1axyZv5Qd5I5bwE8w9RNJ4PyeudZtjHIy2+EYkGkRh3kzrVJsy5vtsrBJTEX+M3yDB2qP9yG6rLos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430276; c=relaxed/simple;
	bh=omBQDlN0SNSXKstrq0O2kRGJ7zOFZ+fJkN3e0IgV1JA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZlYtAFilcULFkiwv0dc4jN66i++9C2pK4gf5Rt4i4dY5II2IaDKTPXsWiblOGeKDWefg8L375V+MC9MLrkF2MydpLWGVNu72azB3neoUcTQubfNb2VxHWj+qKUzcft5P6w5pKugx6bmsaaqBR9i8PqMbeKHkU5j3LXwyDToiVfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xZk8uUNb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xZk8uUNb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso37440835e9.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760430271; x=1761035071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1WLMyC6KZHho1k1eIZ+qKx3AxLZ35CnRGvjdbXTrhs=;
        b=xZk8uUNbzSr2yOOstpXtq1eHNwsSuz1u652GVVYIqCMjBSQz4i7AT3eiodhRppomfB
         iwaqArrGX65/YLIGHHJx90TsQOKe9LsH0azL+jYb3wFT/pzTSaWxsFleqA1aHktVzwEx
         +MoqVC99YfFpHQ4+3wass/C3uKra9YOnlb7ctBQ9Q7R6l4EYJM4UJyZvwToHkF9Y2Lha
         O8oBPXJ3+2f5I+zUbxOSSKIRT0w0Z292skf8hfEIKs1MPP6xFdngUfgxAGLG6Qoa470W
         OXGP66IR5gAL4AGRF197Hjishz9d3L6/CMSTr9efF6VHEDC95bI8/fSkW28qE3ZtUsDM
         jq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430271; x=1761035071;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g1WLMyC6KZHho1k1eIZ+qKx3AxLZ35CnRGvjdbXTrhs=;
        b=xUZmhr8MMcVNmPOSsDUUyYHoq6OIHQvm7pCEEF042XzLD1wUrZJkmEwgnfETd5Rd9J
         dRY8l0HpzhUOCHA17N4wGwsFQOBMMdmCe9ZUeCh66wFdTgXV3B64iHnDnvCVrC/5hSWp
         WMVja6omPyjhC6YEK0B23MOyw9JWuwJDoaNsNTtPk4JbzN6q9XFkvOkkPSMINGwxMf0+
         jiUWIuHiYaDByqW2rhJM/PNrU8yeXwl0BnBv7EFJ5A6NTb4w8G89b2O69T9L5181OaCI
         SF4jNK5ECR4mrhz+b0LC+j2U9+oi7O/G7cpMW9ivRdz4crIqblLd7HHbx0iNNuk8dXBW
         6ViQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtaQF4O0Ua8ir4vaGL9mZSATKrnnozPzOagY6QSnh7BF0V0dQYRS+uDfff8sOk6RGb/csP5yhQGsF9x18A5/jb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu3KjlUhE3RztcUBH8GwG7OP5kx1QxbSxn33YlYUL/LxF98/fg
	KIgAcxEnifLxQxJSTog8+5mMQuLVGEFTucsrd8tpC7doE22/gH9c6JB/4H5F9OcbgEk=
X-Gm-Gg: ASbGncueQAWOL44TI7GcmjQQTEWhsX0hZ+68sxLAhq7IYOcd43WmYNyxObhAC9Jfndh
	yf2H7vHmFK6rWo7vNVAjHU6Lm/YdpHj0ohJ+SFEfvraDLJK2KOI03HSet3OmS75qdHVeRDrj9+Y
	DigRydpLNu5SftW01ywqLiAsUR5/HEJARnmhmVZjfAPSkg0VhteBNcy9FpmURWyIvgvlJIq8aD1
	pySjMCnLt90S27xgVVhNLtWrVXgv/SJ/TYCJxtNvFs5xYFYCohV0sP4gK6JiOLJOvMXFCSprvkH
	/XXf0wIe8m2cnqSq/vJBT1P18ter/GyaxO0AP+lYx1/rTh0wsSGYhmiqhtz+qdf50eOM0gvIktj
	fTnkFwF9md5Qyv5MKnHjTvD6AgfVthDbVcbWsPFfVXZ+6uwZTQI+wmDQYjH65WFIYLwEvEm2exK
	6elk7eRfQdacw=
X-Google-Smtp-Source: AGHT+IF2nh8wX/8xS6xnvjff0xiiobDKtkMDK+CZSyPFZvqZoCQ8OqTQRSGwMzPpVRnLz4p9dqoSOg==
X-Received: by 2002:a05:600c:6818:b0:46e:36fa:6b40 with SMTP id 5b1f17b1804b1-46fa9af915emr162139705e9.24.1760430270637;
        Tue, 14 Oct 2025 01:24:30 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426dac0ab7bsm13291015f8f.46.2025.10.14.01.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:24:30 -0700 (PDT)
Message-ID: <27b9a906-3348-4b75-b5e4-12edad91b93f@linaro.org>
Date: Tue, 14 Oct 2025 09:24:27 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] remoteproc: pas: Replace metadata context with
 PAS context structure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
 <20251013-kvm_rprocv5-v5-4-d609ed766061@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-kvm_rprocv5-v5-4-d609ed766061@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 11:03, Mukesh Ojha wrote:
> As a superset of the existing metadata context, the PAS context
> structure enables both remoteproc and non-remoteproc subsystems to
> better support scenarios where the SoC runs with or without the Gunyah
> hypervisor. To reflect this, relevant SCM and metadata functions are
> updated to incorporate PAS context awareness.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c       | 32 ++++++++++++++++-------------
>   drivers/remoteproc/qcom_q6v5_pas.c     | 37 ++++++++++++++++++++++++----------
>   drivers/soc/qcom/mdt_loader.c          |  4 ++--
>   include/linux/firmware/qcom/qcom_scm.h |  4 ++--
>   include/linux/soc/qcom/mdt_loader.h    |  6 +++---
>   5 files changed, 51 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 6d22b2ac7880..b11a21797d46 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -600,7 +600,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_context_init);
>    *		and optional blob of data used for authenticating the metadata
>    *		and the rest of the firmware
>    * @size:	size of the metadata
> - * @ctx:	optional metadata context
> + * @ctx:	optional pas context
>    *
>    * Return: 0 on success.
>    *
> @@ -609,8 +609,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_context_init);
>    * qcom_scm_pas_metadata_release() by the caller.
>    */
>   int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> -			    struct qcom_scm_pas_metadata *ctx)
> +			    struct qcom_scm_pas_context *ctx)
>   {
> +	struct qcom_scm_pas_metadata *mdt_ctx;
>   	dma_addr_t mdata_phys;
>   	void *mdata_buf;
>   	int ret;
> @@ -661,10 +662,11 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>   out:
>   	if (ret < 0 || !ctx) {
>   		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> -	} else if (ctx) {
> -		ctx->ptr = mdata_buf;
> -		ctx->phys = mdata_phys;
> -		ctx->size = size;
> +	} else if (ctx && ctx->metadata) {
> +		mdt_ctx = ctx->metadata;
> +		mdt_ctx->ptr = mdata_buf;
> +		mdt_ctx->phys = mdata_phys;
> +		mdt_ctx->size = size;

Suspicious looking code..

The second check for ctx is redundant as it cannot ever be false. You have

if (ret < 0 || !ctx) {
} else if (ctx && ctx->mdatadata) {
}

The old code was wrong but, that's no reason to continue to be wrong.

Is it currently possible for ctx to be true but ctx->metadata to be false..

void *qcom_scm_pas_context_init(struct device *dev, u32 pas_id, 
phys_addr_t mem_phys,
                                 size_t mem_size)
{
         struct qcom_scm_pas_context *ctx;

         ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
         if (!ctx)
                 return ERR_PTR(-ENOMEM);

         ctx->dev = dev;
         ctx->pas_id = pas_id;
         ctx->mem_phys = mem_phys;
         ctx->mem_size = mem_size;

         ctx->metadata = devm_kzalloc(dev, sizeof(*ctx->metadata), 
GFP_KERNEL);
         if (!ctx->metadata)
                 return ERR_PTR(-ENOMEM);

         return ctx;
}
EXPORT_SYMBOL_GPL(qcom_scm_pas_context_init);

No.

Lets fix the ctx checking logic in this code as we modify the patch.
>   	}
>   
>   	return ret ? : res.result[0];
> @@ -673,18 +675,20 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
>   
>   /**
>    * qcom_scm_pas_metadata_release() - release metadata context
> - * @ctx:	metadata context
> + * @ctx:	pas context
>    */
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
>   {
> -	if (!ctx->ptr)
> -		return;
> +	struct qcom_scm_pas_metadata *mdt_ctx;
>   
> -	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
> +	mdt_ctx = ctx->metadata;
> +	if (!mdt_ctx->ptr)
> +		return;
>   
> -	ctx->ptr = NULL;
> -	ctx->phys = 0;
> -	ctx->size = 0;
> +	dma_free_coherent(__scm->dev, mdt_ctx->size, mdt_ctx->ptr, mdt_ctx->phys);
> +	mdt_ctx->ptr = NULL;
> +	mdt_ctx->phys = 0;
> +	mdt_ctx->size = 0;
>   }

If we have established that mdt_ctx->ptr is the fulcurm of truth for 
this data then setting ->phys and ->size to anything after setting ->ptr 
= NULL are wasted bus cycles.

>   EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
>   
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 158bcd6cc85c..e9dcab94ea0c 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -117,8 +117,8 @@ struct qcom_pas {
>   	struct qcom_rproc_ssr ssr_subdev;
>   	struct qcom_sysmon *sysmon;
>   
> -	struct qcom_scm_pas_metadata pas_metadata;
> -	struct qcom_scm_pas_metadata dtb_pas_metadata;
> +	struct qcom_scm_pas_context *pas_ctx;
> +	struct qcom_scm_pas_context *dtb_pas_ctx;
>   };
>   
>   static void qcom_pas_segment_dump(struct rproc *rproc,
> @@ -211,9 +211,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
>   	 * auth_and_reset() was successful, but in other cases clean it up
>   	 * here.
>   	 */
> -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx);
>   	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>   
>   	return 0;
>   }
> @@ -241,7 +241,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>   
>   		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
>   					pas->dtb_pas_id, pas->dtb_mem_phys,
> -					&pas->dtb_pas_metadata);
> +					pas->dtb_pas_ctx);
>   		if (ret)
>   			goto release_dtb_firmware;
>   
> @@ -255,7 +255,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>   	return 0;
>   
>   release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> +	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>   
>   release_dtb_firmware:
>   	release_firmware(pas->dtb_firmware);
> @@ -306,7 +306,7 @@ static int qcom_pas_start(struct rproc *rproc)
>   	}
>   
>   	ret = qcom_mdt_pas_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
> -				pas->mem_phys, &pas->pas_metadata);
> +				pas->mem_phys, pas->pas_ctx);
>   	if (ret)
>   		goto disable_px_supply;
>   
> @@ -332,9 +332,9 @@ static int qcom_pas_start(struct rproc *rproc)
>   		goto release_pas_metadata;
>   	}
>   
> -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx);
>   	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>   
>   	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>   	pas->firmware = NULL;
> @@ -342,9 +342,9 @@ static int qcom_pas_start(struct rproc *rproc)
>   	return 0;
>   
>   release_pas_metadata:
> -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx);
>   	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>   disable_px_supply:
>   	if (pas->px_supply)
>   		regulator_disable(pas->px_supply);
> @@ -779,6 +779,21 @@ static int qcom_pas_probe(struct platform_device *pdev)
>   	}
>   
>   	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
> +
> +	pas->pas_ctx = qcom_scm_pas_context_init(pas->dev, pas->pas_id, pas->mem_phys,
> +						 pas->mem_size);
> +	if (IS_ERR(pas->pas_ctx)) {
> +		ret = PTR_ERR(pas->pas_ctx);
> +		goto remove_ssr_sysmon;
> +	}
> +
> +	pas->dtb_pas_ctx = qcom_scm_pas_context_init(pas->dev, pas->dtb_pas_id,
> +						     pas->dtb_mem_phys, pas->dtb_mem_size);
> +	if (IS_ERR(pas->dtb_pas_ctx)) {
> +		ret = PTR_ERR(pas->dtb_pas_ctx);
> +		goto remove_ssr_sysmon;
> +	}
> +
>   	ret = rproc_add(rproc);
>   	if (ret)
>   		goto remove_ssr_sysmon;
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index a5c80d4fcc36..fe35038c5342 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -234,13 +234,13 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
>    * @fw_name:	name of the firmware, for construction of segment file names
>    * @pas_id:	PAS identifier
>    * @mem_phys:	physical address of allocated memory region
> - * @ctx:	PAS metadata context, to be released by caller
> + * @ctx:	PAS context, ctx->metadata to be released by caller
>    *
>    * Returns 0 on success, negative errno otherwise.
>    */
>   int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>   		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -		      struct qcom_scm_pas_metadata *ctx)
> +		      struct qcom_scm_pas_context *ctx)
>   {
>   	const struct elf32_phdr *phdrs;
>   	const struct elf32_phdr *phdr;
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index 75dec515c5d2..7c58d26ede24 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -83,8 +83,8 @@ struct qcom_scm_pas_context {
>   void *qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
>   				size_t mem_size);
>   int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> -			    struct qcom_scm_pas_metadata *ctx);
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> +			    struct qcom_scm_pas_context *ctx);
> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx);
>   int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
>   int qcom_scm_pas_auth_and_reset(u32 pas_id);
>   int qcom_scm_pas_shutdown(u32 pas_id);
> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> index 8ea8230579a2..07c278841816 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -10,14 +10,14 @@
>   
>   struct device;
>   struct firmware;
> -struct qcom_scm_pas_metadata;
> +struct qcom_scm_pas_context;
>   
>   #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
>   
>   ssize_t qcom_mdt_get_size(const struct firmware *fw);
>   int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>   		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -		      struct qcom_scm_pas_metadata *pas_metadata_ctx);
> +		      struct qcom_scm_pas_context *pas_ctx);
>   int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>   		  const char *fw_name, int pas_id, void *mem_region,
>   		  phys_addr_t mem_phys, size_t mem_size,
> @@ -39,7 +39,7 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
>   
>   static inline int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>   				    const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -				    struct qcom_scm_pas_metadata *pas_metadata_ctx)
> +				    struct qcom_scm_pas_context *pas_ctx)
>   {
>   	return -ENODEV;
>   }
> 

