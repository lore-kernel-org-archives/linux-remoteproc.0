Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC68256C87;
	Fri, 19 Sep 2025 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758264424; cv=none; b=gLCGlyzibdAgXOw2K3eGnDLkX2iuGBxdFmzCqJTFw6cU9yPQ0VuZidloz2eWyskNjhuimbz1T8gC8Buht1796KLV5nhhTopaBwEJU66Re+nRu01dsgV6e6JGH+d2wDKm/8OZjq6v6mnittdIQBNkFGzb67rX9onXUVsq/8hnzQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758264424; c=relaxed/simple;
	bh=pLaEnpTnpJkbVncOKDkmtqzB0cxeO1f90aiHkxT3Bs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XeS6lxeyhrbL3cU7CGheA38s1QtKZW3hHnYrY6cE9NFd6+INM98qGc3FONew1FPkUTz9Lo//HfUmUE8N8P+sz+HMcaZlpF/WvGnqjTe+O568WjfKPamfJriuXZsjR5rhKfFSueiHdWRo3ySZ3Hvp6yoGegIkv6SAA9EceCYhwcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McfkvYz9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McfkvYz9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C15C4CEF0;
	Fri, 19 Sep 2025 06:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758264422;
	bh=pLaEnpTnpJkbVncOKDkmtqzB0cxeO1f90aiHkxT3Bs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=McfkvYz9N2Dn5IpWIm1f22sORKdeaIAWk9//sOUrHKTovOFCjNrMnlYSZdH/dQJ3f
	 ufyqDzt713AkV3x/F6tTk4tVFHN+8+YWdtrYudvWi7/0njdQfkeLm+6jaEWFe791yl
	 +EHBYC1UlIXxFXRGzrUaBdjEtY3za2uWJf0o21aDW8Z56VY5UtMDIRCqaY4Mr1MkhT
	 QtDZ2rA6pN0xCKWe7emGBB6GDXsJSuQ7BmaPEIByNLrSREwKvRxEK46HSJw4Flv6F1
	 K8vQ/LqpBHg0lA281GKk2mok0LOAZ5K3kwvdn7LTzkzUju+IM8uzzdOu+kUVVUK/G7
	 VRJivKQxZZUDA==
Date: Fri, 19 Sep 2025 12:16:54 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v19 4/6] dt-bindings: remoteproc: Add compatibility for
 TEE support
Message-ID: <aMz8XuHzIomNhmra@sumit-X1>
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
 <20250625094028.758016-5-arnaud.pouliquen@foss.st.com>
 <aMkqifHSdlCs4VjA@sumit-X1>
 <62bdb238-7440-451b-84ef-79f846b10ba0@foss.st.com>
 <aMqIhFdIqp5auH22@sumit-X1>
 <8d385f2e-6470-4d66-be0b-a2a448a81fa4@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d385f2e-6470-4d66-be0b-a2a448a81fa4@foss.st.com>

On Wed, Sep 17, 2025 at 03:47:40PM +0200, Arnaud POULIQUEN wrote:
> 
> 
> On 9/17/25 12:08, Sumit Garg wrote:
> > On Tue, Sep 16, 2025 at 03:26:47PM +0200, Arnaud POULIQUEN wrote:
> > > Hello Sumit,
> > > 
> > > On 9/16/25 11:14, Sumit Garg wrote:
> > > > Hi Arnaud,
> > > > 
> > > > First of all apologies for such a late review comment as previously I
> > > > wasn't CCed or involved in the review of this patch-set. In case any of
> > > > my following comments have been discussed in the past then feel free to
> > > > point me at relevant discussions.
> > > No worries, there are too many versions of this series to follow all the
> > > past discussions. I sometimes have difficulty remembering all the
> > > discussions myself :)
> > > 
> > > > On Wed, Jun 25, 2025 at 11:40:26AM +0200, Arnaud Pouliquen wrote:
> > > > > The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
> > > > > where the Cortex-M4 firmware is loaded by the Trusted Execution Environment
> > > > > (TEE).
> > > > Having a DT based compatible for a TEE service to me just feels like it
> > > > is redundant here. I can see you have also used a TEE bus based device
> > > > too but that is not being properly used. I know subsystems like
> > > > remoteproc, SCMI and others heavily rely on DT to hardcode properties of
> > > > system firmware which are rather better to be discovered dynamically.
> > > > 
> > > > So I have an open question for you and the remoteproc subsystem
> > > > maintainers being:
> > > > 
> > > > Is it feasible to rather leverage the benefits of a fully discoverable
> > > > TEE bus rather than relying on platform bus/ DT to hardcode firmware
> > > > properties?
> > > The discoverable TEE bus does not works if the remoteproc is probed
> > > before the OP-TEE bus, in such case  no possibility to know if the TEE
> > > TA is not yet available or not available at all.
> > > This point is mentioned in a comment in rproc_tee_register().
> 
> For the discussion, it’s probably better if I provide more details on the
> current OP-TEE implementation and the stm32mp processors.
> 
> 1) STM32MP topology:
>   - STM32MP1: only a Cortex-M4 remote processor
>   -  STM32MP2x: a Cortex-M33 and a Cortex-M0 remote processors
>   At this stage, only the STM32MP15 is upstreamed; the STM32MP25 is waiting
>   for this series to be merged.
> 
> 2) OP-TEE architecture:
> - A platform-agnostic Trusted Application (TA) handles the bus service.[1]
>   This TA supports managing multiple remote processors. It can be embedded
>   regardless of the number of remote processors managed in OP-TEE.
>   The decision to embed this service is made at build time based on the
>   presence of the remoteproc driver, so it is not device tree dependent.
>   - STM32MP15: TA activated only if the remoteproc OP-TEE driver is probed
>   - STM32MP2x: TA always activated as the OP-TEE remoteproc driver is always
> probed
> 
> - A pseudo Trusted Application implements the platform porting[2],
>   relying on registered remoteproc platform drivers.
> 
> - Platform driver(s) manage the remote processors.[3][4]
>   - If remoteproc is managed by OP-TEE: manages the remoteproc lifecycle
>   - If remoteproc is managed by Linux: provides access rights to Linux to
> manage
>     the remoteproc
> 
>   - STM32MP15: driver probed only if the remoteproc is managed in OP-TEE
>   - STM32MP2x: driver probed in both cases for the Cortex-M33
>     For the STM32MP25, the TA is always present and queries the driver to
> check
>     if it supports secure loading.
> 
> 
> [1] https://elixir.bootlin.com/op-tee/4.7.0/source/ta/remoteproc
> [2] https://elixir.bootlin.com/op-tee/4.7.0/source/core/pta/stm32mp/remoteproc_pta.c
> [3]https://elixir.bootlin.com/op-tee/4.7.0/source/core/drivers/remoteproc/stm32_remoteproc.c
> [4]https://github.com/STMicroelectronics/optee_os/blob/4.0.0-stm32mp/core/drivers/remoteproc/stm32_remoteproc.c

Thanks for the background here.

> 
> > The reason here is that you are mixing platform and TEE bus for remoteproc
> > driver. For probe, you rely on platform bus and then try to migrate to
> > TEE bus via rproc_tee_register() is the problem here. Instead you should
> > rather probe remoteproc device on TEE bus from the beginning.
> 
> The approach is interesting, but how can we rely on Device Tree (DT) for
> hardware configuration in this case?
> At a minimum, I need to define memory regions and mailboxes.

The hardware configuration in DT should be consumed by OP-TEE and the
kernel probes remoteproc properties from OP-TEE since it's an OP-TEE
mediated remoteproc service you are adding here.

> 
> From my perspective, I would still need a driver probed by DT that registers
> a driver on the TEE bus. Therefore, I still need a mechanism to decide
> whether the remote firmware is managed by the secure or non-secure context.

As I mentioned below, this should be achievable using the secure-status
property without introducing the new compatible:

Kernel managed remoteproc:
   status = "okay"; secure-status = "disabled";     /* NS-only */

OP-TEE managed remoteproc:
   status = "disabled"; secure-status = "okay";     /* S-only */

> 
> Another issue would be to be able to share the remoteproc TEE service
> between
> several platform remoteproc drivers, in case of multi remote processor
> support.

Making the TEE based remoteproc service independent of DT will surely
make it more scalable to other platforms too. Have a look at how OP-TEE
based HWRNG service scales across platforms.

> 
> > 
> > > Then, it is not only a firmware property in our case. Depending on the
> > > compatible string, we manage the hardware differently. The same compatibles
> > > are used in both OP-TEE and Linux. Based on the compatible, we can assign
> > > memories, clocks, and resets to either the secure or non-secure context.
> > > This approach is implemented on the STM32MP15 and STM32MP2x platforms.
> > You should have rather used the DT property "secure-status" [1] to say
> > the remoteproc device is being managed by OP-TEE instead of Linux. Then
> > the Linux driver will solely rely on TEE bus to have OP-TEE mediated
> > remoteproc device.
> > 
> > [1] https://github.com/devicetree-org/dt-schema/blob/4b28bc79fdc552f3e0b870ef1362bb711925f4f3/dtschema/schemas/dt-core.yaml#L52
> 
> My issue with this property is that this would break the compatibility with
> legacy DT that only support loading by Linux

No, it's not a DT ABI break at all. It is always possible for a
hardware to be re-configured to change assignment of peripherals among
OP-TEE and Linux kernel.

> As specified in [5] :If "secure-status" is not specified it defaults to the
> same value as "status"; [5]
> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/secure.txt

This is mostly meant for peripherals that can be probed by both OP-TEE
and Linux kernel via DT. But here in case of remoteproc, there needs to
exclusive access control for either via Linux kernel or OP-TEE. Hence, the
"status" and "secure-status" properties should be updated accordingly.

> 
> > > More details are available in the ST WIKI:
> > > https://wiki.st.com/stm32mpu/wiki/OP-TEE_remoteproc_framework_overview#Device_tree_configuration
> > > https://wiki.st.com/stm32mpu/wiki/Linux_remoteproc_framework_overview#Device_tree_configuration
> > > 
> > > > > For instance, this compatible is used in both the Linux and OP-TEE device
> > > > > trees:
> > > > > - In OP-TEE, a node is defined in the device tree with the
> > > > >     "st,stm32mp1-m4-tee" compatible to support signed remoteproc firmware.
> > > > >     Based on DT properties, the OP-TEE remoteproc framework is initiated to
> > > > >     expose a trusted application service to authenticate and load the remote
> > > > >     processor firmware provided by the Linux remoteproc framework, as well
> > > > >     as to start and stop the remote processor.
> > > > > - In Linux, when the compatibility is set, the Cortex-M resets should not
> > > > >     be declared in the device tree. In such a configuration, the reset is
> > > > >     managed by the OP-TEE remoteproc driver and is no longer accessible from
> > > > >     the Linux kernel.
> > > > > 
> > > > > Associated with this new compatible, add the "st,proc-id" property to
> > > > > identify the remote processor. This ID is used to define a unique ID,
> > > > > common between Linux, U-Boot, and OP-TEE, to identify a coprocessor.
> > > > This "st,proc-id" is just one such property which can rather be directly
> > > > probed from the TEE/OP-TEE service rather than hardcoding it in DT here.
> > > Do you mean a topology discovery mechanism through the TEE remoteproc
> > > service?
> > > 
> > > For the STM32MP15, it could work since we have only one remote processor.
> > > However, this is not the case for the STM32MP25, which embeds both a
> > > Cortex-M33 and a Cortex-M0.
> > I rather mean here whichever properties you can currently dicovering via
> > DT can rather be discovered by invoke command taking property name as input
> > and value as output.
> 
> That would means services to get system resources such as memory region
> mailbox, right?

Yeah.

> 
> > 
> > > Could you please elaborate on how you see the support of multiple remote
> > > processors without using an hardcoded identifier?
> > By multiple remote processors, do you mean there can be multiple
> > combinations of which remote processor gets managed via OP-TEE or not?
> 
> On stm32mp25 we have 2 remote processors a cortex-M33 and a cortex-M0
> We should be able to manage them using the proc_idAnother point is that We
> should allow an other Secure OS could implement the TEE remoteproc service
> managing the remote processors with different proc_id values, to avoid to
> specify somewhere an unique proc ID per remote processor.

Okay I see, so you can add unique proc ID to DT which gets consumed by
OP-TEE and Linux discovers the same via the TEE service.

> 
> > > > I think the same will apply to other properties as well.
> > > Could you details the other properties you have in mind?
> > I think the memory regions including the resource table can also be
> > probed directly from the TEE service too. Is there any other DT property
> > you rely upon when remoteproc is managed via OP-TEE?
> 
> The memory regions that include the resource table are already declared
> in OP-TEE. The memory regions defined in the Linux device tree are for
> RPMsg (IPC). These memories are registered by the Linux remoteproc driver
> in the Linux rproc core.
>

Sure, so they can also be discovered by TEE service.

-Sumit
