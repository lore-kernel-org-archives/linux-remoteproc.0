Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAABE32E733
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769766880; cv=none; b=YIGP8+360/ZHbgF1WQ76Eh3dkpGaieZW2HecYvAgSSctECuIgWpfBm85qTDffqBYYo3We2bgxMCdhvqQueVuHlwlX8iGZ/fsx9yKe/NjcfygMzZhhHapTs7eaJx8xgN8N2mCsHRnf/Eq9Y+C67XPFBYJTU4cMwEbIBAj3tpeIYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769766880; c=relaxed/simple;
	bh=ZJA9kN03DvD07TYAjfnZgouJ+W+OT0ZEDNFcgiOBCLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3JjbHm/KhRFuRt83+EemlOMZ+fj1tGJy6h+TqFWVBDOkc3MBOcKcbkQ0ZTRR8Y2yL92RGAd2IIYmeNnbh8XwvPauuzfWV8o4O6HZV77D+KP5+prG2/A3pxCXw23RepGalJ0Yp1SGf6yRt1xtB2HgEAthayXFgXmOnqPTGhb9KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLZ51zPu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xdhy3R17; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLZ51zPu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xdhy3R17"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3VURu485945
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 09:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9+DAV+c/CZgBH4DD2jfZcDSjLwf6jHYApWbhBRrbJ0=; b=FLZ51zPuR2jby4lo
	tSc/czS0eCZMucXmZkjXl5qnsv6WmbE16cUZ52mpGa/Sxugkrc5PaaX/2RXQrHuw
	u8Tc6iX13mX8/HzCRPT04lmZmIcZLU/Pz/buKEQ2ob/CDqO2fHsNZ3rxdtS2nxSG
	9+VGQwtAEljGwZoJB0furVt/tZvLzrb6n9cmUHdS5v8FonBYU/m/tQDCUQCBQJ/N
	9CP7wgwSu3VYumGEkIw73KXSFn5ymPLypP9fire8+a/inRKIeziUf0ZOxi55g8iC
	6b8cIcTijbYjrw1x8NTlh5s8Cp9vVYad71hF5yrLfzUrn9pKtd/i+pOVJogW3z70
	KM+ZzA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gtnhnpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 09:54:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8946586903dso1576526d6.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 01:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769766877; x=1770371677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H9+DAV+c/CZgBH4DD2jfZcDSjLwf6jHYApWbhBRrbJ0=;
        b=Xdhy3R17Ehz8DG5qBx9X7lb05PUudEsMylAcDq93FYhZYZXLidiDGgjRHA7LfohcUm
         f6AIv95mOjJrlYBxMAH7c8Aw5pM1qv9TnzlsfBM4PxDmpb5MpriKy83uErx3ESqwqzpC
         1yrs7Q1Ik/QA/jRoaRoj1XCg5VhepJ9RLnqvqDQAj37qPgtgrYp2w4xiPRxQPfYIAWnP
         uUmSrCyxoQ5OlG0MLLXUDX48PkOmEy+DIJP1Nl40cPMZfTzu4LQoUYq+TS1J/dGvzFnV
         1zefmoXgilfMcQnm5vTKSOertl8RESUij448G5rGLWnhzLMbFBHssLFV+3dDLTNY6eaC
         dz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769766877; x=1770371677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9+DAV+c/CZgBH4DD2jfZcDSjLwf6jHYApWbhBRrbJ0=;
        b=rnO8nO/OCvVGq991ZpmYH7x58Utnu3iEKRLy1/N9y+c8577OhWT1/tf5yHxzqmxqzO
         nge0EqyLVYwaO3MDwcirZyxjX+LOjOp82pzw7X8r0flvy9R/28f7ZWknOypwUAPas+Su
         Q2GhAMwWoM1t0aVmXmyS9MAELmRfKae4TO/IU2sjV1YbLpWsQbrTWr9s5z9zt54p39v8
         Nm7F5BA/vQgZdD1p60tG/xzcPfivXgq3qeeWBgYvAQ+o8p7E5YHhTMpZBSsL96vcYzO9
         XhzoFTdzq1kh/BrmkjH5zwsuW6qhsV7JrkdTiOK8RgEFuvXCnuWsuej8XdUNdFb6yK+i
         +Zxg==
X-Forwarded-Encrypted: i=1; AJvYcCWyEjkjTiEllzCu/mKVHpmhO7J7w7Cuq6bddDXAJ2aCtkWWmrVfWTI/gHTfMiEgKst1vCv8QGCC2Cxyj1xFRJiU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx63hHmWxyqjQDsqK7hmnj1C3LZrIDGuzbx/uLG4Es9jw8tTKaZ
	VCRwb+taiZ9J9ltXgB85bI2YILgAoQ5USMICq0rS+tAV6tr62V+uE8c1biDq4qEKT8n6dDGQoZx
	SMmlGQOIIfL3n5p63wh1zYa+IVYgto6V6BdyZRnO42oXfAALLKo8o4rpoFW0XzXKN808FFiu5
X-Gm-Gg: AZuq6aIpawvDNkFJbUbRVDF/rjxO/P7jltLCCWGxMSDdGAYu7/Mzi3oSmIrHJ329tqy
	OGqrcvCTNJeQ7nphrCjm4Zf7EhLwjoEdG9OkrDLqa9xP172QB7HVrsNfMXfeZzZyhWqmpd4ldEY
	uyLTwMFhHF4DW0GXGWTurUc6ZarlwPePbGo8/blUSNYQGPOt0s/CFkL9k3n8Gwsct3DRuhlZ2Cr
	UgDZ3ZxHg/VCM/1QvFx9yG17TWafw04N5W6M5m7K0bV3L7bsOVcaXHLs1JstX9sdxQTdDDyxU2/
	5dqSuTE7hhCi/0qomwt5DPjwckZgEnJcvCK2M4XvBPXmk6yYSKUA+60yoqzoPFgwF40eHhA+OKt
	06xC6XhCmP981LkVFJ4SZnQ4+r+Pxj4R4ypEBQUWlQjywlZnvoY95D5CsY8+TfYUTl4U=
X-Received: by 2002:a05:620a:4009:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c9eb10f0a2mr239893085a.0.1769766877046;
        Fri, 30 Jan 2026 01:54:37 -0800 (PST)
X-Received: by 2002:a05:620a:4009:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8c9eb10f0a2mr239890885a.0.1769766876599;
        Fri, 30 Jan 2026 01:54:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbef86deesm399356666b.3.2026.01.30.01.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 01:54:35 -0800 (PST)
Message-ID: <5a70d411-e0fc-45a5-829a-c20fa02317cb@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 10:54:32 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: glymur: Add ADSP and CDSP for
 Glymur SoC
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-5-sibi.sankar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260129001358.770053-5-sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mVKQUugBPtVYqQK-Mx893e0SnPKOV6DK
X-Authority-Analysis: v=2.4 cv=FPcWBuos c=1 sm=1 tr=0 ts=697c7fdd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WPoQd7O3gY_o9P5QeXMA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: mVKQUugBPtVYqQK-Mx893e0SnPKOV6DK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA3NiBTYWx0ZWRfX9+nlvPSv82dj
 TFmL4gsQ6RxhzgTsCX2UibJfVndxtVR7sT7XHDDG7xfGwFTguUBw9mOIy/3aVMeK0a4BN7E6aOd
 UMeqFPF55iHT8A6c4SUECVYSwoelP735sC2ZF/Hr/7OSFN48z2d0AECGQpeAAFV0MdIPdd81wKb
 5HyYW0QNG++PSKkWnPANu7aR1Ddh8I/75PYdyQThHOA+r80kfWOUbmQVFFg9pWnsKb7sITTBWz5
 Ch+qkaaE326msynG139L+GnBgHn4P423Ez0NQzzD7mo4BaQigtrfS4dUpoHkfDJ5hlcwkjBQ6P4
 pOxIzqeYsEV7FcaH8IDrvfQkN+NBjyEgzC5nr1CxiAypfu/BPFDBialzzoirLFTM/Nec0+1t1nr
 t5BYt9gU+mTWsZ3i5py2DVWkognC54wgOFUqNwmJVq5SZH8I8KCMgLc0ZLdzxogECHhNsLk3lvh
 8xRtsIwuuqdoSnYpgiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300076

On 1/29/26 1:13 AM, Sibi Sankar wrote:
> Add remoteproc PAS loader for ADSP and CDSP with its fastrpc nodes.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---

[...]

> +				fastrpc {
> +					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +
> +						iommus = <&apps_smmu 0x1003 0x80>,
> +							 <&apps_smmu 0x1043 0x20>;

0x104x -> 0x106x for all children here, the result is the same but let's
match docs so that no one has questions down the line

[...]


> @@ -4692,6 +4808,176 @@ nsp_noc: interconnect@320c0000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		remoteproc_cdsp: remoteproc@32300000 {
> +			compatible = "qcom,glymur-cdsp-pas", "qcom,sm8550-cdsp-pas";
> +			reg = <0x0 0x32300000 0x0 0x10000>;
> +
> +			iommus = <&apps_smmu 0x2000 0x400>;

0x2400 (same reasoning)

[...]

> +				fastrpc {
> +					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "cdsp";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +
> +						iommus = <&apps_smmu 0x2001 0x440>,

0x200x -> 0x240x (again)

Otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

