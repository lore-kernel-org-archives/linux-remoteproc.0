Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372623C7E07
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471500; cv=none; b=pFN7f+6TmlP/D1Z5Jlg/ObUo6vQAMzJGPQY3xMoIe3IaEARlg2lSiiyYzXQHOoNYXmxS7F/UkY8TQNhdSdSDPwxFHuxWeo5t+RbDX3Dj+d+e0pf/JVF6YEP5FM9ESmXoRmltxgC8Ik+VVc0RHW1CK+CG1heEJVrYytCBCYhstDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471500; c=relaxed/simple;
	bh=S6wX+gTzPAvcCMKGMzHVKpxGRSVZp3HgiObGvUJwvgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4Y0jw+B/PS/OBwe/CQr/M9N3lTtVH1Kho/KcVjSrZgAC+KoXTFaueFjih9OUnsJ0xoz5FyUxvJClXkR/TejgHar7j92kzCqANBSkGclE1nC+/nbAEBthF8lK56d3695UeLwjHWqLQ/9jSXGmFlr9+rQlBSo65KrxZ0P7q5k40I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzklY3pE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oqvqhyyz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzklY3pE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oqvqhyyz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8poKX3752416
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 14:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5geFPuppNEw0Na2cpguNPJGL
	4nGh1NRsp1YB6ryaOE8=; b=UzklY3pEYefS+bOkeBxtQUZQD+IPj7gXWaOzbRS4
	WSH7uI1wuHaUtu4VHRYIMvEaC8Ce0Evo+1qCEfaXCuS5ZjOepwbErwHPT64k34un
	SbcLc4hz3Yyoroyb3gjlgim9TtWDtoikFNBW9OgPOx+e2y7su/Kq1/tXmPTWiAYZ
	LKsObFeI2pSfqRgSI6in7sI2towKK+tr48YfWNyZERAuT1Y+/k7VL9nPYI2Rm+MG
	rnEcZGfao2k8+8039tDSPeRRbTv/tEPjbLqp4NrDRL4nlwgeOh464GwL7tyN7NnV
	qY55lUizS1cK2Jl9wXKawsarLCHU2ioQmRBhk/Lcn91pGA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duch1htsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 14:04:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c797efdaa9cso6477477a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 07:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777471497; x=1778076297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5geFPuppNEw0Na2cpguNPJGL4nGh1NRsp1YB6ryaOE8=;
        b=OqvqhyyzhU04Ko9ryYHrEnQ8Z7+0PUmnKAj2kURoZH33eCbYTmiWvchFka77Wgrilb
         UIouHcS6aEM/PC/PXWLZnvRJWy2rBjumtOVmY671+wVsy1lZ5a9IPhFxCVJOdV9eqJ/M
         XNOebnfjcjDOk1kztfoz8FK1iWHlkCnFc9g+iVR7Q0JJeJkB8F+524rIE//JVRFk91Na
         VZR2mMbrc4KjSQZ600GIKcO6TS3vVDZ0CBp6oK+4jbJlXTRE7kVhdIyMtLngExXbkDTS
         uCI1rx6RZ5EGbSFNi3mh2STu0Cj+dWH7TA1u5JKEbmNvjGy+0UtEe4petkLFQDaleIqF
         S/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471497; x=1778076297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5geFPuppNEw0Na2cpguNPJGL4nGh1NRsp1YB6ryaOE8=;
        b=lXIX916lVvxn4dUmNPJbJinAjQALSP5cbey1EoY7NY7yqcgdXyfVXxfJD8u6DLC1gi
         1TgVJFeADlUveq/XrrwK2fUklXpDvZTYFmXE941dN81eAtnp87m9Q+1uPnXRimqKgeSo
         ejcy5WdRvl3hkrkpcza2xo3F6RVW+hZVri7xLdBsdy9+9dX5NKH0zXV4qacfSL9GwMEV
         fO1ggLozexsjmuyEwms8nCw5AqmVsoIFUFVbOmooTwmzi/pi6njHheTdXx/ESTBpjVDJ
         7EvCMPe+eEfa79INYevU017lLsV1lQUNsWcY8Vcuh84wE78bHlfTU5SW4beMvExe1M5o
         mUoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wieZ3iVPti+jgV6fCY5IQ4L5Q4O1AJjWWxgRfGsjDeda+w66+nGtiqig/4R0B2RGf0B11XcIAww1wWa++Wi6r@vger.kernel.org
X-Gm-Message-State: AOJu0YybylAtQ7fbp393wPJBfO4f4cbjWQuHaenSzpRv6exm8jHmfYkQ
	UgssF2bmlmKYD3pWQ2UlHP33k6HUauXwmo+J/KOfmfcaCpq9qvmb0WHMGSG9Yj5s8i28d8LBm00
	U3AAWEwlZIKoM5H9C2fAs6OAINeK6+GRKGgYxoGJ8TntSl84+V/x27qL/hilncycXVPu5HGsm
X-Gm-Gg: AeBDieuy1qDlesXwZbufjEKKInwAJfPvSnshXIXRkiVCNKJblJGMhUShPOOKgxWtAhM
	F53HiP6R+GxceKxyq3gZLSpYRz2VL1fyANj3g06iLHXRPXKnFcEipiITEWuiUtlVcU8j6aTRryY
	FvVc/8P9I0Whflw+ueQfjzdM8sIKrrIyo3TzopY3ZsCNVELdiRNtbOsSbe/ua6T6g50lc34vQAs
	f3EUZcM47sTp+k41CzMg863OJrl2rlSRWL1iUy2zocGFh5ZaPHGLTR8uuTIIPn8WpyLewCdEoGq
	aNT9Q1JxhFFFKDsYWiDqrq9NWZzrUjlq7y0GM0djmZqXxMVZmaUyZ9GzJkgvEVLzdKSsSAtURhr
	CSBBKCC5mO0VXWcdaXOD86Pgqx3680CK3imMx8qq+eorZWr/qqoQGmOP8+Hg=
X-Received: by 2002:a05:6a21:33a1:b0:3a0:cc67:396 with SMTP id adf61e73a8af0-3a39c2722a6mr9041405637.28.1777471496935;
        Wed, 29 Apr 2026 07:04:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:33a1:b0:3a0:cc67:396 with SMTP id adf61e73a8af0-3a39c2722a6mr9041274637.28.1777471496127;
        Wed, 29 Apr 2026 07:04:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506af1sm2270618a12.25.2026.04.29.07.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:04:55 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:34:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v4 14/15] firmware: qcom_scm: Remove SCM PAS wrappers
Message-ID: <20260429140440.ov7x75bikyvs7w5y@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-15-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-15-sumit.garg@kernel.org>
X-Authority-Analysis: v=2.4 cv=arGCzyZV c=1 sm=1 tr=0 ts=69f2100a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=n1VOVlC_Xzu4QXtT9DgA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MiBTYWx0ZWRfX/gGUYYw4/xxX
 Iu/kMgyZxWQfq1YSB64R7hucKYZmWQLujl+RH/CwF8CYuQ8fiYEn/fhYey1n1NhU15HoukSYvsh
 WWsLCHropH0AzVU4HEgjK08W2544fJRTbWeMEpVEROxT1z0eIvO3vPGWpSqO6kbpJswyMxqoS/B
 BKldZafCeO7J28erxUlEUIMUkZgakCIngK7LXf+pWj9C52RnZj6f7VMpXrJp/mAhd27iJRfh0N1
 ZI1CW0CrDE75fP8K8craFDPNXLVYlcHsV9p+i2A2yCaDjG2w212DTl4BnpR0Z4gHX9jQAuoc9PY
 pLLw2JFHldpt15uDsyzH2wmzu7zS/B9fnqatEc4uMNOQKtvc4xjtocb8zlDeY4EzKXDZe+hWDsR
 /MCnmmGsRxWc8uCICUlaQa7zeRYx/TUVEom2JFHUxa4Uj+moIt2onQVL/+R8gJcXbKUlBlN/hAQ
 u8VkzKnaoGK8t2EAh8Q==
X-Proofpoint-GUID: Jf8o21nDp_qETccme43MK8T2uVIuUNej
X-Proofpoint-ORIG-GUID: Jf8o21nDp_qETccme43MK8T2uVIuUNej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290142

On Mon, Apr 27, 2026 at 03:26:02PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Now since all the Qcom SCM client drivers have been migrated over to
> generic PAS TZ service, let's drop the exported SCM PAS wrappers.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>


-- 
-Mukesh Ojha
