Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7532DC792
	for <linux-remoteproc@vger.kernel.org>; Sun, 29 Mar 2026 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781485; cv=none; b=Nvc1EhVeRei26r+1qUhCe8g70r8Bj1X7bUp1drHbBECOfL2OBy5Mrpx5hVT62lrWexZmt80A/NTkkYaQlT+JDDnj+jKCYh7GdtaFm7kV/bojmBOcV38woHW362PZQ3CMD4uUu1i4drlFghejfDj0CotBo9HmOHsWRDPjB8D0JZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781485; c=relaxed/simple;
	bh=5Q9TIYcr463J2je76gtxrnL7bTgbqCXFXmVai7GJAeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxP4IrkcXTOK9uMZuuGZodJJ6D+DGrnXqnRwKJMArchALR2T892kNriXTD0UtVyJi7FpBXvEakq2EjZh0DrTmsI67BpBnzerIRb1IJuUirGhk28xddMCHIfSp2VDzAfEZqwQexlqafTnes72sku5+OTplKP8ZurBc2UiuuMet+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGU8gKEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1ikQhrJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IGU8gKEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1ikQhrJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhUHq2194579
	for <linux-remoteproc@vger.kernel.org>; Sun, 29 Mar 2026 10:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lD6v/4S6rAhCUZ6xQaXFYuxC
	Dmg9dn9zKc92hDRlYMk=; b=IGU8gKEIhN279cXgg5uW8bgyHcOYRxtPFuYC4OvG
	8GNryJrIpWrc6R7tOtbvFI9mSDBycg3WNKKeSovmT/I6j7VCxAqinxvgaNY/VzzK
	hT5l4bsV+t9TvvQh0cTN+lNj45m/Lb/aDpoDiioMJuCy8ZEqmcUqhOvdYfBUJ4VL
	NVXD6nslB4AU317cg2S8fJM3DrfJWY4q4pSct6SU+6JCYYcm8SH+RPeZb8AVOGR5
	AngKAH26dY5mS3sBi+Gyh7FogVeRR8VoOkjULZr77kJLCnoIQ4y1l29cM+3ykFjG
	dUhpY2Scxre1E51MBV/Yxi/mgQzonRn5mVa5GRlxM+wJvA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c0jbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 29 Mar 2026 10:51:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093b92f327so100561791cf.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 29 Mar 2026 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774781481; x=1775386281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lD6v/4S6rAhCUZ6xQaXFYuxCDmg9dn9zKc92hDRlYMk=;
        b=d1ikQhrJX68ckbke9HVBWSxTdPVKQADxA9Cf4skM1bAEP0pwIQJ7dvBzby4IrR5N8k
         DEyDdBa3hpX2ZhIlCPuqBZsvKYf/YeM6dRNTlbBKnAjN/JKELFib+/sttu69AyqAWjA3
         bqHPRzIYUJZptetwn0VYODFbzJN/PTzFOEC7+s/O4AtZIQVIf2PDi0fWaf0LRPM5+Z34
         YKuC8MZroj4iXk7jw7sK1QTD1PovQ1JLjzFjjRWPrHip09xL1DH9UqVo/GtxhAnMnoDI
         wzoU2Xjp7TuO9ex99VIEQofVTfoNGiY/NnalLZaLu+2qDcV1JBzrK4obQcRsq8CYu7O5
         QWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781481; x=1775386281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lD6v/4S6rAhCUZ6xQaXFYuxCDmg9dn9zKc92hDRlYMk=;
        b=T3Uf5/cKKkpFK04IxUTm8KpcMxAF2f6Pti60zTRQ2PsSjXkji0rBgceMzZQxGaGGjk
         MPvoMcsCv+kfujhLpxabaryoo0SiUFtNW4eQcKwCIC7FIORZcku6LVmwtWlN/pyP4dms
         bfe9nh8u46WrotefgtaxdFQDsXc6YmV6FiQYTOT5qf0Egz4SuXk3meukPvCak2t1lrG/
         sAExclWzGUWki9QyGVwjnxJ0hurtne6rOnuy0YPpZLWStQG6DCxnOBXdL71NKEak9xP1
         C/3j0gA2Be8Kjse1v4Jxn/T6MLvaxc10LPvPQliDMvhqe+gdawns6KeobYwwX9HFUV63
         O3FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqtd2+MW+adtBoOlxGKgCcJzBvVs+WQenlhMAAKLnY+0yQdsqOfSyR+2b/egdL43qk4O3nNMs/FrieRDIQUUij@vger.kernel.org
X-Gm-Message-State: AOJu0YwdJzhFgOqLBnSReOEaTs7i/3KL55/qa1MNdZ/pU5svlNXIZhCT
	5zCXbRcWYKGvfhIqFJGiyu0jRxF9UPnQOplNjyzRDphS2xx43k7qbkVY7NkEqnQWhLqFwQailVt
	CAKeM16PgFy4bSDQRe3IYjE6EHklnLSKfDQf/H7IF7xXfJ/tATIOnLkpMyRJ8zFSRRlIrx9DH
X-Gm-Gg: ATEYQzxOumx4A21t4HCOVZtDYuJBVQmwVVHzs2o9m3+tv6Sh0apBH1GsY0xpQ0KTwdW
	3xZhqDYfqHZ5lguIHMtwl9/O4ePWho/vwXTOhJNSKkJqCmk4WOzkHjRrWzFN1kK93qgH1HGYy8r
	Yr0LnL0i7Q3rgDfRmdACq7jVF/31QlYwB1JgZ0LpV4DVIaNMUJNJK7gUbb/drPpFuCTKvlxwARb
	Dnjar4KM8ZI2J5xJK90r4//m2H4g5ONQbmE2psZA2/sSL3pJQDBIiZ31RqiXBKPV9FjI+L4ItQw
	5lstXyWahYUVCt8FVjSeo3OPfNJrRKSCLYI82k4FbQeOZQEDpT2LjAX++KkNNbxUqggls096e8y
	BYwereAmtyY88FKkx/RRC3E5Xd1rp1CCuF/yyCbcSW16gBvQwtV7nWOWxQAZt3NoF+bjtkQeQ8X
	xFIOIhda1HW+dHuI+qb7S/KRoAmBrCe95gqz4=
X-Received: by 2002:a05:622a:295:b0:50b:22c2:d7ec with SMTP id d75a77b69052e-50ba398f23fmr118691661cf.59.1774781480936;
        Sun, 29 Mar 2026 03:51:20 -0700 (PDT)
X-Received: by 2002:a05:622a:295:b0:50b:22c2:d7ec with SMTP id d75a77b69052e-50ba398f23fmr118691501cf.59.1774781480550;
        Sun, 29 Mar 2026 03:51:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d463bsm9915851fa.4.2026.03.29.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:51:19 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:51:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] remoteproc: qcom: pas: Fix the dtb PAS context
 creation
Message-ID: <fcgfzcg5upqw5idgb7acayxgtrmyojtmosqbzqok2cl6dhyr36@n5oyb2rbkf3k>
References: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4MiBTYWx0ZWRfX5La2l2Tm7Ikh
 JhvqeN6P1UjkVR5Ezctewt5q5ZOLL9zQfaNi8LA/8Izpdi31zpgzSUn2xsGQQj8vkpHY/NE+wcw
 eDKqUodXPcNLoR4okMn1z+GohiDJF2lI1XiakXLArWMh53QhgfPLrfO94tsn9BTgC48CJ7ax1zF
 MHHgMilxLL+MdZxxRNpzyN3ghEWUV/EvlZ0fw10FCQcuBh4tCj0IOoQaSNqHk/tSRXVW4FXQU1x
 yMh5jRuWipX4Hdp0rlpj2XleeLgcRHZxb5Q7c5YfMnbsooMbU2E8ZuRUdN7kJmLSoBc80weywoM
 NrXgfv0WnjGPfkk3sQN5/HoSU7tdUgYsK1Ni6Av3V3eHlcWsvOXNeVv3iFI/E0hJ7uhBmawWt4M
 OG3yPmMseYKX6eRz0t+SKe2Uon819lRSvxpGk3FzfwLL13ToHnwqVuteO7HzOWjiJfQBSUM8PCQ
 aUuXpLVJkfLhmpxku7A==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69c90429 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NHyXfb6j7ZaXbkreoXwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: o1JGxCZty7b5EyUlE5-W-2zW1vMBUHpu
X-Proofpoint-ORIG-GUID: o1JGxCZty7b5EyUlE5-W-2zW1vMBUHpu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290082

On Thu, Mar 26, 2026 at 12:42:59AM +0530, Mukesh Ojha wrote:
> DTB PAS context creation should be done only for subsystems that support
> a DTB firmware binary; otherwise, memory is wasted. Move the context
> creation to the appropriate location and, while at it, fix the place
> where the DTB PAS context was being released unconditionally.

Okay, if it wasn't obvious from the previous comment: split into two
patches.

> 
> Fixes: b13d8baf5601 ("remoteproc: pas: Replace metadata context with PAS context structure")

Was the issue not present before this commit? Was the metadata correctly
freed?

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2: https://lore.kernel.org/lkml/sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl/
>  - No change.
> 
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
> +
>  	release_firmware(pas->dtb_firmware);
>  
>  	return ret;

-- 
With best wishes
Dmitry
