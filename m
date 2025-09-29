Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445032D593C
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759138881; cv=none; b=AUBpCf2Ry1nZTlLp6yjA4lmlcFQOV4WXu0aX230JgQoYlXgVM9veZWKtSFKWJSB+cI+mhD5lPViLe5IUC049IGTOCVyssVnEBZbLplULSmd42ev8mWW9B0hkGHgCE4OXtwPcqhIiy3CXw8oHS/Y+wKFC57jSxDtVwkA2RI/zwDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759138881; c=relaxed/simple;
	bh=XEaiSZYGUcaHCJQNcBQ9owyrPFLPILRn44ra83b033o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vEY+Qs1Vp7gVyujBYnvXHc0NtY/VQhu9SHZ+8Tfz+d6h4izSbklRDQ/lQcOzdfKG9EPLLj1L4nKZdr4AfkW5imOp/vcpTpj7Ike1pQwh4FD7m/cGd/vCgVMMsNCN3Jxmo7kxUqrpH8A24DV9c6WjxQDIWnpk37fx8PQMinaoYa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VV7PQgLg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VV7PQgLg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T9bl2K027115
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 09:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0g50ZIP/+1LSITzGgzIqtGqdXOVUmvuN9/3KIaqoLs=; b=VV7PQgLg+TzEg9sF
	umY8mV7//iJLoQnUwkWk+pxSSXM8HmUabJtfq15djGGUoGop+33UvFyldGKK98ky
	61+djpax2r7jdaMPSLfRmcuBAhdOKAO6oGVkUJwR2/1EzPY2983L/IsziedUJieS
	utOjzTfHyFS2B3JfpGkDtzVb2AaOg7Y1IxKYPhtSknPbn/emuFJSSUz8AD1Sflcs
	HDe9o8tcdBt7w2VB5wEQdoYtPCmh2uiL1f/2qHGHCWYSEuQRYYjixXN7lykq4t8N
	ydG7Ivh2FN/pZNc+XtGmR3yooWnFv3sLjeqws+pLyOVVe+NqaHTbchcZFKtnPcn6
	7mgCkg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977mepw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 09:41:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-26983c4d708so42307835ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 02:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759138878; x=1759743678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0g50ZIP/+1LSITzGgzIqtGqdXOVUmvuN9/3KIaqoLs=;
        b=A1mLsBnTMtRp8V3cHPDm2yYuQqTkAEZw+pnZplAMIut/+Rm8dvL4lS+t3O0aQs5udO
         6gKFGc/fEL2oYzYoQWRp6Wa/Vht3rStWQTAXlYtKmJYCcuucQpmbuXy9PeKk1zyVomWk
         Eg0MxCmhQjl92Xg0xJGOKrBCB7wYvMdSP5uBMVjnSTjkCwsNzpXtwr2FVB4WsrwbfTLy
         i8E8jYvgOok6+8P/kZU3MNsp+M6hCsmt48GHWtEsFrQjZJuOzN/3iUKyZQbeoFLG79SK
         7Js8Fq6hLQVOvvxASTmPwexu4dyqC2VNoKAQbEuivqSoAgu2HnvQWZ72QpDmTut3LUX1
         uo5g==
X-Forwarded-Encrypted: i=1; AJvYcCVzC9ClN+B/mXXOeiHEFnYD2z4tlL0xfDVwEuYeOMrHRV8moP/L1PUkFCdn6fpAa7Fg2OiKNL8KeDOF4x7jsGo3@vger.kernel.org
X-Gm-Message-State: AOJu0YyzyogP0Yyz1/1ow9iJwqAH3rZf0lOu9NBdPfOVonn6h+rugnAu
	bIkuVNPPIBjS4LDWfQ9NzxbJ7F8t7nqWrygSd5MFvLUZqlc3iZQm/VSVra8A29xs/UsSy2sRqTY
	LTB2gRKqWVfSDS8LhE7COWUVV1fSPG+Ph68wT9MygEj4gimIvLsuLPhxyodhowYjg/b2+lVrBzc
	PQquKEXKw=
X-Gm-Gg: ASbGncsq4TdN2rMdnPojyhbnY1cBgttS2VCjMUSjY7aU90UwA/CATPsMZrGjGqSZ74I
	AHxDKVFOIxlDhh0qX/zvfd5vUgCId82zMMzUP0sJ6uF56Q7Qxi3zwCExOCremOOPTvlFonywVYl
	yDnc6Nqsvb1Wi0j8tmR76VXVHBul5FZ3L1CufZG7G/wgJ/9tqs43lFmV2oOlvIOY093wrpJcZ92
	JWS3fFJj9mbBEZ5MmKvip+RoEvN0HH3A7q8bHcv1+cq4PU2t7+5+oCYH1T+Twm0hwpDtSsfS7QJ
	O7jntJbaRcIoxGGn7dMWU+3wOKurQi7F9bXdNZlInL3qIhZ/5l2Kjo8IE6COYBi7j8T/CY9w4l5
	PfPeI0ctlymQYM82aIXPyXqkzw/zbfrUUwTM=
X-Received: by 2002:a17:903:1209:b0:27c:56af:88ea with SMTP id d9443c01a7336-27ed4a60a90mr138735855ad.60.1759138878273;
        Mon, 29 Sep 2025 02:41:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX2BDwLAFP5L6LqaHh38rh3/eLF8M2OlCmhN0N94ebznHjZi+EX/zj/NGuCgKmw15fA/eRzw==
X-Received: by 2002:a17:903:1209:b0:27c:56af:88ea with SMTP id d9443c01a7336-27ed4a60a90mr138735595ad.60.1759138877800;
        Mon, 29 Sep 2025 02:41:17 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6882140sm122815465ad.70.2025.09.29.02.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 02:41:17 -0700 (PDT)
Message-ID: <540b1de6-c959-4911-925f-8163f5fa5147@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 17:41:10 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
 <5820a9a9-4474-4c4d-905c-0efd9442e5e1@oss.qualcomm.com>
 <o6dzhmlicwiezmxlb5uqitx7e3pjpyuhbjqfumivbdkru42hvn@r4ksfa6m5nd2>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <o6dzhmlicwiezmxlb5uqitx7e3pjpyuhbjqfumivbdkru42hvn@r4ksfa6m5nd2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: L3Ro9qTFJ1faQj3JbP6fvvg0-Ua5swkY
X-Proofpoint-ORIG-GUID: L3Ro9qTFJ1faQj3JbP6fvvg0-Ua5swkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX3rvOFXiTKAVo
 ZRJ20ztWzeg7rurWenE1g9w8o6oDI4LWRJBfkgZJg3yorW4NHtOG0gPH/C7Ig+c50hHEfEpLllD
 jg6vh81vWbzSgR1zJUiHPPddJM1Om4HVOSMhT8rs5iQGaTVOfWaD6U0p6LP9xetLVCpgz8nOOrz
 RbeLVJ7K38ac89wOW15fARvd6Uhym82d6cvveuHcORZimEGQVQxuChBRKK6mCqL1dGch5eOP3hE
 0d81cEbO/iFtTPQZeOGkVu1G1ux2C9PWSAgZhHfrneZE8NhYeGH9LB4rCVnXSxopbLedJz7qTym
 qppkY/GVR0UFpIz8tcJjZxd9Zbig3DNThAjsRK4GwTUD9pprvs1ugboTnTGGvoSnpMz85BFK6hO
 lF6yqfubvn0TjoJHb/V4/Z4HcBLNhA==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68da543f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=RABRrLoboZg1DbT1noAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043



On 9/29/2025 5:34 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 29, 2025 at 02:20:54PM +0800, Jingyi Wang wrote:
>>
>>
>> On 9/25/2025 9:48 AM, Krzysztof Kozłowski wrote:
>>> On Thu, 25 Sept 2025 at 08:37, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>>>
>>>> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
>>>> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
>>>> interrupt.
>>>>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> ---
>>>>  .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
>>>>  1 file changed, 19 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>> index be9e2a0bc060..031fdf36a66c 100644
>>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>> @@ -35,6 +35,9 @@ properties:
>>>>        - items:
>>>>            - const: qcom,sm8750-cdsp-pas
>>>>            - const: qcom,sm8650-cdsp-pas
>>>> +      - items:
>>>> +          - const: qcom,kaanapali-cdsp-pas
>>>> +          - const: qcom,sm8550-cdsp-pas
>>>
>>>
>>> This time maybe without HTML:
>>>
>>> This looks wrong. This is not compatible with SM8550.
>>
>> Could you point out what is the difference from your perspecetive?
>> it is the same as SM8550 except for there is one more interrupt,
>> which is also described in this patch.
> 
> I'd second Krzysztof here. Your description points out that it is _not_
> compatible to SM8550.
> 

Here is the binding for sm8750 cdsp. Fallback to sm8650 but describe the
difference in interrupt:
https://lore.kernel.org/all/20250221160036.159557-1-krzysztof.kozlowski@linaro.org/

Thanks,
Jingyi
