Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8D325C818
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 09:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400584; cv=none; b=eIjre5W25Lm/Lph8pDQnkCV5xfMD7u9RJr19LQk6ZiRb8t6tYCOhbmBDpeOVVU0sAqdP+/flDu2zpeU13m6QnfEpWuHO4q0/IAyZNp5FbBtnxhtT5hyc7DT/3Bc3mImbV6WK9iB2K2PA15fFicf8GzDsFQOwS2VHAOEhQn6OCLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400584; c=relaxed/simple;
	bh=HfajR4jkoRL29+tIXfodAl7lyAx8wExv/1di+VXnfEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUbfJQsWoJYaMUo6b/q8UEE5wfcoSMFFQLUgD2wNmDQnIOJnXR/sF/9EzuhSO8eAjZuw0guOmHswG5JLq8Fvvj/iw0gkuFmOV43g/vWuES2SxrlSRBVvVh3gEKfqMcVrYTcb9/sDABTLd71i5R8kjnS+wb7ValJsuXM1TpwcoQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5ImFb+i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5ImFb+i"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0imZE023624
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 09:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3IJOhUo/VX2ZSjPsc4BMKNKU4usWbdjsJil7nFv3fuY=; b=P5ImFb+ijMrucFZ7
	ss1wDWWID4k5kR0pY70Sbi8UGl5gbfuHzxXi/melTqMfG3BhAVQv2ZsJkBIV5abU
	G/ASu+u48zFOw9FepRVrgnqavImvzwdhJgm4Tt9K620kLn1/vJdDKbzRd1IAl0f2
	MQZyGd1ifaCBMr60CdTgLkPbNcRMLkmdRRiOZ2UShQWX7PBrcVbRW91X6CXlsCe7
	RB9lImilI5LUwiFnioomyb+MKadqhur2sZ2nHnmHPjFm653CGrf0/D/M//mv5ZQs
	Z1lNxnZdznp11k5f1KWODFAGbCve/G4mi2f7rEKS3FZOQt9PddQRfDvCVparG868
	NicZ/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh29m3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 09:29:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766654b0c3so11938131cf.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 02:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745400580; x=1746005380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3IJOhUo/VX2ZSjPsc4BMKNKU4usWbdjsJil7nFv3fuY=;
        b=C3RvfukBgDPKlxMxozjlN/XhromNdzWODeJx6QAX0tIWd9Eo2vutAQck2hdMWXNArH
         d5n9LC6EnSxlqtkxkzWWOyq78oYpzLW2qsjZ9tG0D+r3mxB1sdR5hYHSOHYKUCsN+Kgh
         li8Xm0dsXFarjaGy7yiVgDbz78aeIXKtAVy2btP3/2yqm/WSlAhcNKzEYIg3RNEJe3P+
         MfWVponZzSBM4KrFjszjptzDJ0EwzMzWzrQ2wP6McURtEqfr4sihfkiG6UMCF6MWtG62
         7w3suYobbhr2SNlB18q45KBzqmy7f8F0dbre7Z/Uiq6dsrMpig6WnRkaKw3mKeQfvT5j
         xhBw==
X-Forwarded-Encrypted: i=1; AJvYcCUf+KrKsr+UeUaC8pZo9dGnoBFme/dauPUELkVZwhsfNJ+SPxs0we2S8bws243JHTWON7a9qt73RDpeZYrGXzAU@vger.kernel.org
X-Gm-Message-State: AOJu0YxAjLrNTvNZQzuFS6yqDUGQvdDqPgzWWc5Lo3TeQ1Zw35UDAihq
	OI1PEsW5gn4iyHC9SxVKrpNY0SX6blBp1KgH76TtYCCl/2qBSKkFjIgl2fopJVi2alIXK8+fW2x
	PErf1fiPPXzI92kTSHSl1R5xso60nP6zRhHAjtwIZo+fdEZuqZrRc4NByaI+LC+I+CpaE
X-Gm-Gg: ASbGncvnabmCCohOISJKBYwTA9CGWNBmze4Pxq++jPB3HlFDA/jF4uFycMFW1hRtrDF
	rh6C0yjLcztBSNB3GY/PrdGVyekC8EvdsYl9T5E5Z6fYpyLfEYcXKnx2Anz/9cO6z8y/D2CPdPp
	aibfroEvXV1z1pEQzcGJk0xXYeBCigO8QeAx9xUBp3IcUdLbO86w6ILkqZQ0ptjiLYX1+d7WINF
	liQ81XEDAup5mlKvmi7/i3NvIjy4CcY34h8xBuF+MaTsjUvhm1csQ9CuwvB2z5UoFPMCKtQ4ydH
	deAtWKqpa+ynsrzFk8kMebh9cRdIzdwrmV6zXvKiGPqDqWF+Iosd81wZc1vYobh6nO4=
X-Received: by 2002:a05:622a:251:b0:47b:3a2:1fc6 with SMTP id d75a77b69052e-47d1b89d080mr14403051cf.3.1745400580374;
        Wed, 23 Apr 2025 02:29:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdny5fOZQ/qOaIGMfGM2UJEzXsu/AVomAsa8SRTqZeN1JSrDmSVwu15sKN8rjBrgJBsxL5+g==
X-Received: by 2002:a05:622a:251:b0:47b:3a2:1fc6 with SMTP id d75a77b69052e-47d1b89d080mr14402971cf.3.1745400579936;
        Wed, 23 Apr 2025 02:29:39 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0b30dsm789693766b.18.2025.04.23.02.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:29:39 -0700 (PDT)
Message-ID: <c8e36d23-3325-4ad8-91da-94f9f31c3c15@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 11:29:37 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: qcs615: Add mproc node for SEMP2P
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Deng <quic_chunkaid@quicinc.com>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-3-a94fe8799f14@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-3-a94fe8799f14@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HdOoA2FSiuSpNrdhXRKFofbWT2bRchv8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2NCBTYWx0ZWRfXzkXNBodCmbn9 tLI0WgE4FxDhsh13AmIv2Or5e+63TmFHEKX/g8nVuz8oZPc4Ck/yTjklIqTRJAYLppDSZTxi6mb egQCA0cT61F4JVSB6+Pn95AnqXH8oizIiDgulrvOp8dvxvGRb6RFALHyvPKzad0Dx68oy4fdGfH
 57CggOg82osYMo/SziSyp6wN1LV/J4GAJQGqOlFcAeV2Z1PykOrGjq+z+DmZTZLfNz79pcu2Go7 +dA6SMfyaiYbKjqPwoQBVlxw/DNO5fTciAPmeUqTLwOsONjVenkeJzgykpJ8c392/NerCCw6klj pZqZiKVJmMH/WE2tmo0bzEvGgy467OQ29PeusOEiAwRzltXZYkVQZQnIbt2S8QAoOAZIhsDE4JO
 UMy9FRT3ZsqpfqUVsPJr+JTzy9rPv0fD+7YGEjSMEbsxb4+euO9+VPNeBJYgsRPug+ei4Q1i
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6808b305 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=IXTFuLhWsd_PX2s7ergA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HdOoA2FSiuSpNrdhXRKFofbWT2bRchv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=930 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230064

On 4/23/25 11:17 AM, Lijuan Gao wrote:
> From: Kyle Deng <quic_chunkaid@quicinc.com>
> 
> The Shared Memory Point to Point (SMP2P) protocol facilitates
> communication of a single 32-bit value between two processors.
> Add these two nodes for remoteproc enablement on QCS615 SoC.
> 
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 79 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index edfb796d8dd3..ab3c6ba5842b 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -332,6 +332,80 @@ mc_virt: interconnect-2 {
>  		qcom,bcm-voters = <&apps_bcm_voter>;
>  	};
>  
> +	qcom,smp2p-adsp {

Remove the qcom prefix

> +		compatible = "qcom,smp2p";
> +		qcom,smem = <443>, <429>;
> +		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&apss_shared 26>;
> +		qcom,ipc = <&apcs 0 26>;
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <2>;
> +
> +		adsp_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		adsp_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		sleepstate_smp2p_out: sleepstate-out {
> +			qcom,entry-name = "sleepstate";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		sleepstate_smp2p_in: qcom,sleepstate-in {
> +			qcom,entry-name = "sleepstate_see";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		smp2p_rdbg2_out: qcom,smp2p-rdbg2-out {
> +			qcom,entry-name = "rdbg";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_rdbg2_in: qcom,smp2p-rdbg2-in {
> +			qcom,entry-name = "rdbg";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	qcom,smp2p-cdsp {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <94>, <432>;
> +		interrupts = <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&apss_shared 6>;
> +		qcom,ipc = <&apcs 0 6>;
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <5>;
> +
> +		cdsp_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		cdsp_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		smp2p_rdbg5_out: qcom,smp2p-rdbg5-out {
> +			qcom,entry-name = "rdbg";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		smp2p_rdbg5_in: qcom,smp2p-rdbg5-in {
> +			qcom,entry-name = "rdbg";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	qup_opp_table: opp-table-qup {
>  		compatible = "operating-points-v2";
>  		opp-shared;
> @@ -3337,6 +3411,11 @@ apss_shared: mailbox@17c00000 {
>  			#mbox-cells = <1>;
>  		};
>  
> +		apcs: syscon@17c0000c {
> +			compatible = "syscon";

There is already a description for this block above what you added

qcom,ipc under smp2p is mutually exclusive with `mboxes`, so adding
the above isn't necessary at all

Konrad
