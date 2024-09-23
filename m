Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB40C19D067
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Sep 2024 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727105393; cv=none; b=dczpiCi3zqrZV4VEu/66OMZI2Tt7rjOn9MPQjfCdoRQHCKECDb8tpVRosChk2fezH/9SIJErFLotUi5TIP/pu0wIs8fxYRJOJg3lhsKpl34AHfRuLbQgATkGNATkQnP5sd1muWRLWBnunmCz+xhCKwiacTjaTr27eYIEM0f3eWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727105393; c=relaxed/simple;
	bh=PUJbPwVGDOFz0HOjhDbpVsRxe9tWFnHQkHBmF7qUfzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQ7tvhhzg4yoZmeGuiSb6Anptc/Q7icV9KspxTSkAN74j/RvS1uN1agH3pJ3qxjlyC5QdVN2HYOfMfPlwgB1Gw/VKDXafhQZ4iHHNAvfBxWhvV8YGtLWKxLcHjB/148ljiBRLlHBwB1ShkXOaygER7TOscpJIiQu/KMR09IzqfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=olT7oJf0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="olT7oJf0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cb1e3b449so6573375e9.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Sep 2024 08:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727105390; x=1727710190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dD7hHYsS283GSbCBplOCkRMwjoDufwPExNMfzIl92yU=;
        b=olT7oJf0JOXxMR/ESD8sMqClIU9Gi0y+LWgsMMH+QlU4dtJrnZK8MR6kZmYegGntPn
         RitkOofrXN9uSTr97yx8HdUMMIS3ITUobyRn3ELHx3vipibqVaRQH02al5nejrI6q0Y6
         k12p4WcZK9cFyReDhRjVn/vOMrSjEsTwsYpumxNVgXr8SE6lLi/a3qCYnyoethumc8Zj
         J/sKgwgnzbDtCbLKX7kmirFXjtO+HGcDg+axg9jPqcE10W4sqd7/mZnQoXFZLwtFlMBm
         0st3DrfCPagrVIKQC/a6yQFg0ffblxQ40WTiCBO18t3CGf4elYvrY5g6cDhuOod/mzX6
         Y+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727105390; x=1727710190;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dD7hHYsS283GSbCBplOCkRMwjoDufwPExNMfzIl92yU=;
        b=GoLYPtWxo9nF1umvrxHjHkUtKnC2gXEVEWGs3qCe4eOdKS8sbYNJOWu/me0wD7nPXw
         0PzrHrDRhh7WxF7YrksJv5HHbDKKLBAjKroy1jZYo6fwXhpg2348BJs1G2ubJ00mjHUV
         AGE6dfVbFunraziu7Pal5/WrT4m8Q34D6YQaCwJ2ymjCfPQEHk4z6YQDAnbTe/ZBX83F
         xCOcol7VmfDOuUQi43uFzatVKUKssoc8xiXe3p58lG4EFG6tL0En0bBeLWeUKXJJpkn/
         EocHG7tyRfF1JtTSlsGz9b+TlKnY7EKVxtC3j3KuI76lSGhDoy/T0qvPp2rKEsvHwZ1v
         d0/g==
X-Forwarded-Encrypted: i=1; AJvYcCUCAw3roRKW8OOGwWllue5yQ1NzidbTfwu2bZ2XbNJqWZYVXqI0h6Z0vGXwj9+xec8muWiUx3wN+rA3LTTbaEc8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4lwVRoDoKZC272/31mW0Urqc2MKqEA2SA7o+ewLu0UhrdkuyH
	rTs/XKBEG9fBH5djQUrrW0jzsIr3MaVtfIeLbLxjYjDK/BeZ1zJ0eJMsVvSnfsE=
X-Google-Smtp-Source: AGHT+IHeKCUyjohUfTv2OwDb/BfCJQqRrE8zYdgpcY9fKRGlVv5KGJ083aHsTcr2nBQkM9ny6+e7JQ==
X-Received: by 2002:a05:600c:1c1e:b0:42c:aeee:d8ed with SMTP id 5b1f17b1804b1-42e7adc7ed0mr34954475e9.7.1727105389915;
        Mon, 23 Sep 2024 08:29:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7afdda8esm103464185e9.31.2024.09.23.08.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 08:29:49 -0700 (PDT)
Message-ID: <c263b843-50bc-4c2c-b15e-9b87dfb201ab@linaro.org>
Date: Mon, 23 Sep 2024 17:29:46 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: sse710: Add the External
 Systems remote processors
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: mathieu.poirier@linaro.org, Adam.Johnston@arm.com,
 Hugues.KambaMpiana@arm.com, Drew.Reed@arm.com, andersson@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 liviu.dudau@arm.com, lpieralisi@kernel.org, robh@kernel.org,
 sudeep.holla@arm.com, robin.murphy@arm.com
References: <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>
 <gzlncpyzwm7x4jcxtdrthrlv2dofk7u3oxn4taadwog5tt37wo@ot6s6kwukd4k>
 <20240919093517.GA43740@e130802.arm.com>
 <222b3b11-151a-4ad0-91ea-54ae8f280bcb@kernel.org>
 <20240919145741.GA7940@e130802.arm.com>
 <85a223e9-05a4-4034-87a5-57d3eb9409b7@kernel.org>
 <20240920141958.GA288724@e130802.arm.com>
 <7784248d-4372-4cf1-a01a-5b731b3f6b96@kernel.org>
 <20240920163851.GA385919@e130802.arm.com>
 <e37a0542-d405-4d15-84d2-4c7b1385d3ef@kernel.org>
 <20240923114945.GA133670@e130802.arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240923114945.GA133670@e130802.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2024 13:49, Abdellatif El Khlifi wrote:
> Hi Krzysztof,
> 
>>>>>>>>>>> +  '#extsys-id':
>>>>>>>>>>
>>>>>>>>>> '#' is not correct for sure, that's not a cell specifier.
>>>>>>>>>>
>>>>>>>>>> But anyway, we do not accept in general instance IDs.
>>>>>>>>>
>>>>>>>>> I'm happy to replace the instance ID with  another solution.
>>>>>>>>> In our case the remoteproc instance does not have a base address
>>>>>>>>> to use. So, we can't put remoteproc@address
>>>>>>>>>
>>>>>>>>> What do you recommend in this case please ?
>>>>>>>>
>>>>>>>> Waiting one month to respond is a great way to drop all context from my
>>>>>>>> memory. The emails are not even available for me - gone from inbox.
>>>>>>>>
>>>>>>>> Bus addressing could note it. Or you have different devices, so
>>>>>>>> different compatibles. Tricky to say, because you did not describe the
>>>>>>>> hardware really and it's one month later...
>>>>>>>>
>>>>>>>
>>>>>>> Sorry for waiting. I was in holidays.
>>>>>>>
>>>>>>> I'll add more documentation about the external system for more clarity [1].
>>>>>>>
>>>>>>> Basically, Linux runs on the Cortex-A35. The External system is a
>>>>>>> Cortex-M core. The Cortex-A35 can not access the memory of the Cortex-M.
>>>>>>> It can only control Cortex-M core using the reset control and status registers mapped
>>>>>>> in the memory space of the Cortex-A35.
>>>>>>
>>>>>> That's pretty standard.
>>>>>>
>>>>>> It does not explain me why bus addressing or different compatible are
>>>>>> not sufficient here.
>>>>>
>>>>> Using an instance ID was a design choice.
>>>>> I'm happy to replace it with the use of compatible and match data (WIP).
>>>>>
>>>>> The match data will be pointing to a data structure containing the right offsets
>>>>> to be used with regmap APIs.
>>>>>
>>>>> syscon node is used to represent the Host Base System Control register area [1]
>>>>> where the external system reset registers are mapped (EXT_SYS*).
>>>>>
>>>>> The nodes will look like this:
>>>>>
>>>>> syscon@1a010000 {
>>>>>         compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
>>>>>         reg = <0x1a010000 0x1000>;
>>>>>
>>>>>         #address-cells = <1>;
>>>>>         #size-cells = <1>;
>>>>>
>>>>>         remoteproc@310 {
>>>>>             compatible = "arm,sse710-extsys0";
>>>>>             reg = <0x310 4>;
>>>>
>>>> Uh, why do you create device nodes for one word? This really suggests it
>>>> is part of parent device and your split is artificial.
>>>
>>> The external system registers (described by the remoteproc node) are part
>>> of the parent device (the Host Base System Control register area) described
>>> by syscon.
>>>
>>> In case of the external system 0 , its registers are located at offset 0x310
>>> (physical address: 0x1a010310)
>>>
>>> When instantiating the devices without @address, the DTC compiler
>>> detects 2 nodes with the same name (remoteproc).
>>
>> There should be no children at all. DT is not for instantiating your
>> drivers. I claim you have only one device and that's
>> arm,sse710-host-base-sysctrl. If you create child node for one word,
>> that's not a device.
> 
> The Host Base System Control [3] is the big block containing various functionalities (MMIO registers).
> Among the functionalities, the two remote cores registers (aka External system 0 and 1).
> The remote cores have two registers each.
> 
> 1/ In the v1 patchset, a valid point was made by the community:
> 
>    Right now it seems somewhat tenuous to describe two consecutive
>    32-bit registers as separate "reg" entries, but *maybe* it's OK if that's

ARM is not special, neither this hardware is. Therefore:
1. Each register as reg: nope, for obvious reasons.
2. One device for entire syscon: quite common, why do you think it is
somehow odd?
3. If you quote other person, please provide the lore link, so I won't
spend useless 5 minutes to find who said that or if it was even said...

>    all there ever is. However if it's actually going to end up needing several
>    more additional MMIO and/or memory regions for other functionality, then
>    describing each register and location individually is liable to get
>    unmanageable really fast, and a higher-level functional grouping (e.g. these
>    reset-related registers together as a single 8-byte region) would likely be
>    a better design.
> 
>    The Exernal system registers are part of a bigger block with other functionality in place.
>    MFD/syscon might be better way to use these registers. You never know in
>    future you might want to use another set of 2-4 registers with a different
>    functionality in another driver.
> 
>    I would see if it makes sense to put together a single binding for
>    this "Host Base System Control" register (not sure what exactly that means).
>    Use MFD/regmap you access parts of this block. The remoteproc driver can
>    then be semi-generic (meaning applicable to group of similar platforms)
>    based on the platform compatible and use this regmap to provide the
>    functionality needed.

I don't understand how this lengthy semi-quote answers my concerns.
Please write concise points as arguments to my questions.

For example, I don't care what your remote proc driver does and it
should not matter in the terms of this binding.

> 
> 2/ There are many examples in the kernel that use syscon as a parent node of
>    child nodes for devices located at an offset from the syscon base address.
>    Please see these two examples [1][2]. I'm trying to follow a similar design if that
>    makes sense.

Yeah, for separate devices. If you have two words without any resources,
I claim you might not have here any separate devices or "not separate
enough", because all this is somehow fluid. Remote core sounds like
separate device, but all your arguments about need of extid which cannot
be used in reg does not support this case.

The example in the binding is also not complete - missing rest of
devices - which does not help.

> 
> 3/ Since there are two registers for each remote core. I'm suggesting to set the
>    size in the reg property to 8. 

How is this related?

> The driver will read the match data to get the right
>    offset to be used with regmap APIs.

Sorry, no talks about driver. Don't care, at least in this context.

You can completely omit address space from children in DT and everything
will work fine and look fine from bindings point of view.

> 
> Suggested nodes:
> 
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
>             firmware-name = "es_flashfw.elf";
>             mboxes = <&mhu0_hes0 0 1>, <&mhu0_es0h 0 1>;
>             mbox-names = "txes0", "rxes0";
>             memory-region = <&extsys0_vring0>, <&extsys0_vring1>;
>         };
> 
>         remoteproc@318 {
>             compatible = "arm,sse710-extsys1";
>             reg = <0x318 8>;
>             firmware-name = "es_flashfw.elf";

Same firmware? Always or only depends?

>             mboxes = <&mhu0_hes1 0 1>, <&mhu0_es1h 0 1>;
>             mbox-names = "txes0", "rxes0";
>             memory-region = <&extsys1_vring0>, <&extsys1_vring1>;

The rest of resources support the idea of two children but I still have
doubts about need of identifying remote instances.

Looking at your driver it is totally not needed. Your driver just
duplicates the regs here, so it's a proof that you are not using DT
correctly.

>         };
> };
> 
> 
> [1]: Documentation/devicetree/bindings/clock/sprd,sc9863a-clk.yaml
> 
>     syscon@20e00000 {
>       compatible = "sprd,sc9863a-glbregs", "syscon", "simple-mfd";
>       reg = <0x20e00000 0x4000>;
>       #address-cells = <1>;
>       #size-cells = <1>;
>       ranges = <0 0x20e00000 0x4000>;
> 
>       apahb_gate: apahb-gate@0 {
>         compatible = "sprd,sc9863a-apahb-gate";
>         reg = <0x0 0x1020>;

Well, size 1020, but please never use sprd as an example. You can as
well point to a buggy code and say that "I can implement bugs as well,
because there are bugs already".

Same for few other almost abandoned, poorly maintained platforms.

>         #clock-cells = <1>;
>       };
>     };
> 
> 
> [2]: Documentation/devicetree/bindings/arm/arm,juno-fpga-apb-regs.yaml:
> 
>     syscon@10000 {
>         compatible = "arm,juno-fpga-apb-regs", "syscon", "simple-mfd";
>         reg = <0x010000 0x1000>;
>         ranges = <0x0 0x10000 0x1000>;
>         #address-cells = <1>;
>         #size-cells = <1>;
> 
>         led@8,0 {
>             compatible = "register-bit-led";

register-bit-led... what do you want to prove? You will find
clocks-per-reg and try to implement them? That's known no-go.

Best regards,
Krzysztof

