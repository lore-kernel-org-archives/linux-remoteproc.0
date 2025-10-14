Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE4E35948
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 05:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760419831; cv=none; b=PY1EmBqAnAPwZm888tPoWiuKIAYwNcCfbTC9zorrULi1eUKE5BMbAuWFpHdd/Iz3d6rPaReUuL0AD8F/5zsXkbap0e9YwLXhXVby990qrYc2CTuSCFCIvWfR66ZDbXHPSlus3wva2U5vbM9EhsWCF6IwSL14PNjfcTcMSF+vxYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760419831; c=relaxed/simple;
	bh=6C+0mVJBfwJ6eEKuKpzptD3vV13l/Xs2RlUk1P/FkIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcLJTRG+Z3p34Nb1MZMLTAxJrOMy0pPWrTmAPVrwL1eE3i7LMsLCRLPreyAdwRhvA31NgvKP561A7Lj0NSEGEWQGVtqxAEG8XTv0u9g6G9uPSeKvqJ+1GRN4p0nxCkRLGEz4KntXAo7z0FN6go1Ju7cds48A0GLyeyOed6L2WiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGuputJM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGuputJM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD69q011638
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 05:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGf+luYW4jgMb+B3RwqAY4OAaUUBYWHpzhztabveqmE=; b=CGuputJMqrAfvxoz
	AlWw35VONHpoCCW7a3fUEMDBGpJQZvbN4MVdgvsMUuto+Gl2TrZAK3cJh1uXLzRb
	YKc0bAG7MMROO9xz5jDF39LEv3K182ZzBV3sg78VVf3l1RLefrkWwmelI966gDFq
	oPxb1pJXbdnyi6UPIKTpMGtxLiKx3Nkm3Z9MBl+CCM6v9BorFz3r+nvPlGY+vi93
	bwAcDBLPzGdFKUNDDMPNyxDohyTxt2B+Hwt1ULKDMapCKXxQ2s/5VXn6+q5A1l4w
	rP8wkOuq74tVyEq68BF6r/wCZe6ujqjCgwgFT3gMuqmDat2bFz3JCdojbWnEDD3z
	o5TJog==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5f96m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Oct 2025 05:30:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso15497256b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 22:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760419828; x=1761024628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGf+luYW4jgMb+B3RwqAY4OAaUUBYWHpzhztabveqmE=;
        b=ielQrEU036rUhRJcnohXPKdePRDAkN7wmpu6tyvOCbCsR6/uQbETL7ugTzNnw5TdB6
         MLwr2WWNmH3Qyh7+qYLJX4r/59iqtPtOE+i8EretgRfeZ24Zp5ODQtl9TqB8CgWuw2J9
         k/Df58+cr6cZWhe8ra7FYNmHr57Oq3AH/qZyxjKQDA0OaezNRBIuktVOOt16zJgi0l2s
         lUelHEpf/I/vRSW+miB7jauHeF6PdnLByMrUpgFyW1OwmlAHTQ5G9jC8uTp4hxUj63FH
         8VczVfeOUg8PfirRZQW3ZsdRLLTe+wQWdh/oxuYS4SSDC1D2UBBd9Gr8rWaX+1dQgDB9
         /ZkA==
X-Forwarded-Encrypted: i=1; AJvYcCVbd471enKNso0y8D4J4rLEyMwsmA8LzZZaXY0ulbSSAyWTwqlwGw3LlsaaBfFUphmL1cQA3FBNNr4kXTnxTPfd@vger.kernel.org
X-Gm-Message-State: AOJu0YzaflWP7Lktoo6Zzi2KwO23fjPyS0jgzx8KB73NE9klEvWRRAhO
	NZo5+PYCh9FwCN7fi+ReernIoUSzKSg4j5fckHBNB8x5DL1s5L+GrBKvcWEDgfT/CTNGTdBtGxn
	pVRwaONJQgZQJBle0EuGV5KkS9OdglZkhvZkGcdmmtbWAXxAQGB8GocLJZcyXz/e4uRGUEW+B
X-Gm-Gg: ASbGncsV4GMFa6GYUbMr0apt09a25okhJHFLm8hW0RQyfbyIWTk9o5JiBOfZO5EAgHB
	/z1tXioF9FKDJM8QAevBuw/AywyPUm/V/bqO2Yuew2LU+VzfRnjRzVgTbgSq7iVFVPcVZBmVJKX
	t3zPvJ1iwMq1tE3iU2WP9RyoY2cTnmE4UizBcE0ytDLAn60MfA45x9c16CDVkGGBYaAib1RQ0Br
	E7GlKmt/2PC7Yo7G6mcVqKIvhRcBmll+pV2msGOa5x/UhDlAYPJODBmu1rY5I36lV4JzTaWyD1z
	qhjOLRQjQ/TmawvxQNeJO6pU7sc2WMNZ44V9TMjvirw5RLneNEEQ9dGeHthUfS42LUHbAfePY1d
	hIW9vrpGky9xe9W8h9n71Zz4ZOweDGjMcM7s=
X-Received: by 2002:a05:6a00:189e:b0:782:cc55:be67 with SMTP id d2e1a72fcca58-793870520a0mr25278556b3a.20.1760419827727;
        Mon, 13 Oct 2025 22:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoPKUcolh2erT/HShMlQQ9jq2kdIFbjddsu/zl8eo5idfZCP8/onE7f7VcV98H1IJ153XAOA==
X-Received: by 2002:a05:6a00:189e:b0:782:cc55:be67 with SMTP id d2e1a72fcca58-793870520a0mr25278521b3a.20.1760419827279;
        Mon, 13 Oct 2025 22:30:27 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b63d90asm13463745b3a.24.2025.10.13.22.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 22:30:26 -0700 (PDT)
Message-ID: <0f0969e8-8668-411e-8ddb-a124703c9584@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:30:17 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: remoteproc: qcom,pas: Document pas for
 Kaanapali SoCCP
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-4-611bf7be8329@oss.qualcomm.com>
 <a8796335-bec3-4c1f-afea-b5b7909d8ba3@kernel.org>
 <e9813a47-c40b-475a-8faf-de0811c9066e@oss.qualcomm.com>
 <40af8d13-1bee-49f7-946e-043b920d83fe@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <40af8d13-1bee-49f7-946e-043b920d83fe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kdN7kEcSpwqH23UnxOLcp491ffc-rsdC
X-Proofpoint-ORIG-GUID: kdN7kEcSpwqH23UnxOLcp491ffc-rsdC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX+6vL1RRP9NaY
 HdTkQ0MoryRBgPs5L17fWJMv9mbJR/T3Ytev5td56kMHScccDB83bufOWhs/RfOEu4q3kkm5Dfo
 Y9k4s3SnsIvVzL+HQycf9sFia6dZnCebF6jhM0FDN/YZ/11HYTqWSaq2Ss7UZGEiVqYw7KFsIjD
 cqK49X8BruazLTEeCRyLrnO6Q/pywqc1Dogx0wtOA9Skpv6TrHTxf3PXzMRKpUnoHFiMz3m4MXj
 AnPAGpT7GtKAme+aLTcGVupKX2flHNDWqDOb32NKhWmjBfyYWe38kZ2SKcAPXJDPdlZZGkGdsgw
 8OJzqUOK+Eyad4nMOiMJZpAdrE8xMisjQutKMudHsiestc2BGboKLJbm2D7/9IPk0Hzx65SOC1p
 nhlsrPQ8bVzYPb+lyxEaKU+LQcV63Q==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68eddff5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u80fgmE9l9i9TYFULvgA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020



On 10/14/2025 12:47 PM, Krzysztof Kozlowski wrote:
> On 14/10/2025 06:28, Jingyi Wang wrote:
>>
>>
>> On 10/9/2025 6:27 PM, Krzysztof Kozlowski wrote:
>>> On 25/09/2025 08:37, Jingyi Wang wrote:
>>>> +
>>>> +  glink-edge:
>>>> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>>>> +    unevaluatedProperties: false
>>>> +    description: |
>>>
>>> Drop |
>>>
>>>
>>
>> Will fix
>>
>>>> +      Qualcomm G-Link subnode which represents communication edge, channels
>>>> +      and devices related to the Remoteproc.
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - memory-region
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - interrupts
>>>> +  - interrupt-names
>>>> +  - qcom,smem-states
>>>> +  - qcom,smem-state-names
>>>> +
>>>> +unevaluatedProperties: false
>>>
>>> That's wrong in this context. But if you add missing (and corrected
>>> pas-common) then it would make sense.
>>>
>>
>> Sorry I didn't get this point, could you make it more clear?
>>
>> The property for Kaanapali SoCCP doesn't follow qcom,pas-common.yaml
>> (the interrupts are different) so it was not included here, like
>> "qcom,qcs404-cdsp-pil.yaml"
> 
> 
> It should follow. We want the common properties to be common. You cannot
> have new binding not using common properties, because you duplicate
> property definition.
> 
>>
>> So I think just adding the missing "power-domains","power-domain-names"
>> under "required" will be okay?
> 
> 
> You need to adjust pas-common.yaml, all other bindings and this binding
> so there is a common part.
> 

Do you mean remove the interrupts property from the pas-common.yaml then
define it in separate bindings?

Thanks,
Jingyi

> Best regards,
> Krzysztof

