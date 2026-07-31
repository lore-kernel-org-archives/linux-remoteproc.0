Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D94361943
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 06:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785477694; cv=none; b=Fl3CVOmVyTe6zfkmw8jnorKDQUcE6Kb0m6n3CBTM0NVC24tuqy7YrTeYCKt0lZI1/Z6UO2oEl/NPrypiWG4UapuEJkUd/c82gjH85mZTbLmzQuuP7YtGHn8+VJED0Uo06MWb3J+IrGfF93PHprPTPyfbm5lKYiJ0YF6Ms7wBXZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785477694; c=relaxed/simple;
	bh=9IAiwHERiQkQn/Ry44QWMoA1P6ukK6hO/AKfFxIf0tU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XM9l9yCHctK7jGFxOrNqq0y1j4647a7w8QkbR3NmJ5QXWhhC3xZmB9/9BSF4p2aWesab/pxhLRikzlm9ztfHNGCZQwcFGe9m19pY26X5txTWxDn8xgOWbbwNIQS+CPKROw9F7T8n3I/+eyfBgDF8RHQpI9dwfJ6rdjZByfAIhW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/poziHw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8VJ27he; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/poziHw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8VJ27he"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4uvtP3277998
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 06:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5yp8Mavcx6CQHzFiv541AKdT+PiGfdYKPQ+fSQX8jsE=; b=Q/poziHwoBoxGXeZ
	Ww+9uNCbsx/K5rn/sz/ShHj3cgIJ7SiLBM/INrNavhUajMIRCr7GY4zcmSqTsfbg
	mOuoRD4IvirrP/KqYVJWbshAWQbI9ctWToTqn1da2OYx2QwEbaYwAQoVLvIdoSv7
	gKs4WZxdhYVIxCAWvBZXKXoDwXAa8IrW4C37/yU1LfcIxiC2s7KUmDCydRE+5ftt
	ycUrhVDcb7nVPOreLbyJG9TIIl+XqRt2EeYnwmf4cnnY4f72wzS8es17ctt+PetD
	mq705IlDY8udmWrbBUUecs/pqVOfajOLbx9uYEHW7QZRXg9KvIcVXCXnoEpWZZU3
	aEoYVA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn0f87cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 06:01:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e4ef9a74aso1436429b3a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 23:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785477690; x=1786082490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yp8Mavcx6CQHzFiv541AKdT+PiGfdYKPQ+fSQX8jsE=;
        b=a8VJ27he9HdaSYUWYBCMgr/AH2wJA7O8Qz2KNRalFMzbSUj0d9LCPiVTkqQfuuykCN
         bwAODY605ofc3HV4b6cjNBpqK6rM7SgKaIAb7u+4mMXIt1vRdb+9tOoa0KQcUogYED2K
         tZGOlDEC+2UfxLv5y/WMrndZsViM5H2gsh1/KBJ5SOY/JiAUAmCxdRTqCo9AJAy7dORC
         1WfmdPcd5bM0lWEbwIlrM114S40UwD9T272YPddkjbxHT+n0md9mcmiHz/AGUIA1kTln
         3vA6aWqPiuROmLbbR8eC6TA750b4L3+mq1UEyrF3pXv4ifyXy2CdI3YpyvzjX4oSs1mT
         GGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477690; x=1786082490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yp8Mavcx6CQHzFiv541AKdT+PiGfdYKPQ+fSQX8jsE=;
        b=lhX890RoXEze8gbE2hs7o1A25eZ7sBru97qERn1GAxGsurJgYDMfnyNywTGcN/PIjn
         5S5c7tmoCBXsOmCz9KoA/dQ/Xvq9vWON6FHsAIwXXpRotIHuFNv3/xxSpeVwgqFmZbJU
         ucJX0JAVrg4wvcrkcEa0X2Qp/tkChDxPKOOqnE5IYiV7D0aN4vs0I9v7uaWWV+qTdPc3
         LDm5KIgtBM9qsRlj9YepELV7ndHGOn/HiWPptkBR9pb5smyFklrrgh9/s/rpDXnO+JrJ
         ttz+VOkuGt91ApBNcvUDfT2I2xl73yeifOXuSDTK9hsGJ9dOKm2cksbdcrZE+1nZvJk8
         CJQw==
X-Forwarded-Encrypted: i=1; AHgh+RqUCYwI1sJT0JbNqg98bgRO2lK6c4wdAsZiUagKCsx5h0pZKKfKSIRGzDdqZs0jWYvt9/HOhKoMAELkk46txUc5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6VZFCBW91qFKnHjRRjJeMPJKNrHtPDf7CExf2D/i1ZxKtyyU5
	7mJb6cM7HXmmxjKMC9zkU9Yhp9e6QLZZItSYSK4EI9ByT4rGXtE9U21CyVx0ODeQwKuofDUYHAw
	Qup5Y13PnErWni6lpkcmXkrs2EJIhdrkZ8WPASEl+1kevYNrCIQJQabpsqwlzQJ0YlzHxD5TA
X-Gm-Gg: AR+sD10awyFxyq2eK80VoaJHLPpH0E21LRg4anUx6xpSu4uvtj8/TgE7aPCI60PieYx
	wIGpa6/rmUkfBk9B6CPjLQlYdFZeFw0lL/Sfdh/Z4lxnhhX0T0/FEM+zjC/6dUJFmyKVUqATxUf
	3Z1047O9ejHngPM5/u3HI3x0CCGWA8F++6yReJFuiyXAfho/YreJ/Isy1ZKIbWwdFTk79DN+CIb
	P+MK/D73di/nEb9AHfTv8QO5sqtJY5dBQ1gx5QrP7vfmN2clxicSjhSbPobCuRCkNfXhLMTcZ5e
	XJTRI9C6UwjSOFabFa5ThnnNRMZFyIRu9YTwB4LND81gkB3g2K0YU3StkliVAG7p48YtmdxPmLu
	a3lAhxQvwBVbfLLZfxpiE4J8Qw4vWZwk=
X-Received: by 2002:a05:6a00:12cb:b0:848:80ec:5d2 with SMTP id d2e1a72fcca58-84ed6f02d49mr605922b3a.51.1785477690447;
        Thu, 30 Jul 2026 23:01:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:12cb:b0:848:80ec:5d2 with SMTP id d2e1a72fcca58-84ed6f02d49mr605895b3a.51.1785477689968;
        Thu, 30 Jul 2026 23:01:29 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed5deb8ebsm311596b3a.40.2026.07.30.23.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:01:29 -0700 (PDT)
Message-ID: <548b30dd-915f-42ae-896d-3ab8c955b0f2@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:31:21 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-9-973cd3a226af@oss.qualcomm.com>
 <0f56d22d-437d-409a-852f-9fbf4e303284@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <0f56d22d-437d-409a-852f-9fbf4e303284@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzOSBTYWx0ZWRfX6kgLw+QtKyyz
 a3meEKJYknhGroiaXr5wi8eciLolxoBXfEAE7tNpGDGEPFqeN8aB/Mxh3VkfRwz2luIHHi/WPVe
 /OhDKUGyaKbZuAmEq2foyP6S7XEJtGY=
X-Authority-Analysis: v=2.4 cv=HJTz0Itv c=1 sm=1 tr=0 ts=6a6c3a3b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=couP0MF0vw6ipDBTzhAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 7xFSmQohLwocmPC-Hl_4_kJoaGN1yHg_
X-Proofpoint-GUID: 7xFSmQohLwocmPC-Hl_4_kJoaGN1yHg_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzOSBTYWx0ZWRfXz5Wi+J6T496u
 lhKYRzXwJ2tjZQ2k3364/ygBQXJYc18cc55cKXZhYzT3v3Z8JNdBOafsbrWpzcByQT7nnW+P9vE
 VQ9nNeSHuY6+i+0jnCoSKE+a+3b6k90c5njX54N2+GV4tmSdeWQKgum/x2L2KnmLfDSy6cXoX1Q
 YtWl90yEK4RxpTN6McgShUB5XpR+MKHWfyIHxvnnGQVWodYGUfANMggrw04grdj1GTmzpFzA1Yh
 fEc+Agd1fn8NPybk5wmLtTOs2nTsNg8jGzGPqQdA6nrF82RWULnFNt+3xbGI7hwajAvE36TbDIC
 C6j8U2OcmAeayOIGDsOkZC6xshupC0ynesr+bqDY4cpPXLf3XSG6x10XPilCNv1P9ilm2P0X3OB
 wgGhjA2cA9YLfJz4phiDCmYVCR9RiO3/UlWgquyf3JcjEAUlr5V2vJg02KbDgM/GKaKAf0eapbD
 pKTl+odVoD4773ovVhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310039



On 7/30/2026 10:40 PM, Daniel Lezcano wrote:
> On 7/27/26 16:22, Gaurav Kohli wrote:
>> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>>
>> Unlike the CPU, the CDSP does not throttle its speed automatically
>> when it reaches high temperatures in hamoa.
>>
>> Set up CDSP cooling for both instances by throttling the cdsp, when
>> it reaches 95°C.
>>
>> Add polling-delay-passive so the governor periodically evaluates
>> the zone during passive cooling and steps up cooling levels when
>> temperature stabilizes below the next trip.
>>
>> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 +++++++++++++++
>>   arch/arm64/boot/dts/qcom/hamoa.dtsi        | 63 ++++++++++++++++++++ 
>> ++++++++++
>>   2 files changed, 95 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/ 
>> boot/dts/qcom/hamoa-iot-evk.dts
>> index 9fa86bb6438e..a146be1cb5fb 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -1684,4 +1684,36 @@ trip-point0 {
>>               };
>>           };
>>       };
>> +
>> +    nsp0-thermal {
>> +        trips {
>> +            trip-point1 {
>> +                temperature = <105000>;
>> +            };
>> +        };
>> +    };
>> +
>> +    nsp1-thermal {
>> +        trips {
>> +            trip-point1 {
>> +                temperature = <105000>;
>> +            };
>> +        };
>> +    };
>> +
>> +    nsp2-thermal {
>> +        trips {
>> +            trip-point1 {
>> +                temperature = <105000>;
>> +            };
>> +        };
>> +    };
>> +
>> +    nsp3-thermal {
>> +        trips {
>> +            trip-point1 {
>> +                temperature = <105000>;
>> +            };
>> +        };
>> +    };
> 
>  From thermal-zones.yaml:

thanks for review, actually this is overwriting temperature with 105, so 
other properties are coming from hamoa.dtsi.

> 
>      ...
> 
>      required:
>        - temperature
>        - hysteresis
>        - type
> 
>      ...
> 
> 
> 

