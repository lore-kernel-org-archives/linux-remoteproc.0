Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7C030EF93
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Jan 2026 14:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362620; cv=none; b=CGMDfDsc2HZsCVedhMgnqZp/4cHbUY4lzKoAGj3p7I7ezu/Z/tFm+/BjhSFrkT8GI//QdRT4gRAeBMOBwNuUxXZ0R6Gk74NY+X1+9OLGrCHOVx7UyhASMpFHQ+qQP05SpPPa6KCMcDDIU+qxUHGw6/o1M7kragLB5IprmSjiXQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362620; c=relaxed/simple;
	bh=kblJXqj0op6oKE5m5rMIchGutJ6dMpm8ylqprBBkXRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYgdBS/yXlAI4iRp0VGgg3A+7Dga4xQ+6Vt4Oem3oKXBFYo9MDE7Y9AvRsfGV156Vd3CeCSzbp0TNRiFylnIurr8lh5UkBZKJQNya8xGM/pAwef7VNUJ/LMVbq8rATXhc3sBxCQzLtMAmQMWMW8XkKMJb2BaD7K5VZY0pm5vb80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WetzUzC5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grl0A5jo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WetzUzC5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grl0A5jo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Vx7c824311
	for <linux-remoteproc@vger.kernel.org>; Fri, 2 Jan 2026 14:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QLSpurV53aCYl7zCbTN3/EL3fFQhgyYTGB5+YvXf8cU=; b=WetzUzC5FleQrVrb
	N8Gzb+YkUGZuvEg1xOLEubmdWLeXlEyvau+cib7O1rnqBnVi8grXifq2+ddNdIQ7
	Ak/Joix3HayE7SbPuDQZ4+swpydG9cR90lvCntruc7+hWrazFd1h3HaQfbYj+sHq
	pXAsyQtx+/irPQmEjmCJEYOuKwmgxlFXYBnct0iUEBdXxJ/lJRii42cGAGysDXe4
	aaWQl1vUYaTuTNj8KhLoEsox/Iz28YZJ6uqfy/WaoQU/vEkjc8G0EJQUHQkkBKle
	sQtEWw3PnMKHza7R2+ouPqPJ6D2+4QlnCUydC8mLzynalPIkiSVQUVuojXZRl2s3
	xiHWSQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533g75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 02 Jan 2026 14:03:38 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-64479ee6091so3043218d50.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 Jan 2026 06:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362618; x=1767967418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QLSpurV53aCYl7zCbTN3/EL3fFQhgyYTGB5+YvXf8cU=;
        b=grl0A5joZVWPJL4PzDic6w+7Gj9XQdcRiIjEFe1/E5EZRRPpI/4/HcpE81lcAdpAsu
         7SIzQN5CKyzITzYM50duTIvZlWGsuk5mtVmPjsEntFACnrIPF1qqE/pHlKnhVxUf6XX7
         XQaS3gfOz7idO5YoUME6FVdUnifcWFsy1oFV7UEUBzhPSZ4WYkoC+31chJucouaaCnwy
         qlQVRgxk/r3QQAP7N6dpJpS6LzWjTYpKwAdaLg8gQ2MN2tqX4CZmD4JrmrT2U9Ur3mYs
         N/wyLLC0sFp60TQl1h2DMdoO9e6fm1iP8CjVpBe0m6zozHs3QGf2e2gL+euMhrgTVyBX
         gYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362618; x=1767967418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLSpurV53aCYl7zCbTN3/EL3fFQhgyYTGB5+YvXf8cU=;
        b=W8cq2HQG4xElg1qROHqRIXc9N4OX/5L38Vz9Lsnj+oqBI6rGmf0bYfUu/VprgBVSGu
         oTvuGSCpNf9/Uk4zj74PT+Dqd7Y+lLPoRuNhT5yl7hoet0qQU8j1yw8cN7F0T95hkNT0
         dIl3VgN684kHD0k1PdBbFgRnGnUBVyyZs490dW4AsXnUIn0NKCOWhlOfbFK8My7cyT5V
         EslafIbGTOV3nlLkbAb7kF/OiwKgCt01fPGJ6pk+g4GhYAbZYg97vd4sLG2VMWVzwdEz
         gucl0HA2JFjeUX+JjGCbgwcRQLTcH9tcocdwlA421qqBJmcIusl630yWxaEtTTyF+yNW
         wM+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiE5m4OXI0xlnVGxmQh4biH9Cg6iLJOL+baZNo7XBIW3HNYN9nHQQ7zBfnoqni1Q+EE60g2eR/Oke/a724QiaJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7jd9vtisJ5RXRfXbWZAIY1Acf7cg3Blthi4XrfwdjGafwEjeB
	Z0X1xM+kx3NkWZkDjwp7HZEqqzHsVampDvuKWeXvXpbEdLMb20PHNqHgpuDg+8RSIZwpDX703Mh
	mq/g4ugj6RJh9CTEnDFqoTWxtmvnnONXCxmeW9PqevPSKHFZHnC+XvJllw1NnX223/39IVhRG
X-Gm-Gg: AY/fxX4MQCfnExSR4h4Uq0KnonGCDswJFy+KCNALMsf3yndUBc19bjyVCAyV6tyWc1E
	svpRJF3wo6Pek316+yAB2jgCBLzmfTQcR0AI9Mvmrct1EmkPReVc+9sTyDtaWK1GngBmupR/vTP
	/3yfhSUNuN/j/1InW/2K7c+qM+KYYjACHH9s5rWeJFB40SbUQ8SYf1e9MiT8rt+vZ/CNS5qEEFU
	XSLqh/ALpPrJIxgu9TeM/bpY5dBtusfah5VfFktFYocV0he6GilkcPKksc/MHC5mR7Naq4cy278
	9O4xFgn7vhwdJ3HbBUPUm4EJQ2BeuYaoSCvLC8a0TEoRQze9ZVA5JODkmqHbOPtozlKz8G6+q+i
	oDWmTu+Uccxbj/K+S6WDVkHVl3g7DhjMCusK/yfrehxMNxfKFuRx94Aez4fcmyzq9yg==
X-Received: by 2002:a05:690c:dc7:b0:78f:d300:1ba7 with SMTP id 00721157ae682-78fd3002314mr265111137b3.3.1767362617319;
        Fri, 02 Jan 2026 06:03:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9BjDhRbMi3C8AU7G58zdIuxvPCd0K2QOgpFirkhphX+xf2DldvvDNkCAYxmN1uzn70oVumw==
X-Received: by 2002:a05:690c:dc7:b0:78f:d300:1ba7 with SMTP id 00721157ae682-78fd3002314mr265110707b3.3.1767362616706;
        Fri, 02 Jan 2026 06:03:36 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8056ff4925sm4072504666b.31.2026.01.02.06.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:03:36 -0800 (PST)
Message-ID: <415ac5c3-c2a6-4ee4-bd88-45805976aaa4@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 15:03:34 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
To: Bryan O'Donoghue <bod@kernel.org>, barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <NLGulU4z-1Wrf5120YfX8CYJ_8DSP-9-DhaJ3KAIQCvqF9Qf184udOzFoEQH1qgJDZUl9cxEpsdyztfhcz8G-w==@protonmail.internalid>
 <20251231-mss-v3-3-f80e8fade9ec@mainlining.org>
 <6bfc790d-b0da-4c5b-bd2d-ceed9a75bb24@kernel.org>
 <DEGDp05xNKls7EO30mtT70wJFIkDT0-248vPaBikWJGkFf--YvzpyJ_h5sc7RSH1y9hkCKdFRBIJwQUNE9Rlzw==@protonmail.internalid>
 <a627abcaa38c0ba11c76c1f0c42b0c6b@mainlining.org>
 <d3bcaf7d-06ae-4410-8d7c-970fdb196c47@kernel.org>
 <3i9J-ztSj5n83TPS7yQ3ngZYVpv2MnqVgpnkfywumw-hk2fPN3mty8T-vI2c-1Oh8V_ArprPioyoPxso6k2W0Q==@protonmail.internalid>
 <1440e47e-2d7b-4d49-97c4-a717fadd3fb6@oss.qualcomm.com>
 <c8a7fc0d-a402-40b8-b313-6b89d1f5a306@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c8a7fc0d-a402-40b8-b313-6b89d1f5a306@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: u2cVUCZMie0lLOHgw2kWAwUxB1S2cI0T
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957d03a cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=dxggmTjb584dvWX6jHkA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: u2cVUCZMie0lLOHgw2kWAwUxB1S2cI0T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyNSBTYWx0ZWRfXzyUgyLd0bktL
 jLE6EF/iaqVIeX6mo3fUNPEpRJ4fm+hUcrytxdDjbpFnKmvXS7frc+vXkLYl5AcagIPjBVX8tCh
 GjqX+kuOtHLh/u2ni8EovoE+lnMdyQUn/Q9Jfzcw6xSnOoyFoYNvKCSEJ7p+NgYZq1HBShN3O/s
 cI9sqN1FJ6xuWszE47D6Hnq6wayrwmI1I6Xqeu81hH9fdeBIaZdDkYBeDElf++W0o611k8ilTZ9
 7AR60kifpz5PNLHk16940V2LKz55FnB26tpVsRViGp04XqEMSgGZ76v2e39KRmIl55XNIYwrys4
 REaRAdzzPCssUDLAro0mwhMR0t2uFeALXWLr+EqO5nr09PahP84/ZzmFp/gTMC/Ju9BJ25ZKZ22
 F+Hr932mqGFssNGNVUeG+DFdWpyhsksgHkgtV0m8zEoGQ+aHRJgKpAJJJElklDXdEd7ePQ00nhG
 V513VrFCRX8IUzNjTTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020125

On 1/2/26 2:00 PM, Bryan O'Donoghue wrote:
> On 02/01/2026 12:00, Konrad Dybcio wrote:
>> Now I don't like that this driver is going
>>
>> val |= BIT(i);
>> writel(val, foo);
>> // val is "altered" but not really
>> val |= readl(foo);
>>
>> I didn't notice we were just doing a readback for the sake of a readback
>> in the last revision. MDM9607 should most definitely have it too..
>> Perhaps I should have just read the comment
> 
> Yeah this just looks dodgy and inconsistent in this code.
> 
> And anyway, why OR those bits in...

Changing |= to just = would make it easier to follow indeed

Konrad
