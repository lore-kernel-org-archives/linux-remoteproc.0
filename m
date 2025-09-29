Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0212FAC1C
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759140692; cv=none; b=KD3O9OePBAnsN0Swy8LAwticrPpa5l9em+7uovdwL7oi6nEcvpn2gINxXqXFXbFnoE/KEmE8Pca6isqr4Pkkdrjl3XUybf+GZG4yWVgRSEzkdrJLMnuMuHtH2RjgmT7d1N8WZqVN/wpFrzlGXtcxb8aT92osFqNwtcbL7bLTWL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759140692; c=relaxed/simple;
	bh=SNlPsVtVvLE+7Qc32BXbo+x7QO7oxtlaKyVIWZUYfdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2h+dD9nneoZ8yhujCsiLgnDv5+J6ftyp+kEMvenCUGmPZiQXEphL9rv+FSpAjL8P8b2Pu1sFDepK9xDhzd/cSPAIEQUtCCtdD6aPr+QU1oaWM66dvhG4Ry/Fqa8oTM8Dryzu5Jioc9k4HnijPjnkRvvwv5p/UM16t3B2I4ZWu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qi0UgehH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qi0UgehH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TA9RRX012714
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 10:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KAy6TsCY0/+8cRPvCOBR5q3OazEKN7PJw0wUDI9VBI8=; b=Qi0UgehHpBKMgFxZ
	nSMXe6dms8moOAvkBuo0I0/Ac760RPu2rluzEcx/+aRUAl3P+HEHRRlLZVayG2iw
	iXyXeKqXKJBok+hJu8IY3PvUvZp/buUpj8mfGO4P0uLUTm02u6QTxF9NGyCkt6Xx
	jgpasyBuVF2R755vHCaEi4qp/FGUhU2rZeDvmoDz1w8UPA1IQ7jIj15nCgMmiP3K
	/ZHISxC0WF7izjocTox0ROdnUakxLEZWKyhG2Y8XdZQXZH56dwkINon7fEgUUMJ/
	GpQZb7SmHC7FtajVB+i816WLE89GEgYcOiBuMUNK2fhpXpNZJQRZKd/60b+3BRo6
	PZV3gg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e78fvuec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 10:11:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b54ad69f143so6311004a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 03:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759140688; x=1759745488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KAy6TsCY0/+8cRPvCOBR5q3OazEKN7PJw0wUDI9VBI8=;
        b=n0Oz6EFdZxwuBIHzNgNVNon6H5EWcHozXjNNeiy2H/b7vgir1HREtMbeYtj/t1esJw
         dQFKV4tjpYL0VeR0UBiIR+8I1W+s1TD2CUeV3AyalG532BnZTVGb+sdhBJTy5mmVADZ+
         NdW668k3cv/rOb6Qm0QmpLn3ShI7iYeH2NlOvnxwUYdH2YPuwo9ERkPplCK+UNgXA0YU
         jhuIt+w2n2Wx4AOluUOhGBpo7MXUcDhBVejzwR+NF8DoJ3l90vuprWO4tXWxy/cabegi
         FfB7eu/g+qlaZj5ahD8hHhHpzmqwphO5vuU0+Wfb9Wjf77HcktKKT28IsFf8I0fRve6y
         jsqA==
X-Forwarded-Encrypted: i=1; AJvYcCVgeopDvklgHccwWBN0qEqx4FdYa2+uNdIm/Vky6AkirtfTBRtn63nIXMom4ldt7WX7R02T4biJDHmefqTHtOO3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5DoY+vW7YfgXK5gLw7eOd+wAioIN1z6fvj3XeUF+vcrCYsBJl
	Wn3B2zCpC29xLVI1lwiLWDnAqihZ1I9sZebNBMFZFgQ4fTKVVfgTlNHJ4TBKqBfCGmfviCOSBYS
	MlQerEX5Jl+cEK15I6CaMWIm4aPDlv5Gc+DJ9vmpJVOAcYYgD2lkrAWH9qmP8uNP674+bY0z3
X-Gm-Gg: ASbGncsyEqsO4Lqdp+u6SbY77m+NXK7RnkKP10GaRJZwEgASuKq/rAbe5ZhYcAIBhvR
	URqN9YRE2xHAqyGZOrmEnvO52cIh1fvrGKN49XZAOP6XGr+oIAeyOnpTP4pCrd4FPwmsQ4cF2Vc
	Vb9Sl394JzdAgSjMAVLL2KDILvuIjVb5L2JRVKwCfWwLwuNgucqeCTB0ebOW5z33p0L5yiS6Uhn
	0bQhChKC/hwDcAQ+cZhM3RjD98C28fYAvXnNHa7MDu0HOwUW3Vn23N6y0jnWDVfZkYSns4KWzEZ
	SstCv7IbYbn6ejdtDq1R2O41D5E4Tvq1tZ39hzQMc/qybvxtynxmLRQudkw4/QVydGyP0wCSAqC
	n2J2WNC+DrnkjtlK2MpWJPAUVxgJXzVbc/OA=
X-Received: by 2002:a05:6a20:9192:b0:2bf:183c:aca3 with SMTP id adf61e73a8af0-2e7c1eb1322mr19674183637.12.1759140688482;
        Mon, 29 Sep 2025 03:11:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzemKX0SD6GSKVWhUTVYl9RL2yj6+ykC20lMCtAy+GTBdDXQQON7rWIJ2aTOuGZH74HCqu5Q==
X-Received: by 2002:a05:6a20:9192:b0:2bf:183c:aca3 with SMTP id adf61e73a8af0-2e7c1eb1322mr19674138637.12.1759140688000;
        Mon, 29 Sep 2025 03:11:28 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c52eee5fsm11103220a12.0.2025.09.29.03.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 03:11:27 -0700 (PDT)
Message-ID: <4a25e085-39f8-49dc-85c6-7a4267689dd1@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 18:11:23 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali ADSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-1-611bf7be8329@oss.qualcomm.com>
 <h4lk5psnwx3ma3um2sozhcdccwhmgmbje2lgjks2czcrzn4mre@svtnbyzvrivw>
 <d374036c-1263-42f4-b9ae-13b21427b01d@oss.qualcomm.com>
 <maeobo6qukgzn3acwtvhfrvwrfwo4q5pzspem6htbybr5xuwlm@opagojsav6ey>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <maeobo6qukgzn3acwtvhfrvwrfwo4q5pzspem6htbybr5xuwlm@opagojsav6ey>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DZAaa/tW c=1 sm=1 tr=0 ts=68da5b51 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dVhWkjGdtg-RV6iV_LsA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyMiBTYWx0ZWRfX259it10+f24c
 5Q8tW/7nkSIwVk3nVDrXQOjwYwTTXiACyj+Uv6k7eMlzHsizamr3nBL/m7npHkEM86q/7d67Hl/
 Tz+4P58YMEbSWnDR8zeBFEOblVplfZtazqZa/+1RhoBQ6coav8MQWnorWgUfLdQyEQ061Q71WxS
 KKPMqiGFPStmDE0H93SkRUh3YXf5Ndo+K9dW/YHEpOdRTB5I9tbDvQE1SedgeAM/Cr9px7A2jpq
 PYLSnVwDDCG26Go+kx+BrcEBtnhTnMoFEFQ4y9PbBM1hgfvJyUsmm9IMF5TcfbN7I68WA4rvsSi
 i60N5E41Ojcr2efyHCqN8E/8xa4w9mrf4Z39gMVt6xNDXmWimJ3ZZrsTbDbPDDNfCLC8mwTC2Zo
 1XRqtZN74JW1bHrMZgX/PvhAIr7eoA==
X-Proofpoint-GUID: wZW6VNfXQ5iQ3A1NhgSaHx1-mSUaAvtk
X-Proofpoint-ORIG-GUID: wZW6VNfXQ5iQ3A1NhgSaHx1-mSUaAvtk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270022



On 9/29/2025 5:39 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 29, 2025 at 02:06:11PM +0800, Jingyi Wang wrote:
>>
>>
>> On 9/25/2025 10:19 AM, Dmitry Baryshkov wrote:
>>> On Wed, Sep 24, 2025 at 04:37:22PM -0700, Jingyi Wang wrote:
>>>> Document compatible for Qualcomm Kaanapali SoC ADSP PAS which looks fully
>>>> compatible with SM8750, which can fallback to SM8550 except for one more
>>>> interrupt ("shutdown-ack").
>>>>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 6 +++++-
>>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>> index 2dd479cf4821..be9e2a0bc060 100644
>>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>> @@ -28,7 +28,9 @@ properties:
>>>>            - qcom,x1e80100-adsp-pas
>>>>            - qcom,x1e80100-cdsp-pas
>>>>        - items:
>>>> -          - const: qcom,sm8750-adsp-pas
>>>> +          - enum:
>>>> +              - qcom,kaanapali-adsp-pas
>>>> +              - qcom,sm8750-adsp-pas
>>>>            - const: qcom,sm8550-adsp-pas
>>>>        - items:
>>>>            - const: qcom,sm8750-cdsp-pas
>>>> @@ -95,6 +97,7 @@ allOf:
>>>>          compatible:
>>>>            contains:
>>>>              enum:
>>>> +              - qcom,kaanapali-adsp-pas
>>>
>>> This one and the next entry are redundant. Do you see why?
>>>
>>
>> This one describe the interrupt:
>>
>>   - if:
>>       properties:
>>         compatible:
>>           contains:
> 
>>             enum:
>>               - qcom,kaanapali-adsp-pas
>>               - qcom,sm8750-adsp-pas
> 
> It's still redundant. Don't you see it?
> 

sorry I didn't get your point here, could you explain more?

>>     then:
>>       properties:
>>         interrupts:
>>           maxItems: 6
>>         interrupt-names:
>>           maxItems: 6
>>         memory-region:
>>           maxItems: 2
>>
>>
>>>>                - qcom,sm8750-adsp-pas
>>>>      then:
>>>>        properties:
>>>> @@ -185,6 +188,7 @@ allOf:
>>>>          compatible:
>>>>            contains:
>>>>              enum:
>>>> +              - qcom,kaanapali-adsp-pas
>>
>> This one describe the power domain
>>
>>   - if:
>>       properties:
>>         compatible:
>>           contains:
>>             enum:
>>               - qcom,kaanapali-adsp-pas
>>               - qcom,sm8550-adsp-pas
>>               - qcom,sm8650-adsp-pas
>>               - qcom,sm8750-adsp-pas
>>               - qcom,x1e80100-adsp-pas
> 
> Likewise
> 

indeed, here is redundant as "qcom,sm8550-adsp-pas" is added in
the dts. I will remove this.

Thanks,
Jingyi

>>     then:
>>       properties:
>>         power-domains:
>>           items:
>>             - description: LCX power domain
>>             - description: LMX power domain
>>         power-domain-names:
>>           items:
>>             - const: lcx
>>             - const: lmx
>>
>>
>>>>                - qcom,sm8550-adsp-pas
>>>>                - qcom,sm8650-adsp-pas
>>>>                - qcom,sm8750-adsp-pas
>>>>
>>>> -- 
>>>> 2.25.1
>>>>
>>>
>>
>> Thanks,
>> Jingyi
> 

