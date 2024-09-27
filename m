Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F315188A02
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Sep 2024 07:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727423827; cv=none; b=rPz7fl0SLVTtYzjr+ClkOEK6FotBO4yIyt+zzK8txL9fwHuFdoqO2PnzZwaEvdO1jbLR15mABVvYFKdE4/mJ4f3RXjkQIjHAAUur5jcgXF5joYlWMyIRLd23dTOjYWxguJtfgTD4dcezdlMSwJ9jKyGSQto036OiKgpiqmlMN98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727423827; c=relaxed/simple;
	bh=OZtUCfvDaSRTPyDPgz9cjRsWvyFdmjmqLZwQsHr4xfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t09S2VIy+9jRr5z+a3jEObVzvLlGOWui4gWqryd2ifQCnUidgOGexdnnphaGFCgvGuorudJ+/Z9cYqCYHL/uUIZnljFp3I9lJBkQuSpY/7n1Goafn1B7aoXgLC4aDpJiduzr2i5L4Lx9lzQSuIVEnQXGdbZjFFyIq0lWceGHbK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bcn5Idzk; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bcn5Idzk"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a90deec0f8bso23552066b.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Sep 2024 00:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727423823; x=1728028623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L+nFUwTG8TeeWwku7cS7rWiWP38oV+D+0z+Xf1wWA7E=;
        b=bcn5Idzkl3Mg9HG3HkKgJyEoM7hz2VHny5n2BzGNrDWpA6IoiNuY1eYNrSOct9dFsx
         x6uHTlkhe02WvNWRZGfSHfmOjeJhlBA1q+XekAe5yW2wWq/ucNDCdJBa819E8pG2D6P/
         a8x+MhHZj4ljNYKAHBAh/pTOaxmoOSk02R5f3UoRQpwGhb1WvIY6VRQ3Xuf1NvlTd9Wf
         f89uhGqJuOi9usXrTpGHgI9/TUzh9bXCbxE8Tb+XuDP6iDeEtQC64Dzff3euIcP1U7ex
         lrDUGbCrjjg+eiwafLPD34TZ29lL+QBkOv8ZcSSS0Z5GE6AW/4UglsX79rAis3roN+4E
         mcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727423823; x=1728028623;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+nFUwTG8TeeWwku7cS7rWiWP38oV+D+0z+Xf1wWA7E=;
        b=LZ9RBamN97pGERr7iVg+Q5PuqJuIrz6Fn8HVjQXQ+Y+ux78KjhVNK2/GgeMmpvX7ui
         prLiNfnrFL++gw6Z3EwS8YM553hP4/xI3pVH8mHgVbx4FufYqgf9JCEISGLPAAX2iqbR
         vBtqlrxfl/XK7V5kxhLORL236FK8127qeOpCJNG+0n190W8Xbx43EleRx/2CgvV43ORh
         PQ5/5BmPcq+4WCIzShdtY23WDhFGoi3ulrI77c9kSB3pESSJ73o4gsR3PcC+WnFJiSlu
         DrH+G6ntDlOS6Vx4YhX3lnif7kJiOYAkQDRF57u0DN36bFpV/E+hlXrpEbI/TXoUgfuS
         PTnA==
X-Forwarded-Encrypted: i=1; AJvYcCV/reBujG683ZyQZYuZdT1vnNg/F7eFLSkAP2LUujzvv0qNaLtV0JFOB5unX7Kb/lTIJS4PlSnzhzCVJtS3W+d+@vger.kernel.org
X-Gm-Message-State: AOJu0YxgMap7a4smzU4HJPmG44S26v7KW2Mn177dx/KHIl4g67lwktBp
	eZSX6bGujQyMzqAXK6g29bSnyo8hNO5zvw22tEiPHv6RxEvAHldVBfQmanpUSzk=
X-Google-Smtp-Source: AGHT+IFi7rOXtdUqAxhUetMwe8gtb6a/xV9ZXm9g63edqmUl5elGNWyp7G8/RmAbdH72cxyAjilTug==
X-Received: by 2002:a17:907:1c8b:b0:a8d:2623:dd19 with SMTP id a640c23a62f3a-a93c4ade9bcmr88134366b.14.1727423823198;
        Fri, 27 Sep 2024 00:57:03 -0700 (PDT)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c294747asm96048666b.107.2024.09.27.00.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 00:57:02 -0700 (PDT)
Message-ID: <e1523562-0cf9-44a9-9cbe-23ace46ea997@linaro.org>
Date: Fri, 27 Sep 2024 09:57:00 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: sse710: Add the External
 Systems remote processors
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Cc: mathieu.poirier@linaro.org, Adam.Johnston@arm.com,
 Hugues.KambaMpiana@arm.com, Drew.Reed@arm.com, andersson@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 liviu.dudau@arm.com, lpieralisi@kernel.org, robh@kernel.org,
 sudeep.holla@arm.com, robin.murphy@arm.com
References: <20240919093517.GA43740@e130802.arm.com>
 <222b3b11-151a-4ad0-91ea-54ae8f280bcb@kernel.org>
 <20240919145741.GA7940@e130802.arm.com>
 <85a223e9-05a4-4034-87a5-57d3eb9409b7@kernel.org>
 <20240920141958.GA288724@e130802.arm.com>
 <7784248d-4372-4cf1-a01a-5b731b3f6b96@kernel.org>
 <20240920163851.GA385919@e130802.arm.com>
 <e37a0542-d405-4d15-84d2-4c7b1385d3ef@kernel.org>
 <20240923114945.GA133670@e130802.arm.com>
 <c263b843-50bc-4c2c-b15e-9b87dfb201ab@linaro.org>
 <20240923171948.GA348509@e130802.arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240923171948.GA348509@e130802.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2024 19:19, Abdellatif El Khlifi wrote:

>>>
>>> The Host Base System Control [3] is the big block containing various functionalities (MMIO registers).
>>> Among the functionalities, the two remote cores registers (aka External system 0 and 1).
>>> The remote cores have two registers each.
>>>
>>> 1/ In the v1 patchset, a valid point was made by the community:
>>>
>>>    Right now it seems somewhat tenuous to describe two consecutive
>>>    32-bit registers as separate "reg" entries, but *maybe* it's OK if that's
>>
>> ARM is not special, neither this hardware is. Therefore:
>> 1. Each register as reg: nope, for obvious reasons.
>> 2. One device for entire syscon: quite common, why do you think it is
>> somehow odd?
>> 3. If you quote other person, please provide the lore link, so I won't
>> spend useless 5 minutes to find who said that or if it was even said...
> 
> Please have a look at this lore link [1]. The idea is to add syscon
> and regmap support which I did in the v2 patchset.
> 
> [1]: https://lore.kernel.org/all/ZfMVcQsmgQUXXcef@bogus/

There is nothing there about DT bindings. We do not talk here about
drivers. MFD and regmap are Linux driver stuff, not bindings.

I said nothing about not using MFD, regmap or whatever driver stuff you
want. We talk *only* about bindings. Syscon is mentioned there but I am
sorry - that quite a stretch to call a block syscon just because you
want regmap.

> 
>>
>>>    all there ever is. However if it's actually going to end up needing several
>>>    more additional MMIO and/or memory regions for other functionality, then
>>>    describing each register and location individually is liable to get
>>>    unmanageable really fast, and a higher-level functional grouping (e.g. these
>>>    reset-related registers together as a single 8-byte region) would likely be
>>>    a better design.
>>>
>>>    The Exernal system registers are part of a bigger block with other functionality in place.
>>>    MFD/syscon might be better way to use these registers. You never know in
>>>    future you might want to use another set of 2-4 registers with a different
>>>    functionality in another driver.
>>>
>>>    I would see if it makes sense to put together a single binding for
>>>    this "Host Base System Control" register (not sure what exactly that means).
>>>    Use MFD/regmap you access parts of this block. The remoteproc driver can
>>>    then be semi-generic (meaning applicable to group of similar platforms)
>>>    based on the platform compatible and use this regmap to provide the
>>>    functionality needed.
>>
>> I don't understand how this lengthy semi-quote answers my concerns.
>> Please write concise points as arguments to my questions.
>>
>> For example, I don't care what your remote proc driver does and it
>> should not matter in the terms of this binding.
> 
> I just wanted to show why we are using syscon based on the arguments
> of other reviewers.
> 
>>
>>>
>>> 2/ There are many examples in the kernel that use syscon as a parent node of
>>>    child nodes for devices located at an offset from the syscon base address.
>>>    Please see these two examples [1][2]. I'm trying to follow a similar design if that
>>>    makes sense.
>>
>> Yeah, for separate devices. If you have two words without any resources,
>> I claim you might not have here any separate devices or "not separate
>> enough", because all this is somehow fluid. Remote core sounds like
>> separate device, but all your arguments about need of extid which cannot
>> be used in reg does not support this case.
>>
>> The example in the binding is also not complete - missing rest of
>> devices - which does not help.
> 
> Here I would like to explain the current suggestion and suggest an alternative solution.
> 
> 1/ For more clarity, here is a complete example of use of both remote cores
> at the same time:
> 
>     syscon@1a010000 {
>         compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
>         reg = <0x1a010000 0x1000>;
> 
>         #address-cells = <1>;
>         #size-cells = <1>;
> 
>         remoteproc@310 {
>             compatible = "arm,sse710-extsys0";
>             reg = <0x310 8>;
>             firmware-name = "es0_flashfw.elf";
>             mboxes = <&mhu0_hes0 0 1>, <&mhu0_es0h 0 1>;
>             mbox-names = "txes0", "rxes0";
>             memory-region = <&extsys0_vring0>, <&extsys0_vring1>;
>         };
> 
>         remoteproc@318 {
>             compatible = "arm,sse710-extsys1";
>             reg = <0x318 8>;
>             firmware-name = "es1_flashfw.elf";
>             mboxes = <&mhu0_hes1 0 1>, <&mhu0_es1h 0 1>;
>             mbox-names = "txes0", "rxes0";
>             memory-region = <&extsys1_vring0>, <&extsys1_vring1>;
>         };
> };
> 
> Here we have 2 cores, each one have 2 registers mapped respectively
> at 0x1a010310 and 0x1a010318.

All this looks fine, resources are indeed reasonable, except that I
still do not understand why do you need to call them 0 and 1 (now via
compatible).

Your driver code shows this nicely - it is entirely redundant! The 'reg'
- so the base - is already there! You just duplicate it with the
extsys_id, instead of relying on the base. So think what is the point of
'reg' property if you do not use it?

> 
> Definetly these cores have seperate HW resources associated with them
> which are the MHUs (mailboxes HW). There are 2 pairs of MHUs associated
> with each core. These mailbox peripherals are obviously seperate.
> Furthermore, the vring buffers used for communication are seperate.
> 
> Moreover, the remote cores are independent. They are not SMP cores of one processor.
> 
> They can have different default firmware to use. In this example es0_flashfw.elf
> and es1_flashfw.elf
> 
> The current HW implementation (Corstone-1000) provides one remote core only.
> However, the second core control registers are at 0x1a010318 do exist.
> 
> Support for a second core is taken into consideration in this work to help
> end users who want to add a second core to their HW.
> 
> 2/ Here I'm suggesting an alternative solution by using one remoteproc node for both cores as
> follows:
> 
>     syscon@1a010000 {
>         compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
>         reg = <0x1a010000 0x1000>;
> 
>         remoteproc {
>             compatible = "arm,sse710-extsys";
>             firmware-name = "es0_flashfw.elf";
>             mboxes = <&mhu0_hes0 0 1>, <&mhu0_es0h 0 1>, <&mhu0_hes1 0 1>, <&mhu0_es1h 0 1>;
>             mbox-names = "txes0", "rxes0", "txes1", "rxes1";
>             memory-region = <&extsys0_vring0>, <&extsys0_vring1>, <&extsys1_vring0>, <&extsys1_vring1>;
>         };
> };
> 
> Does this meet your expectations please ?
> 
>>
>>>
>>> 3/ Since there are two registers for each remote core. I'm suggesting to set the
>>>    size in the reg property to 8. 
>>
>> How is this related?
>>
>>> The driver will read the match data to get the right
>>>    offset to be used with regmap APIs.
>>
>> Sorry, no talks about driver. Don't care, at least in this context.
>>
>> You can completely omit address space from children in DT and everything
>> will work fine and look fine from bindings point of view.
>>
>>>
>>> Suggested nodes:
>>>
>>>
>>>     syscon@1a010000 {
>>>         compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
>>>         reg = <0x1a010000 0x1000>;
>>>
>>>         #address-cells = <1>;
>>>         #size-cells = <1>;
>>>
>>>         remoteproc@310 {
>>>             compatible = "arm,sse710-extsys0";
>>>             reg = <0x310 8>;
>>>             firmware-name = "es_flashfw.elf";
>>>             mboxes = <&mhu0_hes0 0 1>, <&mhu0_es0h 0 1>;
>>>             mbox-names = "txes0", "rxes0";
>>>             memory-region = <&extsys0_vring0>, <&extsys0_vring1>;
>>>         };
>>>
>>>         remoteproc@318 {
>>>             compatible = "arm,sse710-extsys1";
>>>             reg = <0x318 8>;
>>>             firmware-name = "es_flashfw.elf";
>>
>> Same firmware? Always or only depends?
> 
> The firmware of the second core depends on the end user choice.
> Currently the second core is not implemented in the HW.
> Users who want to tweak Corstone-1000 HW can add
> a second core.


Two cores make more sense in such case.

Best regards,
Krzysztof

