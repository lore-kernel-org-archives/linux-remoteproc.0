Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056BA2836A0
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776867828; cv=none; b=L2TkinenmG6MMX2FLFKLvoD0Vo+tx/GmNaIIV6oQchIolmmFqiauGuUSEWkyOvnM15zI+PSv/EcGhKppgxP+Dh9wSCdOfCJMoEWqXFeSraavZObQb2crVUixaA5IiFG0l/40ykQ0tZAeA4nv8o+JluYS01bvRxd9dVBKTW99ukw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776867828; c=relaxed/simple;
	bh=itOHdZjnFmrjMy8RGLFE82HDcK05BSSyTxvDpujNSzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBFy8JfyX2uF6h5D3Kf0AWtUtrvdQL7zmLpwil8hgbWmRzb7/VynvSmWz7SBBl96GgLjoQFkMyS4Lq4SY0In1XsWUYoiU8DquvoFHS0m5NQsN3thdstQr+EPPpsgsuW13/9PQ6+nEiodwOmcperEzyqVMjQjfTt04noxbiW9HH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Myfrbeou; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrWL2i89; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Myfrbeou";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrWL2i89"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MASDeV4050800
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 14:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+pfQsvTwLUI7BKLOP1FvBzhCol5UrXHb5S1pHKsq1fE=; b=MyfrbeouSSC8PKR0
	fZSYNFBNZhvALBr6c6P1H/R7eO8FV3l3mFfbotl1xyyoun7UIjmGcm0mg0+axbCv
	4QZ4fbEWsoyRd38qrOSRWVGge/HaeKf4oTKVx5RNbxzajp6oI68IatAX8+t0J2iB
	z6JcIpRT3AWOBgI5lPSO79VVhBLyIlJHRwADzJmNG1z7ojz5XSoJbHuKuqaMSy+x
	TEfYcGh2XC0x51Pi7hLilODZS+oOCuXgyqC1fC+cEape93MQnpvdiSr01CEHh1KH
	G46KZFYIn608eWZrI6JAAMbbT/DBJaPsdHgm1/Pxse70tiuufM9DNUqQz7fO69U0
	vQ4eQg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfkuhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 14:23:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56e072ac05bso497434e0c.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776867825; x=1777472625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+pfQsvTwLUI7BKLOP1FvBzhCol5UrXHb5S1pHKsq1fE=;
        b=XrWL2i89tptt+5s75O+lHi94XaiHDI9/JBYMqtYp4vTfXqDtuPMcOu/91tUHTsE4lz
         hY7+x6W9jSp+J/M9zwt6kZ92UufCL/NSlM2RudxuctotVENxy4qKwmaBjiAlslUigeHk
         kwkh/NUB9iSrXSp4YYjQTcFeRRBN045dz3MHX+8T/JsHaB+nLEjUyUYn/tAKtAALA8nk
         xtp+AkQN/JdE1gbPTAykKcHjCYXWKwPtq4eJVaxa4mmRGKP3tk1IyMNAQ8iy3i+mh1qB
         j+KKcrz0xLq2ANbXdhmEyKkMy233roGnIXq4O6xdcxyFgialT0EcBuAYn7m2JaxhDVsI
         5d9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776867825; x=1777472625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pfQsvTwLUI7BKLOP1FvBzhCol5UrXHb5S1pHKsq1fE=;
        b=iMdAJZiEpBLoAvU/3pEmxL+//nMOyby8HfZJPX8T+QZdD41M7fReVucgyCnu7cFCfw
         A+cps5nQOHbf5m/ZFlKRaSKHEhInMrAipa/Ms7dio0f0PeFjsIFkn+OOQ4qjBYJ5gcC3
         5C7GQjDyXwOEpJktH/MepzFwlgRNPPk/pvyzpzXp1N5vBpmOBuPTTt3qgpfta5T8p3l5
         NKdI2dA+QflbSO7Hv1DZ/V1k8h2gUi9uRQbFLm0h6jpu4/GYDwS3Dj4qlNetUqm0b5mM
         ck87v0J5Gn+SjZ/din1W70md9JYlqxbgFGhQY1EFjPGvdJGTtc8lAHBgxl5EWPTCoSIL
         le6g==
X-Forwarded-Encrypted: i=1; AFNElJ+3xIx1dkK9y/tdkUkyrfrY6MLj9SZ82k1MXaSZ9beFEYaUy848MxFENJfcdWCt38d+NehoSJYRwAj4Bq2cHd9z@vger.kernel.org
X-Gm-Message-State: AOJu0YxWs/bi5CCUXvD50kA8uUHOhOH/S3VpUzrTtuUiYNXPeegMeafV
	57wtXalM+Z95L+vIqP8tF+15w69nwJifGnyTzDNmMbGyZnnh/mCM6g1AacnZTiBJ80tLwfuRV4l
	g79bbOGRfuDqrSWOhmuGk5Mjqk49o4KvrRLZyQcrvTncFp752plVbnGrCPUkctXDHNtuGVref
X-Gm-Gg: AeBDiet3yW8bwnWqcKGm1Lgs0hLQFbPKc28HV1fX07Q85e0+Wd9PscGm6cvc6p48qR1
	GhsvYravW3Pv4Ws9/mJnMws3LdLkep2VXgp+qIG2LbglUwzFL/sxFqHYT0/DQ0svE2X3Y+imFcO
	i1GfuO5Rgen1QTHeXc84kv9s2I+/47T7NqAivTuJ5cU6ksqBee+Vi/XaC1UcpxRgf0X7fqBUniX
	jkrPflCSX5dDDxzgO6ku/eSzQ/crR53LyxV43n9OW2c4kqp4Tb/mQHWkSArzP7zfkvsyBEil6qU
	zski1x+pKKm4Ody1OcEE652QzDZF9fi7NxXnLDeINdTtHUCqTcTF9dW0W3/s0MBBwnIMW6/hOsc
	Xa07tpK6D4Yyt2HAb7MtRhBkPrVFKYmJMf6pE408gxZ0u58eCDeV/U8RVbnY1suKfMIPknHTPOR
	ATxvvpGWq0fYXJ7Q==
X-Received: by 2002:a05:6102:38cb:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-616f69d6e4dmr4763669137.3.1776867825313;
        Wed, 22 Apr 2026 07:23:45 -0700 (PDT)
X-Received: by 2002:a05:6102:38cb:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-616f69d6e4dmr4763646137.3.1776867824835;
        Wed, 22 Apr 2026 07:23:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e3dsm558060266b.2.2026.04.22.07.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 07:23:43 -0700 (PDT)
Message-ID: <89ac7a16-b610-466f-a332-9b688c972b47@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:23:41 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/6] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260326043320.2507890-3-varadarajan.narayanan@oss.qualcomm.com>
 <58edec29-831d-44d1-b574-4dec8985ac2b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <58edec29-831d-44d1-b574-4dec8985ac2b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEzOSBTYWx0ZWRfX3bZZPGpIlbsC
 owVjBaHnf+tF7ExD4IxttW0P9ngaZP7ag+j3vnapT59eq2oLF3DhxOzgetCGuvKZVoJQS77kuH4
 LShF8kJkQi5U35FJ1zocHXqvgt9mY3BX0MkKsOL1dW9NtnEAhAdRuSqUXv4h874gJAMOrFgL4ap
 hv2Xk2OiaWd6aPoeoFm+TkshwD9FCBOxcNottEKmengz8rkMFIXc4tekQbGmPYT6TvlGVluo/uw
 g3jMGdc0um77z1CygHT9MHweSHtWQrxJur0GTyJNdYe9En4wxDEqQJ9PLu8y2BQo1ypONX4ocSS
 uLXw4Gn2ZzxbWz6CdhrZzGpeCypDJRus5V0JPJEfE67Uur+J80YgfR/ubdQV20rmFnosYG9TMhd
 ccyLGprY4Oc/5YIjas0cYpiGXvoYa5rmUkG+dmPdk2T3OlHPak1FmH90RP+vsFlW6Pey0rpTIRz
 cnvGrsz3DZVhBpgZHuQ==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e8d9f2 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YaueY_eOwY7V1C5Z2doA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hMnHDGkiXHDDFf0yIZ4X4kfjqyUk6We_
X-Proofpoint-ORIG-GUID: hMnHDGkiXHDDFf0yIZ4X4kfjqyUk6We_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220139

On 4/22/26 4:10 PM, Jeff Johnson wrote:
> On 3/25/2026 9:33 PM, Varadarajan Narayanan wrote:
>> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ...
>> +maintainers:
>> +  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> given that quic_*@quicinc.com mailboxes are being decommissioned, should this
> be changed to either an oss.qualcomm.com or qti.qualcomm.com address?

Yes please, also please switch over for authoring and submitting patches

Konrad
