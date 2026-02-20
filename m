Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FE23EBF39
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771596176; cv=none; b=JZDUHpnTDmydcc9pZb3v4pjZ6XfcA+P3PjxUZ0loAXDMt3j/pWl8sc0PmjSGLP7wwQ8Fl0Fbp3ZRNoILGoEdxMJl1aNSIRWvVEWeGKtfxcPMI9LNIRp4Bc5ng1puzPORF/XrMw64+AS1jquVfX4/+ai/FkGwOyEQWe7J9IW4qdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771596176; c=relaxed/simple;
	bh=ib9OugNAfMwq2K/bOmAt+9WJ8EivQpVD5ZQMf8doYxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o4tmU/zpQCkxHlwB0/eTOUlPEwDfvmH6RrfdAIIq1Cv78EwbosIdJl6yYHGkpcDTfYE2NiDXLBiF9Qqn3CRO67eifu5arsEy5g5g955g+SYIPAuD4pi7bNm1nq2fu7at2dpGjVjopljAKZh6YFdE7OQO9cbk6iYhZ0askx4wSZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUx31nWk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1sbzI+D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUx31nWk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1sbzI+D"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5S7bw3337638
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 14:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nXAIJDkZLCji9Bgqcvm5E89D2YAm91p72Uf08Xb+ppQ=; b=jUx31nWkHBOtPyL1
	BmrM3meSb8Y6XhLrzQKn7UGPfLaCPeRdvJg9A8Ikd1vnvpQsXaBATpSeVP1iuxTC
	c48EVHg6pbrgiLhM3b+fiil8w1WNCyvkVgDAX+GVNBJlDXQnpy3Lc1cUsO1CsToh
	V8L+ugpC1t5QbPYaIxl4JWRGUdT6T3DPydGilXwDsk0V0rv0DoRC+Oxe8lAb33Dx
	fXrNJU8wD09Qy2ug7Hbz6XfMXhhQcq//w7zz3hXcArmFYeV65f7py+NzaZsTrcjk
	ttOTDzfS/Y6ggGet7aVOptY/6DSJ1L9Vatb+0pBcG3tnopFAK2D9fS7FEDb1B8G0
	/HoPkw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cedp6hqwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 14:02:53 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45ee5c25e08so2534768b6e.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 06:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771596173; x=1772200973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXAIJDkZLCji9Bgqcvm5E89D2YAm91p72Uf08Xb+ppQ=;
        b=i1sbzI+DpwUiSsiubvyzAp0qPE/NU9O0JLKbVwQC5mnMTHJnHq53Ych/9agYQv8lx4
         Jb81wxEtcMSSzsfogKPiA2sPKnXqlv7ind8KRk71cMHEvn1ZAgUgm1oVVkZZgYTdnAXL
         CyGkWvq5GZ5rGFtHf8y3Tpd2O9eqPA7fJLk7nsIryr8PTBD9arwqRElUiUl1JJOUBF58
         tUXEr4YW15jHMv18yqOCz5ZduXfhdqIVOLWjhJbsA4dVlmpFjVTAiymiQwEHjkVlwdhJ
         dp7CTajXi0jlLdb+lI0Ax+cH+/ajUeLWW6lsidSdTE8FWf5cFsQ/I9cpoB2Z/j/sK+FD
         +eQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771596173; x=1772200973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXAIJDkZLCji9Bgqcvm5E89D2YAm91p72Uf08Xb+ppQ=;
        b=ADhFdyPp70UoQHXlHm0DmvSZd3r+eowmJ/XKZNRXr4oo3o71WnSxtjpCNRI6pftodE
         d8WgJe5RPSDvVGqd64j2ror1fKp13gaduDfe1+pw4EfsS/AKyxxMV+PepY4mf0E5W1mp
         /d7Pj5iflo/jJtpl/yCi8jghhHQWIlh94FlT6eHGSZvR24vPTh9hOpBFJEjstCRQ5k4D
         7s5lFXaJMkNFtuMUBqLWt34ZaCrFEbmHfQT+Kxcek/dpKA3Beijql8ovqZMJAXbDFUhM
         au2xbivtW/42pUPe4l1g0aVTPPAcs3BPPhXXmOOFW3oySs5X/bqmGqS5yN3Md56DgF2U
         2cHw==
X-Forwarded-Encrypted: i=1; AJvYcCW8nhpfRcu9SdfJ5VoPdCBCAqrQf8MKbNynQ6KalN2hWlOhsJ2WOpXUJJCFHSsi8yWTKU9nzyjtaPX2dmaJ5F8B@vger.kernel.org
X-Gm-Message-State: AOJu0YzGKhdfb0oOrx5nbfny/ZzQ4NhCy+H8xS3YowYMAC4NGX061m5g
	Z6h/uMc5i1pidQbYTjswVtCvpOc/GtZv5zbn+tKqwwRcjJCfl1TGnlnr3e0m+iZsOc6GPHPJtG/
	SPaplsaB4ZfWj90jCB8eSj1n1iYTjMlUXtapCxtfxV7QMa3F1rkOI6iHfKg5j8q1d7ikKzc43
X-Gm-Gg: AZuq6aJH/RKfgbHELBQA8BR8U049vIRlXGRUsrdTEUGqpxgj4Bh+8cyEGFJwFeJIxCI
	v2UiDALTqMgVP2UeRzID4Zrd93Pt1aVuM9v98yoSHFohN6mVGkMaCAs+OIDWTTWbAU9UcPdQOIe
	eM8wYL52FskpJ1rjL1oq/+qv+pLsbJeWnWHM7/blvmpIglRfq9PkQ/iV0UBMhC14uvKrCpNxezZ
	ITOjtgp8e+2L3RcuJZTJR0b5YQ8EyqHrBFgxHrNmmTlkbFWXizJbGpp8/YzjlAlBA4mpp5KY/kC
	BkWYeaNPHr+pdYbjgA3qFrNm9xjelb9SW6yhZLtSWVV0xQ+tGWQChvepA18mKyIE/qsJMGxjlAH
	3Vzegg6kBBuKvtF1A1uqEhhFYMLhxmWE4YhNFUCK4FxTxlFNyOc2vysolTgpmnTHIiY/KFla2Uo
	VRY2c=
X-Received: by 2002:a05:6808:508a:b0:45c:80b7:4e18 with SMTP id 5614622812f47-4639adf5562mr11300418b6e.5.1771596172760;
        Fri, 20 Feb 2026 06:02:52 -0800 (PST)
X-Received: by 2002:a05:6808:508a:b0:45c:80b7:4e18 with SMTP id 5614622812f47-4639adf5562mr11300370b6e.5.1771596172165;
        Fri, 20 Feb 2026 06:02:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627fa7sm692969866b.38.2026.02.20.06.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 06:02:51 -0800 (PST)
Message-ID: <d610008e-bb1e-46d0-8397-126bc1e2542c@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 15:02:48 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
To: George Moussalem <george.moussalem@outlook.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
 <62d53cdd-b71b-48f8-88d5-65407d3a80c7@oss.qualcomm.com>
 <be05578a-d90e-42ce-a1de-4f670fce03d0@oss.qualcomm.com>
 <DS7PR19MB88834BFC4ECEF7CA27C379139D68A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB88834BFC4ECEF7CA27C379139D68A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDEyMiBTYWx0ZWRfX8dzeoDKwe9Rk
 KEJE3g2KzZb0wF61tfi8PZz54sZ0lk9X+vEffJ0X8tP6yosOgRCBJdGnYGJPTAFGMOnPuthUzgB
 k/tC5vIF6oXI8yLCJPOvg+3IeTPzzGIZ+nn2mrh1PXT/OgqIIPNjQBUUjIqBqzmzpNYsiEFcCjw
 QZE1UWDGj/8KZRsDO9oa8K73i2n6IyK1KjPsPYi/DxNouftuzU+spCc6sx5B80smX+5uKAiEHJS
 cO0qF5/gE6XAOv9qUItAqZ+bfLlzUueRQfyOzB5c3afNj0eJSSMNKQdP1knU1MeB9dsG4jjmXLS
 hUol7L5ZDBWrW7NOpTCzILjNl+EuiwU9BbX+a05G8FLjhFnxG9BaVbRnn4Mh3Hw7u4hr+37WApJ
 0doAsq5kyLMn+662tdpJiGzODz9VEqj8WftplahDuA5wP39uWy6UeGvHuEmzidaHpQYCntvRwew
 08WlXZJGzw4SjysSRew==
X-Proofpoint-ORIG-GUID: U1r5XvxUMyhF4BjVtcvuQlx80YjFaWwb
X-Authority-Analysis: v=2.4 cv=Vuouwu2n c=1 sm=1 tr=0 ts=6998698d cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=FjteU-8OcTYafXEUS6gA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: U1r5XvxUMyhF4BjVtcvuQlx80YjFaWwb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200122

On 2/20/26 2:53 PM, George Moussalem wrote:
> 
> 
> On 2/20/26 14:36, Konrad Dybcio wrote:
>> On 2/19/26 8:42 PM, Jeff Johnson wrote:
>>> On 1/13/2026 1:20 AM, Varadarajan Narayanan wrote:
>>>> From: George Moussalem <george.moussalem@outlook.com>
>>>>
>>>> Enable nodes required for q6 remoteproc bring up.
>>>
>>> I just recently became aware of this series, and have some questions...
>>>
>>>> +		q6v5_wcss: remoteproc@cd00000 {
>>>> +			compatible = "qcom,ipq5018-wcss-sec-pil";
>>>> +			reg = <0x0cd00000 0x10000>;
>>>> +			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
>>>
>>> This file does not currently exist in linux-firmware.
>>> Instead there is q6_fw.mdt with associated .b* files.
>>>
>>> How do we transition from .mdt to .mbn given that distros update their version
>>> of linux-firmware independently from kernel updates? Will we need to have both
>>> the .mdt and .mbn files present for some period of time? Are there associated
>>> changes which no longer attempt to load the .mdt files?
>>
>> Since there are no in-kernel users for this one (the ipq8074 WCSS driver
>> requests that but no DT is wired up), I would say we should promptly move to
>> MBN..
>>
>>> I ask because I've been told the ath11k/ath12k drivers will also need to
>>> transition their firmware loading from m3_fw.mdt to m3_fw.mbn, and I'm not
>>> sure how to make that transition.
>>
>> I can't see any m3_fw.mdt in the tree or l-f, unless the m3.bin qualifies
> 
> I think you checked for QCN9074 which uses amss.bin and m3.bin. For
> IPQ5018, IPQ6018, and IPQ8074, m3_fw.mdt is there, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/ath11k/IPQ5018/hw1.0
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/ath11k/IPQ6018/hw1.0
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git/tree/ath11k/IPQ8074/hw2.0

Snap, you're right.

I think a simple ln -s file.mbn file.mdt should work though? mdt_loader
seems not to care about the file extension at a glance.

Konrad
