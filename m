Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEF280038;
	Mon, 23 Sep 2024 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727092197; cv=none; b=krT8RT3vTbGxO28+pPLX+daHVo0QBT2iZyHoqdbYw4/G7R1ikvPhBmYy82fRZJAH0aT8xFsT6BIEwVr03hIh8HBJt7EPk3z/LPdRxrHE/+twI9muQC9naNCXA/usC3/3+i1NKwUCw+X3t6fmSGFF1c7hJXwEgD7eqVdonTsBrVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727092197; c=relaxed/simple;
	bh=M6MmUdrGNVqZ7bNIkDKakEbWPtMcakTwhQENeMww/d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cS19//uxRa4mmsPNBwFuhdeaCyaSAJajfZEM53Mo8JPRq4r6sFXdkw6WYJoNZAPKlaju/PMEKrSg9r//d80pLwFSiAZKiahNObW2cKGN3SYV6iap2nooR/X1hKcBOid9o9B8Sie/B/obewA8HDiNhV8TtUg4Jl8+FCi401EwGNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23BA31007;
	Mon, 23 Sep 2024 04:50:23 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.57.53.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64DD03F64C;
	Mon, 23 Sep 2024 04:49:50 -0700 (PDT)
Date: Mon, 23 Sep 2024 12:49:45 +0100
From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Message-ID: <20240923114945.GA133670@e130802.arm.com>
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
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e37a0542-d405-4d15-84d2-4c7b1385d3ef@kernel.org>

Hi Krzysztof,

> >>>>>>>>> +  '#extsys-id':
> >>>>>>>>
> >>>>>>>> '#' is not correct for sure, that's not a cell specifier.
> >>>>>>>>
> >>>>>>>> But anyway, we do not accept in general instance IDs.
> >>>>>>>
> >>>>>>> I'm happy to replace the instance ID with  another solution.
> >>>>>>> In our case the remoteproc instance does not have a base address
> >>>>>>> to use. So, we can't put remoteproc@address
> >>>>>>>
> >>>>>>> What do you recommend in this case please ?
> >>>>>>
> >>>>>> Waiting one month to respond is a great way to drop all context from my
> >>>>>> memory. The emails are not even available for me - gone from inbox.
> >>>>>>
> >>>>>> Bus addressing could note it. Or you have different devices, so
> >>>>>> different compatibles. Tricky to say, because you did not describe the
> >>>>>> hardware really and it's one month later...
> >>>>>>
> >>>>>
> >>>>> Sorry for waiting. I was in holidays.
> >>>>>
> >>>>> I'll add more documentation about the external system for more clarity [1].
> >>>>>
> >>>>> Basically, Linux runs on the Cortex-A35. The External system is a
> >>>>> Cortex-M core. The Cortex-A35 can not access the memory of the Cortex-M.
> >>>>> It can only control Cortex-M core using the reset control and status registers mapped
> >>>>> in the memory space of the Cortex-A35.
> >>>>
> >>>> That's pretty standard.
> >>>>
> >>>> It does not explain me why bus addressing or different compatible are
> >>>> not sufficient here.
> >>>
> >>> Using an instance ID was a design choice.
> >>> I'm happy to replace it with the use of compatible and match data (WIP).
> >>>
> >>> The match data will be pointing to a data structure containing the right offsets
> >>> to be used with regmap APIs.
> >>>
> >>> syscon node is used to represent the Host Base System Control register area [1]
> >>> where the external system reset registers are mapped (EXT_SYS*).
> >>>
> >>> The nodes will look like this:
> >>>
> >>> syscon@1a010000 {
> >>>         compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
> >>>         reg = <0x1a010000 0x1000>;
> >>>
> >>>         #address-cells = <1>;
> >>>         #size-cells = <1>;
> >>>
> >>>         remoteproc@310 {
> >>>             compatible = "arm,sse710-extsys0";
> >>>             reg = <0x310 4>;
> >>
> >> Uh, why do you create device nodes for one word? This really suggests it
> >> is part of parent device and your split is artificial.
> > 
> > The external system registers (described by the remoteproc node) are part
> > of the parent device (the Host Base System Control register area) described
> > by syscon.
> > 
> > In case of the external system 0 , its registers are located at offset 0x310
> > (physical address: 0x1a010310)
> > 
> > When instantiating the devices without @address, the DTC compiler
> > detects 2 nodes with the same name (remoteproc).
> 
> There should be no children at all. DT is not for instantiating your
> drivers. I claim you have only one device and that's
> arm,sse710-host-base-sysctrl. If you create child node for one word,
> that's not a device.

The Host Base System Control [3] is the big block containing various functionalities (MMIO registers).
Among the functionalities, the two remote cores registers (aka External system 0 and 1).
The remote cores have two registers each.

1/ In the v1 patchset, a valid point was made by the community:

   Right now it seems somewhat tenuous to describe two consecutive
   32-bit registers as separate "reg" entries, but *maybe* it's OK if that's
   all there ever is. However if it's actually going to end up needing several
   more additional MMIO and/or memory regions for other functionality, then
   describing each register and location individually is liable to get
   unmanageable really fast, and a higher-level functional grouping (e.g. these
   reset-related registers together as a single 8-byte region) would likely be
   a better design.

   The Exernal system registers are part of a bigger block with other functionality in place.
   MFD/syscon might be better way to use these registers. You never know in
   future you might want to use another set of 2-4 registers with a different
   functionality in another driver.

   I would see if it makes sense to put together a single binding for
   this "Host Base System Control" register (not sure what exactly that means).
   Use MFD/regmap you access parts of this block. The remoteproc driver can
   then be semi-generic (meaning applicable to group of similar platforms)
   based on the platform compatible and use this regmap to provide the
   functionality needed.

2/ There are many examples in the kernel that use syscon as a parent node of
   child nodes for devices located at an offset from the syscon base address.
   Please see these two examples [1][2]. I'm trying to follow a similar design if that
   makes sense.

3/ Since there are two registers for each remote core. I'm suggesting to set the
   size in the reg property to 8. The driver will read the match data to get the right
   offset to be used with regmap APIs.

Suggested nodes:


    syscon@1a010000 {
        compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
        reg = <0x1a010000 0x1000>;

        #address-cells = <1>;
        #size-cells = <1>;

        remoteproc@310 {
            compatible = "arm,sse710-extsys0";
            reg = <0x310 8>;
            firmware-name = "es_flashfw.elf";
            mboxes = <&mhu0_hes0 0 1>, <&mhu0_es0h 0 1>;
            mbox-names = "txes0", "rxes0";
            memory-region = <&extsys0_vring0>, <&extsys0_vring1>;
        };

        remoteproc@318 {
            compatible = "arm,sse710-extsys1";
            reg = <0x318 8>;
            firmware-name = "es_flashfw.elf";
            mboxes = <&mhu0_hes1 0 1>, <&mhu0_es1h 0 1>;
            mbox-names = "txes0", "rxes0";
            memory-region = <&extsys1_vring0>, <&extsys1_vring1>;
        };
};


[1]: Documentation/devicetree/bindings/clock/sprd,sc9863a-clk.yaml

    syscon@20e00000 {
      compatible = "sprd,sc9863a-glbregs", "syscon", "simple-mfd";
      reg = <0x20e00000 0x4000>;
      #address-cells = <1>;
      #size-cells = <1>;
      ranges = <0 0x20e00000 0x4000>;

      apahb_gate: apahb-gate@0 {
        compatible = "sprd,sc9863a-apahb-gate";
        reg = <0x0 0x1020>;
        #clock-cells = <1>;
      };
    };


[2]: Documentation/devicetree/bindings/arm/arm,juno-fpga-apb-regs.yaml:

    syscon@10000 {
        compatible = "arm,juno-fpga-apb-regs", "syscon", "simple-mfd";
        reg = <0x010000 0x1000>;
        ranges = <0x0 0x10000 0x1000>;
        #address-cells = <1>;
        #size-cells = <1>;

        led@8,0 {
            compatible = "register-bit-led";
            reg = <0x08 0x04>;
            offset = <0x08>;
            mask = <0x01>;
            label = "vexpress:0";
            linux,default-trigger = "heartbeat";
            default-state = "on";
        };
    };

[3]: https://developer.arm.com/documentation/102342/0000/Programmers-model/Register-descriptions/Host-Base-System-Control-register-summary

Cheers,
Abdellatif
