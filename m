Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA482C031E
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675378; cv=none; b=fSgRmH13U3ZQJ5QsufRUjgV5YY6Z969GLC4muubqiWqy0Z2/rkLzO1e8gRGA/DWBvXLa4Yof2zj4E0XQXgnaL5o28SsjHQnR+/uXHirnki+5ukbV2qlmVujR0fN3Z64OaU+n91TzY6qka2Zms6JuBof9lPqWCJn9dcJxTSyENyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675378; c=relaxed/simple;
	bh=YBwGSs+7ZZ0K6mJgU+W25OaURZhQh89G134yJWvXDB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4M/zsrRWNkz16VTFLWH2ll0XDRqHHPbUqjH2CQ1JqahstvK9S5Z9tgvEYoLLdc7HW44F50Y7ux0ODrLFo0XiNZE41vZnAmNkNBH8Bsazd8Qq/X3LqOy/0HRb5zOOSz/7wZTloUXmXdeopUukxoCcjXkVewmswM8CcvWTeb4Ei8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOHij19A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFt6BlKA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IOHij19A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFt6BlKA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GDoLUd041580
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 15:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GvC3fAmcmTm/zGXzFlh6tcG7
	0YP1CTrqTNniTWqO2ww=; b=IOHij19A/NMyGmo/XaqSaOUeNloZCRDYPOcwOpzN
	EbYhurv6qyxwsPt+ib2wmUgSEDiF3TOszI9QT8BPKZ3OYe+89rbS4Xt8VuQFpV9V
	FV5u1lrmRC4+O9bzA+a7R3CUxKXbhyvvu5IynDHXwpNzfDvKjmk2n9OL9XTtRccf
	Iv38S+qezSv40EV7H+V/8GjG+hSbUmGUONbGBdQh9VNsW4U8vx0TxByHwm43ypKL
	VKVhO3n8EeWNLaILXK9lSwoBN5oRI0PuPIwUvpuH8YxWAs/p85S68vmuv9qn7wdd
	3Wwh9tSiMZ1faQjFBA/uiD1RKLG5a8I1HxVPFvnDnrWNAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt81srh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 15:36:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b051befbb8so19190275ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Mar 2026 08:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773675375; x=1774280175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GvC3fAmcmTm/zGXzFlh6tcG70YP1CTrqTNniTWqO2ww=;
        b=iFt6BlKAlGvBMfKAvYdjY8EK+Uh2rCeU2spZM0wgWRWdI5eUC4DlYLCBO5eLNA0T20
         IX2ijm+NYrXM7cjRaLfi5ky6aQ0sEaUkVUi+h0vdA23PDRqvf8dXv2RW0ATakPgmCjwh
         xbQsvjHoPKOR2dPkkALR2h/tHQ/9KhspdKzG6h9HoI7m4QPkBg08MfO8QKsarqcz7Cq9
         8utaq21y2nd0Wg2Ky8T5GgzuIWqmow6z3kAFQxdca0rqHTRC2tvwnnGOSuhhHc9y/hlf
         Hx6314sS1gpUkIKMThMLdKo0mUe3muU6yDgCrvaQ8JKH5bcgzUCaZjH8If5FzMbojcRK
         Uimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773675375; x=1774280175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvC3fAmcmTm/zGXzFlh6tcG70YP1CTrqTNniTWqO2ww=;
        b=FxLEaKu0XdqtRPW5Rv1ETqU6IILFFqURbwkeCXy/TU5sIl73v9n6tgm4JrGUt+J3f1
         vd6eey7RYBo4aEEsnZDBUgE1AfG/HxYdnTyxEfgkSYuC/bYfLWGl/EM8EUugXVumpaEG
         pCNSLxZyFf1ERqWvWWQ5y17T/tpvbwZlu+UkRvX6A2lZXjTha1jafXUbiQGDE9tN3uuN
         IV6t4cPzPuK7UjYk+9vChrybCQso9CdgPvL+f+klUzIegjeP2HrzZOAgaaEY/lTvGme4
         RuKNRBkaej892Hg/6aILXBhVfl8ISAyzRmMcGP1f0bFbk7x5l1hohy9xTRfFdIkrfIo+
         c3WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlwVXclE+5vqfortQPTA6vIITJ7zrxl4Wc6gaFyd7CL5b9i2sv2id2HOGDRfASGSovCyDLAt9ExhLNLrha3Ect@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6HNt2ExqwVM3cmK8LSRPuwObFLHalwyz3poNmoTrlscRY4iyw
	ebLxzpZC4ZNle8hVNSWlOSIkKUr7Y5wCVWtl68Gzk/yQ469t+acJa3fvz3gBa2yFf+cvDyIFe7e
	ZZm1bISRytFG1IhX6qeArk2kTteaBVjAdD4mKG7OcOacodHrCZFAGFDu+pAeHmhwzk35XGnDT
X-Gm-Gg: ATEYQzxbjYE0rCtqvNCs6rgC3k6tRRtem1xsmp/JWdXfey0LRE0w22TTQgNIl5JHop9
	Jc2dLI1gs9IZJtjcqdgtAh/Qb1j50aRDNldQtAxikp1R0ncHNgUPptkV4TV6nPLS3Ncb4PijFL5
	HQDiYEUt1CFFZJDm4CtMd/5N4o05bItCShtHMPcGnDs66GN/BzTZLb+gKXSwL7btQPZbj6+qEjs
	u7mreZsTjY96OpXo/kyTaO58PPi94nnqwkNqM6dcEno/rF6GlvwVwD+joWul+zoTVqnFozF4/EP
	LCxlARPxz2KgxGQF6eNFhzIjjU6wj+lhPLpQP6WwrPIzZEyV1ii+tyNolS+NmSGQ3bcpvnvgdKy
	JzH7DtYy4muDGl8B2UDgGRNxvtGkshaIL8lfIEbZYvwfXN7C3
X-Received: by 2002:a17:903:987:b0:2b0:531b:b3d7 with SMTP id d9443c01a7336-2b0531bb59amr48913245ad.51.1773675374691;
        Mon, 16 Mar 2026 08:36:14 -0700 (PDT)
X-Received: by 2002:a17:903:987:b0:2b0:531b:b3d7 with SMTP id d9443c01a7336-2b0531bb59amr48912945ad.51.1773675374052;
        Mon, 16 Mar 2026 08:36:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7edd1fsm144517635ad.47.2026.03.16.08.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:36:13 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:06:07 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>, kernel@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: Fix leak when custom dump_segments
 addition fails
Message-ID: <20260316153607.sb6nuq5egaxr4hb5@hu-mojha-hyd.qualcomm.com>
References: <20260316-rproc-memleak-v1-1-96b1518a1a61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-rproc-memleak-v1-1-96b1518a1a61@oss.qualcomm.com>
X-Proofpoint-GUID: bLk6_056EVL-uLqCGxnCToYEck4YDs_s
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b8236f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=h6w44uCbTxVKzR4zt9gA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: bLk6_056EVL-uLqCGxnCToYEck4YDs_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDExOCBTYWx0ZWRfX/oQvrpVyxp6m
 /zeBe9F44XAXiOkNhP29pVtmsYvUZPLiDIg5Z7vPo09lw0yHqYPSTaEDGK4Fs9DZ0U0bDew3PAd
 mxoRG0mlFoSXxidwetO+UY9nAGnFxTvkTmtRuSE+wRSWcnXD/opyopawxRclfUqctluo/XMOPac
 +Cp7J35JjlydTDx4yauqqI/OsSXmtgHl0hwh5i6Ck6Wyhveleqk0Xac23ylr3u+f4l5ta+WS6ly
 TIh+vn3kMCkAjwZAOwNUxLu+V4z6CaVb2k9riimdZg+4Ak/J6WqEDuEA9Brp/xHdZk+5pYJuoVf
 5bi0vJxSgxPSJ6sSov2BPmNADD7pJxHuoa27noZdsTBtEvdiwIolk5PM/QolJaRyPR6nhSlGP2C
 yrhv53/sMMZxQn1pm3qQeHoC9n5p2Wsgo+PuauU9iGezZDZsK+ZyryG2q18DfpjMY/qQmzuEfoF
 fBak+RYiDTe5z1+1VlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160118

On Mon, Mar 16, 2026 at 05:57:54PM +0530, Wasim Nazir wrote:
> Free allocated minidump_region 'name' in qcom_add_minidump_segments()
> when failing before adding the region to 'dump_segments'. Otherwise,
> the 'name' is not tracked and is never freed by qcom_minidump_cleanup().
> 
> Return error when adding to 'dump_segments' fails.
> 
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>

This should have fixes tag and cc to stable mailing list.

With above changes

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> ---
>  drivers/remoteproc/qcom_common.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 6c31140268ac..aa93d3324561 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -110,6 +110,7 @@ static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsy
>  	struct minidump_region __iomem *ptr;
>  	struct minidump_region region;
>  	int seg_cnt, i;
> +	int ret = 0;
>  	dma_addr_t da;
>  	size_t size;
>  	char *name;
> @@ -130,17 +131,22 @@ static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsy
>  		if (le32_to_cpu(region.valid) == MINIDUMP_REGION_VALID) {
>  			name = kstrndup(region.name, MAX_REGION_NAME_LENGTH - 1, GFP_KERNEL);
>  			if (!name) {
> -				iounmap(ptr);
> -				return -ENOMEM;
> +				ret = -ENOMEM;
> +				break;
>  			}
>  			da = le64_to_cpu(region.address);
>  			size = le64_to_cpu(region.size);
> -			rproc_coredump_add_custom_segment(rproc, da, size, rproc_dumpfn_t, name);
> +			ret = rproc_coredump_add_custom_segment(rproc, da, size, rproc_dumpfn_t,
> +								name);
> +			if (ret) {
> +				kfree(name);
> +				break;
> +			}
>  		}
>  	}
>  
>  	iounmap(ptr);
> -	return 0;
> +	return ret;
>  }
>  
>  void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
> 
> ---
> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
> change-id: 20260316-rproc-memleak-367ef8e1a64b
> 
> Best regards,
> -- 
> Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> 

-- 
-Mukesh Ojha
