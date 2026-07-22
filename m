Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891CB24676D
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 13:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727502; cv=none; b=UQZHFEI0fzEgKLk0jNCC2ho9l8NVaqtUH35O/Wsq4Hnp8eohOe7yLIG3++aalJ4nIhwTUpG9gTePKE7SpNEhweOX13c5qbu5q3rbsWm7CKhORzUfmXBDyNfS0hDYnLPt4vbDbt6XOCEzFMzHb0VmzM4RLcca5qVyvLXBt51k+0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727502; c=relaxed/simple;
	bh=Tn4zmq2o9A4/NAroW01ut1DtvvZJ3tnPOffipBKBe2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yc2Jeakg0slvoW0fdqabr7R0WY432mx8m11MJ0kjDrOt0ERlRu66b6beKH66LrQj+TqA1jnmU6MdJ97Js1z0Afb4EAS+Cy+ZhFo3bQwenS5LALOQfbM7w3w8TSjvP7xPQ7iVvCJ6FFHF5Hoo4s+ZQulUKoKs682wJCWiFZSvnVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqE6IwFh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJk2/uWh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqE6IwFh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJk2/uWh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWM7n646335
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 13:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2l3UPMiH4BMjDVBQXY9WDYnPDDLaNtRsBeyRv5rmKZ4=; b=kqE6IwFhwLt8xaS8
	uFN2hqohGlBHEeDOLzkUJR0/fBwzxJy6qye3Yq715iXb+72l1ZT0fgHjRm/abXxa
	8GAYkV72G4Ow/eqPl9u/Qk1d5CCDkwiM9iJo8CebjECRPzr22eImqmstSRx9Og77
	rOEj9bAnK4zBaDHbFt7d+A3vApPxTB8iB7SX1pmSHzPWUETByQr9XGTeLh26hpPZ
	xlkMSeF9wCVLfehXZa3Fb5zeZpRvJLq6b8OkEkMLE0nfRunxCsP6pu5gPwF8IY1C
	RhthE1UW7kNQlm8IkovmLQM3bkrIEZb+Afb35/J5neUihZ+Q/XZNNgOEGDh5XnY9
	KvLQeA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju2292d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 13:38:20 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7eb89852728so8350977a34.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 06:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727500; x=1785332300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2l3UPMiH4BMjDVBQXY9WDYnPDDLaNtRsBeyRv5rmKZ4=;
        b=hJk2/uWhL/2mKhO52NaoqqpHKTuXDIdtjX8cfC0fmhGBGM5WMrtufXUvwCS4xAsuUK
         GnbaYxrTEiKudNUPCXMTzOuhHXjTeMyUIr+B0bBe8LMmofO+X8X6pT3ZoFehZDg3gj+Z
         WkC4cJnb6c6EQAw+DgWgjmc8RDyGFmDb9ShO8F9s/XAzuMTxyp5xMVFrct6f0a82WAEF
         ZlA8OmQHIOConbsNEKKQUPAHXyZR6d4wuTtmJL7sMWmNaNTrgScc1iT1pbiyv1fhUzN7
         poPStKqZWqo01trBBykdJNnO/2fDKTZ7RVPeYOpBqjR0qTvNzDk1DTY6Yl8oucrKGFTD
         88wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727500; x=1785332300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2l3UPMiH4BMjDVBQXY9WDYnPDDLaNtRsBeyRv5rmKZ4=;
        b=IJll2Pt1qAYSmFei6UV3IF6ia6iV/5xx9ACLtGUZF3n2RGUWB/J0Aq6mLnJPda/LlC
         xEIVrfNEQw6j4o78OP3Qb+DzFwEa5VhsYEtoDKTZjoyKRiXGwJ3djN1/eMQMQPi/IVtO
         Wac+ELjgxgSBtWmuqyTTqD30vnNkTZQhELSgW11uMCRQI7E9W2usP05Gjv9z27eFHpwi
         ALTh6LAK6my0usgECpzz7poqQ2mrdWUacaDh9lNlF9jTwlan/9NSgTAyKcSbR4PXy06n
         0RNDwCcYmJcYml738PxdhO2CBMWEh2wwW1Dc3GDzAA77pJS0MRzI/j8TXGE2beKKtqZV
         ET+g==
X-Forwarded-Encrypted: i=1; AHgh+RqnlpwGYUk3vxBbnpfRfaLsd8MLCA+SYodLfmgEKLNTRTdKe193mi58DvtmErRJd08Twz+oWFP/jltwiKUEpoTG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/peBeZIErw0+e+FFijsiAOL/S12hAN06wx7KfFuXA/4rmrnc3
	OTDkGiD+ocpqVIkccfH9JWu/yS9H7z2718mK/6znxGwI66CDPgQoni6HHXLhgYrZ9tk61SERUZj
	dmXPXRcsdBnaTC4/Y+k9waqgeYsWG3JeWWtRQmM6BXX10c/9vZB6OFdmNiLHD8/g74OxDA3mW
X-Gm-Gg: AR+sD11JToZW8FRpgCwG3qt2fmf0ou8jbaywuHibniAtsBrgC0YslRxgXoJP3PgYHJL
	3hjOmezK7nUxgqmDsINnzPnwT8hJvJewIctMz5jVK+12M2oUa1Mn/QiQ4BN2z76Xx/fB7cqjOWn
	xF4CNp83GC9759jPwao0zwE1AmHc6+ILXCR1Pt5u4KPzVIJt4otHjPJ2W4Yd5TJgrBpeV2VUl+W
	Oz0Yze4sHV5cUmuD0W25pFG5JPR96R/mc+QY/jXiGWlMd8HkJyN/RmjLaYCBXpuzQ0yBzsj0Bct
	L3NNSu7q9W4rNGdPYVANhkLTXVLSFXfLW/gnbn/wRtZOyLP2KaBRDDe6+kMTSydP1P64vIvRbhW
	751K+is2YplbuGjLidE7xn0ftDOy3/W/m
X-Received: by 2002:a05:6830:8387:b0:7e9:b4d0:53ac with SMTP id 46e09a7af769-7eda4d479b2mr11916585a34.29.1784727500128;
        Wed, 22 Jul 2026 06:38:20 -0700 (PDT)
X-Received: by 2002:a05:6830:8387:b0:7e9:b4d0:53ac with SMTP id 46e09a7af769-7eda4d479b2mr11916547a34.29.1784727499674;
        Wed, 22 Jul 2026 06:38:19 -0700 (PDT)
Received: from [192.168.1.11] ([106.222.235.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee29db292esm1359458a34.6.2026.07.22.06.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 06:38:19 -0700 (PDT)
Message-ID: <f3864ed8-34bb-42e2-a821-ac2d1a653076@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:08:07 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] dt-bindings: remoteproc: qcom,pas: add
 #cooling-cells property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-1-99620e07f505@oss.qualcomm.com>
 <20260722-active-kangaroo-of-order-ebb28f@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260722-active-kangaroo-of-order-ebb28f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60c7cc cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=/HV6WY1oXUpe+KOgORLkYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=NFQhSzq1V_q7mLtt_zYA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: CCmlkcw9fv20j8YSAY94nRaNH1CR0k7b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX9sFpoOIKzTap
 PPebht5b0G5JrUJEopZUqiJN0sPLDcwtNMd8R+qdgJE2twJmTU6WCTBvULeMvJfwFSX+8Z+JLsW
 cV0uf45cNfZQGS23Z0IJ3TWymN6iG0c=
X-Proofpoint-ORIG-GUID: CCmlkcw9fv20j8YSAY94nRaNH1CR0k7b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX4goYfX7AvdzX
 wA0T+KMTSl/H4cgdgUxpQPzxUmZxmJZrSmq6SoCQwcIIPEgXiZwSoiNixiTT16sJsUclEtTrnmz
 pKXcb/uI9wwgw2ynQUWDGEJSNh9AM00t+CHJWddFn8/WAuEQP8v0M2fIXPAyjSfTiyEiUtMG3UQ
 gorT/0nCGnH7QcPWBaPZQHOiCcJV0U1Hf5BJ6bqWOB+gOQjbZ2fLRFW7STlvlgtEvURonqtaj1G
 beBUpauNWrGulIdgOOX2p0zc3dQvjQ60DDUOgl2EXKteSkNyMj1GwWsXm1vmHHYC+Ea1dnwfZbq
 CF39pDs0Ea5o6WcZSViDY3Zk8gA6910eB9/zIbciE8jv/DL9xVJKtprii8epaAzeJbNoX1bfYWt
 OdPD3yIVQYbkXP+IABvqUFXFmmW+G9Z+7ZKgmcEaQ/tRT/8sILbFLjxoXrOIfVvecqZwZNRrCU/
 9f+C+YMOCgn5MlH0YSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220132



On 7/22/2026 12:36 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 21, 2026 at 11:58:58AM +0530, Gaurav Kohli wrote:
>> Document the optional #cooling-cells property for Qualcomm PAS
>> remoteproc nodes so they can be used as thermal cooling devices via
>> the QMI Thermal Mitigation Device (TMD) interface.
>>
>> Qualcomm remote processors expose TMD endpoints that support thermal
>> throttling through firmware. The cooling-device specifier uses 3 cells:
>>
>>    <&phandle device_id min_state max_state>
>>
>> where device_id selects the TMD endpoint (for example PA, modem, or
>> CDSP software mitigation), with constants defined in:
>> include/dt-bindings/thermal/qcom,qmi-tmd.h
>>
>> Example usage in a thermal zone:
>>
>>    cooling-maps {
>>        map0 {
>>            trip = <&cpu_alert>;
>>            cooling-device = <&remoteproc_cdsp
>>                             QCOM_TMD_CDSP_SW
>>                             0 THERMAL_NO_LIMIT>;
>>        };
>>    };
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   .../bindings/remoteproc/qcom,pas-common.yaml         |  9 +++++++++
>>   MAINTAINERS                                          |  1 +
>>   include/dt-bindings/thermal/qcom,qmi-tmd.h           | 20 ++++++++++++++++++++
>>   3 files changed, 30 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index 11faf655f530..39e79a1c1079 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -77,6 +77,15 @@ properties:
>>         channels and devices related to the ADSP.
>>       unevaluatedProperties: false
>>   
>> +  '#cooling-cells':
>> +    description: |
>> +      Cooling device with three cells:
>> +        Cell 0: Cooling device id as defined in
>> +                include/dt-bindings/thermal/qcom,qmi-tmd.h
>> +        Cell 1: Minimum cooling state
>> +        Cell 2: Maximum cooling state
>> +    const: 3
>> +
>>     glink-edge:
>>       $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>>       description:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index dcffe9fc54f6..2d4d19201aec 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3423,6 +3423,7 @@ F:	drivers/watchdog/gunyah_wdt.c
>>   F:	include/dt-bindings/arm/qcom,ids.h
>>   F:	include/dt-bindings/firmware/qcom,scm.h
>>   F:	include/dt-bindings/soc/qcom*
>> +F:	include/dt-bindings/thermal/qcom,qmi-tmd.h
>>   F:	include/linux/firmware/qcom
>>   F:	include/linux/soc/qcom/
>>   F:	include/soc/qcom/
>> diff --git a/include/dt-bindings/thermal/qcom,qmi-tmd.h b/include/dt-bindings/thermal/qcom,qmi-tmd.h
> 
> Filename must match compatible. There are no qcom,qmi-tmd or qcom,.*tmd
> or qcom,.*qmi compatibles.
> 
> Which device is providing this ABI? PAS?

thanks for review.
Yes, this belongs under PAS. Should i rename the file to pas?

> 
> Best regards,
> Krzysztof
> 

