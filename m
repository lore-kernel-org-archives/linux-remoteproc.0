Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C96283FC5
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 02:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773196502; cv=none; b=KpzJfSS9aSKR2Km/1MjGCNIdtm1zgnEKjVlmWZPOqpEhMImOHRJj3MHc0j4q0wAwp/qrT/6wCmXy6rr/P00jzDKO5PQfEuBRFchYSNzzRrIYRe3HmtUxg1KSGLTRzcYNe4Bj6JkalWU/5upzxS8XzMeP2aUzF/trDKng1uX1VF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773196502; c=relaxed/simple;
	bh=IIZqTQcL4X/cyKDLmxcypw9UUU/C6N/ePHEeabBccOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6Ew19BRmcDIJ3CNN+Pgn2/qIAs/eAPyALGaPZbgKV+U3FDnBgj11dXUhK7KEztfSx1BkhZikO0giROAF5EdDNLysyUfk8TuoZgO2pn6PbtELhquqgguZlWlPQdxAMjfRUKubcj1N8tXOCkfBB3iRTWGSjbc7O1MpCHLx9llKjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpkI3nUB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzW8lEKl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpkI3nUB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XzW8lEKl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AInfga3417140
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 02:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Duh83dMypDVZuM0q5i8B5E7U
	VpsRagPVm6p1//Bq9YY=; b=RpkI3nUBt8jkLGWPIjNqD21aEdutjs5ep9khVEqs
	j5wPmZ2ICqQOMj/5bJh2KPyphGkrEyTSsR422mNHubHaiFBTMWQXlNPFvdlgrBWX
	Shns09s3si/uqQBzrC2Zj1UZvJbMyqQghsn7YJcl1PwEDsG6SWbS8Vzg3fa91Gso
	saxQYfJPUNgY6XA4TjGSEf8Br1kb1JK+iG3nIyobKlO9dBDXEgZixTQXKWFqMSA9
	m5FqiZBNUHBSROa5vW1XCZfL9hvegi5gXLuayMFw2dVxf/qKrW65CmL2wC6imBNm
	Y3dz1fMXMUDGxGq8KO3y74/0DVYnLEbcXcozRiLJrbtMlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2b1pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 02:34:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd76ff19d5so2063592685a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 19:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773196498; x=1773801298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Duh83dMypDVZuM0q5i8B5E7UVpsRagPVm6p1//Bq9YY=;
        b=XzW8lEKlihkS43G1fDWT3ikXkCHTnk/qTAJPg2Fqe4fn/2vMq8QK0Ys/HZgAgdEf0S
         I4f6y3dydHh/6vuwBFMJ8+atwRkE0HvL7ab2Gl17FTBtgRcoFU/Ml3iiYHUI8kclfqb2
         InYYbN47SJ178IOfjK6P8puWRcDfjpc93rnQ7VhuzxCyeyzxbeZjIglOhszOFNU+PdOx
         L1wpi8Nro8oY0QIdHboBt91QLf3aWJ7NDGCoZ5neppsrLMkjvYvZbx1yazWSgDAzn1mK
         SiUI12u+O7Tr3oDyt/5tH5IeTL1wCW+p5JJuXbEGz2Y7q8xHYPvC6mt3Ul9pxOyZrkvb
         FdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773196498; x=1773801298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Duh83dMypDVZuM0q5i8B5E7UVpsRagPVm6p1//Bq9YY=;
        b=YDyWYR5boNKVfhcAiftE/jBzjm3bS9cHr2ugeHeQGyEG1gJyqhcP6y7Pvj/+PnDz4V
         lV46V9sqokAt8bIlX6r1Lcjow9iImM8hg3Wco03bxEmQp/jaD4WoNHgG9Z0VazNqCtOW
         rtbi4CP8E15lcfuGTmAaxciOlHTjLlkmo0v8C1hU029ScuYki9z+w/m8fZBEO9qFpXwo
         kiXCYj+kq73prK94C8ggB+97Dm+HGy0sQ/E7sVz50Z+5cBZ3ivqbd1wpq0j35/qJs1z0
         QLrtoo6sdHVfNqsYV7R85g0p3fzjMn7xpVIx2wsEppfdBwA9dnqPVp7ygRDt1FETgDxk
         VHXA==
X-Forwarded-Encrypted: i=1; AJvYcCVnyGEUaHD/7wQisATeKSDEW5PkPdtMeVdNrDnUObbtCNJE0dvP2FdMYmRf3Du2/TqIEnL9Dprp+IwnZi+YgtuA@vger.kernel.org
X-Gm-Message-State: AOJu0YwUSIuuSOwOVF9EteJ6oyByZ6dAX0pDUgNUDef69a7/Ed0NRmWW
	I7iFlLwfSsP7CufLaUeHwLT5GbNxxPlKmI6zcwF8P3XgGoPhR6+lE82VNnl9DD0xmMLFiCZ81QE
	PZlEIE7Wor7pxdyx/hHmcCCezzbqtHX+od5GvJWqb777bWVLvxctrwWb9L/wdI4/ZR360Nx4F
X-Gm-Gg: ATEYQzxAaDyzAKFRoqu319uIKbk+UC3P/oZJCCspTr0rRP7mGXAujPZBNyg/nNGe2Cc
	sXvcyo0TScICLvsnVRo3tYIMDq1cYQINIiNI81nTxSqr+WgDD0ntZG3EONPwrFydbLNhuXwThMQ
	DA+LRHRYQx+XKO8dtMGkjSYW6KhEk42WzlWxSndUnwkOdJuMHAc/6+/UMXNIm3fTGWr+6pBsSjK
	9SnB5YSqvl37pQ07rEdoR9JjmK8wwcNa7GjP4PPc6ve1yIu+/ERLaBbrsadpYKxQQgcGx9al79g
	WElnTciRcksK1nXSe7NOC8q0YWdUYLIJ/nxMRC/gkMKWuxCmZjtpCQ4IQYxRHUyoDcXhWV891kd
	6UWJpU0M5ceOgICqGLMNrVFImXJwR+v5oVjpNH3ifMVClNYry/8e+RbsNKnOgX9k+8rFdDkuHYr
	PLmJPBJg5YWH8H8eg8w8fHE0K764pcKGVBNik=
X-Received: by 2002:a05:620a:d8c:b0:8cd:79f2:dc3d with SMTP id af79cd13be357-8cda19f812bmr149840885a.26.1773196498382;
        Tue, 10 Mar 2026 19:34:58 -0700 (PDT)
X-Received: by 2002:a05:620a:d8c:b0:8cd:79f2:dc3d with SMTP id af79cd13be357-8cda19f812bmr149839085a.26.1773196497953;
        Tue, 10 Mar 2026 19:34:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156375198sm148928e87.88.2026.03.10.19.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:34:56 -0700 (PDT)
Date: Wed, 11 Mar 2026 04:34:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
Message-ID: <uwqpxa4jqf3k3pbcf7mkszzuhrqulich4iujiejtuey4vrtg5d@umlik2vhdkvi>
References: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
 <20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b0d4d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=40xxhJ42kpy9pFQAWpcA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: U-hx6p-ktpONqWyl9iPszW_i_yFH9eMw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyMCBTYWx0ZWRfX/hsceUsMyIlt
 npxdMrGVegZ8XXQQ1NfxhbI1SVSfJ/lD03apWCsHigI5JFBS84CB5mqSyzEKySE4WisiwgmXb5P
 nML6HR+Z1fBC3bi4B423sqaa4JzLErz/j/civ5Hp4cdE7fX2KsslxZvQhQAXXdCN5TGlqKMtv9S
 LPVGT2vAxUTxF6hgJZSKxSa0Q6fAMdwhqgE7l0DQ/fz7xTD3JoJtWs5wZVqfKv6F/szW0VA+K5J
 QLq57Bzy5sPa4LQG0V+/gRzTllwyDWXNnL3f/O+7YUfG413ADZAKibj5AzqgGfvh6LBsQNe4Gw+
 KSHuSSkuFEJhvDf//ewXsRCV3Z0O8YuaFe4WeTSDpKqEZgX907zs2DLfBPvJCjyUK2qfzVJ0rxl
 tOPUaYoAV2EV5zfrQkzhF6xrveVZy1g+ZPFDkDsq4iHWRr+TT+yPW4CAexI+yrCN49oTnNDVNYV
 5p5GiqiSMYjhFWCbHFQ==
X-Proofpoint-GUID: U-hx6p-ktpONqWyl9iPszW_i_yFH9eMw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110020

On Tue, Mar 10, 2026 at 07:22:05PM +0530, Mukesh Ojha wrote:
> Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
> Peripheral Authentication Service (PAS), always map the MBA region before
> use and unmap it once the usage is complete. This behavior was introduced
> to avoid issues seen in the past where speculative accesses from the
> application processor to the MBA region after it was assigned to the remote
> Q6 led to an XPU violation. The issue was mitigated by unmapping the region
> before handing control to the remote Q6.
> 
> Currently, most Qualcomm SoCs using the PAS driver run either with a
> standalone QHEE or the Gunyah hypervisor. In these environments, the
> hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
> Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
> reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
> violations cannot occur.
> 
> However, when the same SoC runs Linux at EL2, Linux itself must perform the
> unmapping to avoid such issues. It is still correct to apply this mapping/
> unmapping sequence even for SoCs that run under Gunyah, so this behavior
> should not be conditional.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 48 +++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 3bde37ac510c..033d618ccba9 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -138,6 +138,13 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
>  		return;
>  	}
>  
> +	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);

Which will be called once per segment. Move this to qcom_pas_minidump()
and call iounmap() afterwards.

> +	if (!pas->mem_region) {
> +		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
> +			&pas->mem_phys, pas->mem_size);
> +		return;
> +	}
> +
>  	memcpy_fromio(dest, pas->mem_region + total_offset, size);
>  }
>  
> @@ -240,9 +247,18 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  			return ret;
>  		}
>  
> +		pas->dtb_mem_region = ioremap_wc(pas->dtb_mem_phys, pas->dtb_mem_size);
> +		if (!pas->dtb_mem_region) {
> +			dev_err(pas->dev, "unable to map dtb memory region: %pa+%zx\n",
> +				&pas->dtb_mem_phys, pas->dtb_mem_size);
> +			goto release_dtb_metadata;
> +		}
> +
>  		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
>  					pas->dtb_firmware_name, pas->dtb_mem_region,
>  					&pas->dtb_mem_reloc);
> +		iounmap(pas->dtb_mem_region);
> +		pas->dtb_mem_region = NULL;
>  		if (ret)
>  			goto release_dtb_metadata;
>  	}
> @@ -320,8 +336,23 @@ static int qcom_pas_start(struct rproc *rproc)
>  		}
>  	}
>  
> +	/*
> +	 * During subsystem restart, when coredump is enabled, region is mapped but
> +	 * not unmapped there, NULL check to reuse the mapping if its already mapped.

Why? Just unmap it there,

> +	 */
> +	if (!pas->mem_region) {
> +		pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
> +		if (!pas->mem_region) {
> +			dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
> +				&pas->mem_phys, pas->mem_size);
> +			goto release_pas_metadata;
> +		}
> +	}
> +
>  	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
>  				pas->mem_region, &pas->mem_reloc);

Would it be easier to move ioremap_wc() / iounmap() to
qcom_mdt_pas_load()?

> +	iounmap(pas->mem_region);
> +	pas->mem_region = NULL;
>  	if (ret)
>  		goto release_pas_metadata;
>  
> @@ -447,6 +478,13 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
>  	if (is_iomem)
>  		*is_iomem = true;
>  
> +	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
> +	if (!pas->mem_region) {
> +		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
> +			&pas->mem_phys, pas->mem_size);
> +		return NULL;
> +	}
> +
>  	return pas->mem_region + offset;
>  }
>  
> @@ -637,11 +675,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  
>  	pas->mem_phys = pas->mem_reloc = res.start;
>  	pas->mem_size = resource_size(&res);
> -	pas->mem_region = devm_ioremap_resource_wc(pas->dev, &res);
> -	if (IS_ERR(pas->mem_region)) {
> -		dev_err(pas->dev, "unable to map memory region: %pR\n", &res);
> -		return PTR_ERR(pas->mem_region);
> -	}
>  
>  	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
>  						       pas->mem_phys, pas->mem_size);
> @@ -660,11 +693,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  
>  	pas->dtb_mem_phys = pas->dtb_mem_reloc = res.start;
>  	pas->dtb_mem_size = resource_size(&res);
> -	pas->dtb_mem_region = devm_ioremap_resource_wc(pas->dev, &res);
> -	if (IS_ERR(pas->dtb_mem_region)) {
> -		dev_err(pas->dev, "unable to map dtb memory region: %pR\n", &res);
> -		return PTR_ERR(pas->dtb_mem_region);
> -	}
>  
>  	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
>  							   pas->dtb_mem_phys,
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
