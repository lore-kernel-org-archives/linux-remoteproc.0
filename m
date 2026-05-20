Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCF330C61B
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 02:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779245072; cv=none; b=FmeNa/yhugBPMmKvv21fYp37ILEU/nAMm1MYit3VBkky0Wc9O2sMGxCNpQutVWtXQgqAWgKHoc6lHaHT7yIBEWHU6mzf6XsisdRAphX8EIdMJEjkp9TT8e0GDCJ/LqfSzj3xl/gVBNfLLq5nOyGyYqr7N4tFRcA5h6A+PBzxrcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779245072; c=relaxed/simple;
	bh=DaRJ3NNbsbZrzfDzFuZvPTcUEpD+OYjkRzh34FLYT9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ikvJ7AYE/NECOorf3Uttj3sk1LzXIkM4R8wAoDbLi9SN6X92bFyA07gaZlhLtbliE7os1PfKZkaPVTLOO4xszRwptLo91SBPD+pc/dP9VpTdOUkH7gqcS4sMCXvUWbhiXbvRaqBa2Wjvw0nlJylu1WXx6OXEJir3QnIodap+T/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXSkq/88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9jG4E0H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXSkq/88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9jG4E0H"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JN1L5V1637009
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 02:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olQmU444+iBh3uhTb/gQNnT9OSS2Ihic8JFh6v6izo8=; b=SXSkq/88Jb5NzbxK
	neJnSME7YELrLujNEzuYhfx4w2kuMBmxkg+MM8sTxXlhUV/jsFdiWTKzjS8PdOy8
	AY/HQ5AuuhewHNV3CBNwebxj03hzEeExVYSpD/Q3zuPO8kwCIdekqGvMLOxnxxS+
	hw630nM8Ln9D/8E8R269M7VrkM7wC3dJJMW0GRJCTPHKf7wIhsiQZThHhcscJ/Vo
	wgO1an0Qb17w5yT1jlIjwTBRRWGkYRnjkzBb8sUCCa5Gwzd9pk7WDnX0oKtRPBb5
	P7ZdRR1hZkfvzjUSAV8WrO7kBivI57/7W8OmS1LJVCJQqEu/WwZV7b29qjBR3Zlt
	XgCe4g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sag21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 02:44:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-841127f960fso186266b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 19:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779245069; x=1779849869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=olQmU444+iBh3uhTb/gQNnT9OSS2Ihic8JFh6v6izo8=;
        b=R9jG4E0Hd69+oUrVZkW29Z9Sx8cbn5nykVmVyECNQCdM2+xR8uL+sDMz0NuN6SvWEq
         eLk2Ib7Y68TBkkYILvEJvDkC1ZHuySquaZUiX9QzlWfgnFuoAHOp3ae/yORpWLyG0K8S
         EltkWZD77ntji5NWtcpxnVomfksXCmL64ySVLVKAyJL/hW+PsqGpuDgw8tKS3wu9UNhG
         8V62rnmKcphczePYgOxcYhCZTEkf9I5osAi388k8Rz3qF6HBV7+ZPDE3sJJ2b/vxaN92
         2a6tWGnLhuLpc3MGf3aqQgx2bMpEf4qiDlcwkCY7GlYWF7u/S+DTZpmqzwObKw/om63h
         Nalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779245069; x=1779849869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olQmU444+iBh3uhTb/gQNnT9OSS2Ihic8JFh6v6izo8=;
        b=P3BRMhGlEGn0ntknKUsvGNfzodowyaCMGso1wOEUzMaILV9EeHPLZy3QYJBkN/MJrc
         VWzWEnBnYNUrbwuRvyH+PZVjG3zo29nXZHzyjoUUtTjWfJzYY7ordah0yF+yVLl1yLr7
         im7pv1aG5JwN10QAcUiOKL4C53zkwJBoHZDFCG1pAd+y5hPs+yeGR2FIOTx1NE7RjLci
         41sJxIVr9mgCupCuG1M38T5WTVy9PWyaDVKy37qCURRu+DTNBo1pQLcIrS2503oTiydx
         WfTUHDeXPTtAO5Mid4UTjHbjYR3seAj4KtdYW+QW/D0np3j3TUOJ9w4Z5VYy9eM87lo8
         huyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WRRhhkPOUDng5gCpZaNTHZH8nIG1aJUywNQtq/pdpfsJt23erdI8WVPMngpTeu5b75DSgJ40gkT1LZW0mYCzs@vger.kernel.org
X-Gm-Message-State: AOJu0YzD/kEFnFxVQm3w+uAvbIRkuQPQnL2yLt9NPrf42KojZywGRMqO
	Ci54O+pEpH38lU/5SdSJURfRk/KhMAtqzARjKS6pXI6+tjRd1tF/lLL9CdE5nbO1j4XBJNi3Y1O
	bht8+RBXZ/FSDguJk4bkzxQy1+iNlN75RClyzvOex7WPLyIZPNeMa/gPcBWNFnUdjD51P2JqX
X-Gm-Gg: Acq92OFA3k/BxYfOkMTJneQA0TxrP2Bb7gC7OqGdGUUhp2vK/jAuXL9noBjsW503bNK
	M4YIXr4bZ1u+p++a/dDrmHgpm6nOB2nNXLp/ofMMmI3hW5KQm5JFIKIBRZkXXhVvfHiBB9XzUYL
	enuc5sj8sj90Gi9joIqNg4ZycBwtU7RaR/2e2b/ndGDU662SLLEQrX3zCWfYxDTWSUddK2cHOZ7
	nXUmDSM4KGJn5a+9ALHgQSOWLxDq3eCNibaAtwDF8loY2aItlyGlYuZk/NxjbuDIteSGtqpMtRa
	8m8vtLKE8vkI5aoGY3EDFHeF/htY4Cd/DdY+JEQVrm0hhSN0Vj5sVL+sEfCakl0HbfhHYxebYBS
	AxmRkLc4BRx4pd1XbGw1KrcIXh2jJ2T03SoHgl+2KK9JBBgi2YUGLknr+JLX1KTqjeuldLaZ4Ie
	yxsyX/lWbko1yiRe+B
X-Received: by 2002:a05:6a00:b4f:b0:82f:44dc:f85c with SMTP id d2e1a72fcca58-83f33de9efdmr23286773b3a.34.1779245069110;
        Tue, 19 May 2026 19:44:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4f:b0:82f:44dc:f85c with SMTP id d2e1a72fcca58-83f33de9efdmr23286747b3a.34.1779245068609;
        Tue, 19 May 2026 19:44:28 -0700 (PDT)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c39esm22560389b3a.36.2026.05.19.19.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 19:44:28 -0700 (PDT)
Message-ID: <08f8e935-1c0b-4842-a5c6-60598896f07a@oss.qualcomm.com>
Date: Wed, 20 May 2026 10:44:22 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-3-cf5d0e194b5f@oss.qualcomm.com>
 <agwjP2YNVeVtcYB3@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <agwjP2YNVeVtcYB3@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAyMyBTYWx0ZWRfX2zDVcObK8AsB
 s/927AQmirmzMEGn46wKDl5riLAYm3FE3+UfJ4bY+Ravy1+KhOfVosSXty2zccaS9KgQTluQEgh
 Rhkcp0rPmTzQYTybimhEvgYCssdwssirhCyejRyRsWdDnTkf3G99qJjPcO/zywCCwFFMzqPAoP2
 erKCHszbG0yFSfIiM9iOmyReB9W5UScGGPAT/1ec0JFZ+/U4QfIRPULpViO5LEcZ8piLjJ4/lUV
 Qh8NX29inSYoNCLFPtYWHw+TJEx+phWHnnDuCb4KLWOh6dez1+OZ5MIuEXJvKGaWEgrA0VZKXM5
 Ec/tDheZcyJhZ40iuv4/C2dIKYBc+jime0gILdEAYOKRH3lBNAPRHmPaGKDIPt9s1HXIlvehtXA
 LCosqYUInH6+Wo9JUcjHNekbM5uAomm2HIK0HsGVjmx9YEdMvjEtjcWLc7YKaMJR9D4AuqXqZjG
 pISxuLYd/hF6ZgQZhFA==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0d200e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-51UZLpHGQMOatVTR-gA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 1Kr2wOvSa9TmW8v6iNnAzqge9XFkscj3
X-Proofpoint-ORIG-GUID: 1Kr2wOvSa9TmW8v6iNnAzqge9XFkscj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200023



On 5/19/2026 4:45 PM, Shawn Guo wrote:
> On Tue, May 19, 2026 at 12:24:21AM -0700, Jingyi Wang wrote:
>> Document the component used to boot SoCCP on Kaanapali SoC and add
>> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
>> the "qcom,smem-states", "qcom,smem-state-names" in the pas-common
>> and add maxItems constraints for SMEM properties in the documents
>> that reference to pas-common.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |   8 ++
>>   .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
>>   .../bindings/remoteproc/qcom,milos-pas.yaml        |   8 ++
>>   .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
>>   .../bindings/remoteproc/qcom,qcs404-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |   8 ++
>>   .../bindings/remoteproc/qcom,sc7180-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |   8 ++
>>   .../bindings/remoteproc/qcom,sdx55-pas.yaml        |   8 ++
>>   .../bindings/remoteproc/qcom,sm6115-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm6350-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm6375-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm8150-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm8350-pas.yaml       |   8 ++
>>   .../bindings/remoteproc/qcom,sm8550-pas.yaml       |   8 ++
>>   15 files changed, 263 insertions(+), 1 deletion(-)
> ...
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index dc5a9981c12c..e81ef400555a 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -46,13 +46,17 @@ properties:
>>     qcom,smem-states:
>>       $ref: /schemas/types.yaml#/definitions/phandle-array
>>       description: States used by the AP to signal the Hexagon core
>> +    minItems: 1
>>       items:
>> -      - description: Stop the modem
>> +      - description: Stop the remoteproc
>> +      - description: ping the remoteproc
> 
> Just a heads-up for Bjorn, this will have a conflict with Rob's phandle-array
> change[1] on linux-next.
> 
> Shawn
> 
> [1] https://lore.kernel.org/all/20260507201749.2605365-1-robh@kernel.org/
> 

Thx for the info

Thanks,
Jingyi
>>   
>>     qcom,smem-state-names:
>>       description: The names of the state bits used for SMP2P output
>> +    minItems: 1
>>       items:
>>         - const: stop
>> +      - const: ping
>>   
>>     smd-edge:
>>       $ref: /schemas/remoteproc/qcom,smd-edge.yaml#

