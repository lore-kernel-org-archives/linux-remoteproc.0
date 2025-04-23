Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7174A3E
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400853; cv=none; b=HXP6VRxW28DwnZVMkmnhsNQeCUMYCmjIdd3QsftcEflSwkt4PrU2tKnRjc/Ae+eFUt5LWg7s4nn0oNgzQUmVqCTMY6U+1PQ2q5F4sfmmQce9Eeb6yGdVXBrcqnzSoCGK/AshuthR+EivVO1d/1RJZuzgVSoxThEqPY7avUlAGRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400853; c=relaxed/simple;
	bh=uSE8OjcgrUbmkCp6jk1pPtxB/R+pN88XPnq8rYd1RvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0oj/50kdS+OohGRYU4y9N/EU+/8jTXu81UDR2aPMn0cip3OW3RXlZnhDBw5nCSlZhtkfQvCIWYAXtJ1B1c+wvyiY0lZauaiRAGAqzRB6QPLa70/21cvjWR0AGGnbll0qafADCVECHNvR8XfSXyG+YSWHtd8DEtwwBt3tCg6Xzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFg5t/47; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFg5t/47"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i7wV003025
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 09:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BNT20WPVvgFQc97GVJErvJnQMOitqkwB+xfhFmU4Op8=; b=OFg5t/470DQTBio3
	YGTRahQhhmjletMwuHVh7WSTVah5WBufy/hKlCp51C3U2sVns6rMYrMTxLIcjgU0
	obexMUoUZQjbFI8TlzdJcDwgq2uWRPKApRwwV/Q54ru4aM7FUzughwi1i6QAOdYX
	IJYLu5j1QTKbBqHS3/uqCGQOsBao/ScF32/OLwyOlzOb0tMo2Nn2lionaiDAtcqe
	NX5RbkjZ2ooRmlMS/v5FuLFIOVZspW+J/JILB0FLrQc6bOXiy3dhQfql+TdYjpkK
	XfqkR3KaxqgKrifkPOlo2wZW/xrYws9w9bULbmFDHGSPZnR52/+L69fEQGbInlsA
	JnRQYQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy1mf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 09:34:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f3766737so18201246d6.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 02:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745400850; x=1746005650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNT20WPVvgFQc97GVJErvJnQMOitqkwB+xfhFmU4Op8=;
        b=OnN352mXDepiTVekk9keMPB6h/8mMSVeXrs7IDXGGon12C1xNBlNAqziLPRxkAT9On
         o0W8ZXAnNGnTfSQUSAxnaS+EGFn+tDpF963gJbxDmpmuFm1KYBs920A9hnL9+lu2OJF0
         iqye95jtmyg0n2piQ8mfmB6NUnA4dHRazUKQpTr58LcgvVovUgHRrhfVopav41pvvNr7
         tVYYi4Jkb2VX3i5lKFV4Z2TvYu98875gXEwr+TFzx2Yqvt8tCceevfcTCg1ak2ZyJ5OK
         +jqbBVpZftfDtYizBlIihZExppqGsZEI97ZpKJhUFSIKv93zUDZycqtmvV/srUwH18GK
         9hHg==
X-Forwarded-Encrypted: i=1; AJvYcCVw7rlcfaVeEIC33gmPCZWuDApp8uwXwCf+Ttemz5/QC05z4THGZ9SRNiIwC7/t47myxk4ELJmp/qNB/6pUIQtJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnx0qdlhVDyGHLiNCSnqc6Bx+eKPIMXQrOqcgH/jJ6yrxAZ7Au
	prb1hueG7n963+Z1HZFg/XmO96rHgRglD7Mi0bWxoylLf7neGPSs0Dunw8VarHpfIKB1KfmvVcO
	QbHXVuXMtp369KT5IhTXnmu57nwEHPhCyyqGqh7LiIT62PAny8lVqzL/aAX2f4pAmUcEH
X-Gm-Gg: ASbGncuqyIy+D1Sh4iEsWe60HUhHa+qtCQsuG1Y3ShIWjcNS/fALZf+ei3r69e9N8ik
	lOF/Gk1+YR7awOWH/KSvRqA1JhTtL6XJVm+kGQGBfUhsd8H2syJvbrbkcLJu3+ktveFbd/xAI22
	187L3SMtPATnh7EzKcD3dLPeqJpCoYtvS0Cb8o6I8IPgXH+dxOyKgm61lYHyOOKqlfa0JarmUD3
	joAjDKrqgwNVPBbytxda7siUzhGJHhLLBhqG4KGj++xmy6badd0YjEoKpwNWC3/JihVUeQ6Lq5F
	BoTa/n4UTcKogUbivDsq/14xri7cLHE6hn9oibLr7wl79B3YACYG0SY9e6RAujrj2gs=
X-Received: by 2002:a05:620a:430b:b0:7c5:6fee:246f with SMTP id af79cd13be357-7c94d231186mr153898385a.1.1745400850184;
        Wed, 23 Apr 2025 02:34:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLnxCv9VXYwZKLmPcXEO0/NEnT5DrG/YWmnJcvkBu85Ijyalv+exK+5Oq+0VSxEPPYLQtjQQ==
X-Received: by 2002:a05:620a:430b:b0:7c5:6fee:246f with SMTP id af79cd13be357-7c94d231186mr153896885a.1.1745400849852;
        Wed, 23 Apr 2025 02:34:09 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefcf4fsm785708366b.109.2025.04.23.02.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:34:09 -0700 (PDT)
Message-ID: <654e4b69-dac2-4e05-bbe7-61a3396da52d@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 11:34:07 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
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
        linux-kernel@vger.kernel.org
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-5-a94fe8799f14@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-5-a94fe8799f14@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2NCBTYWx0ZWRfX2FaLaq7m7iQt 8JIJAdDiYA4GebEPplYxHzpU86H3YVrBRNPGwZ/Nx3+ZT+5LDPtyQTbskh1ppVOCMlDmUxCwkiT eu91folL5Q+TM2GJMswQ5XvBqLzZ0Pdp3aC9zAm4QMFy2coQI5RfTTlnLL2unyueq7vjpMZDXCq
 bCmMAjnJ4phvXIHD/C7XMP8UpK+PdBRwAE39qgQdkLsktt35mmIkvdxls8X1S8mAe3BdDm2jnQu l5b16dP+9ZJvVv13oNOiLzeMGdXEQiUC6EUYhNHaxb2JPc8HWHxTpEMERQR+wFrI8CF6Qxinszi WXyRPa737xMqjbpriM23Qoz0qmz/KSo2+DAyKDYMgGelhZL9m4rSeYp1xb6YNj6ouYkX0HR9J4U
 VWfY9jQol+ueTfqH4K1F/28nghIDWEbK/NkV6vGwDf5hl2vW7ffA5rRIcq6bjytz3MtJTCTN
X-Proofpoint-GUID: MuDnGRDS4NUcEUBcZGc_oEC29Zk0BIlT
X-Proofpoint-ORIG-GUID: MuDnGRDS4NUcEUBcZGc_oEC29Zk0BIlT
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6808b413 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=j59CM_6C_jZRu4RL990A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=891 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230064

On 4/23/25 11:17 AM, Lijuan Gao wrote:
> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
> remoteproc functionality.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index fe9fda6b71c4..c0e2d8699d05 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -503,6 +503,16 @@ smem_region: smem@86000000 {
>  			no-map;
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
> +
> +		rproc_cdsp_mem: rproc-cdsp@93b00000 {
> +			reg = <0x0 0x93b00000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		rproc_adsp_mem: rproc-adsp@95900000 {
> +			reg = <0x0 0x95900000 0x0 0x1e00000>;
> +			no-map;
> +		};

Please double check these addresses, I'm not saying they're necessarily
wrong, but I can't find a confirmation for them either


>  	};
>  
>  	soc: soc@0 {
> @@ -3124,6 +3134,44 @@ cti@7900000 {
>  			clock-names = "apb_pclk";
>  		};
>  
> +		remoteproc_cdsp: remoteproc-cdsp@8300000 {

remoteproc@

[...]

> +		remoteproc_adsp: remoteproc-adsp@62400000 {
> +			compatible = "qcom,qcs615-adsp-pas", "qcom,sm8150-adsp-pas";
> +			reg = <0x0 0x62400000 0x0 0x100>;

The size is 0x100000 (1 MiB)

Konrad
