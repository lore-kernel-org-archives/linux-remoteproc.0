Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443791C5D72
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Oct 2026 07:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183977; cv=none; b=nGSXGZKcIa+gkzUl1hJdCgmyrPAQPSecxwjrVrM2WO3gx0yaLUy1mKlRQskI4HhYIl45+EQGAq7pXuE1MPBb/yZIP24Lg8nQE8FLVrhj6Z9HFM4VgoBPU+VqveuM5V4ulIL7AYR8vmYoKR3jBaRHI+ldMSZ5P6npCbnVg0xIG+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183977; c=relaxed/simple;
	bh=atrjdIQ97trzdZpGjI+qemq9aj6Nd3thS1TUv+eArUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKcbhrGqaglnwvWVKlWDEDohDar5336HoxAyg1c9jll/kZSF2P21rkyv2q/NvAyJYqUfb0/sm4rqNCYz/Zmorvs1y1WbsNdzKOuoU271DkCe7MdHO1NwIzHhK9LWBr3BaaQ3fIitu0l+q1plIPhiDD+0YgzsJtjxJpFeFGz+Eko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsvePr11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzXwob36; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsvePr11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AzXwob36"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510AWH787337
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Oct 2026 07:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yiEyYAeWYq28BCDpwkf47FyVsnh8JwoWDWQ3CJx+bfk=; b=lsvePr11+Lrh4Tng
	9YmBWlhU9+uaw1LjvwVApNPtLRgYBRWIij9FUVeZnjG/CSwBqIJFJXCZ3iyDetxl
	9lWeNni4xvKjX56JE8nY2udW4OsQBZjMjN5fVP3ldZEPFtYF/sN4ZuzcK/AeVqML
	cxs3Bd/C99H9d+lHX7/Zh14ATL0lULWNioSh66xKcfddtMAS13LRPikZZVTAV4hR
	cObDUUZviSTRVkmS2ldUsPaXBOqLIAkMaK+mn7isqZQwULFofmEosE+DdWrggbmr
	SOUGz4GxmsB4kzZDcwWGs3zOppw0BkNZ8jm+ATE2Dk11O0mzFYXrfnjk/vQOH6Zt
	+YeulA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa4v12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 07:06:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e46c120dfso128376185a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 00:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791183974; x=1791788774; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiEyYAeWYq28BCDpwkf47FyVsnh8JwoWDWQ3CJx+bfk=;
        b=AzXwob36n3ru82TuVeWiqRtZu2zV+DB0iYbRSrf9lirQYCumv+99CGzaoYh6Zmkhdg
         q69SH6p/cg9N4j4CS6l39obUxwy+D7Mqd55/+yuStO+hKxE3XS7o1ZRra1ke85do8Y/L
         PulYT6wbgIwHYh5IXlakdJ2tDON/j0Wt/9RotwVE+/JWwcZYY5EljQ3Z19VDYbDTZqjz
         QKVgbDz9Ni+EityhAh9Oz+MfLbRMTEeXVzRVHO3/JO5RfsS3tOZzHT4Gd8xcjWFC+jrz
         /n8hWvdkOLUX/PP4CRDY+QLuOTqH25b/FWavN6KR9bXen+NnHVLPcTdv4bOeRxtrztFH
         Cqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183974; x=1791788774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yiEyYAeWYq28BCDpwkf47FyVsnh8JwoWDWQ3CJx+bfk=;
        b=Z7gdYIZ2fum1W8jqmivZ5e5/84Cg4Qd3S5Ek5WVABZx2VMSfgJh59LeIyGeiC5dNfI
         OGBJvL8Y5btB9XXAwFSEqdxWHl8bQl2c6fXBGb9/tNUs2pN1aJbDQtnnYzO1X4AbuFvj
         faNZpZBrDwp9yI3Jgz7HCThBL1mWdKc2WLZoKruEaifcKjPG9dpQ+iJZ7Dab7jgfZ3So
         SJwtDfJniMnUKTg+SaZCn+IEvFzdC/8/0iiZ7YWuSApsGzHyUGy/S1TiTP1blFESLDcF
         bxr94mtm44MITpsrGL3OsHzoCWIWMBfPpPz8kKGLxkGKHe2ebwAY+Js3bp9krIr7m7j2
         eQKA==
X-Forwarded-Encrypted: i=1; AKwUvBwDopmgkshX8hmqQYmRpT+l6behq6SeiRk8faF2I0Gezk0jwCwSbX4ViBhJdm6BAcbczbuW9NpHA2cYIrfgA0zs@vger.kernel.org
X-Gm-Message-State: AFuF++kJUnzL+ids9Nfy/ENbu31uqJOfLTB2l7fg+ddohHuE46jE5DZ6
	sBz7+18hhE9uP7mwG0/SuK4dC/64EaL57kfjRkTYo75w0PueiAxjRQdYcmT0+nV7SMf+qvqXsCh
	E7YwAzNm1TtXD/+pK8SbQjVKkDArvs47dAWCVOyHeUAgzYF/EkLmLROKIMJ0WN68a9UGHG5/Q
X-Gm-Gg: AYBFou13jGEOOvqA6xCnFHEZNEwpB02SPbveDdb5jE43wJCRtLZL49AOFf2E4TrwcoN
	mOkbQzHD/n2xm/xpS9a/G9OmQK6Q8sHSgTPoGiHVQ6M0meF8FceOL5Q3VZIE4ORDXMwdEMCeWtJ
	nKubaB2oVYmL44PJfV9mqQqxufU/W8SK9V1DWpTAlc+Kz44KeiSLoPKdPYrnrvwuGMPBNpLvgbr
	YjpWzUgweTwbx91+WmYZ8MLFjS6b75S6e1kSYyCCoil8voKo4IdC5goO1RmlEHFPXeMC/87BajN
	nrKmP3XC1B9AEn+yrDeH4BCk3gsJadE70O6NvvGY+uuOZW4G/kudM9oLJGf18xBDWvD7+207aGN
	su0ImlqkvREXTu0/UIz1l9teuIrjwuS78/3iZh1oz1zHvcrw+i/9BSKO5R0psFVsafgccsuJNCy
	f7wQQzUEquXxvf
X-Received: by 2002:a05:620a:404c:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93e51081bbcmr1036870885a.45.1791183974393;
        Mon, 05 Oct 2026 00:06:14 -0700 (PDT)
X-Received: by 2002:a05:620a:404c:b0:93c:b7f3:9f5b with SMTP id af79cd13be357-93e51081bbcmr1036867185a.45.1791183973821;
        Mon, 05 Oct 2026 00:06:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79d725sm2957189e87.46.2026.10.05.00.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:06:12 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:06:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 4/7] remoteproc: qcom_q6v5_mss: Use mss as regulator
 for MSM8953
Message-ID: <7smt722arn43gwpfhbgagevi3ut6gdxalgfre3mzm4rb25fkkq@ftsucipakelm>
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-4-95c47d0f26cf@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002-sdm632-rpmpd-v3-4-95c47d0f26cf@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX4MSvl2gWy0Im
 2i62PWm+py/XdDnGEMMKhCXq6e3FbWrmop+Nb8A6cvbjm/0gCoSLXskFLziW6L8LtiE5+NtIm4S
 WD5nRRi1Qq34C8t6rggRECFkA1Gp6n2cauokKD7Ch/cWVl+FHG+sqk0N2OLBFmjcbo4oolO+9J4
 Me4WkqWGKbXtsaq53HHnJSsyvtxrKMin0JyZqeh95miHePzsvX3jxo/j1guzFnPmycIEhxajnLq
 SpZ9ueWs6Qd4dMvw50PeWVCnPjNZ188xRiEgvVWu0Kt+UbCvW9NhY8IFXiiTuYz363ChE6EupcB
 bbo2EF2osxppJ75SsuBbLvmIrNckVqlaVapouVlpb9hynD0wms5m6W1IyI0mOAmGy8JAp3h3wiT
 ZFqTjTfvs6TOc7KW8woNal++OsVRyJiBMF2N8LO203Ril9g9ywdzpwQcXIAvyYH05s+FCAHx8Ii
 PFyMjn5Kz4sBCQ5Wa3A==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac34c67 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=OuZLqq7tAAAA:8
 a=BJAjVMLeuKdTMRx92iYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: HsFKBL9Rlqu1bbF9bomb5_87eZ0sYI-n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfXynzF4zmzBPFQ
 K2z9jBOyr+GOPmwB2TflN2zgawP7Q9CcLJZ9TOOA7n4vJIWgCmEOgMYEEUsBTHemlC6A9qSheRE
 Mc1lUoVKIJgdZcnHUmtcUEdUchZqHIA=
X-Proofpoint-GUID: HsFKBL9Rlqu1bbF9bomb5_87eZ0sYI-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050028

On Fri, Oct 02, 2026 at 12:38:32AM +0200, Barnabás Czémán wrote:
> On MSM8953 MSS regulators is controlled using the voltages rather than
> performance levels. Correct DT definition and model the MSS as a
> regulator rather than a power domain
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 5 ++---
>  drivers/remoteproc/qcom_q6v5_mss.c    | 9 ++++++++-

Two separate patches. Yes, one will be broken without another. Write
this in the commit message and explain why you can't provide backwards
compatibility. Don't forget Fixes tags (or explain the lack of them).
But I think it applies to the rest of the series too.

>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index 753167c3f861..c7dc08858d54 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -1451,9 +1451,8 @@ mpss: remoteproc@4080000 {
>  					  "handover", "stop-ack";
>  
>  			power-domains = <&rpmpd MSM8953_VDDCX>,
> -					<&rpmpd MSM8953_VDDMX>,
> -					<&rpmpd MSM8953_VDDMD>;
> -			power-domain-names = "cx", "mx","mss";
> +					<&rpmpd MSM8953_VDDMX>;
> +			power-domain-names = "cx", "mx";
>  
>  			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
>  				 <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 2f71ed2feff6..8f6312213e1a 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -2728,6 +2728,14 @@ static const struct rproc_hexagon_res msm8953_mss = {
>  		},
>  		{}
>  	},
> +	.active_supply = (struct qcom_mss_reg_res[]) {
> +		{
> +			.supply = "mss",
> +			.uV = 1050000,
> +			.uA = 100000,
> +		},
> +		{}
> +	},
>  	.proxy_clk_names = (char*[]){
>  		"xo",
>  		NULL
> @@ -2741,7 +2749,6 @@ static const struct rproc_hexagon_res msm8953_mss = {
>  	.proxy_pd_names = (char*[]) {
>  		"cx",
>  		"mx",
> -		"mss",
>  		NULL
>  	},
>  	.need_mem_protection = false,
> 
> -- 
> 2.56.0
> 

-- 
With best wishes
Dmitry
