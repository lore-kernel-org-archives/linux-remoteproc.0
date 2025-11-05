Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9783081B2
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Nov 2025 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762340561; cv=none; b=lgjjl3z39Et5nWCSQIv9NuFk0Q1smp/7CxPIpR8mP2xbKgA4QtL25TSlmv2L5qoIDAFkqgWnpJ7X0+WPQB7WkzpJzkAmLpRn3xa0UuydsXkYJSORjs8lsz2/SpHQwp92ijzEgUTvnuxYjNX2e2K7IkzHk0kpCktVCVTbM+rYNxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762340561; c=relaxed/simple;
	bh=JyPp9KCYnthpWeUJqK159HmdzMb7RVz9NZ0LYCLk9dA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DM2nYwyxHNK0MsXPqb3rSMxEgq6AFCWPz7xj497+UoOs7kwy8ZqtCy9R3XdWLj+m6QEHrv1PegD9H69aLqahK6CYj+aOLcAqCfNd9gb6ZeKPJnR9Ji+9ez0tsyun4kWYhfzr7SJCAEG/A5jorUtkLrU4WxP3J5HsL7Ui5sn6Yu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUk7ZYPx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DhrXVnYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUk7ZYPx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DhrXVnYK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A53s9Vr3913777
	for <linux-remoteproc@vger.kernel.org>; Wed, 5 Nov 2025 11:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMehhhiS9nybtpsp6nbbPZsPsdC76f71DKdx7y8PZ2I=; b=LUk7ZYPx+kmvcJb4
	wae2r2tTTME7y+86bKZASPhTOxe5mKsslxPQQniTjcE2YEMC9PlLzyVQGhMpb8YN
	+uEzLQ7b/5ArhbeQy1/2PD2YTiP69ceTmdIkSp8sz33ebCWmfDwvC0wnsl9oyhzg
	6JeVxwCoFLIxd8HAZDZzpuPx2bPdh8dxnsWxdmG9jZBOqgC/CBoEXfaTCRXKZjfb
	eul3FM3QId/o9qdwE2BKt7X36W0U5vNNpSgDIWyUNJvnxYRA2nd9VkRtMZo14eyw
	vsIVpvAc0iYr/BtlvZIexhgrZmc32j4vP9macHtxXcqv1bSDLeNOBIQbEu61RcUU
	a0tB8Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7y379296-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 05 Nov 2025 11:02:39 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93527b6b518so56346241.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Nov 2025 03:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762340558; x=1762945358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cMehhhiS9nybtpsp6nbbPZsPsdC76f71DKdx7y8PZ2I=;
        b=DhrXVnYKN6whB9xOy3DmTmnJAg3GSfz+qvMXrKOyJ+8ApZfzGqcxjjsfyHfw/y1MZe
         GMN5Eh41/GVQezFvv2rEOVNb/MwRTLRqX1g0hv3jpY4XSw5CgDZEuLZqw82nUFCfBnPh
         lYiqdlcxNYlNzivUOFUImAQJaPTYDPYf3tAmsHqwCnrO/DMYYg3lByx6nYv8qUSb87aj
         y0kVFlzVZ3DAOu8TG4T57BME/n9LdzFUkyFsthCZ/iNvqTNuVn+n8bmkvtHMqPQGLxqQ
         MCYYz1R0au5R+5NY37W2fHjCYVTLgBI2whb+VFlyJ5TSmHDH6OsOKyb1akDYQSa6WsUH
         2izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762340558; x=1762945358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cMehhhiS9nybtpsp6nbbPZsPsdC76f71DKdx7y8PZ2I=;
        b=exU1UCxB3xo/t6zHPigRzVGOlBkERnxTC2clCaLxL0y9/rz8Z3Nz1Y19hw7NXIy8J5
         Xl25d3WbzfPVTJT5294YsN0iDld223K+DdHQuKd/a+RANY6qbEDUgg3LkPoyuA6ONQvm
         4Y0cYRm7h4iyfTggfFp+Tf9BRNXdcpGH0lz+FBLnY1WerA99LlFKD9gEvcSXH1AIVdp8
         xOEafYoneM8m6myOPuk+O9VMrI5DRMSoqkizDdTF4/KfqWxr8/MgVJSctehVT+7uKq/8
         HeyEQkFOzdbkjncuaAh7b7dXeoOH5GFhnAX4xupwnqQ5M6PDDOhJSHI/02rLKQrZUoh9
         pU5A==
X-Forwarded-Encrypted: i=1; AJvYcCXkTe/aRDWp5pJOaWss5MWQUGtSnS9TXg9AxLQAmfbZs+TP2CF850dKL0G/aiAgQSw43khcmqjV/TcW4/W6U6qp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlkm3LrfZ/DHjX/u59calKI+G6tsnn1vVqOUx0LeLJQpzsFuZz
	Nm+A7G/LjVCX/5p/Ltj8u/XqS6iKI5YWzM1rKCCtJ35QmOG70HEpP6CRVExn/e0zCcIVF97t4JE
	eIgtH0vaQqT2XTkXlPKVcjIm92b70KMpOwGCWX7Q4pZ5tbtpD094HWBFNi9RNK1nb8e0eWAnw
X-Gm-Gg: ASbGncvGsyEA/kQmIWFy1mq3BBCqei0qHY2vFd5xKmYMe/90iBPwzLAYaSHtZAUZftF
	ZM3lXRHL/ppWBKXDEVzeLuinuuSKubzn8YZUBjkxewJUzNhMe8tVjTGAlJTuw/EwLas4GVXpvu2
	ovX1ViKX8m3fjCFnCwoYhO6TvWPousfThRKbUzDzk0ewlKEcYBLfHHqC6hb38xcxe2b4vt1ADjh
	jdjwGf1bwvM8Vnqgd1QCHGaCcE/4Z+2rV5CSg4/Qs2TGO0Xpw7nNm1TY9dDtV0ONZI+na2i7qmr
	IhMxWXmCDji1TSFMkWRq5ExEBLY/J3B5tUWjvz2Wy2NxfqDhP22yEOLDzM4a30Mf7lMEcMxfAP4
	5MausvH+4P/kyfy7IpS+uI3oUTERWqD2wF6c6C2j11DkI42qa+Yubo9Y+
X-Received: by 2002:a05:6122:e005:20b0:559:5ac3:4451 with SMTP id 71dfb90a1353d-55986364f8emr344833e0c.3.1762340558349;
        Wed, 05 Nov 2025 03:02:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESU12qH+Px3/WZaGSBLZjSXFZOo4eg2UqbetAoBXWf3Muv4D8gi1IQrPyHIRpaxiR3PVGOoQ==
X-Received: by 2002:a05:6122:e005:20b0:559:5ac3:4451 with SMTP id 71dfb90a1353d-55986364f8emr344818e0c.3.1762340557848;
        Wed, 05 Nov 2025 03:02:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b727ebaa351sm30419366b.55.2025.11.05.03.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 03:02:35 -0800 (PST)
Message-ID: <7f7179b7-73a0-40f3-b921-888b3e21537c@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 12:02:30 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sc8280xp: Add missing VDD_MXC links
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251104-topic-8280_mxc-v1-0-df545af0ef94@oss.qualcomm.com>
 <20251104-topic-8280_mxc-v1-5-df545af0ef94@oss.qualcomm.com>
 <1e464f5d-f4ed-4ee5-b966-fc7de586340a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1e464f5d-f4ed-4ee5-b966-fc7de586340a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: imO8yfWhMn1oM_5z8gnCF0iGZ56GM8Dz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA4MiBTYWx0ZWRfX0KPcKkK8JBMh
 Ln8lOdEzrjgv7Ygg2rLwjSmHLy52bTbZl1MSee5nK7LTjPKPavojkyhV8EPWEtHEfZ4TSHsh/84
 aslyxUWHMG4/hKGjLVA9ncZVNF/Ynna5jx5hWN1rnrRB2ICL6xRhk5lplrRxfTBrShXdXqcjvxQ
 Nn2xnUU85hfq4hklSHn6eX0q/jucqmVR+Pkvo1lyOcnrhHaOORWLTZ3m0U7ybKYOLsJUwfbAOJd
 Uz1+HNDKn8iMsupBSLV8EXCEb4J4glredmCQdVu7j7tI1u+woy2PoBhV7u2NosK+HZVyAp+gPMj
 p+23ewzLbsMW5RYdNdOu3Tn6uQt73XFmpEzubi1f2gL8ECM7KgYQyxoaERzWx+LMuA/gbd8a4nR
 EGLIBwc/TEQ++eUE60lFirYvKA+o+w==
X-Proofpoint-ORIG-GUID: imO8yfWhMn1oM_5z8gnCF0iGZ56GM8Dz
X-Authority-Analysis: v=2.4 cv=Ev3fbCcA c=1 sm=1 tr=0 ts=690b2ecf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aElX1GfIA-y7BHMLUgcA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050082

On 11/5/25 10:21 AM, Imran Shaik wrote:
> 
> 
> On 11/5/2025 1:01 AM, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> To make sure that power rail is voted for, wire it up to its consumers.
>>
>> Fixes: 9bd07f2c558f ("arm64: dts: qcom: sc8280xp: Add in CAMCC for sc8280xp")
>> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 22 ++++++++++++++++------
>>  1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> index 5334adebf278..643a61cc91b4 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> @@ -4586,8 +4586,10 @@ camcc: clock-controller@ad00000 {
>>  				 <&rpmhcc RPMH_CXO_CLK>,
>>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>>  				 <&sleep_clk>;
>> -			power-domains = <&rpmhpd SC8280XP_MMCX>;
>> -			required-opps = <&rpmhpd_opp_low_svs>;
>> +			power-domains = <&rpmhpd SC8280XP_MMCX>,
>> +					<&rpmhpd SC8280XP_MXC>;
> 
> I see that none of the CAMCC PLLs/clocks are on MXC rail on SC8280XP target.
> So, MXC support is not required for CAMCC.

Hm, to the extent that camss is supported upstream, I could indeed
boot without pd_ignore_unused and the camera actually kept working..

I see in docs that there are links between MXC and various IPs within
camera so I'm a little confused. Would you know more?


I wasn't able to test venus because it locks up either way..

Konrad
