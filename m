Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F892E736D
	for <linux-remoteproc@vger.kernel.org>; Sun,  9 Aug 2026 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278830; cv=none; b=jakMHAMlldaipCSCWD+wE6LuewqhXh2XwIaExRNhg2Mdvc5tEU5tZPZB+J+3Morx+dcJoYxSBrG0cA6jJKoLDKXT/wO4G+gGsSPsD/NABdc7nSC9bg+9a0ZEtvBYyBUSulShQHEomPeP1SAfuYT9HywtiiAFlVVqieDEckDrIBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278830; c=relaxed/simple;
	bh=510uDvyd32sgzhlGwCfHMT1JRWWiRprn1MywQxgm3J8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ijGS7Y5E1oTnaOZQ6mb4PNQ3W05F2U3nJ5fg38gxnvQVxrO4EAADTxpBlkrac0iFSKhaP5PsFXyno8ra27KfkJmZgMvtfrK4dYvx8ulblHzzq5CJ19VhcurcuGWU/vkJj4fc8rPTWsfFX1JD7Tdm1poOt15LDmOiIZEg3FkJcwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVQ8uHC3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NthjEQMD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVQ8uHC3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NthjEQMD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1PMJ3838562
	for <linux-remoteproc@vger.kernel.org>; Sun, 9 Aug 2026 12:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IrQTEGA1d6JWldRyNS6hURK+2Oil921Orn6sio9wxXY=; b=OVQ8uHC3XxA7Q8nv
	XVGk46q9ZuwlwnDZTmfQ/bk6+36LWyl2TFmbWnuqA11kgxHJKEs7HQKz6EK1e4e6
	Vcr6jLRu7sgzUCREkzclgY7Vkjgi4lFYMIFzO0vv9RnnsrKdXcrGbCKVpZr1SrPA
	yjvrY5+Z5banNVDsyFhd5HDqRYhuEmfa+D+0q1mcB6ToeRsKFp1zRLd8FZyP7JQL
	ha3qZnt+aKs/mOlJ1RW8OKoVIeNHI5m7C71C9ZJbGdTzYSdszyA+qAJkMh6SaAc8
	iHOjt5H0HBn3Ievggl5+cODUR56kKkMfT8QdZFQiyCs/OVuWmgUQgfAsX85Egr8W
	uFDbPw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwt5gk337-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 09 Aug 2026 12:33:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so1936354a12.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 09 Aug 2026 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278826; x=1786883626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrQTEGA1d6JWldRyNS6hURK+2Oil921Orn6sio9wxXY=;
        b=NthjEQMDOKPlMK9gv4ep8oAZ2y4ZUpBCVNWIPzYL8DFZF9JA+EYEP7VdsePsOCPTbg
         gdtCguCplDK3D5dGtdAeETPJAkk4UtqoCGMM0hPgykFggzWSiNa7wH30zpA4b7EA1OfV
         AD/oI89r33jHM3QaQCUaCR9Yzm6uzTRYSDybjyOr4keMlfPJ+CH/o5HsPIM2eZgTCZZg
         2a8sXM4c45jjDV0iRkICAN5bUTGgXr1Xqj8Ue7jzB7QNmLc9GBi/HqLfrS86BCi/9Z5V
         2Gt6gYuF45kFMKA4MhikEdKas5J6f9bZwOJnC/1ngvolhLVZL41sob7Y1USTeVG1lDox
         ETIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278826; x=1786883626;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrQTEGA1d6JWldRyNS6hURK+2Oil921Orn6sio9wxXY=;
        b=imCSL1Ls2uHBS0pk3IWUoU+K/h5qYO6Suq1eiihaOSQC4pCR0s4xEi0r1sLNQIBXQk
         H7Os2sGfu7H4Aj4APBodj8+DYPayxP0o1+qwdMf81hYDA+4pAZRk5K4Eftx0iNgxiS2v
         oSNvwH6xtEA9FxjXrCz5EdsbSS3Z7ZQzaPLXN9YFgpx/5xqxqiQO7TY/TaRkP9a8IXeM
         LhMlBJ3t3M0OqOYUjAWYGYNm6SlSybuEHhrXtj+kU3YHkUs08cBP1Q8CUT+hQHkqE1jT
         d6HSyynGj9ZdcuERfDZ4g3KjhLVXmbm0CkNeTXiz8woctg/VYLScjs7gunF5u/Bswip/
         Lgng==
X-Forwarded-Encrypted: i=1; AHgh+RpqBj57TSg4oLEdM92/csY0y20cOFpckYREDAQpeVfXT1JIoixenApW8IdJ8w9qn3C5suZiLgBl2NW5B4pFhPng@vger.kernel.org
X-Gm-Message-State: AOJu0YyVDATfiq8VLXjbJ85TJKAlxnMooN55lSwxG+643uMSPOYeAejU
	oJRsY3HUkJ7ESmxJv+2uKRkwptb4jOzyDjXT58n9F3N0Mri3aJoWZkru1a2pRI82S5ZH0FiQoKJ
	uGkf7RocrfRIU5KeKTyBFcIqdI2eEI6PBbvj0pN0y8BKiMbyHOcHlJzNgyY1xJoWXHO4qbCbv
X-Gm-Gg: AR+sD10rapNP62+7rUb7nE/cwEQy2Yx6hsrVOEyp10+LKE8k6r8KHStOdOtecUcR9+U
	TV90DpLqi3jhYhKdYDVtwLS1qDMDDKlkXVrNyTyjjRa4oFki/pcBaknNYVkbSMOwef3XHvkOI86
	L73VVLwZu9H/4fdFEUvQ6FKv1hbDZH5DBtuvYe5P6oRw26jZwcRTQ8KOcUvjhkYde00GVSeaudp
	EIFWC6uL1Yo6QCVfj7FSCCsPAmPoBNbYFP9MJYuAK8bcG2HXSd5Dd14fdnv/tMlPur22kckQcmZ
	Ty/gMyZ9PxYX8dqupHfrA3f9zfF8FmV4THHXxDna2h9EQIIsrXActYyhIH8o0quJkaxPJ+TmLV8
	NIRu9tJlMbgKx3bS26qQKwamf2YM/vlY=
X-Received: by 2002:a05:6a20:d38f:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3cbc03b5526mr19993959637.23.1786278825828;
        Sun, 09 Aug 2026 05:33:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:d38f:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3cbc03b5526mr19993897637.23.1786278825370;
        Sun, 09 Aug 2026 05:33:45 -0700 (PDT)
Received: from [192.168.1.16] ([106.222.229.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec128a0sm34798229eec.25.2026.08.09.05.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 05:33:44 -0700 (PDT)
Message-ID: <e8694124-ee41-4695-aa87-a4ff4ee602b5@oss.qualcomm.com>
Date: Sun, 9 Aug 2026 18:03:36 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
 <20260731-b4-qmi-tmd-v7-9-3befd44403d5@oss.qualcomm.com>
 <amyFARId5K-Izco1@linaro.org>
 <34998a81-864e-42fa-904f-2e5f3490fcf3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <34998a81-864e-42fa-904f-2e5f3490fcf3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6Cbhx9l c=1 sm=1 tr=0 ts=6a7873aa cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=x3UvaR+l8cLCJ1uKBUlNag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=y4XuuB6ikNK3uoXrSYsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDExMSBTYWx0ZWRfX1pJQLb5Y9HJS
 SkhcLwNgtojNtRFjO6qzYLwi6Lh0eo0+6Qf3xI79b5sfE0E231CJULAm2HsWmzO7e8QckCaKWjz
 IpWy+KtS7uKfss6OwJ+BGh8bXimmd2A=
X-Proofpoint-ORIG-GUID: AdHKUHo9WafUZCAbqJv4R0iAhikq3cbf
X-Proofpoint-GUID: AdHKUHo9WafUZCAbqJv4R0iAhikq3cbf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDExMSBTYWx0ZWRfX53JEvHNGpD+E
 98MwQw3b7ob7LCVdyRDlaZ5O30qd6tgY3YMtt0aG0v5cyGjhnUm0vbxiesB5OgE53uM1XFdaIzS
 YOCVqWiGmLXazS/kc4Do6HCPV0XJOeWCxAyMxh95n8SoTqoAA1a0xoQr2QjxGxeuy3s+X08oQZg
 uwpSn0k2XtXqYKI9OPNO7AcYsmgfMNEfnugFQanZwOWShMMdDzH4L96WZQvFkoiJ0p72MN6pFbS
 xNvSmFkhq2zaB/0kk8j8f8xEGAkbnb3j2mpk2532JoFXcTdtVF/18RQjCqK/BmmCEpiQQaxitP7
 ZsPTJ9X0hlufH1pKLfrkuDPBVU+DTUsLAm5wkfnr+4Ic3kxTGxzSdxkSLlpviVUCiogk+5b30R6
 GsAYaWjbKDLq/eFNdwlSMA+QzsLc9ca/cSZZi9s8vJtfOZq/B1AjNo0tGnILxQ67fnG3hmsWd6U
 oHq1sULMeU2mZ22JyuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090111



On 7/31/2026 6:52 PM, Gaurav Kohli wrote:
> 
> 
> On 7/31/2026 4:50 PM, Stephan Gerhold wrote:
>> On Fri, Jul 31, 2026 at 04:03:49PM +0530, Gaurav Kohli wrote:
>>> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>>>
>>> Unlike the CPU, the CDSP does not throttle its speed automatically
>>> when it reaches high temperatures in hamoa.
>>>
>>> Set up CDSP cooling by throttling the cdsp, when it reaches 95°C.
>>>
>>> Add polling-delay-passive so the governor periodically evaluates
>>> the zone during passive cooling and steps up cooling levels when
>>> temperature stabilizes below the next trip.
>>>
>>
>> Would be good to mention why you are treating hamoa-iot-evk differently.
> 
> thanks for review, will add the reasoning.
> 
>>
>>> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 +++++++++++++++
>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi        | 63 +++++++++++++++++++ 
>>> +++++++++++
>>>   2 files changed, 95 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/ 
>>> boot/dts/qcom/hamoa-iot-evk.dts
>>> index 9fa86bb6438e..a146be1cb5fb 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>> @@ -1684,4 +1684,36 @@ trip-point0 {
>>>               };
>>>           };
>>>       };
>>> +
>>> +    nsp0-thermal {
>>> +        trips {
>>> +            trip-point1 {
>>> +                temperature = <105000>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +    nsp1-thermal {
>>> +        trips {
>>> +            trip-point1 {
>>> +                temperature = <105000>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +    nsp2-thermal {
>>> +        trips {
>>> +            trip-point1 {
>>> +                temperature = <105000>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +    nsp3-thermal {
>>> +        trips {
>>> +            trip-point1 {
>>> +                temperature = <105000>;
>>> +            };
>>> +        };
>>> +    };
>>>   };
>>
>> Please avoid overriding node values like this... One quick rename of one
>> of the involved nodes and this will be silently broken without compile
>> error. Nowadays dtbs_check will *probably* catch these, but if you
>> override values using the label reference you would notice it
>> immediately when compiling.
>>
>> All those nodes already have a label you can use:
>>
>> &nsp0_alert0 {
>>     temperature = <105000>;
>> };
>>
>> &nsp1_alert0 {
>>     temperature = <105000>;
>> };
>>
>> If the same pattern is already used for other thermal overrides in

thanks for pointing other nodes also.
For gpu node, will send separate patch over current series.

>> hamoa-iot-evk.dts, it would be good to prepend a patch to fix those too.
> 
> thanks for review, will update this.
> 
>>
>> Thanks,
>> Stephan
> 

