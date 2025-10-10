Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E066D22258C
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Oct 2025 06:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760077300; cv=none; b=HcoV92EAiairy9io6KRIXJEpyHGud2bLTudJJ1X0xSShPA1lMtx8cFtSSCVLQSArvOobsyjj/afdwd3VyRRtW6QkJs/aqQbzSmiffasQigpPiD7cUPxCR1mNdZmjYSLgM/Ys5nMS4Y3sQAlx68eOO+Zekj0yi3u2cOgWRq6P9Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760077300; c=relaxed/simple;
	bh=aMhdMuV/5n0XxxWRTIt0WPoXUXnD8K8moBE09tX22ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VB1k8S2ClqRooF1TiVKYloHrsMwXh5K3UgcoPEjCu+F6ibxp3i5sUrQX6q63eog1C6D+FPHJQ1+Hcwv89115jahIMtsX9k32gBHTY0OG0A4XTxeeMVu6HAU5HAiNc8FRS4pGRBRorICsckNt1b+/xh7uR21r9fpZ6wXPET6/TQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1KDE9Fw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1KDE9Fw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6IwqX012062
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Oct 2025 06:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e13hlBdIwI3NhYtoZcu6Tz3K
	/F+frP7s8cc8T89sknA=; b=S1KDE9FwlBShxZetwR2Wc3JULQL/BcRy5swN2OGM
	ngAirXrgZzpfEZUYf2uSUE2GrxEoWy3FW0k10ga6oymECKO+5BpXr/49AQvT5e61
	Ocfw1gKk/fFPHdKDx3k1a6y7lgBrEiToXG7bPE8J9owzVsglZWTOa/zh9B6c9rF9
	3hA2De7sBQTRqeLVcMvl/xqSS+JTRV2FRPPbz8Vx6OD0FVlmx49uXfm5er6dC8RP
	pVcauezBTcfpFDIYz01gKLl86YXTbvMP6NIyu/gCcmoFQp7UITPQuthPfCAzn0Qp
	c10mYEjrdiUgjX9lCbeuis97mnTyCJ5Y0/ovhu+GcJ1GQA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4knavj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Oct 2025 06:21:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-286a252bfbfso79905955ad.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Oct 2025 23:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760077297; x=1760682097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e13hlBdIwI3NhYtoZcu6Tz3K/F+frP7s8cc8T89sknA=;
        b=CPUss2iNMJjC+qfPLGktC0FTTPN2mbNobs8aHuWqVHTMdtTzYG3Jl/mWxti53U2Ut7
         fnSx8kFBhDlwn4S1CFjMOjsUb7PnNa63TBFf4I6vEB4SChcVH/A9A6gFXXj5L3BghYvU
         VFnrxdtC+xU2sfnPWp8SY0EQjAyWptCR+orDeFUKmYXrbjY2OAbhrRQEi0yZCYQNkNIA
         QG8HDUZybJUad6URpk5RtOmGQaotRp6wgIDZdyjA8QT/zgKT/8FQ6TWrUwuLne9oiC7a
         FtDvhRdWIkaQVrX0yIXqUQCX8trqbRx6e7BRilfmLIOWnrjCvaLsr4hLI7EPS0oi3tjW
         BJWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwdx8j2uvhq89nM4MtCBSzE7SoPkXh0eQJz/pHVdJp7l7uPkVZiUqJP1XzdcMmsHruc3+m2Eg6mDqAIFJNz4Iw@vger.kernel.org
X-Gm-Message-State: AOJu0YwAsM51YzYGuaJvsGT7r0flOoc7feJgLyI5Vn9DcT0XdByuUAc5
	2hTYQ2xNCz0UgFPkpcp6QR4Pc/7RPgHVVGdNnwEjnYkCZu4eCFeuUbJgdk6z8d1Gq+4hmnwAVwp
	lyWmi7f2173fBVJ7K+kmz3j129mJ3kNGZbqRZE8TrnDoAbWDLUUilQI+JyNfk65doGZHSa+cD
X-Gm-Gg: ASbGnct7UPyUARoc1zkk0lxI8U6LexnkjNd/5/L25Rcr2UNFCDIcV8F7eRm+0hiwk7A
	ByhO1cqB/b2zgJPG1hX/awM/f/DVPbb2b8LGo7RoJXDd4+iTfOf7fH4/ib/l2rdV55dJmnJQDzL
	rUyE6mUS2KJUzKSQI1pxmgrcDbAsBO+c8YVTof9R/BznWFWDtT0hmg8K1ohsuoWQYlof2BXdXqk
	XSZy12LIEq+8iOz+/Yyki/0MPXDkVmXIOkwmEat36fGcwv4dg8Q8RQLt/fTPttJMhau/9mG5yI1
	rrD0LJg8bD0mpa+ZNn6F+t2+bmtho2gAJNu37bD5QIhgcYY2iByw5o9B9RKr3OmpX10=
X-Received: by 2002:a17:903:2c0c:b0:24c:cae9:77bd with SMTP id d9443c01a7336-290273032d9mr131306245ad.54.1760077296983;
        Thu, 09 Oct 2025 23:21:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm5rfxpK9hr9wzL70jfmd5cFc+zBjzoFBTNU0+gbJ7q4MWYYUoZ/cU4hiwJy2Hc0lOqq0CRg==
X-Received: by 2002:a17:903:2c0c:b0:24c:cae9:77bd with SMTP id d9443c01a7336-290273032d9mr131305985ad.54.1760077296377;
        Thu, 09 Oct 2025 23:21:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de658bsm46996665ad.22.2025.10.09.23.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 23:21:36 -0700 (PDT)
Date: Fri, 10 Oct 2025 11:51:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/12] soc: qcom: mdtloader: Add PAS context aware
 qcom_mdt_pas_load() function
Message-ID: <20251010062129.xuh63zgbc3pfp3ar@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-4-de841623af3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-4-de841623af3c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e8a5f2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=hC_cApFbebj-mLVYSEcA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ln4IRFMizdfbPKZuVqaHZqRaaVheFHPm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX2D+qgoYaZ0aq
 SAwWJDx10u+vaEsC58Y7eWwF0v48RBAQhT8BTWdK90BbnFSM+6ka1w3R2rJul+F0S+Jm/+QcMvN
 UUVmM1vjoQ0KtboyFjWb4h7FniKjxOHSHvlfgeMj/eTIseDPDnZwqCnkItFjb7e4tx4dApmKAMn
 jmtz1NlueXs0ofzXA0btDheioUG0OnZzdQ1C3laR6NRzp2kGdkUMr0frJSNkUQ3voAWfAShgx9m
 H5wpuES8atqW8IbL6PeXs6vcCegqT+5h3SOJOY/FxVWkGXQLZFPzKE9eemmuod4oq6ILL2gK1tk
 J/6eQGnMsULfPUKsu/aECXawfv7XMIba7u/hyzS5VKV+mexfkZYtgCamFGyyT+gnb5zuY2UxP1x
 T1p0bqti+n6Est9h/M76O6ZxtYj0Sw==
X-Proofpoint-ORIG-GUID: ln4IRFMizdfbPKZuVqaHZqRaaVheFHPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Tue, Oct 07, 2025 at 10:18:49PM +0530, Mukesh Ojha wrote:
> Add a PAS context-aware qcom_mdt_pas_load() function for remote
> processor drivers, which can use the context pointer returned from
> qcom_scm_pas_ctx_init() to perform metadata verification and memory
> setup via SMC calls.
> 
> The qcom_mdt_pas_load() and qcom_mdt_load() functions are almost
> similar. Clients using the PAS context-based data structure can adopt
> qcom_mdt_pas_load(), and in the future, all users of qcom_mdt_load()
> could be migrated to use qcom_mdt_pas_load() instead.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c       | 29 +++++++++++++++++++++++++++++
>  include/linux/soc/qcom/mdt_loader.h | 11 +++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index a5c80d4fcc36..31855836b251 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -486,5 +486,34 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
>  }
>  EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
>  
> +/**
> + * qcom_mdt_pas_load() - load the firmware which header is loaded as fw
> + *
> + * Client should initialize the PAS context with qcom_scm_pas_context_init()
> + * before calling this function.
> + *
> + * @ctx:	PAS context pointer
> + * @fw:		firmware object for the mdt file
> + * @firmware:	name of the firmware, for construction of segment file names
> + * @mem_region:	allocated memory region to load firmware into
> + * @reloc_base:	adjusted physical address after relocation
> + *
> + * Returns 0 on success, negative errno otherwise.
> + */
> +int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
> +		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
> +{
> +	int ret;
> +
> +	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys,
> +				ctx->metadata);

There is no user of qcom_mdt_pas_init() now after this, this can be
converted to __qcom_mdt_pas_init() and removed from exported list.


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
> index 8ea8230579a2..2832e0717729 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -11,6 +11,7 @@
>  struct device;
>  struct firmware;
>  struct qcom_scm_pas_metadata;
> +struct qcom_scm_pas_context;
>  
>  #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
>  
> @@ -23,6 +24,9 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  		  phys_addr_t mem_phys, size_t mem_size,
>  		  phys_addr_t *reloc_base);
>  
> +int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
> +		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
> +
>  int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
>  			  const char *fw_name, void *mem_region,
>  			  phys_addr_t mem_phys, size_t mem_size,
> @@ -52,6 +56,13 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
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
