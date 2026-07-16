Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC89842379D
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2026 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213372; cv=none; b=Ma1HjF2KpjY+lM15yf4D2RgiP3Qr3g8vltKR2v6Nhq7V56yWLjh6jaI4ij3cJITpgSHXGFVxE6LkUwrywS/BsYuujXEGvVHEgxYHJc1fcfKpq2OSWKXWowf6g19HMDIsTgDWQMQXpe49u4kWn01w0lDovKQIgz4aiWJYo+VNDWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213372; c=relaxed/simple;
	bh=fsjE3NE8koqyjOM+n1+CuSx4kksS91L+ouIjGrscda0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYhAvLunFdULQs8OLggpYz3/2jlIckVi/xi6HEW30YaCSNvheDi16/p+mFk4u3b+EIEI8R1iNwAEGN3/OTQJtJlcILMlV6nZZgEDCQfkCQjmk2yg9Z68h3MQC7CWGwVKE1mCluPILOb9paMsRrxdhoZAUxqy7TuNU/H6Rud3RbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djR4efOp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqJ5nngK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djR4efOp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqJ5nngK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDK7lq2959624
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2026 14:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jw5Kr1vOUYwUB+mfOp+2DENlLMaDIIjWPw4f1rH0pj8=; b=djR4efOpqXC6a2Xs
	77ZNNskCe9e9XWn5gEI8qRp05c9zGM7Ar84MIAUemwZi0cfxmYjPJ0cAI4CRj/im
	WVk241AKyJWn4B4NGlc3YuW4ZODCiWV7vapawM5iD5icDdyzO/0JbNtdOLmx2Ths
	CT6fQwz7bM6KuQyRsGJ7pRhl+e5eSJ0/ZMLg/tvs9uZFM42SSzSwBm1vjp29x6iO
	ivCchGQ21RjgS+oD4HIHoq0LCQzvUCaaviXEU3BDV9519Uq7lwvxzn+emy1itKBo
	kpra3niAnZk//Xgilj9z6V6mdSCqmTQbXHPPuRced9btL4YTyHs1omEAj7s8N18S
	Uv0k1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym18k4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2026 14:49:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e21552dso94003185a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Jul 2026 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784213369; x=1784818169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jw5Kr1vOUYwUB+mfOp+2DENlLMaDIIjWPw4f1rH0pj8=;
        b=CqJ5nngK1wuw2oxj1gE71bRBW7m/9/Lq3raYTFF8sJK71TBzlmzW+GjxEp9SPcLvqq
         8m4LKAFNU4CpI6heGqXBxZIfo7kNeRkk/uvZkVE0ZwND13cgTflPP+SpnrI8ZWfdFR7G
         JAej11/gyoNBagvKLOBPfmkfSVdKTwSXs3zATq/gZ5xFxJp5XSssigUJy0KtYi9z/960
         BdowtuRn2uj3pyBB9YaOqQJ7R80o0DZJpWYNe7XQlBlVtsE284snVtp7pFHp8hrlwvPy
         klhzI86KzI9SGmMXDIcctxh/fwk6Oltfk2RCyXJtflUYZQ335nDgM9OxRHCgRNSJQTeg
         CnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784213369; x=1784818169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jw5Kr1vOUYwUB+mfOp+2DENlLMaDIIjWPw4f1rH0pj8=;
        b=GusBhgyONYEV2FuItfrqyHo4filAUw98o+YgHUZenN4PmUqvMg90YKnZlu8AAp46KH
         Cq0iv8AmZyOa3pVM0QOecVSv4zb3GyB97CaHXGP21kAhywYG943ArHwNL0IvIrR2rNQT
         E0EEXJcDHKyAqm7EiEdvfwFOiyWCilH60t861+ITCaIcFHQDaPJV+jgSlEeqx8JfeD6S
         nTMYwNb0yYU4CvzPXgtQrWwzDoIXQT+FFd/BXNQqV74TUZA8G0tMar91jpbar4OWVgs0
         Y7bLARlmzC1RHMXI49LdjJAIym5mn5CrzqaJPHVC0Ka7VIAE4qpdi30LbgcJE8x685Jn
         AGDA==
X-Forwarded-Encrypted: i=1; AHgh+Rqo8Z0GD58pwIIC/Ri4zRttmlBFKTzkH4Sg3GfueM/nldswLv1RJ0P+DXwdeHcASShSL3Q6v0t3RI7Rw/rC9iAN@vger.kernel.org
X-Gm-Message-State: AOJu0YwlLEYbZL++wM3Vq+8tG+/Gi5WraiKhGoE7Arb22zGYkg0Ru5tG
	zIFGg3B3GVv7mlNY9jfETkv+Lpc/k+aFNuy6T3x2++nv3tqhixzwhr0XNEN7ytJiIXHPzz9W5sL
	omRtZVVoj4wCMZBZb+XHe+NrixI9IKGPPMUF+3HKboon4+lzxqmmjnR5s2T8Z/rb/S9Uc9dW9
X-Gm-Gg: AfdE7cnu087DrJRLrw5Zg4/8tNBQ9TcNUwk4fiWUDWu6OJw1J+BjnnWHaDPnv5Q69eS
	ydVxcwCZDveByCHPVbWzmPIbhJqc8/p6/E04Cep7PTCygV0ZQxJgH127NBlAcmOpicCX6nIXRHF
	KWhTPQbJhnmKp+M+ZlT3CNdndHw8qBpzu5cpSgOjZ/pw8vvm4gN/ttzuSkNmEw4HuxydB19WEGW
	adY440nZQEUPPSaM/iChOBA+f6dYUuboVISEjv7ZRhT1OwKm46vFH5j/RWiV/jBgKLQqbSQ8cPX
	QYM4xbmKRCGYxMISonqgd93HFDchrcAi3FDATrHXSjCtNZTZXnaUbFCAJh1S/XBRqLqNdw15juL
	xCi3pOh0UEj5MKKqq4rrCOFcm
X-Received: by 2002:ac8:5dd0:0:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-51cbf2f40e5mr178600021cf.10.1784213368715;
        Thu, 16 Jul 2026 07:49:28 -0700 (PDT)
X-Received: by 2002:ac8:5dd0:0:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-51cbf2f40e5mr178599721cf.10.1784213368098;
        Thu, 16 Jul 2026 07:49:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871962cesm234383366b.25.2026.07.16.07.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 07:49:27 -0700 (PDT)
Message-ID: <fe8f8696-d78c-4b80-8fb5-3978178533b7@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 16:49:24 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-glymur-soccp-v5-3-053993f0c6fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a58ef79 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dho3xQVaiACaCEetv_YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1MSBTYWx0ZWRfXzSkefYCicnEu
 hl/rsCC1CdaqVGu99Tc6iEFgd1w1WKqu/Fk6r6nzUSaCVM4ebe4LRfINbrEEFDkBRZ1EY5FN/7E
 D8U6YhLA6579fMNzUFjaRHhKn9yKBSBBicIfsdKb4HbHSFu5IeB9Qer4YGoA3UdOxH5+sxITSI3
 f4kjAWlWyaFphRBL9sQ0SNbyCgA5ey/SaUDJeS9RMuM7URzF9iKr3yMjkAPnWKLJw9Fybi8r88c
 WOps45pXSUiWnHp8f0WRpRgF2d02ZoDYF2vccHDPctni7J7GQ8w9b5np4pj4cMESjYoWqIWUxeJ
 R1NsmFHgqmL4l0lGXPxJzA533zBKnF8hGc7iHvSGS3uVRXv0kogFVon8Q/vp0Niqj5b2xXxQRfP
 WQ/aCIVyO92QazKfq1yuJv6wBj4/CGZ0r+VO93nlyMq/DUyn0TxqcxRguYcPiEneFZehpZ4AlRd
 8r1noBXbxmmuoTzZmnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1MSBTYWx0ZWRfX5rJuSLJAAAGQ
 49bzdJjvlhtGK2TZKohnS1jtVtsA0rVZJFRPRID4HRbOhTfcNbTCOIW5urZ+D7PcWP6pF6o37Az
 Z3AmeFwj0Sb2BG3DYMcPGIbO3SlHptI=
X-Proofpoint-GUID: YCSes-UhqhAGbWfyw_nrOYimzfoLFsZm
X-Proofpoint-ORIG-GUID: YCSes-UhqhAGbWfyw_nrOYimzfoLFsZm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160151

On 7/7/26 12:12 PM, Ananthu C V wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> USB Type-C, battery charging, and various other functions on Qualcomm SoCs.
> 
> Add the nodes required to enable SoCCP on Glymur/Mahua SoCs.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

