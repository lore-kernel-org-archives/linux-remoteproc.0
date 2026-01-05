Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28F3343D98
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jan 2026 18:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767636009; cv=none; b=phmVf2vWta8OPXY+ZRLQ03gtpsddI3PoxFurtJFh1zP49RUSatohbITAHNLA20KtmlvcRrWP69oaFc6HvQ6gW8uteko6KFJDkoItOQjc0RxuGtlYkwlU9gbYC6U8f56ISIzJg687i3jbHILJ7r9YOhlaVJx/vFFjl9yOLN+Sl1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767636009; c=relaxed/simple;
	bh=5/19OY6eZY8CTI1TjSHvmJQ6WXrakW3nS1Hjc8j58LI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekfcBhLZYUmZIAu9IFwCuxYUtWPwIlDQMPfPtY+33AFZrTN2WmCpOcE8rtWHK2I7JNUZdOI2rTpXr/WBCztieJ8YNcQOzMmk07mbNQgC49cvQryAoP3RSuUYHiAdNfPrFbasb9xGWxQP1v/EsPSrPloVeMxoSr+ADfXCbX7YrPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TN1IOeCF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ro7Y1+4j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TN1IOeCF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ro7Y1+4j"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605FKfl31751808
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Jan 2026 18:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZOJPN/yb0Ckwc+93wrH09JVZmpZlHivpeL60KoebF0=; b=TN1IOeCFX9A9463X
	tDJ5gw58saPQGS4s0wH/Ncwde2y4GhNdxoZDzfCVUm4XvhsA1QcPLG18AwKUV0WN
	tYCDdu7J7xQ7zaGgUBB801BZi8BRQUJhf+j2ISv0qItsWTEP/DnsghjjAngoir8d
	8jMWZ/l8vTdkDEOnI4uBqvA1MK/5DBoVRgMwkjdkW9I7LLaFAcM7a8h2vYcIiokt
	J0Pc2cID1nmzqJAphVofDou2UstvWOL4eFE28uP6rVqq+Cs1t8kwg+aLyi8EiR9L
	e7i1nBSylOpCuyefBsVJGH71QBzxtNdWatIrYCBZlJeKijpyrko1TZ6+L6ZpPzdi
	sAWmCA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv00fdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 18:00:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c196fa94049so1181954a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 10:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767636006; x=1768240806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zZOJPN/yb0Ckwc+93wrH09JVZmpZlHivpeL60KoebF0=;
        b=Ro7Y1+4jn8c3/c48v3SPdBr7+8jspK8Pu5fVe+C5Iox/kvDuBn5Pt92fXkE8ZKPxFV
         CJi6SKXpQ8qumSSXgqfVApr4Dc2Lpl99T5ebDrsY9hs+ZZP6DdcPRgqJPCkTmkxsDvHG
         9GPt0uTe8RWnsmTntGlFcYq9d2EgFtpEyBpE7/1WjmTF2v+21VGO93Lhav2hUDgbuaN2
         NeyM9vZxA5zo9sJy+ypgZF/XPxs8T5zjfRS/CSd633bzP4+arssn+GwyAjwPfB2aR7Hy
         oJncp48zat6KQ5Dgm/5PY4uMw3CmnhjtRQcMUB/lgARMPgo9udUN32tM62uXOB4ipk5v
         zGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767636006; x=1768240806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZOJPN/yb0Ckwc+93wrH09JVZmpZlHivpeL60KoebF0=;
        b=VeVFtrJ/W460WbCNtc0qgbKQRZVJ80vwqN6f0WXcSH5krGfL/mOQuFaQt/m9oCNU0a
         aZLtlpEX9NaEd8mo6dX/ruzPj6HoM3bZOzaV9AvmXn4Wd4JneEOY3L34R+Rs36QbVtxt
         kJK8hXdAiXpaYL/U476cEFVjyp1MmSpWgixlu80aXLO//AJW/IhoyQ5PYlBoKazYczPs
         mWDroNuqmTzcl+3iJly4fAy64mjQ/mBJcQVZG79CH1qbznmW7ob//QzG9tAYM3wt54Wv
         dR44VN5qb6CZSiKB8SR9DVlrG1DTPVAhyB06O2iziMYMPZ3+6+IQji6bd3qfGhf+ylhI
         hd4w==
X-Forwarded-Encrypted: i=1; AJvYcCUl41q2YGW+xbPgUsM+sD1kxLWbMBcIbbYRNAqhpZ3bvadIoMtCYeIEeUJ91TJ9I0NagNe07vA1VL/9QaYJQ8nR@vger.kernel.org
X-Gm-Message-State: AOJu0Yys4T4ZdpV732xk+ZH9YZ+gnYJA1Zsub5VXxJwwErUwJ/PE3NEX
	6LbeU/iu/QD6Yet+k3FjnpXYXF2J2YspmebdIjQJy4CzhM4EagWjHFxgqbgxAhqLSND5W/N3c4o
	rGtkLSD6DeSJ+UYZIWBFNIQTpcGs2ZZZlWYFRRcH/2cC6YVwmDML3oOPaNJ5frig3DQaig8Yv
X-Gm-Gg: AY/fxX7GK8imf9XXUmFJzaJ9tYZ7olaFWRk+k/NYO3FKQ1tMONlXtVTPfV9OisQLkkk
	7pkgfVRQVEsgmWs8kK38g0dAEhryKpAf/UPYtPJ/KPhiW4XmPRUj60Q4jTqskfQYhcSltySDE08
	c0rrP+2/bT9caUPBcgVmN2qwMuIxIYRGzIgPsfpE2cwCVPm7Hx6BWeWh5RdI9sNOyt9VtxRm8tA
	6kqgUBKKmdUDo4ryVZgGPotlLDnVm4obL5peW6Q/XFaKWzzchh9nz0aC5Ne+4JmXxADJXrAqlV8
	3ArG4q/MtBerVFI+fLgEXhBPW0LOmQoScEMWjCsFNrFqOgxWynEsTeRAj0+Hp1ptKjmS+xUJ0Pz
	aGgl/oaOK3A6yDN/xz/Aq1lnmTTQ9mPcKc0tvxq3cg1G0yEaB/A==
X-Received: by 2002:a17:90b:3b4f:b0:32e:8ff9:d124 with SMTP id 98e67ed59e1d1-34f5f8b4f02mr7964a91.15.1767636005569;
        Mon, 05 Jan 2026 10:00:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXnFzNWl9jnWzXu1wXVFqUFevFHXlW2JypT3YQ0urh+Ea5xHWLmn/4yUAoYuZeO8boIXKu1Q==
X-Received: by 2002:a17:90b:3b4f:b0:32e:8ff9:d124 with SMTP id 98e67ed59e1d1-34f5f8b4f02mr7929a91.15.1767636004925;
        Mon, 05 Jan 2026 10:00:04 -0800 (PST)
Received: from [192.168.0.107] ([183.82.31.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b1922sm15402a91.4.2026.01.05.10.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 10:00:04 -0800 (PST)
Message-ID: <6d48473e-2c00-4d3a-ab9f-338761db33d2@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 23:30:00 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
To: mr.nuke.me@gmail.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        andersson@kernel.org, jeff.johnson@oss.qualcomm.com
Cc: mathieu.poirier@linaro.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-7-mr.nuke.me@gmail.com>
 <5b9cd24e-7eae-4cbb-b013-6ef135902ae7@oss.qualcomm.com>
 <5116928.iIbC2pHGDl@nukework.gtech>
 <4e21205e-0b09-496e-9d6f-9fe2c327c13a@oss.qualcomm.com>
 <7d5be110-c605-4a02-8121-1c4cb2571bb8@gmail.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <7d5be110-c605-4a02-8121-1c4cb2571bb8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695bfc26 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=V6Ol1F/91haf34TWKFX4Fg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=SWP3IsI89bYa406iQT8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: PXilHG9_dT2sLPAT0vnCd08pKJhtc6ae
X-Proofpoint-ORIG-GUID: PXilHG9_dT2sLPAT0vnCd08pKJhtc6ae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE1NiBTYWx0ZWRfX/GnU2npTF4Dl
 YQrlCty6hAJNHs1wZ2O/wDKh65p0/e1nozEIIqB2A+8v0bdGnEvrrpM8d36arIcPUGARzETBYYx
 eex8AYc1iuUOmRvmQjiN9+B0z7bz1XFaZEcPf6ijoPTIU23WuLGa4G4kmuro8bHOSwFEuJ8t11I
 NVHkac94udc7MkdTm2p9eGFOVGDbkwKiMAnmu7uM50ICRK2jnZsMMMJL4oSQBJazqokWxIfVWua
 vEE67xB91A5A32ww7+amm5J3D5WjVufMP+Wa8quXTKmA+d6H8c3TQjCN+awxqDhn67XcXjBeMbN
 llV3bmmr9gkcGypItefRdQJSZb2J6WtCfIN4hFgVhXRdIBeu29ZiKqbMnTxXqNqGdfI2263X/ij
 UkTaoZyPWiFjScoDTREHzSbcXvkTh7nVZPIGyIW8wtjvbogxzSiNbtCrzatWd4uVS7Ko3pCSrIz
 kquIXBVUXzDZS7rBXKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050156



On 1/5/2026 8:53 PM, mr.nuke.me@gmail.com wrote:
> 
> 
> On 12/29/25 6:37 AM, Konrad Dybcio wrote:
>> On 12/23/25 9:35 PM, Alex G. wrote:
>>> On Friday, December 19, 2025 7:29:07 AM CST Konrad Dybcio wrote:
>>>> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
>>>>> IPQ8074, IPQ6018, and IPQ9574 support an m3 firmware image in addtion
>>>>> to the q6 firmware. The firmware releases from qcom provide both q6
>>>>> and m3 firmware for these SoCs. Support loading the m3 firmware image.
>>>>>
>>>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>>>> ---
>>
>> [...]
>>
>>>>> +static int q6v5_wcss_load_aux(struct q6v5_wcss *wcss, const char
>>>>> *fw_name)
>>>>> +{
>>>>> +    const struct firmware *extra_fw;
>>>>> +    int ret;
>>>>> +
>>>>> +    dev_info(wcss->dev, "loading additional firmware image %s\n",
>>> fw_name);
>>
>> Your email client is messing up the reply context - if it happens to
>> be Thunderbird, set:
>>
>> mailnews.wraplength = 0
>> mailnews.send_plaintext_flowed = false
>>
>> in the config
> 
> Oops.
>>>>
>>>> I don't think this log line is useful beyond development
>>>
>>> Remoteproc driver prints the main (q6) fimrware name, so I thought it would be
>>> prudent to print the names of any additional firmwares:
>>>
>>>      remoteproc remoteproc0: Booting fw image IPQ9574/q6_fw.mdt, size 8140
>>>
>>>>> +
>>>>> +    ret = request_firmware(&extra_fw, fw_name, wcss->dev);
>>>>> +    if (ret)
>>>>> +        return 0;
>>>>
>>>> return ret, perhaps? Unless you want to say that "it's fine if the M3 image
>>>> is missing, particularly not to impose any new requirements on existing
>>>> setups". But you haven't spelt that out explicitly.
>>>
>>> I intended to not abort when aux firmware is missing. Maybe the better way to
>>> handle this is to check for "-ENOENT" in the caller instead of return 0 here.
>>>
>>>> You also haven't provided an explanation as to why the firmware should be
>>>> loaded. Is it necessary for some functionality? Is it that case on the
>>>> newly-supported IPQ9574?
>>>
>>> I don't have a good answer. I reasoned that since the qcom provides it [1],
>>> the M3 firmware would need to be loaded. I haven't done much testing without
>>> it.
>>
>> Well, could you please try?
>>
>> IIRC it was strictly necessary for ATH1xk-on-PCIe so I'm assuming it's going
>> to be a necessity here as well
> 
> I tried this without the M3 firmware, and I don't see a measurable difference in normal operation. I only tested AP mode briefly. How can I know for sure if the M3 firmware is needed or not?

AFAIK, M3 Firmware is required for an underlying sub-processor which is used
by the Wi-Fi subsystem.

Hi Jeff,

Is there any upstream facing documentation on the need for M3 Firmware ?

Thanks,
Vignesh


> 
> Alex
> 

