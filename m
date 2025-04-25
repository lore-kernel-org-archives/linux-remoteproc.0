Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D9C221DB7
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 20:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745612642; cv=none; b=NEzy+kWSS6QUDqX05BMmcDWxWF25yxiYjdDNFfAF/beHrRjU1oPauD0ezgU2WNKqf0XYPN+gQfFGQCHc1WDI222FKHQCpYBKWsdHh6etdZDl1TULsWzBs7gU5tZtFK1k+FYH59oujeNmWWyXIV5+nBOYpDnDwjqQaPLFMHympsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745612642; c=relaxed/simple;
	bh=6jcOXtZ8yw/PG2mZRLKYqvuu9+gIse7sKPo4JRdFcpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFz28srcV4bwy2b5LhCUSGHuhGPoZY6x7R35bCfJGORnT4NprkcxrPNOPwr++5qiOi7UcRu6YJK4/B6z6poFkb3zKzwjLdbJdEeDdVpcwom4kh7ZJYu+dKtdM9YvGzRqIRIQrz8BYnpXQxQTHNI6FANqTJglwOu4qa91RnRF9Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYv9FjDj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYv9FjDj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK2Vc021918
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 20:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZU3IwA+bgrpaQ2TBAaKogUm3yKHUkoHUnNFfaSufJk=; b=QYv9FjDj8TwUwwY9
	1iz9od9cq1sS0Wjjd7QdWJ+WxcaR01vkUfE4LBYlnDkT3dYzB/VKKZnwMSlIwckn
	SIW5ABcO1x5GfSaoIOkWCUmhudtAT+fOGW9EDPj9BgkcvDfYgRv35n/42BSkqymO
	OqgV6UiexjZoTjWWU60Vow0z9JAVeJrbkMvcxBWjwKNu05s/Bqe+5BzN6YXGIaEo
	KePUClJ3HX0TTPEO6MF/Qvm4GVbfX7WFlg0pLD+LI42ylFia9qGYA82pnSwUKbZx
	AvhTB2nqb/oNJQGSUXrDOSCNJo+cWcDTENdjP49jDWpraFBGodvsAQ+xWoB8efZS
	kMz0FQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5j8sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 20:23:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4775bdbcdc3so6417821cf.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Apr 2025 13:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745612638; x=1746217438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZU3IwA+bgrpaQ2TBAaKogUm3yKHUkoHUnNFfaSufJk=;
        b=GwfhJnqcwp5S3eJaRjSrHxXwHmQj6bjVm9MxVpclBH3lPDo0xxNeKrrvKVdoEcHm5O
         h/HrMOBBOOxpj5Z/XnjeP3kwAuMpvn3KY07/YU5no/QzlUUEsclMfrV+YfG388dtSnfS
         MjEr1W4yo8KyLXhoR5ZAvW8WQZIyLGWkyrC5mY4NLNv7D7AvTO68K0+3tmcDd+4Yr7Ny
         LgIsVba/bGSMOnqS9zzFv+QKrt0r6RalSbEnebZjVjk+GGgl+3vC3cE4GdrxV+7+boKs
         d15fdbVHNhvl0cg7xwYDFlLwLxNJWl7qYt0f8efQq5XzKFPJJbnydyeYv03YQfxTVolc
         krnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgPbXndn7qFTfInEDTlOw4g4AEQUP8tqDFxAbEJ5/MwFinoEmp0PES0swfnyxiJWAiKYPNWTXXUbSya4gvTBAf@vger.kernel.org
X-Gm-Message-State: AOJu0YzdOF+ugJxpIFUe0gatHZnXj2FGmjX37V4sQWIX39qP1PNCbNPC
	w5dB5+ZLUB8tK1AOJ/vgIM4X7T+gdKQ0tRh1tOvr+gLel+O7/arCp29Y2Rd3rrOIcAi+8HnFbtb
	pnIvVuMRcqo1S/244Y1Yau3JUhNrjmVTr9YQmS5YuzGJTCul2YnbnYbk4DT298pViigz5
X-Gm-Gg: ASbGnct9+8VgAq9NRWkRoHWdpSvVzY+6OcdpzBjqZcl5xysFiUksH/A9nPge/S4t7He
	4k3Lx/3s7hQnYaeDVp8NvTPk5zJ0Fompy+VNxjIfYArfRz9zUuo9XINHTBU7zyy+L4i1OqtTDKY
	yNxqdfxWHDgdzN5YObl2a4gpIY4SZH7n03AyxaHoHclx3A9B9kixkVfXAPCnRxMF/fgBBK1mN/R
	zaVEpMEQ2j50IAvlL3jEPTQVsNYqlgKN3ROHj1zgN+MOg0aQrkcGoKXYdxw5HgPMg6/p721qdcs
	5FLjdUnbj/et1ln7NyD2D5w/XHq/VmQS7fPNDhcqGoLjb6XoPt6QTWir9+T5tNph07A=
X-Received: by 2002:ac8:5d4c:0:b0:477:686:b40b with SMTP id d75a77b69052e-4801e10d41cmr18419991cf.12.1745612638003;
        Fri, 25 Apr 2025 13:23:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdHoZR5pCK2t6lb87QvYnJjLEk1VyW1AcMpSBdCT2VlKLRjguijyNKwCmllzoOHpr6Y73rfg==
X-Received: by 2002:ac8:5d4c:0:b0:477:686:b40b with SMTP id d75a77b69052e-4801e10d41cmr18419781cf.12.1745612637564;
        Fri, 25 Apr 2025 13:23:57 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed70b1fsm183172066b.157.2025.04.25.13.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:23:57 -0700 (PDT)
Message-ID: <242f6059-a32f-4ee2-a794-8a29b6449e96@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:23:54 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/6] arm64: dts: qcom: ipq5332: add nodes to bringup q6
To: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-5-gokul.sriram.p@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417061245.497803-5-gokul.sriram.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0NSBTYWx0ZWRfX/7/5M6f5E+1b 954XqPjUcb4Z4ds+mvKBFb1gJ/0crCgSBUR/p6m+fFiArkRcRKuhjtlLYVO1jWcyjPnQdihLAV6 0O1rpCvVEh4ogCwdEOneoj6Hw8Nf7qC2WHx7ry/jJ8RIYYnWAh0owrWCXt+8jgEIOAV5/Ztoh9O
 JtIZt42+en9qH90sDjBN0Y1xEj2X0mZp+guJNc0d+aD4SbaXQzTwMaqYC6L8KR6RY0+NDtioj2Q ON53r8sdLd3tzj8AJ2BWpdKCo4Dp23NEByqVWeWzktAOAr74895pWLuGFnEHWTjYBeGk9seA94c QoBp9GU1jCzpIqfQn6ULO1A3ox421pwbK18wFArlAfnJ8Zz6243Dh0sVtI7wX8w53L15SoZy0S6
 UjyKwxrQ7IlJ2fGSmns+kZ0de7B/sb8ouwvg3fuPu7zhfjNpc9WgDOS01a1nflcqRst5Sfye
X-Proofpoint-GUID: Zf0r_u7yKcpaHF43mKzFp5vnehCUmk93
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680bef5e cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=g0nLbwh1i6OCtKyAYTkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Zf0r_u7yKcpaHF43mKzFp5vnehCUmk93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=910
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250145

On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> ---
> changes since v3:
>         - added necessary padding for 8digt hex address in dts 
>         - fixed firmware-name to use .mbn format
> 
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index 69dda757925d..fc120fd8b274 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * IPQ5332 device tree source
>   *
> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <dt-bindings/clock/qcom,apss-ipq.h>
> @@ -146,6 +146,11 @@ smem@4a800000 {
>  
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
> +
> +		q6_region: wcss@4a900000 {
> +			reg = <0x0 0x4a900000 0x0 0x2b00000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc@0 {
> @@ -545,6 +550,39 @@ frame@b128000 {
>  				status = "disabled";
>  			};
>  		};
> +
> +		q6v5_wcss: remoteproc@d100000 {
> +			compatible = "qcom,ipq5332-wcss-sec-pil";
> +			reg = <0x0d100000 0x4040>;

This is 0x10_000-long

> +			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";

Is the firmware OEM signed?

Konrad
