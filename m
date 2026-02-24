Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7122C375A
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 05:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771912450; cv=none; b=TTb4OU7FFf3mJYsdRT8bHod+Z+yNPwk+CbTCzACp0lzkkCH0l1Vm29MazBc1OXzYDzdkQ2bWMEQf5QEPLKYw1EugCnarZDdUKwG1p/25797SD3cS1sQXVb/KbKMfrPtHYqsZJ9lINFLV1bIrk3jEFIRgtn4CGL7OAANCb+WVLAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771912450; c=relaxed/simple;
	bh=Hz/eoSqvEAlFesws+qniwk1kpd6/W96nDauEJtPDivo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MoEcw+vy9RWya1SmQH7d3LiupX47id47wYJV/Yo1Vx/b5YMFL0TykGvJ60nfLvPCwG9bmy90IbIg3kpHsHyKsDa8JWjNn4y5joAJ173HnQaHhgrj105eLUQvMkm8nW/sm3oVi8niS12zJZGYpT8NS+uHgAfCHy3TTM47CdqstQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mZKP55mC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xp/bKiA+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZKP55mC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xp/bKiA+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4Ldc22317645
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 05:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WMavZ0sxm8QIKKToV78mwg8OO4gSQCi6g+RBk50huFE=; b=mZKP55mCJpfBCPU0
	aOsnJomEqa8hyRW9nun7l9Mi3xBWZwK0jjMPGAfH0yvyd+Q5DONZlwZEUvNzZJoA
	jetj4An5XYhUx24roebi6cO5PLaTJUQIFg/0K7sGUdui5F3PXSQ3ZfWwxngn514i
	kPiumspoZshO+KVyrvA2jSI/+ybVfl4NPyoEj3dfkeAuBgZG6dv0T2NQkZiX3QjQ
	xfMFzvifoCJfIQKcmePerd6Wf0k0HvRPycX28mki2/gUdCNRUu+Gs7GbggEVuMCr
	VfKqa0DR2Tw6bXv0EyIi0xcNQ3Gu2SGO+X3L7Eq35LE9iNpe5t7hD3whjgoZmpK1
	sW4BVQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtyj9wn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 05:54:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-352e6fcd72dso26235450a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 21:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771912448; x=1772517248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WMavZ0sxm8QIKKToV78mwg8OO4gSQCi6g+RBk50huFE=;
        b=Xp/bKiA+G6f7xEEZwlSgZX0pau27TeBREYedT1SnH51p/Z9fSEwogNMd76h+uOme3H
         lNT7ncGlRbywtIJfgLBEASH3XrMd0uBCu6CfARNMm9nG+95scW3Tp/iNyhY5O/lqZhQP
         ZmuaBiAmlwm608I2Lszgl8n0wCOLEmvIkLXDTVi1kKWH4mpu74slxBQcPaUR9hiFmq2i
         YHB3W1jfLqOg/CJNS8RDtvT5gf3zM0HluUziYD4qMkfKihNtOzDTWD4+JZomEIIdncME
         MEQId4bW3Srimc+CrbUPhvEgrJQXqrlGG3k9Zul//qFJnJlFLuyP5SMtCd/jR+f9ss6I
         jTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771912448; x=1772517248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMavZ0sxm8QIKKToV78mwg8OO4gSQCi6g+RBk50huFE=;
        b=NRyWkdOzh6grHQpUVbShhVAbt5949M1v6aATZAcR8VsJSPWS3YqVgID5ZpObbA64m8
         1Yk+1ySqljRaimBUsUAhPvyALz0l3aBb4AD3HHo8NH9342R8ZfC1GPR0SxGQ9fNIvxGw
         hFYGqq34KdZyKjVkKXt059C9dhV0H3yXBQYImIXIeQeXw195nF/Ol8laZ2UrFT7e/9rS
         x2t8e8WyIY5cz5jZT25AL7eGSjlxM++fa9AA5vLIxeHEmhc6P4gBdq+qnImqsn91AtGN
         +0NVTeR5UXoKo8IWP/tNAZ+VNBf6V2URyMx6oSDAPu2Nayyfau/8ImmJqouD8Nc/jP+H
         6Vcg==
X-Forwarded-Encrypted: i=1; AJvYcCVHAXEkyonn46nCwmYD0SVa7QqnFNOE/MHQJZ/wTY0YXhc1S4HKo4IwpUczM7F1THQnKPQuRW+5xRlm7T7ATuJv@vger.kernel.org
X-Gm-Message-State: AOJu0YwrncJHHQ4VFUpPd9aClde0RIZ27yurhZK4aYLizSQCGqdCJilo
	bXlJsZo6eFIZRHdp51TrstC6qDqq5gRTwMU3wYbrVIe+lvY2BPSqfCaNdFOtSjO2rWEuqk6m56x
	MLNsWoB4z3dplRGANylkakxYhvjycyKu87nNZGtlS8GlijE/NFfYe7EyuaIkUZS/XWOicQ/8ncX
	wC7999
X-Gm-Gg: AZuq6aKPRcFYWav/UY4ydvVw5H7dl1P3iP8f0vbZ5k+7aCjMejDoVTefILuuibQn668
	fl88cRFwAyfLnRaNaxacDKWqoEmWvfPti1+epRVEDOCSAA7G1/qtiI/3t9JwooDIBaa9mZ65fea
	Ic+EtRWtZkG9PT7nVXs/DGwQZ1LDbpMD+6W4FTr62OvoYqhtOCJIlw9TcSh4rlUm9Eh7V4lRjm2
	bjCXdtcWp5xGNUUFB1eTEJyPEUulpSWf8O77CbUONrqN398yA6IiRuCoqoklxIgaceORGtcjw0O
	L7lWtDruC3hxin2c0kaR7Hf6SSAvGiKAbmNf2ZEGNA7GZZ/+rt+jGMRHcDkui2tbAfF6J+3POWl
	8MAstvYQr3mqfauW70rjy1RrYZffBSDQZIZUp+8gyO+SNmvGOHJ4OtcWVdqF5Tl1QQ7q44bkw3W
	NXjAbM5qM/puna+D06mR4+mO68PNAuOabrGlRrswE=
X-Received: by 2002:a05:6a21:31c8:b0:395:1b4d:c683 with SMTP id adf61e73a8af0-39545ba8c40mr9319049637.0.1771912447684;
        Mon, 23 Feb 2026 21:54:07 -0800 (PST)
X-Received: by 2002:a05:6a21:31c8:b0:395:1b4d:c683 with SMTP id adf61e73a8af0-39545ba8c40mr9319032637.0.1771912447224;
        Mon, 23 Feb 2026 21:54:07 -0800 (PST)
Received: from [10.190.200.237] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e1e1sm97509475ad.55.2026.02.23.21.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 21:54:06 -0800 (PST)
Message-ID: <598f8927-01f5-4889-9f8a-ef9c9ca7a616@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 11:24:02 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/5] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Glymur
To: Bjorn Andersson <andersson@kernel.org>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-4-sibi.sankar@oss.qualcomm.com>
 <siuuvqcxcfw2be72hh2pu6csmw6qxy26ixnxppbfy7gtpzxxzd@vuucoicoj4h2>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <siuuvqcxcfw2be72hh2pu6csmw6qxy26ixnxppbfy7gtpzxxzd@vuucoicoj4h2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jq/8bc4C c=1 sm=1 tr=0 ts=699d3d00 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bH6bprHrhxwb1ATC2rQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: nVTkRuHbsvSz9zgTxPNT5dFsJ0c3Z_Yg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA0OCBTYWx0ZWRfXyrKYfbt4KPKL
 v7vprM/6oYyiVoYFyyyaMmMiQ05nq+2wFhaS6WA9QgQjBDGfBil8MkH2DQUXGWCyiBkFfZrJqWy
 r2Gq1U9gcR5Q8Mt2miGAVM36562UH5bzhxexXPmn6Ws8j2S1N8Mndqq7speNt9HFtMQgZEeilob
 HsmguA1TCyfAh52B7nmkdNRyQgHHt9AdhuaM6zBqx1Gnfp63j7lpSxwlaA00HOFXEd0k/LcdScu
 jagxGbkl9JYM0Gq/wetUVUNkXUEIRQqlVVWGQ2bH+AF2ajxFtRzxSZEJeDUaEsHEizsTnO/gPBg
 89tJcGrDa5sbiEOn4F3mvPgOMzYg5TSk08D02/nNolvLOni1TWWCqIwGSZAupsqJ539ru22A/d9
 g9uuUbH3WkThOplR/VoOgwPQwmx8IN9x62pIPjWiSqSUyz0CZcyLOFqpXnBXF+QEs6W1DgpdMiV
 kQH1k5aru6heQExFpeA==
X-Proofpoint-GUID: nVTkRuHbsvSz9zgTxPNT5dFsJ0c3Z_Yg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240048


On 2/23/2026 10:01 PM, Bjorn Andersson wrote:
> On Thu, Jan 29, 2026 at 05:43:56AM +0530, Sibi Sankar wrote:
>> Document compatible for Qualcomm Glymur fastrpc which is fully compatible
>> with Qualcomm Kaanapali fastrpc.
>>
> I assume this means that you have successfully called at least one
> FastRPC function on Glymur - with the WP firmware?

Hey Bjorn,

Yes, we did verify fastrpc on both ADSP/CDSP on the firmware that
was upstreamed to linux-firmware on WP Glymur CRDs.

-Sibi

> Regards,
> Bjorn
>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> index d8e47db677cc..ca830dd06de2 100644
>> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>> @@ -18,9 +18,14 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - qcom,kaanapali-fastrpc
>> -      - qcom,fastrpc
>> +    oneOf:
>> +      - enum:
>> +          - qcom,kaanapali-fastrpc
>> +          - qcom,fastrpc
>> +      - items:
>> +          - enum:
>> +              - qcom,glymur-fastrpc
>> +          - const: qcom,kaanapali-fastrpc
>>   
>>     label:
>>       enum:
>> -- 
>> 2.34.1
>>
