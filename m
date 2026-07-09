Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CC33B38AF
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Jul 2026 07:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581093; cv=none; b=CLVP0pigFhl+4J9aiz8Z2YMVPUtkRfX+3qv3ovz60mKkraKL+6m5KqjerHMc49OEDft1E47Np/DaIGb/msIobyc9Kif+3qt4rAT2xtXf7GamF38ssgzs7m1DwJMtyAR6x8h7XMfFrr1hjyY5QxiYM1MeeD4MFVEo1cz6cduku6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581093; c=relaxed/simple;
	bh=k4WjHrGP5hzSBCqFQquQk07WAE8+kvvugs3y2kg2Sx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3GGS2btRKz+TOyWqrP7YQPZh8B4hW+x7FK6HUIU/t6nU4QJa3cRgynhnEMdP3l/O2miCSkJts8p9ob7K5vpj4R0WMwKis4wuSn79h8O0Q6/t7Ccf6d+thD/nybUzdiO4Q7DrXJe0L4kNalySgBhusIpQKmx+YU210FagHXiDx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1M+9o1/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mv4AuHuh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L1M+9o1/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mv4AuHuh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Hg5749755
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Jul 2026 07:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1WlJwgzk7BqfXsYW+BUZ91gU
	claN3oR2tWQMtMO540M=; b=L1M+9o1/qy9yaBW1VxShfpa8f0wdHboR/aCx+LBA
	C1zZ53Ej2Fy/9eBiZhJbkqMJB8HAZ+vt5C+azj0QTltAGx9jUoaNkZZkdY97aNzw
	URTPapkeN1wy5d5v6Blxy4bC+B4IL1I7DwBapsZ++JaFGm6yf9XJtlB0MkYJUtaw
	0YSdEHj0H2b2gJEKMUUUblB8yvY152n27nd/SZcVzkACofem5WktE6c2xmjKR7o2
	qDNid2dnig0aQ08VDHgOaH5xnIvDgdSBxXgbL/aPsw07L0twWL652HAPseEIKXot
	WxGFSsNynYPM49nkJEuoYUKQ1G0hp6UbK7gxFhjL6/AOIQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfstbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 07:11:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88e0f04e51so1425362a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 00:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783581090; x=1784185890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1WlJwgzk7BqfXsYW+BUZ91gUclaN3oR2tWQMtMO540M=;
        b=Mv4AuHuhFtPkZVG/h8+HG8uW6jNWw4iMvI6VJil4PAhuahTyD2iqv3Xk4V/k2dROUO
         JoxORzAttK08PIP0TPMuLEP60ixYxTKw9zSj9YfZuqqN6FH2v1wxCVqjfwjQYd8sYmjr
         UTwOqFDx2YCXRW6YOJrgdeq/CIYxjES5eWSDcmKOsGUAl1XFN7vuoPcamf3IGtPevdWk
         fUFkJEgdLchIbXLwykVdnawDcEcXVh9dy6VPqDxEuV/NwVQh7OaOZRctKRAGd6PAugjS
         c2i6pno02w597NgRlX6+LEv1tqX/X58PulRQDGX3VyMrSj9mBgPO6oJnGKylSLrft2Mf
         UT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783581090; x=1784185890;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1WlJwgzk7BqfXsYW+BUZ91gUclaN3oR2tWQMtMO540M=;
        b=V5UEUpC0LrKdSABjzziJDo5pvjVgt/L5T80vc05dbDQwJD631nKTh7zjkHgeRhYOaI
         j8HxbMgGp5TT2Rf7rRvbIc2RnEo6UFPnkqJSW483rNSRaHf/weA8cItY6oY6ZYgri2Bm
         JYzULs4Zx1vbvAIGFOFOT0fnfO6Zb8V3SfDTbK6BfgQRLZ5N/8lewKcXDPvLu/q84v7R
         qLa255y04tr/HwoXZM5gk771Z9HAdQtuVx9L5+mbrEmZ2tv1HYAKGXP+BRnXjA/yk8hu
         O8QejL5oRrzs8aDHnxPNeWMAp8qSYnOuDYWTeV6XFvBj1PIZIkSrJqdYi/XAwpXsmK8/
         olyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRuVzm/cOMG3TEc9BKGhYTOWqWdLxlucNAcVtN+duqEpcyf71S7ERceGClSo/VHJTCiG7izjXjeRAASg7zym1h@vger.kernel.org
X-Gm-Message-State: AOJu0YzP09ug6lgx5uqW8l2iuzFJlcq24doVwLuluv6Xi/Vh8S6MZlVU
	r8qgFchuH5FYSVjRrgGwsDNmuOW6GJwccZkjP8ZHSoJ/ADFkbjFGUtmEOKrxEiTn3EoDfRXp7CA
	hWDYiho2G57tbYeWu1uDdKBwap/S/69PuE0bNUomVq+OSXmzRWEgm8atppG02q5pAcWsdyPWU
X-Gm-Gg: AfdE7clf+JMoVTqEmjrQUtilgRLTW5eDfxTOxRDmo/kXSlu8rUN7nh5UFUWLcfQNvGx
	7eKXEQJUKHqIgt4WcJ2wtt0PDBc/Drm8vwFcFopldvTwUch9lu3U/j9UJS9yyUw6qYDIMBwQ133
	CkyfoxkjkPy4y7kf1x8RQrlOiTbPxO4I84ntodH7xFTLYCcv6BVZMMgvZwKuNeynauu38+xEuRz
	z6JZBFKytGgprjy86I1kMYu4xnvswlmjGpoA/YuZ3ly8Y8cyoPzU0nB/jZd7BV9HVgCAzV8OedI
	Qyspw5hkDgCEb2Cuorpu4c/cQxCytCztQjvbjXuMDfgWvT1mWeKjP1tdotF5DtK2/gRFeSw5ztw
	Q5WM58Z9VmZiYgZ9X5oP5DUFtQ6Pl/i7GijHfLA==
X-Received: by 2002:a05:6a21:490d:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c0bd1ed9cbmr6790951637.53.1783581089550;
        Thu, 09 Jul 2026 00:11:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:490d:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c0bd1ed9cbmr6790903637.53.1783581088972;
        Thu, 09 Jul 2026 00:11:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm44052133c88.14.2026.07.09.00.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:11:28 -0700 (PDT)
Date: Thu, 9 Jul 2026 12:41:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 1/3] remoteproc: qcom: pas: add needs_tzmem flag to
 trigger shmbridge creation
Message-ID: <20260709071121.uhk5jx4lpfgi6mzn@hu-mojha-hyd.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-1-053993f0c6fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707-glymur-soccp-v5-1-053993f0c6fe@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2NiBTYWx0ZWRfX6vAjFUKPUWqL
 cB6vYZCSCI7UK7x3VjaF43X7Pqegtss5/207yxN2dT7YL6a7/5Kx4zruH1FTeqb1v75K9TFyKaw
 FrsEWX+Yf8XCN69FGlCMlNFirvaU0zhPfvhp1xvMI1KaB692SxPvgFXMdt7yaL+jpGQ2N94KvNC
 71V6473xR1jyf+cvYDwLh02+kmm3ZxDM2DKnOU3lMuos/sxVgpSscm/WLI8lBjwi1ViGssZn8vM
 CAP/gJeXCSjUyNKI8euBQKhpJJsgd8j+yMm5suLTD9pepgx6ZIZCe5YDqdkqrevHsBgvzdDAaXA
 NhzA4g+1gkIp4cttoMxYTPBLV37OovxXHh654R3BnBQL2bMlrNOs8RVxDAxGJN84kPTx58as1rt
 RTVwfiI48IyFh1zfun1Ltw3nFvlJzYcFdiGjdl/lyjSSjPybvg2XZyBkATM8jZYkGF+Ur/8cvYQ
 J/2RuRSbMJFZFpOmv0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2NiBTYWx0ZWRfXwhOtlOiup/bI
 MVfyGT/OOyfJqhpLaO5hbEAmHS0Lki2Js6G1idpt+TDklAR3X7bho+umWXe4v6FXzI4FbUd6Dw3
 xhGoAyfR1DxpK+x/Yt3CB4UYn1X1tuA=
X-Proofpoint-ORIG-GUID: VQOMEb32QzG6A_YODWF5K8HouwPEAIe4
X-Proofpoint-GUID: VQOMEb32QzG6A_YODWF5K8HouwPEAIe4
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f49a2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jZQ5m3JRttz7OcbpC_4A:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090066

On Tue, Jul 07, 2026 at 03:12:44AM -0700, Ananthu C V wrote:
> SHM bridge creation is required to enable memory protection for both
> remoteproc metadata and its memory region on Qualcomm SoCs running
> non-Gunyah based Hypervisors. We currently rely on the iommu property
> being present in the remoteproc nodes to detect this.
> 
> However, this doesn't cover for cases where the remoteproc does a late
> attach, like SoCCP, and for remoteprocs like OOBM SS (Out of Band
> Management Sub-system) that doesn't have an iommu in front of it. In the
> former case, any attempt to create new mappings would fail with EEXIST
> as they are already setup by the bootloader when the SoCCP is brought
> out of reset, and unmapping them to create fresh mappings leads to faults
> since SoCCP could have active transactions on the bus. In the latter case,
> absence of iommu will be caught by the has_iommu flag, and SHM bridge
> creation will be skipped.
> 
> Fix this by introducing a needs_tzmem flag which would cover for the
> above edge cases by serving as an alternate trigger to the PAS helpers
> to ensure that SHM bridge is established.
> 
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 60a4337d9e51..cd7273fbcf98 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -61,6 +61,7 @@ struct qcom_pas_data {
>  	bool region_assign_shared;
>  	int region_assign_vmid;
>  	bool early_boot;
> +	bool needs_tzmem;
>  };
>  
>  struct qcom_pas {
> @@ -914,8 +915,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  		goto remove_ssr_sysmon;
>  	}
>  
> -	pas->pas_ctx->use_tzmem = rproc->has_iommu;
> -	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
> +	pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>  
>  	if (desc->early_boot)
>  		pas->rproc->state = RPROC_DETACHED;
> @@ -1657,8 +1658,27 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
>  	.early_boot = true,
>  };
>  
> +static const struct qcom_pas_data glymur_soccp_resource = {
> +	.crash_reason_smem = 656,
> +	.firmware_name = "soccp.mbn",
> +	.dtb_firmware_name = "soccp_dtb.mbn",
> +	.pas_id = 51,
> +	.dtb_pas_id = 0x41,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "soccp",
> +	.sysmon_name = "soccp",
> +	.auto_boot = true,
> +	.early_boot = true,
> +	.needs_tzmem = true,
> +};
> +
>  static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
> +	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
>  	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
>  	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
>  	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
> 


Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> -- 
> 2.43.0
> 

-- 
-Mukesh Ojha
