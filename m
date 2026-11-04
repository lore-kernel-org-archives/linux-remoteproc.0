Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792142;
	b=1sFRMGfkXqIWf697151kjWOlrLetEjkmXTAskSZgTI2FR3RCiAn6msRv+qogpBIHmorv
	 h9riUQjY7kj8YjXY9vIFvlkKP6LGYHEZ83ONN4lC06cw5KtKDFyD3SienjSHODJ91koPB
	 uRslQMq/1c5SyQsE0DgQ9tBqVupMvHzs+jp8cKoT3XUS4jikzRDZvaz22CDhihaEeTU/Z
	 7O+VVwRp8YpwuAJwc82UQ8jEthoOVlc4kHsIYcFXN4sXCiKcX294PfunO3baEBaDcwA4A
	 qd7MKxvAfurKtRofL98MRBYlq91mPYtu4YWxCWy1OrTIohJj3Cm+x2yVol0Yr6Z9LLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792142;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=txitwvcbrK3UUlmG/sF+VNbr8sls515kGNNrpbN6uNk=;
	b=uq2T2Tx6NRNLD7t9swpupudrrN0PguQSW/p9vfMsr1uHeCdsZU7igFqZJ5+zRP7l3mg4
	 gbDsoeRHdZSgF/GQwporRo+AC9g1uDprGAcLTPlit+rOwzeoONTcnnutStBbHTZKn3ZYz
	 77MuV4vA8TGtSm8kVzWu467evaJrafYphmrVqRuebCjr1LdsOg+S++EwAFPcFYSK0ziZu
	 oC42f9kf8CuoBDybLrY+FvyGV5UIPX2ZdxzUQdJ8g/jXI7oEnyZL6AXEVE/IABAVvK0b/
	 ANOezjIw64BY343s5NFvxTY9ipdfTkODeaUws0FW9Ql2579Q0Q6hgtWLv2WDPGpxisA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ck02Y+UJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDuh9B3F;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFA6606A31B
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2026 11:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CFA6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ck02Y+UJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDuh9B3F
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4B5Hwt2217487
	for <linux-remoteproc@vger.kernel.org>; Wed, 4 Nov 2026 11:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txitwvcbrK3UUlmG/sF+VNbr8sls515kGNNrpbN6uNk=; b=ck02Y+UJvwJSSmFS
	M55HtH/FtnsUGn9Tbee4EBYAz+jiBvjtOuOhvidebv/aZCR4K9F6bFyWTu6Tsg6q
	eliAVRowRn4LyU93XUJbaX2uTm6MOITccmE+N5GYNH/sp8PrnDIwCeitpIME8rKR
	sT6OFiTlqGJRVoamGQ0E9B3f9UVC6RklxeUyjcyRQnCnclYS9L1IXK9Y/271a4tC
	jwTwMQX7G+KkBv2ulIFSZmN/ql6UJ5f8THjzCGWBSrvEMD+8ksvwo2mOfr7Idd4B
	Vw4cytVN6dqxdtlS9Wit2Q89X45rz6VtcI5TqXAnKanyuOfAvzqPYEUmfJAaXCAZ
	OAIliw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284redh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 11:35:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e93f67358eso5977075ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793792139; x=1794396939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txitwvcbrK3UUlmG/sF+VNbr8sls515kGNNrpbN6uNk=;
        b=NDuh9B3F8w0RRQbk4DOFCTn6/pF/Q/Yc63kQVlkQXByE6x0t7x2MSnPnWfoOxkGSQF
         dF0UiccXhotfXe/MF2aS+8uyapCV9O2oojioOQZ+UwjoQSuZoI51pVqlKPeOpsr7iu1s
         prslK+7+tIp6F0Tb9Oxhl6xfmUkr0VQu+Wa1gGJUcH3e5EIO6M/qmSuFcw9HrACfCW6y
         c8HYiPqMO3V+IGm/z4TRhT5Eahk5zVoDME+6IoaZj9+oGkTuRCGDxudetjDRcv5Mhypi
         ly8WY8VL5Qw8uV5XRrNPmNX/2B0trrXe16JJxenzmNeYPbHcX5G33FUuievp81LFLZa2
         Ym9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792139; x=1794396939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txitwvcbrK3UUlmG/sF+VNbr8sls515kGNNrpbN6uNk=;
        b=e9EPHQhZ/mPzH6VwQuxxRGPpwmCbwqzhfwRVAqy/RP2TzylrULNrbuCywU7eF5UZIh
         eU4cjSRmjiI78NlE6PUZ255bZj3fWg8Mtrrrjz4Eo33cIGfX6TqYw7lkk94B2ZJazyel
         ela8RtC7IKnxcGBWiK6jprnk2+yzI7lBgUG6E10IF+G+tQ267ObhF4rjjVIc1yFWJWVA
         +xUFEYY7+axUn83zAtwSrYxOJ79YAnBSdJSUEjNDunqbs9g1tiUQMloQvisKh0Yzl2Fb
         9NX1OyBthj6bHkt5ppwVu3IVrUjj+H8sgxBd0AnExydfB3p4XMNaQuQJmFJjzq26Kyvf
         FSWA==
X-Forwarded-Encrypted: i=1; AKwUvByk8u22ryB9MoCLbtUCCOWWBXTzSj1xJWCJ/byeDI7l441eEfYFJPHEUDA8US8rMn2AiOSzENVlN0ccBniNHq1A@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y3Q6iCzS2E4Dl4+haCPoOrYEUoeQ4thaPNpsiJFVK3AVYBwuB
	ql1eCmUFP030reRClmpLMBchlEgFLqr1DzZ17HlGf+/itkCS8wVqbUiY1HtMu9vNz3ZP0DsMNLI
	3/9PSTlbJoHw65/bCqr9Mtn8J5ekNHa3xd+R3VYmvPY1eapqxFIpl3vA1/kTBb8Plv5m9ZRSq
X-Gm-Gg: AYBFou0hIQ9/ggvr3yLYzmyvISh6CupZ2J+EYQ+rN+a0dzf0JDu4G3FHX+V1nNfiXa0
	c6qwyXY3vZ+M0dtUqG6jMMK974csA7hxH7Qe3vYEZl7I0vnI/mg2tr+WJ8amOuqqPL9PqdlV1rj
	PYSxfXuApIAEbPjHGQW5ytAnHtF6SIyHt8DhyVRhEncPxmbSi3TaOZHV7kNtdqFxTL1frhl5eE9
	9bCZOmHRUNixpKgCmqpA6akVKhH3p7czyH+EcBWYKH65PTGo6EXcX5pjFHeJI7NPE5gxavXBpA9
	D8dcOpc9IpTbBiAEH3tdxYZj8IZJW3OY0IwrgQy5E06M4z8DitfFZx7IPdxrtCqNTIgHA8h2Ypm
	tPBCIqwR/HMr6WmYOTKMq3DRs0llWjHzP6zCVpKN2bIssneJ1jZqrdy7fZ8Iacf8O2gEdd2FS98
	o=
X-Received: by 2002:a17:903:388b:b0:2df:9d04:403b with SMTP id d9443c01a7336-2eb364b5c40mr142899315ad.32.1793792139086;
        Wed, 04 Nov 2026 03:35:39 -0800 (PST)
X-Received: by 2002:a17:903:388b:b0:2df:9d04:403b with SMTP id d9443c01a7336-2eb364b5c40mr142898975ad.32.1793792138559;
        Wed, 04 Nov 2026 03:35:38 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08bd5845sm6106805ad.2.2026.11.04.03.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 03:35:38 -0800 (PST)
Message-ID: <402ecf6a-357a-4404-985c-9540f6851f8e@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 17:05:33 +0530
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
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Allow 3
 IOMMUs for LPAICP
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
 <20261005-shikra-el2-v3-1-618f7343695c@oss.qualcomm.com>
 <20261005153737.opzzuflsioi6cxqo@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261005153737.opzzuflsioi6cxqo@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb188c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=49plGf3O2Pee3ShZFYoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 7q_FSETF2OIHKaVAbvu3gltRPO6w8tRR
X-Proofpoint-GUID: 7q_FSETF2OIHKaVAbvu3gltRPO6w8tRR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NSBTYWx0ZWRfX3WnXgA+2k0ho
 frvVzYENDXjf+B9y1M5054gBsE7okKlucOXM/HXR2x/0XyZ9QiogvZo0mxUGtW6XETtKu0UMWwO
 817FUlJ016EKvjGNsJ4qt/WZFafsCip4MZEABuWJ3mb8CC1kSEe/y7YqTevMObAQ5qp6LhhQfDN
 vFFokqc9O3lkGqdy6VRTbI6V6EuBfde6E6UkEOSgM+zrG4/eMTDupAPMPZfpXjOs1R8tr91TAXx
 cQOcpe0oTG8m6oE5QqCv45f0cgWYqxKe3GJPZA8B7XxCA6L5pxa9VdjPMsSjEVqI6tz8gJkmopS
 Qz5txaIk7wm2dman07JzNSiZ8lnrcXxJKD4T/IpQfj0GloeGXV2gGF457VFgHEqkdut7EYxikI/
 1U8l+Su8UO35otKygrd49DnGlOHUAdC5ZxWnMEpdXwJF6QvK68U85NQ9+s20m9FKMv6pTwQlmvB
 gXUfPh3EQqiuS5czrsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NSBTYWx0ZWRfX65mAulzJkYVa
 f+Keg3vfpBmQ5SNqtP8OeSmL/nh/bGTKMujHoIGQ6pDmI5ZtxHyvZskY0FFXkBAqpE9ZBiamUuv
 UtDpScaD3mQXhgvNaaHsynjKNYlONjM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_03,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040045

On 10/5/2026 9:07 PM, Mukesh Ojha wrote:
> On Mon, Oct 05, 2026 at 04:44:45PM +0530, Komal Bajaj wrote:
>> The Shikra LPAICP PAS requires three IOMMU entries. However,
>> qcom,shikra-pas.yaml inherits the `iommus` schema from
>> qcom,pas-common.yaml, which limits property to a single entry.
>>
>> As a result, the LPAICP-specific `maxItems: 3` constraint conflicts
>> with the inherited `maxItems: 1` constraint, and a valid LPAICP node
>> fails schema validation.
>>
>> Remove the pas-common schema reference and specify IOMMU entry limit
>> for each Shikra PAS compatible: one entry for CDSP and MPSS, and
>> three entries for LPAICP.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,shikra-pas.yaml   | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> index 34a2f15e9361..4196f61a8ba0 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> @@ -32,6 +32,9 @@ properties:
>>       items:
>>         - const: xo
>>   
>> +  interconnects:
>> +    maxItems: 1
>> +
>>     memory-region:
>>       minItems: 1
>>       maxItems: 2
>> @@ -92,10 +95,14 @@ required:
>>     - compatible
>>     - reg
>>     - memory-region
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - qcom,smem-states
>> +  - qcom,smem-state-names
>>   
>>   allOf:
>> -  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
> I think the right approach would be to remove iommu from the common binding
> and let the corresponding target put the constraints.

Agree, that makes more sense. I will move iommu constraints to the 
corresponding target-specific bindings in next revision.

Thanks
Komal

>
>> -
>>     - if:
>>         properties:
>>           compatible:
>> @@ -112,6 +119,8 @@ allOf:
>>             maxItems: 1
>>           firmware-name:
>>             maxItems: 1
>> +        iommus:
>> +          maxItems: 1
>>           power-domains:
>>             items:
>>               - description: CX power domain
>> @@ -134,6 +143,8 @@ allOf:
>>             minItems: 2
>>           firmware-name:
>>             minItems: 2
>> +        iommus:
>> +          maxItems: 3
>>           power-domains: false
>>           power-domain-names: false
>>   
>>
>> -- 
>> 2.34.1
>>

