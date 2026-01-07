Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2CA33DEE5
	for <linux-remoteproc@vger.kernel.org>; Wed,  7 Jan 2026 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792413; cv=none; b=jFfZ8Z0sD4Yo9WFH+RzD3gPXXeK3FSdbZ7wrrPFmygBwGXdOdohU3ib4dzv3I0YStuty8EuaRN5xNED83uLZN0l/BikQqYllqkmo6xiIbFKAliHrN1Nj84vdZr4t19HJFPywZitIZOoN9NJ5fllG+g+2CHW9F8EI0XsNQVVASi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792413; c=relaxed/simple;
	bh=ITopsuYUkhxfdoNI5eU6Gpwic+ZU+ZniQpsYTtfUkt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRI/bq58qyDhQOjDnLNDeT3CaJGf0GjXLNhnMJWMTvdSryoqvHgpIU0ZXQJqwr3zlW2xX4IzAb/shgFsOYuQvvGBF8T0m5hcxWQKLxskHxC7tcI4SPhoIEzCt8PICniLhyEsLgG0cRH0d3XjBavcDza+KK4iqV1c/QzAtnWK+Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FqI3B6Oo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJ/jZCv2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FqI3B6Oo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJ/jZCv2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6078dphI2577888
	for <linux-remoteproc@vger.kernel.org>; Wed, 7 Jan 2026 13:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VizFMj5XFcSi+2EkNf7WJdFzGZWP7NvkaTOs0q4LjUQ=; b=FqI3B6OoMZBa3pEI
	A06kDV7nF5P92konBsUewaU9PKKzMMlqa/Q4P27eiSjIvkEFxS5kU6L1YjjCHBf6
	JRI/a0mQwN481dkWtbgwk585nBUKMGrLNu6CqbWzuuRmZd5BuTnFGAZ+qkRnf246
	usqKxioSvQoKeeV9meV4mWeoG/ELDTQ6ksbpdg41Gb0ijCi9ZvgJ/7zD47c3gARa
	Kvy/B4wiULjfMq1MCCB3enYvv5c98mpSGmlkdlUWmGZiy4SxYqmaklUtQHOnSFRK
	rjQyL7zTt5a10rcMdBNyco3ktI0A9Q3AVf12xiaricGtEcW2E3Hv0ibP5aRuPqmY
	TB4/rQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhm658ubv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jan 2026 13:26:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee05927183so4120371cf.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jan 2026 05:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767792410; x=1768397210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VizFMj5XFcSi+2EkNf7WJdFzGZWP7NvkaTOs0q4LjUQ=;
        b=DJ/jZCv2nyAdc14zdpJbvKHJtcwXdWOtC1z+xBr2hG/I00gxzlVLmQZKjol4YVmAqC
         /xgb8afaZADDiP8lnfAUDscGu9SxeWvBji1Q9BwTSiQyzQeUwCry3ULOC0ee++9L60uO
         jnG20Gyv94iR//7HiYHHWG0IGdn72JVTQ1QWo1zpSwd1eTUtXZWwXO+WbeOF7oTeTobc
         1xIS0LNxT3wl7NlmumaJzMti0xqk70rQ1eQkyeR7Fo2ytgeT01H1bzdZG31mIO8Uhifa
         K3p+7KcBV2GQV63WbE9iAuU66IqRx5/RhWVHvfuMcPgYVE4tLZChXHuiMyt+3Q+gxsxn
         vkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767792410; x=1768397210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VizFMj5XFcSi+2EkNf7WJdFzGZWP7NvkaTOs0q4LjUQ=;
        b=uc9NsXkx0m623C6UNJa5LoTWTzJXUVB/47ugfVCys0T2VAYmL8CmfGImNi94nvksvR
         Kc8ZpUtJghpuq69T1v056nZUcSkPby70NJvj2B+kdXXUZ7achJ8f9n9rQ4CvlWryk5y5
         1ay30SyJKeWw5yUEjq91KC4Ew8YqbR0AiSdLY4WDfRI6/zsPw5GU4ClrTsaDq8259SxB
         LbME685eegrNtLNVYMnO9XvEZqPl9CuQbmSxYS0PI9oFwMzpMsFLqe93km7Ebygdm1X8
         lMwXfNJGeK1masmOdsbVszv082zAQDwsjinDqrVx2H7ac4fY+01lDOJ/y6DuY7Whlzlg
         hqWg==
X-Forwarded-Encrypted: i=1; AJvYcCVMDcW3tYimiKBUaLwAEQrLdH392TBSLgxFuEYwTyUdErkUUeuAwU06A7k37+qnCHFitgP0651PWz7jebYoXXh1@vger.kernel.org
X-Gm-Message-State: AOJu0YxbLlsfJGEa/EEVbL1Rl5ZhwofA5+GawPGAunlzbLEIJyAQfvqu
	sGFcOrx/3bY0ljlTF+pVy8WgfMBtaF7UaYyVM31QKht9k5TlYNfLVIy5CZnShnjsbJHsFHWSkC7
	sjNyAOE6kVDiV5G1lp6o9QoBe5DYcmhhgBKjoEB5vdvyzT1SiiQ7tBYPh0QDfD1WRutLjTRnF
X-Gm-Gg: AY/fxX4uhKzEog/OqwfX/eCJvThrA85EokO4S6mUul0n0p3CJGzzzuWItAKoSBni4rf
	2Xu0G0sYXx1XuHBtHVwnyBkIo4CdFvDsrEMOoR7cxdJmeAEgLOS2IPlHhHQ/29C61ReCHbtzHYc
	lTVZYNOwE+jS8GZSdHzLhgsOfsHePgm74q8b5Ldpj5TxiUpehJ7raEJJH3iQkVM31S6xgowsWrr
	ijUutdUC/3cjeWkUIHgD1SJbmDYG9yI2uGW8LuKNNOSD8cJWmBfZmVqxMx92DNsXqI8/eu9lRMJ
	Zyhs3s1FU8Fj+qT8u2KbHZFOx5w71k1xz7ZKPejU0smfrlSh/GJxmhhjogBW3oE4et5O5b4oBJX
	VUoB3j3hSlBgyw1I/2GoeGArKohf9Ncir8PmaxadKKHv+NvzY1wJRLnbx0l3+zG8PwZE=
X-Received: by 2002:a05:622a:1890:b0:4ec:eec8:e9cb with SMTP id d75a77b69052e-4ffb49f6842mr23647091cf.7.1767792409664;
        Wed, 07 Jan 2026 05:26:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGjBhUEekYMWkWpIOcRMZEhzRF/Qy9U50ASXmG+OeyI0xOleD6j1Ub36UZDw6HYo8RMqGLug==
X-Received: by 2002:a05:622a:1890:b0:4ec:eec8:e9cb with SMTP id d75a77b69052e-4ffb49f6842mr23646721cf.7.1767792408976;
        Wed, 07 Jan 2026 05:26:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5641casm536597366b.64.2026.01.07.05.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 05:26:48 -0800 (PST)
Message-ID: <f9adaaa2-1672-4246-8139-93f9c220530a@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 14:26:46 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
To: mr.nuke.me@gmail.com, andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-6-mr.nuke.me@gmail.com>
 <a14e40b7-b70b-4658-9dee-7e5e6265ad5f@oss.qualcomm.com>
 <12223416.nUPlyArG6x@nukework.gtech>
 <55d70e0b-7a6b-4979-9ae9-4443e54ab584@oss.qualcomm.com>
 <7f6754a4-4a3b-4b6f-9220-a1790a9ba393@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7f6754a4-4a3b-4b6f-9220-a1790a9ba393@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XpL3+FF9 c=1 sm=1 tr=0 ts=695e5f1a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=JhzncoKOK0GyPH2hWLwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: _gQKIQDVGRnVVqvjfS49f_JTMxB22rVh
X-Proofpoint-GUID: _gQKIQDVGRnVVqvjfS49f_JTMxB22rVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwMyBTYWx0ZWRfX23qVFdpGH6Xz
 623VIlJREaEGwDvVaGIfUKRzcn4JDx3xil9QT8acU0zbYsLRe09LpF+vNnaGCGNh/vptm2MFyJY
 Xzn11tg86tXkaokqvGHyFplH3G6Bk4jVqWpMUJMOG0L9/iaiXWAK2wXZJKlUrMhZxE7RAdruzXe
 M4pMHjn6g3HUlpDtO8dQUfr51gbKVJSZDbnd2XG3Qjlzyp9HNzg5lIBSO6nuL5840g3/86h+53V
 YN2BYhBbD+v+JUoa4PtHO81jGsGXlSLn5rrRb9gtwMCpZT1b6W4qUs96a+1SQpAOFUsFHtP3Cot
 vUntnLQU+T+MDXwHxh7oQwzC8ccbGSrA5UNg7iFJvf91NIHLBoQ2IUFIz1byeg8qJDZGbcSMlse
 gEjbyM/NsRlIl+R+Z95+CIuCj4xV2EEMQlL+AoYWzfKPr9p8grrmzJB9wumi/97NJCwsHsdRP8D
 uotRJEmZdtQ/Frj/dSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070103

On 1/5/26 5:09 PM, mr.nuke.me@gmail.com wrote:
> 
> 
> On 12/29/25 6:35 AM, Konrad Dybcio wrote:
>> On 12/23/25 9:21 PM, Alex G. wrote:
>>> On Friday, December 19, 2025 7:20:04 AM CST Konrad Dybcio wrote:
>>>> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
>>>>> Q6 based firmware loading is also present on IPQ9574, when coupled
>>>>> with a wifi-6 device, such as QCN5024. Populate driver data for
>>>>> IPQ9574 with values from the downstream 5.4 kerrnel.
>>>>>
>>>>> Add the new sequences for the WCSS reset and stop. The downstream
>>>>> 5.4 kernel calls these "Q6V7", so keep the name. This is still worth
>>>>> using with the "q6v5" driver because all other parts of the driver
>>>>> can be seamlessly reused.
>>>>>
>>>>> The IPQ9574 uses two sets of clocks. the first, dubbed "q6_clocks"
>>>>> must be enabled before the Q6 is started by writing the Q6SS_RST_EVB
>>>>> register. The second set of clocks, "clks" should only be enabled
>>>>> after the Q6 is placed out of reset. Otherwise, the host CPU core that
>>>>> tries to start the remoteproc will hang.
>>>>>
>>>>> The downstream kernel had a funny comment, "Pray god and wait for
>>>>> reset to complete", which I decided to keep for entertainment value.
>>>>>
>>>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> @@ -128,6 +137,12 @@ struct q6v5_wcss {
>>>>>
>>>>>       struct clk *qdsp6ss_xo_cbcr;
>>>>>       struct clk *qdsp6ss_core_gfmux;
>>>>>       struct clk *lcc_bcr_sleep;
>>>>>
>>>>> +    struct clk_bulk_data *clks;
>>>>> +    /* clocks that must be started before the Q6 is booted */
>>>>> +    struct clk_bulk_data *q6_clks;
>>>>
>>>> "pre_boot_clks" or something along those lines?
>>>
>>> I like "pre_boot_clocks".
>>>
>>>> In general i'm not super stoked to see another platform where manual and
>>>> through-TZ bringup of remoteprocs is supposed to be supported in parallel..
>>>>
>>>> Are you sure your firmware doesn't allow you to just do a simple
>>>> qcom_scm_pas_auth_and_reset() like in the multipd series?
>>>
>>> I am approaching this from the perspective of an aftermarket OS, like OpenWRT.
>>> I don't know if the firmware will do the right thing. I can mitigate this for
>>> OS-loaded firmware, like ath11k 16/m3 firmware, because I can test the driver
>>> and firmware together. I can't do that for bootloader-loaded firmware, so I try
>>> to depend on it as little as possible. I hope that native remoterproc loading
>>> for IPQ9574 will be allowed.
>>
>> These are two parallel questions. I didn't even know that the bootloader
>> preloaded firmware on these platforms (are you sure that's the case?)
>>
>> qcom_scm_pas_auth_and_reset() is usually preceded by qcom_mdt_pas_init() +
>> qcom_mdt_load_no_init() where *you* supply the loadable firmware for the
>> remote processor.
> 
> What I mean is that the init sequence is implemented in the trustzone firmware which is loaded at boot time. Irrespective of what Q6 and M3 firmware I supply, if trustzone doesn't cooperate, I can't start the remoteproc. I don't have that problem when the init sequence is implemented in the kernel.

The TZ will always "cooperate" in the sense that if you supply a valid set of
loadable firmware files and allocate a chunk of memory, it will power up the
remote processors. I wouldn't imagine any software release would have ever
been approved with this not working (given the SCM call is marked available).

It may also be that you have something else in mind, but I didn't quite catch
your concern.

>> The init sequence provided by this interface will be at worst identical to
>> what you're proposing here (except abstracted out), and at best containing
>> some fixes and/or workarounds that may be necessary.
> 
> I think this portrays the TZ path as somehow superior. That's not how things work in my use casee.

Indeed the sequence baked into the TZ is generally to be considered
authoritative.

> The bootloader/FW versions depends on when and who made the device. So while the newest TZ from upstream may have the latest fixes, I have no guarantee that they will be present on a given device at runtime. The best solution I found to get consistent behavior across devices is to do these sequences from the kernel. Is there something incomplete in my init sequence that I can fix?

Because of the complexity of these systems, it's absolutely not inconceivable
that a fix/workaround is only necessary/desired when coupled with a specific
TZ (or other proprietary component, such as RPMh) firmware version (because
many HW settings are co-dependent).

I can not answer your last question.

>  > Please try using PAS and see if that works.
> 
> I found the v6 of the multipd series [1]. It needed some minor adjustments to compile. I went as far as loading the Q6 firmware and starting the remoteproc without error. I did not test any further.

Please give it a shot.

Bjorn, Vignesh, do we see the multipd series going anywhere? It's been
last posted in 2023..

Konrad
