Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277EBEEC0
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 02:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773196100; cv=none; b=UpPWuBU0rKqbBqgL9RXx7bYjwnKR+VKpZX2UtjtrFwMwSuTkWpNEioLthvV41YN1eqF6G/+6AWnXImT1hG31vGvwkq9ZlmFam6/276ukimL7SpMF29Fn+wLWpTAya+cSfF/cmqXT225c4sulGJwsqEPmyTX1rplScENnLYvkjPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773196100; c=relaxed/simple;
	bh=Kw6LKRAG2yS5sgiDeejR1J4fpJpKpgk/u0nGqu2U27A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6W1xnUQ0sKLB56s5Vj/sspBE8gvOeI0IPyqiQx8aF21UoxxlEvz5XJ9cU7aOQq9afPyxs7WEdDJWi5UREbe/zc9Nd9ERdCl7lwX1JtkjUZb0NX66NjHJiikA3leOqcxztSi5mxy6glitMBWOQdoMt7qFKzYBNDWmxtrSSW+5fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8e4g8c7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iiHNBHc8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e8e4g8c7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iiHNBHc8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIv8x33892673
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 02:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bcqIIKnbM4pp+/Suf7ePgOSz
	y1IvjMkVNQmPWAXad0M=; b=e8e4g8c7l9ypq0bXbfgHu+C9HJKbE/7EH22SHcqD
	aqF4g/bfLlWO9aRgain9n7VOg+1AoD7JQjB50h4UC43wAGzzQJjx6pFauZL7IS35
	OBHUZfxyFcoDBAQjpUzryEKJX3NK24RzWjViiOmAlP7xZRMsXGnumXq/lVUaegNy
	hA5BXm6q29uWXm3NIE+HzkmgsHnDnzpBXfvtXX49Bx7gS7qy8nWMghLQaGGPvIzb
	ZYpOv3E+5W7s/xzfh0Vwn7d6B8J1jpup5TtG7ArRGnFPXU6oz5tfoOl1AaOCcpxr
	wnMIU3Ch1yq8WzCpLgaeAZQNXU/lSm9fdENwcpNwOA5wIQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmytr6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 02:28:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5092135f2e9so104561131cf.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 19:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773196096; x=1773800896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bcqIIKnbM4pp+/Suf7ePgOSzy1IvjMkVNQmPWAXad0M=;
        b=iiHNBHc88qxJr6xbsYMAoDdeB1ekozT/T6fJiXH7ItImPlOQH6qrBODYs2j/Qj47Mi
         EXZjVn+A4PTOPS9BPuPhL1qsWlSoF5zFfzoJv31PDCFqRLLvA/KxB4yALRWWAdJXmoFu
         53LtfM6gIh5a6bo/Jo0xJT+oHejVpBZLsKc7PxOSRPb1tPlpfBgzLn6b5kBmy7pUz4jZ
         X7gfYSKASx5rkyDHSrxdUQ6aoNx5pTMaBkw5G+dJ9Pn8GQa6Uc9cj4CiIq9rsyrw8Qrl
         M1UkkzawNrB8XX9vOw7z1qHRU5Ttkl3ZCSu7mhXIO0eqqHwE2xzeyWVJHJFCxr5YkBfe
         zYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773196096; x=1773800896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcqIIKnbM4pp+/Suf7ePgOSzy1IvjMkVNQmPWAXad0M=;
        b=DijPLeDudtUgNl/cVb02QNAWF1TDTk6KM2Ru/kUJ2rSTtrFJt0YEaQsbGLZSdHRHgX
         vCStg3a/gJTt0cTxTfRBNMEczCIkqDEOdFAKMgs2WNhstv7G7a8D4U2EQsxfCGiQPBuU
         2d/pmsqR9EwVVlThtxKZHUbLhR3COvPSn5Qbmc/5UNK5o1/Fz0AMg0FNQqnSa0p54sMi
         DHQkcOtr/B6dkTlL1F/7PACpBscdKg50bzqlAKIXYsEhLfR71Gw8xowRG3qdA95P0yNJ
         HxJ6VVo2A8EvFWJ6j1wr9hrrhLLxflHVRytllnKL5L2OnQMi0DC5qyKAdoJBYgTu6Ui/
         uGmw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7IWUkl/+dsmHlmFIjpIYJ5OBkcYk9Mv3Im/WXR/KnW/lV+7z91dYsKTpZz7e17cIjOT9XbI9XaVWbeiIFfZd@vger.kernel.org
X-Gm-Message-State: AOJu0YzEpOs/JRLfGFM8btIrw9LFBZUY0UEd4Deg7scLE6co2L7sYFda
	+koozh5gaJnBFiaXw+8zfN6ZXqg6sCv1B8nGqgbpmctqpxgMhHgpdZGlP6GLCjLVQv0VO9JUIez
	t7pokQuApLxvroyF3JUY2M7LUKfNIfkH3v8xJ2PPZ9424Gs6ANK+wnOpngfR//gSOqtmWPBOg
X-Gm-Gg: ATEYQzxzrRj5Vd0RT7YAN6DY/2DOL0Vuat7FcOXdhHFE1Cr5uzGQK6h3Z7E7ao5b29P
	JWQgT1zJWUQh+NDdVq62Pp0Gy2h9Hrat2nazBa8g132Q58l3rOj7itR82WRoHHLUFiWlDh+5jdd
	VtKkO3vQVjbwUMogD64FaStz4aEpGUP4FLxXPreRy156hnoU7lvU/92IcP/BoDVu7nzZS7e34vF
	snyGEkkQZrpuDslnKDuNrCSZz/uy6F4CideG8n9qKe03/rqgJA+HONJRkhUC9iJIvEEVtk1Ze8k
	UyFP1Au+ecJR5BV/SPYr7oxqXwkE2Pi2EFSIJrCj+pWQhyK2NX25rLuzvpCD8OFWTVxQuhh4Hiv
	0cdGQlcp0GniomAhFo6MEYfWaoyZwww1AsRG28N6yWvJ0NdMNKmLS+vVymSxFvubfux7EI6moy2
	ny0/KvnlVlCPdEu4jwCTnlQQweq81MYa6un1w=
X-Received: by 2002:a05:622a:1788:b0:509:1ece:5ad5 with SMTP id d75a77b69052e-5093a14da00mr12089241cf.38.1773196096363;
        Tue, 10 Mar 2026 19:28:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1788:b0:509:1ece:5ad5 with SMTP id d75a77b69052e-5093a14da00mr12089091cf.38.1773196095943;
        Tue, 10 Mar 2026 19:28:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636227asm150523e87.68.2026.03.10.19.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:28:13 -0700 (PDT)
Date: Wed, 11 Mar 2026 04:28:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom: pas: Fix the dtb PAS context
 creation
Message-ID: <sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl>
References: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b0d341 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yX1kTwPMbAsOcxosyjEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 14YsCu8wMJqFa54fAVhjOtSxVr56vPOA
X-Proofpoint-ORIG-GUID: 14YsCu8wMJqFa54fAVhjOtSxVr56vPOA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAxOSBTYWx0ZWRfX6MGvPMfi8Wy/
 ZKnkzx02tme3+3DNrR66e8f4WdERow+h7wFeL4oDVecug6eu360t61ymQ3j38XHVnvzH6+uX7f8
 8e/GOlGuz/zYAfsCoXjdWctMPt8i9t2RbrVPX1KjgwZOA4EollZY1/x/ttXoEinfLbF1STiGmVw
 AVNhZdbi0MJAyKxmBUWOg9IT8yJXAJszMGFhy6b7rGypDlhTA80Vb8NvEClFqvTxzXH2NBDCsOC
 c9T+jxVso1blT2dumoz9x4/LxxARTAZArf+kCuj4G4p/HKmQISH2zz9A/fOCg+9eMg+No1vKReF
 Ow4MPQcXxYi//G8MIIKgA1y9+ItXF3U/p2mkpHVY3cClY0EkYTkPa0wG0T980D6ptu/j3ziJKR5
 BdrqpetsaRBNR2IZzKRIGDdPFs6bw6wZRF49eXmXyqybLSry0diBgcx0yXAJgTqDDqRfwEjUb4b
 AGAyotZBZvU+W8ANWxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110019

On Tue, Mar 10, 2026 at 07:22:04PM +0530, Mukesh Ojha wrote:
> DTB PAS context creation should be done only for subsystems that support
> a DTB firmware binary; otherwise, memory is wasted. Move the context
> creation to the appropriate location and, while at it, fix the place
> where the DTB PAS context was being released unconditionally.

I think here you have too much for this description. Judging by the
text, I'd have assumed only the if(pas->dtb_pas_id) around the DTB
context creation.

> 
> Fixes: b13d8baf5601 ("remoteproc: pas: Replace metadata context with PAS context structure")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 36 +++++++++++++++---------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 46204da046fa..3bde37ac510c 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -250,7 +250,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  
>  release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> +	if (pas->dtb_pas_id)
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);

Unrelated question, but why is this not handled by devres action?

> +
>  	release_firmware(pas->dtb_firmware);
>  
>  	return ret;
> @@ -623,6 +625,7 @@ static void qcom_pas_pds_detach(struct qcom_pas *pas, struct device **pds, size_
>  
>  static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  {
> +	struct rproc *rproc = pas->rproc;
>  	struct resource res;
>  	int ret;
>  
> @@ -640,6 +643,12 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  		return PTR_ERR(pas->mem_region);
>  	}
>  
> +	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
> +						       pas->mem_phys, pas->mem_size);
> +	if (IS_ERR(pas->pas_ctx))
> +		return PTR_ERR(pas->pas_ctx);
> +
> +	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>  	if (!pas->dtb_pas_id)
>  		return 0;
>  
> @@ -657,6 +666,14 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  		return PTR_ERR(pas->dtb_mem_region);
>  	}
>  
> +	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
> +							   pas->dtb_mem_phys,
> +							   pas->dtb_mem_size);
> +	if (IS_ERR(pas->dtb_pas_ctx))
> +		return PTR_ERR(pas->dtb_pas_ctx);
> +
> +	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +
>  	return 0;
>  }
>  
> @@ -838,23 +855,6 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  
>  	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
>  
> -	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
> -						       pas->mem_phys, pas->mem_size);
> -	if (IS_ERR(pas->pas_ctx)) {
> -		ret = PTR_ERR(pas->pas_ctx);
> -		goto remove_ssr_sysmon;
> -	}
> -
> -	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
> -							   pas->dtb_mem_phys,
> -							   pas->dtb_mem_size);
> -	if (IS_ERR(pas->dtb_pas_ctx)) {
> -		ret = PTR_ERR(pas->dtb_pas_ctx);
> -		goto remove_ssr_sysmon;
> -	}
> -
> -	pas->pas_ctx->use_tzmem = rproc->has_iommu;
> -	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
>  	ret = rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
