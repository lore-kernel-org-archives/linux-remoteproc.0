Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18BD22A4FA
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 09:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747388712; cv=none; b=BIz7BdC3LbEMBA5O1K5Zyj+iR/JDQq1Q57c3MxKGl1qJIzqxlI9PqGg5oMkH0F2g9cPD1SpsHOo65Lrf4gr3OHlZZOpgApgdTYSxiOJJtJKTtto1oUukoQrIo+6hrn/0PwEGotoK0YjyYTdZcAp4+xZmVFTw32WXMykzOx+MHl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747388712; c=relaxed/simple;
	bh=HzsJEBiPWk6eDqzxwMfoGQye5xmzJYeJbdlBljOdl/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huqxUb6e8iTBX1LxIWiwCRqgym+0JZanRaHGHx3fqAhO06EjML/3KkV2mUKktuNX0yFxilCK/r3AzFVNjQ11WOXcxaOTqRUJ0mR0+31cpYX7DzrGMYR73Ml6XAxPMKMQiAENz4BYUT2pa9V1qseKiolGx7erudRV6ctcgyIkXfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lfJPf49d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lfJPf49d"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G37mC9001154
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 09:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDr4B1qSjg7htBqhVvqZsGzbBvRV/mFJiETbhY1xHpE=; b=lfJPf49d1DxmhEWS
	LZJ7IQPMhbQ16lyV+EJjNmmffXafF32XfqSTf5vvDnXjsnas/GCa3KRv5tFE3kKv
	TmpzvmSaDw9wyQ/VZ/It7wmk6Jup3WK0cE5wDPNmO/dUXsHAMHI6iMamb+1nWE60
	BCI5RyNrcwTsRbBhqSlPeJLvtSjMVKgfcCyJX66ZpUGd83AtIrRtwe/EckTS7ijm
	Hoqam4ndvtYS47qvK+Q4n14rZcrlB+mqUEFxBzHrtuu64veQAAta4u0HsHmEadnv
	0Ikm3/kgTI3AOJDWQ0XMGo/Uwqva3MBw3572du0aBHhGl1iLZLyD7v18R0TK46sx
	WPWQcw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp1eht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 09:45:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8b297c78aso1632566d6.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 May 2025 02:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747388707; x=1747993507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LDr4B1qSjg7htBqhVvqZsGzbBvRV/mFJiETbhY1xHpE=;
        b=l+8eHDX9XPbgldpjzJty1+qttfWi4z6MQqCHGV3cIOqKgzeY/KxSbFI4hf0nzXBQOT
         5h1YeWct53TvsVvJf2HAwFx07e6xk/0yZycvbolkKhv8pUIo8mGtCwG5NYxPcAEpSZZ4
         FBnCmqI8EXg8mloxfjG76i++OpOLe3x5nYqKFyKRMAvqS6zwwkzo+fTyNfj+796WwWAv
         1rOHqFGgRdYqfxlmF3TvJShzMexBWE8wdFo3B0i2XEjWafau95DcXNNut5edVUcG0XYD
         20wHITPyYlGn9g445eW2Tt2Nx7w4E2VULzhzrM/2KP7iOKnGcPk+mAOxpGusm6qM4GwU
         40ug==
X-Forwarded-Encrypted: i=1; AJvYcCUw5WMZdb6+v7XR25PLzYddwkt++RIo7cnHdXlwDxWTEGviQ3IPd2xIDxn6tVeGue5j1+tZR5+LquuMgc9xTxtx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu1YDkIS6A2cSE90aQGDhwVDBvp4wr1fqgWAKinrkh+h3wgsEc
	dKXjHWIv0MKdJJDtQBiItnQTrZlNfWEhHgub+3NyDGaZnHFS16pSxqXpLD0bzUeeR0n7PN3O7SI
	XpcTRdmqyLnBZTVm2vV8/Ks16hFsLHb5l3Uhh93N6LVhKcpCBmlpLsefdcM4jvmX/BL7fgsc5
X-Gm-Gg: ASbGncuz8X5xgRSKjJC49fiHw3Ekh76ud6ezHzHKXba/KLs+LxSqZErf1HGDZQtMn/Y
	w59xPGRZ9RBWTE4O+nJH2a+DQ3fqbEYwL6xkk1SAqCVL+3keNt4ltFF+iMgeTPLwR4HmegEk9qd
	gJ27BGxCAoZyC1GTEWxKTw8pav0GWwa2A4IJ9dx0JIyD3KpdRBU71gO/yCZ0PJU1NxSSVgsNrL5
	ywtFHtbFJ5o8nTBwd2F9zico8VS91dpWB5HpScja8gYWESzs+QY5ermGJEApHlpuLFD+y1Evj5W
	/NtkDSThq/WKu1UAlPKrCqopX7Ro5N04LfmzlGttODN/DwHqvy8Wrmt3bPuBvvtaSA==
X-Received: by 2002:a05:6214:1c09:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f8b0835130mr18906386d6.1.1747388707501;
        Fri, 16 May 2025 02:45:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGukMfVX+YRjpGaoj2TadFrM/2CD6zQuISXBA2V8u8zEJ5cpewzlRZSW1tBbMSTsJkqcx5YSA==
X-Received: by 2002:a05:6214:1c09:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f8b0835130mr18906246d6.1.1747388707101;
        Fri, 16 May 2025 02:45:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06eab7sm127556766b.58.2025.05.16.02.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:45:06 -0700 (PDT)
Message-ID: <0097b07c-3a58-4b28-abca-3e6de70ecf25@oss.qualcomm.com>
Date: Fri, 16 May 2025 11:45:03 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
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
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-4-ad12ceeafdd0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250516-add_qcs615_remoteproc_support-v3-4-ad12ceeafdd0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7jfK1HTr-TAHDUxmT9iCwA12IHNqUM4Y
X-Proofpoint-ORIG-GUID: 7jfK1HTr-TAHDUxmT9iCwA12IHNqUM4Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA5MSBTYWx0ZWRfX4KjJ62ZxiMtR
 KO9TITC2OvUkbZ9P/VDLBugDHznpcEpBYY/aHlIpMUIQ39isSS3+4MzJHtK7KKNxsZ9Gp33amuC
 r9NWgEqDhvtn3/UxXnJVt75SkOLqZKPM0XxTU9eKr9DJOVXrIoE1saOWSfU59bydZxnVVMzO4Y1
 s35i7uqddQod0BSYEnodBHSDgo1gwB7D+Emq89kR9IXFZ3YVfuYzAOjjC1x7AC0IwGWRj4OXl8U
 yrV+mtnY70m0L9H1F1mvL9l2aevORqxvRO00XaNZITCZ91S4rYLEHWiXSskUK9HSmtLGJfJcQSZ
 PZQTP8miI0Z1GMW/HlGSJzL0vGh/3yFIfBF337wkCSNo4+9XuLtzJwsOMvvOdC3sHrazaQ7F1Hi
 QE/8vQrVG51ywxXBpeviTu0x0ZbK+7h2KU1bWOD8ihOKrYtQQiOsCdfgBRq3j/dM0USZfCGA
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=68270924 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=O_pLmbuslcfqJQTE_gUA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=901 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160091

On 5/16/25 5:27 AM, Lijuan Gao wrote:
> Add a simple-mfd representing IMEM on QCS615 and define the PIL
> relocation info region as its child. The PIL region in IMEM is used to
> communicate load addresses of remoteproc to post mortem debug tools, so
> that these tools can collect ramdumps.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index f922349758d11ec7fda1c43736a4bf290916e67f..dd54cfe7b7a6f03c1aa658ce3014d50478df5931 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3290,6 +3290,20 @@ sram@c3f0000 {
>  			reg = <0x0 0x0c3f0000 0x0 0x400>;
>  		};
>  
> +		sram@146aa000 {

Please also update this unit address

with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> +			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
> +			reg = <0x0 0x14680000 0x0 0x2c000>;
> +			ranges = <0 0 0x14680000 0x2c000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			pil-reloc@2a94c {
> +				compatible = "qcom,pil-reloc-info";
> +				reg = <0x2a94c 0xc8>;
> +			};
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,qcs615-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0x0 0x15000000 0x0 0x80000>;
> 
