Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92DD3C4562
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346369; cv=none; b=uLQzmhE9D7CDEBomX5pfmSA+hOmT3LfpkTbiblbQywrHnuyzduwAhze5mUVlzgaSPieeYwZ/wd2Ki9yR5ExQ3mJj95D8s+HRoVVtZDXGj+RhHX1cVSNZbGbYkvpjZlaaz+PwBjBbGqVaBY6wsKUiqjNIxIEE5+4aYkWAu45NpvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346369; c=relaxed/simple;
	bh=YbI6rFfjkWl+Mm3gmZK5bZa2Hn3p2AU9i9zKbtIaCt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kb1xWOwaP5ftXBj8bw4zu8zQHKUC+KdxVqxBRaZzIoOCCnbZnw1+0UpRpIVc7C/0rEIJAAXd5Mig38l7AGk4czayUkgbBWvcEAdMM/ij8hiW0ATBuLTFknwU2Ho+wjRtTbESM0Q6TBALqcWrZroeBoaZv1ahjXAezm38N+toCNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iis2lPNo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1jnQudL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iis2lPNo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1jnQudL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8AgjL862154
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 13:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/hGSct5oVa9jDWzCwFN3rkowVabxT5N17wXLAEXtTo=; b=iis2lPNox+J4svGE
	TKUT6l+aX0J8F74bLMHNsAsxplhyroH9vRnS/Q9s/lckQjzUU8FmJTwMEL3gC/i7
	/KmrNfRAi12t0x6EuenQCoA9r7mg/sYv/aKQP412GyBHVFRhHNY77MpHXBT6oQpk
	L38vZP44eVqS9sj9guqTNeVMmHmiJYqrHqIutAB7+yBhk/ecY4KzLXyjvsmCxtNU
	oxC3cdJvkJcEdY3uenuHu4hCbrnHqgCABYNd4XMp0xkggGTK6RGS9NvTPAc7M6p8
	PCLjqyBZ5Lvk00rzhGl4grZVEUn3/iN79ZUtt5NZSz2SDvZj6THacV9CWFhit0Fr
	woaHIg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd0ec22m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 13:32:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60fa6cc0c81so314183137.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 06:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776346364; x=1776951164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o/hGSct5oVa9jDWzCwFN3rkowVabxT5N17wXLAEXtTo=;
        b=i1jnQudL6yfQ3VapA0KtZtPS87mV7sR6koeNVStGuTKEQolRDux/A/FrOOlcJCxcmO
         mTrupm4k/odurZ9HzusRiG8TesFcUWxtZceN65uZH/rjs07qq1hQtwYGFejCcsy9Vt0e
         KAxVVlkt5Kakj9f5nenBHtL8xfUhwYuekav0AsEDe+b/lcfV/HIX5T1sbt7SrzQeOYCV
         XZF7S3WKEowd3sNBaj6eJ1bRKoFOvgr5qPQS8t+OjZpcE/f4Vlzkt0PR2riJbjDXGWVP
         hWUWnY7w2SrPbgvMUaNitzJxxfpoGybL/cff+ILFDmxGUa5e/GKb4bnIIGcfXneYuz3/
         65Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346364; x=1776951164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/hGSct5oVa9jDWzCwFN3rkowVabxT5N17wXLAEXtTo=;
        b=tUVIEPEiMILPKBgFwuMgiuLrzAokfr/nVLXcQMTyVOb90ZzM/l/H9Uxn97/Pm/wDC/
         kUsYSbEmpO0ldR4a9cYBw2TLQU6ZAuwkmB5GKweUYcEeSm+8j8kWSJhjLpHd2btgkPw5
         suY+6aLRQlQaZmon0R7UD1fBFeDANcSfrfN9Rs3gGidN/jncWR/Y4j1j/9e2nX5uHj8J
         fqLkiLXQsxV1MIBvcwSx708W9TPfAXd+UTaJ/3S0yUgQsMLdr/Xk9/BSN+91uTMwxHFk
         +BNmNRKwp5t0ZRmCOfBMTng48EBj6+0AIk18ceilWHIE5R+tG5Vo3p9FIh3ird5FacYT
         hv+g==
X-Forwarded-Encrypted: i=1; AFNElJ/0Ek/FBUqoH8M2O8S/4sKBstOcptuaEUvkeD/mikHMbU7f4hzoxHn6PuQ+Yd1B7dWAyIFlpflhXMQejs+EiOC/@vger.kernel.org
X-Gm-Message-State: AOJu0YwmTKEk3hqfXjlYhZa8kg+e0SVWmikskm9FsEDtdyVzgkQx3hdL
	YIoi1xFwrx2FLiPh/j/8vp2ShhyiSzOFVs/AOmKEwRvVtkceI6dNgzRVpMDraxSuZYNDSycjZf6
	on8BlcIzfu4mQXiWT6DH/WfYVGJINXmZ5ujjM7eU7dceRnEIGPTIM/V44nWavn9iZax86gvaB
X-Gm-Gg: AeBDietZnbeCnmu3nm3xCytA9ifvThRwoyW6spu3Xj+q6CICNbBVTxbgenY5mW2qgtq
	MH+bUVrRfm92CK6VjU8sPCbX3dHPNWZQfYaqxtsCmuyioWWz2f2uCJSTQrmCmbXSQPl78tp7R60
	Gkmpae4WHJLUasAX1cnMr64/08tEGoz7A9pftoQCsaYA4IPd8pwbdl5L9IQ1+XErPiNzhhg5G93
	ojeAvuM8XwOnh1mzLMW5yoJg3OVwIpVWt++jIaXdnX5MUujmJOdDD91HaCK5fLKr1RzFMKYGdYS
	uo7IxL8dPy9G4UKW2m26nDpKWFWvyftV/X+xyZCSVHQyAopqIVCtL6QpePndLOKmH6tTcjLDJyN
	awc1GNe7PLStoJcmcGgSmSboUyenWeafQzmd0g+75t76dQAyZosccBcxddrwX6lRtT2B9zMz0nf
	5IW2Qq2Z2cDGP8YA==
X-Received: by 2002:a05:6102:224d:b0:604:f07b:efbd with SMTP id ada2fe7eead31-6141b35663emr353131137.2.1776346363850;
        Thu, 16 Apr 2026 06:32:43 -0700 (PDT)
X-Received: by 2002:a05:6102:224d:b0:604:f07b:efbd with SMTP id ada2fe7eead31-6141b35663emr353095137.2.1776346363330;
        Thu, 16 Apr 2026 06:32:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a309429sm1306333e87.84.2026.04.16.06.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:32:42 -0700 (PDT)
Message-ID: <7022fd85-5d8d-4835-9d7b-995583f2f8a1@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:32:39 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] remoteproc: qcom_q6v5_mss: Add SDM632 MSS
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-6-6098dc997d66@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-sdm632-rpmpd-v1-6-6098dc997d66@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: T0twTBEPB5wPlQsROyw2Whn0U4v6LhOX
X-Proofpoint-ORIG-GUID: T0twTBEPB5wPlQsROyw2Whn0U4v6LhOX
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=69e0e4fc cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=x0-Ntm4DP0gVEan9CnAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyOSBTYWx0ZWRfX1k/30qO6aY9F
 6SoSBiIgO/XkyftbUWy5aOVplNevSoHgFD8Dx0UW+Qe6ZgyiPRBITET7uHwmN4PEdCh1UzhS1h0
 4bif6iqLKt7AXJuadahtnR+usc1QYN3pg3HiKVHCi5QYF3bT8PDAm2CAijdPA+yWHqvobeKgHvf
 OXPuQ6u0WqB7nDkkeZ3VGFMPwZixQLd3p6zMK9KZ4FThTi5236BV9Qt6fSOvEjwN4/28SccMAZB
 NqJOdZARK3gfmi+eeMo28ymjDa6nVEJoO/0JrYVhyrjSXSKSeNP4omwgPKK3mHrOTBq/g31o9ei
 SPqmGGAGEvTU9NbLueB1eTXfU1CzhoELVgeP/pZ2ZP5eIVSIvHniy76Z6XUcSgUm9O4bnyUq0R3
 6yLmlhpkH6tLZ8jkfdjXh5oZ2tJn/SmDf53rKmxjdZZDRTFD1k6ZCIvp4lsFC09epGfHKZlITt+
 X66ejGoQqoIzKfY2icQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160129

On 3/27/26 9:11 PM, Barnabás Czémán wrote:
> Add support for SDM632 mss, it is very similar to MSM8953 mss only
> difference SDM632 is using mss-supply as pm domain.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
