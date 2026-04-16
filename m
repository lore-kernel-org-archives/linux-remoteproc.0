Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4343CA4A1
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 13:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346481; cv=none; b=gr0+hJtU0K4ZuUVyzcB3sjMu1ZdGGpyzUxDE6wQLDgwFHpmhruPf2AStPPP2HYrvSZPAPRqsMYv1/VB7a5VM4v/Q+nsR8N9U+P2fc59lNGXPFeWVWf6medOk+YfJP9b2CZw7q1sz1lVoCF8D6tZBg+fza5/19NFnvTMwxzj3L3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346481; c=relaxed/simple;
	bh=0JE/aX79bsd/ZzLDRMFo/ItbT3LO+4StCT/90CBIeAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=No2PzLJHBuyi5EaZ/8CL/QPEgWKcyjOCpizAbF29qpIe6aPMTr55kdXfF3/km+OzIBz37F78+MF8XytQMI5DVu3u5HyTRVe4x7Q0Px93N8PrMHxjxH8IrHB9bGukvi2twLojEk1WcMvaMYlLiMwp9xGkydOhFLcG2nHr/Lt9PVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmaMs8oU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f68Qn+mH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmaMs8oU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f68Qn+mH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G90XkZ2979245
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 13:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCrqC415T8c8q59xLap8KU/BogOcT4Z9lLC8RL07uzA=; b=kmaMs8oUDEkVtrfI
	lt6E8z6MQCoN7R6adin1rfVwnLVVeNZXhC+GgXrkLdzyN6xjulJ/HLlluQIBEKQX
	iW7KyJdDq/xEZwWmrdM2TKJmfTG+aWTE7I4q1PnykeGbSl+k/Nhpm0lTtXHREMhz
	1mfH1cq5qcJjRHY94VUhi+g2iYRgBPSrCBFO6dSpwr1mZG0iESPCBVC+QKPHvBXZ
	uHasj6TZNrnqvjJ5T2s7cc/eVFH8X4i/5567p9+MG1+yRnXUiqtfIo6zsOg2fFP9
	oZR8f+QiM/IwkkbrkculD1fGViFne09SEanCc4LO/i/Xn1txlGSYKiUCjJcoRxOU
	uMXBVQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvru8w7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 13:34:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-611bf61a809so283276137.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 06:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776346479; x=1776951279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KCrqC415T8c8q59xLap8KU/BogOcT4Z9lLC8RL07uzA=;
        b=f68Qn+mHj+NTL+5APgKcNfsZO+J7JCmHvtXwSeOMjBGEt1lxGAGk3bPuaM89IZvSG+
         /ScyfiFZet/Gg2helpFqV2jHRWFKCx7U6T/syLpCUGjmMYV5WSYvi9TMTh8hj7vRhoTM
         hkkWrKPO9e1CfaS9pVHr7S/Js+HtKVB+3yEeFkMKZdvbuqu42iyvE2WLfG7G5PKgCS23
         9fuiGRO4n4hK5m+Z3g0R44QtkKSB33I3NII2p44bNpX3SvN5bWGBXOt9s8jTK6Znw5ul
         DCdRrVAgKouDLkL+svi6hsGyCvJZ/phiDkaExNsCYCRrwArR3+hI1tBUC7ziSlKI1M7c
         WKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346479; x=1776951279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCrqC415T8c8q59xLap8KU/BogOcT4Z9lLC8RL07uzA=;
        b=hxRgjh1iYp65HxW0rE+NWJyGOY790WJn7oWtg7jmEHTiNpkKWkRWeP+7wD65kp5nE/
         vz/gLeD6broSL5LCG8ET4p4JYqsKaBZQW1deOs8XIek682VioHIemJDLBZUefLmz3/NX
         O36t1ZVMRIcPR24hDm+silMgJ5Z5AiqZp3jDPyG6Gf/sxX42pO9NUdVfakD3FF5TWxiF
         rv0BsVem1LLLhXPFJdFclt9Xf3uq6rOZ2pklv3CTI6HWDorOOEsg/U7+RHuFCk0bMjHl
         S/VUd0Va+4SCPA/Dw8wgANUhDeHth0hB19M7oaoZVoRMg3J3MU1D/4EbtzpN2pTga8tz
         ds4g==
X-Forwarded-Encrypted: i=1; AFNElJ9gwNuOP/E1G2IyzwkHUR6ayUvSWd81ShmjAKoA0kkfa9YW/l7lEsdgJwEjPaUN6yxYYS75lcBT2+3Jr6DcV+Vq@vger.kernel.org
X-Gm-Message-State: AOJu0YwOAEkI28z/XgmiaHSBtbIzpZCTrW1Ic0nbO4oY0MoYtz439wre
	nw45i2dOXgIu57fmu08JSLOeIpHu60uA+EVqr/MkU+u3YmpSMZu3NvF6B+ns3eDBmHOquUZio2z
	tGSfwrVeVKET6bNsKS3H5a0xR0szfFzMSKqGBUZzTjywoW/z+AEBcIZjnNeWB18urpVkgMnVk
X-Gm-Gg: AeBDievbtkf3QZgTwkZ3ChwP1xZ7CD7txbNeGmX8WDV+th1jHGFLEUtHhPBippwLwgX
	GOs7wzdSMt3LpXz7oD9LqiWT4lNYYotmNez0ayC2bfmVPiYGD/SEMDA2jv2e03OF5OROIRF+3oE
	xPf1UP51YcoeSpZdxWin/8H7qLKCuNTI3CAt45Sb/phcACyT+X4G9JSxYkpvlzH0YE586U4IQba
	0qo+vMCc9OloJ0wyMBsG9zdmmBbPfL+eXOXKRjkP0jjG0dhRZ5UlTWA3ujMqsLKfmzTJXliaUht
	Vv7r2w8KlxSpO4KtnPQsff/Gi4Qw+7zMINXVHmZiZ5XUO1wzlvr/fiYa0putkD6wWCQkyTaxWgF
	zEOktUkpk5YMH3Vof4xwlC8YHY9x2Zrr/djtIrLJ8Yj350cZg93ea+lqokXvaAZpdfElw+OgVe7
	nhAjY1WUii7TWJ6w==
X-Received: by 2002:a05:6102:374d:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-612b753d417mr1597236137.3.1776346478907;
        Thu, 16 Apr 2026 06:34:38 -0700 (PDT)
X-Received: by 2002:a05:6102:374d:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-612b753d417mr1597187137.3.1776346478446;
        Thu, 16 Apr 2026 06:34:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c3826sm167011966b.33.2026.04.16.06.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:34:37 -0700 (PDT)
Message-ID: <ba6b62ee-3e75-4437-95d0-3604583f2cbf@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:34:34 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sdm632: Correct power domains
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-7-6098dc997d66@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-sdm632-rpmpd-v1-7-6098dc997d66@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyOSBTYWx0ZWRfX93vrRn+18LTE
 rLKbTVIRVnixFytZZe0y3wAiVzmh60/rlaypZGXp5FXR83TA39NGlOyLmJeLDoJnTb7fKAkmxSJ
 x24rJWO2qK8TZh+NNvmsoKj9KM1eEZVm9f/9Kg5qqp0J3rGlfjX9GQkwL6J2lzKruAnc22WzLOR
 sW67TnfwV3s469Phfx43swLWL0VF+75p2aOapVtnTvCSAe/A7GEqECJ0+HB7QflxDCPnZLUOeYm
 4c7p/H8jWOX2SYuZNOoMDL2Zpjckt3fSe+KgwSUS9fS149+Y6Z12wWVZ5sCo4VfSj3aW5w/CkCg
 d9Ukm8/pWtcZm691U/KxqB5bfTSoNtomSLq367QB0Ry1gnZJnwe/lCd2zinsegpVLD11+eW0B9m
 Q7yiYpqXmsF2c/g2RLGy3fNnupkyE22qCtxhLwajtUz9XEKCpMAxooxvnkuypNt27lx0lXv33RR
 QZLzNbdv+spJl340XGA==
X-Proofpoint-GUID: xfZ2QXKKCkKiXUSW_ou6Ez-1aSpSMcnN
X-Proofpoint-ORIG-GUID: xfZ2QXKKCkKiXUSW_ou6Ez-1aSpSMcnN
X-Authority-Analysis: v=2.4 cv=GcInWwXL c=1 sm=1 tr=0 ts=69e0e570 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=h7EPssPr47kph8xlZiMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160129

On 3/27/26 9:11 PM, Barnabás Czémán wrote:
> SDM632 is using different pm domains from MSM8953 override them
> where it is needed.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm632.dtsi | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm632.dtsi b/arch/arm64/boot/dts/qcom/sdm632.dtsi
> index 40d86d91b67f..b1dbcffd51b6 100644
> --- a/arch/arm64/boot/dts/qcom/sdm632.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm632.dtsi
> @@ -87,3 +87,34 @@ opp-725000000 {
>  		required-opps = <&rpmpd_opp_turbo>;
>  	};
>  };
> +
> +&lpass {
> +	power-domains = <&rpmpd SDM632_VDDCX>;
> +	power-domain-names = "cx";
> +};
> +
> +&mpss {
> +	compatible = "qcom,sdm632-mss-pil";
> +	power-domains = <&rpmpd SDM632_VDDCX>,
> +			<&rpmpd SDM632_VDDMX>,
> +			<&rpmpd SDM632_VDDMD>;
> +	power-domain-names = "cx", "mx", "mss";

nit: one a line would be perfect

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
