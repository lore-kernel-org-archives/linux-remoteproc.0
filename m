Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C792D7DC0
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Nov 2025 17:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762277115; cv=none; b=eSiGxq+qfmnbQzCOjtUwDNpTGP/D/SINcoSEIJXh6mjNaCvLL3jPXCxIIVDxaxklCx89RlhJ51GWFDZfCROtVy0CSGrJdw2/NPH1hqZuf3BW3nEaRopaC+FUiXvEtFKHf+JKDsnTzHpS6bUcFgp5i77WvaiowVYitxtSMSxj87A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762277115; c=relaxed/simple;
	bh=nnjUB7LL5+SU4kruAo+s/uJqZUqYb9G1b28dkS2e//8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J052x1+J2lpFQLoAqU6gc/rQIoxNqGpXHxzE9G5+ZqwB+ad2xXmdf/BoBd6J89ulBC+kEd8kxQKUxk8BpJUctALY0kHUUJLUT+TvgMttE3Mp/CKBURQuXH8IyZI4caFmQFNLpDb2KglYDvs2SrXQMQnJFBYX6/zcpbDSEiVhf+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbRGfxV9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8/6Tcsz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbRGfxV9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8/6Tcsz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Gg1HM2512125
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Nov 2025 17:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XqomMh4cXtCMhqeRVoWkhlqju9FTNhESCKlR4nUZAiE=; b=LbRGfxV9m3rOEpez
	zwqGcxrskCA4S+0x66f5+tbJp9QbP1R6m3zHNhiEhhUOJGrJ84ccRuBuur0md/5x
	fkeLSoCa7s6EALNryjMiFt8oRGSRnx40ak9aiwkQVQxJ2xtwrd/JUmfXmUlOWfXC
	HzwNWd01jgEFOwD6eVVkqzRbpT/AxwcrtV8B14qzlbjYgp3nfZ+dAG2zeGk/ZXTz
	srYI0OOUx1oua1CIHnV7gJUjhWi2CRblLoe6ANYxT/Va50gde9E6mT4/OroTrvfD
	FmlmtDv/EVJrcf79Qv5ysS00ML+gDZTD3AvZ7Lf9g78XWx55Ch54MiYSlyMhrJHU
	7QKtaA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7c7jhv1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Nov 2025 17:25:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e56b12ea56so15084351cf.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Nov 2025 09:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762277111; x=1762881911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqomMh4cXtCMhqeRVoWkhlqju9FTNhESCKlR4nUZAiE=;
        b=c8/6Tcszz5THkRbDFlfNMcgmDxY9jCuWUZ+MgVADWY0rB7i1hxtjkDzZDq72RIC5/o
         gb+qr0hFNjELZp5TkVIFhGrOfL+ctZ4437udqDipm+H/8B/wqb3GbGADmopLGzTXPuo1
         AWSs/kGx/Lm/sNBaa5jvMvcO/uPlh4TDSTfzd9ekkDilkJpdBfTQRkKCvBlUgwWocZO6
         hi17w9dbPffodOQ20bWQC1rNB+Q6tZJ19E9zaEzPDZLMG7mjP8zi/CMvwu24pQgZZqbj
         mbVeUlWKs/gflmPw1kEoGPXIjEsSPt2taJQzN5Fy3AcJKXkdRPTeuFJmfbW+jqSCCEbH
         H2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762277112; x=1762881912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqomMh4cXtCMhqeRVoWkhlqju9FTNhESCKlR4nUZAiE=;
        b=uVrILaGzhVHuLAoqxlO66bJGYGILPljdTzLQosETy42cPU9lK/fNCEHmIZqxBaBq2E
         YXFZbjBICASnZ05yP1GDep2U1wAvEPIaqvCNkn0RmfJU+UhHwRHeEfjmGVqAPOerLnaK
         uAInJeNKveMoUyHIPkrQlZnj7+PDPpyccDyk5b9U0NExenWtEszCX/o/sXCVi1B5VOtB
         m6AnP1UesWv9zU6cO5ttULFwC6VM/W+cgnef4MSzRzpeUoPMDIzVIaIouPrp0pkyZmI8
         benZX9Xky0F5lIDFhPi0u9CZPZzPlKoeue0/UOlLqlb9b5Tu14kxGhcEMtR4c06XjoSO
         FyJA==
X-Forwarded-Encrypted: i=1; AJvYcCUh14qJunKebjo/K4KokMccgXchSpj+2G+N8m1Jz9e0fPII1J6xKWd/+lSLWjVpUtKvb9eROi/gy8vr4nn1/umL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5WuXQvIbC107uXuwDd87lwvQ/0mlf3Y7G4sA07EmqXVX+ODvh
	OgbPzE6v5MhKxbgDo2oorvdMPtICvVnL2Es62HwEx+rGWA1AnYdnNCp2Kw6RQqMvUySA9Ct+mIG
	XsReuAGEEEXwZW/WLDHHVGwjghfF62x8qLMFbHyVG9LM3kcR4tsdqhMn11LcVnHbXam3HJfpe
X-Gm-Gg: ASbGncsCHBkuqOCM2vsarX8rQgg623CUUTQtUoEA1ydX0TUAamg1dTprne00PndqQkR
	UntZRBNgsCeZUnByMz8gatGZRsgYRaLh4TGJmkf/cKJnf5Vp28d7OwyfwMCKkx2yFYw820pMwhL
	fMKg5sd43QggwWwHfa9YETg7oFyKIhzz5xFN0gHqDIPjAeKvXBNY4qcbM4k6jqlh176xkxd4KIm
	5I2quFYinlJh7jQbROmVVDIIVghvKVvko2NIiDMMEVUq0BIpWQDpWu6LuEfWbAXWNn7PFB7nOy3
	PUVzYUhq1dEUnIkEb6U8r5PDshv9CaHkXeQ/iL2OyHwTWFNexEy+WZeF89/NvFDUI54xQaPYj0g
	c8Rf9aKe5Mz80TSpt99X6j7reFuQzys3iedYC01iVyPHbBA8ISHKBzXgF
X-Received: by 2002:a05:622a:50:b0:4ec:f123:230a with SMTP id d75a77b69052e-4ed725d82bdmr3092831cf.13.1762277111508;
        Tue, 04 Nov 2025 09:25:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0AZ0NEqJyAxkO9tPQooyXaYVFUIJ/Dkxa/d3F8NW2e4gkuIPHPgeyXln246n3SP6taM5GUA==
X-Received: by 2002:a05:622a:50:b0:4ec:f123:230a with SMTP id d75a77b69052e-4ed725d82bdmr3092491cf.13.1762277111059;
        Tue, 04 Nov 2025 09:25:11 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7240540d7csm257218666b.71.2025.11.04.09.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 09:25:10 -0800 (PST)
Message-ID: <8103d16f-6b03-474a-83bb-b2e8ba9b9cbf@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 18:25:07 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/14] firmware: qcom_scm: Rename peripheral as pas_id
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-3-7017b0adc24e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-3-7017b0adc24e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE0NSBTYWx0ZWRfX3GyavW54WCMt
 iHKw+oVVr/hOVbRDPNso9penJ3faJYX7CtKkThNQRV1+EYZbgQz8OBwt3nL0xO3K+WRFcATXUAo
 d8gaDmqjnoQ8plB00yO2hGhKhyfPSp63Ug3/wlFrF2eLYZ6SyVur19K2ZK/2ZMZpuNhPQ/65z7s
 GYkt2sjJFJNY5L08+PwP5bu8zNGFNyAVQp2pLAozK9GHszh6pVZQqBD47jWJbFObLCSApesv6ge
 OD8xB9K4oo6Tzh741VO2Tt5KDa5IHUV8Y961pl0i4sJzNfaujNrTPFrieEp13JV96P643ZYoK5f
 oq+f879Mog8OghTTE0VIBHQaha+w4lEqeajc0Bp3XLhal6t3RixAMv/ZH1nLkdd3560yZVlKXg8
 EwJCCHArDmKRi1jxydB1hPcs6qmtuw==
X-Proofpoint-ORIG-GUID: aYJnM7p66D3HpjR0oDsrR-5IgFsiIu4p
X-Proofpoint-GUID: aYJnM7p66D3HpjR0oDsrR-5IgFsiIu4p
X-Authority-Analysis: v=2.4 cv=DvNbOW/+ c=1 sm=1 tr=0 ts=690a36f8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1x7xYhVcW7TDj72elYYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040145

On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> Peripheral and pas_id refers to unique id for a subsystem and used only
> when peripheral authentication service from secure world is utilized.
> 
> Lets rename peripheral to pas_id to reflect closer to its meaning.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
