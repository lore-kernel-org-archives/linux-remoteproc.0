Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547CC250BEC
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 06:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759126872; cv=none; b=SGSwXJWORAP3TJ8b01xNVw5MG9XKTbmtQgTfYV8H+FYONQjDv1NzpV3GfI4sZAvqM7L6DE+AIVK63JTmc4s0APebLZnk2g7mfHk6yYJc7WFjLzhSFUDQe2OxYdFz6FrSYM6Tg4UxzCpIEGBvb6I4G0QaOd1oJlOuj2IQXJS/1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759126872; c=relaxed/simple;
	bh=q2Ex45lu0UO1PvLVxP8lWfrNJZYuJYUaYkJPz++bp7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ct7eH3cUeFJsIRRHCASZYEvt0mOgrlBC9wgeFTt0apJW+q5ebdP9chGxZ2TuTYa470lNC6lt7sbUtcvh+sT9yTEnB7SbgpxUrG654NvFTbY3j5dkKBep6yiqbtscEi/+x6+KLv/DMs4yGd0zaP5ZsUmymAgiXnkp/fVGIwOCKgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBz9Lq7K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBz9Lq7K"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNSDl4007658
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 06:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T5RCAnxQPgz+f42q/uUJ/xybCFPufzjjYf6jemuzLns=; b=iBz9Lq7KZUAWV5e2
	M2gRNFr9+vsxwYogYHviBud2IpabKlqDVZIp38xfQ9RDWLmS6ghYCO2RbJOtrroT
	UrT6chIkaQSSw8VmH/E5qavZtSEHXfUtuPjOdUqerdCSMJWaOzcHJA0lORQyrh7s
	WXnvoCj7puHQ//FiCls57Et4m2cehQ8TpTXyqf44sW3Wx6AcFQqOzVx6C0Bqhj4y
	rZe1iUjb1pKlxN3B91CM5Zpp/rUjzjz/KHE5gFM4Ybss48ei139M2ZsWj+ttlAZY
	nn50H+OCzMEZBD27ssozrEVZrTm9YlXWXB67itOyQHBHWGatMpDBJ0MmRewKTkfE
	0I9+1A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tm2gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 06:21:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-781171fe1c5so2185296b3a.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 28 Sep 2025 23:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759126863; x=1759731663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T5RCAnxQPgz+f42q/uUJ/xybCFPufzjjYf6jemuzLns=;
        b=QOqgTofcCbk1Uf8KA+lHLWbMEnq1MJwYdyP7wQQrDHygmmngyG6NnN/xDOaDtPCMpq
         KzkmHEuN8D+F20RHPEimMbkDNlpwQ3rtEHacgY4IrrbZlcboos667zRKE8+R2XLPQpeO
         Gq/Gq+rr2MpCKGoq/qGSeBlLWsVtI8NaZxUEsecxwLKU81NybUP8plE1acUPpr6/LXT0
         e0Ky8WchpLo9OFcarHo9lF2Iw5t1uHMiaF2KNQc89yiKJEm3uGXmITBy5+EDQrjtDpbT
         Txz9rQwnQtdu1kGc6GHXtLZuGHRqWGIgGbpm2k1UugtQvXxoF3gqfjGGgfccdeeGBxmq
         5Ezg==
X-Forwarded-Encrypted: i=1; AJvYcCWjiVJ69CKsCGepaMCBwiux5HBroPtCqH2HskM98q1gjFnDqVyuH3p5/0VhX355lsp/iaunEjsiAOcgxNd2QV0c@vger.kernel.org
X-Gm-Message-State: AOJu0YymvhTMQ+lPIV1D1hRYUYpAsQMDgdKikDODuDu00L8qGoNalzbI
	yZhBpoZELg0+jywr1AjEhiS6Fay3ItzsLIi9eAOBt4ZSIF8mq0HKJBjFZ8eILs40rvfObLogUaS
	9+Y7hzt9G76w4yKvNXHLMLndtBNziFBjQLoi6X4Z78z6dWdvL4mwMfC3SQJTnnIs0uXevkUIqIE
	sy22Y10Qs=
X-Gm-Gg: ASbGnctPqdUKxp9pGa6o1iHtDrNb1erjPAWtK+X+RXMpf/B8MUEzRbDBIIDH74xX9Qs
	zjJum5Hm7VPPraXQJISdPl90B07nXZGgmsiYqqgGai9CjzRpXTbLPCV2Fe2xG//Lw/7ka/A66n6
	Az77A8ReB3AgGYNHIiWe+IJ+dZ/y15GWJmsttKebqt0IPPr6eSHdzpngooPDX73WKAz884kppzV
	Hnb7rZ9Z8x2/wJHdLdf+ab1ZH6LDygPbZtW8IbTp75nFkpwmIg57qBoMeik/H7WMqrnkEdqjIGp
	QsdKE5lye6ciXzaf22mMitlA9MHkCFk9B3IpVpUG0LwZ2DjMcE4LPasbHpD5dF0QnudHa0BKGt7
	KKthtmzrfRVH6lDeD3dRPGmrCQMI2SpVqiYg=
X-Received: by 2002:a05:6a00:23cc:b0:774:615b:c8ad with SMTP id d2e1a72fcca58-780fce0a094mr16191385b3a.9.1759126863017;
        Sun, 28 Sep 2025 23:21:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyXhVu5YJr/Bl08pETVz+ZdPLkfd/FjtkIFppmpYj1TwDX2jO0Olrp/Qot5cdvw17ItUB60g==
X-Received: by 2002:a05:6a00:23cc:b0:774:615b:c8ad with SMTP id d2e1a72fcca58-780fce0a094mr16191351b3a.9.1759126862600;
        Sun, 28 Sep 2025 23:21:02 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-782634d2a7bsm3892488b3a.29.2025.09.28.23.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:21:02 -0700 (PDT)
Message-ID: <5820a9a9-4474-4c4d-905c-0efd9442e5e1@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 14:20:54 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
To: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
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
 <20250924-knp-remoteproc-v1-2-611bf7be8329@oss.qualcomm.com>
 <CAJKOXPc57_0pJ2ZWf2cKSKAcQMc3S_mHKQxJDzWH7t=mgim3CA@mail.gmail.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <CAJKOXPc57_0pJ2ZWf2cKSKAcQMc3S_mHKQxJDzWH7t=mgim3CA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfXy5IM7hOw/SB8
 hylwaysamwcmuoUxxPlFyvE7JhITih8VzxqTEBzgrpByJj5kSl24+r+AAYAYo6Rv/DINvf2BLZC
 CTEE0h0HQKTHDwPh2c0iGAl0L2aPYHWihgcA0G+f40FZnIMPLzPhxk4KdMJYpFBp2hC7hVl3vVU
 +A6/3VGlgPklWqWFWH2GN1fz8nzjuqLbu6bcyQtffCsipNEXP3jMUQvCsNSjcGYGmnI1i4NHRpn
 T1/xYEyTRRQ3+xrpl5ULZGaKYBNFzRmiNczDnBzozaBpUt/q19eYhQyqfM0Q3CkbDZEOz447jR0
 bIv/BDRwgaXhbhwmAv7ENv/uuNV8z6/3mYmpMoqO3x5lMA0RKCXWVzVdxkU3eZU7ripjRp1h43U
 91ftgkbbell8QIAWuFgHndrc+Fd9Og==
X-Proofpoint-GUID: wFDMHrfIwj70uKlZOffnhqboeIfRB_C1
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68da2550 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yr-pD6fi0WPqCAYln34A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: wFDMHrfIwj70uKlZOffnhqboeIfRB_C1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029



On 9/25/2025 9:48 AM, Krzysztof Kozłowski wrote:
> On Thu, 25 Sept 2025 at 08:37, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>
>> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
>> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
>> interrupt.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index be9e2a0bc060..031fdf36a66c 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -35,6 +35,9 @@ properties:
>>        - items:
>>            - const: qcom,sm8750-cdsp-pas
>>            - const: qcom,sm8650-cdsp-pas
>> +      - items:
>> +          - const: qcom,kaanapali-cdsp-pas
>> +          - const: qcom,sm8550-cdsp-pas
> 
> 
> This time maybe without HTML:
> 
> This looks wrong. This is not compatible with SM8550.

Could you point out what is the difference from your perspecetive?
it is the same as SM8550 except for there is one more interrupt,
which is also described in this patch.

Thanks,
Jingyi

