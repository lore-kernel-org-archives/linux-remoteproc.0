Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360E51DB375;
	Sat, 11 Oct 2025 22:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760223011; cv=none; b=Ilo72rnaUNvlMzGvHjxjzelBL1gsVq6oQkkzL15jpZqJwq7R/srvmqc4qKMJGri+znMi6LuhTS9Bqrr8CogGHNWk7YXnw4bvqJ1WUEl9ta4iKH05hFHmMnukDKx7TlRUYMJIKyhrckeLz20Ni7D5dQ1NAANMK4a8l06gU6VbKa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760223011; c=relaxed/simple;
	bh=8rlqFhD7ZDNHiDK9F+hmopZq5lvaCROu4QqhzxSLJCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUm1wqPZ2ECilj3QLmx1Asv0pu01//wGHhwMvGr8AFGT/JUUYaFwDJiubbf6fwpxAQfZ3IUkYgqM/OpUEhdbva2TyNAk6MlS3DBVaiov5yPk/6TWsAPPrqGjvHLTZ079Yp7NbpwfKa3igj4LpioiXNGARX8R5WcaVOo6Hav32n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uKlBcofK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uKlBcofK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B02C113D0;
	Sat, 11 Oct 2025 22:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760223011;
	bh=8rlqFhD7ZDNHiDK9F+hmopZq5lvaCROu4QqhzxSLJCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uKlBcofKUKRjo2BHu/CHNzYm8Kw0YmmQ/Cb4sj2HgU71lnMVq3900L679BCX7Nkqc
	 ALjHDzaQu5rpjG05IMMlR28jpT6bmR5RxXHuCDvM3XMsJSpzhkX2+4XiK7PeZvtYiO
	 DPIy4qqpCFWCvBctjA6l48xnooOhDmc/tXLPc2+b8QJbLme1RGW1npb9mjX5F5WQTd
	 /jXTBsgPz9DtvVoxU9I5Vywis7TlKL+jf7XP0sw93FRGvXo9as20NaUU8N4b+uXIk0
	 z5RpHKbabOEEleJIe7b+iL/Em/tyNDyiOe4bfkTgpLbNZp9T79VmMq/7NjyOrBxrzn
	 o5Cz87/N+JGFg==
Date: Sun, 12 Oct 2025 04:19:48 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	op-tee@lists.trustedfirmware.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v19 4/6] dt-bindings: remoteproc: Add
 compatibility for TEE support
Message-ID: <aOrfDH1HnPSILtFE@sumit-X1>
References: <20250625094028.758016-5-arnaud.pouliquen@foss.st.com>
 <aMkqifHSdlCs4VjA@sumit-X1>
 <62bdb238-7440-451b-84ef-79f846b10ba0@foss.st.com>
 <aMqIhFdIqp5auH22@sumit-X1>
 <8d385f2e-6470-4d66-be0b-a2a448a81fa4@foss.st.com>
 <aMz8XuHzIomNhmra@sumit-X1>
 <0e5a44df-f60a-4523-a791-6318b3c81425@foss.st.com>
 <f5b0e106-a731-461b-b401-1aa1f9892465@foss.st.com>
 <aOidN1N3GIOcsXd1@sumit-X1>
 <929ce1f6-818f-4bb9-abf9-24d511bd2bf3@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <929ce1f6-818f-4bb9-abf9-24d511bd2bf3@foss.st.com>

On Fri, Oct 10, 2025 at 12:04:40PM +0200, Arnaud POULIQUEN wrote:
> Hi Sumit,
> 
> On 10/10/25 07:44, Sumit Garg wrote:
> > Hi Arnaud,
> > 
> > It's been some holidays followed by business travel leading to delay in
> > my response here.
> > 
> > On Tue, Oct 07, 2025 at 03:50:32PM +0200, Arnaud POULIQUEN wrote:
> > > Hello Bjorn, Mathieu, Sumit,
> > > 
> > > On 9/22/25 10:57, Arnaud POULIQUEN wrote:
> > > > 
> > > > 
> > > > On 9/19/25 08:46, Sumit Garg wrote:
> > > > > On Wed, Sep 17, 2025 at 03:47:40PM +0200, Arnaud POULIQUEN wrote:
> > > > > > 
> > > > > > On 9/17/25 12:08, Sumit Garg wrote:
> > > > > > > On Tue, Sep 16, 2025 at 03:26:47PM +0200, Arnaud POULIQUEN wrote:
> > > > > > > > Hello Sumit,
> > > > > > > > 
> > > > > > > > On 9/16/25 11:14, Sumit Garg wrote:
> > > > > > > > > Hi Arnaud,
> > > > > > > > > 
> > > > > > > > > First of all apologies for such a late review comment as previously I
> > > > > > > > > wasn't CCed or involved in the review of this
> > > > > > > > > patch-set. In case any of
> > > > > > > > > my following comments have been discussed in the
> > > > > > > > > past then feel free to
> > > > > > > > > point me at relevant discussions.
> > > > > > > > No worries, there are too many versions of this series
> > > > > > > > to follow all the
> > > > > > > > past discussions. I sometimes have difficulty remembering all the
> > > > > > > > discussions myself :)
> > > > > > > > 
> > > > > > > > > On Wed, Jun 25, 2025 at 11:40:26AM +0200, Arnaud Pouliquen wrote:
> > > > > > > > > > The "st,stm32mp1-m4-tee" compatible is utilized
> > > > > > > > > > in a system configuration
> > > > > > > > > > where the Cortex-M4 firmware is loaded by the
> > > > > > > > > > Trusted Execution Environment
> > > > > > > > > > (TEE).
> > > > > > > > > Having a DT based compatible for a TEE service to me
> > > > > > > > > just feels like it
> > > > > > > > > is redundant here. I can see you have also used a
> > > > > > > > > TEE bus based device
> > > > > > > > > too but that is not being properly used. I know subsystems like
> > > > > > > > > remoteproc, SCMI and others heavily rely on DT to
> > > > > > > > > hardcode properties of
> > > > > > > > > system firmware which are rather better to be discovered dynamically.
> > > > > > > > > 
> > > > > > > > > So I have an open question for you and the remoteproc subsystem
> > > > > > > > > maintainers being:
> > > > > > > > > 
> > > > > > > > > Is it feasible to rather leverage the benefits of a
> > > > > > > > > fully discoverable
> > > > > > > > > TEE bus rather than relying on platform bus/ DT to hardcode firmware
> > > > > > > > > properties?
> > > > > > > > The discoverable TEE bus does not works if the remoteproc is probed
> > > > > > > > before the OP-TEE bus, in such case  no possibility to know if the TEE
> > > > > > > > TA is not yet available or not available at all.
> > > > > > > > This point is mentioned in a comment in rproc_tee_register().
> > > > > > For the discussion, it’s probably better if I provide more
> > > > > > details on the
> > > > > > current OP-TEE implementation and the stm32mp processors.
> > > > > > 
> > > > > > 1) STM32MP topology:
> > > > > >     - STM32MP1: only a Cortex-M4 remote processor
> > > > > >     -  STM32MP2x: a Cortex-M33 and a Cortex-M0 remote processors
> > > > > >     At this stage, only the STM32MP15 is upstreamed; the
> > > > > > STM32MP25 is waiting
> > > > > >     for this series to be merged.
> > > > > > 
> > > > > > 2) OP-TEE architecture:
> > > > > > - A platform-agnostic Trusted Application (TA) handles the bus
> > > > > > service.[1]
> > > > > >     This TA supports managing multiple remote processors. It can
> > > > > > be embedded
> > > > > >     regardless of the number of remote processors managed in OP-TEE.
> > > > > >     The decision to embed this service is made at build time based on the
> > > > > >     presence of the remoteproc driver, so it is not device tree
> > > > > > dependent.
> > > > > >     - STM32MP15: TA activated only if the remoteproc OP-TEE
> > > > > > driver is probed
> > > > > >     - STM32MP2x: TA always activated as the OP-TEE remoteproc
> > > > > > driver is always
> > > > > > probed
> > > > > > 
> > > > > > - A pseudo Trusted Application implements the platform porting[2],
> > > > > >     relying on registered remoteproc platform drivers.
> > > > > > 
> > > > > > - Platform driver(s) manage the remote processors.[3][4]
> > > > > >     - If remoteproc is managed by OP-TEE: manages the remoteproc
> > > > > > lifecycle
> > > > > >     - If remoteproc is managed by Linux: provides access rights
> > > > > > to Linux to
> > > > > > manage
> > > > > >       the remoteproc
> > > > > > 
> > > > > >     - STM32MP15: driver probed only if the remoteproc is managed
> > > > > > in OP-TEE
> > > > > >     - STM32MP2x: driver probed in both cases for the Cortex-M33
> > > > > >       For the STM32MP25, the TA is always present and queries the
> > > > > > driver to
> > > > > > check
> > > > > >       if it supports secure loading.
> > > > > > 
> > > > > > 
> > > > > > [1] https://elixir.bootlin.com/op-tee/4.7.0/source/ta/remoteproc
> > > > > > [2]
> > > > > > https://elixir.bootlin.com/op-tee/4.7.0/source/core/pta/stm32mp/
> > > > > > remoteproc_pta.c
> > > > > > [3]https://elixir.bootlin.com/op-tee/4.7.0/source/core/drivers/
> > > > > > remoteproc/stm32_remoteproc.c
> > > > > > [4]https://github.com/STMicroelectronics/optee_os/blob/4.0.0-stm32mp/
> > > > > > core/drivers/remoteproc/stm32_remoteproc.c
> > > > > Thanks for the background here.
> > > > > 
> > > > > > > The reason here is that you are mixing platform and TEE bus
> > > > > > > for remoteproc
> > > > > > > driver. For probe, you rely on platform bus and then try to migrate to
> > > > > > > TEE bus via rproc_tee_register() is the problem here.
> > > > > > > Instead you should
> > > > > > > rather probe remoteproc device on TEE bus from the beginning.
> > > > > > The approach is interesting, but how can we rely on Device Tree (DT) for
> > > > > > hardware configuration in this case?
> > > > > > At a minimum, I need to define memory regions and mailboxes.
> > > > > The hardware configuration in DT should be consumed by OP-TEE and the
> > > > > kernel probes remoteproc properties from OP-TEE since it's an OP-TEE
> > > > > mediated remoteproc service you are adding here.
> > > > > >   From my perspective, I would still need a driver probed by DT
> > > > > > that registers
> > > > > > a driver on the TEE bus. Therefore, I still need a mechanism to decide
> > > > > > whether the remote firmware is managed by the secure or
> > > > > > non-secure context.
> > > > > As I mentioned below, this should be achievable using the secure-status
> > > > > property without introducing the new compatible:
> > > > > 
> > > > > Kernel managed remoteproc:
> > > > >      status = "okay"; secure-status = "disabled";     /* NS-only */
> > > > > 
> > > > > OP-TEE managed remoteproc:
> > > > >      status = "disabled"; secure-status = "okay";     /* S-only */
> > > > > 
> > > > > > Another issue would be to be able to share the remoteproc TEE service
> > > > > > between
> > > > > > several platform remoteproc drivers, in case of multi remote processor
> > > > > > support.
> > > > > Making the TEE based remoteproc service independent of DT will surely
> > > > > make it more scalable to other platforms too. Have a look at how OP-TEE
> > > > > based HWRNG service scales across platforms.
> > > > 
> > > > Another important service is SCMI, which drivers use to manage clocks
> > > > and resets.
> > > > These clocks and resets are declared in the Device Tree (DT). It seems
> > > > to me that
> > > > in this case, we are closer to SCMI than to the RNG service.
> > > > 
> > > > I propose we discuss this based on a concrete example with the STM32MP25.
> > > > Although not yet upstreamed, our plan is to manage signed firmware for the
> > > > Cortex-M33 and Cortex-M0.
> > > > 
> > > > Please find below my view of the DT resources to address.
> > > > 
> > > > STM32MP25  Cortex-M33 and Cortex-M0 nodes:
> > > > 
> > > > m33_rproc {
> > > >     /* M33 watchdog interrupt */
> > > >     interrupt-parent = <&intc>;
> > > >     interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> > > >     /* power domain management */
> > > >     power-domains = <&cluster_pd>, <&ret_pd>;
> > > >     power-domain-names = "default", "sleep";
> > > >     /* RPMsg mailboxes + M33 graceful shutdown request */
> > > >     mboxes = <&ipcc1 0x0>, <&ipcc1 0x1>, <&ipcc1 2>;
> > > >     mbox-names = "vq0", "vq1", "shutdown";
> > > >     memory-region = <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>;
> > > >     status = "okay";
> > > > };
> > > > 
> > > > m0_rproc {
> > > >     /* mailbox for graceful shutdown */
> > > >     mboxes = <&ipcc2 2>;
> > > >     mbox-names = "shutdown";
> > > >     /* M0 watchdog */
> > > >    interrupt-parent = <&intc>;
> > > >    interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > > >    /* M0 peripheral clocking (not accessible by the M0) */
> > > >    clocks = <&scmi_clk CK_SCMI_GPIOZ_AM>,
> > > >    <&scmi_clk CK_SCMI_GPIOZ>,
> > > >    <&scmi_clk CK_SCMI_IPCC2>,
> > > >    <&scmi_clk CK_SCMI_IPCC2_AM>,
> > > >    <&rcc CK_LPTIM3_AM>,
> > > >    <&rcc CK_LPUART1_AM>,
> > > >    <&rcc CK_CPU3_AM>,
> > > >    <&rcc CK_CPU3>,
> > > >    <&rcc CK_LPUART1_C3>,
> > > >    <&rcc CK_GPIOZ_C3>,
> > > >    <&rcc CK_LPTIM3_C3>,
> > > >    <&rcc CK_KER_LPUART1>,
> > > >    <&rcc CK_KER_LPTIM3>,
> > > >    <&scmi_clk CK_SCMI_GPIOZ>,
> > > >    <&scmi_clk CK_SCMI_IPCC2>;
> > > >    status = "okay";
> > > > };
> > > > 
> > > > If we want to remove the DT, we need to consider:
> > > > 
> > > > - Mechanism to differentiate Cortex-M33 and Cortex-M0:
> > > >     Similar to SCMI, the remoteproc OP-TEE service should support
> > > >    multiprocessor setups without instantiating multiple services.
> > > > 
> > > > - Mailboxes:
> > > > 
> > > >     A phandle is needed because the mailbox driver is managed by the
> > > >     Linux mailbox driver. STM32MP2 has two mailboxes.
> > > >     Moving towards your proposal would imply creating a mailbox service
> > > >     in TEE to manage non-secure mailboxes for non-secure IPC. This might
> > > >     not be efficient for inter-processor communication. Hardware-wise, it
> > > >     would require the IRQ to be handled by the secure context.
> > > > 
> > > > - Memory regions:
> > > >    - Hardware limitation: OP-TEE is limited in the number of memory regions
> > > >      it can declare due to Firewall configuration. Moving IPC memory regions
> > > >      reaches this limit. Currently, OP-TEE defines a single region with
> > > > shareable
> > > >      access rights, which Linux splits into at least three memory regions
> > > > for RPMsg.
> > > >    - Memory mapping: Memory regions still need to be declared in Linux to
> > > > prevent
> > > >      Linux from using them.
> > > >    - Virtio/RPMsg: Memory region names are fixed (e.g., dev<X>vring<Y>),
> > > > so OP-TEE
> > > >     must declare memory regions in its DT according to Linux naming
> > > > conventions.
> > > > 
> > > > - Clock and reset:
> > > >      Some clocks and resets are managed via SCMI, others are not. This
> > > > would require
> > > >     managing all clocks and resets through SCMI, with possible side
> > > > effect on the
> > > >     "unused" clock mechanism in Linux ( to be confirmed)
> > > > 
> > > > - Power domain:
> > > >     Information is needed at the Linux level to determine the low power
> > > > mode.
> > > > 
> > > > - Watchdog interrupt:
> > > >     Should be managed by OP-TEE, which requires the hardware to have an
> > > > associated
> > > >     secure IRQ.
> > > > 
> > > > - Miscellaneous vendor DT properties:
> > > >      How to be sure that these can be addressed through TEE services?
> > > > 
> > > > Regarding the existing DT needs, it seems to me that removing the DT
> > > > would require
> > > > moving all node resource management into TEE ( if really possible). This
> > > > would
> > > > increase TEE complexity and footprint, reduce system efficiency, and
> > > > make supporting
> > > > other platforms less scalable.
> > 
> > I can see your arguments regarding some DT properties which are hard to
> > discover via OP-TEE service and I have been trying to think of how to
> > handle it in a proper manner for a device on discoverable TEE bus. One
> > of my fellow kernel maintainers pointed out that other discoverable
> > buses in the kernel like PCI etc. already solved this DT dependencies
> > via having device specific bindings. You can have a look at a one
> > particular example of PCI device binding here [1]. In case of OP-TEE,
> > you can have a similar device binding with UUID under the OP-TEE
> > firmware DT node.
> > 
> > The current approach you are taking via probing device on platform bus
> > and then trying to move onto TEE bus isn't at all the compatible with
> > the driver model, it simply sets a bad example for the driver model.
> > 
> > [1] Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
> > 
> 
> Thank you for your feedback. I am not very familiar with PCIe, so I need to
> take a deeper look at the implementation.

I would suggest you take a look at how device specific DT bindings are
used for other discoverable buses like PCIe etc. We need to do the same
for the device/service discoverable on TEE bus.

> 
> To help me better understand your expectations, could you please confirm if
> your proposal is close to what I have described below?
>

No, what you describe below still rely on probing over platform bus
(unique compatible). Here you really need to probe remoteproc driver on
TEE bus and then discover DT properties using device specific DT
bindings something like below:

firmware  {
    optee  {
        compatible = "linaro,optee-tz";
        method = "smc";

        rproc-service@0 {
	    compatible = "<rproc-service-UUID>";

            m0_rproc {
	        ...
	    };

            m33_rproc {
	        ...
	    };
	};
    };
};

Note here that you only describe those DT properties which can't be
discovered from rproc OP-TEE service.

-Sumit

> 
> 1) Device tree:
> Notice that an intermediate ahb bus is used on ST platform for address
> conversion between remote processor address and local physical address
> I will probably need to find a solution for that.
> 
> 
> firmware {
>    remoteproc_tee {
> 	compatible = "remoteproc-tee";
> 	mlahb: ahb {
> 	    compatible = "st,mlahb", "simple-bus";
> 	    #address-cells = <1>;
> 	    #size-cells = <1>;
> 	    ranges;
> 	    dma-ranges = <>;
> 	    m33_rproc@0 {
>       		compatible = "st,stm32mp1-m33";
>      		/* M33 watchdog interrupt */
>      		interrupt-parent = <&intc>;
> 		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> 		/* power domain management */
> 		power-domains = <&cluster_pd>, <&ret_pd>;
> 		power-domain-names = "default", "sleep";
> 		/* RPMsg mailboxes + M33 graceful shutdown request */
> 		mboxes = <&ipcc1 0x0>, <&ipcc1 0x1>, <&ipcc1 2>;
> 		mbox-names = "vq0", "vq1", "shutdown";
> 		memory-region = <&vdev0vring0>, <&vdev0vring1>,
> 				<&vdev0buffer>;
> 		status = "okay";
> 	    };
>         };
> 
> 	ahbsr: ahb@2 {
> 	   compatible = "st,mlahb", "simple-bus";
> 	   #address-cells = <1>;
> 	   #size-cells = <1>;
> 	   ranges = <>;
> 	   dma-ranges = <>;
> 	   m0_rproc@1 {
>       		compatible = "st,stm32mp1-m0";
> 		mboxes = <&ipcc2 2>;
> 		mbox-names = "shutdown";
> 		interrupt-parent = <&intc>;
> 		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> 		/* M0 peripheral clocking (not accessible by the M0) */
> 		clocks = <>, <>;
>     		status = "okay";
> 	   };
>        };
>     };
> };
> 
> 2) remoteproc_driver:
>   - platform driver that registers a TEE driver with specified UUID
>   - on TEE driver probing it parses sub device (reg property replacing
>     st, proc_id property)
>   - tries to open associated TEE session and in case of success
>     probes associated rproc driver.
> 
> 3) st,remoteproc drivers
>   -  unique DT compatible, no secure-status use (legacy compatibility)
>   -  need to add a mechanism to detect probing
>      by the TEE bus, or directly probed by the ahb bus.
> 
> 
> Thanks,
> Arnaud
