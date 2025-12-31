Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E115726D4F7
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 15:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767193454; cv=none; b=nZcQPtgaZcLkOuvnr1UID7JdsJai7bq4OoIrcYwtHOiJyl3bvexHVJt4hFwe75GNMxFhzhnK5+JhmcOj9XD4A+tzWHsL6tb3qLkGIWazZSJaar0mwcQ+F1tb9CRYCowc08G5SUmIT3RnQKZsPHS6T9xRQa5RwepV+kLexcQzKNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767193454; c=relaxed/simple;
	bh=JZRtFiP89TAPkvU8wmTIGomtzkCcSAfExo2HTo/boCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thg5FNAtN6g3uqPZr+nCupGfjZOe1ZmAhlVPDll3hCBPQMVSBJ+hkAsi7BZG9xHmSuQQsa/0M1K30O3VlVb83QhA05e+dzRBgMfMCqLiy4E5LhK5ILR1eF1nlqrblBfljLcTmMg3UxXSSXeA61wLUHZRyiQjf2OM3HrotsRm95I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EAOPOTct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VosMBU5l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EAOPOTct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VosMBU5l"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV79AU02734956
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 15:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JZRtFiP89TAPkvU8wmTIGomtzkCcSAfExo2HTo/boCs=; b=EAOPOTctdPz7f4gD
	uzKPZdaB1B7kBNOGKCGCGk/l0zPiIiOeKV1W/BFwopiBeV9QBzQseAP55tVda5TJ
	kX2NrfwaWGjRvDrzxShh/V8fc7Y5s0FA2URouPcp7Q1W189jHekPQgvLEhUpveco
	4FXTrHsJLcQDWBA+A+QFXlYYwJ4L3tLHO93XORvEf6fu8u4ntrP2oe1Ts0RL8tzI
	iF6NXkpw6V06II9Rm3ZmuQoGppfPPrOYxh42qk+ljEUVR76C7ulkmYpubAtpw65w
	pI3+2/1I845dcCB7jKs9hqe+04gheYmIIaEmt++PbukJfRupMAgAJsN5fHoVnvkG
	4gLtyw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6agrda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 15:04:11 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-645527c5474so2602631d50.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 31 Dec 2025 07:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767193451; x=1767798251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZRtFiP89TAPkvU8wmTIGomtzkCcSAfExo2HTo/boCs=;
        b=VosMBU5lU4RjdY9QmUogN36lrnZehhBq043SJ+4//HE9pU46MBi+MkSvtHMosT5r+0
         MKFWEN9e9oeCBOzaEayrSndgsqzDmI8OS90N/I+gKkrgBxgSxrOJ/ANkODvwAeHrIMtV
         VkuHbqp137yuVSj5Iu0ePdDAQzFWYoThTLSXEYfvvue0oaHtq7+D0/HeeqqKLr8oiayz
         4GpOFcYx6PbKdHeKtow5uZ+0g9ejn+So3/Yud13hziFV7LktBpqceUjx+F68bjSCodOO
         Zd7nuUFFt1lQb5uCCnFu4ph4tl6ZP5AmPcL0qWKszljnhUa0mmA1YiUOfvOTWHsV4VyQ
         3xiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767193451; x=1767798251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZRtFiP89TAPkvU8wmTIGomtzkCcSAfExo2HTo/boCs=;
        b=W9xGfxJ71+3TAu1FicGO4Wwv81tVTkLibemiVbBGbr1gjpvjt9QgWVXLwudDd5UXQS
         0Lstbu1d1tHqEp5iBIRmvsaTm/W1m6cJvgna1gNxjbcYq50LXLk9rNIvozghctY0ZZ25
         n+9CsBb01bxeSM7LlFz5WRoLClpi2fC3uvrAnx4uIgSOGl2R2HQeol+HViCWPqPeyBI2
         vcyEyDE7ABnqq2QykF11HojtcUY9WcGeI37UHtyBn9zOaw00HZVZnUAdSDTDvZPMxcUe
         35zf/oN2y+QVovtP1lHfJ4Ygb4xMmk0faXKW5QbmWMbU4eEixmtzky6jMWLZmJaAHtH0
         x9vw==
X-Forwarded-Encrypted: i=1; AJvYcCUOYh47zF7QgWti3gOeHYcz0UxN4HbbnuDDqVm/n90b0IloiU91oM/pnS1EUXSqJUjnpWf1rcHTFUv4F6Ui2AA6@vger.kernel.org
X-Gm-Message-State: AOJu0YxsGQSbEQPLk71tKdXcnL5m/8O46YPLAiPIfpzdI48ph77+YgG6
	6hAnzz3VdSLesWuOFVTaAd1sGe9zdK4Wa8w8Eufq0n2hm/t9jxKU0L6nQX6+rtjA60DtHzz8c8i
	zPxxjmnf46fobtPvld5WVl561+a52BdPocCz0h8454VDYXXvmSu3HIP67q5GD33zpmUqJuw+t
X-Gm-Gg: AY/fxX5QMzMEdPOsSEFhkNWi5k96JSmBsjaHfOm67xOOxGt0ScT84iqNEjFqwV7IIqZ
	dp1P/vQE5KFIKQjE/DtaGuPTr+c6vXvtSGbjGTH2GPgPaEwXbgd4Q+I0wfeX4YBCXABoqOufySi
	QK7ldRqkbUTML+UEhD6dQ4fSbQlkCfqY8fSMU3QpD5yP6nqCprSDUrtLi7S6du8SVUt4ri5PCiY
	aBmP817GAUdvbnTcZuDCB8CmSLdyUS39qVWlx2LX1YKtuo66WqqlJl7XXphSXTD+TKGtJsDDg1k
	kqZudwTZXtxb0Iwk+MHmh4ie3+fmF3C+qN56DAZp9ewlizrv7Z50aFCe7OUiI6OcYPG7EvfMmA7
	JMMlLpprHQFCNumyXk4pfBo3IecXGxJSzT7apnGnDeOTrzpIViZ9swzc+Z1VfzXLFmQ==
X-Received: by 2002:a05:690c:fd2:b0:78f:cbac:51f4 with SMTP id 00721157ae682-78fcbac5d51mr228668877b3.2.1767193451105;
        Wed, 31 Dec 2025 07:04:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZD0JhovC3u04T9aejPVSNFPquL2HuV0SmdMjnlpa/Rn6qMkTE3WoEauL2oZuBHYl8loIfEg==
X-Received: by 2002:a05:690c:fd2:b0:78f:cbac:51f4 with SMTP id 00721157ae682-78fcbac5d51mr228668537b3.2.1767193450561;
        Wed, 31 Dec 2025 07:04:10 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdf3sm3998770966b.12.2025.12.31.07.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 07:04:10 -0800 (PST)
Message-ID: <482fcafe-240f-458b-af56-eed1b19ad19e@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 16:04:07 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251231-mss-v2-0-ae5eafd835c4@mainlining.org>
 <20251231-mss-v2-3-ae5eafd835c4@mainlining.org>
 <e4e94f2c-98f3-414f-bad4-d23f7cce8047@oss.qualcomm.com>
 <12650361d3a0e0444e9e10e26c5d5597@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <12650361d3a0e0444e9e10e26c5d5597@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WElAi3VcX-Z0X2DJWKaT7YAM6j4BTHQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEzMiBTYWx0ZWRfX1yF0A012HREX
 0rsPwWFqqqUFUexHSjDyMvFiaOmoFzPtVtzKvqEQZHNOxFke8yw2nZKl+NECp//EDrUfQNGHoYQ
 M6/iLFhNilPKCZ3Q3V/0zEByhpWKDQ23VAUEo1tvahD6XnW0JB4v7kAZD/rCrfTRCImohR/nOig
 lkuj5X5imGdTERaYRJOmTONtc19oSAay/yOWTmaTfzLdOkNIjOb7CHWGG4xaqoFnct67XuUxULX
 XGpQztyNtYhCkQOCY/6pK0eRMewwPGNhC65TZvQa8dGRWteRZoOGzE/Y2kV+9yd3UjYnAP0tPDb
 7U32QqgQMrwXKuJmgMAWHb+VjJa509sjTGP+SA9MYwVunT2iW6irrI9iU2F/WnoUa6HZkYplVBb
 Kk/x2SWCDZax6gQW2kFXiN5kAW9gigkQkByhUjnz2kkKBX4eiSHI0LZd6xieM4B3X0/tFhJlvK7
 /PZFTOEaCrpHrl0CMVg==
X-Proofpoint-GUID: WElAi3VcX-Z0X2DJWKaT7YAM6j4BTHQ8
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=69553b6b cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=j8Cu_9a8AAAA:8
 a=8VC0GeoxRXGp83daypMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310132

On 12/31/25 3:50 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-12-31 13:27, Konrad Dybcio wrote:
>> On 12/31/25 3:29 AM, Barnabás Czémán wrote:
>>> From: Stephan Gerhold <stephan@gerhold.net>
>>>
>>> Add support for MDM9607 MSS it have different ACC settings
>>> and it needs mitigation for inrush current issue.
>>>
>>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>>> [Reword the commit, add has_ext_bhs_reg]
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>
>> [...]
>>
>>>              val = readl(qproc->reg_base + mem_pwr_ctl);
>>> -            for (; i >= 0; i--) {
>>> +            for (; i >= reverse; i--) {
>>>                  val |= BIT(i);
>>>                  writel(val, qproc->reg_base + mem_pwr_ctl);
>>>                  /*
>>> @@ -833,6 +847,12 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>>                  val |= readl(qproc->reg_base + mem_pwr_ctl);
>>>                  udelay(1);
>>>              }
>>> +            for (i = 0; i < reverse; i++) {
>>> +                val |= BIT(i);
>>> +                writel(val, qproc->reg_base + mem_pwr_ctl);
>>> +                val |= readl(qproc->reg_base + mem_pwr_ctl);
>>
>> Downstream doesn't do val |= readl() in the inrush-current-mitigation
>> case
> I have checked you are right, thanks. 1_8 reset sequence have it but 1_8_inrush_current have not.
> As i understanding from downstream it should be handled in both for loop, i could add an if for
> handle this or implement 1_8_inrush_current reset separately. Which one would be the preferred?

Let's do the latter - there's enough nested 'if's in here already

Konrad
