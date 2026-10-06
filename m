Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487B6380FD5
	for <linux-remoteproc@vger.kernel.org>; Tue,  6 Oct 2026 05:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264221; cv=none; b=K/IcH7BxPh/V1Y4u7+MTNptlCwDUK4WgEo065MezdcEYLCptrtqyhOrQVFBIYp7jt55hxRtKjOzGJF97tyW8Y8ORyCjOwSlfHu88sjf2Pu1neIvhDiwK9nHnY3Zn+ImNVP4uENnX2WxUXNN3w+6+8YwvYp/612Tx3B7CBQ+ZfIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264221; c=relaxed/simple;
	bh=E28nbQgqNT6eAZqQjPNHdMAXt5n2H4GPJAEe9+d1Zuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3lGn2IxlPHG2HCuUsd5AZi0r8jbeFUQc1JQ9Nb6QuNGPr5LAFl67gZdIaMLLzDfZCU+c3o98+tGjpMtnxaQ3viyEFnJF5xtoSK48KCSowvp16eWwI2mwF+fFXncaJPIdCEEs9t8+bSvIAMj2JWk+OgD/CUcMq77JyNu57F1YKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gyz4MFDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=He98gYv4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gyz4MFDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="He98gYv4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963AWEN093810
	for <linux-remoteproc@vger.kernel.org>; Tue, 6 Oct 2026 05:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aZcIf55e7eBViEOkoMT+Tua7zi6iA4F2rHSQekpq7+8=; b=Gyz4MFDUXrYL7UGE
	QihzcOMNKWfDEVjm6a1p4ZPA+5hS605aNf7jUKlkhOYeFao8V1WJ5TDm3FzH5ACP
	gX5xDrl4DFk2g56BoXCs/o/TXj7rHaF9tI3PsrwqIWo6YxBbpIoLi0HgjTUe99Yw
	vG9QaYqGPt6EJA7cNwuk8p1DaYZ4ygT1Tsy8O9jn5hwAuGUKhvrJzpzrZLCwP75L
	LXPon8W6NZg2oqG8PW6H5He0B83d3wJf4OYJBGdqlTzzPsP/x2ac7th/jjI3CV6p
	u3KDQxFer63n44xFILRwNTh4bpln2Rw4zJQXXPdeGkFPSsVla42JxQY7WtpkCal3
	RyFXPA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvuqvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 06 Oct 2026 05:23:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e2d3a3ff86so36642815ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 22:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791264218; x=1791869018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aZcIf55e7eBViEOkoMT+Tua7zi6iA4F2rHSQekpq7+8=;
        b=He98gYv4oMiqd8AG0La0EDzchaC4R2Eef1NNGJ5YkLLffaTISNlVDX1fYTKTWO5GdR
         /Tt6yIdLIJOVwkxkkpNS60bcPYmqx3ydYwADqXexCnsVWaMBGMB1UCKarcPJHEMYaaUg
         kPuu4zyKEtdjXYnKV7wW9JCEMtojwiVXqfldrRY/cyOv7huKlwYnK+hRCo4VXxiwa3Kk
         gbfsQ4GCDTm7DDP17XpPst95RtvQHAo5Rw1ZMO/gzBr1PW/pJlJ6XIb6zqQdiuk6BpB2
         Nyxr4vrIPxysCkBiQRvVVRXN+rEEk1jTn1ONh2c6QKZGexrgnZkkWjh4diBL8FD3urX/
         EPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264218; x=1791869018;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aZcIf55e7eBViEOkoMT+Tua7zi6iA4F2rHSQekpq7+8=;
        b=RHt2esNpaRFaSyGfJ+Rd242ybCGM+bA9NiVXsEcrM7KCQGXGOsZzSrZ4a0EPYf0aRO
         EMjQ7UJO9uYuTCZ+LWEVnRY8DWEVt1sJmLWgE3x2/v7irbTIDRb3fd3qoTg1K1aaUE4d
         +vt9VUI6W1TNT3F8Se6iI27vGnGtIOB1DDqdPwUNCiLpEnPCKvUPA9omT4VvkkXnsr0K
         ng/avgc7CeipamUR7/7mb+W470DpYlc9Pv7E125pmnsXx1OhfihLC2e8+WoHBnXVW01F
         MkrbksvvxLfPDUTptXmMOSY8mw0T6yHZcJUlxnbR3/qBe2XR/yizGDYuHsrhm6tQN510
         UDBg==
X-Forwarded-Encrypted: i=1; AKwUvBy6C+WDYFHHfpYUoYFOJNKwoagtoEyvy5OpO6QpcdmTGpUjJy+i6LtHHrUOc/VNfQM/4eK7uCIfXpVmTcIrUyM8@vger.kernel.org
X-Gm-Message-State: AFq9FYIBX9wNZ74SAlfFUN3x0utcAlrQAnZ64U5/T0EMqLqgvPwn3xW+
	5y2kbtYAY3znKbBZewin6Ay5jeHRFQNPr4UKV+gqhHWVpOw1+E51Z6aBDVdYgwE+kuyuHnZW3C/
	1xnOaXWlguPapVVIDiMidqWyhTNtUjMtkrfmp/N9lPNpRIg/aZz/d3j7msmDfCga6RQr0kyy/
X-Gm-Gg: AYBFou2t71XXDzWb+IY36mIZTPr5RUOAWTDV/Wxf5ss7QvzwvUfDvFaEw+hGBosReLi
	E4Tx5Mi6bP+c9JKIWDa0N6emz9v28mzOsjeOA/hTML+ArN9Z77kld1vt/UFVFSvNOLTJ7XCxzR1
	OPYu+OqkfHvnOuqW8Wj01U6uMfjPcRKurVHLEuXU/5bXY6IXtyWNDIeKSV+FJ8ACIzTdDGuWceu
	mYoTPb6mMvUWPqntj/cR3wspQef1f+PI9UoHF2TLHf5nNiNA9VkZS+/9SBMaKd7t+53UQajlqKI
	AVbDSKMUUoNvUHUfUl+eE0sShJ5I3NdJQ8e19iClGvsclxhIGTqjcdRKsom+GVl0hF8ePHCPPNy
	lPoQBnkom8arO5y4RfiwIQyGlBg==
X-Received: by 2002:a17:903:41c8:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2e5dccf67aamr3862745ad.5.1791264217879;
        Mon, 05 Oct 2026 22:23:37 -0700 (PDT)
X-Received: by 2002:a17:903:41c8:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2e5dccf67aamr3862655ad.5.1791264217355;
        Mon, 05 Oct 2026 22:23:37 -0700 (PDT)
Received: from [10.218.26.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a55b6310sm16451195ad.3.2026.10.05.22.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 22:23:36 -0700 (PDT)
Message-ID: <2204cc64-d110-41f0-85be-7e6e1db79a1d@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 10:53:31 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: pas: pass no resource table when the
 firmware has none
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
        konrad.dybcio@oss.qualcomm.com, sumit.garg@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
 <20261005161224.umj6zzov57tifv7v@hu-mojha-hyd.qualcomm.com>
 <asQQJNOd_p9acgT1@RAMIREZO.na.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <asQQJNOd_p9acgT1@RAMIREZO.na.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac485da cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=aG4ZktMyB6JXbPI0YBQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: Ohlv8yiZEmaNXegdl00-5Skbrp8xehZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX/8Y8Cg4QNUoI
 EG+j5hu/+InCpoXXAlmSuJcOVVKKk0n0IEED3VcMpgowh1tqiSRDU0G7tiAlaMhRJ5LAHFiJ8+6
 prYP0RkDO2dBGFiLH99p0TUIiAAK7NjNXA+BKBX0EseZCZwnyMvZ0/PlZCL5VFyOtFyOUybd8o9
 pfFtziacjEsMf9z0Opsho64i3I1+0+kh3mKz5G3O8PzGhPvJAwgOHOh/RTztbiXx6CtWPjxkfJ5
 RdK2uzGmauFTNnlxnUDAc/Mwa4DRXlg8OgNlCjeeFNjQcYwmVXZxDHGxBHMlru0Vi32s0yWwlXN
 pmR19bj8jhONGZ9YJJoAiwO7kjpYgm714ZaTjWnP9YKoy5MJMrwAz0KIganRzOWRGs3iS8+vqPd
 f08J7LflWurPbZJRRCnuZ10Jg+ST7R5fCJz3EnqEn+71sCrIXY2nzNBUt8qdeX54I6M7BvWh5YC
 jKpCHj0ak9oG7tiuz7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX/ymSnEjauwlG
 ut56SpQtqEEdw/dfvjNTv81Pc1N4Qx1dIWMTauQ8kuUz8JRAK5pUVzfN8sAlujDSkbzkRJLJ8os
 tNkfXPGE8xeMo7zpCstA43jVeTIMSHg=
X-Proofpoint-ORIG-GUID: Ohlv8yiZEmaNXegdl00-5Skbrp8xehZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060021

Hi Jorge,

On 06-10-2026 02:31 am, Jorge Ramirez wrote:
> On 05/10/26 21:42:24, Mukesh Ojha wrote:
>> On Mon, Oct 05, 2026 at 02:54:00PM +0200, Jorge Ramirez-Ortiz wrote:
>>> The firmware resource table is passed to the PAS backend even when the
>>> firmware carries none. This only works on the first boot, while the
>>> cached pointer and its size are both zero.
>>>
>>> Stopping the remote processor, or failing to start it, frees the cached
>>> table and clears the pointer but leaves the size set. The next start
>>> then pairs a NULL table with a non-zero size.
>>>
>>> The SCM backend substitutes an empty table and hides the problem. The
>>> TEE backend copies from the NULL pointer:
>>>
>>>   remoteproc remoteproc2: powering up cdsp
>>>   pc : __pi_memcpy_generic+0x110/0x22c
>>>   lr : qcom_pas_tee_get_rsc_table+0xf4/0x25c
>>>   Call trace:
>>>    __pi_memcpy_generic+0x110/0x22c (P)
>>>    qcom_pas_get_rsc_table+0x38/0x60
>>>    qcom_pas_parse_firmware+0xa0/0x100
>>>    rproc_boot+0x2d4/0x380
>>>    state_store+0x40/0x100
>>>
>>> Fixes: a4584bff63c8 ("remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call")
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>

Thanks for this patch, I was about to send one myself since I observed
this on IQ10 as well.

>>> ---
>>>  drivers/remoteproc/qcom_q6v5_pas.c | 11 ++++++-----
>>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>>> index a005546c265d..e871e03ba794 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>>> @@ -463,7 +463,7 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
>>>  	struct resource_table *table = NULL;
>>>  	size_t output_rt_size;
>>>  	void *output_rt;
>>> -	size_t table_sz;
>>> +	size_t table_sz = 0;
>>>  	int ret;
>>>  
>>>  	ret = qcom_register_dump_segments(rproc, fw);
>>> @@ -476,11 +476,12 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
>>>  		return 0;
>>>  
>>>  	ret = rproc_elf_load_rsc_table(rproc, fw);
>>> -	if (ret)
>>> +	if (ret) {
>>>  		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
>>> -
>>> -	table = rproc->table_ptr;
>>> -	table_sz = rproc->table_sz;
>>> +	} else {
>>> +		table = rproc->table_ptr;
>>> +		table_sz = rproc->table_sz;
>>> +	}
>>
>>
>> Earlier code was intentional please read the comment below.. /**...*/
>>
> 
> AFAICS the comments say that the call might pass NULL and zero as input
> resources. And this patch does exactly that - it doesnt allow NULL and
> non-zero.
>

I agree with this fix, it was strange to see a NULL pointer paired with non-zero table size.
As the comment itself says, a NULL pointer + 0 size should be passed when the firmware binary
does not have a resource table. This is also documented here in a separate comment:
https://elixir.bootlin.com/linux/v7.3-rc5/source/drivers/firmware/qcom/qcom_pas.c#L131

I am validating this fix for Nord, expect a Tested-by tag from me today.

Regards,
Harshal 
> did I miss something?



