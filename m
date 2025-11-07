Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9662DECC6
	for <linux-remoteproc@vger.kernel.org>; Fri,  7 Nov 2025 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510073; cv=none; b=UW3uZchSZpzN0A1S9zsUoZJeDGGcinUkeyFlgdyR7xHlm2Wr82Y8QCnvVGTE3GksBQP4eV4VJ6lHH52kQijsE15c/zufxvvFYaYNZIQrdgoul1656WVGUymnJm9CjNT2YWNsj24DeQ1JmH8rItCXgJO2SbNeUgM8asYOORSdMAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510073; c=relaxed/simple;
	bh=OoioBRdJ7ayPhGchhr5+QYzbg9isNoezQzYCRq+T8zY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sz69Yq1yoG2KviLFj3l6+XTPQGNOAdeO3c9gQwFif36quCMcCu/cBhb+jArDQN6MHaEeFOX5tfBWbZ1YIROIgnmm4yGvMQjrFi6DNP86UtxvbA6kQyJYN7mPQJyDhXSm8MNqC6ANmH1HnYifnf5eBuYddw1EMWx88RI+g9NPn6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ilk+cwmV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDZ7rm2v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ilk+cwmV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDZ7rm2v"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A779KxY629551
	for <linux-remoteproc@vger.kernel.org>; Fri, 7 Nov 2025 10:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJ+iBILZ64jTRpvV6uZevaV9Wrx2/u+yijmHHeMfNkY=; b=Ilk+cwmVzBxLW6Jg
	Nxgyei94AeMuW6muJWmDB8kzOTk2cyjUiK5JgDQxASNe0xqscYT4Ib2WNBaRLVwZ
	hza0Qtjueky8umeWf9yleT4ciEs/UEf5s/OTt8Larf2ZW55txXEH6OjRm9gvdSM6
	UJp3NxipkE9cvL9mUuqcn4+ggJm4lrYMM/Me9Kyn6Wh9BNlGsmJjBk2cxVLnqjjb
	4+LgPlbvOsVYqCd3/2boY9wikIr1iQwkT3NBhHkOXqydymHNlAWmaiT7vOGDOR14
	rcKR/T1//4YPW1w+ts1Kei94QBQAqllRJO4As/e+kwa2ZEaM/Bf9vDtAr86QIlOo
	hxz81g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a92232725-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 10:07:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88057e35c5bso1126436d6.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 02:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762510070; x=1763114870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kJ+iBILZ64jTRpvV6uZevaV9Wrx2/u+yijmHHeMfNkY=;
        b=VDZ7rm2v+sUep30nRu+9K0AhOvEpP9SinFSMmotMNdYJVbScOkiNOSmxhgd6Znj+VF
         qz3uFJFM6YyuRtuxyf578Xv5CnrKe/6DNetBkYx4GIQl+3H5KuRPLUczTD7Z7344MPJz
         IyIy/vmGTjE5BvkQOZoVzvuw/ACXuySZPGPQLuejoKDNiVKnE85RBlY552YpRsCsMvh9
         /K3hcM1pX1/nXHPiPtVPZ/pCuScdy5sJcJPpPShrTK/gIaw4xpZn1iApKY1GWxdHyy9C
         YPaBdCmQM8JUryyYNZlSlJSCgrnJLjtV42vxeZl/mB50ELSDh9BXiSYpWZ5c3JZ/lu/K
         fr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762510070; x=1763114870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJ+iBILZ64jTRpvV6uZevaV9Wrx2/u+yijmHHeMfNkY=;
        b=kgZyNrPwMZJcWUOI745+sS/kPiXAcOKC8cxOWb54bn8B+XtUg+k8W0UUTKWIm3UtKT
         hZWeD47K+viNWxf2T/mFc7yriAmOI+pHaMNLqmkUkJJNiETv0IwFYKPzUnlbXMO3p7s+
         ISc/dbwdZrngVT/R/SbIsyi5I5vbciXGQNK/H/eLcA0hm3CBGUb8Mv5Ppxz5KXlE+Y+Y
         l/LZnZN/3SLMJ2BfmSWy8jx+RWFVgunBlV6+wVbFLimSkNBMEDeszYQY0PhZtvdmtR7G
         YyPlfAUHH3lhaiT9qPAQMx+43uwCiuqytDUUsovBxncDWZ7jct4Mq/VQdkXGG+/KakXI
         wltw==
X-Forwarded-Encrypted: i=1; AJvYcCVOwuRj4CzW0dcZWZz250Hsxd8K9FxbVuGQJgSXDG9rnymYkWP8qjauYmTRWqxGj+mXqA5FBpdhvyMbz7Ruq9c5@vger.kernel.org
X-Gm-Message-State: AOJu0YyGpwh1H1pxYHDMnpdDwCNz0vcQri00gdQ4RDkbs+lLeZdVWnc1
	XA4mljhlVR1m0z5xcuOGvrhfTPKzYTZyAj4LYgth4tvD+SnRWU7mpAQJRt9pseaKmb4sq9Opwb/
	LR9bczox1CZX7VqxRfPxm1m4TuPGrkoZObcvHSR4T/lMo9zQujes39Rh/iHHLqVxkxLvjZzKH
X-Gm-Gg: ASbGnctT29dH85Flk8fOwK+TEi9Y6NwXkcG04b1jO5y09HeyAc2I7KFio9AbMh4/vVW
	daLIUI0JJRcHLc4RgHglo9I158V8zBcvGGTi5tZZxuVCWZyhlmqGkkYEReI18bqlhpYKzMIlmkD
	rJQAXXt0xfLmwhGO+/FpeyFDWAJ/Vm0X5NKlOGzEAGy5+JP2CorGVFvEc9xmxaSwx29uCukjcTF
	EsXAcrto0C201Y7IqT8rXv52ZwomH1GNvql8ywY7D8k9MWihYod32ac0SeTmgUsXr1qI3XyUNLk
	Tnb5GkOaWCwmQbQxgUGO2hlLmgMQd+RplUa+TtBRrc+wh9+AcgoKWmARVgy6O5nFqmTVL6VX8ll
	v/R3WEo6bihbSTFVJ0BLzJfLFh9g3Z/vshPn84S355P68r8LhXMWKyDFY
X-Received: by 2002:ac8:7d14:0:b0:4ed:154:1a70 with SMTP id d75a77b69052e-4ed94a2beafmr20578241cf.12.1762510070001;
        Fri, 07 Nov 2025 02:07:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyK4ggfkQehtvhhKEt881KKKlfwjNufjX1/wuhtz+t+4bUZka48cUEQa9PuQ0qSiIZ9mzqEg==
X-Received: by 2002:ac8:7d14:0:b0:4ed:154:1a70 with SMTP id d75a77b69052e-4ed94a2beafmr20578061cf.12.1762510069588;
        Fri, 07 Nov 2025 02:07:49 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm200008166b.72.2025.11.07.02.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:07:48 -0800 (PST)
Message-ID: <88cae792-b3a6-4b46-a87f-da5b1eae7bd7@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:07:46 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/14] soc: qcom: mdtloader: Add PAS context aware
 qcom_mdt_pas_load() function
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-6-7017b0adc24e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-6-7017b0adc24e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MSBTYWx0ZWRfX+iBxPBpQ3yDc
 PRrVa8nucLRfAjmTkz1F08sCx1nmJ+JyWK/vLhqI0ULcaQcmZ34xl/oyZ/0MT08cn2MhQ5H1CQi
 Y8EnUh0YrGLBNMlf9WSUcBX86dvvNcHM7uPVawgySj3/QDoK2J5UWJD/NU21YsqojsAbFCzuJ9i
 DJFk6Gxk3MV4pYZih6UID25wH1SI3tUCGxiwXoUhQOiSTwVyINdAmCQdUapwXiEhbwxAIwGH/sc
 Xgs8Ltl5/ClHWmd2IXG6ri99AlLi+n17/WoloMjYMDgcONIQahSTSK7M/iy2cSnq5gA54qaKnlv
 Fj0BtInRo2zCjFJavjJy25wICXUogzOS4XRc8HjMdtMTbCrBgl2BssUE51K59DVbnGcrLI5x2nd
 z8Ievs3M+fA/VNeoro7P0fUF4PHzEw==
X-Authority-Analysis: v=2.4 cv=Csmys34D c=1 sm=1 tr=0 ts=690dc4f6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=obFtqB77FYecSGI9kvoA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: sslYpglkDplYHFNUwHErjY77mtcsG3Kt
X-Proofpoint-ORIG-GUID: sslYpglkDplYHFNUwHErjY77mtcsG3Kt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070081

On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> Introduce a new PAS context-aware function, qcom_mdt_pas_load(), for
> remote processor drivers. This function utilizes the PAS context
> pointer returned from qcom_scm_pas_ctx_init() to perform firmware
> metadata verification and memory setup via SMC calls.
> 
> The qcom_mdt_pas_load() and qcom_mdt_load() functions are largely
> similar, but the former is designed for clients using the PAS
> context-based data structure. Over time, all users of qcom_mdt_load()
> can be migrated to use qcom_mdt_pas_load() for consistency and
> improved abstraction.
> 
> As the remoteproc PAS driver (qcom_q6v5_pas) has already adopted the
> PAS context-based approach, update it to use qcom_mdt_pas_load().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
