Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39CA272801
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Oct 2025 04:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761192436; cv=none; b=gx7Q5KSdOMA61CVmPpRNIuymlV+cKrxuU2SP2uYAgi6Li+BUE30oi4fGXxT7AQ6xdoMxZXX3A9q93xHcPfpAEKaWRsii38nAlAeiEMEJiHiBcLebXAkz7c9stpYWmULvQQSKdjsbVSeLR2N7aCdLQb5t0MSVySYh0ZOKSfylhbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761192436; c=relaxed/simple;
	bh=1Nck7j3+aab8fsmv17FGOG9aPhFb9ZRUy/2LYccp1mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EBergMTZSjGjTqTLM05R4asbnFM7hbrrdj3g6ChvrXpv8GA3PWkAVNveRNbHMmYNRDDfOO+otW0pHpOr+gwFsdPL3zHK1zhebJoWgbaKxab7XrPbbXXt+s7ApS6C9nC3ah375LVq/EYHbv1zV6zDvypf0UTHD+nc5BX81mrcJok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKRjy+F+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKRjy+F+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MK1DRi027073
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Oct 2025 04:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PcgkgDXlyRkmY4EE/OGwg8TcZ9P8qqS+vWBVxf6Za2Q=; b=MKRjy+F+KxXu/pLQ
	OXPZFVo1dHVV3/0IZsrBcSAKl0wbE82JfWMlc6GyVg/hdYXEsCN+lEVmJ40jmB6y
	9Mt7ou2FDJ/7kyP04lK8zXLc4INbWSGCC1NikCsJ4WXxtCA7elDqyvWSqf1aXa46
	VSGiFKRu5YiS8tztpjB2PaGnI+MJqVz3oVoBVStTrXAmeJvxOwnrboPeIsYEi7IR
	ujT9yz6QXc8Bd+uadlU+0Nis+GGKFJQvbYSPsUcX0tpqRjyj+n+4oVhJA+Ihiwpg
	sP41FKePnzo6ui5Sp4UPlkx/KZft7IRELfTD5yBdQYVGXXJNdz4OwBbR+bj26lf8
	C3u90A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8h0gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Oct 2025 04:07:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33d75897745so939038a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Oct 2025 21:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761192432; x=1761797232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PcgkgDXlyRkmY4EE/OGwg8TcZ9P8qqS+vWBVxf6Za2Q=;
        b=ocjxi+ovxWd+UcoNipsUzK12U7UMUmss1LBvKbXZfsiMYusCIEzrkHyUD+1UnVNseJ
         u/oAge2w1Dor5yaZwEFTSEG9G0iW49pxaZ5zjaB9dzZnetzVubPcVzHhijaiBuJH7hxT
         HqAN4n5v4FjaIR2eLEJwXM7oSJGJMsXTi3AVNV3zj64o4wMM+2ZIkQVv4HgmQOgEIkCQ
         RAjaEYwtjdfZwBbi9bdjvsISFnGOKYtv8QzpjM7MYT3BksRrOz8KwFLXNQA9qzQZgLag
         4aYPYDxfWTaH84czA+l8MKsLA0foRCjA8Lv9jVyAyTohqxw8Mq0llkFNAiq7nPxqGuGV
         GYBg==
X-Forwarded-Encrypted: i=1; AJvYcCUxK4TC84L6tMPArWq1CegIXsgNvM/VVpBSKoZNworDuwqJcaQPvCa06aJUthnbkHB2PFZpVFytqLSHjUYvplvx@vger.kernel.org
X-Gm-Message-State: AOJu0YyImCdGzrIsutybsFYktkh8RIx0v+4pL4iWlloqsvLvMO5JfaMw
	nLF1Yp+MPMsoei2M7DeRbQgYnTI08zqbGc9R3yjHWGRrn7jstHkHSXSpZr7nJ+u1EwpfdN1uhlK
	HhFNWSFre5YAqU7BqAuQM3nSkI82RVD1Ef8HemWS8Sa4d8s/boecdV/KpKQgzfuCMJukWN17b
X-Gm-Gg: ASbGncv0BNYMs6IX2OeMMiUl9x780+l5pRnxY8ej6zTxUKfYPAzdNe09QgobUj56RoX
	pbtHSyAf08tOiOpskb6Bxyuwk8wpv4JlcgC69qyezHLwxmhpWa6lguALGcbhj78prB5L1AbgJPN
	kO+Ggh025WlVzAotKhkX+hjiJj292cyEgczPD+WsftzYfdxALqqDWtdCPoPTtH+Z2xHCAu6gmBr
	tk8liQv31dH8+hLr5ebqawb98kVlTMQSQuOSuaIMiO41R444IhgjhseVwK5AhLjWM8+SwWx4sYe
	3YJ9rR12w8rcKit75IVBzXszjqilch67vrvG/N4ur01mGAPp3BiOldt7Egiz1YjqDqA13H0qSNL
	srIxspGd4lvv4YVng1q2GSnQRkhvTTFn/J29u99MUOEbOu88uPG/MCUFrb2+V+1OPZy/5mw==
X-Received: by 2002:a17:90b:2ec7:b0:33b:6650:57c3 with SMTP id 98e67ed59e1d1-33bcf8ec60dmr30315330a91.21.1761192432156;
        Wed, 22 Oct 2025 21:07:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFPMyfbfKQ6gBFWgcEHzbQ+WlKqxr4cKLnz5nrXjMEa0Y17iULEXCPmyWg4Rg7nanHfqwGkg==
X-Received: by 2002:a17:90b:2ec7:b0:33b:6650:57c3 with SMTP id 98e67ed59e1d1-33bcf8ec60dmr30315307a91.21.1761192431653;
        Wed, 22 Oct 2025 21:07:11 -0700 (PDT)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e224a2662sm4200672a91.17.2025.10.22.21.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 21:07:11 -0700 (PDT)
Message-ID: <7952ed3d-f019-4593-af43-b2df7f738d04@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 12:07:03 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <5820a9a9-4474-4c4d-905c-0efd9442e5e1@oss.qualcomm.com>
 <o6dzhmlicwiezmxlb5uqitx7e3pjpyuhbjqfumivbdkru42hvn@r4ksfa6m5nd2>
 <540b1de6-c959-4911-925f-8163f5fa5147@oss.qualcomm.com>
 <fdfzoemfxdz2p622hvixpaznh2n22hweit2e43plfu2kdd6kad@reulvi4vs5v4>
 <cdc01b6d-370d-45dd-a3fd-9866d2a5f36d@gmail.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <cdc01b6d-370d-45dd-a3fd-9866d2a5f36d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oLkPG5NqEJnLyHNhNUXTgdeUDgM_u5di
X-Proofpoint-GUID: oLkPG5NqEJnLyHNhNUXTgdeUDgM_u5di
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfXyO9cfUVZqS/o
 Y2tw+zT5WZvLx1wzzmnkYPul24VigRcN8afqir/kOdT0XsyB8m4gltPn/grcw4C91rEdhB/R+gQ
 y89CW7aaWWem9mwY2u3IsY+kGP3PLtI+/+eyp/d6zUdrNT6GJXyr1sbj2o031ZgdxLUerTFCwJn
 tpr/AHZQdOxduxZwk1dHeiLnBwI7qsXRKquckaKB/zeNAV4WZ/W/WgIU6tfHpaDdGKKSy7iQLXw
 BPW/fcM0U7O5NlUqZxqzAZb3kl+gu7oKJ6Dm6Ow4yOG7LPxImTiKpmQg6Ps7OyWNa6S5JBIfKHU
 a97XjsVyMBP2YeOHqDSnS/ufvi28HyURam1V3Mzzlt8F5vu+69z4/TzgAZO29ugT6UpofCRK1xr
 4SmsmJApBvz8qG/N/kVuxtRFk06erA==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68f9a9f1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VbD8AgmwhZIDVUnwpcMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164



On 10/9/2025 6:29 PM, Krzysztof Kozlowski wrote:
> On 29/09/2025 19:03, Dmitry Baryshkov wrote:
>> On Mon, Sep 29, 2025 at 05:41:10PM +0800, Jingyi Wang wrote:
>>>
>>>
>>> On 9/29/2025 5:34 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Sep 29, 2025 at 02:20:54PM +0800, Jingyi Wang wrote:
>>>>>
>>>>>
>>>>> On 9/25/2025 9:48 AM, Krzysztof Kozłowski wrote:
>>>>>> On Thu, 25 Sept 2025 at 08:37, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>>>>>>
>>>>>>> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
>>>>>>> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
>>>>>>> interrupt.
>>>>>>>
>>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
>>>>>>>  1 file changed, 19 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>>> index be9e2a0bc060..031fdf36a66c 100644
>>>>>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>>> @@ -35,6 +35,9 @@ properties:
>>>>>>>        - items:
>>>>>>>            - const: qcom,sm8750-cdsp-pas
>>>>>>>            - const: qcom,sm8650-cdsp-pas
>>>>>>> +      - items:
>>>>>>> +          - const: qcom,kaanapali-cdsp-pas
>>>>>>> +          - const: qcom,sm8550-cdsp-pas
>>>>>>
>>>>>>
>>>>>> This time maybe without HTML:
>>>>>>
>>>>>> This looks wrong. This is not compatible with SM8550.
>>>>>
>>>>> Could you point out what is the difference from your perspecetive?
>>>>> it is the same as SM8550 except for there is one more interrupt,
>>>>> which is also described in this patch.
>>>>
>>>> I'd second Krzysztof here. Your description points out that it is _not_
>>>> compatible to SM8550.
>>>>
>>>
>>> Here is the binding for sm8750 cdsp. Fallback to sm8650 but describe the
>>> difference in interrupt:
>>> https://lore.kernel.org/all/20250221160036.159557-1-krzysztof.kozlowski@linaro.org/
>>
>> Interesting. Let's wait for Krzysztof's response then.
>>
> 
> 
> Because it is evolution of sm8750, so it did not go back to old design.
> from three generations ago. This is compatible with sm8750 or with sm8650.
> 
> 
> Best regards,
> Krzysztof

Hi Krzysztof，

I tested with falling back to sm8650 cdsp but it will fail with:
[    4.739615] qcom_q6v5_pas 26300000.remoteproc: unable to resolve shareable memory-region index 0

sm8550 and kaanapali define 2 memory regions: 
"memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>;"

sm8650 and sm8750 define 3 memory regions:
"memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;"
with the driver:

static const struct qcom_pas_data sm8650_cdsp_resource = {
        .crash_reason_smem = 601,
        .firmware_name = "cdsp.mdt",
        .dtb_firmware_name = "cdsp_dtb.mdt",
         <...>
        .region_assign_idx = 2,
        .region_assign_count = 1,
        .region_assign_shared = true,
        .region_assign_vmid = QCOM_SCM_VMID_CDSP,
};

When kaanapali fallback to sm8650 it cannot parse this region_assign_idx.

So shall we still fallback to sm8550 or define a new node "kaanapali_cdsp_resource"
in the driver?

Thanks,
Jingyi












