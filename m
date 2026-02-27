Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A5311954
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Feb 2026 05:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772171555; cv=none; b=EfpbApR5lYOn/FaU28Mdc7Jtm73QteQ1Xr8PTj68A8BaIwyZipEyTagXF9y53oYqL/GWX7BNw05v6D9LHANetQb1T9iRyiKItmU2/j2tzCjPq9B5ISW4D/nQW3Z+5SnEFbe5EVcNOzdK8OicguBwzgqfmwlukXmONWgAEdxBkCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772171555; c=relaxed/simple;
	bh=yYeK0ZjLZHsr2znKHdIhNJBApxnwX2qEDu8dzQsco0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jqq3fSvJlJKWaDikwkthAYN5z4SFnjb4dj+k+o/mMX34GnzXymPruDhkJuehnz9sIWG8I6GlMcrr7gJEuFV/zz+KD1GdbsD0yen9V6Z+Y9pOOz0sfT6HpPiJYbouCaR23E+6Y1Cih+7ds29MMh2AO8r+IdMbwpoqe9LsPzr5uSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItmivUR2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hHMKPqnZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItmivUR2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hHMKPqnZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K1BO3761563
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Feb 2026 05:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyMIJZ8Zx2zq/4xYD9pkY40RWJVVCKl3DKTScMyYyR4=; b=ItmivUR2PIICuypx
	APjSRxQsJdQpscf+oNbMredN0aUNN/rrnd8O+QZDoRpO5mwQeb1w3lysx/ECcmTo
	9G5fxFOGloUzzdnRo/qraqZPOOCOJfLd7c4UYYl4ekGK697ozuwsu1Czy9mVwvwi
	pl0J/aNHh+kthQbNXLUPWP+ZW6+eMUQaXFFgtb7UNA8fOu4QQ2Yv4ZhZYNJc1cUJ
	6EFUds431hsAwVNOP9Atiflkw4ASzGTm29+3rjHd7L+2ei1pJIuaA2T1tIcaBF4E
	uspu+eN/xe3G8peEI8EARVoY6W0boYWVFZu4jfjwWk0P7jeiQGoJXYQ/UZ7xEgay
	4BaLyg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7yaatx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Feb 2026 05:52:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824a02e4d29so813707b3a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Feb 2026 21:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772171553; x=1772776353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyMIJZ8Zx2zq/4xYD9pkY40RWJVVCKl3DKTScMyYyR4=;
        b=hHMKPqnZTTbIKXj97dP+8w3edamaEviFeM2UfPij8rZOFYmqKIORn66/o2msQMgzyg
         DOZ5F4fzmbbnV23gfJoclghWYxvVrYZh8by75A582cC0TZB+DMJsXZ83yUqYoqJLBEo7
         k4UgLMfpYQsyOw8zcc+L0lN9629KT01fYk7wEas6tiO25Wv6JEn7VvqeS7Ks7Wisg2+H
         2cyQbAav45UYGv3E+eD+Bl3kuQPriI84AquqPH9rrF0sGJqggeMF2A2aFnabE+to1RgT
         Y3sGkznn+5RdBXYPdrAzBN9XmSj+LwyYjoVulR639WuFWopPipfc0vfEfssEwSz9jyeX
         UjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772171553; x=1772776353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyMIJZ8Zx2zq/4xYD9pkY40RWJVVCKl3DKTScMyYyR4=;
        b=PAga0Vy+OJFjN7jyU3woZqtZmAOZqZiCnF1lNNGzzJK5a2DMPg0eO5XXypLM9JIlAi
         PRp8mnUYME6MEiogVJVyyfrBxq+urv+3ZXsdZU7Wq41V4MpmfcDPclnR9CONZ4jkzwXJ
         IyycC+XOA6ScHZj3OBb6wpOoIJuP95EArDQAeWnWOzehF3hv2uJIc/SILKhu4n5Jq+OY
         rWdzNJS6/bI8wqaBxM439T8dJdQSkCbWqx8K48LMltL5xiEER9F6q+P1iBncA2dvDnhM
         AouHlqto1Lv/9UI0zJ7IZTVcrjsacxgV/3oa31NtWJWK/MpQIfGiDVC24Fd8xJVv9Tkf
         h55w==
X-Forwarded-Encrypted: i=1; AJvYcCV/l5AEpCPFs0td1/WtEvUfiAV/vdmERmJXDISAlUxa9/9Vm/eGMIVupf01n6lkxN8OtCJ2xcWfeIWjt9w1pVjC@vger.kernel.org
X-Gm-Message-State: AOJu0YzHzPPmzneGjCfVkfWCPuMONXsIRdxrL3ratBgNzwhAZRP+BgLS
	8CG7hPNZ1KM8J3ajcLTJp6unvFMlc0MC5t56OWc7MAe6pkC60pBpJ5lW2wwn3TTRwBmLr7jr+yy
	vR44Hy1NNcXe58nLh8tw+7V9TGO7OZsXHkkPFAw8bSEjx92QJ9avBK0dnQhRSNXUtI41HYHzr
X-Gm-Gg: ATEYQzz89XpLIDVDl597inLb8fC7xjkn+P/gtPSSUbp8qsVREQ+cotMRQcEEbzADsDi
	fXaBOJRSM2u8cTCc0OhOT4ELB9o2gK8rIYtNcPwuqfAs7D81vKAkBmyc/2+l4FzupL8PDB94Mb3
	5pIIraKtgI3ToVNetzDGO/SwXVYsMFMvg6fy5D2SjxRtndWaAUPAEaxgoYfU+s8eMy0yBy8B7PJ
	nepvRGYXJiCFoE6VsxDcL39SCHASdzdlnR8JP9t0wW52KuHdgZLQIOnVICPNAkvYg2T8z1GZuAC
	i5EvkC27+VDQ1Ae4FRdBKKxD71qCfpfI479yyKQT7C50EbQRE8YAIGXNwuJ6RjAFupOYeHcgOiT
	vlAjcCRd9r/hb+w4SO6wEd96G0G/TadJ7J19IVvx32u0pMVRSlhxcwnpOurl7J1c3hIkHjRRS93
	Hk6JO6ve7h2M0WO9zN
X-Received: by 2002:a05:6a00:a247:b0:7aa:a2a8:9808 with SMTP id d2e1a72fcca58-8274d99c2e2mr1585060b3a.20.1772171552367;
        Thu, 26 Feb 2026 21:52:32 -0800 (PST)
X-Received: by 2002:a05:6a00:a247:b0:7aa:a2a8:9808 with SMTP id d2e1a72fcca58-8274d99c2e2mr1585028b3a.20.1772171551773;
        Thu, 26 Feb 2026 21:52:31 -0800 (PST)
Received: from [10.133.33.121] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d544ffsm4085637b3a.12.2026.02.26.21.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 21:52:31 -0800 (PST)
Message-ID: <22273aee-73b5-4747-a2d4-6edce5102092@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 13:52:23 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] dt-bindings: remoteproc: qcom,pas: Document pas
 for SoCCP on Kaanapali and Glymur platforms
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-3-5b09885c55a5@oss.qualcomm.com>
 <20251223-furry-mighty-agouti-a222f7@quoll>
 <ae532ff4-1a96-4dc1-9fa0-81305624c9c9@oss.qualcomm.com>
 <f4ef4a57-4192-4dbf-939c-46efa13c0391@kernel.org>
 <aY582M8dgOrKW39w@QCOM-aGQu4IUr3Y>
 <e3dcadb3-0239-4a49-a5ee-3c20ff97ea4e@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <e3dcadb3-0239-4a49-a5ee-3c20ff97ea4e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TG4xl57rysgXK78_MQckUZRMn_zQAL-O
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a13121 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Tx65_vTwki0hZNA2rn4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: TG4xl57rysgXK78_MQckUZRMn_zQAL-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0NiBTYWx0ZWRfX7EG5WsoBTcCr
 TOAICEdpWR57mKBFLDXYYeB7/w8xYt/sVFPGdHmUcffxMalLCmQO4Zb02zIyoJRkh82NLcoQ4Bj
 IefgLsTQ1gKN4auZ7Vh6cibDrD4oUicHs6sCxsMNriWb9U2CZJkuT6sq+WJ2zDtT138kkYItZDv
 GZMUX9WxtZGdipB7zZqWKa/x77UVZXhtoC2MCskPkcnVcPbUZMREfMAYXLXGT4zywyWGD0nBvs8
 /iGy5yc6PoYs0TGrF+0ZTMc5H5wK/FnNSH6iCah9+vN1B95XzQQ677gprB2gs2hEkpLQtiZUDD/
 Ub7pXUVycnT4CZAJTktt4eS8Bm6KRXZw2xBcVIxeNka19vnDbNg8L9OkVuS53xg/4NGi3KxKRyf
 F3DGGuDnXA9S6zkGo5Vjbudf8/8Aav0f65016nQqzkSyreNeVgfCz+EBjCkxFtTq+QQ9gjigGug
 /IpkOL4RE9wuIiQ5xJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270046



On 2/27/2026 1:12 AM, Krzysztof Kozlowski wrote:
> On 13/02/2026 02:22, Shawn Guo wrote:
>> On Wed, Dec 24, 2025 at 09:34:30AM +0100, Krzysztof Kozlowski wrote:
>>>> the interrupt for soccp is defined as
>>>> "wdog","fatal","ready","handover","stop-ack","pong","wake-ack"
>>>> while other pas could be:
>>>> "wdog","fatal","ready","handover","stop-ack","shutdown-ack"
>>>>
>>>> so grow existing list is not work for this,
>>>>
>>>> In the v1, got your comments to adjust pas-common.yaml for the interrupt:
>>>> https://lore.kernel.org/all/861b6ede-f168-44e6-85bd-10cf04dbcec7@kernel.org/
>>>>
>>>> and in v2, interrupt are moved as part to the "allOf" with if-else and
>>>> also got NAK:
>>>> https://lore.kernel.org/all/20251030-venomous-apricot-falcon-b3fd64@kuoka/
>>>>
>>>> Could you please share a example for us to understand how to maintain it in
>>>> pas-common.yaml, not define if-else and has strict order at the same time?
>>>> That will be very helpful.
>>
>> I guess something like this would work?
>>
>>    interrupt-names:
>>      minItems: 5
>>      maxItems: 7
>>      oneOf:
>>        - items:
>>            - const: wdog
>>            - const: fatal
>>            - const: ready
>>            - const: handover
>>            - const: stop-ack
>>            - const: shutdown-ack
>>        - items:
>>            - const: wdog
>>            - const: fatal
>>            - const: ready
>>            - const: handover
>>            - const: stop-ack
>>            - const: pong
>>            - const: wake-ack
> 
> This is good for pas-common, but you also need in the same commit update
> all schemas having $ref to pas-common to have explicit list. For example
> milos has six elements and your change would basically allow the sixth
> item to be pong.
> 
> Also several files need maxItems for interrupts, since the upper limit
> is now 7.
> 
> 
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Here are our understanding for this, Shawn propose:
Option 1, use "oneof" in pas-common

we currently have following files having $ref to pas-common:
qcom,qcs404-pas.yaml
qcom,sdx55-pas.yaml
qcom,sc8280xp-pas.yaml
qcom,sm6115-pas.yaml
qcom,sm6350-pas.yaml
qcom,sm6375-pas.yaml
qcom,adsp.yaml
qcom,milos-pas.yaml
qcom,sa8775p-pas.yaml
qcom,sc7180-pas.yaml
qcom,sm8150-pas.yaml
qcom,sm8350-pas.yaml
modifying pas-common means we need to add explicit list in each file,
(also we need to add constraint for smem-state)

To avoid affecting the existing yaml bindings, we assume below
Option2: have a new common file for soccp yaml with "pong"
interrupt along with 4 corresponding "smem-state"

the example will be like:
kaanapali-soccp.yaml ref with soccp-common.yaml. and the common yaml
will be very much pas-common.yaml content, while the interrupt and
smem state will be updated.

Could you please help to have a suggestion for Option 1 or Option 2?

Thanks,
Jingyi




