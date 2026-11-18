Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985233;
	b=fq7pAUnEQoyUGjkG4Rie/+93q1r08855sdCAa6e9jsovSf6HQkkludMmGXppKAItRuxQ
	 jMG0E6OLZ9jH0EsTo6wPpaRifTHsEK3ZENkB+CisHHa037N2IrfPrEQZHlExrlyXeGRYt
	 4ssp2uKFtPH7buEgGVTD8HwmlrNihELIvbFUAks5SjjTba4YHyi5hvisO5fKhTHmhVyiY
	 N8Nb7X/KRzvovyE8LmRA/tCZEkaEVI78+5kXGc9yWYo+5RGYTyeAjyfJ81Vxn1u4U8ZNs
	 RAgJJdv2kP+IUcfDIFA3OTBVKokZsIGBPLcXzaQpY/b0LlHVHb32PpI/JMDWfYBtrBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985233;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=De+BTaf7aeCgv75XUtP4o6wsleP3pF94u5PLmYp02pw=;
	b=mfUHN8SynLN2NUqNBgI6OXrBOFbgh+mp1FcM70591WNnDszHsnHM+xrummL50laiytC+
	 XJZ3NC6tKmAx1sd1XLOac6PdoVlM2FCXso/u3V8N0mJQvEdaZW88djMua5lkBzhoWwvOE
	 ZuoyScsoa8x48gdaBDKa2HfU6NCBuP5vlrQZhFJoXBNSkd9KBA+NAzEpgwKjw9mQwULIp
	 hBIsuVdwWPxZARMi1xuXPZuzhe981KWN48qmYMyuaAd1jXiQYzxyuaNGHFEvMclqG9a7P
	 Iec5lsm5IBP51iKPF67tBiIE35R+kiGeJj8PF6QEZjqIY4b8c+p65HwChqxQw+fkXLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIDje7Qr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCJK82BT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CE6606A332
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 07:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60CE6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIDje7Qr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCJK82BT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UmSA3371230
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 07:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	De+BTaf7aeCgv75XUtP4o6wsleP3pF94u5PLmYp02pw=; b=kIDje7QregJFgM/K
	Vlno+kRlQDCQc68TygLDKkCUqpmCkyK0JEtom1fH7nkRtHMZChev8oaayHBZayRo
	mLk7YoXKzDybydjcwSOfykAJV1ScpR5iNP1uakoxbMjKyEOkX1y0FoN7RA005DEv
	hwnePs18MtCjnRbaWbcZkdXEJsZ8N7RnTzhg/Rf45pM2sA1xLyWkkI4Y5icRn79E
	/qrLQU3oT2kF2TzQeth/5xkpYHOUJyfeO4lkJExMAOkTS5for4HAjnhPwm0Osks+
	SQ5UrUTpTy9kuKAbVybppKb2jG5lNsj1UTvsgZ2GPhngytdBnVzAB7WTccxup2Jm
	Rt3TjA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sp6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 07:00:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a05b68f851so1414207b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Nov 2026 23:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985232; x=1795590032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=De+BTaf7aeCgv75XUtP4o6wsleP3pF94u5PLmYp02pw=;
        b=LCJK82BTWxikFICBULBc5O3ZLz/gW/tjnFiMd9c6NGB37QYWQw/iJ7d8MC02mVKgIC
         TwUwixXLU/CiETtmVXVyumcwiseGJGZpr9bID1akqFExMvcYEdzEOdSKUZ3Wchhulwy4
         Jtigpqm8PRUuOXnM8blq/6htCq6Y+RRrxwQWpU5+U1t4WLhYZ7AuT1gA4Fygu0Fkff7j
         f6rOkDO/pxUbDon/B+idb2c7n0Fz1x+SsK0/wz+pGoUAGbqbt3JkeVvueMdPFMRSqD27
         uSkUp9qJvV3XIWWGPST18vH07jqv4z+Zy4EnDSSQY99aJmB0KfDScJxhqfrGpOi/JmZA
         wlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985232; x=1795590032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=De+BTaf7aeCgv75XUtP4o6wsleP3pF94u5PLmYp02pw=;
        b=I4oSJPQgoCbpHt6v3T73ze3IKnbVg3xRUKE8T48OrgbuqMb5ieVxvgmhJdFAnligkb
         ihoXY4CQ3xjod+Xa+XEhwj0xNxHMAGR422f+gIPOJFipO1u+u8t/tUod4HWv9k5/ZBU5
         SpcpKLKyUGIZ4xfouF5EQEr3enz4ndbTH4S7fT6j5ZJdnejtm2tbs/7e5/KleTXht3zc
         4yijpxpn/FCCwGez7T61BiW/spfhHA4J5Ps16lhunmt+H3rkVFTjgT1gdEwqxkWv/N2a
         OM53gKRwsRuSwDz41AfPywrJJp9xWIvH8cjcjCDQ+SrnV+pRwLEquP01NHrCfaznZ5jQ
         0ajw==
X-Forwarded-Encrypted: i=1; AL+hErFC8uwAjlTw0ZQU+dNfzNyf2rVlzsX2t9DSBWUE5wodGfb9U3kFOpcl/BlgUSoLlDcKn0BPWITmR3/R+OknjuSH@vger.kernel.org
X-Gm-Message-State: APuU4Z+DdXqETKkFQksY/bSEoLgjR2tv1oJecwXbgr83vkxMKt4DjHEr
	jBy+yI2aqqJBIoK5p+Zh+z9r0LAm/WWLYltZSDFKLwyKhAozM2JYH6obZU8NQ24zwBv5y4u9bly
	BaFHF+7hlqqBlpWVkkCxkfqwRy4gy5W25Vg7RvjWYtQieuPXOsi7nkZ2jiGZZdWbCFrssybLP
X-Gm-Gg: AYBFou3bffs8WvrR6qTVvTahvPvobOiSDSkNo3SwgRqc0ygqNlRiXmOjnHhQnG3wRB5
	5qfzfwk2QTOpYBA7SczcWiQF+BLKP6sVP39khlEJQayY1mtzQbCYVSXC+1kheS86OlbkJAWGm1P
	c3Z79ECkiwDZoBuRnosSUupYJwN84vin/5i/QG6H9rgbDqItLGl1qXTDpZ+k8B2qxKHVoZ3B5vh
	oSkiSHSjjKSZuIpcb3Q5+XBJ0CNvt7rdf657JeXsgI7Z/bAhRUzulMfHpA+nMEffgLI2K9Mr+LI
	nT9DSsrNZpl6cHB9oHMNln7iHdcbdwpKFKyxa1Yal7+nl3OqqTavPj5LCa7Ln8uwDsLoRSWlef6
	22tERgZzAFsHBh8AWzeYuiRorg3Rpc7F/Or3HShd/lpOV7oXOSJX4Y8hWKu9pk5HJN/ejCbfTUp
	BI+Q==
X-Received: by 2002:a05:6a21:2c03:b0:3eb:50c9:b3c6 with SMTP id adf61e73a8af0-3fd2e2bb06bmr4030555637.22.1794985231642;
        Tue, 17 Nov 2026 23:00:31 -0800 (PST)
X-Received: by 2002:a05:6a21:2c03:b0:3eb:50c9:b3c6 with SMTP id adf61e73a8af0-3fd2e2bb06bmr4030496637.22.1794985230778;
        Tue, 17 Nov 2026 23:00:30 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3bfa898bsm624181a12.17.2026.11.17.23.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 23:00:30 -0800 (PST)
Message-ID: <761bd59f-4ac2-4e62-896c-57d15fedc6f9@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 12:30:24 +0530
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
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261116-boisterous-ancient-macaw-8cc00e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd4d10 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=u9YKjPMZU3T7gHYh_q8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Cdn7mX9ZkdwYRxDbmbiaSMPUn4qXQXMO
X-Proofpoint-ORIG-GUID: Cdn7mX9ZkdwYRxDbmbiaSMPUn4qXQXMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX5eZF6j4eUh5u
 oS4M9wgAWrDQI8SGuwqRqT4ywzGkWtBi2P/MNNu1NAXJRYRgFizy21Nqqdwkz7KyNmFnbEdYtz0
 3rT32aUVeH+aDAMr/qd9DxQVCNfBG25x8x2OwANtPiAk44gpkzXLCYXHu0ZdgkAceExHHmYzQSd
 CKTrTC3wYlWHpDBPCToNBlU846S5/8j5UKKiEP4lzPbl1gNjN2tMOgBAxu1Fvlm6KOMovAh/ocy
 FPecbNNEHiiZRGeVEoP40tmVsxTkRdMaHJM7NhC/TWBJkY71CjkQVCMGttiMjIpMqgvxdBBLvxj
 Fh3buvjwkJjp56BJ2Ls4LZcYehWt4ibo2t8N3p+Ek207PLf/Zo69c22Miyp8Qdl7AE334O4jO81
 W2cPoNfAEiqapitOAr3+isKVu35mqzWC/uuLbZcdRe8OUxsVtGEv/0lh9HjWrGcn5gVLDyZh6m/
 E635r7/YxQHTyW9K70A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfXxvDGaSR5TrSU
 Vgty655zmSr2SjWjgPUFPjwfd91ud8l0q/+NmhA3+Qca6r05KGymDCUN8TohEpbUzT3ghAQL9PH
 IzCwCj2ATpx1hsGnsk3d0OkwW80njWM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180027

On 11/16/2026 4:28 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 13, 2026 at 08:02:20PM +0530, Komal Bajaj wrote:
>> qcom,pas-common.yaml limits iommus to a single entry for every PAS
>> remoteproc, which is too restrictive for SoCs whose firmware uses
>> multiple IOMMU streams.
>>
>> Drop iommus from common binding and let each SoC-specific binding declare
>> it with its own limits. These bindings set unevaluatedProperties: false,
>> so a compatible that does not declare iommus rejects it. Declare it for
> I do not understand this sentence. Compatible cannot declare iommus, but
> anyway the bindings do not reject it.

Right. Wording was incorrect, compatible does not declare property but 
schema does. I will reword this in next revision.

What I meant was that these bindings set unevaluatedProperties: false. 
Therefore, once iommus is removed from qcom,pas-common.yaml, any schema 
that does not define iommus itself will reject a node containing it with -
"Unevaluated properties are not allowed ('iommus' was unexpected)"

>
>> every compatible whose nodes use it.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,pas-common.yaml   |  3 ---
>>   .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml  |  4 ++++
>>   .../devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml   | 12 ++++++++++++
>>   .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml   | 13 +++++++++++++
>>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml   | 15 +++++++++++++++
>>   5 files changed, 44 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index f75cab6b4ed9..4662fe4cff62 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -32,9 +32,6 @@ properties:
>>       minItems: 5
>>       maxItems: 6
>>   
>> -  iommus:
>> -    maxItems: 1
>> -
>>     power-domains:
>>       minItems: 1
>>       maxItems: 3
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> index dda2d144b720..3c35da52204d 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> @@ -38,6 +38,10 @@ properties:
>>     reg:
>>       maxItems: 1
>>   
>> +  iommus:
>> +    maxItems: 1
>> +    description: Firmware Stream
>> +
>>     clocks:
>>       items:
>>         - description: XO clock
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> index b20780e5e26b..8aebc785f212 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
>> @@ -169,6 +169,18 @@ allOf:
>>               - const: cx
>>               - const: mx
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,sc7280-adsp-pas
>> +            - qcom,sc7280-cdsp-pas
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
> Same comments as before - missing property definition. Properties should
> not be defined in conditional blocks. If you remove property from common
> schema, then you remove it from every device referencing it. Nothing in
> commit msg explains such intention and reason why.

I will update this and keep it as a no-functional-change.
> Either iommus is valid or is not. If it is not, then need mentioning in
> commit msg for example and then you drop it from common schema and add
> it to the bindings where it is valid.

I will cover this in a separate commit.

Thanks
Komal

>
>
> Best regards,
> Krzysztof
>

