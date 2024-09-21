Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0A222094;
	Sat, 21 Sep 2024 18:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726942848; cv=none; b=o/qdtnKT7gFrdC8gaJic2v0t4GgIvrB6LIU6T62HIBSw/55EREH9nSG4NmpO9ImUYGt3vbYsLIc0xVm5DZVNesvMV3DjwwTUHjtJKU1i4h/StS0Ago7XoXzABXWAVNn44AjrXjanIHrH6GQwNbT8BAc3LMu2Hw7Wn0iso2CaSPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726942848; c=relaxed/simple;
	bh=jGWTXU2FmyEE3RyNInUPd012PyW1YlOkrWhl1b6PIY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLnqHk1tCSHazyJdgPVIB0eEjQt3UyBgScpXkK5Ev9GFBNQNOiBGHfbmuTivKVEcuoOxWA9eg/AxDtfz3FS7jUd51A7j7703EaPPzFI59oQJol7FcLkND40fJCuFbDf+a8kBs5bfhvTHvukHiwH1BXCeldLJyBaO4+Bnfe1syDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFvpl14q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFvpl14q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1F1C4CEC2;
	Sat, 21 Sep 2024 18:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726942847;
	bh=jGWTXU2FmyEE3RyNInUPd012PyW1YlOkrWhl1b6PIY4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BFvpl14qlVw6jIz/O0e8ADaeANBfS1HNPXN6kdZM10f89xnWuEXxykMITjdN1PM9r
	 dAcvNLYGFndUQipjEdFGGmQz+rH4jhQjx3Un907TbgFyqAMUnq0mZbySsYMoydHVHP
	 EomM3t1Q2KAjSj6cSGWWPmCNFKZmK1SwApm7+Xj7wFxXs4we4Z1JBrmn4gmv5iWGxU
	 Tz54aaAjCmNVWgQhshChhYQL6e0E9Cg+7mi7u1s8DqTJvcIjqp1FmmBSQ/S64fU50/
	 WBJO21Vnij2rYF9CDVlCiDk2b2s4aBRcitoy7arXRVMjLEqUGVatB5+x2n5jvvH/E0
	 /HZqJZoGv+BOg==
Message-ID: <e37a0542-d405-4d15-84d2-4c7b1385d3ef@kernel.org>
Date: Sat, 21 Sep 2024 20:20:39 +0200
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
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
 <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>
 <gzlncpyzwm7x4jcxtdrthrlv2dofk7u3oxn4taadwog5tt37wo@ot6s6kwukd4k>
 <20240919093517.GA43740@e130802.arm.com>
 <222b3b11-151a-4ad0-91ea-54ae8f280bcb@kernel.org>
 <20240919145741.GA7940@e130802.arm.com>
 <85a223e9-05a4-4034-87a5-57d3eb9409b7@kernel.org>
 <20240920141958.GA288724@e130802.arm.com>
 <7784248d-4372-4cf1-a01a-5b731b3f6b96@kernel.org>
 <20240920163851.GA385919@e130802.arm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240920163851.GA385919@e130802.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/09/2024 18:38, Abdellatif El Khlifi wrote:
> Hi Krzysztof,
> 
>>>>>>>>> +  '#extsys-id':
>>>>>>>>
>>>>>>>> '#' is not correct for sure, that's not a cell specifier.
>>>>>>>>
>>>>>>>> But anyway, we do not accept in general instance IDs.
>>>>>>>
>>>>>>> I'm happy to replace the instance ID with  another solution.
>>>>>>> In our case the remoteproc instance does not have a base address
>>>>>>> to use. So, we can't put remoteproc@address
>>>>>>>
>>>>>>> What do you recommend in this case please ?
>>>>>>
>>>>>> Waiting one month to respond is a great way to drop all context from my
>>>>>> memory. The emails are not even available for me - gone from inbox.
>>>>>>
>>>>>> Bus addressing could note it. Or you have different devices, so
>>>>>> different compatibles. Tricky to say, because you did not describe the
>>>>>> hardware really and it's one month later...
>>>>>>
>>>>>
>>>>> Sorry for waiting. I was in holidays.
>>>>>
>>>>> I'll add more documentation about the external system for more clarity [1].
>>>>>
>>>>> Basically, Linux runs on the Cortex-A35. The External system is a
>>>>> Cortex-M core. The Cortex-A35 can not access the memory of the Cortex-M.
>>>>> It can only control Cortex-M core using the reset control and status registers mapped
>>>>> in the memory space of the Cortex-A35.
>>>>
>>>> That's pretty standard.
>>>>
>>>> It does not explain me why bus addressing or different compatible are
>>>> not sufficient here.
>>>
>>> Using an instance ID was a design choice.
>>> I'm happy to replace it with the use of compatible and match data (WIP).
>>>
>>> The match data will be pointing to a data structure containing the right offsets
>>> to be used with regmap APIs.
>>>
>>> syscon node is used to represent the Host Base System Control register area [1]
>>> where the external system reset registers are mapped (EXT_SYS*).
>>>
>>> The nodes will look like this:
>>>
>>> syscon@1a010000 {
>>>         compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
>>>         reg = <0x1a010000 0x1000>;
>>>
>>>         #address-cells = <1>;
>>>         #size-cells = <1>;
>>>
>>>         remoteproc@310 {
>>>             compatible = "arm,sse710-extsys0";
>>>             reg = <0x310 4>;
>>
>> Uh, why do you create device nodes for one word? This really suggests it
>> is part of parent device and your split is artificial.
> 
> The external system registers (described by the remoteproc node) are part
> of the parent device (the Host Base System Control register area) described
> by syscon.
> 
> In case of the external system 0 , its registers are located at offset 0x310
> (physical address: 0x1a010310)
> 
> When instantiating the devices without @address, the DTC compiler
> detects 2 nodes with the same name (remoteproc).

There should be no children at all. DT is not for instantiating your
drivers. I claim you have only one device and that's
arm,sse710-host-base-sysctrl. If you create child node for one word,
that's not a device.

Best regards,
Krzysztof

