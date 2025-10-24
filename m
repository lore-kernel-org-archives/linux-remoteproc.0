Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB445229B2E
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Oct 2025 02:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761271823; cv=none; b=d6fEZBqjfr1CD8zhyqO0nrlX6kPf7zW6rdoGguB4OXfgy+nnkpFMRpH7zCZbmDoOB1Hux3n2XzRPlVEyPabtPmGUGpHsr8zsgAjb12fdQOjvEvs3wKuTfKXiHvRot6MnbicGVxb+YjNnvU55tSR40W1ekO1VMnEqOADlcISZg0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761271823; c=relaxed/simple;
	bh=bWhghqbkZF5R6OM/wCGrP0IOos+1Kse2GUZQVx+q0nY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtOC0xa2qcEATpa+bzi8kHFMe6XM+qYZsJy4/d8dp1/TjIkbyIxfcP3UVIabXeHXACqklApSTvesP5vCZhcwxJkv4TdK9Cu5ZwFQDvRoAGaHgSvwX9SyTPuB0T/1PcRfRUjOQjp4JKOdRc3T2aGDyOaR6921ZlLbYpLOBrJaAdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/z3P8Gh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/z3P8Gh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NF24PN009131
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Oct 2025 02:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PGCvJi9rEoMOgH9ee/rqu2BrVYz/eqz38q5hdOmWyuU=; b=C/z3P8Gh3PHag14N
	Pjfp0iJb/cqnKyA1AVEapwbGM/cJfYmN8DWtrIyANYnt3O/SxvWyxKBG1CnVpm1i
	xiaeyezCZl0+/zDaqLQJW4YAlNRe+6c5OVsmgu0x4F3e5qisqxDc3QE6IOMrLk78
	yRJNl7uTKrqzirSsLiMOHoOmSYRZR2iqZSGOIJ9KtiOEr+l50NMUCMDvdcpNM9P7
	kU3Y+DvJCvmYm6EX1MQLOytQ4zfZxbBLfkzUlAHAFR0JS4fuw8sKl3P0f1hDtOI0
	zSCAh6sfZRvOJ1ybyrqX6wbD8UlEX/BYbBw/X4eGrIqCZ7ABrICt+hCgRQPeFULs
	xfc3ZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jadca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Oct 2025 02:10:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-294880e7ca4so11614455ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Oct 2025 19:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761271815; x=1761876615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PGCvJi9rEoMOgH9ee/rqu2BrVYz/eqz38q5hdOmWyuU=;
        b=HiHC1gr8OoWrMHk1ogv0mJinJSAC902lwH92Wl2YoT1JQjEJChVxUJzuwwDgHdBoE7
         jJTF7tVKObdXk+O7mh+3NgdA6nkPkEtD2dBwDNz9Q3ViSgdu0gf5Mn2HqnoUkveBeVAm
         cw57D1CGauHMnbhALSEIQ1/NaVtM/p2XF2HnwmUIoVcsocj7d6HiEdNym2xBkTmY1jVk
         NMN8wWb3vGASxiMwsLX8HsWGyDh/KYBJHuT3YesygXoqsbwv9x/cqBVeH/nakmueGnCF
         +N3klJa9ZCy9b7iVpetZgWcMdPvY3DxrgJFgIiKUjC77SrRRDliExf1NEWch+bNBBKWv
         fhbA==
X-Forwarded-Encrypted: i=1; AJvYcCXVgPNCKAR46X3jEtmEdUyLmVC0e0rx9/JDkgsJweuY5z1wTxoMMYryWz9jo4yAXJaFZp5eDApROUTzDGxUpFz3@vger.kernel.org
X-Gm-Message-State: AOJu0YzDHOSDsowS4BXEsPwLqAJI1HalRbL8RRAY4eYfb/CU1+9PR0Ru
	kHFFis/qdvsc8nAIIX066O9nvOEYSqjV2ftvjqFVCToiO+xB/D4r+bKmowgnRMnlK8BiBoL2sdv
	/mV5fIxn5ggRewxWgzPQuv+DbNrbDnyXLbIJJBpteddumB3Opy6d+FKGpiH/tGHZgkjieGOAw
X-Gm-Gg: ASbGncuflclSLO9Ap+r7PsTz9XropgulrA4oP+YsZAdQxA/4nhP0zZdkPsJordnsrP3
	G5R3+bdNr2X7yQeOGOZRpQeX4VjeF/h8M61ysYOg6HqFek+ZECcvnRutzqHsv5hpN0QUYV4jte9
	r+yY3OJkfn1TJdTB9oKHJWK8DvbqNTsZo9gwm3qz8iFTAeE0AJbx/xoLhzNWXXhGlilt0F1ZLr0
	y2AG5N4uY9U8C9qMKG/eu3wj84LM48pM1DgpMj9Q09FSZ/iP/Nw5MVznYrtGM60BQneW+wWDOm4
	zm0JnAcCZmsVltmAPLDcjNs7HzI2SG8SWVyWmc8t5d3emVqUBmGMxlQaViI/DCDW69U7Lr9MjoY
	WOGAhbsFat1DhOS4ODYNA7s8Z3Qz0Ot9rQV7Yb3IhOsqPJh/OnL9GuflHs4fXNt2sYJV4Tg==
X-Received: by 2002:a17:903:2444:b0:264:8a8d:92e8 with SMTP id d9443c01a7336-2948ba950b8mr7646605ad.59.1761271814905;
        Thu, 23 Oct 2025 19:10:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0Th1WmQpEggqKtoeq8EtSC4CLCeFVp3H06Pt4dnKJUtaqYK88vCk/JQeaiuW7BPm22gLpXg==
X-Received: by 2002:a17:903:2444:b0:264:8a8d:92e8 with SMTP id d9443c01a7336-2948ba950b8mr7646255ad.59.1761271814441;
        Thu, 23 Oct 2025 19:10:14 -0700 (PDT)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dfc274csm38536765ad.74.2025.10.23.19.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 19:10:13 -0700 (PDT)
Message-ID: <1f98f83f-328f-47c8-84e7-2c77abb37a6a@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 10:10:05 +0800
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
 <7952ed3d-f019-4593-af43-b2df7f738d04@oss.qualcomm.com>
 <c0e6b667-2e87-4419-81ad-3366ed56830e@gmail.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <c0e6b667-2e87-4419-81ad-3366ed56830e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX11W9Yzok46h1
 aHhzM4n0c1gsuO/YuIpCG06Y1qXwQB5MJJF3xO5mERddqUrKRMzszkE1A+Anwr7k4W/hQCK1Znp
 SgTM8s9QC1T2M6tuPTQXIynvBLijLKhMVed7hTneMAoVRQ4cGsARiC6utIMI9B/EA6PLTjXyeaf
 jZ2SPNemRsdJqLwNPNAdSclJwsKdPkIFE3CWIgeJC7R+Qytucre1f+GLmZ4sxK+aVyrsuyZwMp9
 GlOs0gYapJducSuWCI/5cW3KzA696c/49vFQgqy9gwOM0chRQYYYmSCJgW3XfrBmHTmxLNeDYUE
 t6Ji8AbmoX4msBRcq1ph89OSoavZivCf7g/sgfOEJESUfTxi9YF2BgpJHiNepA51O8wws8CHSx5
 u2P4tsmuJ0YkCTWk92Jz0bccFgMtzA==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fae00c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UIbmj66A9DVWYICVwn8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wCVWWBDL3U9CXweuaVYF7LB0d9N7Y1M7
X-Proofpoint-ORIG-GUID: wCVWWBDL3U9CXweuaVYF7LB0d9N7Y1M7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018



On 10/23/2025 2:28 PM, Krzysztof Kozlowski wrote:
> On 23/10/2025 06:07, Jingyi Wang wrote:
>>
>>
>> On 10/9/2025 6:29 PM, Krzysztof Kozlowski wrote:
>>> On 29/09/2025 19:03, Dmitry Baryshkov wrote:
>>>> On Mon, Sep 29, 2025 at 05:41:10PM +0800, Jingyi Wang wrote:
>>>>>
>>>>>
>>>>> On 9/29/2025 5:34 PM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Sep 29, 2025 at 02:20:54PM +0800, Jingyi Wang wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 9/25/2025 9:48 AM, Krzysztof Kozłowski wrote:
>>>>>>>> On Thu, 25 Sept 2025 at 08:37, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>>>>>>>>>
>>>>>>>>> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
>>>>>>>>> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
>>>>>>>>> interrupt.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>  .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
>>>>>>>>>  1 file changed, 19 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>>>>> index be9e2a0bc060..031fdf36a66c 100644
>>>>>>>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>>>>>>>>> @@ -35,6 +35,9 @@ properties:
>>>>>>>>>        - items:
>>>>>>>>>            - const: qcom,sm8750-cdsp-pas
>>>>>>>>>            - const: qcom,sm8650-cdsp-pas
>>>>>>>>> +      - items:
>>>>>>>>> +          - const: qcom,kaanapali-cdsp-pas
>>>>>>>>> +          - const: qcom,sm8550-cdsp-pas
>>>>>>>>
>>>>>>>>
>>>>>>>> This time maybe without HTML:
>>>>>>>>
>>>>>>>> This looks wrong. This is not compatible with SM8550.
>>>>>>>
>>>>>>> Could you point out what is the difference from your perspecetive?
>>>>>>> it is the same as SM8550 except for there is one more interrupt,
>>>>>>> which is also described in this patch.
>>>>>>
>>>>>> I'd second Krzysztof here. Your description points out that it is _not_
>>>>>> compatible to SM8550.
>>>>>>
>>>>>
>>>>> Here is the binding for sm8750 cdsp. Fallback to sm8650 but describe the
>>>>> difference in interrupt:
>>>>> https://lore.kernel.org/all/20250221160036.159557-1-krzysztof.kozlowski@linaro.org/
>>>>
>>>> Interesting. Let's wait for Krzysztof's response then.
>>>>
>>>
>>>
>>> Because it is evolution of sm8750, so it did not go back to old design.
>>> from three generations ago. This is compatible with sm8750 or with sm8650.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Hi Krzysztof，
>>
>> I tested with falling back to sm8650 cdsp but it will fail with:
>> [    4.739615] qcom_q6v5_pas 26300000.remoteproc: unable to resolve shareable memory-region index 0
>>
>> sm8550 and kaanapali define 2 memory regions: 
>> "memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>;"
>>
>> sm8650 and sm8750 define 3 memory regions:
>> "memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;"
>> with the driver:
>>
>> static const struct qcom_pas_data sm8650_cdsp_resource = {
>>         .crash_reason_smem = 601,
>>         .firmware_name = "cdsp.mdt",
>>         .dtb_firmware_name = "cdsp_dtb.mdt",
>>          <...>
>>         .region_assign_idx = 2,
>>         .region_assign_count = 1,
>>         .region_assign_shared = true,
>>         .region_assign_vmid = QCOM_SCM_VMID_CDSP,
>> };
>>
>> When kaanapali fallback to sm8650 it cannot parse this region_assign_idx.
>>
>> So shall we still fallback to sm8550 or define a new node "kaanapali_cdsp_resource"
>> in the driver?
> 
> And partially the point here is that you might need the third region, no?
> Best regards,
> Krzysztof

On kaanapali, the global_sync_mem region is not managed by kernel, so it should
be removed.

Thanks,
Jingyi

