Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2979719E980;
	Mon, 23 Sep 2024 17:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727112000; cv=none; b=WCM/ErRKn/iJvu/YPLiAtNSL/FZ/lqRRIIoGCRR9emcMLOo/RDVxpDAbMgemwWi7GFcjXMeXQENVyIuIfLPZr9G0HRxxFewEEgIz2CZe4qOkws/xegMhf+KPUAM8YnYRFf1QBZilbZaRi8a3xd6s1aoQXafhhIRNImWr2p5Gnn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727112000; c=relaxed/simple;
	bh=FwA9k21LqL31ELrrijVwndjSDt/NfS3FHO6UqfN0ClU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifRcG8oxXOlVrsvepX7lTfXvugknJiLD3rIq7HYv32iw4aIK5hyfA0b+cqgPVBkN8j0pHLF7khWzy+aeMo2tjM+/gGYRx2FEqD+PKfnXbs0R2NtPPjDUPwhaPaFP/EVGYZ4+LVZqCQLoxdORSF+IBkrsSLW4GM5ctpSX//EDngY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6E4FDA7;
	Mon, 23 Sep 2024 10:20:26 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.57.53.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CB033F528;
	Mon, 23 Sep 2024 10:19:53 -0700 (PDT)
Date: Mon, 23 Sep 2024 18:19:48 +0100
From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: mathieu.poirier@linaro.org, Adam.Johnston@arm.com,
	Hugues.KambaMpiana@arm.com, Drew.Reed@arm.com, andersson@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, liviu.dudau@arm.com,
	lpieralisi@kernel.org, robh@kernel.org, sudeep.holla@arm.com,
	robin.murphy@arm.com
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: sse710: Add the External
 Systems remote processors
Message-ID: <20240923171948.GA348509@e130802.arm.com>
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
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c263b843-50bc-4c2c-b15e-9b87dfb201ab@linaro.org>

Hi Krzysztof,

> >>>>>>>>>>> +  '#extsys-id':
> >>>>>>>>>>
> >>>>>>>>>> '#' is not correct for sure, that's not a cell specifier.
> >>>>>>>>>>
> >>>>>>>>>> But anyway, we do not accept in general instance IDs.
> >>>>>>>>>
> >>>>>>>>> I'm happy to replace the instance ID with  another solution.
> >>>>>>>>> In our case the remoteproc instance does not have a base address
> >>>>>>>>> to use. So, we can't put remoteproc@address
> >>>>>>>>>
> >>>>>>>>> What do you recommend in this case please ?
> >>>>>>>>
> >>>>>>>> Waiting one month to respond is a great way to drop all context from my
> >>>>>>>> memory. The emails are not even available for me - gone from inbox.
> >>>>>>>>
> >>>>>>>> Bus addressing could note it. Or you have different devices, so
> >>>>>>>> different compatibles. Tricky to say, because you did not describe the
> >>>>>>>> hardware really and it's one month later...
> >>>>>>>>
> >>>>>>>
> >>>>>>> Sorry for waiting. I was in holidays.
> >>>>>>>
> >>>>>>> I'll add more documentation about the external system for more clarity [1].
> >>>>>>>
> >>>>>>> Basically, Linux runs on the Cortex-A35. The External system is a
> >>>>>>> Cortex-M core. The Cortex-A35 can not access the memory of the Cortex-M.
> >>>>>>> It can only control Cortex-M core using the reset control and status registers mapped
> >>>>>>> in the memory space of the Cortex-A35.
> >>>>>>
> >>>>>> That's pretty standard.
> >>>>>>
> >>>>>> It does not explain me why bus addressing or different compatible are
> >>>>>> not sufficient here.
> >>>>>
> >>>>> Using an instance ID was a design choice.
> >>>>> I'm happy to replace it with the use of compatible and match data (WIP).
> >>>>>
> >>>>> The match data will be pointing to a data structure containing the right offsets
> >>>>> to be used with regmap APIs.
> >>>>>
> >>>>> syscon node is used to represent the Host Base System Control register area [1]
> >>>>> where the external system reset registers are mapped (EXT_SYS*).
> >>>>>
> >>>>> The nodes will look like this:
> >>>>>
> >>>>> syscon@1a010000 {
> >>>>>         compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
> >>>>>         reg = <0x1a010000 0x1000>;
> >>>>>
> >>>>>         #address-cells = <1>;
> >>>>>         #size-cells = <1>;
> >>>>>
> >>>>>         remoteproc@310 {
> >>>>>             compatible = "arm,sse710-extsys0";
> >>>>>             reg = <0x310 4>;
> >>>>
> >>>> Uh, why do you create device nodes for one word? This really suggests it
> >>>> is part of parent device and your split is artificial.
> >>>
> >>> The external system registers (described by the remoteproc node) are part
> >>> of the parent device (the Host Base System Control register area) described
> >>> by syscon.
> >>>
> >>> In case of the external system 0 , its registers are located at offset 0x310
> >>> (physical address: 0x1a010310)
> >>>
> >>> When instantiating the devices without @address, the DTC compiler
> >>> detects 2 nodes with the same name (remoteproc).
> >>
> >> There should be no children at all. DT is not for instantiating your
> >> drivers. I claim you have only one device and that's
> >> arm,sse710-host-base-sysctrl. If you create child node for one word,
> >> that's not a device.
> > 
> > The Host Base System Control [3] is the big block containing various functionalities (MMIO registers).
> > Among the functionalities, the two remote cores registers (aka External system 0 and 1).
> > The remote cores have two registers each.
> > 
> > 1/ In the v1 patchset, a valid point was made by the community:
> > 
> >    Right now it seems somewhat tenuous to describe two consecutive
> >    32-bit registers as separate "reg" entries, but *maybe* it's OK if that's
> 
> ARM is not special, neither this hardware is. Therefore:
> 1. Each register as reg: nope, for obvious reasons.
> 2. One device for entire syscon: quite common, why do you think it is
> somehow odd?
> 3. If you quote other person, please provide the lore link, so I won't
> spend useless 5 minutes to find who said that or if it was even said...

Please have a look at this lore link [1]. The idea is to add syscon
and regmap support which I did in the v2 patchset.

[1]: https://lore.kernel.org/all/ZfMVcQsmgQUXXcef@bogus/

> 
> >    all there ever is. However if it's actually going to end up needing several
> >    more additional MMIO and/or memory regions for other functionality, then
> >    describing each register and location individually is liable to get
> >    unmanageable really fast, and a higher-level functional grouping (e.g. these
> >    reset-related registers together as a single 8-byte region) would likely be
> >    a better design.
> > 
> >    The Exernal system registers are part of a bigger block with other functionality in place.
> >    MFD/syscon might be better way to use these registers. You never know in
> >    future you might want to use another set of 2-4 registers with a different
> >    functionality in another driver.
> > 
> >    I would see if it makes sense to put together a single binding for
> >    this "Host Base System Control" register (not sure what exactly that means).
> >    Use MFD/regmap you access parts of this block. The remoteproc driver can
> >    then be semi-generic (meaning applicable to group of similar platforms)
> >    based on the platform compatible and use this regmap to provide the
> >    functionality needed.
> 
> I don't understand how this lengthy semi-quote answers my concerns.
> Please write concise points as arguments to my questions.
> 
> For example, I don't care what your remote proc driver does and it
> should not matter in the terms of this binding.

I just wanted to show why we are using syscon based on the arguments
of other reviewers.

> 
> > 
> > 2/ There are many examples in the kernel that use syscon as a parent node of
> >    child nodes for devices located at an offset from the syscon base address.
> >    Please see these two examples [1][2]. I'm trying to follow a similar design if that
> >    makes sense.
> 
> Yeah, for separate devices. If you have two words without any resources,
> I claim you might not have here any separate devices or "not separate
> enough", because all this is somehow fluid. Remote core sounds like
> separate device, but all your arguments about need of extid which cannot
> be used in reg does not support this case.
> 
> The example in the binding is also not complete - missing rest of
> devices - which does not help.

Here I would like to explain the current suggestion and suggest an alternative solution.

1/ For more clarity, here is a complete example of use of both remote cores
at the same time:

    syscon@1a010000 {
        compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
        reg = <0x1a010000 0x1000>;

        #address-cells = <1>;
        #size-cells = <1>;

        remoteproc@310 {
            compatible = "arm,sse710-extsys0";
            reg = <0x310 8>;
            firmware-name = "es0_flashfw.elf";
            mboxes = <&mhu0_hes0 0 1>, <&mhu0_es0h 0 1>;
            mbox-names = "txes0", "rxes0";
            memory-region = <&extsys0_vring0>, <&extsys0_vring1>;
        };

        remoteproc@318 {
            compatible = "arm,sse710-extsys1";
            reg = <0x318 8>;
            firmware-name = "es1_flashfw.elf";
            mboxes = <&mhu0_hes1 0 1>, <&mhu0_es1h 0 1>;
            mbox-names = "txes0", "rxes0";
            memory-region = <&extsys1_vring0>, <&extsys1_vring1>;
        };
};

Here we have 2 cores, each one have 2 registers mapped respectively
at 0x1a010310 and 0x1a010318.

Definetly these cores have seperate HW resources associated with them
which are the MHUs (mailboxes HW). There are 2 pairs of MHUs associated
with each core. These mailbox peripherals are obviously seperate.
Furthermore, the vring buffers used for communication are seperate.

Moreover, the remote cores are independent. They are not SMP cores of one processor.

They can have different default firmware to use. In this example es0_flashfw.elf
and es1_flashfw.elf

The current HW implementation (Corstone-1000) provides one remote core only.
However, the second core control registers are at 0x1a010318 do exist.

Support for a second core is taken into consideration in this work to help
end users who want to add a second core to their HW.

2/ Here I'm suggesting an alternative solution by using one remoteproc node for both cores as
follows:

    syscon@1a010000 {
        compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
        reg = <0x1a010000 0x1000>;

        remoteproc {
            compatible = "arm,sse710-extsys";
            firmware-name = "es0_flashfw.elf";
            mboxes = <&mhu0_hes0 0 1>, <&mhu0_es0h 0 1>, <&mhu0_hes1 0 1>, <&mhu0_es1h 0 1>;
            mbox-names = "txes0", "rxes0", "txes1", "rxes1";
            memory-region = <&extsys0_vring0>, <&extsys0_vring1>, <&extsys1_vring0>, <&extsys1_vring1>;
        };
};

Does this meet your expectations please ?

> 
> > 
> > 3/ Since there are two registers for each remote core. I'm suggesting to set the
> >    size in the reg property to 8. 
> 
> How is this related?
> 
> > The driver will read the match data to get the right
> >    offset to be used with regmap APIs.
> 
> Sorry, no talks about driver. Don't care, at least in this context.
> 
> You can completely omit address space from children in DT and everything
> will work fine and look fine from bindings point of view.
> 
> > 
> > Suggested nodes:
> > 
> > 
> >     syscon@1a010000 {
> >         compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
> >         reg = <0x1a010000 0x1000>;
> > 
> >         #address-cells = <1>;
> >         #size-cells = <1>;
> > 
> >         remoteproc@310 {
> >             compatible = "arm,sse710-extsys0";
> >             reg = <0x310 8>;
> >             firmware-name = "es_flashfw.elf";
> >             mboxes = <&mhu0_hes0 0 1>, <&mhu0_es0h 0 1>;
> >             mbox-names = "txes0", "rxes0";
> >             memory-region = <&extsys0_vring0>, <&extsys0_vring1>;
> >         };
> > 
> >         remoteproc@318 {
> >             compatible = "arm,sse710-extsys1";
> >             reg = <0x318 8>;
> >             firmware-name = "es_flashfw.elf";
> 
> Same firmware? Always or only depends?

The firmware of the second core depends on the end user choice.
Currently the second core is not implemented in the HW.
Users who want to tweak Corstone-1000 HW can add
a second core.

Kind regards
Abdellatif
