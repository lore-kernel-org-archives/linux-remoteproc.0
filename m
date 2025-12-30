Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FE821D3CA
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Dec 2025 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100294; cv=none; b=DQZya8AEeYCIUrSyjx3FyxGr+T2peGh3QrV0G3lS0dEYSB7OEGR6f7atpb7AFbeUI7UCIFNX8HHUhMa2HMhxYjwT4hnMuJWWeBlqRiD57X5ogxeYim1hOjvGpzzjhcfvh3jQx8rzDvNWB9VTj43LqkRhcqeO2BlXUCvxd7tORxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100294; c=relaxed/simple;
	bh=Dt2eP+Y7Oqwl540YyF+ybi9qy2vn6WdgODkOrzIHOsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZ2ISIeAwqTgCkF6o8hy4cHqsGAarjQuXmo+xknXEf2gJULQGAzakwYDTFkWEBU6n916xYj66j/EqARf7ADdPokiMI//DMc0jiQO2FDOS9vnR44naf+3n9a3i68kcBYNLXT25Mvkwdbno36x3Am6Pxbby+iKg+a6rsOBrv7yohc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYAegnzK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAefB9gJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYAegnzK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAefB9gJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU8k2H02284786
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Dec 2025 13:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dt2eP+Y7Oqwl540YyF+ybi9qy2vn6WdgODkOrzIHOsE=; b=lYAegnzKi4JEfAuq
	2ATRE3Lmbp+xuGRNyXZgiHAMrFok9ojU+qlzCYbNR81Nz15j+Xzhrzp0JL0OfFOY
	PlEB/VPSqxzSjgM9CsHzD8jFrJ/tMzK5GGDIhXGsOwhlYAjM1hPcXMTc5N7z+kIm
	Jmb+qbcHq4XEd5SeSicG07yzelDVJhtymUfaYkb+vlooSLP22gPTdFmjmhcp5eTG
	FKVLUhziAK/wLjm7SMpClDIKY/c4HyNUL/+4MeV5VxKIzsp3O9PVEa0Oz2kPSz7c
	Xws1KshvdKyrhBqlYvsE+NeWpc7xifEMyWhudeT5iZKidIahoLbKovo6e+zcvnzh
	3EdPSA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gt0eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Dec 2025 13:11:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1be0fdfe1so417480585a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Dec 2025 05:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767100291; x=1767705091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dt2eP+Y7Oqwl540YyF+ybi9qy2vn6WdgODkOrzIHOsE=;
        b=aAefB9gJMo0y/hJpeazIBv2kzScqxcJL/2kt1SSr3yJ1SqbcEE6WPxgCiML5wYSSdE
         d7ePCJ+28KkAnrDravPS2+UCbBDQARiLI1rQWURpR535N7JoXkzoeAJ8NtlLSOit/aP9
         XNsBM46oJfIijmj1nlV0GrrjHzklCYoODorV+GOJ3D0dqoN1OppISJSqH4m5d5CJ4ty3
         ldyORBm14pp2KNbdqlMLfX7xaBoTu8DmgVQUk3GG0lo43Nnj0l5PRLwhNGfseEdneITB
         NVqIlcqgZ5MvSye8Uo1CHTKCbUrBJlrtxADaKEgBy117xo+mzyBvYOq1k+WLH2Vr+J5t
         vRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767100291; x=1767705091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dt2eP+Y7Oqwl540YyF+ybi9qy2vn6WdgODkOrzIHOsE=;
        b=qs3ca/Kb/UXC7rG22rwk7t6OHClLCS0XZQQOe0PJnx5XMBHsE2McJKCmq6bpmGhSro
         c4JS7ntn+Ja9asim/0HxeC+/MnbtjQWBx97N4t3+OfKhFNkKAcxDHAKU1YR6AnByiA4P
         7Q7TwwfaQb2OjbmFgThdkQND5+Pq+0ZuE0O3Nuf8vuPb17q474LIWXRnR43wCBcmWF8Z
         2xFJ5MqoquFHwRqYRFgXSKM09JuLFoasSrqXUPvySwc3ceslf7/zPXzdG41an0G4HcJ7
         EeD9NFFV8j2QsaMCBNhFGZRy2eYuTojPEJJE7KDHAGvjFiKfqaK7zfZ2AGkoY2hSQdC2
         W/YA==
X-Forwarded-Encrypted: i=1; AJvYcCUQhgP1nIg0TqYG9PPvdbPw1G/zyzI8jJBo/YZ4NUMThXrLkaaRczWDCdy052gSxGsSD3u2+1U+NcLLsUZJAUz0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb9WoGHX6tn2E8fEtfW/2hzbU7Oc8nf8mef65DivUgK0T8NSZl
	LJTJv9lA/R0BOy4o15NKPhfguq7Id1fzT0HRRQYlX3QZ2g8nFPItROZ6cPys8VwXo33M1Q8GDaH
	1tXrxqr6R0+eN3bWmTmmmMur0bac9SuuExQG81o0lJS046DnnQM6F74Dw/nUf75fkz+FWSnEP
X-Gm-Gg: AY/fxX4mqkGeiJ1GsFTueLQQl40KDQwkr4HAgiH2ul3/LWb3aRIJZjIgNpYaxxMWK3s
	2XqDVrqUSZ6LxUxkGvr02OGEFMLq4VFqofF0LeUxbA9NxnPjf8XySHj2iDByU6LXycZL1x480py
	E1LU1B4nd69/A+X/iP5czMr+hjQ2YPhkVn3APWENtCr5Kk9sqRG3IWp7nObydvJ/SiObTX3eXoG
	JWaRiaInKz62f65oVdaZbRxGIVrBrLLEH42WjtYuw4/xEcku6zY7oZm71AIDBchLUO3KmWRvNU5
	sZuGxrUbbzeF2jHLAW6dCm/5zRdAocY6XQMNYNcMiQ4ugd/7kF6PURoMFXXRqtAA1lTvW77uzMr
	HoiTS2/a8EcfILUK5w2lk5nh1cYhX9Xbal8yaCErPrpKLixOuMaHh7YUuApr5YoQdJA==
X-Received: by 2002:a05:622a:1993:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4f4abcd2349mr370256691cf.2.1767100291190;
        Tue, 30 Dec 2025 05:11:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOus8Oo8rBOHgphg16T4x88GeQXF22rIvKQDq2q5Y4+zs1Ub9Svq9UC10KtPEUbRRG0YDfxw==
X-Received: by 2002:a05:622a:1993:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4f4abcd2349mr370256271cf.2.1767100290536;
        Tue, 30 Dec 2025 05:11:30 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6ebsm34519958a12.27.2025.12.30.05.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 05:11:30 -0800 (PST)
Message-ID: <563ce29d-0a96-42a6-9c05-51cf16244cc9@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 14:11:28 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] remoteproc: qcom_q6v5_mss: Add MSM8917
To: barnabas.czeman@mainlining.org
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
 <20251228-mss-v1-4-aeb36b1f7a3f@mainlining.org> <aVJhH17XH1srlroL@linaro.org>
 <d531f1346b59af06c323f393883b1d13@mainlining.org>
 <2898fde7-2b3b-471b-8f8f-a02cb6953aaf@oss.qualcomm.com>
 <eeda5a8b6f5a9dc5cf5440afc07c40fd@mainlining.org>
 <d3ee6ba3e66706c304ecfe6afc4b75f2@mainlining.org>
 <10bc67e8-e9e9-491d-9e38-4b55735d42fe@oss.qualcomm.com>
 <a142c6c16ff298fe782b3fc80efc4a30@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a142c6c16ff298fe782b3fc80efc4a30@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QFKViSwYIeBC6F36IBlCO8LdAZ5xuo7s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExOSBTYWx0ZWRfX0pdmt1OCvAG/
 zl0g688lWLjpY/9SrfowCdurKXSrdZd9L7K6tLc8ZmVBVJf4VtOMQbfJjcdRYKkgrguJUej062x
 FTN2AzGDWVIZpbAOU/47k+Npez0bwpQBCVKrLHy1xn5RmH9A1yrWtZxYo7fFaW7+G3pLRz4hYMX
 bFsGihy9j1QnPS04uxfJjzlX5vJYt7WfaUwQmVLgGxPjNfZFz2e2regnhDeZegyL9Z6YemwiFqB
 GEcOmOnASgAtU6YwL13YdhZ1jVbqJ9eReCKyj6DpSAGqOLf51QVfuaXAIC2qHXxzUmIbCgrR0KP
 KKu6N+oqzfoQL19Vi7V83W1jFFEsyeB1h3m/O+oIqx+LEQc6p+kJsmQU1K9+QKiMXMR90szKICt
 zbUHHeriHi3Fu+04CQID4dRY/mu5auanfj1cK0sV70gJLQoc91tWyAlgl12BEWM4BN2v3aYYsi7
 TyfCIb4GprYchLDJCHw==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=6953cf84 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=qC_FGOx9AAAA:8 a=OuZLqq7tAAAA:8
 a=QONU935ig0yVzzykNcAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=7KeoIwV6GZqOttXkcoxL:22 a=fsdK_YakeE02zTmptMdW:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: QFKViSwYIeBC6F36IBlCO8LdAZ5xuo7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300119

On 12/30/25 4:25 AM, barnabas.czeman@mainlining.org wrote:
> On 2025-12-29 14:07, Konrad Dybcio wrote:
>> On 12/29/25 1:59 PM, barnabas.czeman@mainlining.org wrote:
>>> On 2025-12-29 13:51, barnabas.czeman@mainlining.org wrote:
>>>> On 2025-12-29 13:40, Konrad Dybcio wrote:
>>>>> On 12/29/25 1:33 PM, barnabas.czeman@mainlining.org wrote:
>>>>>> On 2025-12-29 12:08, Stephan Gerhold wrote:
>>>>>>> On Sun, Dec 28, 2025 at 03:21:54PM +0100, Barnabás Czémán wrote:
>>>>>>>> Add support for MSM8917 MSS it is similar for MDM9607 MSS
>>>>>>>> only difference is the mss power domain.
>>>>>>>>
>>>>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>>>>> ---
>>>>>>>>  drivers/remoteproc/qcom_q6v5_mss.c | 46 ++++++++++++++++++++++++++++++++++++--
>>>>>>>>  1 file changed, 44 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>>>>>>>> index ffafbe501a05..2579558fb567 100644
>>>>>>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>>>>>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>>>>>>> @@ -259,6 +259,7 @@ enum {
>>>>>>>>      MSS_MSM8226,
>>>>>>>>      MSS_MSM8909,
>>>>>>>>      MSS_MSM8916,
>>>>>>>> +    MSS_MSM8917,
>>>>>>>>      MSS_MSM8926,
>>>>>>>>      MSS_MSM8953,
>>>>>>>>      MSS_MSM8974,
>>>>>>>> @@ -749,13 +750,15 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>>>>>>          goto pbl_wait;
>>>>>>>>      } else if (qproc->version == MSS_MDM9607 ||
>>>>>>>>             qproc->version == MSS_MSM8909 ||
>>>>>>>> +           qproc->version == MSS_MSM8917 ||
>>>>>>>>             qproc->version == MSS_MSM8953 ||
>>>>>>>>             qproc->version == MSS_MSM8996 ||
>>>>>>>>             qproc->version == MSS_MSM8998 ||
>>>>>>>>             qproc->version == MSS_SDM660) {
>>>>>>>>
>>>>>>>>          /* Override the ACC value if required */
>>>>>>>> -        if (qproc->version == MSS_MDM9607)
>>>>>>>> +        if (qproc->version == MSS_MDM9607 ||
>>>>>>>> +            qproc->version == MSS_MSM8917)
>>>>>>>>              writel(QDSP6SS_ACC_OVERRIDE_VAL_9607,
>>>>>>>>                     qproc->reg_base + QDSP6SS_STRAP_ACC);
>>>>>>>>          else if (qproc->version != MSS_MSM8909 &&
>>>>>>>> @@ -817,6 +820,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>>>>>>
>>>>>>>>              /* Turn on L1, L2, ETB and JU memories 1 at a time */
>>>>>>>>              if (qproc->version == MSS_MDM9607 ||
>>>>>>>> +                qproc->version == MSS_MSM8917 ||
>>>>>>>>                  qproc->version == MSS_MSM8953 ||
>>>>>>>>                  qproc->version == MSS_MSM8996) {
>>>>>>>>                  mem_pwr_ctl = QDSP6SS_MEM_PWR_CTL;
>>>>>>>> @@ -826,7 +830,8 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>>>>>>                   * Set first 5 bits in reverse to avoid
>>>>>>>>                   * "inrush current" issues.
>>>>>>>>                   */
>>>>>>>> -                if (qproc->version == MSS_MDM9607)
>>>>>>>> +                if (qproc->version == MSS_MDM9607 ||
>>>>>>>> +                    qproc->version == MSS_MSM8917)
>>>>>>>>                      reverse = 6;
>>>>>>>>              } else {
>>>>>>>>                  /* MSS_MSM8998, MSS_SDM660 */
>>>>>>>> @@ -2538,6 +2543,42 @@ static const struct rproc_hexagon_res msm8916_mss = {
>>>>>>>>      .version = MSS_MSM8916,
>>>>>>>>  };
>>>>>>>>
>>>>>>>> +static const struct rproc_hexagon_res msm8917_mss = {
>>>>>>>> +    .hexagon_mba_image = "mba.mbn",
>>>>>>>> +    .proxy_supply = (struct qcom_mss_reg_res[]) {
>>>>>>>> +        {
>>>>>>>> +            .supply = "pll",
>>>>>>>> +            .uA = 100000,
>>>>>>>> +        },
>>>>>>>> +        {}
>>>>>>>> +    },
>>>>>>>> +    .proxy_clk_names = (char*[]){
>>>>>>>> +        "xo",
>>>>>>>> +        NULL
>>>>>>>> +    },
>>>>>>>> +    .active_clk_names = (char*[]){
>>>>>>>> +        "iface",
>>>>>>>> +        "bus",
>>>>>>>> +        "mem",
>>>>>>>> +        NULL
>>>>>>>> +    },
>>>>>>>> +    .proxy_pd_names = (char*[]) {
>>>>>>>> +        "cx",
>>>>>>>> +        "mx",
>>>>>>>> +        "mss",
>>>>>>>
>>>>>>> Are you sure mss/pm8937_s1 also works as a power domain? It seems to be
>>>>>>> a plain regulator downstream (similar to msm8226/msm8974).
>>>>>>>
>>>>>>> Same thing applies to MSM8953 as well though and there we seem to have
>>>>>>> decided to model it as a power domain ...
>>>>>> They have this at downstream, i guess this is why handled as a power domain.
>>>>>> vdd_mss-uV = <RPM_SMD_REGULATOR_LEVEL_TURBO>;
>>>>>
>>>>> It seems to be just a normal regulator on both 8917 and 8953
>>>>>
>>>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8953-regulator.dtsi
>>>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8953.dtsi
>>>>>
>>>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8917-regulator.dtsi
>>>>> https://android.googlesource.com/kernel/msm/+/android-7.1.0_r0.2/arch/arm/boot/dts/qcom/msm8917.dtsi
>>>>>
>>>>> Konrad
>>>> It is different between 3.18 and 4.9, 3.18 seems simpler and easier to use it as regulator i will change it
>>>> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8917.dtsi#L1375
>>>> https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.6.6.c32-05500-89xx.0/arch/arm/boot/dts/qcom/msm8917.dtsi#L1655
>>> Only question is left what about SDM439 and SDM632? They were introduced at 4.9 maybe that is why it was modified both are inheriting
>>> MSS bindings from 8953 and 8937.
>>
>> Seems both are the same too
> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/sdm439-regulator.dtsi#L18
> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/arch/arm64/boot/dts/qcom/msm8953-regulator.dtsi#L17
> SDM439 and SDM632 do not use simple regulator, s1 seems power domain to me. I have checked it in use at Fairphone 3, Redmi 7 and 7A
> all have S1 as a power domain.

Hm, it seems you're right. It does indeed use level-based voting which
would qualify it as a power domain in our upstream understanding

Konrad
