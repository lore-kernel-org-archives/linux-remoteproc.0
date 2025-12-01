Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF3248898
	for <linux-remoteproc@vger.kernel.org>; Mon,  1 Dec 2025 11:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764588083; cv=none; b=exOu/cwKaBRWss3AP1RYj+cs12jyOFgepecSfROQ9dMA+n7kgD8xDXeBFAwXj1IV+T9mRYjx04fF1NtyaROStUY5kmvIDXN2Rsthoc0jLS/9YYRdw9fg774L5ZfTD2vMLcmuJECGlTlbWOhmRqfMiCKWorXT5MLarqgohYewYI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764588083; c=relaxed/simple;
	bh=YD0YJ9HvSoLZZzea3XNasdXv8ze0AMingpPyYiOlaNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBJUcG0Jfg0cd4K71vyW6Otas5DTd//ZRIYXVH518Y5B160iGvhc7PtXAzdzmZgL6lKVu/nN/ipgsi7Pxb4tDmv89//njd1PvZWjO0FZ0beId0oV8fYnS4C67C6c0N1uETO8fZXyhk/Yu1bw3AlCLR7AvK4GWonhYv8mqDz3AyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NA1pnS7p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/PuXYwJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NA1pnS7p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/PuXYwJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1B5c8g396696
	for <linux-remoteproc@vger.kernel.org>; Mon, 1 Dec 2025 11:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G3bOBTmGUIEwbzjj47DFpcXGtd82H4iVGgAVk5W8lVY=; b=NA1pnS7p52enIH/b
	J/8GvWjgMKNseWy4dABCKFcqdI1R9o6m/HIWLZyl9Yyf9VZtSl4vUNT2WIK0sVi9
	R9vnN9lP6umHIZRK3I+97iOfgJRtPlz+Zmxqu/vSDDStROlZpGHP1Hyda/a2B5Zv
	x/wB3+GjlWyy5ls4eGV/0zg4M/gWVWJymdpuEY2MJhQgMuZlXs8goQ7Zuev6q2zp
	xjRPrB0CuprwVmxglf490YtOM6fDgcz63AeqArcYfa8V5PNm4gFirGRUoF9Lyfub
	mPlrCHGEMI4KXoGX+7x5jBtXKbABsanrn+2K1DNMLfh/TmgQbgrmVqSTFvRv/cm1
	R2DIaw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9ug019n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 01 Dec 2025 11:21:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed5ff5e770so7271381cf.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Dec 2025 03:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764588081; x=1765192881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G3bOBTmGUIEwbzjj47DFpcXGtd82H4iVGgAVk5W8lVY=;
        b=Q/PuXYwJRt/2HlUqEJqYRA0s0kheDOiOsvhtg2zA6bUCBgluuOHj4L+SC07eNXLbvv
         VNXkBW/2q0kTwJ2iHl4YU2IMpfEekQor5AVc/WTodaWzjw9m0X2ZOKHWNQYO9BsJLWQS
         JULDZm041hmSsafVHQj5b3I/gvppPSf+8iHGjZzMVYUNb052Yr1DsUJv13j5w9+9AyWX
         6QQKmI0gEW8c/Dy0krJkH8HPfChkAsdhJ2nKCMxXqgXy0m9UdwCkmCKtevj+2J+Z8MRz
         otyOeTpWeguf9DmZxV9w20F2WAyV8t2QKYglVd07QGc3feFWYhSl+7B+hszKxdTAPJ3e
         seBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764588081; x=1765192881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3bOBTmGUIEwbzjj47DFpcXGtd82H4iVGgAVk5W8lVY=;
        b=oPSTlmWKHHlxysDjTK3L5MTHXtlfOK9ersYjsRgWLdMuyEQHliGxJjiWBLiht9R88o
         kql4pTaMpnmszorbZCbJfltwBDUl5Ca+FPEIIeCHcZVImjDYV+W+tGR6E4pwSmluN2GM
         S9MnpquUFrOHxnL7yem+OFsQk2MIENmWdV06Z0/SaCRj2auhM0csS7sqj0a3e9Q+eY8y
         VklnQqghvdqZEAE8XEtNXRpXBTA/M+22ld06QmL5Su/L9GmVdOJxQEjP1uoV4uoKPYyj
         KLcfafOUQ1CFk3mZnIx5PRuWhZPLAWixrSv3pb9nKotq631RxGzYC+pBM/0W5RT8WPBG
         kcyw==
X-Forwarded-Encrypted: i=1; AJvYcCWO+5MPmqyhFKMLzJK6UJRwWZMVcSZpuB95btReL7JStr/w8yCwqNajbL0frJbsJj+6mBY8NdLdIPUYd/ze4xSS@vger.kernel.org
X-Gm-Message-State: AOJu0YxqiWACr4ZxBIVm3/li+Q4zh1BV8uS+mxowF4gHloKBsJoYTdaG
	mQTb+UhFlMa4XoqmrCGLT/Bn5YfqZDHk7RlMB9V6bnkXa9J6STYfAR/1k6BZqS0Li99vYGLiML3
	TZfWza9w3WRx7J8DCH2GpRZCiwSP+YOJrPPsOi0ELO6HROOF7tE3PtfUqnDRk3rAVp8XPmTsE
X-Gm-Gg: ASbGncuOVtNBKOxdQMXK4q30/DFWkgMq7TAla1fRajjUY6SxACMGwarSj4HQ7+gVAYw
	S6PwcQxBpNcfTrYobwfw7EGTvlsrgMpiInGAx28uY4xh+fK4n8PQmJw23IwiLVe1PM6GpGbpyGj
	X5+usImMxY54KXg5bxrAr6mqm6Z0IP7svQMDh+0Fes2C5qJoLPGNu3dhe5PPnf2GX4IdPxwFkJ2
	9BAcbmnMEN9ULldaLopYiJ8lgpCNKaVAdM32FZ/ULkhxhCUHJQc9BhoxWxElWyby8B07ORzshV8
	MgDKU1x30ttmV6Xx2sFWJ/i3kN+aBPtpkWWEWjOyhl4BfFZnovOgzeBnF+zCoFFTN5bJlfDc74j
	UYpPLLs54SBaSUA6gFbgkj2ZGFfl6IyyPQR08F8Hr20egiL9O9K0H7vwslGAf3TlfoG0=
X-Received: by 2002:a05:622a:1a94:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4ee58850870mr381633791cf.3.1764588080713;
        Mon, 01 Dec 2025 03:21:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4Daiwb99EGLmeCbCDCUBwe5RKinrQ8tsfULHSEtl2z/Bg8BjTO6lnu4VYHpmxvBvjIx1ZLA==
X-Received: by 2002:a05:622a:1a94:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4ee58850870mr381633481cf.3.1764588080319;
        Mon, 01 Dec 2025 03:21:20 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8b75a2sm3601311e87.45.2025.12.01.03.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 03:21:19 -0800 (PST)
Message-ID: <1ba66817-42e2-4c63-8a94-d2e5c9cb8c34@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 12:21:16 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_wcss: use optional reset for
 wcss_q6_bcr_reset
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org
References: <20251129013207.3981517-1-mr.nuke.me@gmail.com>
 <20251129013207.3981517-2-mr.nuke.me@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251129013207.3981517-2-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA5MiBTYWx0ZWRfX9CvA1Yn899tK
 kT5tgcZzXPPK0K5328YxoC1sUpAoENXSn3055NtsymLFg/oHMIPGZfGbXSLuishNyH+wPJ7Mx2+
 0Ob6MF1Isj/NJ5JJhkg4tWV5QJJ1/Am2x0cizY9VEoUMvRUw4wDcPPCzx0D2BqdpI5ImCQZQWeF
 0RAKNLztS0uacWQUkmIabdst1uWPvmzWmkcp7HeSAAOgU2M5KqfPoAJdyebUZYWTpVVMFSgBkls
 hwj5ttjHoBUma4ZxOkxe459vtjyiXNWtyHEE2kvOuEMkI+iLpaVfpMeE/ngl4bR+zFqn5qs/SyM
 bfmi8KV2GBlUv2MHPUHQnidFrUcRl4N9RAA3bLQC69QuZ7Hi0VsjPv9KO/jKP3v5phZCgYIxXar
 1setqRx/i8caXtSd0Jm5H/cDlcFnUQ==
X-Proofpoint-GUID: VmPWV4sCR-yyPEsKXc5IoxzrFNvG4rMs
X-Proofpoint-ORIG-GUID: VmPWV4sCR-yyPEsKXc5IoxzrFNvG4rMs
X-Authority-Analysis: v=2.4 cv=EunfbCcA c=1 sm=1 tr=0 ts=692d7a31 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=LjDgd8hjRp8BARONj68A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010092

On 11/29/25 2:32 AM, Alexandru Gagniuc wrote:
> The "wcss_q6_bcr_reset" is not used on IPQ8074, and IPQ6018. Use
> devm_reset_control_get_optional_exclusive() for this reset so that
> probe() does not fail on platforms where it is not used.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

This reset is not even used (or documented anywhere).. the closest
I can find is "wcss_q6_reset" in qcom,q6v5.txt, initially documented
in:

Fixes: 3a3d4163e0bf ("remoteproc: qcom: Introduce Hexagon V5 based WCSS driver")

which claims it was made for.. IPQ8074

Peeking at the GCC driver, this reset is most likely present as
GCC_WCSS_Q6_BCR

Konrad
