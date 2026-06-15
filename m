Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8442397E8D
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2026 05:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501556; cv=none; b=It4nzMczVMtATAR3q6G1KFixUNDsxjPoI+Zgbvn8bngQaQvgGUjjtPnNI17QooWJXEshjdHiIeFPAN23uG75lXwkSmzBmrQygLBT2jwc9KXZmgcJVr4xt1DQjGre+E6/76v/w9tXzXq0RH7BL72/Z9+TVNZbTVOrfBYR5dKWqCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501556; c=relaxed/simple;
	bh=kpOfB852bwmuwaZanodcktCSfyCuAn/3QFse7+RpxgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PrpQAs0YwaVek+vhxV3cAucSqfgQ/SKBUb1qeKHS/2GpqL5JU4Qi72qd5cjBoIhlpa5DYqC84CAVyPa5pDidEOe12me6ezDdtEn4g4O9rFXYqNLJaV0goLJDT/lRJI++ndudZJqkdqcWwp+v0XbL9JOTgi5fFtDcNpLHuRFKZWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9BC89hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDSDWHYB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9BC89hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDSDWHYB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1k3ML3286251
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2026 05:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2WxLejNJ7y8XIoszPdcRSycDXw68aEv4UAG08MDaNWg=; b=J9BC89hylX242OS9
	vfP1ZBIuKej/Ovithi1H/Yq7GrbI74fkghjOxKmxD6xE3fCEM/akHAhMVa8xyIlw
	pFSI7CFXltgfg3ka8wCxcfXGBH9YG2wqSIDlFcZmVwDi7a39FdSCx9ygJ8t8CxzP
	60OZVba0SaqZXUDTcHV5I9Yf3ZBzYaIfNWnz5tmA5MhKcQDXEFF1Bwdz2MepIrki
	kJVSM5RCd+l6jB+wDb8L9vk28bc/Xsoto/r2EpCIfEe4ZBlY8D6wbKVcrDlRONHi
	bQfNX2yCKNGsVdCGq4EYhxbZ3zwNF9TC2p1248R7K4lFZyw1jKSX0W9v7Kh7Miiy
	fE7I6g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wwppq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2026 05:32:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a2bf5388so1329065a12.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 14 Jun 2026 22:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501550; x=1782106350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2WxLejNJ7y8XIoszPdcRSycDXw68aEv4UAG08MDaNWg=;
        b=JDSDWHYB1rlEydU3075W448184SOkGc8kbcivuRCGa2Y6c4zMc7xwDex2NCrXvLkbN
         o3TJQtp/JhfLREXJRiqdQeCpw5abVSi9/b45cVIX4zQTZe61TX0KbjzNXvg7n3jU0AZG
         MaJcuzoaWOgSkEw3t5QfceduprWCSaJ+2uVEkz+yoISHn5783EXmw9Tc8XLsaZH7qAFk
         m5wNHYkSZZ5+gtstpsl4AK1CwQX8VAiX7m029yLbOg3RpzMZqRVnx4seNpqk5MeGmJWp
         D04GExGzXVPlWyLQarsbu/QWTivLoZqRCUzK6KrmGgGl1g8A91ZFSCUBuG6KyM554nbH
         IGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501550; x=1782106350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WxLejNJ7y8XIoszPdcRSycDXw68aEv4UAG08MDaNWg=;
        b=bwlbkj2KDIv0sCXFYEUGeS8nuuh9/uJ3vJ49yiocTte2PD/OJN83+87uFT+I/cHLzl
         Yf0n7RCV9+ZzlB9GllE8cNavjr0BbSIJGhLNTPGhVOF9GyEWsm8bb0uZnk4J5Mn8gp3Z
         bg9yAURwEP60dJpuTuVfEZmefRhtPniL8B23YhZT5PwMCOkDv5GdSreqpaGBJeUBXfIm
         ohYq4HkLC1Jh1BaQhdq5IFOOoJfZim1p48OjK70PlV/gLmtKjCu2lDGXTODkWmhbnRKt
         UW9TN0uL/kJKbhwlHHlRNKI+cbhmDgqzXko4PDV+PFnWxshlW7KmgDoOuA4j+EaHZOU0
         xDgA==
X-Forwarded-Encrypted: i=1; AFNElJ+cKVlDFEmKFgIVte1nRjkgEyTTNv8SRWgNjuuv5VRwd0+w340L6ZzxaOuO+6xRDqYwuCGqkG6qgwGO5LgQsNRL@vger.kernel.org
X-Gm-Message-State: AOJu0YyBU2CY4GYmBSX0lzv3RZ3+LmVzcruzVOfT38ti0A4+VUKEAy7l
	+UXISCOZRuX5QbVyYQA+31v7/CA068PIsb/9FElaebrt65RDTFh126h7XB3WxWMhMbxh1a3swIV
	7kxPsO6eXbybxGTceN97J6BxF7AZOB605FmmSx2VeTd2rbKDdG8EibZS/YmTxf3VwyyNMZpLA
X-Gm-Gg: Acq92OGKTDKl1YcaRFa0nEYQrxGicdW8jSdG08fokQ9DSdbYXlYyRkJf+0OgqBg8F3l
	0NtgMUCbmprXPP7fNMxtw/dRSQaORaEq1OKSkFOGkyl41acfpSGCu4VuL69sVak5cuXLrsCUAQ3
	vDTf3y18sZHhZPkdb0IwfUKK0voM1CUvuJVcV5n1L7E3E4qtkCLjxOD44mjl/+XGYaDM07j+fCu
	QWifLYfD5cYCZaKXLG47edeZhuLdV0zaQYYmtQLpgr2ejgEs1NTNOyO14Oe04WoCn9cyekaLsSr
	eFtRHB0BzvX9deGZgKBjlFTQhGucGJ0SWQZQdPVCHwdoJEo5rdkW8seCJna6yxU0IP+Snvh/u2T
	2LHaKrmEdklKv0J/+KyogWmWjc2MMkTSYU/2HAF2x6tpL3xWHLuo2
X-Received: by 2002:a17:903:944:b0:2c4:608:167c with SMTP id d9443c01a7336-2c410cd152emr134644995ad.6.1781501550285;
        Sun, 14 Jun 2026 22:32:30 -0700 (PDT)
X-Received: by 2002:a17:903:944:b0:2c4:608:167c with SMTP id d9443c01a7336-2c410cd152emr134644755ad.6.1781501549703;
        Sun, 14 Jun 2026 22:32:29 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8dd4bsm88750835ad.60.2026.06.14.22.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:32:29 -0700 (PDT)
Message-ID: <4006d16f-a159-4f1b-ba80-f19bef8f4c5c@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:02:22 +0530
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
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <pf6rymdtbfcqqzt6vnn6gc3uuod4vlfpw42dxxag33aom7lltu@6ymibirvwfnc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XogAx9leC98tUrxhErO_1MeEiCbk5BV_
X-Proofpoint-GUID: XogAx9leC98tUrxhErO_1MeEiCbk5BV_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NSBTYWx0ZWRfX6D5UrGG6gpSM
 vXMjkAsRLOd9NNsJbyEvNkgzJ7uJZHM/lEW7rWRE8GepqwsnboF+kBHPQIddNg0mJSej8maw54N
 mzq0OC0BUdy6AqHDENpMvuoanpQrVs8=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2f8e6f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vKcbMMOwgKL51wQY6hoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NSBTYWx0ZWRfX9guN8PFoz5B+
 C17WgdF+OiKLVFYmz4lT4lV2EWgGmKrdstXSIKiGBvroBQqr1isYFFp7aCPEJFLRql39WqijBuo
 b4deibnKbaR0s5fhekrcRmcA3FKPGWrhxyhv7cNKBCmUqhPjF4Yb9gvdvKeU+jkengK0UMF8G2Z
 ZaOVdhMocibviQcUOHxNaiktvzKm2HxwSyi0cmXUIOkIY3KNPR0ijCTEScs9HSllM2Cnr00xnu2
 PCSdAoIesoHhanMPv9k38WXqrJwhOdr2f50rizLs9l5lUhv1MhFcpY1YlChf93LCp/mkjxMaRad
 cfRpgkZmLIt0RFLv3Vt6YJgsnFcepGnDlg22BR6uu+VAcpQqOE/A76vmK1r3CuwXJiob8mOqLgF
 WgQ3yG8NQXmSDGtKlOxsaJq+2UgCZIzZa7aZgJqm6zWBxsEgxuHxq+X/z1d2bO48RraFIXQKzN2
 /DpNW45t1oKXzY3o3vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150055



On 6/9/2026 4:27 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 09, 2026 at 03:52:59PM +0530, Gaurav Kohli wrote:
>> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
>> when it reaches high temperatures in kodiak.
>>
>> Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
>> for modem when it reaches to 95°C.
>>
>> Remove inherited mdmss cooling-map nodes for Non Modem kodiak variant.
> 
> Why? If it is a GNSS-only MPSS, does it not provide any thermal
> mitigation mechanisms? Does ADSP provide those? WPSS?
> 

Hi Dmitry,

Thank you for the review.

Since the remoteproc_mpss node doesn't exist on these boards, the
cooling-maps that reference it cause DT compilation errors. That's why
we need to remove the inherited cooling-maps from the SoC DTSI.
  /delete-node/ &remoteproc_mpss;

Regarding thermal mitigation for other subsystems:
->CDSP and Modem are the primary heat sources based on our internal
   thermal testing and evaluation.
->ADSP and WPSS have lower power consumption and don't typically reach
   thermal thresholds that require active mitigation
->For this, I'm checking with our internal team to confirm if ADSP/WPSS
   provide any TMD mechanism across all targets.

>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi               | 127 ++++++++++++++++++++-
>>   .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  17 +++
> 
> So, you removed those for Radxa Q6A, but not forRB3 Gen2. Why?
> 

Ack, this is a miss. will fix this.

>>   .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  17 +++
>>   .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  17 +++
>>   .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  18 +++
>>   .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  16 +++
>>   6 files changed, 208 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index fa540d8c2615..d345add2d8c8 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -3427,6 +3427,9 @@ remoteproc_mpss: remoteproc@4080000 {
>>   			qcom,smem-states = <&modem_smp2p_out 0>;
>>   			qcom,smem-state-names = "stop";
>>   
>> +			#cooling-cells = <3>;
>> +			tmd-names = "pa", "modem";
>> +
>>   			status = "disabled";
>>   
>>   			glink-edge {
>> @@ -4787,6 +4790,9 @@ remoteproc_cdsp: remoteproc@a300000 {
>>   			qcom,smem-states = <&cdsp_smp2p_out 0>;
>>   			qcom,smem-state-names = "stop";
>>   
>> +			#cooling-cells = <2>;
>> +			tmd-names = "cdsp_sw";
> 
> I'm going to review only this DT, the comments apply to the rest of
> them.
> 
> So, we have two cases, CDSP and MPSS. Why does CDSP have only 2 cells?
> Just because tmd-names has only one name? What if we add another
> mitigation (which can be added in the firmware), do we suddenly have to
> change number of cells and all the cooling devices to reflect it?
> 

As Cdsp has only one relevant tmd to mitigate, so we have used cooling 
cells as 2. But i will change this to 3 as this is backward compatible.

> Finally. If I understand correctly, these mitigtion mechanisms are
> provided by the firmware. Firmware differs between the boards. Vendors
> (in theory) can change them. Why do we list these names here, in the SoC
> DT?
> 

Below are the main reason for this, replied in other thread also.
Please guide, if i can use qcom_pas_data to define names.

Following Daniel's series [1], the thermal framework supports
mapping multiple cooling devices per remoteproc/device via indexed
cooling-cells.

1) The thermal framework's cooling-maps reference
cooling devices by index (for #cooling-cells = <3>). Without tmd-names,
there's no way to know which index corresponds to which TMD, as firmware
may return tmd-names in any order.

below are the changes post new thermal mapping changes:
DT: tmd-names = "cdsp_sw", "xyz";
Firmware: ["cdsp_sw", "xyz1", "xyz2",]
Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)

This allows cooling-maps like below:
cooling-device = <&remoteproc 0 ...>  // "cdsp_sw"
cooling-device = <&remoteproc 1 ...>  // "xyz"

2) Not all firmware-provided TMDs should be
exposed as cooling devices. The tmd-names property acts as a filter,
allowing board-specific DT to select only the relevant TMDs for that
platform.

[1]
https://lore.kernel.org/all/20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com/

Shall i use pas data to define tmd-names instead of dt ?

>> +
>>   			status = "disabled";
>>   
>>   			glink-edge {
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&mdmss0_alert1>;
>> +					cooling-device = <&remoteproc_mpss 0 0 2>;
> 
> What does this mean? I assume that the first cell is one of the
> mechanisms. What is the difference between them? Do we really need to
> list them one by one here?
> 

Let me check, if i can document different tmd's somewhere:

-> modem tmd used for Modem Processor mitigation.
-> pa is used for Power Amplifier mitigation.

And we need to list them for binding purpose mainly.

> What do other cells mean? Why are they 0 and 2 rather than
> THERMAL_NO_LIMIT? How does one come with those values? This should all
> be documented and explained somewhere.
> 

Will change to THERMAL_NO_LIMIT. Let me check, if i can use
qli doc for documentation.

>> +				};
>> +
>> +				map1 {
>> +					trip = <&mdmss0_alert1>;
>> +					cooling-device = <&remoteproc_mpss 1 0 2>;
>> +				};
>> +			};
>>   		};
>>   
> 

