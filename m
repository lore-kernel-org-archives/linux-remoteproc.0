Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984806;
	b=hBlNLqe0qm1GJ8LREl7sXwrGKPio/h3Tl/4OVH6WISeAUfyHTnJP0X/ZOm2bv3QsyHCq
	 4esmqq1qoZu2uKd19bSiXQYYD5RkFxUkfG8zarPVQnpZCr42N5l5p4VYoINZ5kBJ2Z975
	 zHg/cclMRTzPfMtZMZxlumY4BO+ppPpSGdpu0HflCBN/fETe3WDEAITEtz0XT86DCEfDK
	 u+2BN40IIJLyV7Pmj/ChJjtnFkTgudUni+CbTvkAd0Yuo6NMBLl+yfutK+AReVWWQCoRQ
	 5wEBva43daeMJzCaxGXganFexbBUeH58MEsJTfdZcPN7qtyRl+4cpXyR1KVnyJ5stJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=;
	b=Bf7PPgHa9J3J6DD/qtsGO1dMSSvCo9S86AT7dUstXRt2QLGSkWTBfXNhrfbyAhaZMOsR
	 1TnGmb7p9W6YpseNzFAIA/sp12BCGHkZkY0OVaaqOpL1WE46HaqiEywvXtg6ro3z7jC4h
	 D07oN4rTN6XGXr1ZEyzZJquTG5qIIto17n61XWApM4L5UQWzMfoU4WfgxtHPEBtsq84Kj
	 ingSQrJ0vhiPr5YoVap6fI4d/GyL/xU28Psgsf66PtLd4jT67kIsFtWz7zz+GO3CvUbiL
	 iwoyCf3OGQ7H11oK+lhb5wPOSOuvGjakX7iL136RleuPFFWbcbg5UTZ1P2rOBwfHI7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jq4DSUUF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JaLSpv/x";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1D3606A32A
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 06:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED1D3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jq4DSUUF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JaLSpv/x
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uv4Y472516
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 06:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=; b=jq4DSUUFY4qxxOrO
	4cjBLfKTqSfNpHioraIwZA/NG20jyjWPuZChQFn3SQR4So+HwXPSDOd6ShoMD4u/
	FBRMf4bqzW08Uj1vKVm9oeBvo71ZiXVA++lcNJMDKyYzYWrWybJMlWpKucTKl4TR
	hwFWWAdX/GCu1sAIT7p0YcbTzFopnUUH+4M+qQ695xYs52CxbYVb5DdGXrS3KHBi
	+QO+jA4KzQTGVXWUUTu+jXb3JPsRaalWmJNb/xey5GeCVTnUWgkmwQhJ7rbPVNoN
	NcODiE2NpxB20GUrxyBuji0szWjXQfcvxosu9G1ZEh4W0rf4CqK+bBPRsH1qp5va
	IpTWPg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv89mvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 06:53:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso397240a91.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 22:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794984804; x=1795589604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=;
        b=JaLSpv/xrg2YmBQiUtFOPprkGLhsS3x+c9oLIZPMOT+H5ujgueHPV4DO+XHSRSkN17
         lH2Mi2frCktdNJG3/s2hHXfbC+VdJWziDr3YgCz5FaEJGQ8O+cdLIlNDB3DZ7rX16uJQ
         JdAufjmeahSAvBtWqWsbq4FK4AkV/PjDSarydRQFGZQTYX6eoQmwOhKDqkSn0Zdwm9Ts
         bUzYEslGC0KdWJTQRK/50P6Z1sSk3/fM+Qp6wi8Mer4/MQK007TUUDXGGdCse60fMYEU
         1CHx0KkTWLwx5W8MlRxu4woExnjfb1Al6vQlyu0t0ETZoXpuNqS0vheWW8N7iiODJVmy
         p9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984804; x=1795589604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEUYLKQhmWgiSOqECsPQjbXJYCWlUHA/JEJFzARsK9o=;
        b=lb5q00Loelb23WfgEMo11SjLPDt9tT01ioPwGC1OhPp0LSnhwQphvcVpEvBA712pyw
         E1FEqRJw5mSP/n9E/arD9DmcEGcmvqVHDA6Gt0VccSdedK3Y8MGIKU2BnziptElCipue
         rUTdNY5zBCZshPH+6cCBu8eBkpFzoE29HdTIsXJs0vXCsrjrszUZGRPJAfq2nEu3tVLk
         vEAIw8Z72JYx3jsofez7cufLQR9uQPXA7oK5q4kUmNUXTLPEkc19nKbctAQmjlAnISIG
         0vDCT+CYKcmzMaiaOZkzACofOC1ciCyFe3hsq/wYw6DjyNzryBtVANGXyOALbZV5ZdaS
         IeVA==
X-Forwarded-Encrypted: i=1; AL+hErFFMOcm9rTaC6nCgKU1RWtvZfNeR+gdj1OzChiYQY9qt4qPYqmNMtI6p5JltQDlsnl/ib7Bky8z3KEXyIIJj0s9@vger.kernel.org
X-Gm-Message-State: APuU4Z9RYGWcI86Vlfhb2RoPbmMxcuxqv3BlrYDtWFAianGlvi8PH1FO
	ZUabf/MVJPl7pp7R1mDQS2MqtexAAooHitFGkHT+uxF7PaV6jstY3dJlyQutE7pHYHH7EguChrg
	7ME8NF72c7MLqlVDL4TD6M/rhBYzJRKiv3vBQmZIyuZKGT8gFBh8Q5x773/U/jUJlKhnrJr1c
X-Gm-Gg: AZFdTZemd45l7TBZfee99EMIImMJRWbaLJmptULCJyukE4PTMcIFXN0/9pP9/KHhWk6
	JTXcWizoyob32Kzlg8gXndBcIDDajtS9H5nJmnxr2ZNYWlhspkmiJf9twIIRF2ph6TVHDDph0zA
	YpVHJcXXd4iOzmZzayQAubakQXg4g8y9IU5sosjevEoZ3QB3euxol3nF/JI/C+a98zv66mGKEzD
	VM+IqYyiUFBnyqgWvaD5KuPVX5fGKj/jRG8QP8JvxhUYNynkruTOln1L6lbaUDN8vAi59AqS4tC
	IQ+lkJydqG3fllwPqDcexQqjfpsT6z1jsGeVZPfVGde7/L1oMcaj0rpUdd1OiG2k3EMZ10EAGQD
	yj3qFadhx/vSOHfVvSHw0ovJHnc0FdKBjCsWsh99J1AEbgVjlsNGz9hF/z8vQWPMs0WYdIkPiSK
	Oo
X-Received: by 2002:a17:90b:4b12:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b3d07a5319mr1630666a91.43.1794984803788;
        Tue, 17 Nov 2026 22:53:23 -0800 (PST)
X-Received: by 2002:a17:90b:4b12:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b3d07a5319mr1630645a91.43.1794984803323;
        Tue, 17 Nov 2026 22:53:23 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4ddecasm7774110a91.14.2026.11.17.22.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:53:22 -0800 (PST)
Message-ID: <10c3be7f-f329-4612-a7bb-c033fab6f99e@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 12:23:16 +0530
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
 <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
 <20261116-boisterous-ancient-macaw-8cc00e@quoll>
 <20261117155208.wbnm2hldjrfomryh@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261117155208.wbnm2hldjrfomryh@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3sIpoQ_1HofhI8kurP2ebVVqQlEddWPt
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd4b64 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Q45aZnUg8FDEnReNsB8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX+28IlO2JED4p
 pWYriiursHHutXbIHiQ3tO56zuRzgj0BNfPmx3uxNqDR86PAHx10ZRbb7yImt6VyYszAXgKXYc0
 yCNUws63xUQe80e16HXWE7x8IAkt29bZ6r8Gg1uk11YrVEBW8Gs/oz0g8r30g6h2aHMPLx/JOyO
 EbPnM4Q2g2G6SSyJPRGzcCUPArWNQ948xmp9PYWq8PBghIjYHrrygm7XwJczs+DY8ai0nLnFFi+
 2Jw8gBIfXyifGEIKm1Y/DyAacw4urrMtEb/C2DHVokb7N6xZ49yy+2m5NMLO7cTLDLHHR55Q/Oe
 /ibVAPvzMG314qwptD6NkBdZ//k7H0yPSMg5Xfegg2PHf8sSe3xcxCE42mpS/PUTF+yHQVWsIVp
 uJT2ZEH3l36BMRvxZtODW5O1+86Rcm97mz+V1sPDTidb9Z6I1fSEmFTuoqGbjuvvmpsdJqpYf+G
 AbzWr6962nmY1hg33+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX4YUBobuii0z0
 jhVtrIDPjNlgc3Hi34HhQABWjiTyKVMU6TTG2n9nBs4yJSqU6S753lfBfsCx6sCRV/l87RAVK4a
 UFcbDMwoKX+tSUcezrQRH1nDTtlRFCY=
X-Proofpoint-GUID: 3sIpoQ_1HofhI8kurP2ebVVqQlEddWPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180027

On 11/17/2026 9:22 PM, Mukesh Ojha wrote:
> On Mon, Nov 16, 2026 at 11:58:20AM +0100, Krzysztof Kozlowski wrote:
>> On Fri, Nov 13, 2026 at 08:02:20PM +0530, Komal Bajaj wrote:
>>> qcom,pas-common.yaml limits iommus to a single entry for every PAS
>>> remoteproc, which is too restrictive for SoCs whose firmware uses
>>> multiple IOMMU streams.
>>>
>>> Drop iommus from common binding and let each SoC-specific binding declare
>>> it with its own limits. These bindings set unevaluatedProperties: false,
>>> so a compatible that does not declare iommus rejects it. Declare it for
>> I do not understand this sentence. Compatible cannot declare iommus, but
>> anyway the bindings do not reject it.
> @Komal,
>
> Yeah, this patch should prepare for the 2nd patch, so ideally this should
> be a no functional change patch. Any constraints change should be a
> separate change. So, ideally, this should be removing from the common PAS
> and adding it to every SoC PAS YAML that inherits qcom,pas-common.yaml.

Ack, agree. I will update this accordingly and keep it as a 
no-functional-change.

Thanks
Komal

>
> -Mukesh
>

