Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9C92C11EB
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Oct 2025 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760004558; cv=none; b=cwGAhxe697dD7jHq000yfkod39HWufM8Z/6/0x4dlXek5aW+wqQkGHsCbGHq8D9z4yPZfn8cu9QjqZv+EVNihblwY/wjW0fNCJS5CHmUnKS7ojnYCZ3uvyJAS9szXni39rIOQy2p3ncKY7TrioARy/Ivbr4Jjg077jjTME6PMn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760004558; c=relaxed/simple;
	bh=puyXQak5xCPes5C3V32+uKNZqqPJViEywLe19Swh2E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JlYeT5BRwshnD8mevrzYK+ACSplryw6oSQ3PTXtdLebiMyqC+msKzIxF84JZta52JLzZqfkbqjZGdWUjGBQRRLAlbR84fMbVH2VSVjE1wmaTWxXK4Hz6PVkWm2DShteM/ym869IAM1hpy5aN6vZN0SAS1iVZqsy+lMT6JOWW8qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXCcBTPR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXCcBTPR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EJEO019182
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Oct 2025 10:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ht1MeJWzpyV8az6qvFclkme+Dolv3sGsYlW3nKW5fGk=; b=JXCcBTPR4EY5gF5K
	J4dWhqNDnBYI2yBzkAuq1/y32hI4tJDw9PAnK9FNmfJEyw8yzdYvl6bKsaLAjQXp
	U0+eHrgth5ZZ4fN/hZvTag2Mm+vTi5T7zFhHasj03bvzg4OHiLS/DCZxvaUYTB4x
	5yM5NXMAM+mar9U7bmnLMeUcVIzc8BPWZL7LOu4zguO9Rb93vN2ARtE26Hc2kd+w
	p5CF6fNCDKsSFJwl2Zbb47lyBKABZd8DmvS35gx9hLttNvbWxdEpBW2Xvw5S/1+H
	x2YHgYhgKwOzvudlJZXJK0YU3eYCrldJYixlzF3+KkHpvFd11xNPDaeYASF2a7jD
	bQFFog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ntbey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Oct 2025 10:09:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-26985173d8eso30354205ad.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Oct 2025 03:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760004554; x=1760609354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ht1MeJWzpyV8az6qvFclkme+Dolv3sGsYlW3nKW5fGk=;
        b=USoZymDOlMnLctO/p8QpVup4phxA9WEmCxN9B/DErkMB4nAklhUT3OX/nciDRtDzsn
         qIqD/TQYefrEAaJJClJlT84sTR36bxDbucVgjPL/Xfu3BsbwYck9u1i+wkv8a9ONmkwD
         udCOtv57sTqcQ7jtjTpftjdP54uiO7pFjh2cuy8K4Er/lFdkDEt8+MT5mXP0DxdHVpBB
         DZ8ZU59SexXfIk071oGxOsh8HDyOZsdT+GWLYBFWjtpJpG23BwLnRXaNfNVnCw6D9VfW
         0Rpr7fZyRzyoAOw6XbtL4y8WYeNJQPFMnXxiaq61GpAq3doSChJ+XjIynAuzf4kWo4Lu
         HvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeou3NqMRDD5xKqOm6ZfWQzL70ryZa8Btm1IFeUf62GqY++0cnMiPlZint4ZItDT+kw9x+MU/hH2Ld4KmWseo6@vger.kernel.org
X-Gm-Message-State: AOJu0YzuWgwq1rPmNm82IOVp7v372tBtelZSaPDirHV4jc1T4PGUm6xM
	yEPyijuygSDDUvujJmqkXLeNQo01laYuf+LGtv55ok08ISIstzQSW5Pjg3XqUWg0/gpwM3PanV/
	wbHkNDMvAD5EvG5n+MNK1y9QoYAF6lpGxl0WMnbaJLG+oSWfXld59RZ2eoNAkk7ttSTfzaBjL
X-Gm-Gg: ASbGncvq13Glz3bEzl72DACU2RrHadLIU7yW2ziYXz5Dit3yGWYFIj0WWjQ7PRI/MUN
	e7b/fx+6XVmL0aeg4AklWgUXDYnliB3/CkKCRmB2qL93/2vvPNmKVFak2OF2Grarl7l5b1eF2cj
	1A3D5S74XyB0BQQy899NmRU3Z0lA9KT1NumX4vEv3L+I/0XXgdc4C6Jsfys5GgDIJMgfoo6J3rC
	4RUSXk48L78WITujtwTuEZxR4gOukL58oUZE9voO3VMKHKQvEM/qpxfCq0K6scJ9Ya2xG/qqFKb
	IuzRSfwZHYFfIffPGdGDQ7pRWuQiFjI8cMIZLmIJT+of9xr3Dnfbx1aeAyo0LC/OHWCvtGcXNIK
	AT+aB6ybC6gCYYFGznfNAzEXH7lPxRjEdG3VyvqWBLcIscFd+7JvpW4DB8mZt6TM=
X-Received: by 2002:a17:902:d481:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-2902723d3e5mr91832055ad.18.1760004554326;
        Thu, 09 Oct 2025 03:09:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbx041+jdp7rBtoEFzf+vebUcsdFZtILyK/9Cau44Kb79AycvWz2CsWtBIsKytzaPmMQlspg==
X-Received: by 2002:a17:902:d481:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-2902723d3e5mr91831775ad.18.1760004553869;
        Thu, 09 Oct 2025 03:09:13 -0700 (PDT)
Received: from [10.190.201.224] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1ccc4sm23764105ad.42.2025.10.09.03.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:09:13 -0700 (PDT)
Message-ID: <6aed71d1-ece7-4b33-8060-ea3a51015a26@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 15:39:09 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 Glymur ADSP
To: Rob Herring <robh@kernel.org>
Cc: jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        mani@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org,
        konradybcio@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
 <20250924183726.509202-5-sibi.sankar@oss.qualcomm.com>
 <20251002005434.GA2796203-robh@kernel.org>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20251002005434.GA2796203-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PTqFR5yXMM9l_q4dtIRJxWf-i_GC3JLM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/+yUFK06gwVs
 buUhdnx2yl7DmWUmEbXUWs7RA2VuPDHny97+FZNXTkkESTPtHPMwGSy10xzfVzKOvxMl/KfFKn8
 vTe8UmsRRmn0ovzFCw+JDe1nUPLxIeau41Rke8CwC4/uaOTH9hsU0Bm1iP8L2pJYovb449B4drQ
 SjbcSpTsQLzgQBzmGOwh/Zny7WdnpVH8hEId5PRNvZsfu17XpeTyN9dVJarj3JmujowtXuY5gmg
 rdYmiROyFi9+K0Orfcx/Nk/u9109GuM2J7/vl6yNfTqNYlbjwy5CJjvRX4kmhRhSSypHvdBueJb
 EnRh/FXWgb0BPT+sdk2SaRbmyBaUinMQpbHh9tWjri98InNrJRDqfmm02J1+4sz+ABvmj7LVy0r
 mxOxwJmP5q9EB8Sj0pnPvLX8HLZhFw==
X-Proofpoint-GUID: PTqFR5yXMM9l_q4dtIRJxWf-i_GC3JLM
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e789cb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=K0PDbwUCbj7d31mOmPMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121


On 10/2/2025 6:24 AM, Rob Herring wrote:
> On Thu, Sep 25, 2025 at 12:07:25AM +0530, Sibi Sankar wrote:
>> Document compatible for Qualcomm Glymur SoC ADSP which is fully compatible
>> with SM8750 ADSP. Also with the Linux Host running on EL2, the remoteprocs
>> need to be hypervisor independent, the iommu property is mandatory to
>> ensure proper functionality.
>>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>
>> Dependencies:
>> Peripheral Image Loader support for Qualcomm SoCs running Linux host at EL2:
>> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
>> This patch has a dependency on the iommu binding added in ^^ series.
>>
>>   .../bindings/remoteproc/qcom,sm8550-pas.yaml     | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index 2dd479cf4821..cba45ce2865e 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -28,7 +28,9 @@ properties:
>>             - qcom,x1e80100-adsp-pas
>>             - qcom,x1e80100-cdsp-pas
>>         - items:
>> -          - const: qcom,sm8750-adsp-pas
>> +          - enum:
>> +              - qcom,glymur-adsp-pas
>> +              - qcom,sm8750-adsp-pas
>>             - const: qcom,sm8550-adsp-pas
>>         - items:
>>             - const: qcom,sm8750-cdsp-pas
>> @@ -95,6 +97,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - qcom,glymur-adsp-pas
>>                 - qcom,sm8750-adsp-pas
>>       then:
>>         properties:
>> @@ -185,6 +188,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - qcom,glymur-adsp-pas
>>                 - qcom,sm8550-adsp-pas
>>                 - qcom,sm8650-adsp-pas
>>                 - qcom,sm8750-adsp-pas
>> @@ -238,6 +242,16 @@ allOf:
>>               - const: cx
>>               - const: mxc
>>               - const: nsp
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,glymur-adsp-pas
>> +    then:
>> +      properties:
>> +        iommus:
>> +          minItems: 1
> The min can never be 0, so it is already 1. Drop.

Ack, will drop it.

- Sibi Sankar

>> +          maxItems: 1
>>   
>>   unevaluatedProperties: false
>>   
>> -- 
>> 2.34.1
>>
