Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C95228EF;
	Wed,  9 Oct 2024 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728467210; cv=none; b=U0XvfHdyQnQmYJ6dxiSjydViq3zkd9jWvUgBXd+3wU3Jz+5q5rY/xLjkYLamFbp5JwQTQNJLmn9ZJt6IaU0y13tLJqJvYmQxKzdmkolljnz/RwGiAcS30R+D2nbmjR4BP+MjLv4Q2nOQ/T8Jx8axlBufLdZ/AKgMKZf19cYoYR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728467210; c=relaxed/simple;
	bh=+/1qdEErw7r4OmVk0Wcg57j8okPyhJ1yRcVclaa3YsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUWfR2mkayc/1+ZMj67W2/A6po1zkRu+IzqlV+7zbkLg7evVnxsKLiO10HYfOLPSNU+gQ8HpzfESz/N5S/uKxBld9yXwWsJo44SXK2RTkuRTgDLeSj8eCsGCwDGc7o3sMoNVWXnTON5EtuvNLcxbr21xWVBuAMGFO8x18bdR+3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2FF0FEC;
	Wed,  9 Oct 2024 02:47:16 -0700 (PDT)
Received: from e130802.arm.com (unknown [10.1.25.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05F4C3F64C;
	Wed,  9 Oct 2024 02:46:43 -0700 (PDT)
Date: Wed, 9 Oct 2024 10:46:35 +0100
From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
To: mathieu.poirier@linaro.org, krzysztof.kozlowski+dt@linaro.org,
	robh@kernel.org, robin.murphy@arm.com
Cc: Adam.Johnston@arm.com, Hugues.KambaMpiana@arm.com, Drew.Reed@arm.com,
	andersson@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	liviu.dudau@arm.com, lpieralisi@kernel.org, sudeep.holla@arm.com
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: sse710: Add the External
 Systems remote processors
Message-ID: <20241009094635.GA14639@e130802.arm.com>
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
 <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>
 <ce534365-0110-4aba-b8b5-0a46c5ea81d0@arm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce534365-0110-4aba-b8b5-0a46c5ea81d0@arm.com>

Hello folks,

> On 22/08/2024 6:09 pm, Abdellatif El Khlifi wrote:
> > Add devicetree binding schema for the External Systems remote processors
> > 
> > The External Systems remote processors are provided on the Corstone-1000
> > IoT Reference Design Platform via the SSE-710 subsystem.
> > 
> > For more details about the External Systems, please see Corstone SSE-710
> > subsystem features [1].
> > 
> > [1]: https://developer.arm.com/documentation/102360/0000/Overview-of-Corstone-1000/Corstone-SSE-710-subsystem-features
> > 
> > Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> > ---
> >   .../remoteproc/arm,sse710-extsys.yaml         | 90 +++++++++++++++++++
> >   1 file changed, 90 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml b/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> > new file mode 100644
> > index 000000000000..827ba8d962f1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> > @@ -0,0 +1,90 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/remoteproc/arm,sse710-extsys.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SSE-710 External System Remote Processor
> 
> Thing is, this is not describing SSE-710. As far as I can work out, it is
> describing the firmware and hardware that a particular example
> implementation of the Corstone-1000 kit has chosen to put in the "external
> system" hole in the SSE-710 within that kit.
> 
> If I license SSE-710 alone or even the Corstone-1000 kit, I can put whatever
> I want in *my* implementation of those subsystems, so there clearly cannot
> possibly be a common binding for that.
> 
> For instance what if I decide to combine a Cortex-M core plus a radio and
> some other glue as my external subsystem? Do we have dozens of remoteproc
> bindings and drivers for weird fixed-function remoteprocs whose
> "firmware-name" implies a Bluetooth protocol stack? No, we treat them as
> Bluetooth controller devices. Look at
> devicetree/bindings/sound/fsl,rpmsg.yaml - it's even unashamedly an rpmsg
> client, but it's still not abusing the remoteproc subsystem because its
> function to the host OS is as an audio controller, not an arbitrarily
> configurable processor.
> 
> As I said before, all SSE-710 actually implements is a reset mechanism, so
> it only seems logical to model it as a reset controller, e.g. something
> like:
> 
> 	hbsys: syscon@xyz {
> 		compatible = "arm,sse710-host-base-sysctrl", "syscon";
> 		reg = <xyz>;
> 		#reset-cells = <1>;
> 	};
> 
> 	something {
> 		...
> 		resets = <&hbsys 0>;
> 	};
> 
> 	something-else {
> 		...
> 		resets = <&hbsys 1>;
> 	};
> 
> 
> Then if there is actually any meaningful functionality in the default
> extsys0 firmware preloaded on the FPGA setup then define a binding for
> "arm,corstone1000-an550-extsys0" to describe whatever that actually does. If
> a user chooses to create and load their own different firmware, they're
> going to need their own binding and driver for whatever *that* firmware
> does.
> 
> FWIW, driver-wise the mapping to the reset API seems straightforward -
> .assert hits RST_REQ, .deassert clears CPUWAIT (.status is possibly a
> combination of CPUWAIT and RST_ACK?)

We are happy to follow what Robin recommended.

This can be summarized in two parts:

Part 1: Writing an SSE-710 reset controller driver

    An SSE-710 reset controller driver that switches on/off the external system.
    The driver will be helpful for products using SSE-710. So whoever licenses
    Corstone-1000 or SSE-710 will find the reset controller driver helpful.
    They can use it with their implementation of the external system.

    Note: It's likely that the external systems the end user will be using in
    their products will be different from the Corstone-1000 external system
    given as an example. Differences in the memory configuration, subsystem
    involved, boot roms configurations, ...
    These differences mean that the end user will need to write their own driver
    which might or might not be a remoteproc driver (e.g: Bluetooth, audio, ...).

Part 2: Corstone-1000 remoteproc driver

    Corstone-1000 HW is being upgraded to support memory sharing between the
    Cortex-A35 (Linux) and the external system (Cortex-M3).

    Once the HW is ready, we can write a Corstone-1000 remoteproc driver able
    to reload the external system firmware and doing communication with the MHUs.
    This remoteproc driver can use the reset subsystem APIs to call the SSE-710
    reset controller driver to switch on/off the external system (already
    developed in part 1).

Impact on the current patchset:

- The current remoteproc patchset will be paused until the HW is upgraded.
- In CY25Q1, I'll send to the mailing list the SSE-710 reset controller bindings
  and a driver under the Reset Controller subsystem.

Thank you for your support and expertise.

Cheers,
Abdellatif
