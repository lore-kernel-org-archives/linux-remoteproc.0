Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E60330B510
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Dec 2025 03:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766546218; cv=none; b=Ng1Vq8kDId0oMRsbdp8VPXaJ6/gDGyE7hvuoHCOKAbRNBfXWsGaPtVa3g08dDgRIUVlH37eyZHVVNs28jksLbHFoZq9ZcSEF5g6eGHnSuTTXyFvqPDJug0GyFnRDd1QpCDez7URSFqajgQMLS6pHZZbngZ0Ir/unW1eCTcjRnzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766546218; c=relaxed/simple;
	bh=jDy18Bl8S7lV1ZpdQ7ZoPgkwfGh4GA3WGjNchgjieio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZhJYR2r562Msl8LxS7ACMO80sWYUzVajoFbKz2IhpHaxlgJL46/sX+ZgkVb37va1kicxBT90RugjRoJlNj3lzE/0HlkNuoIH5R0vRsqpDnAusVRO8fAq3lfDvgHcRaSc+kg76bdt4nxdaZK6Xxg8V0RkUcRHUpSwG1ygpoq71Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=go9K74CX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RoA3E5nu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="go9K74CX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RoA3E5nu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNKhoIA700441
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Dec 2025 03:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Nk0WsZK8CkSWt1r4TFyPVt2eoNtbZ1f8MIJx7t15O4=; b=go9K74CXkJnh9R6C
	XTWY3Seqx6ORTystgebgOMWuMSUaktgVr/n67GGKrlBaZQ0Qo+ItWzBQK3dfY7I4
	KdDH6twL3+3uk/lykPkcSSSfGAcOsZiby+BO6/aCHFWIB++NWOUFb2u9I9EUt3zs
	KfV+ssT9UMTOFBzg0Boz3zxHdKQd2Ih8fx/DQe1mYGGA3biykXqG0vtTtISYWM5Z
	aEkQfHXF/v+ui6w/yIFwdnPYOtRbncxJsF1RNJQjx2N2DqXM/9lTrWFd66D+z9rN
	9Cn8o4pLwIqJ9RyMsHHYHoHAI/4/xOTs2dzOJNy8+6AqnO//hqdoNC1uKF2GUMBf
	OAa4zA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jteax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Dec 2025 03:16:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7baaf371585so3790251b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 19:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766546207; x=1767151007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Nk0WsZK8CkSWt1r4TFyPVt2eoNtbZ1f8MIJx7t15O4=;
        b=RoA3E5nu9L0CmBa1M0223FOOM/8+guDPDod/+N9VQMHiXNOPGuD4W7H7LRqryABIts
         oNf0h2HIbZGrCGPTYk8O7vEk8mj4ZijcV/kNwnzVfnCYXlWOv5ZBFF0RU1SEvaaA7BXa
         u5/zl6Ao0MPk+FeptIBjZXtP5lD81TAdTfVFBXSVLqEIZQZBa1W8SIdmKyaCHb3zlyCp
         rf6whEg8bTq/arOoaEiMN60aINpaUfbft28l8hD1hyTiq8RKJ7fzQi3/l9cYeh5F+19J
         5084cdokUV9hPdg+lJkR0kJoIfufSlWwlCMyY3kqK4hWMlaFvHoWu43NcDzKwybgWosf
         PcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766546207; x=1767151007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Nk0WsZK8CkSWt1r4TFyPVt2eoNtbZ1f8MIJx7t15O4=;
        b=cl1heDqPdHpaPipsdbvlrSBT1VO2doNjkB7C0l6tu9VgLMFA+AXtf5f7qwd7siI6zr
         UdPwQDrVnVJYQcjESbgPqd3i+BOHWihHGoTpEsc1SQbAHtAOXr/PzmCKo8WygEzqAnTv
         GwnNXNwXyibKm7PT+9bbdHOii0TyFhp7kjGQ41mU0mGEDYMFxfP/SEd3mzKVeb9btmVF
         EsJg0xGcZ1/c+vaTFGPeDF7O29l40VLlcUd3KeDlA8OnuVdVHotnxCw/EKkKO3uULpDK
         SlyzqkBgVigCWxDJEAjlo5ed0bopI2gOuvIT7ujyl/eWm0GRMx3aqxXL9EMTSDixcF9i
         WSkA==
X-Forwarded-Encrypted: i=1; AJvYcCXq27GnNP3MkMWnkNFjSmulu3dQE9n1a1FSl7Yhf4H42Hmw+VdRRYmAeZiDhBZNX7RA1TTJ8dtCsU28zUpqksAc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdn4Hu+veHw6H3tO94sS10/BQjT/OyPmXVKpzdt/NoWML1KsU9
	JNYFQPwEQIfzXG1D049MC1qgb7U3K9bi10tHTjThhtMVhIbxia0JRumS5mXd/PKPJq8d5OIXnE7
	l6ScotoLpdp96UiUX4/RxlT1cC50q4qrlafOkOyvnS+yco9aL0x2+b7bzlFJz8NYRXpEqbe7I
X-Gm-Gg: AY/fxX6L199yS0EXzbuxZ/T1yaotUNlJKSyLwF2O26gcBZ4deo7Rvzj8cFB6E4mQK2q
	4HvyrwzigglwOuvSDefDAxlCydAZqQ8Oh8ea8eHZE0QdL0BjGCjP3zegZ3TNDFzCFu3K8XFwqQq
	2lfOzMUH+3SlxlloorGvtImyXK0jdKlHJN8zA3P/gP+j5pjtMqH4kBYP3lMy+EuFGbVA7Y3yClc
	sBDqWTo8vYuQ1QtTGdbDbh4vTWuc6RA/LOkgH6Dj9BY6F3oHauzp/Jnv/JDPgUK8QrRwK+nfZs2
	V7DUcM2qn+lTNRKaUhP+yFYK+rjWzgpYuBRfXk8gSGyU3ySytpndkBF7r40G1ii03JOt7MUy9tt
	bk3HwXsKDne91YJkVCO0x2eID079jl8L7eUlccB6vyGhEKsgSihdXYtUw1qUcr4LqYhemvTrg6z
	OAJ1Fr
X-Received: by 2002:aa7:868f:0:b0:7f0:61d:d092 with SMTP id d2e1a72fcca58-7fe0d7a28a8mr15002388b3a.21.1766546207296;
        Tue, 23 Dec 2025 19:16:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRektK2ratYvVnkQdAMzu6czAfpp3g6ScKADB4adV5uIh/oLuTQWgDuu/FCxCDHzGN/eSLgw==
X-Received: by 2002:aa7:868f:0:b0:7f0:61d:d092 with SMTP id d2e1a72fcca58-7fe0d7a28a8mr15002373b3a.21.1766546206785;
        Tue, 23 Dec 2025 19:16:46 -0800 (PST)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a84368dsm15288617b3a.2.2025.12.23.19.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 19:16:46 -0800 (PST)
Message-ID: <ae532ff4-1a96-4dc1-9fa0-81305624c9c9@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:16:39 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] dt-bindings: remoteproc: qcom,pas: Document pas
 for SoCCP on Kaanapali and Glymur platforms
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-3-5b09885c55a5@oss.qualcomm.com>
 <20251223-furry-mighty-agouti-a222f7@quoll>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20251223-furry-mighty-agouti-a222f7@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyNCBTYWx0ZWRfX15IYFDlRdo6D
 yPNBPnR7gHh0GR/bPdOqIEPAnUOmsP601vLUAUyx9vNvu7Uk/xRV+8AFnfbxbpF++7tc1qjeHGs
 jOS/nNXk0uVoC2qBqAec0Ab2RyPWaIgP+9c2YSHvgHQ/fihI5egO7Vc+QXASFznjivGejzSEgZ1
 zXKhdUPXCLGI1KRd++++GxMy07P0nqQKS4ukT7VKxdXDDBe7CrBJrtF+1qojKKGgArZzL5u6zEH
 In7aDYtlZsj6jlDxuwAeKanboRCkZRFwDGWr+fh8Lo7NjzW0SWDwqnrto2x4llGuhoVB4uht7f/
 CCRWOBCOQRskZ9nvL1Ay11lh3kX9wwRiOkDiFsBJXEy5sO0fU8qXxsJ1d3Q51YUDKsZSX7poSGy
 QAK734gDIHj8uTefnbfHjclapo2VhViRuZyJykVGLX/jyXgeVJzs3JaUKH2k305lssRcULhsmy7
 R3GuT1MAaxtqwU4KpyA==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694b5b20 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=dRLHVvS3EW7BnV4jGykA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: -l7AnUByTVROrIgVQd-VlhrQNztcG2dp
X-Proofpoint-ORIG-GUID: -l7AnUByTVROrIgVQd-VlhrQNztcG2dp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240024



On 12/23/2025 9:29 PM, Krzysztof Kozlowski wrote:
> On Tue, Dec 23, 2025 at 01:13:49AM -0800, Jingyi Wang wrote:
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index 63a82e7a8bf8..149e993282bb 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -33,16 +33,22 @@ properties:
>>        - description: Handover interrupt
>>        - description: Stop acknowledge interrupt
>>        - description: Shutdown acknowledge interrupt
>> +      - description: Pong interrupt
>> +      - description: Wake acknowledge interrupt
>>  
>>    interrupt-names:
>>      minItems: 5
>> +    maxItems: 7
>>      items:
>> -      - const: wdog
>> -      - const: fatal
>> -      - const: ready
>> -      - const: handover
>> -      - const: stop-ack
>> -      - const: shutdown-ack
>> +      enum:
> 
> No, no. Stop doing random changes. NAK
> 
> Now you remove strict order (see writing bindings) and claim every
> device like SM8550 ADSP PAS has any order.
> 
> And it is now de-synced with interrupts. Read writing bindings - this is
> clearly described there at line 90!
> 
> You can only grow existing list.
> 
> 
> 

the interrupt for soccp is defined as 
"wdog","fatal","ready","handover","stop-ack","pong","wake-ack"
while other pas could be:
"wdog","fatal","ready","handover","stop-ack","shutdown-ack"

so grow existing list is not work for this,

In the v1, got your comments to adjust pas-common.yaml for the interrupt:
https://lore.kernel.org/all/861b6ede-f168-44e6-85bd-10cf04dbcec7@kernel.org/

and in v2, interrupt are moved as part to the "allOf" with if-else and
also got NAK:
https://lore.kernel.org/all/20251030-venomous-apricot-falcon-b3fd64@kuoka/

Could you please share a example for us to understand how to maintain it in
pas-common.yaml, not define if-else and has strict order at the same time?
That will be very helpful.

Thanks,
Jingyi


>> +        - wdog
>> +        - fatal
>> +        - ready
>> +        - handover
>> +        - stop-ack
>> +        - shutdown-ack
>> +        - pong
>> +        - wake-ack
>>  
>>    power-domains:
>>      minItems: 1
>> @@ -55,13 +61,21 @@ properties:
>>    qcom,smem-states:
>>      $ref: /schemas/types.yaml#/definitions/phandle-array
>>      description: States used by the AP to signal the Hexagon core
>> +    minItems: 1
>>      items:
>> -      - description: Stop the modem
>> +      - description: Stop the remoteproc
>> +      - description: Wake up the remoteproc
>> +      - description: Make the remoteproc sleep
>> +      - description: Ping the remoteproc
> 
> So every device like SM8550 PAS has now four smem states... without any
> explanation. Read writing bindings - what does it say?
>

This change is similar to current interrupt-names property define 6 interrupts
but has minItems: 5

-  interrupt-names:
-    minItems: 5
-    items:
-      - const: wdog
-      - const: fatal
-      - const: ready
-      - const: handover
-      - const: stop-ack
-      - const: shutdown-ack


I think this should be "grow existing list" you mentioned above?

Thanks,
Jingyi
 
> "... and define constraints specific to the device."
> 
> "DO define properties in terms of constraints. How many entries? What are
>  possible values? What is the order? All these constraints represent the ABI
>   as well."
> 
> It is your homework to read the docs. Not mine.
> 
> If you want to change common list you must define strict constraints for
> EVERY user.
> 
> Best regards,
> Krzysztof
> 

