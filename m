Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B076268C40
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Sep 2025 03:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757476171; cv=none; b=nu7KJqcbYb6U/eFMwopMukQWva5bK3XS6kVKi/KpT6LtlXtTslsqamG3EomxIXcxuEVQ+7HcbuwWUCQz1jVEUDaZp4glJfU3WQvoU+lmK95UMo3D+DoM3pEkTDK8vxWuFwPyESDwFAax9u3rB5Kpz6KIRgZ97urUwW8+ymRaVWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757476171; c=relaxed/simple;
	bh=YBv0CW4QbT5Ix1E4QULXQ9Bl3KYGoXwI2sr7c1YlKVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIT8LkQkGWrX1wrXCSOLlvD8pCEnrCnUGf/YCnPs76IVv+CVkxve/MSQyIiCbEvZ8ZLlMxi6wVAlgzMo6k9Ad0ZX8Qkr/2T95w+mnYcA+Ym0w5Lfw2wkUdGOUXcgIlY1QqP5WKegccAEwnWLiNQ6rxUk9ZxFQnr75tQxUkkfDPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvutWUmn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvutWUmn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HV0ix000698
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Sep 2025 03:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jc+OrgV18zTR9+MeCEMWVPIQ
	oOTOsoNv5lyc0iyheDY=; b=RvutWUmnXniH9YLZ3AMy+wjZNJeA5TybiCsnfyqO
	utT5tGiXxakyy4B0AftdGXKCZ+cXNRIq4VnMaS1uDCvAv8gfP6F8ao05NhFVyR5W
	cMixFSnKAsgrEj+4bbi/d1Uf5OnBI5gQWdyDwJf7p1mcStBjTgyaKRfRFhklpAJ9
	iOTNusScYYLpaEYchbjyNXKqU91e57IuaI+yxZa6WAtRy51Rq+zO7BB7u83arObu
	63/ZljKeu+fcXJxX3RTVE6akCl2Wlc5G04VUKFcqNwgcIQW0gcvLgB9T/M0ljCI2
	pw0cBUoIKh6YTfpeaLFjJ7QQNoN/NlpQ27uFozQjsXHjfA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m2ch7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 10 Sep 2025 03:49:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-725d32eaa99so201248826d6.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Sep 2025 20:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757476168; x=1758080968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jc+OrgV18zTR9+MeCEMWVPIQoOTOsoNv5lyc0iyheDY=;
        b=XYUTdp1kUjQINS1GE6208bRjKOFukZU4Uav8UFnCFtU77xaZAvNuuWkmDVjKtBrWc4
         9M9yxQehEZ4CF+Wpq7s3P9zAYN7HMuscz0Lyb8QcejIfneY36WuLIyk0aJKOTzCacB8M
         xQzwMiRJEK1PaJG0UN5NFSc7IJVa4qHSpmA+7A3z1VPit2afeR8R4BO5ZRjF8bN/2n3R
         h248G2ktAURsDp5+EXxM9LCwAG7bhZy13agGfw86cOprLMrAK6KBCF0gCwraOng+RIdz
         ESxU5D41gs/MqtCLG/vA+2tiJRMaoZNDXeo9kNQn9UXEBmuzKVzObKdjfF+qWJkVVthg
         zjVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYzbxdEoH4mTlJKrKRBERdxdYP+pS6qsYsGwFu01hTMoF4jC2HyRkxs9F1UFElLISHHB/ZKtEVX1pWaYydiixl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5eiQYibHTvqcKpmKT7r3OlFLHnyPSOKkLucf1bQexdv3mccst
	8MDB5/ZflZQ6yn4vc6yCscwnMBCW+3rM6vaDun1n+xFRgqsh2iXjwnpixTqwFdseIM56W/hUMhb
	dPl10q4oRdQBdeHPZAoh1szQkhVkzB7SaEjJoZrbEDzazpr0HOB+BMtnOVV1yu+9XmRbkjLYT
X-Gm-Gg: ASbGncu2Lfl5GcfCpmV4thCLsGeias9419ZksktE+WPpYdGFnz0vx4yeJ/yKvKASEei
	VzW6qicfqRHVIkqF93p8RXX71EYTWsamsrDFm++U5+g9VPNIG6TRFd4V3TkgpalnhFFL3LGh62O
	++ads5Ca7aJpat8RAo8ARxO1UYn5vlUi4pPFsVXXmwBVnJTyq0qniK0SQNmIfRBDem1P/9KW32M
	c6cyAFp8ie2FMFGpKIHyeTTnYFOw5f/vn/vcA46d6eDFnIb5ikzTnHKDMQJvHEr7hVVhc33Ag4H
	MLbxwxv56FTZaPjXi7oqtWc9u8wWlpmy+PcBaxgUS1nIzLaGRNek/3bIAWpexyUjFat741ABDPp
	9abmkcyqnO482txrxXkuPnT9/wYPNLKhL1/NTqbDXwUE20N5cCUi9
X-Received: by 2002:a05:6214:cc4:b0:715:94ad:6acb with SMTP id 6a1803df08f44-7393ca9ac9emr142266046d6.42.1757476168192;
        Tue, 09 Sep 2025 20:49:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE41GdM3QXQSMAuSTL1V5Hrzte1YNWgWub/X0ZUvpjvQT3VvLXj5jdJKN9BtiAgDBHFRBXV+A==
X-Received: by 2002:a05:6214:cc4:b0:715:94ad:6acb with SMTP id 6a1803df08f44-7393ca9ac9emr142265846d6.42.1757476167740;
        Tue, 09 Sep 2025 20:49:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f5032caasm44137561fa.35.2025.09.09.20.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 20:49:25 -0700 (PDT)
Date: Wed, 10 Sep 2025 06:49:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4] remoteproc: qcom_q6v5_mss: support loading MBN file
 on msm8974
Message-ID: <ksnxdmxdxe2o3yffvpsxoyzqbqqsstiwkzudwxxv5nrd7ezkyp@7t67vswmkxu4>
References: <20250706-msm8974-fix-mss-v4-1-630907dbd898@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250706-msm8974-fix-mss-v4-1-630907dbd898@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX7qSNO76y9S2N
 WP1Y8vKtF709MYJcSTwx+GigiXWCoe6QIkMILKWVhvzl5nIWy5/Zw46K1rKeTzfeUotxOoFKs66
 OV23liDTg1tJ+lCawwJS+U9Cejp3wN01VGhI/wQSTRkWQDAKmPtLzdZ0sAQZPJzGrCTNujMulxB
 fp14gvr3yb27u6nfFjQXBnOzCJfzDVMrbujKy72JVOMYJEuyRQM+4t0k/d/PMDS4OT2mhgp9ZY/
 rSKbSngMWb+r44THNGFU9W5w3FkI0I5mo18wmG4fECDH6FcJNo+EaGYjc0aly15q4vwFgo6toqD
 Ig4fgvt6Z80pnww5FA4gWxAR+21okfsR3DwgwsbHMNaU54oo6/sukrG3nOzldcTWHHTX+HAvxOQ
 fcgyYExY
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c0f549 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=OCLVXrEKwRfTRf4533IA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VNb7hBIEhddTWlKkDnpP62S5GnTQlBBs
X-Proofpoint-ORIG-GUID: VNb7hBIEhddTWlKkDnpP62S5GnTQlBBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On Sun, Jul 06, 2025 at 05:47:08PM +0300, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> On MSM8974 / APQ8074, MSM8226 and MSM8926 the MSS requires loading raw
> MBA image instead of the ELF file. Skip the ELF headers if mba.mbn was
> specified as the firmware image.
> 
> Fixes: a5a4e02d083d ("remoteproc: qcom: Add support for parsing fw dt bindings")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v4:
> - Expanded to cover MSM8226 and MSM8926.
> - Link to v3: https://lore.kernel.org/r/20250706-msm8974-fix-mss-v3-1-8b5ae61c86a9@oss.qualcomm.com
> 
> Changes in v3:
> - Reverted back to the simple patch from v1
> - Added define for 0x1000 (Konrad)
> - Added MBA firmware size check
> - Corrected the Fixes tag to point to the commit adding firmware-name
>   support
> - Link to v2: https://lore.kernel.org/r/20230508153524.2371795-1-dmitry.baryshkov@linaro.org
> 
> Changes in v2:
> - Replace fixed offset 0x1000 with the value obtained from ELF headers
> - Implement ELF validity checks
> - Link to v1: https://lore.kernel.org/r/20230507172041.2320279-1-dmitry.baryshkov@linaro.org
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
And gracious ping...

-- 
With best wishes
Dmitry
