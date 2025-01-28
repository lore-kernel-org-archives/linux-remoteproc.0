Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03448199938
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738062932; cv=none; b=M3um4J97IEEGmVqXGXiPIRiDsxtqWA+v2HgDBzjNZoipKSvgF8HNOyUPjXmVz3qAebWHw5HaVpaN/xoIb6azPmOQuJKa31Y+GfeoutuoRwXH7nOTyTW4CqFUFMxBTLU9yrFrzQZO5U7FCeL8/Xpr5Fiw3M6C+X5l5EF3ENgzXZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738062932; c=relaxed/simple;
	bh=W9Vj3214OfWKeBNIOxIRzLB3nNuRUHQVxWT5wtV5e5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gBD2rXZI6i+7yCaFQ/Q6R4gCRUQ7ko5nMoiFqANuuHDdAzciLwKRQTRpHhw2+ZIdAtxYJnH7jcIcuOvlDmbFZCyYaCMVH25T+cG0SEwu2gew50cta3BiNgLHKDHrdbi7U+SU61KADLSKIQ16+79UHm0z2kyD6/8InoLtrVretz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mg9MM5vW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mg9MM5vW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S4vKYf001739
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 11:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7iAFQYR5J9Ub0EKwN1DKAhKa2e9sLDrDHRzGv4Gq64=; b=mg9MM5vWWJ4NhmFE
	4ozJwZej27GIn5E7x3HtBgdH5bIB2UQc208ERU5VWr9ztcIe4Nt+5s69DkkxeEix
	vB085Ci4Q/9czqp/yfIDp9Yvo/I+BGfSYtuk+M8CSxwLRTC+u44qgAY/MoxWk/Ql
	QjYqh/CoLNiJ+plJJXTbLXzB9EW2y+pR8Ih7YyFYc1OaWs4PQxxn2xZlBYC5Y1MT
	XQLRWU9odNX34OT4max7NSyg391mlFuRL50ikOHLF8y8WRduiuYsjmeAhdG4Ll/7
	XzrbTwLcCbib6226OesOhKBIQ4TZqMJHREOuCI6AtHewJ5ldiIchnsiYKwrd3XBn
	IEqtdg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ernkrtw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 11:15:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6f28dc247so112055385a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 03:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738062929; x=1738667729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7iAFQYR5J9Ub0EKwN1DKAhKa2e9sLDrDHRzGv4Gq64=;
        b=EYd+dOHtgj9u9JN/pEWTpHdzrq3aPR3F7oQ1F9qqAgCJwmKReVWjwFLIqidR8F9p2Y
         9cBqjeBrcxUwt8yAltOFdbkhL/DYLikiIWGseKcOJ+ABOvkTWTGI8FcMvkn3RAXOwsb2
         AeyAlzz0/e9DTyNdcw1MXtoH2wOA8tU/+b1IyrqK+woaLNNQkfsr5jxaqGeSQRbB8vSf
         9LLMoB4auFwwyGLcsFPFI9dG70VD/n7x8sTmDycuIVG4QxxCyV17CtoAkYgAEIKQ+wST
         ago+09ZnWG6xjJri0AXxMpfbzEYrPfAJQJA7wkrp9wm641BFrqvuV2D2yWjz41JMCeZ8
         O7aw==
X-Forwarded-Encrypted: i=1; AJvYcCUvOy2VaQ7rrCOWjKnb+GU/Gnsw6hM7LUln+APi7VFKVE6t3bfc6MKST1Ptx9OiHaRpkKDJeA5qEPIF7lPQhLvF@vger.kernel.org
X-Gm-Message-State: AOJu0YzhCIKr2xRU12Lj7UXu1X6Wo39/4u/L/+b6mNICRTnYbPH5t8BE
	BN6A4QInsFUkUn7x88GduRfDmJFk2TEIMygYFLRA6D4OH4U3IIRbtuYNpUNwkmu+E06fhssd+hi
	UOm06wv/GVGpvM3pq5xTwSN2AuCkqnTWmpsZTZ44p0FkKk80d26j3ery/tLG76q8oPAPu
X-Gm-Gg: ASbGnct//ClXFbcczKZik63HziXZwdXbd5N2/aKneTAUAWySbA0JT54X9toNwYSgMNU
	wi8ktTGnwByLPzlLfz9HwPTXXwsfVfGE4kzGJBQXdNFVA3ss6+TmUXP7pecpRDOYwlXWW1JGmnt
	v3EQEWp7nP4iWlGD1QKnL1l5+G0+X8Z5MgNoYO7xNRGgotQtcqmB8fnmToL7g059wLNTk1RbdYT
	n3JaHHlizxbFc+kxr2zY2VSk8ejvn6iQeDlgcEJA6gQoiHA3R/xpKWM+g9lis7u8iSi9BXgNPdC
	Ui8Mlp/yUB3ktMJP27YntAabVS06D4+fznxbVL/R2x6xjKDDROCOdTD/rSQ=
X-Received: by 2002:a05:620a:4107:b0:7b6:ce0a:d28c with SMTP id af79cd13be357-7be631d3350mr2775035085a.1.1738062929051;
        Tue, 28 Jan 2025 03:15:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF769pbpMqnwsFYBpRgkmp7KBoQccCxddtTdg4vl+b6WlMlpFmkwRwS0yZppI5CS682q7gHSQ==
X-Received: by 2002:a05:620a:4107:b0:7b6:ce0a:d28c with SMTP id af79cd13be357-7be631d3350mr2775032185a.1.1738062928739;
        Tue, 28 Jan 2025 03:15:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab696a26807sm487852966b.130.2025.01.28.03.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:15:28 -0800 (PST)
Message-ID: <259e87fe-0a1d-48a9-b5a7-c9f7c8530b84@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:15:25 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] remoteproc: qcom_q6v5_mss: Handle platforms with
 one power domain
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-4-67e968787eef@lucaweiss.eu>
 <5b0f9cd4-df65-4963-8d6d-5bdf759ba0c5@oss.qualcomm.com>
 <Z5i3vMYnxBNb31yr@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z5i3vMYnxBNb31yr@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: M4UUfMqkXpQECcuNcj4fliHvMhhIoA_A
X-Proofpoint-ORIG-GUID: M4UUfMqkXpQECcuNcj4fliHvMhhIoA_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=952 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280086

On 28.01.2025 11:55 AM, Stephan Gerhold wrote:
> On Tue, Jan 28, 2025 at 11:45:51AM +0100, Konrad Dybcio wrote:
>> On 27.01.2025 11:45 PM, Luca Weiss wrote:
>>> For example MSM8974 has mx voltage rail exposed as regulator and only cx
>>> voltage rail is exposed as power domain. This power domain (cx) is
>>> attached internally in power domain and cannot be attached in this driver.
>>>
>>> Fixes: 8750cf392394 ("remoteproc: qcom_q6v5_mss: Allow replacing regulators with power domains")
>>> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
>>> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>> ---
>>>  drivers/remoteproc/qcom_q6v5_mss.c | 20 +++++++++++++++++---
>>>  1 file changed, 17 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>>> index e78bd986dc3f256effce4470222c0a5faeea86ec..0e1b0934ceedd13d5790b798afc95d68a8314c75 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>> @@ -1831,6 +1831,13 @@ static int q6v5_pds_attach(struct device *dev, struct device **devs,
>>>  	while (pd_names[num_pds])
>>>  		num_pds++;
>>>  
>>> +	/* Handle single power domain */
>>> +	if (num_pds == 1 && dev->pm_domain) {
>>> +		devs[0] = dev;
>>> +		pm_runtime_enable(dev);
>>
>> This call can fail
>>
> 
> It returns void though? :D
> 
> void pm_runtime_enable(struct device *dev);

*wipes glasses very hard*

oh..

Konrad
