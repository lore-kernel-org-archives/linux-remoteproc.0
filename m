Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CC842314F
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 14:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744248; cv=none; b=BLTXUfVXOWNsG+unilq1b7HXm1axngGBPolvinl9J+dAn62ZNxcjgbqALQCQUuHZX+kC72cMYwS4XlxfSteXbEjnyfjQWnZTTHhbnIhQ0fx7IwzMj9VjJDXfLyTo+Z/RY98277/dby/QtxVsYm2O8QGaktL/j6go3n7pHJZLjq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744248; c=relaxed/simple;
	bh=gWJAwz2ZHhwS2HGJrGQY29G7D+E3lCi8DwYOZoH/WHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMsNgLwSce/ipm+CfmdjQVTZn6F8a9EDZTVFemgBO/qF9zYeKBuUi08NDdRHcigTTCJcdBH6NylRlxdzMleHdonnUSKfp4jCyo0NnZ7ur3MnLAWmwE1PveBolm/3zcehp6Nz0gLL6BzIFITqrS/Q8qwFOhp/O/ruk/FW/hoey+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fB0QzmNn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZeHuzVA9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fB0QzmNn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZeHuzVA9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT32E2641697
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 14:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qchk2MkefAKVIklzCH9TFm/NuG0dZDLePCYOMg4obTg=; b=fB0QzmNnEJikPNtf
	RzogspgFMsWKAp6FIR4wXZH2Dhl2CLHuIN2FYw238GACv+8g/DL7wZWMQiWVxyLs
	7eFpqkhMxFYccdit7rdoIGw4wc+zjyigQxlX+ekT4cen0lJ+3ct53UBWy9FfZN68
	mY6WZUXOE144g6n1Rn8gYq4VGfeo9fJVg7bRF4yXffqhR9TJT962QjhoZjx9/ToG
	cw8l92DU2qs8vhQlrz5S+gLbSNEXJ6c+BnK2svxDSxlltVxNxqtws/yReyOU72Cc
	b51Vww+kwiktc+Ro2uUV7ZqXd8q00b1ZcGyE/+8L0Wn2ByCu6SA6/eV/OG6dzX6a
	cr7Kbg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3npesbr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 14:44:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84240683a82so2248683b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 07:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744241; x=1783349041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qchk2MkefAKVIklzCH9TFm/NuG0dZDLePCYOMg4obTg=;
        b=ZeHuzVA90tXi4gZhwiynKEgiEa8RwUBfokCGm3ZZG/YdJlm4BE8Nz2qsz2Li1Bhr1s
         Y1nZ66MHCuHF20rF41eJdJjHqpvllNRrUAWOkbBdmcMTyNpLcs8IVw7epuGzalAGienv
         tSsNFgTCLK2A9I5B5kO5o868n7vIytkENx/puJMw9cHLqI+NKSeIzvcaOQJUVbbZMJG/
         KAv08ovCNEAgG49DyDZeDRKpdwwBPG6OXrMOmIy9yWmDfDDTcELBeueVFYo2aRukq+Tc
         /zZv5UcaNtD4x5/BETwgt5D0jQ+qHktVWY1uj/bSa118KlIQDA6zKdIyQzGGBD2Isj/P
         n7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744241; x=1783349041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qchk2MkefAKVIklzCH9TFm/NuG0dZDLePCYOMg4obTg=;
        b=LuKSb/JNkfk285SXK83ZUiIizdY7PMraJdywCYNmQ/Ci5tbvx/RHeMlnztVhFIoSU9
         UorqZyY4Yv+JbipybCLpwZxh8oO2vIHS4eobnEzmFXYnPvY2qlpwtUj4/qIsGt4G9lw+
         wY1dneVtHgsm25Xt4xNtWv+UbOmSyUkEhC7k/O/aApypd24ujWffJEvUvO7x0gr5/gEX
         BoXTnTVKlZYJvzN1H3PjzTxzBU9a1wWNtd6DluEtPqh+RToKRrEGWxg88601PXatkpJc
         SiXhWP65w6IrOaPGB/7M5HGX91yWORSUJ9lheu01PEovuGqxvTAQ72e2KETIldH99GuJ
         n3Lg==
X-Forwarded-Encrypted: i=1; AHgh+RrQ5SBTISsPUVaeoB2INfZevU0+DMGAkre2HEKnY8vH1AG1rWxt0s4XjC9Qjvfh5UBqpkFraeB1gHQiQ/dhc4X7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5CcinqFE01FDKykqxot8IjrSjx3EVSxG+/VqAkotR/1sRDW/v
	xge8db1x27cXpu0N9tXcM7p8AAFDloMPeMzrcaazZNtf013a8k3SKmozefrwURCLMrlL31KIOCx
	Qw6fSwjkEX7HysJrT7UQJmqU3tu37cJPUTrKCajI93iTDr6DYEZ3Vr83Hhth2SXYNgHKt0fu/
X-Gm-Gg: AfdE7clEHPYFORyQ27Q6c7b5ZwLWN/Hb6acYb5mWGhzVSPqoiJGADom1SKF88rs/tfI
	6LGQVo1SlNUv9/HV4NmlHlukHMquFGVfdF/xanooTMzCV+ja9IkJbeOh996ZPbCY2UzQCySbA8f
	1UhgQ0BKfJVegwjSW2PDm2XuMOuh4saJ4gpGisu6WTCrU0RHZcqpQAGDiZah27DYr+W8ruZKmI6
	vpNjDiRyBh2sCii0ZwSZptbtqUMKC3BjRAgaxsafvPUCzx89aYMuDiKfPeAvzNJIaCZi4YFbRD6
	PluFHPGeCcfWHX4y+YFrX1FzV3e3b26fvu1VCyyJoPi+Rmjr4hkUgEyO8TnFURd8yM52e+zLQ6S
	mx2sEGQThqWLVRSUGV4dETQUTNYFe2kLNP8Zieen3FQ==
X-Received: by 2002:a05:6a00:6983:b0:847:70f4:613f with SMTP id d2e1a72fcca58-84770f465damr2921933b3a.12.1782744240752;
        Mon, 29 Jun 2026 07:44:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:6983:b0:847:70f4:613f with SMTP id d2e1a72fcca58-84770f465damr2921907b3a.12.1782744240207;
        Mon, 29 Jun 2026 07:44:00 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84774c8d180sm3031081b3a.54.2026.06.29.07.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:43:59 -0700 (PDT)
Message-ID: <12443cb5-f010-456c-b210-03cc7d9547a2@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 20:13:50 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-4-291a2ff4c634@oss.qualcomm.com>
 <pf6rymdtbfcqqzt6vnn6gc3uuod4vlfpw42dxxag33aom7lltu@6ymibirvwfnc>
 <4006d16f-a159-4f1b-ba80-f19bef8f4c5c@oss.qualcomm.com>
 <ezggulsc6wvd3gbgnm6tepvtcnvwkeyvva4szrrwbcksxgcesg@qo5l5pjtz77n>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <ezggulsc6wvd3gbgnm6tepvtcnvwkeyvva4szrrwbcksxgcesg@qo5l5pjtz77n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX7NpdqmPj/shC
 3Lsw3uP8J7MetbQpDuMg6uKdcjRTBfh6uV9GGT7GAMx6WdsCcWYb5W6KAK7mRbKJJ3ZSc710py9
 cJ2s12WO8Uj+lscz/L4iIQOqhxNeWPVn7ZpMQis1/wtGclW5nSh7nLBQBq16hTrRv6w02lm9CVF
 EMFsFaDR6B0Ueug3WCWvn8ZYSaBHgOJwZxwAd9Ff8sydJ4lOWpp/FKe2tTQunYBve/6i1om+sJ/
 0y6Kwlkb5NoX5Fz2Frjy3+iiVZv96Wzjim+EYTsN68zG7ZkAKu3Zx5acvVxqYMC1lBKMDh/I0po
 GPVeFVx9vBlntLGHB9xdLIfXT94sugLKZDKFn4PDJCLGK5gPjSxLeiIAV5KUwVqlhQR9ERSVwLt
 cr5VigNOfMad61B0Rn89AOYES2JJCMqHxplZqm1RgE8MbxovseVcgz+N7+YPoLBP/24mqfhEwrm
 gP0LsSQ0K3wwL6hAD3w==
X-Proofpoint-ORIG-GUID: 7fp4t9PRVX9wtT4XYcZiJlgPvvzgtdMb
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a4284b1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=H1hhAa048skaI1irU30A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMiBTYWx0ZWRfX+jPzk3ivQdR6
 ttukrlgChMC/5bGVqsrccqvCEdjX1hsEBx8USCdAhsOkAjfnHfVJoWibjb0EYg9ESsAv+KRSe4/
 u31DHd4C+LfAmWE7MIVYO8Fofd7Sx/0=
X-Proofpoint-GUID: 7fp4t9PRVX9wtT4XYcZiJlgPvvzgtdMb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290122



On 6/15/2026 8:55 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 11:02:22AM +0530, Gaurav Kohli wrote:
>>
>>
>> On 6/9/2026 4:27 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jun 09, 2026 at 03:52:59PM +0530, Gaurav Kohli wrote:
>>>> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
>>>> when it reaches high temperatures in kodiak.
>>>>
>>>> Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
>>>> for modem when it reaches to 95°C.
>>>>
>>>> Remove inherited mdmss cooling-map nodes for Non Modem kodiak variant.
>>>
>>> Why? If it is a GNSS-only MPSS, does it not provide any thermal
>>> mitigation mechanisms? Does ADSP provide those? WPSS?
>>>
>>
>> Hi Dmitry,
>>
>> Thank you for the review.
>>
>> Since the remoteproc_mpss node doesn't exist on these boards, the
>> cooling-maps that reference it cause DT compilation errors. That's why
>> we need to remove the inherited cooling-maps from the SoC DTSI.
>>   /delete-node/ &remoteproc_mpss;
> 
> Ok. Explain that in the commit message. And maybe we need to fix those
> boards to provide mpss instead.
> 

Ack, in new version will explain in commit message.
>>
>> Regarding thermal mitigation for other subsystems:
>> ->CDSP and Modem are the primary heat sources based on our internal
>>    thermal testing and evaluation.
>> ->ADSP and WPSS have lower power consumption and don't typically reach
>>    thermal thresholds that require active mitigation
>> ->For this, I'm checking with our internal team to confirm if ADSP/WPSS
>>    provide any TMD mechanism across all targets.
> 
> They do. I've posted the dump of qrtr-lookup somewhere.
> 
>>
>>>>
>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kodiak.dtsi               | 127 ++++++++++++++++++++-
>>>>    .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  17 +++
>>>
>>> So, you removed those for Radxa Q6A, but not forRB3 Gen2. Why?
>>>
>>
>> Ack, this is a miss. will fix this.
>>
>>>>    .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  17 +++
>>>>    .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  17 +++
>>>>    .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  18 +++
>>>>    .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  16 +++
>>>>    6 files changed, 208 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index fa540d8c2615..d345add2d8c8 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> @@ -3427,6 +3427,9 @@ remoteproc_mpss: remoteproc@4080000 {
>>>>    			qcom,smem-states = <&modem_smp2p_out 0>;
>>>>    			qcom,smem-state-names = "stop";
>>>> +			#cooling-cells = <3>;
>>>> +			tmd-names = "pa", "modem";
>>>> +
>>>>    			status = "disabled";
>>>>    			glink-edge {
>>>> @@ -4787,6 +4790,9 @@ remoteproc_cdsp: remoteproc@a300000 {
>>>>    			qcom,smem-states = <&cdsp_smp2p_out 0>;
>>>>    			qcom,smem-state-names = "stop";
>>>> +			#cooling-cells = <2>;
>>>> +			tmd-names = "cdsp_sw";
>>>
>>> I'm going to review only this DT, the comments apply to the rest of
>>> them.
>>>
>>> So, we have two cases, CDSP and MPSS. Why does CDSP have only 2 cells?
>>> Just because tmd-names has only one name? What if we add another
>>> mitigation (which can be added in the firmware), do we suddenly have to
>>> change number of cells and all the cooling devices to reflect it?
>>>
>>
>> As Cdsp has only one relevant tmd to mitigate, so we have used cooling cells
>> as 2. But i will change this to 3 as this is backward compatible.
>>
>>> Finally. If I understand correctly, these mitigtion mechanisms are
>>> provided by the firmware. Firmware differs between the boards. Vendors
>>> (in theory) can change them. Why do we list these names here, in the SoC
>>> DT?
>>>
>>
>> Below are the main reason for this, replied in other thread also.
>> Please guide, if i can use qcom_pas_data to define names.
>>
>> Following Daniel's series [1], the thermal framework supports
>> mapping multiple cooling devices per remoteproc/device via indexed
>> cooling-cells.
>>
>> 1) The thermal framework's cooling-maps reference
>> cooling devices by index (for #cooling-cells = <3>). Without tmd-names,
>> there's no way to know which index corresponds to which TMD, as firmware
>> may return tmd-names in any order.
> 
> You can #define the indices to the well known names, turning those into
> bindings.
> 
>>
>> below are the changes post new thermal mapping changes:
>> DT: tmd-names = "cdsp_sw", "xyz";
>> Firmware: ["cdsp_sw", "xyz1", "xyz2",]
>> Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)
> 
> What if the DT has "cdsp_sw", but the firmware doesn't report it? That's
> an error, as it seems.
> 

No error, driver won't register cdsp_sw as cooling device for such cases 
and binding won't happen.

>>
>> This allows cooling-maps like below:
>> cooling-device = <&remoteproc 0 ...>  // "cdsp_sw"
>> cooling-device = <&remoteproc 1 ...>  // "xyz"
>>
>> 2) Not all firmware-provided TMDs should be
>> exposed as cooling devices. The tmd-names property acts as a filter,
>> allowing board-specific DT to select only the relevant TMDs for that
>> platform.
> 
> But then the properties should be defined in the board DT rather than
> the platform DT.
> 
>>
>> [1]
>> https://lore.kernel.org/all/20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com/
>>
>> Shall i use pas data to define tmd-names instead of dt ?
> 
> Let's settle in the thread with Daniel.
> 

Ack, as suggested will drop tmd-names and use dt binding for the index 
and name matching.
>>
>>>> +
>>>>    			status = "disabled";
>>>>    			glink-edge {
>>>> +			cooling-maps {
>>>> +				map0 {
>>>> +					trip = <&mdmss0_alert1>;
>>>> +					cooling-device = <&remoteproc_mpss 0 0 2>;
>>>
>>> What does this mean? I assume that the first cell is one of the
>>> mechanisms. What is the difference between them? Do we really need to
>>> list them one by one here?
>>>
>>
>> Let me check, if i can document different tmd's somewhere:
>>
>> -> modem tmd used for Modem Processor mitigation.
>> -> pa is used for Power Amplifier mitigation.
> 
> What does that mean?
> 

this will prevent overheating of RF power amplifier by doing uplink
throttling.
>>
>> And we need to list them for binding purpose mainly.
>>
>>> What do other cells mean? Why are they 0 and 2 rather than
>>> THERMAL_NO_LIMIT? How does one come with those values? This should all
>>> be documented and explained somewhere.
>>>
>>
>> Will change to THERMAL_NO_LIMIT. Let me check, if i can use
>> qli doc for documentation.
>>
>>>> +				};
>>>> +
>>>> +				map1 {
>>>> +					trip = <&mdmss0_alert1>;
>>>> +					cooling-device = <&remoteproc_mpss 1 0 2>;
>>>> +				};
>>>> +			};
>>>>    		};
>>>
>>
> 

