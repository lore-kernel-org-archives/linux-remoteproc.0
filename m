Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B721D19E96D
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 11:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062857; cv=none; b=YD6B7ODgretpgcwEUpSPNCRbjxfJB/AOsWvmzOJRX+RblcihqVNLqAljuBTuDWTAyv0Id/Bq97zPByW+LVmDOYVLHr+TtdZ1+2d2h4t7VgYvJN1OFTJHpKf5t5WmzgxOz9wFB1djzrGtLtSIL+P0SM1RmoZ5UJCGkv3joFkkkOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062857; c=relaxed/simple;
	bh=dYHxVhGuDK/Vj0KTlsuaPmH2PegkrzwVnvkQnuu1Gak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eM9LtnxuK0ThjM+6x62zrAcm/Rd4VmWawUG8y0YHTc6hU1NstuYFqNxSWrBfPf9xQVy4WF6NIiDIYFtJ2vdvFVkXvtYgs7fbJApLc4jsFoi0+me4JP8FE+dVG6lUuNs9KyHXx4ed0nAerWDRGRVRkrvglvzeSR0Qke1FAmLOxm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iD9xDxef; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iD9xDxef"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S1ckBt017333
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 11:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xj+2vxE5iGXsLGxWewohzL/N8i21dctDj1hR9X0uoPo=; b=iD9xDxefsQqvgdmH
	10/6zwAfM8GqkFJyNVyfFQMOevlzcUbKVAdfVnU7dN11uQ1ArefBfZ6L8MECsg2W
	ycGfggEMZKVffEG1RH4SYI/ih9ai9P5JlP288We5P3ZOBsabFGBny+wZy2Jz2KEI
	uhPrMSpHPE6MgThGuyZE3qEA1rmKLFxugnz+KOtR3ui2xUtNLjSG6d/F4NxqZOXs
	O2qdCVJTnNdCDqnireoTiWtsPSw0+cnCHanvjYPKBPIKE+UrFfk6Qx1cQRzrS0/B
	EwkqaJEKaFapX5JNAAMxjG0l+uEETP4c1uZtNrgpjPMh9nK5zyrhQC2eZX+9inYO
	MFroMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44enrq938a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 11:14:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b704c982eeso132645885a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 03:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738062853; x=1738667653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xj+2vxE5iGXsLGxWewohzL/N8i21dctDj1hR9X0uoPo=;
        b=ZOzmTsPzFV55sUeN9R6oBbeYwL4M/tyRI7PTX3EtG/Qc84Gv6A+vxX+NoS/GGLPVsd
         maW74wukQ1TXKeMOE+ZJptswwV5QsI9dDIbpsialx/7O8E/xB3NW8BjAdpuS+nIoJF5y
         E2Dok1FGhnBpPHYITJoYSYT40KrPAI4ESokm6TyK+hwm7ccL9oHHRMfkuYV6bGf5Puzh
         hkvYRIB2vRUtJJnyHxpqQ4fGjInCoY6XWvHHlKTGIHomMyu6b838136RxnjtiHPzDm1h
         jjephBWixcLPtRSu54BHNryxcjiJlj7OOGkEHd87KiHdrHxhm+tdSxvoQRIEyTxwnb3N
         NyiA==
X-Forwarded-Encrypted: i=1; AJvYcCWELGk/DQpvrHbSLhD0uyelqo3N6aLE6MwaZe1NuuS3KwyjqvSTd1h66mHJO59oYk1naElc8EoYB4tWwW3/FCw3@vger.kernel.org
X-Gm-Message-State: AOJu0YzYrcX0eLVCjpFzhXJTkqKuDp8sNbZnuiFZEcLfzCwsnDx2r/o/
	/jDWqChYj2YzhVTqFctnWi57Vf/0o7xW71YLRKTzcJH/x9fHYkvKjJXw2DkHBOho73D29BmiPwJ
	n6WDf4Ff6XH5zJ7x2uHNpjhkvYgII2dRHGXlNajmWIHzkvs7C1Vj/KVilo1vMEtsw6U5R
X-Gm-Gg: ASbGnctb/uxBtojIZKfdgpdywteChbfDjpPcG0atpIPl25Q9f4DfDk3jnG5d9SgnnN/
	1FGeQIivLg173FzFRgpJK7pHg6/6sMmvwgKtNqEJaXnLhYel7XmBS3vegsvxibe06xbQb6R9W2/
	ATOzKHE3HDtoAhrrsp0TBLVjsNT3YKJVXz8M1Eg6RpKcJUVW/6HFqtVejUrRDOCtJQgSsfuVeYe
	eYUi4kGFU4A0LNigwMYVmv36lDKqI6SpMUCVwahXyI2vpIUZG2LWsZTT98bCJQj78AuR5x+Unze
	xZ7IzBdHFqIcAYZWXJpIlUE0+fnS2KHv6cgX23BPN8ocgvfwVYztiS0lE84=
X-Received: by 2002:a05:620a:404f:b0:7b6:cf60:396e with SMTP id af79cd13be357-7be8b35e042mr1324138985a.12.1738062852756;
        Tue, 28 Jan 2025 03:14:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsGqq+44VwVaVa8rRIdgNx38G9FKUeoYz3t2B8bgkxQ1MObqkMn1a5pn6d5rbSne8vtLiPeQ==
X-Received: by 2002:a05:620a:404f:b0:7b6:cf60:396e with SMTP id af79cd13be357-7be8b35e042mr1324137485a.12.1738062852423;
        Tue, 28 Jan 2025 03:14:12 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab690c30267sm538793566b.117.2025.01.28.03.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:14:11 -0800 (PST)
Message-ID: <9badd95d-65d5-4a49-8317-1d09a8844b21@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:14:09 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/13] ARM: dts: qcom: msm8926-htc-memul: Enable modem
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-12-67e968787eef@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250127-msm8226-modem-v3-12-67e968787eef@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LTbYhIg09VhU4BtQpzgpxHRrYmMhy6zE
X-Proofpoint-ORIG-GUID: LTbYhIg09VhU4BtQpzgpxHRrYmMhy6zE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280086

On 27.01.2025 11:45 PM, Luca Weiss wrote:
> Enable the modem found on the MSM8926 HTC One Mini 2.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> index d6eaa82cee4daf6a1386902f537f1351811d4a06..cb571aa13c11598182dc020f064fe8268bcc061f 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> @@ -195,6 +195,16 @@ &blsp1_i2c6 {
>  	/* TPS61310 Flash/Torch @ 33 */
>  };
>  
> +&modem {
> +	mx-supply = <&pm8226_l3>;
> +	pll-supply = <&pm8226_l8>;
> +	mss-supply = <&pm8226_s5>;
> +
> +	firmware-name = "qcom/msm8926/memul/mba.b00", "qcom/msm8926/memul/modem.mdt";

mbn?

Konrad
