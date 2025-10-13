Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6F425A2C9
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760360229; cv=none; b=qv7OZVfMOVWCv+VuMBVLU1F2NrBdfBVBq2ZZRl/m40I7+05V4vRPmb6a1yhTLddEy2uFZpyjIJe8nZSlZIIIWKk6iIVbBUdciMn268HliXJRVDoVtD8DHpdndz6pzYTWl0zKDg785SE8XZulzXb8rPAXQRqu2HIoGYFcWdD4ho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760360229; c=relaxed/simple;
	bh=BpZRKwlkrc+aDngUy60VZ82uqBTrDYEeBA8q5M7Q1PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEtNiwh8K6wbiQzyxWKavcnjeUYPokOsLtpXrVgg/RvlRZqbdL8yVkmiTQD5kLBKd6uLR2r6GXWvN/oWYTrKkqWyclJPq2X8KfCvB9WUIiER2lcwXJYK2Ehnj+Q4jkg6cPZDnonRLSOaJGn9MkYJlsS7fCA47yFjLcp0i4B6eMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlHfUsdw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlHfUsdw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAlF4U017038
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 12:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T7ASgAQCZwc8dQ6+D3ZRQQ0W
	4+MNsqNTi5Un+hN9NRo=; b=WlHfUsdwjrYM8t8oKL0AdTfVfl3nsZlCkPpwlDHN
	G/qJ+21OcM8f7oH9SHWTAE/ffchQf9nTzDWxYeM5sAcHQmtKk1s0qk3JFRJyQ7kw
	IsP0I5LC3VbqvOp5ut9yxeiXzT/UtQjliZ/js33H2lxIX7XfLgKmzBlEKjVbOVDL
	c+uHAaTGebDPr2Uay49Ltv+y1zUXs6zvmoyLMLm/pQbmhSyPrfTizMOSKIhYFtLj
	ny21uUQu2eCJEBmg7A8AYhBjSW2MdrLzYsmNg/V1kuAgIx7b5mTopnhgA6vbcVY4
	MahLjRmhLpMds32lZue+fOGU6owCcX05UxOuziITaTejqQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk4mex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 12:57:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-780fdbbdd20so6985333b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 05:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760360225; x=1760965025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7ASgAQCZwc8dQ6+D3ZRQQ0W4+MNsqNTi5Un+hN9NRo=;
        b=V0FK2R++F6rfJmDGqN2vFh984VJbQ9nai74il8cuCygD9P2+RtzUEZrb214HAr0r3C
         TPckfkLH3m/eZV/GTOOFZOeQeqEZsidb52b8205pWU/A32OexhiTh2dsWBt9RWJYBdvI
         wDrJ1Ls9/uqAeV8MZcWsgB5XhnNVWmDo61XrJdqzBFvtCQU06GSTphfhn1MCtWl5Jmx/
         Bh2JrVjdYumqU+hfooRLiCQllip+SWkgCO1hJZpUTZYI3A11qdtmO89VFD+Xm4/O79gb
         UTJnVf/MbvOX+7jrFncSEaCg+rcnKiYhU6nSlEVOUzG+sx+2KS6y1feJNPk5YEQB9Ned
         hyqA==
X-Forwarded-Encrypted: i=1; AJvYcCUJBZogCFhXolo+/grGhWZlCKk/7Kx3VfkSwYCvkKq9ZZyQClZgGmw+H4jPHxsm3KPs4YLOPVbC4afqGgCiwj0N@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/8paCAkZVlUoDSZnCoz2DzOg8KR4AEQb7HJK9DJy5wh2J4a5
	hoPZ9D67Dx6npYMKl/CFt8SRXk31kNpwhahVY8xnlzimHTRCggwqW0wE2Ytv+N33Ls+xCM1ZAR8
	4tB5ECPZu3/H6NwsvlQBHhnMjCUW3nb0FAJvdFZvzpuYvXbZo1f6bHG/QXCYIk3rvKzENNn9Q
X-Gm-Gg: ASbGnctqdYtjwgt4M5QIbnt45nu29xacGQKWQEMg5NytwqzEXzEp4akAT3lL2ifAytp
	lW+TCpktohoFZOunvb/WBdcX6p6oubuxKqwT775yoFM88LFOnepx0aGHHW4imPFFZJRmQAdv/CB
	DX/uiAUu/wElayugqza/O8rQLnJmmRtLSga68UeM6vKCfApqBP3hPdT8qAYDVPb/uExzLGWq0yJ
	4JJmowdRYkh1fhBi4EhMCRlEB2bOsJRJdZO8gagjW7JTLoK1bSU8sCmOXePA/cm8hUup81tcyKR
	0vXLsTsFpGVk4KiRmqCoNuKWyIPcDPwcFDSIw+x+TisaKfQvANy5RXELm7gr0BFfBG8=
X-Received: by 2002:a05:6a00:23d5:b0:776:138a:ec97 with SMTP id d2e1a72fcca58-79387d0f68emr26353062b3a.28.1760360224498;
        Mon, 13 Oct 2025 05:57:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW9yToX17U2L6kX4KKsT4jqMK3Cx26sRMwuwR5UD83LNayp4z6KSBzvkWGH7yYjw9W9pM2Pw==
X-Received: by 2002:a05:6a00:23d5:b0:776:138a:ec97 with SMTP id d2e1a72fcca58-79387d0f68emr26353002b3a.28.1760360223746;
        Mon, 13 Oct 2025 05:57:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b252f23sm11463856b3a.6.2025.10.13.05.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:57:03 -0700 (PDT)
Date: Mon, 13 Oct 2025 18:26:56 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 05/13] soc: qcom: mdtloader: Add PAS context aware
 qcom_mdt_pas_load() function
Message-ID: <20251013125656.cujoip46xzs3hpa2@hu-mojha-hyd.qualcomm.com>
References: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
 <20251013-kvm_rprocv5-v5-5-d609ed766061@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-kvm_rprocv5-v5-5-d609ed766061@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: XuhAHqpgNKguHLviBLdvWgDL76b4WH4x
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ecf722 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_p9HljgPTWsdKfd2BfYA:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: XuhAHqpgNKguHLviBLdvWgDL76b4WH4x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX1tjWGzeBRZIt
 9K2aQzNQ7xGX+glHtT1O2AdSTlMGsvPRjDw7uXaUSGShswIFqLs06wwVw48pVad23yVTa6JTHBZ
 uYzgai2LViN9GWGRY4O/DyRNKynQVVWg8vQ7b9zVoO6cZe7WzC9jcv3GI3Lz8dRqkRlkS5Mne3L
 jVmJ9pHovUgUa/xm9rFAb7x3n+VVkJCLdy/3m38TVlGdIld6bv0ulaYWUuTufkJymaaPiEW+9Xk
 jiCvsToo0s1SQ9cjpXvXqLNJedCPQSS2WmUsyhg/oesRCqSiyGPswEd+CecmeckxQbxgEbACUdX
 B4OD8acWTvdspIGfOhr/jXOp8+rVw1G6C0/MLhcc8uH8DcliGrrBIRLS6nKZ8KJ07xgIvt5a/yP
 Uwm0oveMChv8b5mKH8wxLdFIKWe9/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Mon, Oct 13, 2025 at 03:33:09PM +0530, Mukesh Ojha wrote:
> Introduce a new PAS context-aware function, qcom_mdt_pas_load(), for
> remote processor drivers. This function utilizes the PAS context
> pointer returned from qcom_scm_pas_ctx_init() to perform firmware
> metadata verification and memory setup via SMC calls.
> 
> The qcom_mdt_pas_load() and qcom_mdt_load() functions are largely
> similar, but the former is designed for clients using the PAS
> context-based data structure. Over time, all users of qcom_mdt_load()
> can be migrated to use qcom_mdt_pas_load() for consistency and
> improved abstraction.
> 
> As the remoteproc PAS driver (qcom_q6v5_pas) has already adopted the
> PAS context-based approach, update it to use qcom_mdt_pas_load().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c  | 24 +++++-------------------
>  drivers/soc/qcom/mdt_loader.c       | 32 ++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/mdt_loader.h | 10 ++++++++++
>  3 files changed, 47 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index e9dcab94ea0c..ee0ea35803c6 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -239,15 +239,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  			return ret;
>  		}
>  
> -		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> -					pas->dtb_pas_id, pas->dtb_mem_phys,
> -					pas->dtb_pas_ctx);
> -		if (ret)
> -			goto release_dtb_firmware;
> -
> -		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> -					    pas->dtb_mem_region, pas->dtb_mem_phys,
> -					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
> +		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
> +					pas->dtb_firmware_name, pas->dtb_mem_region,
> +					&pas->dtb_mem_reloc);
>  		if (ret)
>  			goto release_dtb_metadata;
>  	}
> @@ -256,8 +250,6 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  
>  release_dtb_metadata:
>  	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> -
> -release_dtb_firmware:
>  	release_firmware(pas->dtb_firmware);
>  
>  	return ret;
> @@ -305,14 +297,8 @@ static int qcom_pas_start(struct rproc *rproc)
>  		}
>  	}
>  
> -	ret = qcom_mdt_pas_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
> -				pas->mem_phys, pas->pas_ctx);
> -	if (ret)
> -		goto disable_px_supply;
> -
> -	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware,
> -				    pas->mem_region, pas->mem_phys, pas->mem_size,
> -				    &pas->mem_reloc);
> +	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
> +				pas->mem_region, &pas->mem_reloc);
>  	if (ret)
>  		goto release_pas_metadata;
>  
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index fe35038c5342..52de8adcc4f2 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -486,5 +486,37 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
>  }
>  EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
>  
> +/**
> + * qcom_mdt_pas_load - Loads and authenticates the metadata of the firmware
> + * (typically contained in the .mdt file), followed by loading the actual
> + * firmware segments (e.g., .bXX files). Authentication of the segments done
> + * by a separate call.
> + *
> + * The PAS context must be initialized using qcom_scm_pas_context_init()
> + * prior to invoking this function.
> + *
> + * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
> + * @fw:         Firmware object representing the .mdt file
> + * @firmware:   Name of the firmware used to construct segment file names
> + * @mem_region: Memory region allocated for loading the firmware
> + * @reloc_base: Physical address adjusted after relocation
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
> +		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
> +{
> +	int ret;
> +
> +	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys,
> +				ctx->metadata);

s/ctx->metadata/ctx

This has been done 6/13, missed here in patch reordering.

> +	if (ret)
> +		return ret;
> +
> +	return __qcom_mdt_load(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
> +			       ctx->mem_size, reloc_base);
> +}
> +EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
> +
>  MODULE_DESCRIPTION("Firmware parser for Qualcomm MDT format");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> index 07c278841816..7d57746fbbfa 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -23,6 +23,9 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  		  phys_addr_t mem_phys, size_t mem_size,
>  		  phys_addr_t *reloc_base);
>  
> +int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
> +		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
> +
>  int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
>  			  const char *fw_name, void *mem_region,
>  			  phys_addr_t mem_phys, size_t mem_size,
> @@ -52,6 +55,13 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  	return -ENODEV;
>  }
>  
> +static inline int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx,
> +				    const struct firmware *fw, const char *firmware,
> +				    void *mem_region, phys_addr_t *reloc_base)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline int qcom_mdt_load_no_init(struct device *dev,
>  					const struct firmware *fw,
>  					const char *fw_name, void *mem_region,
> 
> -- 
> 2.50.1
> 

-- 
-Mukesh Ojha
