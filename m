Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3063B3BF0
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 19:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699907; cv=none; b=S13DTrMhKC/0aNfI7n8xzApP+27jgwlm1j4hq5YWD+dW914l9uLV9cyov3BlEossp43ZD6QWRReEDJNZdrc7aGDmdIJ8rtuOykTVkh89Z/xdy44gzAO8vNEoq6YMM+syPyvWFFrz88R+Ya9dor6Url+XPSaaFbL7PRW9UrXnu78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699907; c=relaxed/simple;
	bh=TOFV5FhHLTg90n8Ys2jf0xrJ28wQs3Tgz03VtgjgC6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epNfL8rNdqJcyC2eqBUIvT2W/z8DHsWidhBmlk6h0HB/W5J/Lb2ZbWi0p9X3RaUcvKTm4oJWU+t4DJBODwLjsRegmgngrKFd6JA79Aw5EjptmdCrAKV4vEBP8A8jnYdNDXFLdh3hJtPy7P/YJq0rnj3Iug22B1fQ40u0OsLwUgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fC9U2hIq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Np0VhrQH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fC9U2hIq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Np0VhrQH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DIW92b3324683
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 19:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dPgTJ9BxVj52ozj6Tom5mPIW
	gYq2r83+vLDiB7tPbgM=; b=fC9U2hIqlrwbWq+tyK8jBrdx5YSB/8GCiBVx+oxa
	Vfdpv9GYH5aW769O2OO3xvamqnkKxhNmrPONO23qZBu8Bi1xMmn0CQdR155rmULY
	rv4xi7JzjeO1VYN516jJ4PC3+Tw/ibVs2QgfbZWF5WTOtTWgT2DLxuWOKWKLSnRY
	EKf159l2xFGvzl9K8EHIklIiLSY00hg6SI1VYgwYP9QsEq2kucCizcHvE2ZlEmT6
	vr8qMEjRLgNo1teIfVC+hHHcIBncKLQn18+/vbwVC9vWP/XiSKiND+vYEZ09cvWI
	qQR9KrB9SND7/UlnN3PInDLrcXyQoMzdnk10y0fu1wR3vA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvdb5a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 19:18:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5147078691fso165309201cf.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 12:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778699904; x=1779304704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dPgTJ9BxVj52ozj6Tom5mPIWgYq2r83+vLDiB7tPbgM=;
        b=Np0VhrQHtt+q86671yMKHOSRK4sYeJf7Owzv0qpGQ9hABh1qvlFOX3F8JJKzDgGL5e
         JzB7HkM35+VFatWfXMNQyO08XmnoG3N0hqNyVTEmAnCTBu0UGyasFdNkskRwqNVomcl8
         ApvGFCyXVyHYlAUh8YVwPGvbn6rTue7FmYiTxygRGqrFBGOtRkjIs/MJ8C5ecGp4P2BD
         FX7OOq4NZ1Ix7X2VMcRUiUX7Qw98raE86wTSLT0uUHC6Ksy6xmeRd2GAexEzzModC2Gi
         wrOSMVYvXUXu69JqGSoNVbfjcJXR/5G6RRv5LxzRsdRUaPqRYgx1Zm2l4/LALWonQalk
         A/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778699904; x=1779304704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPgTJ9BxVj52ozj6Tom5mPIWgYq2r83+vLDiB7tPbgM=;
        b=UMDwDqaj7GrK6Mmi970IZmBhvw4LMloXPW7ksHXCTm2C8Tui79FqI/W7ujKYaJ+QnV
         +DCfGEQF4Q2TQVsUarh7U8iWxjhiuQ3pQfHz6CoyHx0XjhwRBbeymyjJ8eQcp5orcvQ7
         xc/mv/JNaKzlBeEIlkNEOeVIYoTP5kxthFOLSRasQVMhMtaUr1CbzN6ANB8dYhozqJeg
         5mo5priJeNMR0iVju1M5LijFMsgchUSE04iFqgDR5F0O06p2xX/ufflXDnHB1yLSo4uO
         qmK23ybMRVBc5WwbQKZqQ2Obn9DWgCGmlPiLt0sEJSVc7xUYdR41FHbmnog0DXs0MqHT
         bfGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IF7lkg9EFHqGGnjzYawN7GPwSYXCSb0nTtXWgYS5as/Ou81v0kbUJSQtKScGtzmJaFUtspgbFL152xJEMoEpL@vger.kernel.org
X-Gm-Message-State: AOJu0Yys1Hs2pM8cJrmXH4qt0Jq69vqJhPjFNP0uikb76bAFBZ2FzgNi
	h8B3Y68R6OeW72yPfEQAVC/U6mtsQ9rtTSUld+ZBD+7XGw5qVXwXomgGDIWbEBjJEBBptkHZ2KE
	gecUDOPokb+ehCalC00vCx7WBR77EzEbjsGZm4k8hwF/b4Gm0Y9IxCzewoF39xL1+LaC5QlF6
X-Gm-Gg: Acq92OFh0xJdThZJXvAVIwp2NgV06Fz8hkJqaGT1xIZ6S+m2XeUl2kiq3Z3p629pjU2
	DSbiEe/sf4+QZQkoZsZYnYuomizrBREH7A97fsYIPRRrOwUbsjqgrYGjp+tyVXSOGjalno4EuGd
	zZJRoonwUb/UPbQK06gscKEX3yFJJ/884orGq39JLp5sqNsMM+TPh1fH4HN8vtXaRA1oIqpP/aY
	0eqZK6lslqm5vMaUMcPnThzmtKE3xGhNEk9DKG9Hg/jd0gAKNkagSvnaEymu/2UY5MY46HAvOXS
	fWVNqYw7ceKtfD8UToKNVhfzWAMhASrZABfzZIe8d5wcMoCTjNNvRQW9izURgssKATgvn2n50Rx
	YX234oQw3RXxIALeo3PPdXUx6N/C8smaTJ1nlBVnnNqrIX57Lqw8Szn8xTNMLMVYNTxc3XFoMTc
	iqyQaxiWNNL96dSOb8PGWKf2vLqPMG26Ihmxk=
X-Received: by 2002:a05:622a:190d:b0:50f:bc35:aae with SMTP id d75a77b69052e-5162ff73829mr61258791cf.52.1778699904415;
        Wed, 13 May 2026 12:18:24 -0700 (PDT)
X-Received: by 2002:a05:622a:190d:b0:50f:bc35:aae with SMTP id d75a77b69052e-5162ff73829mr61258141cf.52.1778699903767;
        Wed, 13 May 2026 12:18:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cab2808sm626681fa.19.2026.05.13.12.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 12:18:22 -0700 (PDT)
Date: Wed, 13 May 2026 22:18:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
Message-ID: <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
X-Proofpoint-GUID: sB7tucLYFDTXCs3VyFyTA0bw7gVeCWpk
X-Proofpoint-ORIG-GUID: sB7tucLYFDTXCs3VyFyTA0bw7gVeCWpk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE5MSBTYWx0ZWRfX+ccF3ACm62IN
 HeTonucB7e4Dsd8VhxQH/1nYDy6aWOV5yaFePaEpCrQ2XweKKBJVMw1YdtZ42eNAdhFDH3rB9J2
 XHTGBg60OsY832lF2doRsTs53bL7WQf13ZU/NwYfezwHF9UM7pXZlsbwC0UL46CoUSLRa7KtLMc
 43W72vREmVw1cb/Miutjje95EXn2i91DCMHQh17Tkh+cFYmBQDyaLdZNjQmBZi5D2nElT0Gf0nD
 rVpSxerq59cVc+mWTtCMfzxd4EmT/eGHP87/tyW/oz2DMOgqgyfwPf9VS6b2/vdRMsC9mWfIP/0
 uGQc0ef0wRUDMXO4gOGK5/1GFWz3cbkC9baBc0f70AvTjyf3rN6cn4XptT/zdqzku+Iz50b4+gu
 +M5ZCWywLDCqGmkjRiC/ayTDvKN9ETyZGz3RxHumLHB7b9IO+w7U8TYcOtuuyuteP6Yw2m8yw9y
 a0wZOwJwegFhsWFMlfw==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a04ce81 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=OX9z2a93DQOUP5chVv8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130191

On Thu, May 14, 2026 at 12:17:31AM +0530, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
> for the Qualcomm Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 51 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index da27d1d3c9da..4d43201b9ada 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1457,6 +1457,54 @@ static const struct qcom_pas_data sc7280_wpss_resource = {
>  	.ssctl_id = 0x19,
>  };
>  
> +static const struct qcom_pas_data shikra_cdsp_resource = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp.mbn",
> +	.pas_id = 18,
> +	.minidump_id = 7,
> +	.auto_boot = false,

Why? It should be true for CDSP.

> +	.proxy_pd_names = (char *[]){
> +		"cx",
> +		NULL
> +	},

Hmm, SM6115 didn't have proxy votes here. Is it requried?

> +	.load_state = "cdsp",
> +	.ssr_name = "cdsp",
> +	.sysmon_name = "cdsp",
> +	.ssctl_id = 0x17,
> +	.smem_host_id = 5,
> +	.region_assign_vmid = QCOM_SCM_VMID_CDSP,

This makes no sense without region_assign_count

> +};
> +
> +static const struct qcom_pas_data shikra_lpaicp_resource = {
> +	.crash_reason_smem = 682,
> +	.firmware_name = "lpaicp.mbn",
> +	.dtb_firmware_name = "lpaicp_dtb.mbn",
> +	.pas_id = 0x56,
> +	.dtb_pas_id = 0x57,
> +	.minidump_id = 0,
> +	.auto_boot = true,
> +	.ssr_name = "lpaicp",
> +	.sysmon_name = "lpaicp",
> +};
> +
> +static const struct qcom_pas_data shikra_mpss_resource = {
> +	.crash_reason_smem = 421,
> +	.firmware_name = "qdsp6sw.mbn",

Why is it not modem.mbn?

> +	.pas_id = 4,
> +	.minidump_id = 3,
> +	.auto_boot = false,
> +	.decrypt_shutdown = true,
> +	.proxy_pd_names = (char *[]){
> +		"cx",
> +		NULL
> +	},
> +	.load_state = "modem",
> +	.ssr_name = "mpss",
> +	.sysmon_name = "modem",
> +	.ssctl_id = 0x12,
> +	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,

Again, this doesn't make sense without region_assign_count. At which
point you can use sc8180x_mpss_resource instead.

> +};
> +
>  static const struct qcom_pas_data sm8650_cdsp_resource = {
>  	.crash_reason_smem = 601,
>  	.firmware_name = "cdsp.mdt",
> @@ -1571,6 +1619,9 @@ static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
>  	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource },
>  	{ .compatible = "qcom,sdx75-mpss-pas", .data = &sm8650_mpss_resource },
> +	{ .compatible = "qcom,shikra-cdsp-pas", .data = &shikra_cdsp_resource },
> +	{ .compatible = "qcom,shikra-lpaicp-pas", .data = &shikra_lpaicp_resource },
> +	{ .compatible = "qcom,shikra-mpss-pas", .data = &shikra_mpss_resource },
>  	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init },
>  	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init },
>  	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
