Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F51C2EA724
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Oct 2025 07:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761291737; cv=none; b=SxB2uIUbTRyu3/kZpBu0td+paoLcbjVFyR6gTVFIZBY/QyV2AcRvNPGP+KZkQlAHNSvhQ7ZmBPBT7sOEj9gbypoL+9mPngqgJogaP/BKSzx5bwLLIqIV3QGTqjQqBoG8TeDjba0/uwLdIhOECIMyBDdNgNUFK7MNw4wr0XO+UhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761291737; c=relaxed/simple;
	bh=qP2/hLBVxN3FJm/O4nmUItT5aATfx/1KfPXyw+Y9EeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8/NdWmXM8W+JsaQF+TZ0wcG6poeD6zRA6cn04Nivz5tTZPoTN9LnzuRN8slrwGVa7g+h7PMDAaNhC+JSC+gUM0re7db4+CU8Gbk2T5gBaqohRApDZTVvd+yriybVx4jlsV6lJGpuyMuvUWQd8ihz3Hrb9+Po3O7R2R+eabh/hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/IFoA6h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/IFoA6h"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FgWM021117
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Oct 2025 07:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ujDdSK7F0vmTpCGIcAVVQEeirzSPmezFnb3ovMYte/w=; b=N/IFoA6hqMVmGE0/
	/SiF94CHg7Oof/ep2mbOtHozxKBqkhLTch7HcWoThMPHMk+7xttlnWh/kUgBfssu
	8x0ZqQhSl1wdbp+6N5LDWic6iHft1nIeUL1T7xJQYvM3NMNfQOVy6lrx6J4BwYRI
	eShJdhtv763f+HaiqkoO8dDo7e/tQbxXHWB3PTkm0uO4jEZ1oUZpRJqXd7gOFb6N
	bBEqh3cB59gLfOcNNaIzen64W9fc2TsE6FFZBlUa4oX5vrmH6W7wAo6TJwklKE6t
	uuZpHsSNeuMSUnD96p7IOspg2z6eI2rPXzcdwv1ZE4T+jFQDU2XGt00n4Z7MmU8f
	5SVGLg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0s6q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Oct 2025 07:42:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f610f7325so1334418b3a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Oct 2025 00:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761291732; x=1761896532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ujDdSK7F0vmTpCGIcAVVQEeirzSPmezFnb3ovMYte/w=;
        b=B+qIDjsxcj4aIHZ8yMtVkAKE1cfpvWbGqEB9nZOd4F2MtM5Ajr/rhiB+KEQTgtLzlz
         BVKpwtdCGBFvtewG5pedzeNzPV2xlsnvnaTiMOEIjqm0/Dqut5jao0kYP7Zs3JCJroy6
         sQAtMhtvErifYOe0pkAfdTb5BJpCHCKRZaUdVDhYBV8D8IUT/LPz9X3IGfh2Au89kjV6
         9HPKJ1TE11plhtwNyzOZKXIEfk2YAFn7PiSoiz0IzOEyrqtryKmKnsjtNmo+PSTFPWzc
         pjG89zBcYJmByTuizXsf3w9Yg2ePG9637kCEe0KIeXUEe789OtSLoxu4ZVNpyGbYDW9L
         6zNw==
X-Forwarded-Encrypted: i=1; AJvYcCXbO4KiffAU1TYWvTG+sDSF6k7LqqyD5uz1vPB+TWib4KI4n0Amdb17/E/sx1LB1Ie/zPiKbm0eqW0h4X/nnq2R@vger.kernel.org
X-Gm-Message-State: AOJu0YyQntLhFzeI2IxqOVhaM9gD/nBcHOgHi/a1ISW1okC50umHnge9
	Lh/ZhicjpMtaHYggayNAaJ+bva1OuujM4j3HIdFRkbPEIVzQmekT6HEdlLVAAvkFT9bm1l8vdhn
	7xGf73ONyGJtid6ZQseDstYpSEG+1Bfg1v7pRuALSs+sDw0OTxqGORhMdfjfP7rHISXO39oEU
X-Gm-Gg: ASbGncuQayf1a+TNdfKbsHWfOa/XwS70jKg8/OAfU8Ew204k2KBYNBJCy6e6XHPsok8
	O0QD0feAEjD9254NFfRKITFuj9+Hkw97Cm1apmNQxT2ImQYjvB0rY8mErYSo/RgIaYkpEa0HtiN
	u0yWtoy5UYTSOX/3Wx6bry3AcrHVSEmhtgYAts/rZxDPejWscPhKvAdczF77WQTJmFFtz7CcbVC
	+VPYeCh4WSkblCKHBLNoJHXr43ZHoNASEa9zVoUEgTWCsR5tlrZEbBzNuFjWO1A6TJPR6nnSFwU
	Ozo8/+OX03ZOkgqJSUX6O7JEKbc17R8ROumsywCbkmOPlRwx938aCFFo2i5ohcS+pFLAsmo7g2Z
	7WnwhnIQBmkqEF7OkAudKY9N1+Mca7jd3/dzSdZMTIWRDC1Dx8YelC8odZDyoqeExGl5fQA==
X-Received: by 2002:a05:6a00:4f89:b0:7a2:7d09:cf40 with SMTP id d2e1a72fcca58-7a27d09d3abmr3935330b3a.9.1761291731642;
        Fri, 24 Oct 2025 00:42:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB/pYor8fIltrEjQLCEvB8tf/UTov5v9SzsRwyA8eyQVdoIU2c/LQbw5Wo1KaPqhYAKhDT1g==
X-Received: by 2002:a05:6a00:4f89:b0:7a2:7d09:cf40 with SMTP id d2e1a72fcca58-7a27d09d3abmr3935291b3a.9.1761291731164;
        Fri, 24 Oct 2025 00:42:11 -0700 (PDT)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb3636sm4943582b3a.61.2025.10.24.00.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 00:42:10 -0700 (PDT)
Message-ID: <e5befb65-3d9f-4cc7-afd0-c418e8c2310a@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 15:42:05 +0800
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
 <1f98f83f-328f-47c8-84e7-2c77abb37a6a@oss.qualcomm.com>
 <91288aa0-0088-4b50-8b33-661d8c0c25ae@gmail.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <91288aa0-0088-4b50-8b33-661d8c0c25ae@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX41mJUaeP9MDL
 SPMyYZimdfYLalHvzFEm0D4GFXJhjWzpLX6xG6eziVATOY4YG1b3Dci7tZ8h6rWgmQVHCja0PiF
 dLTUEb2fCTRygu7K6ckaEXcysDDiPFX3WSymFbQEYmsx1yeNmzUabRHByYsRCiHKeoR7Ia66V5+
 xa5cKCP569OoHDF2JCq21GwOV4VBtfhv6xU9EwYgfqddqKfUXoUeuCRhRbPeKFlxFMFwRUaPE8G
 0TzulLulNR/Ve1Q1aKCUtQ3XuKUDHw47HNwR+PwX4pbTOivljT2o4X0kf5GXVFjFRjUkyq0bB8s
 lCSYmdLcF86eiOp4T1JkB9JrBIbW7GlYJc7tNfMeT5/RFlXqkmKGPFcOaJqj2ChyRTIGgETMINb
 WUVKweUn40Xbj32SJ3+cdaCGhmAbsw==
X-Proofpoint-ORIG-GUID: I-ptsNVqaybadyCIWI3tp52ICSvOYEm4
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fb2dd4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=s-QpUPJv85p2Yj6lvi4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: I-ptsNVqaybadyCIWI3tp52ICSvOYEm4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167



On 10/24/2025 3:28 PM, Krzysztof Kozlowski wrote:
> On 24/10/2025 04:10, Jingyi Wang wrote:
>>>>
>>>> Hi Krzysztof，
>>>>
>>>> I tested with falling back to sm8650 cdsp but it will fail with:
>>>> [    4.739615] qcom_q6v5_pas 26300000.remoteproc: unable to resolve shareable memory-region index 0
>>>>
>>>> sm8550 and kaanapali define 2 memory regions: 
>>>> "memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>;"
>>>>
>>>> sm8650 and sm8750 define 3 memory regions:
>>>> "memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;"
>>>> with the driver:
>>>>
>>>> static const struct qcom_pas_data sm8650_cdsp_resource = {
>>>>         .crash_reason_smem = 601,
>>>>         .firmware_name = "cdsp.mdt",
>>>>         .dtb_firmware_name = "cdsp_dtb.mdt",
>>>>          <...>
>>>>         .region_assign_idx = 2,
>>>>         .region_assign_count = 1,
>>>>         .region_assign_shared = true,
>>>>         .region_assign_vmid = QCOM_SCM_VMID_CDSP,
>>>> };
>>>>
>>>> When kaanapali fallback to sm8650 it cannot parse this region_assign_idx.
>>>>
>>>> So shall we still fallback to sm8550 or define a new node "kaanapali_cdsp_resource"
>>>> in the driver?
>>>
>>> And partially the point here is that you might need the third region, no?
>>> Best regards,
>>> Krzysztof
>>
>> On kaanapali, the global_sync_mem region is not managed by kernel, so it should
>> be removed.
> 
> 
> OK, then please mention this in the commit msg, so it is clear why this
> is not compatible with previous generation.
> 
> Best regards,
> Krzysztof

Sorry for being a bit verbose, but I would like to make it clear that we can still
use this fallback if we clarify it in the commit message, right?

Thanks,
Jingyi



