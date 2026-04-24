Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1656E3C65FF
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2026 12:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033035; cv=none; b=M3BkzMtV0SQFMJKQVWJLgh85sZni40nSN9VGX5cFmKF8F04EyhzeQE+uztneokd7QXhHEUfXGKFo3KrZ1bcJmKK1+F21Y0jTGclaom8p6+/MQz0dIhACnfEHvQIBNnGczH39G1kUzjoM9Y/8wS7Y4W5G259SC/RaP3+8SF63XiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033035; c=relaxed/simple;
	bh=pPuoFRQxJfAFFUeV5WPhraCPAwF1U+Vv1E+a3uywyL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGtSbuLJen0L1ZWVnoRebeUmJD4Tl8STe3FBFQ1Vzlxc7aPy5n4ugYUL68YaiAmNusZYLKtCJiwyEP8pXxNzCxJ8yUGnbGmFTjweES2cEuEQQHDVWTnYYFKcbkWPsoJsMgggeYkcF/B6NSNIbjoIE4IyXibP1AIYpe0WW7SQqZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOjw4hBc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=crYLlpWb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOjw4hBc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="crYLlpWb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OAPMob2972367
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2026 12:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZzWcgJ/Dtl8c/5T8awq70D37ra01xcQo1QTV/P6feBk=; b=UOjw4hBcPoQ6FuiV
	PNOfrnC+gUlQe/TO9OlDKMNpqaKtlvwbdazOBbPqS6AXQhS7D/S8ca4dSV515zJ3
	TYEBOI7cdm4Q4LcC5SXoM6OL/XBtMVu+OZjgW0X2hvxWkCgrUUMzJLEPtuTzz5ph
	zAdZTau9MeITlbH4h2t4HyY4a2OdHQHGHbrsTGmMprFYcLOuyte4NEGv63X2phr7
	awCROwPDJln4aJ6jeQgQWSOO3jqX2zxQsLK3NPl86rvqqg+Ra/FqVJ+K+EHnMcIC
	iBANg3KahC8MLXKACxEKjvHpisOZbW1mS2Jg1RCdv6bYN05Bsul6ndBH/P6fBKu4
	05dBBg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr6rk8hgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2026 12:17:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b047093195so14579036d6.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2026 05:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777033030; x=1777637830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZzWcgJ/Dtl8c/5T8awq70D37ra01xcQo1QTV/P6feBk=;
        b=crYLlpWbjZWTiT99w92oHWBLByonn9NrMXOcgu3Zsm7N+ljk9O7v7OBKWTSUM31yLc
         KFam9qw/AzCmIwWzvnLDDW6TyC6T3Ob++ZYIzelPh760zQRARaw5aEWf+5RTljQSKByD
         gMZtVT+Q836f2gB4zV1QhWPHh1ojphq2pOdSD0akVBs+9pn+7sWPD0jh47DIQcL1FoHZ
         3ZgN6uEfwi9hiiL8TxdIi/1ZSH1ng/IDWBZYgFz+MKHl1Z6Z5Jpamtcd/sErHbzJYcNf
         992Xclh0zeYfDWZm8+fAPMvs5/YszXzej/KbyA41uC3Vx3u6x2HBaphstHMNF70lSCVs
         aKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777033030; x=1777637830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzWcgJ/Dtl8c/5T8awq70D37ra01xcQo1QTV/P6feBk=;
        b=RZ49qgH1fGd/axDRU4KtGrLEAI4T0rVnbPNL4TBS5HhkA27dnAj2+PUYhMmyOYtUVs
         69j1rWSyG3Gm56ZMqF1xU5+O1L2jLKZjaJnXA+4ElcMvLQlTJQb3cQEh2zyQXocRoOBs
         YWKyW3ertC2YgVoy2Q4DezBdyHJcMnkJiOLG1IN/ZvUK3kyzIAUASzneBtm2Q4K8uNZI
         J6cLZ/9vrcqiS0ojnOTjWnhXXdnQYD08fts3SSz3dnM7PoBOQbRX7Uw22RfYxIqUzCgL
         NwVbjalQ9gzm0xARBToJ4XWOEjQjEJd0ymtKlB8AMwI8do9gBnO46psS+T5rY/7LWKI5
         Malg==
X-Forwarded-Encrypted: i=1; AFNElJ9m7NhQE8MEdWyLji+/TB6BIoOMt2L/8+kZiUaTyIpXjTBZwLALqJDDTA2C+vWHgsP9WmFkfAeLfBZt2bgu/zQa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ibnjsItoGYFuG1w6xuVWpDRHdeWv2D1dCq8tOljJiPKUWqlG
	Gzy4SpxY0B1MgchpwCR75kznKrc7WxprIYJX5U3qOKcpf9v0WK3feXXiSeHgov9rsjT+kHhNEyH
	JIGsZFS3NUgFgLe/5kQ/GWktZAu/jqaf7UfvV8Mf0J7E4wTXsuUTBjBrxR2m0HDqdH/MzvOvN
X-Gm-Gg: AeBDiesXUKHWNZH5nCO5+/xx7wgbff2OHsJDFZ2yT8lkX+1aD9h5gVlaCdKW9bohBSZ
	T8A2YSE0IgfKkJpZJJpBkzGGm8uYurS1caGiq8oIAa+QVwVYJJsV906fF6l56ONLiJjd1U8iVe2
	7AAUHq+DSq18JqgV7Xol33RqV0p1eMYGG2k9UTe0YY5i9X8nuDxEloLeGxxnW5fvu9EorPH4b6c
	6I/prggfut+YJZiSyiypSDSLiBt2RTdqDNa44dl3mmy8Mp/0A6BKCeAUUkR525JURtNDYfR6GUs
	DhCYN3hJ3/F3msUIeAvwi/73duDZDk9alC7x7cV3F6b5+V+RAq/6PV8i7hbo1g4ObcVO0EBvHOR
	RVVsC6c4kp43IGDIpv2rto9jkmzRaQPXX7btwW1pmhE1I+NGnHaesIUH3wbhSEsVevDgqe1PmIn
	XQ67dQ/c9dKg9Lpg==
X-Received: by 2002:a05:6214:2466:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8b0281d5f4cmr340871436d6.6.1777033029588;
        Fri, 24 Apr 2026 05:17:09 -0700 (PDT)
X-Received: by 2002:a05:6214:2466:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8b0281d5f4cmr340871116d6.6.1777033029158;
        Fri, 24 Apr 2026 05:17:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1b694sm784657366b.29.2026.04.24.05.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:17:08 -0700 (PDT)
Message-ID: <1397ecd5-89a6-4666-bfe9-014ff8553a97@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:17:05 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574
 support
To: "Alex G." <mr.nuke.me@gmail.com>, andersson@kernel.org, krzk+dt@kernel.org,
        mturquette@baylibre.com, linux-remoteproc@vger.kernel.org
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <4814455.tdWV9SEqCh@nukework.gtech>
 <577d547e-6311-49b3-9c74-84797b281447@oss.qualcomm.com>
 <27098742.6Emhk5qWAg@nukework.gtech>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <27098742.6Emhk5qWAg@nukework.gtech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AfWB2XXG c=1 sm=1 tr=0 ts=69eb5f46 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=-XRhzjy3v26zEYFifkcA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: orcldg_jLkgpkOqw4Cl0b1FEaWUHmn75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNyBTYWx0ZWRfXwbvOWQQl4hvK
 wPNH+ZLDILXoQEvRn2RlVFek/pPvW002igbkHToSZulkBY8RHL30eQE0f3T2sgeIaXrkCOC0NLb
 Xia6qRIKFSyQSPVzloyaTGW0WtJbnvvv4Nt0vC8uomGMoEELnTGU9Uz063oPMhLWUYV8nPWGTDw
 FRhDZfmAf9R9KwIXFfVFKOj0Mv1qmZ/k9WRELnuHBRrKCFmaRF/p2Q5wPY5lQi5qqbwrlgj9lBp
 E6X4U0k3mFfu5Ly/TMfnCjg8RI3tp2/+f8fHXJELz4ha0QDpl5uU0uGloV8yS2k/1gMS8ZXD+UF
 1LcGf/mTwYfkuU1o1c4933dTZUF1/WSdAz8hGYiwOZH648HbBgPBHPhuxWjWmx0RXlUh+A/aug6
 del0c+Ge3qbCmZFy2h/gcu288UoQRkPlged0/hxWSF9RLxNX5ptLX48Ps+ghMxpm+8RvoH3TNII
 OuSZvpJIMy8MZraWoDA==
X-Proofpoint-GUID: orcldg_jLkgpkOqw4Cl0b1FEaWUHmn75
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240117

On 1/15/26 6:27 AM, Alex G. wrote:
> On Wednesday, January 14, 2026 4:26:36 AM CST Konrad Dybcio wrote:
>> On 1/14/26 4:54 AM, Alex G. wrote:
>>> On Tuesday, January 13, 2026 8:28:11 AM CST Konrad Dybcio wrote:
>>>> On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
>>>>> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
>>>>> driver. This firmware is usually used to run ath11k firmware and enable
>>>>> wifi with chips such as QCN5024.
>>>>>
>>>>> When submitting v1, I learned that the firmware can also be loaded by
>>>>> the trustzone firmware. Since TZ is not shipped with the kernel, it
>>>>> makes sense to have the option of a native init sequence, as not all
>>>>> devices come with the latest TZ firmware.
>>>>>
>>>>> Qualcomm tries to assure us that the TZ firmware will always do the
>>>>> right thing (TM), but I am not fully convinced
>>>>
>>>> Why else do you think it's there in the firmware? :(
>>>
>>> A more relevant question is, why do some contributors sincerely believe
>>> that the TZ initialization of Q6 firmware is not a good idea for their
>>> use case?
>>>
>>> To answer your question, I think the TZ initialization is an afterthought
>>> of the SoC design. I think it was only after ther the design stage that
>>> it was brought up that a remoteproc on AHB has out-of-band access to
>>> system memory, which poses security concerns to some customers. I think
>>> authentication was implemented in TZ to address that. I also think that
>>> in order to prevent clock glitching from bypassing such verification,
>>> they had to move the initialization sequence in TZ as well.
>>
>> I wouldn't exactly call it an afterthought.. Image authentication (as in,
>> verifying the signature of the ELF) has always been part of TZ, because
>> doing so in a user-modifiable context would be absolutely nonsensical
>>
>> qcom_scm_pas_auth_and_reset() which configures and powers up the rproc
>> has been there for a really long time too (at least since the 2012 SoCs
>> like MSM8974) and I would guesstimate it's been there for a reason - not
>> all clocks can or should be accessible from the OS (from a SW standpoint
>> it would be convenient to have a separate SECURE_CC block where all the
>> clocks we shouldn't care about are moved, but the HW design makes more
>> sense as-is, for the most part), plus there is additional access control
>> hardware on the platform that must be configured from a secure context
>> (by design) which I assume could be part of this sequence, based on
>> the specifics of a given SoC
> 
> What was the original use case for the Q6 remoteproc? I see today's use case 
> is as a conduit for ath11k firmware to control PCIe devices. Was that always 
> the case? I imagine a more modern design would treat the remoteproc as 
> untrusted by putting it under a bridge or IOMMU with more strict memory access 
> control, so that firmware couldn't access OS memory.

There is an SMMU on this SoC.

I don't know the original backstory, but if anything, the through-Q6
approach is probably *more* secure, since there's additional access
control hardware inbetween

Konrad
