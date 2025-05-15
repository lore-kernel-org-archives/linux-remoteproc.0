Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1984A20B812
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 May 2025 15:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323157; cv=none; b=RyRLZF/mzWXCy1rkj855KX/E0MzXatshWLqBhPVuJJ2hXtg25QtWE3Ts0VNg6WbjLiwT3Wox6iVpIgWZ0LBxr+tMGrfnJcxYjtW6SFP/MzG+aFE8lq38kAzmGX+WrvY9wpMObMC3uSvtw+3G9vmQjRZbbKAXaZi/I0PTCzjBn0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323157; c=relaxed/simple;
	bh=klIGHXOkD03FDwy8hJgAQXn12TNZp/82FPKxqTsk8qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bu6L6bVHZHIWmakhGELQEePKy2OceDvLgEXjVdE7DgDLM7uuPYaLLNfbtWbbrONu5tZH8E4pPzlSfg/p1P78WrSonnNNAyVLjOdwjU1wTww1jqB6h/6BNrLI1C0d2Z6y3/Xi9s+M8+K4tTY5ec7P0NQcftOX7zAOtlN8nG9KN24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOuIMtDj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOuIMtDj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFAFi014461
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 May 2025 15:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZpPiNrvgY4eYUo8F+dgbENw9B8cGscsFLmXIEga59k=; b=jOuIMtDjkRCYwdTC
	6ZW5/cui6PSOEu1f57Iym4l/L0OIlUdzwCM+JIJx7vEqCgrks9tY7YS9kKm74W9Z
	YsJdTr+iR7Nm8L1DldyOoKdHCPjuHfFefVeeKhb/WkPRFCTQNYW388YodpFYgCLx
	5ZoJBa9kdYScIVIjzI3wx82IqP++EhRfU1zxmkpvDbTMEvLXM/rScRRRweCVTVhN
	yCTBL/rFzZSvy25HGJFNdFm0pocp8I2V52PMPQBFTeZcXCIDuZcM9a0Z+P4VUrhJ
	fqtBwUVn1+NPgFYOqVWomgcVKMMlq6hj50aDawt11MurbHkvIZU8PIHXtpHrNfG7
	bHV2aw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcperwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 May 2025 15:32:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c552802e9fso22635085a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 May 2025 08:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323153; x=1747927953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZpPiNrvgY4eYUo8F+dgbENw9B8cGscsFLmXIEga59k=;
        b=mHjJxXyTryXBd2/GIk2v0U4KvEyASzVNI/ZvGotAcmLMhbMnTCHqVcMGOqqZWPYj4Z
         5URZ4G2CjZNhPzLQxwMh/em95RAMwajZn7rCvoX6VrouLn4iDKc55wLAc2l42Jkw1ZIK
         PWisJ2CcRzr8Pz9wp4yl+XB0WiictVzzwq5D974jGSJ3Vdonbs7pjzCz1dmyBQBnTBzO
         csz2dK1L2kwEBmb4yj+MSWptQ4rjck4jivIhAr0uFu63TUvPibuq9gGgvltyp5tzgC9N
         Rtlm/jv5FNTNHnY+0PU4NEhQB+GHaFvWJ2k3szBvGIabaGErf6ADfPZE6b4X7Lz9Bchp
         o8Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVcf1jgACsH5KFqGLtvAVgIaSjHQ/9ri/Usc2ezKxjNYqVeHS3+eytkNN492ZiPwACThCRCovvwgXWrmYHuk9q+@vger.kernel.org
X-Gm-Message-State: AOJu0YzCnEXT5LJH1IXp35Q74GBymUci8bfzwtdXOJr4/Y6DzFd/SBc8
	C/HZdSCMd0lyOEx5MQS9jKM8u4immS4WSK5i269zRwW5viF64ZVK7vaf+Lc5aWYd8nxW5JtjbQJ
	wBbhRdiCftULLyxxqGUPGTjaaNfrakRc0q3mwxr4ld9hm/Iw5PHtYg9alXNxu8tNfSgZM
X-Gm-Gg: ASbGncvTNsSPjgBj4tr+ry0A43f2/aanspVKLhOw2REZcf4y9rSZb+H0DXgnKxI9TFZ
	c7FwTrMpQWGrALom1xivfvfa8S3b5oZUrpyr1CmbZF8em025YfTnmG+LsN9r2pfZe8MWF/9xcLO
	QvGHDwtBIPTCT+kd+L1CuYeAXTBWgEnaxt5fQHsnHZN7AU53LkR5apDc8AN6EGdu3Dgj7JhusJC
	igAeal4baoj3/ywWyC4fWFKZvsAUzNVwexA6bSgWftfhYe812XQ3r0ictruNxiM8L2UpdL9FKgX
	DlhGMSc2iRZVL3R3f7joYk/ju2ZV3fcjAxchgpIpTJfeXPbzm3UwQ6v2meluDyP0PA==
X-Received: by 2002:a05:620a:4392:b0:7c9:23d7:6dd6 with SMTP id af79cd13be357-7cd2885d23cmr433864785a.13.1747323153336;
        Thu, 15 May 2025 08:32:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzzoBcSI7/4KawwWcUr7lewYJfqXtiBxcRJbuYEJLwKVy9KuCKwkIxCWmGuEw19Y7kK14/iw==
X-Received: by 2002:a05:620a:4392:b0:7c9:23d7:6dd6 with SMTP id af79cd13be357-7cd2885d23cmr433861485a.13.1747323152744;
        Thu, 15 May 2025 08:32:32 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d502736sm5585a12.25.2025.05.15.08.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:32:32 -0700 (PDT)
Message-ID: <d0caa0c0-3b5c-4020-8ad5-7742dc32c6f0@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:32:29 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/6] arm64: dts: qcom: ipq5332: add nodes to bringup q6
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, quic_srichara@quicinc.com,
        vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-5-gokul.sriram.p@oss.qualcomm.com>
 <242f6059-a32f-4ee2-a794-8a29b6449e96@oss.qualcomm.com>
 <7d4f174f-18e6-402f-9a29-c4c461d0db0b@oss.qualcomm.com>
 <wzij5uhbc6yqxnqhgfrni64gds33chsuiac3no73otdkihft4c@wgvrfio26sze>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <wzij5uhbc6yqxnqhgfrni64gds33chsuiac3no73otdkihft4c@wgvrfio26sze>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 98KDBt01dnr3gqckGNahIT7n5j5sDP4v
X-Proofpoint-ORIG-GUID: 98KDBt01dnr3gqckGNahIT7n5j5sDP4v
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68260912 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=TaugYdf9BiJrfqk99gEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1MyBTYWx0ZWRfX8U+WnE84XB9I
 XwuBCSw8YMiZ0A4/Tn5jmjDTnJFvZbTnjwUNqFvJSeDNM/1XmLwk6s4YbfkmABYqRwBoaKVGGeF
 hvP0qLGYXTtmaZFHssVqW1GIcIqcCOLEQ1uzbQME29hWI2N+SRVlOQESilJEsQsXmhPjVZxVRHU
 QDGwvJCW+pOqQJ7J5UpBT20dN+NVYrw4H6el0bo7UAiftCYJWYD1fl1paBIi2TqnXzTX3yxw4md
 UgDBz87s56tylYfXsVr4G+t7BGZtcIIH2rzxo2G/AjGwXhOBOc9VxiSh+YQ2J89IByrUQXkWdeS
 MTlaKVmo6LueCPwPDEZpHIXkDdyMJMu4Ib6dH6VchOzUesF34T7pk1qx2btfbAkJuDc/XD+fiFz
 STCGjQRj5GstlVaXmrqpSJ/6jmSYlCS/AU2I3PIYcyjO+XYbFGID5EzgeddZK7gDqkV7v1eg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=925 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150153

On 5/15/25 10:15 AM, Dmitry Baryshkov wrote:
> On Thu, May 15, 2025 at 09:46:50AM +0530, Gokul Sriram P wrote:
>>
>> On 4/26/2025 1:53 AM, Konrad Dybcio wrote:
>>> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
>>>> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>>
>>>> Enable nodes required for q6 remoteproc bring up.
>>>>
>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>>>> ---
>>>> changes since v3:
>>>>         - added necessary padding for 8digt hex address in dts 
>>>>         - fixed firmware-name to use .mbn format
>>>>
>>>>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
>>>>  1 file changed, 63 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>>>> index 69dda757925d..fc120fd8b274 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>>>> @@ -2,7 +2,7 @@
>>>>  /*
>>>>   * IPQ5332 device tree source
>>>>   *
>>>> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>   */
>>>>  
>>>>  #include <dt-bindings/clock/qcom,apss-ipq.h>
>>>> @@ -146,6 +146,11 @@ smem@4a800000 {
>>>>  
>>>>  			hwlocks = <&tcsr_mutex 3>;
>>>>  		};
>>>> +
>>>> +		q6_region: wcss@4a900000 {
>>>> +			reg = <0x0 0x4a900000 0x0 0x2b00000>;
>>>> +			no-map;
>>>> +		};
>>>>  	};
>>>>  
>>>>  	soc@0 {
>>>> @@ -545,6 +550,39 @@ frame@b128000 {
>>>>  				status = "disabled";
>>>>  			};
>>>>  		};
>>>> +
>>>> +		q6v5_wcss: remoteproc@d100000 {
>>>> +			compatible = "qcom,ipq5332-wcss-sec-pil";
>>>> +			reg = <0x0d100000 0x4040>;
>>> This is 0x10_000-long
>>>
>>>> +			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
>>> Is the firmware OEM signed?
>>>
>> No. This isn't OEM signed. userPD firmwares will only be OEM signed.
> 
> Indeed, it contains only Qualcomm / QTI signature, OEM signature is not
> present.

Good, thanks for confirming

with the size changed

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

