Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48D5304BDC
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jan 2026 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767629365; cv=none; b=otFjSEheTjVMzHQBvxrq03SmU/4P+7Twwh3jqocx9ZxpkxtVBPeIiXctKKlNAcDoI3/gELck7FMLfRdql22fLjbVbV1H035WRIPXppcmLMn5y5pKfLTEdXG/BswP0mYW0UsYGj2n7AvHIGLxYROMSXqAqswSH7CKowYY5Ju3glw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767629365; c=relaxed/simple;
	bh=Z+3p06bGSl4kFPKyRspFHvQZldHI21Gsn4suvtFf8q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0Vcc3W46PGWPnJzeFykd/+EQk9qgZniQZfqNC3wqKWdssTkyl0gY66UrSxba3dB8GXg50HiMhiIXuboUzY8PSWV486b8XMZb3jqvcPYsvcx2rE/OQyJ1GZl1IUAo11MjbNtLfzpniuRSM2JXqaW61SUMboowqHVxwsDe+XbdLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnP4FxFN; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnP4FxFN"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-65cfddebfd0so16567eaf.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 08:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767629362; x=1768234162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjD0cFug8q5FgSi3StIcSXghk8VkJQAH5OGKsWnd7J8=;
        b=MnP4FxFNF3tPjzFuRR8KboW+3J/JQfpSn+dR+xMKjl35Hx/CIWMJsHe/KoUaTaKWFw
         WAZ0W+gesw6Qaz2TokAQjBZ+lsJiNM7+kiMNuKIyXcx7a3hwHAMK6u5zWcW9WQ2Lf4No
         CJ3fvSGx4l7rPDtQh+wJ6cwUQpCSG/mdJ4QEMw/tiIYQAzHaJoyxkTIPYIAsulnIxFl3
         SKAKWrB1XsDul3buFB+Sv2TlFmqL99LoUlr4RkVTpdluj2KbG+C/ypngZumFqE5hckpm
         OpFizEOaVIflAb5kSaHiFY6Re8Eo6ckItMb5GC7aXpfyLJiMwuNqViuya7cmKKxeHAu/
         ULvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767629362; x=1768234162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjD0cFug8q5FgSi3StIcSXghk8VkJQAH5OGKsWnd7J8=;
        b=wO91P3hXAckj6kjxV/UwU5QgovaK72zdeYBFnGHiQS8ESHWitDTsNSnywS9nE+8nu5
         SoJqQlu+0a4TD/ppS8zvpKaVPH7XRfVzkQjd7XEKFovGPWSQJXIFQZ56gZizZQXbHmpC
         dU0byFYSsoxbt81tkUvK8UYej94OmpJ/qa+dtC28QbcBCXKNUyHavOJz3ijXj8NuIpTz
         QObSJy77pAkslFwbP2rgVg1sk7qP97RK5nbgQJbOEdudremfV3bluny+erZIIwD2bx4k
         5j3K/oUaIrBXgSUZRHzp7tnKU6idxha2n75xuUyqxOp2+cidD4BoG9uZes7nnpRZBRJj
         oSQA==
X-Forwarded-Encrypted: i=1; AJvYcCVP9eLFu0+UzQeUG2Qxk3H/wigVhFBVJ3VNol5ZCHQU0xrkzB6W4RgcdmdLzoxgyM1JqbpWlCDeTkDAIwFCcL1S@vger.kernel.org
X-Gm-Message-State: AOJu0YyZOSWJYrh68mA7GsPlxZDongkrAP21aXxfl3lj9PNwZ7bDBDMI
	9TddEk1R1uLMsT9+wnTZ0xuJRW3bzh0LGglUrOsrmZSO63SVzdbyVE9U7jImRQ==
X-Gm-Gg: AY/fxX44VXmlhJmHrHOz2g6X6pGZI6+ccq/2Y2Os9oxBmUGYwAIfvJdm/lO3C4aBAfM
	2d0UL5TWGznSIjNQPLT7Vf+1vRy7TlHVfqGe7aFzC466qjAdci7QJW80kN0z8xERyXYPWt02tF3
	HmNPCYh0vGO5uombd2yO/k5LbQSVZa/S6K5u19CXV+1+UCEEfEGCz5KPOJe+VEnzAy0T64pLIL1
	xIfXo1uZhg+F7gMQ24Z6nUdIpXVE2UmGc2t3k4THl3qRnP609QPIo1l+fEYuWVDxIdtRalGl1o4
	tQBBBBAwrOmU0I5ZknZemEe7fx0jnz/GTCiB8s9GExwQmHqlLzT6GGpSaOu6jbKb+wpN9u3T0cT
	VSyZKVcs32WtrWPN4fAVcVB7zAtAcKtT+fgwW0QLOSef73pu5syYpiBaQ25oMql7/OdBRECdgRE
	KxrOyd/DAM1X1zkN+qTULTATUmPw3r7F3SGF84GFPm6AkW3UAPUawucE1b6pjS/OXbmjqLICMQy
	aFUwp9f7WYMMfY7RZ7FZuSi/wz1lDJ3DHO/IRGEBR6/
X-Google-Smtp-Source: AGHT+IHx5JMKb4vB/eajpN4o0f0cfIbQQ1XHTN78lppzSydrQP2y7T0NaVMBD0ZodkkL2GmZxmljaA==
X-Received: by 2002:a05:6820:606:b0:65c:fc7b:4c23 with SMTP id 006d021491bc7-65f479ffb03mr3349eaf.30.1767629361663;
        Mon, 05 Jan 2026 08:09:21 -0800 (PST)
Received: from [192.168.7.203] (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65f478c6a4esm23427eaf.9.2026.01.05.08.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 08:09:21 -0800 (PST)
Message-ID: <7f6754a4-4a3b-4b6f-9220-a1790a9ba393@gmail.com>
Date: Mon, 5 Jan 2026 10:09:19 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org
Cc: krzk+dt@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-6-mr.nuke.me@gmail.com>
 <a14e40b7-b70b-4658-9dee-7e5e6265ad5f@oss.qualcomm.com>
 <12223416.nUPlyArG6x@nukework.gtech>
 <55d70e0b-7a6b-4979-9ae9-4443e54ab584@oss.qualcomm.com>
Content-Language: en-US
From: mr.nuke.me@gmail.com
In-Reply-To: <55d70e0b-7a6b-4979-9ae9-4443e54ab584@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/29/25 6:35 AM, Konrad Dybcio wrote:
> On 12/23/25 9:21 PM, Alex G. wrote:
>> On Friday, December 19, 2025 7:20:04 AM CST Konrad Dybcio wrote:
>>> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
>>>> Q6 based firmware loading is also present on IPQ9574, when coupled
>>>> with a wifi-6 device, such as QCN5024. Populate driver data for
>>>> IPQ9574 with values from the downstream 5.4 kerrnel.
>>>>
>>>> Add the new sequences for the WCSS reset and stop. The downstream
>>>> 5.4 kernel calls these "Q6V7", so keep the name. This is still worth
>>>> using with the "q6v5" driver because all other parts of the driver
>>>> can be seamlessly reused.
>>>>
>>>> The IPQ9574 uses two sets of clocks. the first, dubbed "q6_clocks"
>>>> must be enabled before the Q6 is started by writing the Q6SS_RST_EVB
>>>> register. The second set of clocks, "clks" should only be enabled
>>>> after the Q6 is placed out of reset. Otherwise, the host CPU core that
>>>> tries to start the remoteproc will hang.
>>>>
>>>> The downstream kernel had a funny comment, "Pray god and wait for
>>>> reset to complete", which I decided to keep for entertainment value.
>>>>
>>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> @@ -128,6 +137,12 @@ struct q6v5_wcss {
>>>>
>>>>   	struct clk *qdsp6ss_xo_cbcr;
>>>>   	struct clk *qdsp6ss_core_gfmux;
>>>>   	struct clk *lcc_bcr_sleep;
>>>>
>>>> +	struct clk_bulk_data *clks;
>>>> +	/* clocks that must be started before the Q6 is booted */
>>>> +	struct clk_bulk_data *q6_clks;
>>>
>>> "pre_boot_clks" or something along those lines?
>>
>> I like "pre_boot_clocks".
>>
>>> In general i'm not super stoked to see another platform where manual and
>>> through-TZ bringup of remoteprocs is supposed to be supported in parallel..
>>>
>>> Are you sure your firmware doesn't allow you to just do a simple
>>> qcom_scm_pas_auth_and_reset() like in the multipd series?
>>
>> I am approaching this from the perspective of an aftermarket OS, like OpenWRT.
>> I don't know if the firmware will do the right thing. I can mitigate this for
>> OS-loaded firmware, like ath11k 16/m3 firmware, because I can test the driver
>> and firmware together. I can't do that for bootloader-loaded firmware, so I try
>> to depend on it as little as possible. I hope that native remoterproc loading
>> for IPQ9574 will be allowed.
> 
> These are two parallel questions. I didn't even know that the bootloader
> preloaded firmware on these platforms (are you sure that's the case?)
> 
> qcom_scm_pas_auth_and_reset() is usually preceded by qcom_mdt_pas_init() +
> qcom_mdt_load_no_init() where *you* supply the loadable firmware for the
> remote processor.

What I mean is that the init sequence is implemented in the trustzone 
firmware which is loaded at boot time. Irrespective of what Q6 and M3 
firmware I supply, if trustzone doesn't cooperate, I can't start the 
remoteproc. I don't have that problem when the init sequence is 
implemented in the kernel.

> The init sequence provided by this interface will be at worst identical to
> what you're proposing here (except abstracted out), and at best containing
> some fixes and/or workarounds that may be necessary.

I think this portrays the TZ path as somehow superior. That's not how 
things work in my use casee.

The bootloader/FW versions depends on when and who made the device. So 
while the newest TZ from upstream may have the latest fixes, I have no 
guarantee that they will be present on a given device at runtime. The 
best solution I found to get consistent behavior across devices is to do 
these sequences from the kernel. Is there something incomplete in my 
init sequence that I can fix?

  > Please try using PAS and see if that works.

I found the v6 of the multipd series [1]. It needed some minor 
adjustments to compile. I went as far as loading the Q6 firmware and 
starting the remoteproc without error. I did not test any further.

Alex

[1] 
https://patchwork.kernel.org/project/linux-remoteproc/patch/20231110091939.3025413-1-quic_mmanikan@quicinc.com/

