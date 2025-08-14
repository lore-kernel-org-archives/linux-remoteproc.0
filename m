Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14B625A334
	for <linux-remoteproc@vger.kernel.org>; Thu, 14 Aug 2025 06:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755154333; cv=none; b=JTEmnrVL2ENjkwt1zAlYZoHTqneditkVQ4/3br4mzbMMtbazkr6joj3mKfUiFjRhQMlQBtQjcXvgDeJCBNIjW7khuhfSpEjwVULQIxTDuvDvkdRfjV0og6yNUfBJoFNAcMKyIhFNC4i2Q2nSwvKnKkO/ypRKKoqvQvFDhFgvXzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755154333; c=relaxed/simple;
	bh=735zI8v6gCWPco16jb2nXsuda3pPS6+dALJsF6E93Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHEJGJybJFuTE4oVAj4Mge5oz7ESWQEX5/Io4C43/7kFIBiJJHOVSqZikDDnXrKKi5cAt/i+rV/d1tE9/q7+pH/zAjSbWe/qHlrYPlXyLf3z8jCGbNCmdHwelPUeb/1S5S+sh2thh5QHYQJPc+ldb+2xJPbhXlAIdx2nyqo1j7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWf9WJA4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWf9WJA4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMnmkl020683
	for <linux-remoteproc@vger.kernel.org>; Thu, 14 Aug 2025 06:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=owhi08C/M/NN6d0s604Ju+m1
	uDGPJY3DmSHO26z2ljg=; b=HWf9WJA4YNEMkKYqHshBP/5z3OILqxFW/kix8dkM
	vK7hhkcNIW6Z6wLB0qzaxVobXrjPpm0oHj/cf+9I8ekd/7n6sCapHX0xL+7OYFUO
	tlphFb/YO+WjWPA77qQo9NyWmiIzZp///U1dSDaniiwTO6+HOLofNpXqS4UvXm21
	Rrmxj9m4pUAlhrZTpRYAKGiZKP5U/t4mOcJbUA+Y079iS3GQtjJJKDeJEgvgH3vf
	FlbrLIP2J2Cb6dW/swQDMycluZponh4VUfKH4zGf0g6i5KqdVxtVwF5ZQ048dOXu
	mTkeCQF3aFCfHT8WLdIVG7NGqsmIaVT9u2ToswO/rwA4Jg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmem94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 14 Aug 2025 06:52:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109c7ad98so24428571cf.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Aug 2025 23:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755154329; x=1755759129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owhi08C/M/NN6d0s604Ju+m1uDGPJY3DmSHO26z2ljg=;
        b=JapDHe0DqWzspNqCZiVoYakOfcyORt+B+Hz0qomARtDFvgrW3tyzvhR1QGkSgJj/ZV
         awokWZvSLek7qdZdUUOsxqpPoXVcdRtBiOfHB7nHhFKkM1X5MNM432fpvbDW2aRE6EIN
         d+X34AN5XdtLfSX6Uf3cMHmEJFg1naFZ2v3gsfir5KYhEAxcoK6sjaCOWGXmmn7iEwQS
         dRuTUot1YcczAvfeok6ulaDXNXGeLwDMx4Cl7lKA1HGVeQkpl2ZZK16osIbUcyYsqG+s
         T5yKI0g3aUmujDPJzmkfoj93FzlohezCvhjwtR4HXaXuWUlGf1LkxqQhU+RDHbwNhbmw
         jA/g==
X-Forwarded-Encrypted: i=1; AJvYcCXf8FaRWsyGNHsz7yEDIXfa4t9f+ktqB0elM2SUijaw3rfStC+0EaUAmxTVyAxhzjRG7dMyyFPCsGrl1K8CCHsf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj+qkRQfPeajT7/K2gGOAAVxyX2frm53xXAsIx3jgKXVajnPd3
	HCJA7FSMh/BeWRW7eHrOHxKx2InfTs7sHQGjDjuoFcTBErgyXEqpD9mZKjnLVBipRYox1Vq6hI+
	0f/VscnsHychAH1EAdZGeEKVHqpWKfKWxzyOYnb5SIktiArpDxKc90lVw6jX1o60OoaxlaTK8
X-Gm-Gg: ASbGncvSlz6MG4SZRzH5XgKFzdhPy6vOYFBVD0PI+th/wxe1PZOY2htM6cqlmNGfpPU
	Ryk7gaIoo119RmCUchuoVjmDnuy4aU67I7GnBjyI9nZvpoASYcDDpku3wK7HepGcsUYApjjtXaq
	d52GfAZlzZ6QcU3RhFFCi2OUwSppUHKWq/kp+FPaFZ2KsbFN3kZC6lbRBgwJUeyDc7fpvNrJ8bF
	R7MOd4hiFet8ko0zUl4Sc+9t+VvBIRoi+Yx9Nesr0EKg8krr662G0sGizYGMD4zYIOjjrwJ8w4y
	qqLxVRDEk3iWAUD/x43GOxijRnYsS4rwF4PbLVbbvWmhERUdnBt/RgwYjVG7/J5yODs+eXPC2vz
	+OgLxSNsOfOiEWowxxeZYVr5J+4TpZF6x+AyLFIMBv1pTQjFc9PNE
X-Received: by 2002:ac8:5808:0:b0:4b0:7f93:3cdb with SMTP id d75a77b69052e-4b10ab647c5mr31568051cf.43.1755154328721;
        Wed, 13 Aug 2025 23:52:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM0qr1LVcYRMByeamQSKE14P39HiE+Ci5RWjhuXSylU1tRHSO3/y8Hd3syjoumZhxu28HzQw==
X-Received: by 2002:ac8:5808:0:b0:4b0:7f93:3cdb with SMTP id d75a77b69052e-4b10ab647c5mr31567601cf.43.1755154328087;
        Wed, 13 Aug 2025 23:52:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bdcfsm5494037e87.32.2025.08.13.23.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 23:52:07 -0700 (PDT)
Date: Thu, 14 Aug 2025 09:52:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
Message-ID: <te2o47dxihjsckaigfdhbrbyqxaeqmchmtx5xbx5y2smu6yaja@t7uccvfsxmay>
References: <20250813214808.895654-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813214808.895654-1-robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX7XcdprZZ/8j+
 2RcHHlD2N/zS0GbpIaRPfbcwYk3y+eIVRI4KqU0jPZu7j4yfWsjPPAYLCK8Vq6XFBMwKXvpTiM5
 4CqK669/lHusXPrtgh6iZpQpd3fgGpTpeyq+aEWnFjLv7N+GlDuW4dyvsAkWzRVYrSuo6LDkSOT
 dBtnQiVSaE6yaq60OWWt5fsjX9kjAgBbxiRc0GFOiguXcJNtDkEY0fu1KUTRxeYxSLfwP53Rgog
 pRkg5Z/4QWZvlIrqiuSdXXp5YY7+ft8P8HO+yoFjKXcWNnfG3WgITYzAXpYt7HObOYH2fsxEGMz
 TQvFkgGwjoYna6F3sc1slEEuBlxyMeTw69XIHqH1IWSXYxOi1UszA5GV+oPr1WIbglLIFwvGXli
 rdqtc0ho
X-Proofpoint-GUID: jVWhHEvZElPTFzIQuoAGih7b0hDTIIoP
X-Proofpoint-ORIG-GUID: jVWhHEvZElPTFzIQuoAGih7b0hDTIIoP
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689d8799 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8
 a=3NaVR53663puj-g3OQgA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

On Wed, Aug 13, 2025 at 04:48:03PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc.c
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v4:
>  - Rebase on v6.17-rc1. qcom_q6v5_pas.c conflicted needing s/adsp/pas/
> 
> v3:
>  - Rebase on v6.16-rc1. Move TI K3 changes to new common file.
>  - Fix double increment of "i" in xlnx_r5
> 
> v2:
>  - Use strstarts instead of strcmp for resource names as they include
>    the unit-address.
>  - Drop the unit-address from resource name for imx and st drivers
> ---
>  drivers/remoteproc/imx_dsp_rproc.c        | 45 ++++++--------
>  drivers/remoteproc/imx_rproc.c            | 68 ++++++++------------
>  drivers/remoteproc/qcom_q6v5_adsp.c       | 24 +++-----
>  drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++------------
>  drivers/remoteproc/qcom_q6v5_pas.c        | 75 +++++++++--------------
>  drivers/remoteproc/qcom_q6v5_wcss.c       | 25 +++-----
>  drivers/remoteproc/qcom_wcnss.c           | 23 +++----
>  drivers/remoteproc/rcar_rproc.c           | 36 +++++------
>  drivers/remoteproc/st_remoteproc.c        | 41 ++++++-------
>  drivers/remoteproc/stm32_rproc.c          | 44 ++++++-------
>  drivers/remoteproc/ti_k3_common.c         | 28 ++++-----
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 +-
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  2 +-
>  drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++---------
>  14 files changed, 204 insertions(+), 320 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 94af77baa7a1..a5b7cbb8fe07 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -625,26 +625,20 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
>  
>  static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
>  {
> -	struct reserved_mem *rmem = NULL;
> -	struct device_node *node;
> -
> -	node = of_parse_phandle(adsp->dev->of_node, "memory-region", 0);
> -	if (node)
> -		rmem = of_reserved_mem_lookup(node);
> -	of_node_put(node);
> +	int ret;
> +	struct resource res;
>  
> -	if (!rmem) {
> +	ret = of_reserved_mem_region_to_resource(adsp->dev->of_node, 0, &res);
> +	if (!ret) {
>  		dev_err(adsp->dev, "unable to resolve memory-region\n");
> -		return -EINVAL;
> +		return ret;

This looks strange. Shouldn't it be `if (ret) {` ?

>  	}
>  
> -	adsp->mem_phys = adsp->mem_reloc = rmem->base;
> -	adsp->mem_size = rmem->size;
> -	adsp->mem_region = devm_ioremap_wc(adsp->dev,
> -				adsp->mem_phys, adsp->mem_size);
> +	adsp->mem_phys = adsp->mem_reloc = res.start;
> +	adsp->mem_size = resource_size(&res);
> +	adsp->mem_region = devm_ioremap_resource_wc(adsp->dev, &res);
>  	if (!adsp->mem_region) {
> -		dev_err(adsp->dev, "unable to map memory region: %pa+%zx\n",
> -			&rmem->base, adsp->mem_size);
> +		dev_err(adsp->dev, "unable to map memory region: %pR\n", &res);
>  		return -EBUSY;
>  	}
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 0c0199fb0e68..0fea5f91dd1c 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1961,8 +1961,8 @@ static int q6v5_init_reset(struct q6v5 *qproc)
>  static int q6v5_alloc_memory_region(struct q6v5 *qproc)
>  {
>  	struct device_node *child;
> -	struct reserved_mem *rmem;
> -	struct device_node *node;
> +	struct resource res;
> +	int ret;
>  
>  	/*
>  	 * In the absence of mba/mpss sub-child, extract the mba and mpss
> @@ -1970,71 +1970,49 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
>  	 */
>  	child = of_get_child_by_name(qproc->dev->of_node, "mba");
>  	if (!child) {
> -		node = of_parse_phandle(qproc->dev->of_node,
> -					"memory-region", 0);
> +		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 0, &res);
>  	} else {
> -		node = of_parse_phandle(child, "memory-region", 0);
> +		ret = of_reserved_mem_region_to_resource(child, 0, &res);
>  		of_node_put(child);
>  	}
>  
> -	if (!node) {
> -		dev_err(qproc->dev, "no mba memory-region specified\n");
> -		return -EINVAL;
> -	}
> -
> -	rmem = of_reserved_mem_lookup(node);
> -	of_node_put(node);
> -	if (!rmem) {
> +	if (ret) {
>  		dev_err(qproc->dev, "unable to resolve mba region\n");
> -		return -EINVAL;
> +		return ret;
>  	}
>  
> -	qproc->mba_phys = rmem->base;
> -	qproc->mba_size = rmem->size;
> +	qproc->mba_phys = res.start;
> +	qproc->mba_size = resource_size(&res);
>  
>  	if (!child) {
> -		node = of_parse_phandle(qproc->dev->of_node,
> -					"memory-region", 1);
> +		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 1, &res);
>  	} else {
>  		child = of_get_child_by_name(qproc->dev->of_node, "mpss");
> -		node = of_parse_phandle(child, "memory-region", 0);
> +		ret = of_reserved_mem_region_to_resource(child, 0, &res);
>  		of_node_put(child);
>  	}
>  
> -	if (!node) {
> -		dev_err(qproc->dev, "no mpss memory-region specified\n");
> -		return -EINVAL;
> -	}
> -
> -	rmem = of_reserved_mem_lookup(node);
> -	of_node_put(node);
> -	if (!rmem) {
> +	if (ret) {
>  		dev_err(qproc->dev, "unable to resolve mpss region\n");
> -		return -EINVAL;
> +		return ret;
>  	}
>  
> -	qproc->mpss_phys = qproc->mpss_reloc = rmem->base;
> -	qproc->mpss_size = rmem->size;
> +	qproc->mpss_phys = qproc->mpss_reloc = res.start;
> +	qproc->mpss_size = resource_size(&res);
>  
>  	if (!child) {
> -		node = of_parse_phandle(qproc->dev->of_node, "memory-region", 2);
> +		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 2, &res);
>  	} else {
>  		child = of_get_child_by_name(qproc->dev->of_node, "metadata");
> -		node = of_parse_phandle(child, "memory-region", 0);
> +		ret = of_reserved_mem_region_to_resource(child, 0, &res);
>  		of_node_put(child);
>  	}
>  
> -	if (!node)
> +	if (ret)
>  		return 0;

Shouldn't we differentiate between an absent region (OK) and an error
during parse.

>  
> -	rmem = of_reserved_mem_lookup(node);
> -	if (!rmem) {
> -		dev_err(qproc->dev, "unable to resolve metadata region\n");
> -		return -EINVAL;
> -	}
> -
> -	qproc->mdata_phys = rmem->base;
> -	qproc->mdata_size = rmem->size;
> +	qproc->mdata_phys = res.start;
> +	qproc->mdata_size = resource_size(&res);
>  
>  	return 0;
>  }
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 02e29171cbbe..b3f7209289a6 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -121,7 +121,7 @@ struct qcom_pas {
>  
>  static void qcom_pas_segment_dump(struct rproc *rproc,
>  				  struct rproc_dump_segment *segment,
> -				  void *dest, size_t offset, size_t size)
> +		       void *dest, size_t offset, size_t size)

Irrelevant? (and two next chunks)

>  {
>  	struct qcom_pas *pas = rproc->priv;
>  	int total_offset;
> @@ -149,7 +149,7 @@ static void qcom_pas_minidump(struct rproc *rproc)
>  }
>  
>  static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
> -			       size_t pd_count)
> +			   size_t pd_count)
>  {
>  	int ret;
>  	int i;
> @@ -176,7 +176,7 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
>  };
>  
>  static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
> -				 size_t pd_count)
> +			     size_t pd_count)
>  {
>  	int i;
>  

-- 
With best wishes
Dmitry
