Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D81448CF6
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146077; cv=none; b=oZtKqCd0gxCcsG+uktoi/Wq1Qta+Y85VVTdECTWfvUhJrvUnr0nuPQFdMfMjJ/tFxWjHJe13uqTr406gAr1FI2VCfvfC1sObHsKm6x1n0/Fo5ZJeoxoqLcZs5FA7t9bKyMHoN93FYxur9KQwzeIKuWYjUbn5AD0oz48wnZLN5pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146077; c=relaxed/simple;
	bh=/yOLqhnrBxL+q2VE978a9XQLFBicrFACElLsHEaWrwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qOPHLaMXquReAjSsCfv+WV5Nrxx4Qbdly/LlxLiJuIpw3aEBUrRC4AVPYHYGGmeY/PxC/jevp6GCPnE6uW9ovoG/wN66JOyoEZLBEFhAQlUYsyLT0DtzYfZejHzRYyY5LXY0sw/CK2mV/gW5jZnfZ+2lFk2bIHlcHkpxxgCGDmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUopq4+R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NE/JxNK+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUopq4+R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NE/JxNK+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAADjN1104712
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 10:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ljqOM735N0dyPHkuB1lU0B1VjJbx3yNT1Oftgxme1c=; b=bUopq4+RC8X6BfF9
	x8rfMyP/OOlUubaRa5EPc9niCSuT082/INTj8TW2+sjt4wBzj8l5vC0X4tom5EVC
	33Hmv1hMZ0rWctcqzoMddcCtSRctRmT8cvpM887rNserT3WS3yvhXO0p2ZmCTwvA
	GcAg72PhWOGDobUVdNMKvq4aS0xYzL1XRTwlM79MyIDPYvj/qp6adsSPKG8mobMZ
	CUr9B9kqk/BXxyXqHihFjDzU7ZmAfnL8DkSDvBW/7uUZml5PS8s57rvKc+Z8kt9c
	+eLIj0rGC9MggCaKCHd/aUlZvLHT5Nz4WgDqvy1Bow4ZxJEPjWClqODy6sRTo6/3
	b7g/8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r3bayc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 10:21:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso17508821cf.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146075; x=1792750875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ljqOM735N0dyPHkuB1lU0B1VjJbx3yNT1Oftgxme1c=;
        b=NE/JxNK+Zav5ddFgi80l/I0oAQSy0kOmCV6oY6QdHYTPEP4L2JY/+NJ1q8cpFIDM6h
         WKL6dANtn7BFNpeMR/PKhCdjVtSAz2Rdj2YN25RMWZtCAjx865SIWGyEaRx8c/9imCBS
         3s/5Nyc+zkx/ycvlPZ3YRZD7yJk45Zmr1Lt4CFyaIOfSAFVmwKt6ekCzvplXiBvVqiaC
         Zt/pnjy0/rnnIOQuq2Zl58IXVZtitJvcLNx86td9M+Nt1VtYM28s/lNcUWSLe3ZFny40
         vq4eM0XJJ7GH1RsbgVsm7Ru4VAQ1xoCDSk/5T1SOvkHJLTW3P4NoQf+HxTINOU6JjinQ
         sRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146075; x=1792750875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ljqOM735N0dyPHkuB1lU0B1VjJbx3yNT1Oftgxme1c=;
        b=N3vq68rL3Q8SpCtEZt737Pd8HTzis2nJh2WUl51haC+vXQryX6It8a8YnLUfXWOzri
         Y93/fba6QTJRe8GduA6Abh49MPKObIzsn61yQjExKnpGUeraGPAOsT6rC19tO8IBwwp7
         +4FyWU1sseCiAXrheJKRw7QQjtZhsdiXTD0nkAZIkE6qHnHy6SuSrzvl2GaAEirHxvKE
         uqKG74txDcTdaGaUPsJ4SCJ+Ypda4QosuFlC/JeTkMOIViCts2xOTLkmC78rwXUo4dm1
         pUhSz6JeTHOvpde6N+g/Lr9GT5WUSghxaqLsOOVkACbXXIqbU10QTfeJTiwLAUpL6aGj
         GkGw==
X-Forwarded-Encrypted: i=1; AKwUvBxv7G6RnV77GpMh4WOPb6RBDecq9wGGEgwBQrsx883zeVDYMf4u7D/JX3M6kPiteG9BcCv7G+wThq04dCanGMwX@vger.kernel.org
X-Gm-Message-State: AFq9FYKnuTXGhgWvPQxzCSRvS7cYWHlPaJo6FvjiRf3Q5nS2bHRGdt33
	Vq9RJC8NCnLayupVxAaIxngUt9MTGGnhTNmcMN6qebpHZtNXsxuU764E8Ruemg6UsRXKtEzjU1P
	ODhr15IAhAyPhDfKFTDwt2m2fLoZvdm/04Z6dm/2Za2Uvi2IOAyoca61OC4C2UjQMmzQdioSF
X-Gm-Gg: AYBFou3xe/QDPTOMBMT06XguMppiI6HgzQFSEGaGWJjhos2w2In3TlKcqih+VRn+W46
	7jAIi3AzQ/e0pgNoODCQWq/J2QgCFJHKPrXkCMHo8QGuRyA/LZbaY1wL0NqNJBM5mWYrOHnFxXk
	kHbEoo3aqf6JASphv6sBlLYr9JgzscxXV8wqOJ5AC9te8CjUODjbbIpHjfqGs+QYN4jwdPsSnMt
	jI8RBvCoSbhg87ZPbno2ZUENGk/qLhZugjeNjljFFx8HpuupvGfYs0TA4qYWpvdKbTe7grJ42uZ
	ohWGgzwp9TJAiuozCuite58A9uNAAjIwUn3cDeeqauuVGxNSjBmA6SddXTwARWBx1Qrdm7pMDVP
	c4GxTyhD8wGavZTTsk59XiQ==
X-Received: by 2002:ac8:5745:0:b0:535:496:56ab with SMTP id d75a77b69052e-5359f06c305mr397433841cf.0.1792146074616;
        Fri, 16 Oct 2026 03:21:14 -0700 (PDT)
X-Received: by 2002:ac8:5745:0:b0:535:496:56ab with SMTP id d75a77b69052e-5359f06c305mr397433381cf.0.1792146074105;
        Fri, 16 Oct 2026 03:21:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc742sm57787066b.54.2026.10.16.03.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:21:13 -0700 (PDT)
Message-ID: <87839ad6-c489-40b3-bfcc-60c436cd1a6f@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:21:10 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sdm670: add digital audio
 codec
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-11-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX4uV+FJFM3ws4
 iwtNCCe84dBdV+p+5iYRnz8+R73rB8Nmr902slVJHghw04FC0dpCOC5C2i0UiuvmRAFcgtttHV1
 /lPE2ZrtqYGcxcD6FSZF9tyxL2UAePKpdh1B9TguHDzxM7Gu8AfkW0s+61wyfhzXraMfESYcfYT
 XoqPaMFQ9tH8AAQCAbdv/729wFUfcVIBAIXzAoNRVP9xV4XakJLP1wtNBRJnJ4AevK2qWyyNQPh
 pPf618LX5slg6wCAqkGKpFYy6jCn1j8WqvfEO06cuvzGkbKShW3+nExlH/Gg+9pBeBU49NDy3Wr
 KuJkgSRFy8DL0UJ6bPYnH0c2rnYPOKhrMDbrEs7ICzf2HeEoxUIatbd7iSx2AXtXMx6DlSsOo9M
 oAQ5hyc3YhvRdXaKVELOO8sCRfl/NbRjttAAnX1Bem7trscu4Av3IO/M7yhDVhe9UbxqEjoxmLz
 ojPt3D1lDq853F8sihw==
X-Proofpoint-GUID: 9MwMxoEcukHdhomBeUDNF1da85HF-Lf-
X-Proofpoint-ORIG-GUID: 9MwMxoEcukHdhomBeUDNF1da85HF-Lf-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX/4T4xEuwtbiV
 k8RopAZh0gF86dmNNM5jzRpJtP/Bfm410SC2NOf9sxIuWhrQXsJIfvHpa0NIfCxytCPd1tgjnbc
 2v/knBzp3eI8ellNb3XJQA3lydfVLVc=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1fa9b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=kdm4YS7hd6rvY0lC6QsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160041

On 10/3/26 7:56 PM, Richard Acayan wrote:
> Add the digital WCD audio codec to the SDM670 device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index 038ef0f73ea9..91188acd16b1 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -21,6 +21,7 @@
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,apr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -2541,5 +2542,19 @@ data2-pins {
>  				};
>  			};
>  		};
> +
> +		lpass_codec: audio-codec@62ec0000 {
> +			compatible = "qcom,sdm670-wcd-digital-codec",
> +				     "qcom,msm8916-wcd-digital-codec";
> +			reg = <0 0x62ec0000 0 0x400>;
> +
> +			clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			clock-names = "mclk";

This clock configuration is forbidden according to bindings

I'm not expert in audio, but an LLM points me towards
LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE

Konrad
