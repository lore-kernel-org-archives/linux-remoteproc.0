Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0BF474276
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814816; cv=none; b=jl4g6ev75MY4Km5FNMPoLdKBBJP9SFdyrhvxSegX/ghW6yTvk4sQ3s9pJmZHIQtMNOeu05M0n92/PZ4dyA1JSzMWj5siZ/G2gNMjVNC2bz0fiupxadfUbMNbcPUm+6oYZqR/DBo8PYmRL/GQVxR1fAyfWg88YGy6vnXZx2e3Upc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814816; c=relaxed/simple;
	bh=vGRDJl7kyRoobjtQdlgk+yLGBbR5Hgt/PTr9zi/5TuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n77ld4ELlVghWLIiNv2951loCi+P+2XnACcKzSZBbJYuiCGzWtle5nqhhTNKX4GeUOQC2tnlWOL9S8xhml+OxX/3uG7fjOIqUMIqMy5lej5r024JhV2Q++20KPfe4iOt7UZlPG7dCRqPbO75l9y1sNA3eDMYQznv2iwzdZO/wE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxeHOCiV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLrpWO8m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxeHOCiV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLrpWO8m"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0PXV2088511
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 14:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ylCK8hYC7LZLZaR0wLbmkM5b7kq2nz3B1dnKXYSCvp0=; b=LxeHOCiV+2KSo/Qa
	/QrIJiuAwRpQMW6LoLY1q6sLOwspiD3PuSd9WKVXm69JWIcOm1iQimp1bYIPWQLo
	3dj5kTWLttUk/LmXtLlKr+BgUSpjcg84eTOmIl3Npo2NmXfynxL5XZlGz3Cg4L0M
	Mp95zBa8GlM3mtRkm7td6QS7rjOVYE0nn8l6TclKM2k3PPKxyMCuFr/Vn1SjiHOt
	VX4DmODDXgYTuxmLcWwhPEl9/RPX52xRmOeYt6dPAvqvRm/dtEupswae8L2QIl1S
	+XfokUHKj5KUkXndkd52T3+FTDv+N/6e11itNGba9v+TkZtgSjvf/o9mPfbmw9Jb
	hkzhXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu2atk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 14:20:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso6165885a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 07:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791814814; x=1792419614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ylCK8hYC7LZLZaR0wLbmkM5b7kq2nz3B1dnKXYSCvp0=;
        b=XLrpWO8ml5PNxDG6GH1ikBe3bVXw/4hycA5aGJXgMHv2xtBYFT3sfjrFmbkN2HnwR3
         /Ir9BVlINteYzObM4UPQvT7H/0X5Rb/KdLWF7/NDFxKAe8gidr6+nIQfMCUanDPDtpYN
         0Kk+IxpTKMlLc8Xil3FH8SqLYG39CNMUN/0k37x4xCSx+NmBdmylpt4xr23EwkTrsYFg
         pca7dOmAvs6tfapsUGcySUNLh5KIn0XdQXABqeCBtFE8BNs11odQTVMiY2IHPBtIQwVU
         2LGwJVrritRNHbcndBl3vWmQCL0wseg0HFIt/Ss5qckXXGTo09Mj+KLYUKuV/OfFGNja
         CciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814814; x=1792419614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylCK8hYC7LZLZaR0wLbmkM5b7kq2nz3B1dnKXYSCvp0=;
        b=JU98CJlic8hdFbPm7HI3Ndy2HR6kGBwxNGLE6OsaVbZhUpLjBHll3ERh7nvbVT5pTb
         n0UgEAElalx/RVhxo2Eefzs38cgTa4bj1919aqB4UAQn7jQ9USHCqWEey9AsM0Nzkgl8
         YuBXzRcBPXwbHVrq8gAJic2MaoH+MZg7qAkVWJBMyvq1rLh57D2SWpdt1tWzYmpQrckn
         CeSzkpw8I0mUEY83vK5pnJYVIwIhVURrryG1b7Cyil789Jpcvc89RgrsN7RhgLUi5ZO+
         myjOAKnOk14ykBy2NkGYs0TkmTZMShtiRcsZDAMtRS2t+/6u7u9HgsElLCf4hvLufFvY
         ZrEA==
X-Forwarded-Encrypted: i=1; AKwUvBxxk35+P9OZqPuVsR8FFJCUTAHUfnWKa/S2V3czTwgwfrnzK8BbEIwbm0fpdjGHNh54SnB0/o0QCjBTwXZWSnQE@vger.kernel.org
X-Gm-Message-State: AFq9FYIVyl1WP1JI5fFQ+79pRhc82MjOHfiHHLmRqzRLrKBXm+ysX0s+
	7WnkuAnfGx94gsxADqiGpPVNyvqSGV8Y3FmFfmlIPhOCSlzlpbEDhAjHB08dlM7cGS+mK4zQQ9a
	2ue/0SywgnAi8BIIzkqHclO/2c1LVsG/XdCOwRCHAhXfD+9hU0+J8Wy5rZYUXZHABUV9SHf0X
X-Gm-Gg: AYBFou2Suq2lzL0OLRtdReelnUHG90R8BkPDT+BLDoAz+TFB6vA0YBCfAYdcbJlAMcA
	rzFkBrzAfTv4hn7SB9DhQz2PGwjVNx6mdisNUQ6bZ5/LaH7ME1fpOPGaS+4Ugqg/d1Gl80bj+Ew
	GrFJwdeKgTEkqlXvh8jou9SBXbgijZZr4otPSVjfAKYPKL0ndupFclVZhf73l8vdIPUCa6ncn1S
	4b5SqJ/3TiBc3wRz3ITvUaSasyu1ITyioquOqhcLYl7kpGYNpRnjBy9r1VSoR1kkF2mqSt8NgJY
	jX0vbh/wRXOwc2amj+UuyroBnFLteVA+XI3my0I2BePzGJPBxm+NOJlbq00vLwZUVLsFtcNAwv/
	Pcnba4yP2T7H0jwAYEnyBpw==
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr1904420285a.3.1791814814002;
        Mon, 12 Oct 2026 07:20:14 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr1904413485a.3.1791814813429;
        Mon, 12 Oct 2026 07:20:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1aaec1b9dsm2257054a12.0.2026.10.12.07.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 07:20:12 -0700 (PDT)
Message-ID: <351225fe-4698-416a-be97-df68b9297224@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:20:10 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: q6v5-mss: Fix memory banks count for
 SDM660
To: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261011-sdm660-mss-banks-count-v1-1-f4eced49b509@minlexx.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-sdm660-mss-banks-count-v1-1-f4eced49b509@minlexx.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accec9e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qC_FGOx9AAAA:8 a=ZEkBDfZtAAAA:8 a=EUspDBNiAAAA:8 a=BNY3paFinK7L0Tc9HpMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
 a=IqjDwHP2KxQYjTbYCZGP:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NyBTYWx0ZWRfX7aaIu6UOIYcI
 JofGrz4P7rhXs+AHVAAIxd+vB4/cMe5v+OPkQReHzyx36k4rz+R7jS9M1iuiBufa1/IY1GY4P1B
 9DML5KaAv0oG+b4x7sCdw23e4JZj1MoXnPxmvKG7ZJjj6tdb7J2AH+nbK1Uf1vPvQOj08Dwi+i3
 KXTLHjVKT6AxztbOBUUA93DhyLfiLPsTwjV+MaUbwJazF7Ceu1VD7dwWuwFwXX8+dnx4owxQDxd
 lbGFUt/VD8czU3B2I5/JON6S4snk5sgUqsHg5kcYVi3w/fx/MaCNhTQXumF03SyceAR1LRj1kpr
 z+hGzkr92tWAcSNV3Y6SuIYl6ZKauOqw9yIuvIlm7TcE5LLjCFGtjCKb1ZydIxv7cuO4qqhsG1t
 thyJdRcqbuMbftTQtPRU7gpou/CNWT8QgLq3U+coRDfZgt0kxvuIqk0g8IN519BlRdJGjkoExmV
 hQNEFMX1FfS0SspMnrw==
X-Proofpoint-ORIG-GUID: piiGH9mW9QRZUxbutPAJoz-YPEXoTati
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NyBTYWx0ZWRfX9Xc0oVXNtTwM
 /03Rt2kvxN2hHeYEBgI2CTIALMnzg+5bdme4+NnTez+W2zWdZ/cHk+Rvqzzv3LYgCmKEGFHFhp1
 /zYtQiplNCsZbN8QluRxDSV8Ky7kASw=
X-Proofpoint-GUID: piiGH9mW9QRZUxbutPAJoz-YPEXoTati
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120057

On 10/11/26 2:56 PM, Alexey Minnekhanov wrote:
> As per downstream driver [1], SDM660's MSS version QDSP6v62 1.5 has 29
> banks, not 28. Leaving something unpowered sounds bad and can potentially
> cause unexpected crashes. This was missed during addition of the initial
> support for SDM660 modem remoteproc, fix it.
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/
>     LA.UM.7.2.c25-11600-sdm660.0/drivers/soc/qcom/pil-q6v5.c#L508

The linebreak here makes the link unclickable

> 
> Fixes: 10b6fec2c8c99 ("remoteproc: qcom: q6v5-mss: Add support for SDM630/636/660")
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
