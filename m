Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832E534AAE9
	for <linux-remoteproc@vger.kernel.org>; Wed,  7 Jan 2026 18:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767810333; cv=none; b=Gx/rteEh9mD9mZK+hkBR4rJQUFi3EREKuhHjrhmboI571JfUpZtT8yc7UYbSruZhKDSv8KESK7vvFVC5ya4/avhlgYNC6SzKwiIOYMTiofwsuep3nt8JTMhRS02xJ2eAcOU5lMdd1txpX+7DZu55T1ZvXJKcFGljYavpqP9pKhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767810333; c=relaxed/simple;
	bh=vmHz7AdKXekh6B5BnPe/pPGBiGFpwRkvtASFzJtYyv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sf40p7aww6ZOQRVHmlwYkFef3/hnW8JtRIrMBzMg6NqRRtmpYQazo6xv00GAv9GfeER9NcaR0aVzOBrjUhh2HaOuDiIA5jvqHqKN6x2m14lxwF2UVxqcFaxH+ttqjyfPHvg6or33eBrFtPm+MFtUZ4DI6FA4HBqyVPYglTc58HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aTpEgJXx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+dZ+r6+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aTpEgJXx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+dZ+r6+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607H5ktL2454339
	for <linux-remoteproc@vger.kernel.org>; Wed, 7 Jan 2026 18:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zyEta6qSo9ogUjLix7zMK7X4kwhSaxFV32Ej4UwDIGI=; b=aTpEgJXxl9iktJw2
	fDoHW5+B3jzEDw0DfJu+BqTBh8xUtatlb2uynSgTFYj46Z5JlxcoyUgrMC9Ls2wE
	vinFZhtoFeInearVCB9qnfQPSURxHnROpDG2bZY+8pzmwiPdHD0G/CCyfBk5wZAz
	5abHiMnRCdFxhfAz9gNYLufMAekPMyIusgcPIxgv5gM+cSYh4yltWbbIrpKjAiks
	/cNY4z8z+4KR8RFX7l5jJ+jZ3zMhCusRWQ8kSA3dUaBfaypdb0INohCaIa3AITGH
	5FPFkxNzzwdizIvFUxMB0DSd6M0xWsvBNd+K0xmSCUvUZZpsN7DmoFtymAgU9IhP
	z0HFZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbhqse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jan 2026 18:25:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0d59f0198so26600995ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jan 2026 10:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767810322; x=1768415122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zyEta6qSo9ogUjLix7zMK7X4kwhSaxFV32Ej4UwDIGI=;
        b=N+dZ+r6+1/3Rmx5g/8pyDjKX4nX9VLXttzt/WbVq7zTechXCNNui6EkJM+oC7xVDy2
         dc20+wzVY/HE38Uu/cFYLsHYgBgwjbcUBjMgkbbx6uwwzgp7VL5xLMfbYm3P+P2nALMt
         Kk0Yd38lLOP3E3agocH5cza96EGFPlzIHAANlopUQnA4R5yrVSpbsWir2QW0Zpl3V67E
         kut10JNU4oiitiGpd53jdXR0ZmLXAoVSenlApnUW/oA4FBr+Vv5qADTltLh6DX2FgSRM
         vh0lgy3mucL/6/DAl0CsBXznjwGoouSjw7Sg/a7cyXqlxaxl3Hf8Koq64OMhRoHEDMUE
         Kx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767810322; x=1768415122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyEta6qSo9ogUjLix7zMK7X4kwhSaxFV32Ej4UwDIGI=;
        b=AAJoDmZwZbEmwRClEvwAK8NkuXLx/lzU9kmvHqgl9LonvYphJlzGMFlSoVLJS8+4jf
         NppRHZxdx5dLNhHkQGUzIP+Tbl0jn50wGCrLSDfjQK8JCPutbZqAKcvZ8KsiLnpKgmHm
         6TwbKYyfe74nlR2FJiMSXkv0NZwfb8xP1L4gQuo4WAVPRXvgWzs9U+ZqGWPOZ9p1tZ1F
         LKZXg5FTYDBWFEmzLRLO6cDSgio1CYuu1Za/g1j+dTaEv8JmCw2JgPRlB2ieVNNQ1SGs
         /Cw+T39VxBuKfaUz9iaxw+aFklWV8RF9HBgae6RVcq1OxDM3JUbRLpdxZfTnNgN//46x
         Mq2A==
X-Forwarded-Encrypted: i=1; AJvYcCVBQ9D2bSexbRw9LJSyskkfexEPNQBPAHiPvkaMm+/9ZIBVOi+pSFy0qCZ2LxguwL5hNcRti/pHCuaXpDlde14m@vger.kernel.org
X-Gm-Message-State: AOJu0YwL00tq64t0Oc9vQuenuxsv+nDy3Q0HVD2mab/kFSbmuU/ACS3k
	oV700eQpJq637lVh8/O4l/YVcwQBl/dfXB4r9RyaIVy7qkML52+PI3yxZ8J9QPoyFL4TS+kxfRq
	XtgM3g8I0y26IWoblDKyxIac9K8fCcnQCIflGOwFxSm2QH8N18TzyVYvwYTDMOrQNMasrMH88
X-Gm-Gg: AY/fxX668zd0NoxQ8lXasglJ0cdEp6pkSyr67eNHz7TFqFB6AG0al+zR3rNQAAvkLeo
	KYqquM75wXX52v6Swba1F93xRcj5ToUTNc1+/zNlnuY/+D9SIN1xPGVpd23OGKShh3VK39D0eKW
	EUaxjRnCqJ6JI6WJDZZajTDYqLTt28kAtFXOmZg417NjIYcbEWEqJJ5JjP1JdsR9ErWO+CWNrOx
	nII0enH65pOKr4v+s9BGizGVNBK+L1KWlNpvPyWl9DcKjdvZ5CStBHIEUDfKlGG3nDeWqXgJ3Ed
	hV0jg7vA9oEpopqt/ZrC1Apr+2TS/xW6dixJZiA2hbwoIWcedeW+mpkZX6Yd4IYFIgzmnzkxus2
	hxWzjU+ElO29Z2etriXgk0+kFZb/7XSXrl02NJJ1bWut3TuBH4w==
X-Received: by 2002:a17:902:db11:b0:2a3:bf5f:926b with SMTP id d9443c01a7336-2a3ee4c2efbmr33516545ad.47.1767810321467;
        Wed, 07 Jan 2026 10:25:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfHrr8KjmgskM6tzkI1fufrRVJjhzck7KWftUvD8noNaTImoMFpsm27QF6u/kaeY+q/8yS6Q==
X-Received: by 2002:a17:902:db11:b0:2a3:bf5f:926b with SMTP id d9443c01a7336-2a3ee4c2efbmr33516275ad.47.1767810320858;
        Wed, 07 Jan 2026 10:25:20 -0800 (PST)
Received: from [192.168.0.109] ([183.82.31.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c5ce06sm56105135ad.44.2026.01.07.10.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 10:25:20 -0800 (PST)
Message-ID: <21468f66-56df-43ea-99c2-7257d8d6bb7c@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 23:55:16 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, mr.nuke.me@gmail.com,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-kernel@vger.kernel.org
Cc: krzk+dt@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        varadarajan.narayanan@oss.qualcomm.com
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-6-mr.nuke.me@gmail.com>
 <a14e40b7-b70b-4658-9dee-7e5e6265ad5f@oss.qualcomm.com>
 <12223416.nUPlyArG6x@nukework.gtech>
 <55d70e0b-7a6b-4979-9ae9-4443e54ab584@oss.qualcomm.com>
 <7f6754a4-4a3b-4b6f-9220-a1790a9ba393@gmail.com>
 <f9adaaa2-1672-4246-8139-93f9c220530a@oss.qualcomm.com>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <f9adaaa2-1672-4246-8139-93f9c220530a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NSBTYWx0ZWRfXz366bK57+oCM
 7cmITLkzUMIoWKeiaEJtZU+wPc1Ziao4nD+OnwsfWFQ6nrxYaGC6oCeI3eb+AoMxzyOQYj2CABf
 0jBhuqB5HZj4xrOF0pSp+AQBAzo3JaRTK09GPKevCepEhAgerUFDlnTycdBTd0VColfO+w6oL7N
 vKRzvl2LySjqOlTQh+tNeQXqJFAsLlVrJSavaDE2NNzsUw7s3USc/twUw9lA1iDljoEfFOhlH0I
 m0WCTN2X0vPYkP1pHsf+nHdZ9/RZqKSnrSRLsm9G/PhPeHy3saa0t/6UFXwKhFnC3cSlHQ+sLI8
 UjYNz/8pUURBGvkN5wctYddOWMrQPwH6DOYOauef/aeTkWe50yQXWRpH1rOhV31Yyy4oAOfXO9H
 46QjlqehWdyjfmSbBbihOyvBTWBRR6U/ka2fU7o1snjRESCR8UlAhYJGeth7SkpRrBHk+yoUUi0
 XypkYVBcZM5E4JLWqeQ==
X-Proofpoint-GUID: gaLG-8kJL7mz-eGx5jI0EJZM8weqHX0N
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695ea512 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=V6Ol1F/91haf34TWKFX4Fg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=-gmn0QAXPwOg_dpREwIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: gaLG-8kJL7mz-eGx5jI0EJZM8weqHX0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070145



On 1/7/2026 6:56 PM, Konrad Dybcio wrote:
> On 1/5/26 5:09 PM, mr.nuke.me@gmail.com wrote:
>>
>>
>> On 12/29/25 6:35 AM, Konrad Dybcio wrote:
>>> On 12/23/25 9:21 PM, Alex G. wrote:
>>>> On Friday, December 19, 2025 7:20:04 AM CST Konrad Dybcio wrote:
>>>>> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
>>>>>> Q6 based firmware loading is also present on IPQ9574, when coupled
>>>>>> with a wifi-6 device, such as QCN5024. Populate driver data for
>>>>>> IPQ9574 with values from the downstream 5.4 kerrnel.
>>>>>>
>>>>>> Add the new sequences for the WCSS reset and stop. The downstream
>>>>>> 5.4 kernel calls these "Q6V7", so keep the name. This is still worth
>>>>>> using with the "q6v5" driver because all other parts of the driver
>>>>>> can be seamlessly reused.
>>>>>>
>>>>>> The IPQ9574 uses two sets of clocks. the first, dubbed "q6_clocks"
>>>>>> must be enabled before the Q6 is started by writing the Q6SS_RST_EVB
>>>>>> register. The second set of clocks, "clks" should only be enabled
>>>>>> after the Q6 is placed out of reset. Otherwise, the host CPU core that
>>>>>> tries to start the remoteproc will hang.
>>>>>>
>>>>>> The downstream kernel had a funny comment, "Pray god and wait for
>>>>>> reset to complete", which I decided to keep for entertainment value.
>>>>>>
>>>>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> @@ -128,6 +137,12 @@ struct q6v5_wcss {
>>>>>>
>>>>>>       struct clk *qdsp6ss_xo_cbcr;
>>>>>>       struct clk *qdsp6ss_core_gfmux;
>>>>>>       struct clk *lcc_bcr_sleep;
>>>>>>
>>>>>> +    struct clk_bulk_data *clks;
>>>>>> +    /* clocks that must be started before the Q6 is booted */
>>>>>> +    struct clk_bulk_data *q6_clks;
>>>>>
>>>>> "pre_boot_clks" or something along those lines?
>>>>
>>>> I like "pre_boot_clocks".
>>>>
>>>>> In general i'm not super stoked to see another platform where manual and
>>>>> through-TZ bringup of remoteprocs is supposed to be supported in parallel..
>>>>>
>>>>> Are you sure your firmware doesn't allow you to just do a simple
>>>>> qcom_scm_pas_auth_and_reset() like in the multipd series?
>>>>
>>>> I am approaching this from the perspective of an aftermarket OS, like OpenWRT.
>>>> I don't know if the firmware will do the right thing. I can mitigate this for
>>>> OS-loaded firmware, like ath11k 16/m3 firmware, because I can test the driver
>>>> and firmware together. I can't do that for bootloader-loaded firmware, so I try
>>>> to depend on it as little as possible. I hope that native remoterproc loading
>>>> for IPQ9574 will be allowed.
>>>
>>> These are two parallel questions. I didn't even know that the bootloader
>>> preloaded firmware on these platforms (are you sure that's the case?)
>>>
>>> qcom_scm_pas_auth_and_reset() is usually preceded by qcom_mdt_pas_init() +
>>> qcom_mdt_load_no_init() where *you* supply the loadable firmware for the
>>> remote processor.
>>
>> What I mean is that the init sequence is implemented in the trustzone firmware which is loaded at boot time. Irrespective of what Q6 and M3 firmware I supply, if trustzone doesn't cooperate, I can't start the remoteproc. I don't have that problem when the init sequence is implemented in the kernel.
> 
> The TZ will always "cooperate" in the sense that if you supply a valid set of
> loadable firmware files and allocate a chunk of memory, it will power up the
> remote processors. I wouldn't imagine any software release would have ever
> been approved with this not working (given the SCM call is marked available).
> 
> It may also be that you have something else in mind, but I didn't quite catch
> your concern.
> 
>>> The init sequence provided by this interface will be at worst identical to
>>> what you're proposing here (except abstracted out), and at best containing
>>> some fixes and/or workarounds that may be necessary.
>>
>> I think this portrays the TZ path as somehow superior. That's not how things work in my use casee.
> 
> Indeed the sequence baked into the TZ is generally to be considered
> authoritative.
> 
>> The bootloader/FW versions depends on when and who made the device. So while the newest TZ from upstream may have the latest fixes, I have no guarantee that they will be present on a given device at runtime. The best solution I found to get consistent behavior across devices is to do these sequences from the kernel. Is there something incomplete in my init sequence that I can fix?
> 
> Because of the complexity of these systems, it's absolutely not inconceivable
> that a fix/workaround is only necessary/desired when coupled with a specific
> TZ (or other proprietary component, such as RPMh) firmware version (because
> many HW settings are co-dependent).
> 
> I can not answer your last question.
> 
>>  > Please try using PAS and see if that works.
>>
>> I found the v6 of the multipd series [1]. It needed some minor adjustments to compile. I went as far as loading the Q6 firmware and starting the remoteproc without error. I did not test any further.
> 
> Please give it a shot.
> 
> Bjorn, Vignesh, do we see the multipd series going anywhere? It's been
> last posted in 2023..

Hi Konrad,

multipd series was dropped and replaced with WCSS secure PIL driver [1] which is
currently in v9. I see that except the actual driver itself, patch 3/6 in
the above series,  other patches in this series has a R-b tag.

Once this gets reviewed, it should enable secure PIL loading using the TZ interface
for WCSS remoteprocs in IPQ5018/IPQ5332/IPQ9574.

[1] https://lore.kernel.org/linux-remoteproc/20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com/T/#t

> 
> Konrad

