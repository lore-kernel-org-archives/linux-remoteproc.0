Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4798E27511E
	for <linux-remoteproc@vger.kernel.org>; Thu,  8 May 2025 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715230; cv=none; b=P7q9yShcFV1pucJD8+UvRPr7mB0IvUOpjZ2lmTPdUMnhZvv9M8CIR2kWLZ8cT4l0X7oc5ycotYp7EFLmyqgRUSJEq0DDaYLh6Pja7ZDoI1r5Z4wD2oOVEHkcJK9O6OV5/jVmSX9XtpPm4+dR9p+++Y7X1Mx/GYGokIELv9VZgec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715230; c=relaxed/simple;
	bh=w/IRPkoqI29om20GziWR6uLh/++CAuBf10WI0YmJ+ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7JG8rszNBFhvCuYz2vzm5dwHW731j6VcWRsVN28LZY/YKmFiPyoOk6bN7pleF9xJnYotRCmX9cW1Nq1bX9doRQMGSxq1FaFJWhz3S1R09zQeKBKU9n7D1fl7z/mIewyUhd48hkBmP1e2QboFcnkhRLPXXRyzLFVnO+SxrJ0bHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZTj44Lv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZTj44Lv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DjIBX016353
	for <linux-remoteproc@vger.kernel.org>; Thu, 8 May 2025 14:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XILZM7Gn5eaJwNn51SrBifians0biwpZ5P5rKKRfJL0=; b=BZTj44LvDUht/smb
	ldixBceDdCVkQWBtkAn0daOovnKWgqpvtfhJbe64PuLA6fJKhXR1vf/NjFZzsdtE
	/bPK3osOJj36Xa8GTQXrh0y98wYi25tP/7YolhJIStoXrjGV7bVIMeFBQloADyow
	m1Zzckm98huWiLU/Vq+UdJyssaXzh6ojOnShTAk88e0vcO4ww/+KY1v9rMz5I7+A
	7IfNtMzCwebiZrVzRylx2Fhae7ibCps9OgvswfiMrRpGRiIauPESIR5Tt4b91eW+
	oeem+sZ0X6eO5KRg6b+DGSX8HpvsRmmltlmKSQIEMnThifHCyeKlmOjQDF9O0su7
	yKMjNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8smqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 08 May 2025 14:40:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5560e0893so16573385a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 May 2025 07:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715227; x=1747320027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XILZM7Gn5eaJwNn51SrBifians0biwpZ5P5rKKRfJL0=;
        b=knplugaNO6m3JAL3ZBdZHYktOwvFYakQrRF4ksG5JKgJVDD2OnnxQYuzwTqWXeHsji
         A+6OIiL22XXTXOtfaQdehnEi5+cnoAuC+05EEm6D2+bKgakshd3hwuQ91LdMOLQsBNu0
         jau0+8TsYn2d6JoUMPykjOzocHU8KN1HCctbZGwETiQN6ZPOGEozhJocNssPmA0RJNVo
         kDXKuDUvSehfLi2daDTmK9qVz53CHLlxr8ul93wMepN2INqXASDx+ZLcB/7OhNDajQWB
         EhdwCiK71riqKAqeV5O3/EdUWt/cokWfKcWwch+ow/L3NfqkOKbCr9mbVlZaD1lcS4WN
         V37w==
X-Forwarded-Encrypted: i=1; AJvYcCVHtxfdlqFu7YfCBH2F7dpg8b3TMRprATnK5x0ZfT5797m9UsVtLq6+J0YSHdSb1bopeHWljVDPpZ/DsLtTUE/A@vger.kernel.org
X-Gm-Message-State: AOJu0YzwZIlNHuT+d81BihDnY2QUnGoAG3p0OuTx7/8VclkzMbKyJL/a
	o2p7OD4r71IikMrxNkWUidQ8J0BhGZ3oQ8N4oyAr5hpz1dH5YcumIOoaj77UOUKXJCAAb919/sB
	6VUjEJb7K2P3OmPdBNH76Lo25Pft3NfpY23OBEDJf+XUM6apf5qrdIan24Jo+HMrtuNj5
X-Gm-Gg: ASbGncvvMD3sjEdm+kDljECMHhipn9tGNrXZApb5P437FjdlCTcFZ/IfikSVh6QayOH
	LIHT9oa2D+p4RiCrS4NHUiOFqhdkLB4FVX7PtBBmtdIRX2jQdhKayFnkrdiObz1ec6vRrmLT5t+
	dki5evPPQwGWspszx/vBmoCkKTUUh11YP83DrvCIz3bE/6Ge3577uDyMoH3JzPa0dIxw5xZAcv/
	L5J6VtcYP3NvJtTnJRCqmjRF2ZbqG9wBJUnfoWpiFOoBMyc5hJG+QPu/kkFRUgm/pWs1g7BH7zf
	R68qeLV7IFAksDbWXpSrWeapreTyFm2/Kv2Oe87dGJps+r+d/TKRDWJeHKKl1N/GXjE=
X-Received: by 2002:a05:620a:414d:b0:7ca:d38c:5d8b with SMTP id af79cd13be357-7caf7267bf5mr402758385a.0.1746715227020;
        Thu, 08 May 2025 07:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT72bwxRsnCw6X+H7BXkoHxOCMnrHK7Khu5jQoHo0XXuFugh3AhL43OS8kDS21FFjGTDgXLA==
X-Received: by 2002:a05:620a:414d:b0:7ca:d38c:5d8b with SMTP id af79cd13be357-7caf7267bf5mr402756585a.0.1746715226531;
        Thu, 08 May 2025 07:40:26 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914740esm1092006566b.31.2025.05.08.07.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:40:26 -0700 (PDT)
Message-ID: <a8a1aa0e-f53d-4a77-9199-958878563b9f@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:40:23 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: qcs615: Add mproc node for
 SEMP2P
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
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-3-52ac6cb43a39@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-3-52ac6cb43a39@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YlkemmlCs-iUWmzmm9dlob2y9-LfKex2
X-Proofpoint-ORIG-GUID: YlkemmlCs-iUWmzmm9dlob2y9-LfKex2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNSBTYWx0ZWRfXypcIyHyUOIzR
 sMObkFIeKekuinlWg877wnl0NgORWHb40FLX1U6nbx2ufswltdxy/sbJjFfJMfdJkBY6cnnYWmC
 EnOjsIgzSZe+umbmF1o622n92X+JmrGWzMbao9+thGPGrfa84P5y1sCZvHyA0M4e9ex4aQg8a9C
 MIOtmER1/EfamVjLw2NPfKutTTWfBBRn+FpI70FUrt57l3Am6Mn7p+Bs6mSIywlx2pfOx6uHUU1
 Yz2SsqkdJisGBPcw7cmpN5y51a8tEkyi0++NNV0IMdxlxDMsgK0qHErC7M8yfvuyPK/WwZ7JAxm
 ghtcaHFYSyvKT81Pfoo1cTB8VxGWvOnXgVt3R2HBmWqhJlCTw6rMe8J0j9n4BZCtyVYVaHd5HM/
 56BJ9aYLQfVtlDZL11dEQDurcW3Orr6saSp4nbFZgpcJIXRx0PE355Fx0pWkHtSHNsL/C9DC
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681cc25b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=NOOO9hkfg8HFgf3i-E8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080125

On 5/7/25 12:26 PM, Lijuan Gao wrote:
> From: Kyle Deng <quic_chunkaid@quicinc.com>
> 
> The Shared Memory Point to Point (SMP2P) protocol facilitates
> communication of a single 32-bit value between two processors.
> Add these two nodes for remoteproc enablement on QCS615 SoC.
> 
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 43 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 7c377f3402c1..53661e3a852e 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -332,6 +332,49 @@ mc_virt: interconnect-2 {
>  		qcom,bcm-voters = <&apps_bcm_voter>;
>  	};
>  
> +	smp2p-adsp {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <443>, <429>;
> +		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&apss_shared 26>;

26 will poke at the SLPI instead

Konrad
