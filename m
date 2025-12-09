Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687543074A9
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Dec 2025 19:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765309948; cv=none; b=eKhiurCsC6DTfpqsxz39KJyPqgMp2x6aISlnhlfMh4jT6rC2Isc7+2YQ4LdDs3Bi19asXl5qqxtd1IGWLXb1ihZeb5dNVtnVTsN/RycWexIdFsMMsqwc30wSYFwr/LADrnmpvXpWKU4LFPDBvh0zrffsxCF6+E/g/yXjmo+g3Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765309948; c=relaxed/simple;
	bh=8gDtjH8CAXjFERT4oqE6LxOPprXGZHnDQXf80+5pkCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EA8cBki5/D7fr4fCCdjlHvh91OsLq9w2K2/uDKyGT4ZFe48IxCkueDr1uGPSRhcvD905HbA0JpVL+zB/DScb9JUMGWrCu2xi7ElVLnvVn4cSaG27SnqQ+IYtgJVACp2cUvk1WWoMSnDZYLQYU+1dEXpT87mWTeYwzb16Vmw5mqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z2as6eIj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VVaPBslz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z2as6eIj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VVaPBslz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9GjCxG056983
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Dec 2025 19:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=am8yGl2Cdr3Q4f3mL2nUDyaP
	OEzmYIVC9+T1mbbHHcQ=; b=Z2as6eIjPNGMLYgDpx31RhvWf8lZ6y6oXbnQuvCi
	tbCLYLy7RGx1Row/C6Pf0Vr3z9wAfYwDDLz4u6wJ/SYlw0HcLxzvJzhnDBSn3V3K
	2ylSI4Zp3+LEpVU2awoyCYRqvOSGuoiqnPpghUyepJTwgQ+tpiKdYtSfvZwZazy+
	YTfsNU2Rjabl07NriR1KCuVzj5DhEW9m4UDxyVsaQfpu9EvogK8Ifyv5C8YlyQw2
	OJxhW8hYq8blYLU1PIafMGD2Cv1kz1LwB6apK0skBDSRaAruPNDRRgBQr/NdgBYU
	qPwsJ8bbOtMOBQ+DgDKNQ0v7kbC0XUpuTyMElZDi6vZOmw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axpx18r1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 19:52:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6e701d26so128655951cf.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Dec 2025 11:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765309944; x=1765914744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=am8yGl2Cdr3Q4f3mL2nUDyaPOEzmYIVC9+T1mbbHHcQ=;
        b=VVaPBslzRe6JVOC29Yfn4YWI+kM+SpxRLjWEwA4RG2sQpLI70FvhRSNiICCkafxdhG
         9iPe9bNolOQ7hmYpf+KcZfSgpI+eJGDs9Ab5+6iKioyvMPiOVu7Mu2p2jAKV71P7ScPF
         MINqJDwRsl5eqeYJMWajmS52MFrHrscfs6+shYfq3p2GWHvC99sgOIdL9JsY0OB6+xpX
         TYTuR5NLNr6k8Dsg0VypKLOFBCb2aGcq62o7qpt9FLqYpVapj6VMdB+QnsB3rcufNb/e
         Exz3zHmxmQqvPUoyyXMTuGAkzRrmW30o4dIPLuG4bT9nkYrhLKE/wafYxMlrvPwGPbUu
         +kpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765309944; x=1765914744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=am8yGl2Cdr3Q4f3mL2nUDyaPOEzmYIVC9+T1mbbHHcQ=;
        b=b0Ao3yeebrLULMDPV2iNZm6N4YElFMigV9PXIoGhHiX9q3trCkLEGjvEFYOjFKrbsJ
         6KwmWVTpIjwo6G2+uhjLuvKNQOH4BSLxDh8slKaB4kr0uur5rljV1l9ojJLqvkP7I+mM
         tBEV9l5a9Rb7Xr7X5vNc3OeuFjE4Tdw2ZFu9EURDRmRIvgF47vdRJgH6XanVPyFoEDNm
         sBM5jcFonQxvDFPc36icQurTCFE6676DfnFrEZmYD+gWzh7xnfS/rDt8YOtmJBaCCBt+
         uRsoj712OznY6lNglkC3u0dpUcclmTkhufR9m2DItMXXZeBjwNHj92ERtqNb9yNvA3zf
         CXqA==
X-Forwarded-Encrypted: i=1; AJvYcCXtblz9Snfxa0HCVBVYqrYRGpBA9okiD13seqmeRT/BiO2x9suGxoaKMHStTTBMSMkYPWTv1ZRLJEypD44wBvPD@vger.kernel.org
X-Gm-Message-State: AOJu0YypKUFPLnpnuP9Hsi92qq2z6KgWomgwiwHZb0XPS39Jt6blnear
	yQxA44VsVXjAdvho+Owp2a0rDMD5lVMkhkXJwUWHY71A9yQ96SywHAtgP/6gnWyAUXY8eE/GQ65
	2j9UOlwaZ9S0+rCV7SDvxHjooA2qpkcdmgKyspdh07ttui7btw8DJcOd8O9wHhHLYhxcYCzVh
X-Gm-Gg: ASbGncvQ5Hx8J/F0mBCV7G1rz5u2VR480yNjSAGq2/03sDdJIlfsr0ntuW4dtq5E2xj
	4MaQQpt9MoZYJYXiq2PxHq9ffpC7/7V34XlXDAaGxkDlMt5kc2gYze38TQAyG5UZ+SrspFCgcct
	23Tv5cmNErSsq30KmVafxU3SqXX51HJ7ZkdFTxzmjdQHMB/LwKc/vNPAQO2UftDq04iJ9OyhVwQ
	2+AiG1w7fBYRReTI/CCg6D2T78I32pLcGiI2ftZz5ToIPBTcex0KAM9d/hC559Bj5qdWE66xi5H
	QGQ+ZDox8BSPk8TBh9RYIOqym4SLDWEqInBC41n1h51ZCNAu6BZb45FqOB4HOavF0XNlWO3dykq
	7rS5NJQX2yhtoAimxzCQ1Z+Q/zUhCxr87Q4jIIfdx5WFh9YnxrV7amS5n1Nfh23HJbTrzVK4FvZ
	uim6JuqM/yqzN3bZJg8wCJCPw=
X-Received: by 2002:ac8:7f8f:0:b0:4ee:42e5:f5ae with SMTP id d75a77b69052e-4f03fdfe609mr177180101cf.25.1765309944285;
        Tue, 09 Dec 2025 11:52:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtLwoELzFNN5fXJFR4PgH324tdBP86AvmtFkrKxvIX9gnUYNAoeIhzFFU9OjFOmYDS8wOrTA==
X-Received: by 2002:ac8:7f8f:0:b0:4ee:42e5:f5ae with SMTP id d75a77b69052e-4f03fdfe609mr177179971cf.25.1765309943789;
        Tue, 09 Dec 2025 11:52:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b247f3sm5578951e87.39.2025.12.09.11.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 11:52:23 -0800 (PST)
Date: Tue, 9 Dec 2025 21:52:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/8] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Message-ID: <zjimpbzncmjfcaoiepbkwcg3v3soka3mhudee447h5hseuiyci@kfexqup2aly2>
References: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
 <20251208-ipq5018-wifi-v6-1-d0ce2facaa5f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-ipq5018-wifi-v6-1-d0ce2facaa5f@outlook.com>
X-Proofpoint-ORIG-GUID: sG-r5DJuoJYKyUmWaKl9zwcWPVh8z6lM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE1MSBTYWx0ZWRfX+GXev4WgweQb
 ziwJrf1mvCauRoZNKZnL7oNKkgMHwHcj2FKTOLRbSOSAt5S2MxKq22TudRZoJK6j4Y5+Sib3SZk
 u1FG7Au0PjU2QnUPEwD+PC9p3CE597fCpvks4ovd1OMyMFKfYzkZudoxqn4bTJxaC+R5rH4yR1k
 P9ixfj61naQ+2mFbJBKmAMutSX5C4jAsv2cp5bANpFBhz6ZkGy3CqBP5p7TnAlhpN4iFO+LpqLF
 XWyjuuLGeZVFeg8EK5YWthjdFbSCBCN2P1YJA7abvx1Ce6hSEHF7k6ss3BJVygd0Rlz0Nx/EgQ+
 CyrjhB5gX4Aef1xQDCEqRqpoFwHS4HZY5u4o6ltOlFxEyVVikFsZ78buDuvwPxRrkN381bt86xs
 r7hz6bHnb2HwzlrySHc4nzPDTavwGg==
X-Proofpoint-GUID: sG-r5DJuoJYKyUmWaKl9zwcWPVh8z6lM
X-Authority-Analysis: v=2.4 cv=Su6dKfO0 c=1 sm=1 tr=0 ts=69387df9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=M7v-gDGZAg3xi0XEQhcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090151

On Mon, Dec 08, 2025 at 04:25:33PM +0400, George Moussalem via B4 Relay wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> IPQ5332 security software running under trustzone requires metadata size.
> With new command support added in TrustZone that includes a size parameter,
> pass metadata size as well.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 17 +++++++++++++----
>  drivers/firmware/qcom/qcom_scm.h |  1 +
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 1a6f85e463e06a12814614cea20719c90a371b69..c970157f75b51027fb73664a58c38550344ab963 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -583,9 +583,6 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  	int ret;
>  	struct qcom_scm_desc desc = {
>  		.svc = QCOM_SCM_SVC_PIL,
> -		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> -		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> -		.args[0] = peripheral,
>  		.owner = ARM_SMCCC_OWNER_SIP,
>  	};
>  	struct qcom_scm_res res;
> @@ -617,7 +614,19 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  	if (ret)
>  		goto disable_clk;
>  
> -	desc.args[1] = mdata_phys;
> +	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
> +					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
> +		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
> +		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW, QCOM_SCM_VAL);
> +		desc.args[0] = peripheral;
> +		desc.args[1] = mdata_phys;
> +		desc.args[2] = size;
> +	} else {
> +		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE;
> +		desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
> +		desc.args[0] = peripheral;
> +		desc.args[1] = mdata_phys;
> +	}
>  
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
>  	qcom_scm_bw_disable();
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index a56c8212cc0c41021e5a067d52b7d5dcc49107ea..b8e5b4f2498e75c9eca1a0c0032254b7126b9ed3 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -100,6 +100,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>  
>  #define QCOM_SCM_SVC_PIL		0x02
>  #define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x01
> +#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a

Please keep these defines sorted (QCOM_SCM_PIL_PAS_INIT_IMAGE_V2 should
come after QCOM_SCM_PIL_PAS_MSS_RESET).

>  #define QCOM_SCM_PIL_PAS_MEM_SETUP	0x02
>  #define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x05
>  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
> 
> -- 
> 2.52.0
> 
> 

-- 
With best wishes
Dmitry
