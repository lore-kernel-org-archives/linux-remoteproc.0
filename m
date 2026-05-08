Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC0A371D16
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2026 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224466; cv=none; b=NLjvo/g7NuN2PGyM8WUShLlx+DHC4uJ9jtjtPFLreKsYH6/C1eJ8h1y6qz0pil8LbcNGExotdwjUMjbiY+TrzQSRxx34Vpu1Qex478Mn/3XtiLvOhyevdJA4d+hMIV4BS7Op3jDkBxwUeuzpLNrFfPEtII6HoZBzHcFgVJgHQnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224466; c=relaxed/simple;
	bh=msbctxBoZmuS/F4jhIkGgLNMRMZ7w5FEKCHPbLLM07A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N22/rhRtp+PAtgWhofAjPrSdUxm8e6ilyDJaIguRsQ0OsrXPDSXjpHWeR5RsCBH0QGOopcevbCNlIWA7ctvO+cNiDPXW6apQpoBRUjSXUfQ+M/mkMckCQ+is6XuAWvSuYAU0i7Y+lQTvCTNofwr3nhc57FunM5pbYINbxuhqpiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNvSF2hA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKTyRHXe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNvSF2hA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKTyRHXe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64816YDw2384376
	for <linux-remoteproc@vger.kernel.org>; Fri, 8 May 2026 07:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w3kSoJruJXLM8bW/sjer3Rq7RmeKRWg8kDV81DFxbUA=; b=dNvSF2hAOCPkxIfu
	7KNM2L7kdpiBpelwEKfIJ0sN8S8psi/efDbQFjzBkQCnrN42PQ2u+1G0Xar3rEY5
	jQeYlezhHGA5qxVz3q+Jb57lK/Kfe+MHDnCw6/qU/CPVoZY/8slQ94L/XZHTXm/a
	IjhwfBcW32S/Dd1ulWJASr0HVFXfFAjddz2hVWKFoBj0qVWmrEo2X7fcQVYVcwu8
	Jb4a48TGf8r8CU3uqGb7gRuTfPWsZCO8/WNTXH3aXxt7mPbIFW7E49jN/1qozY3C
	Ia0JLPh6siy5TnKEliRMZkyg/1XcUQ7cdTcjW3TsBTwZFGS+kRDt7kq9BVBDOWF1
	w0iawA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwujwaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 07:14:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b461b36990so20620765ad.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224460; x=1778829260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w3kSoJruJXLM8bW/sjer3Rq7RmeKRWg8kDV81DFxbUA=;
        b=jKTyRHXeAPSu0dHRXbTQ/YxFaIsUkYqchG80Y0b+45L5yWFm5GTVuZwDH7KjSSrZRo
         RMzTvABTuGhIKP4xDFsG0W4Fut8t2BgCCZJUjrwwJtrAtuQ/QtPZFJFL/wqnXpVbtBoq
         MVYoCLatplSYxhbrcj8deqmh4hqRliC1DZww3YsYI5JkYmWHDoMjWZxRpuqhghCn01zq
         iSPfSlnbCvsyGRAu24N5yS4MCqcvdGueaSq1NluLnO92d6ox3ZfHlzYgsJASva/Gyb47
         WLD+mVleW/aWKJZLrkyptgYvOklAH1ztncrm0KUwlnHtyoMV3phRt/o5OKBL9n6+uIoW
         Q+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224460; x=1778829260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3kSoJruJXLM8bW/sjer3Rq7RmeKRWg8kDV81DFxbUA=;
        b=V7eWjfyi4v98DlzoS8wSGN+YmeDqfyobeFnzR3/Tvc8w1KVfr2xwKpgztfougwBLB0
         lx8tGi5g+N1OJSU/wWhlcuYnvobUWthKm8bc6NQ0d2Uc70R0XqJoAPg597kpOvVs3dhB
         6e2Rg2BR2i1TUxMb9Re+OoSrDSuExDZzzsAd4+agApRatfKM7t9rJM8De817pe/SNVwV
         I7sWIsUhKMN/Kf1tVY5U1Fo2mRStJoZe0JPTCVSYhJhqWI5pvUIBN3RNGrXnhx3fYt1B
         mCM+ov7vmHkyPekRr4FqCPBUgD6JZAI4PTYUmA3+5KN55hiKyCvIfDBiVCEHoeqolVx7
         Ub+A==
X-Forwarded-Encrypted: i=1; AFNElJ++J3ntte7bVgoQ5pIKicIdnbIAGGGVFSzmc29LZ2K0IGUKYZ8F6PcU/XM52CAGRAASxBpYe8HbZGpEzB7TgQ8t@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhu6ctgGOzOCYjVPWL8zwyLU/vJRLMJyjddfdCdWvNbMVJCNYI
	m0V8NZpZ+VjygVuuuz9SZJdIHbfw3uCsXFy491yQVB2NFtLfuRjMd4x3LwaDcQl/aKIudvfPm6V
	TJ3ee+GMvdNn34bBfbMzidduCrd0ZPtsU5FS45mGHE9YA++GCr7BJnxr44Q+lwitmQZpAuFUg
X-Gm-Gg: AeBDiet46RndvWgm2g6h68yukhyVhiBc0LDJHnjhqDbVDLbG4fVB5EHRKYX5Uklc4/L
	IZPtsPpyA4Sae/XVzlRGK0+xkbXpGOtKW+S2VWgFa4IPv/FJnV4+fMcdcrmhqvPyzQLSQJo2Bz3
	9cma2AqY0RWRTJJ481LldunplpTTuEeu5K68nzsdImbYPi0ii2Hfqb45xavalpemfUrzjMb4f9i
	+7gJ3euRUK4QX8Mx5NE5yw2BWfRxHUuVVH+fWGFvjI0vnelnM/AzV/ugJ04P3BG1aPvaV1MhiIP
	fqAOwtljL2rpIbO26/3wLzdy0gwxaqjJdpDz1OMmkAdRvRo46YTMaSw/dK5CYgZaKCadhuk7YmH
	nQTAtEwnm5nnexwKmTGWtlqkRwIuBtjfbC1ew2dstUfzqKzHMsm7eUTf2iamY
X-Received: by 2002:a05:6a00:a203:b0:835:4447:69d8 with SMTP id d2e1a72fcca58-83cf6a3a65emr1825142b3a.30.1778224460540;
        Fri, 08 May 2026 00:14:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:a203:b0:835:4447:69d8 with SMTP id d2e1a72fcca58-83cf6a3a65emr1825123b3a.30.1778224460001;
        Fri, 08 May 2026 00:14:20 -0700 (PDT)
Received: from [10.218.34.110] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c86b3sm13798490b3a.28.2026.05.08.00.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 00:14:19 -0700 (PDT)
Message-ID: <1560253b-bd4c-493f-8ad8-3e3be3f49f8d@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:44:12 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: mailbox: qcom: Add Shikra APCS
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar
 <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
 <20260430-shikra_mailbox_and_rpm_changes-v1-3-61ad7c57ef27@oss.qualcomm.com>
 <20260504-mighty-fat-deer-fb7ec0@quoll>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <20260504-mighty-fat-deer-fb7ec0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4aouqeUAVKAMyhhYjVKzYUiMji3VPMMy
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fd8d4d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XHbfe-6sOlyKm2BVlikA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MCBTYWx0ZWRfX2YFkn0n2SSMj
 v23KqGL9AHj7nK7rk/Am+l/22FOe4My5/6u5h2xI2bFV6K5jYqJqEyMjJBYhsWK1qHUDYcz5ios
 U7Ikr89mL6O97GGQ7U6v42vilQLGMs/qtBWF8zx1KXYP6YPz41axs7Bzl1VkDN1oWkLpg7uJKMz
 ygRRnspqRYd+9RD2oz/rqxvWg83ADr0CImNqOPsrrqK/2jaVYNcgQu4CwaNn4IPJUg4r45hyKzj
 yTrGwhmddJUO2UzMBjAOM1NiUN5K94S0FdPr+gTlPhHjAe/c0+1Y/WO/c2PzBMF7Vn1hO+wjOyA
 c9PZfetDHVUKD7jD2GyiFHDn/P4UY76ABknFYm8sOJV8TREqPxKkvFdZutxPCvvCn0bsAtnvyzJ
 OsIPm4IMa/Ig8VcQgESaEL6n2q/3ND4OVQ74zIh6abjaXaoLOoQqM+GF9EX7KxkQZR3ZAYcPd/Q
 sJuxaTDUbLH+h+Xodtw==
X-Proofpoint-GUID: 4aouqeUAVKAMyhhYjVKzYUiMji3VPMMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080070


On 04-May-26 3:26 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 30, 2026 at 03:14:58PM +0530, Sneh Mankad wrote:
>> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>
>> Add compatible for the Qualcomm Shikra APCS block.
> Here you explain why it is not compatible with SDM845 or other variant.

It is actually compatible with it, apologies for the oversight. Will 
raise new patch version

to add the compatible under sdm845 group.

Thanks

Sneh

>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
> Best regards,
> Krzysztof
>
