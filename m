Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5AD411681
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824520; cv=none; b=ZKiA7Mi876L8dAg1cldA3dQRvsy/nf7Mzfun9zlTsEp+SpoU/AyWau/q5wTM/3pUQd9MzNjXGcwPygjf6ydgiMRJEIVCbffBNJJhA6Uv7j6VFBQA8QlYkiLErGL84OpwvZ8LqjAJNZfSxIQg2JjONroPUFEvCGz5sEGczxoQ9As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824520; c=relaxed/simple;
	bh=XisiafNa8TNxUf6HIvVJOnurbDpa5s7FfbLbsSlbCQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IEmJftVM5xVkxmpoyUGj5FJzujdPNzbutfb1V/81nzUBzttmu+p7ycW/9uFvtqN4jLRKy/Ot6q+rMXqEfPhHBPNN9eqG7e2GytZ/v0k3NyVPEtB4XQi0Snhz4Hjvl+Jgfnblbx9JX9DSQdrIAhYEnBivXlfe9NJFAmLK+ax/l5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3ipeDtp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYLNd7Ek; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3ipeDtp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYLNd7Ek"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n4vP1508588
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 13:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkaC2ruG6J8fgfMzShDr6/Ismy8R8ymEnpnKKfiD4oM=; b=Z3ipeDtp/dzVm5g3
	Rc66h/oANnogMqvIAa5bDs8bzOV/Bt72zsDTgYTfA7IA5uuHFgU4RvJ7GpAwgR2G
	Dboqs40UBavLWrMi1eikLSTci0PPalFjXL57Ppjgo8IA5oLmhxd/4vS6sR15kd5x
	cLb7PIBF2A1NaRFS2LKy5vJ3KVGqDD5qZBvBJtTLmk9tzqG8YEus5wv1owfZyF+j
	GiqV7LM10sTHr6IkMV1LC9h3y4pUtyMn4vykzUAYwhwJ2AukP8v3i5aRnPQOgjHP
	IWiWq9Gye024+uleDmiu0Qptjryj+kxovx1t5Fn1LF+mbrbGgNwlPn/Pj2jr4atQ
	geWL4g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j3mgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 13:01:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-734bafc2646so161835137.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824518; x=1783429318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkaC2ruG6J8fgfMzShDr6/Ismy8R8ymEnpnKKfiD4oM=;
        b=OYLNd7Ek+ZvC5zp3OqXcgwwifHh59U3f+LrcP7eNUifUUxnBTmZPs3hhq2+Qril00P
         c55gUCwlBDVFNV8uBOBPqeVcxvPsr+3iJmd0hKV0mAjvN98Qk5vh5c+YmJVBXahjtbUl
         cJaMWTstjgC5BFIqCe7rIE0FYuNtXuB+Y2I50Sp8bxXfqNssthbNHhXwG0sE8kvUHxii
         BWJOxNzZJRskwONoRYTdTNph+Aw43fQbNaixcZNnPNmaVaJjWKyTL8niOBelp/MJfsew
         IDRrlXukpyHJUqoP2F19RtAN7d8WOnWv/+XAkIKzGMaO0m+t9vhzvLPOEEa2rkY80ecI
         BSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824518; x=1783429318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkaC2ruG6J8fgfMzShDr6/Ismy8R8ymEnpnKKfiD4oM=;
        b=RBl17FxYOtlB6PUaiVXVv56iE7qBrnnCC2kCFiV3Qiu2u42OOTpUSt7gy8E7r5KMLG
         Jf9mqwmir2ZGjzq4A02q32yxWkVyKcDRdJcFpEIZrJJb+eXAXasTtpY2dUAKZMGNvu1S
         fH2b7FuR4ehUSPCnmJsn3wF+zvJRyBX6edQFq1Jp9cLm+OII9ZRR9RhH9vt/YMlNZ9D4
         RNcpyipR73espF6Ze1Ynpns1Cnb6OPyXgqujboRTcksRWebjbbpGTv8GqdVssAVMqY3f
         /KGBbVPmNRzwNSnO6PuX0njj+j66nWMUqWZUdLUcgScBQk6Q78chdcfwA7LhV23+ewHN
         Mxnw==
X-Forwarded-Encrypted: i=1; AHgh+Rpw2DLW1c7y9yhkVATc8TvrWKyiYdbDmjBPR8RmV/d2dG9X6YaYG119HloS/nxCZ/t76xCbXGyJEkQigZXf1mCe@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlw9/VanqogUm+SreXPCIihKQhxQZY3H05poCXPi0DpqmH5euF
	vYBElqKEAHcw0/eTnm2z7cKSX0h5dzcxbJvo5kP9M2Qoc38NgGsF4eC0LFZQwrkab9qONhAF4gE
	X6Kta+xABEm7H9k/vhGmR43y5RBT0/COPKKmRU5Ef/ReiSw5aBvWAs3njyfAK49iZmB57/V/Q
X-Gm-Gg: AfdE7cnEJuw0R5TTQofvwkz47zpDf7STEZ60ejqmjqJ91pDMZjbv9j7WwCGFR2qDXnK
	R5fmxHA0836VWU2xzHD7DziAO2wWQ1RHNhNUfqg4g3ucEBk9hoUVH7RckNcQw6kXyPG2Qy2KqcT
	fJTIAU9D601nl9YizwwCsk60zPOEezr5JVbNdvMx/u5HaOfDnBbibTjVf52uJMuiI4DI9vkMGfI
	Q1BMM/eSubltvyp5YHSFpkYmkoSJnk1l6ml8xxPJJ5HxEYFgZP41On7pnEyZ/9g0X9pTn/bDhy+
	zcY6mrGtxjdme/oLzzI0VnK5MqiPi14KaHEx094s1zqSskZEz8KdKmO4Ijt2zv6GV4TB0R1RJAc
	rFetSyx1/kp8I1NJmmH6/1hJ5t++pDoMhACM=
X-Received: by 2002:a05:6102:8016:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-73a363e173bmr562231137.1.1782824517372;
        Tue, 30 Jun 2026 06:01:57 -0700 (PDT)
X-Received: by 2002:a05:6102:8016:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-73a363e173bmr560994137.1.1782824509605;
        Tue, 30 Jun 2026 06:01:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f5215dsm118931066b.52.2026.06.30.06.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:01:48 -0700 (PDT)
Message-ID: <28bf1937-55d6-4ca5-a572-3bc7d0958608@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:01:45 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] remoteproc: qcom_q6v5_mss: Use mss as regulator for
 MSM8953
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
 <20260327-sdm632-rpmpd-v1-3-6098dc997d66@mainlining.org>
 <35e8f654-214d-4e8b-843f-87fa8cc1a782@oss.qualcomm.com>
 <C5AF7872-093B-4039-9F3A-72BF855BB3D1@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <C5AF7872-093B-4039-9F3A-72BF855BB3D1@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JuUgm_7DPl8mMmtGXfvE7mFAhyoOLeYN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMSBTYWx0ZWRfX7YXVxoPEi4WO
 xvoEX23M+bFkaxF2ncvRI1jG24hkhsCGCzktCdAxCjBAmZdK0mORNF3h4KBdC8CLTOq+fEcn7QI
 b7rVohfsI1q9K98Ya3tGy1/MtELi1qGMtodzKImdMlZBpqgpuU/ZHp6FR+IsgRSaqfQZzyERDPS
 u9NuF5F9W+gArTKT75cwrJwGkqHzZOz15QlwsMrloFAuk/k5gko8oP30hNZQcLUEcbBv5j3GMjA
 mgZEOwvq5aluPfQgyaqhtVa2B7PPS0g6OBMSo2KuaFfLRi8k56bRoEyeCgVTTsm7tsqcDb1S7BF
 H4xLvtvzefsx1IjUgATpMBhJhEGwLqpF+coP2HtjzDXHCi0GiD8BCUmAOw0U2POMy1EIE5SGyMb
 3MN3KzDiK6WAtMbTcaKE812LH4z4/9RzIIXX91U3Vh4Q3Zev0gNABXLfRWWPZ+l6+RCgMOlmU5A
 CGkEVYBd0bQl2NYE2UA==
X-Proofpoint-GUID: JuUgm_7DPl8mMmtGXfvE7mFAhyoOLeYN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMSBTYWx0ZWRfXzAZ2R/qcr1Z+
 xnQq8gRFj08SGGUcrCEBMwJe5+CViKvAsAH/XEyJRLtBYAJxC2pqNKRHGS5FHmJMudghfydZ2vy
 7osRma7ujMCaw1mZoG0A8Bvswqi8MUg=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a43be46 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=2LMQYQElpYtautYIfiIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300121

On 6/4/26 2:33 PM, Barnabás Czémán wrote:
> 
> 
> On 16 April 2026 15:32:25 CEST, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 3/27/26 9:11 PM, Barnabás Czémán wrote:
>>> MSM8953 MSS is using mss-supply as regulator what is usually pm8953_s1.
>>>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>>  drivers/remoteproc/qcom_q6v5_mss.c | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>>> index 4e9eb5bd11fa..86edd826ede8 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>> @@ -2705,6 +2705,14 @@ static const struct rproc_hexagon_res msm8953_mss = {
>>>  		},
>>>  		{}
>>>  	},
>>> +	.active_supply = (struct qcom_mss_reg_res[]) {
>>> +		{
>>> +			.supply = "mss",
>>> +			.uV = 1050000,
>>> +			.uA = 100000,
>>
>> I don't know if it's a typo, but msm8953-regulator.dtsi on msm-3.18
>> suggests one more zero
> I do not see any load values there only init-voltage what have six zeros.

Yes, you're right

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
