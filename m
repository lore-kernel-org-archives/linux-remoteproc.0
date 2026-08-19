Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84A643BDD0
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 10:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136724; cv=none; b=hl6tT4QJJG3kszCGBiKNaINL3TAvOdvxxC6zflMgbp7fM1U4DSeU1NIjjbzRH/Kosr0LXcl9W9Id2CO0aAU+ptMIChW0hH+Mn9F8pWppK4U1zZqedXv2VTrewIAmiugs2KsXVY7LI5/Db6r3FYssGNMSgGG/kSy1qMJAiXGNBI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136724; c=relaxed/simple;
	bh=eZ0qej2oHBV6IKx/1sSXVNwro3c8VHEofOO6SGvYrxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i0GTUOo/92qhFypYtbDQPHAkbD+UX+8oS3U0Cz+xOa5a/7xqTQcWpDB1RMSBLPJYhbW3CMft7hV3YyYd40g1rO3peZQ2+UlU1ZeyGY/fTuJ9fW2kpC2kAqKy4gX/igO5tKi8LEoMLXCFGa8mUAEQghEB+iRvN051E7F1E7dLKz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=etu+Hc3J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WqAqaJQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="etu+Hc3J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WqAqaJQS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8odD3730653
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 10:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A9whk8bo8ybPrkmKAJN2ibKh9YGInsM1ytDWUyn010I=; b=etu+Hc3JdJR41pr3
	phPugx/q+6UbdENAtdNixLqjbPDm3XkDR3zMxc46EuVMF7wBAzECtx91Hq6EY14J
	1LqJb43IWADRqdscK/e1PvhYv4Y8g+SrQNbf3hkQzBElgD3q4kdH+haqoGsnjo4i
	1dbw8y3tb8jtn6Y6O6GUgJKUd8eV3JGg4sskKATgMzWgVM0wVakISputcJvE9wVb
	W2K4oNZd40YMIGKJo9TuwPTsN9YYV3VfH2fUyJ00dEYzA8L+NyvfX1DxNukfFJhn
	bul7NHrV1pI++1U4UCfPImaLUv6cDiobio6vkpwAXzV0lFvZOGpSHjN9eoGfRfPy
	9WXjnw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmasda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 10:52:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e777a15so1464201cf.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 03:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787136721; x=1787741521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A9whk8bo8ybPrkmKAJN2ibKh9YGInsM1ytDWUyn010I=;
        b=WqAqaJQStxD+dRxlGu1E7sqUAguCqtORmMlY2xSue6l4pmFsVX4Q7M5k1jjzWkzCkf
         /3vsS5aUbmpsZDdvu8wSTTHKTVS7mEHkga3hj/uTuxwNfknyKbUGg+Z3koxahkZ4jD1Q
         wPB25fLnEJrL8IawNfOOwJmXdGkxt/lLfZJZ0s9xrZmYuvpwTl9GHem812qghDjQKQ0v
         1n/Hp0vjJ7NWxkM/x3xQ3nDqtbZOizUDMFEwbhRZaIQAhjkecsjReO8A6xX843fq0Dn3
         c483wrWQi7gLp+xv8syW7DofQQXjpMfarV1JNThuBICAJfEMcdPtHDFmnnIp49+rv1b9
         Na+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136721; x=1787741521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A9whk8bo8ybPrkmKAJN2ibKh9YGInsM1ytDWUyn010I=;
        b=X1LlkeUy7ajqdemlCZSYh7c3rDmHTcJDtkLnB2QDfm2xtVRbfftDIiq1YPrzrf6i21
         0GlF8PgZ6t+E7KUu+V3g1uGX6NeR9579YYwpS2uWQK3HL420cHpfsJ2ygT5tH/hjH0jR
         BoCqKfy0sW/mHvnAppspTmMtZMRzhA8+DSZmz0GC18c3KkyKXfmkS0RKi5l5HhF06+Tr
         hHXWvO9fyvUHxMSpZc3XMkSkqTIOxF9F6oKquuMg50A6L9J5Tq/QjbT3i53mYpIv5Sr4
         qkUQIslxlK7+aVqDzv/aisLYniiP+LKWa2st2wFpXxu2iCzMVArgltslUdXv99i2zy30
         EpnA==
X-Forwarded-Encrypted: i=1; AHgh+RpdCtqFSFuldH1g1CCPVWetC1abciEvyhEC4+gwu20/x4yq6I+F7YeGuIE3S9w2doMGC4kqx4RlyH6Y2Xzvj69A@vger.kernel.org
X-Gm-Message-State: AOJu0YwWnSXBtFaevcl+IbnpronxGr2l2Dzogy2jI43Att6bxPkAaavW
	9lgniQyZnhu2CKdyZ6hsV4Ay2aaNvhB7biPsckp+spA9q9etqRrS5vHvl5SDExDUYv4ABf57s4N
	TGMDD1zGrblEx3dqON1h9NGS+XkQQzk1UdH6z4agw/DiHh4pt5/e6Mh98ZYzQiriEOTbSlM10
X-Gm-Gg: AR+sD12q68EaO5R6G+DA/obnq5RsKwjBiGyYEUcTQtu9nLXYQR9XHysad53hOX1lXTD
	vVBjv9/LQtunguQBhl+M2HufoRHTEe48z4dxA0YEslqSWoaLL2nERy7EKFhw7TMU00+j96Ue27R
	qp+CRnh2wT/SFSA6PmDEMTllgSw0GgHW/OgKMJ14f3uznyRhV+gNuLA22Q7ZY2a2aUlpGaKibKy
	ZWuSheyr7zzkeFTnImr6T2dvqcGeJnxNM/xODjlTMeeMAti2YnOn2VtGa5SuUSiJ0EgFReJHiaY
	zqTvhYFP88He0XQ+FGXEtiUhUYZgMae2ZTPRojfTOaEpHp4ZCqehdeDXZLCKnwhXfIhnHCF5ckp
	7Zx8a3D5bdeIzwHbwvi+2u1Y8
X-Received: by 2002:a05:622a:1a82:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52dd4de3db9mr23244501cf.0.1787136721211;
        Wed, 19 Aug 2026 03:52:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1a82:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52dd4de3db9mr23244301cf.0.1787136720708;
        Wed, 19 Aug 2026 03:52:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3fec280e9sm715974a12.0.2026.08.19.03.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 03:51:59 -0700 (PDT)
Message-ID: <2d426f18-08e9-4fcd-82d0-c06daec40a28@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 12:51:56 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Fix error masking in
 qcom_pas_stop()
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260819-rproc_dtb_fix-v1-1-cb6be7f93bc9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-rproc_dtb_fix-v1-1-cb6be7f93bc9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4MyBTYWx0ZWRfXzwIcx+GROo+Q
 +wjhRsnelhq+7JQhHPzsDUae+J7bPlUap84vj9aU1QEP8y/zx4PPUZJb+X1SZaRldkqXLDrJeZ8
 vPE3eL/TVBhPtz+PXSG7Zfwz4XNLySfxKx1BE4oLq/fqXL/H7Du8dfYvYV90OFoYw+LcVOEnwwA
 tn082Og6utFrzum/a1oBCxfvW/Q1m9Wi6YgJ2DlvsQ2gb0B+7MfseDjXtDVruisxpxYVyrN82E/
 L2PeB8K9kCUCWGMjvWrxYx07Pl2xMsrcO47ypX0Uz4VcagACF+SJwdgcs6vmTeBxrINXahYC89V
 l9sUjF6nE2j02Fj5+0gYBrvDKi2ptuINa/YMsxRX9rtzNhefYeX7Jk2mVkjlxW3IpGBfb1Ob51S
 iGKJ5McYSX9a9fr8D21yrXBhCm42uRqIE1k0zijDNTm1AjTRDzOSFlW3dz9Npaz2j37XDOYMbpM
 QBozHxzq8AhGGSY4fyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4MyBTYWx0ZWRfX+vmOWf62MZVD
 XdtbOtRl2hPK8hEQMPpLRAj4gpBHiK6qT2+I/pkzj6BF8sEh+LR9NRVf7A5iC22QstkV2akwHLd
 9+fjzn/E+bWtuPQE/XC28f0q9bV75kM=
X-Proofpoint-GUID: NoxUVAf94_qS7TfNLVQEdo84sj2KWv3W
X-Proofpoint-ORIG-GUID: NoxUVAf94_qS7TfNLVQEdo84sj2KWv3W
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a858ad2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dFXGKhbd_zlHOsaMqXIA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190083

On 8/19/26 7:30 AM, Vignesh Viswanathan wrote:
> In qcom_pas_stop function, return value of qcom_pas_shutdown for pas_id
> is overwritten by the return value of qcom_pas_shutdown for dtb_pas_id.
> This causes errors seen on qcom_pas_shutdown failures for pas_id to be
> masked to the caller. This might lead to issues where the memory regions
> locked by PAS, as part of qcom_pas_auth_and_reset, are not released for
> access by linux and rproc_coredump flow will end up accessing the locked
> memory, leading to an access violation.
> 
> Fix this by using a separate variable for the dtb_pas_id shutdown call
> and only overriding the main return value if the pas_id shutdown succeeded
> but dtb_pas_id shutdown failed.
> 
> Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
