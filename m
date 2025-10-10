Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146A1635;
	Fri, 10 Oct 2025 05:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760075901; cv=none; b=hh7qGq8x93WKmER7COTW4+Ff6LjYsC2sfV1mu7T+FpT9G9TWEKAPwNHx6+ni0WPVcKIPYIAsNOH2lgOlu98ASD7jwjC12UExstRe7CQQDo5QCUl2iT+zVGwdyFcg+2dQ53KYlILUFRgPC70fdKQAXuzanl4fEmLBdHK14C/nP1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760075901; c=relaxed/simple;
	bh=B5mzjs18/78/AD2RXdtHyRsQIVALLNfkycZggkol9qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BG9VsVttfsMOJtK10DE5N6/1O0xB8PoPwDHo/BZ+otOTheGhXWkDVYlYmnMLoU5h96cH05ZQyeDoRSiFl+YrasOKJPwKvy9OiF4guTsukpuuPrRgKjqzJjWrvGZuEwB6FPCRkVkD8cYHX98x3DwlrAjpRs3ZkN2bTPKMsyD1hGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgylEpd2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgylEpd2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83535C4CEF1;
	Fri, 10 Oct 2025 05:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760075900;
	bh=B5mzjs18/78/AD2RXdtHyRsQIVALLNfkycZggkol9qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QgylEpd2hrygc4PFI8BZoJyin+K0USvt05snBCqNgDEFpu6e6uGfj0abiblfUoNMO
	 zeG8bPUZQ2tvZa/goZXkGJUl02H9ggTMc9aiRyrt73SNyP3LgDKdDrw+Xj/L7Stinc
	 hEiLGRvruIeVzGgihSWKxuCW91g0WDdXAVFlxdzbyOMlALOf7De0NiCqg2fCeqfP5b
	 VdKn90Zj3K/9Og2UP8hkGl2NBGkcOLeZq9KeIl3TNnkvPxhOBzZxwZrCm6P9N+i53G
	 5dMaON3FsGQCx0lB+K3PeVN73YNAVVMH+xuV5vIqtxRmgQ5VVf+K1jiGSSBZXzpYNw
	 Y1Sg59ngBO6IQ==
Date: Fri, 10 Oct 2025 11:28:18 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	quic_hdev@quicinc.com, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
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
Message-ID: <aOigeqeHBDdU9191@sumit-X1>
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
 <20250625094028.758016-5-arnaud.pouliquen@foss.st.com>
 <aMkqifHSdlCs4VjA@sumit-X1>
 <62bdb238-7440-451b-84ef-79f846b10ba0@foss.st.com>
 <aMqIhFdIqp5auH22@sumit-X1>
 <8d385f2e-6470-4d66-be0b-a2a448a81fa4@foss.st.com>
 <aMz8XuHzIomNhmra@sumit-X1>
 <0e5a44df-f60a-4523-a791-6318b3c81425@foss.st.com>
 <f5b0e106-a731-461b-b401-1aa1f9892465@foss.st.com>
 <CANLsYkz58-TFhbPcsMMV27WBGphPc7UP5HfgMZZMrqxnqWqhNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANLsYkz58-TFhbPcsMMV27WBGphPc7UP5HfgMZZMrqxnqWqhNA@mail.gmail.com>

Hi Mathieu,

On Wed, Oct 08, 2025 at 10:38:07AM -0600, Mathieu Poirier wrote:
> On Tue, 7 Oct 2025 at 07:50, Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
> >
> > Hello Bjorn, Mathieu, Sumit,
> >
> > On 9/22/25 10:57, Arnaud POULIQUEN wrote:
> > >
> > >
> > > On 9/19/25 08:46, Sumit Garg wrote:
> > >> On Wed, Sep 17, 2025 at 03:47:40PM +0200, Arnaud POULIQUEN wrote:
> > >>>
> > >>> On 9/17/25 12:08, Sumit Garg wrote:
> > >>>> On Tue, Sep 16, 2025 at 03:26:47PM +0200, Arnaud POULIQUEN wrote:
> > >>>>> Hello Sumit,
> > >>>>>
> > >>>>> On 9/16/25 11:14, Sumit Garg wrote:
> > >>>>>> Hi Arnaud,
> > >>>>>>
> > >>>>>> First of all apologies for such a late review comment as previously I
> > >>>>>> wasn't CCed or involved in the review of this patch-set. In case
> > >>>>>> any of
> > >>>>>> my following comments have been discussed in the past then feel
> > >>>>>> free to
> > >>>>>> point me at relevant discussions.
> > >>>>> No worries, there are too many versions of this series to follow
> > >>>>> all the
> > >>>>> past discussions. I sometimes have difficulty remembering all the
> > >>>>> discussions myself :)
> > >>>>>
> > >>>>>> On Wed, Jun 25, 2025 at 11:40:26AM +0200, Arnaud Pouliquen wrote:
> > >>>>>>> The "st,stm32mp1-m4-tee" compatible is utilized in a system
> > >>>>>>> configuration
> > >>>>>>> where the Cortex-M4 firmware is loaded by the Trusted Execution
> > >>>>>>> Environment
> > >>>>>>> (TEE).
> > >>>>>> Having a DT based compatible for a TEE service to me just feels
> > >>>>>> like it
> > >>>>>> is redundant here. I can see you have also used a TEE bus based
> > >>>>>> device
> > >>>>>> too but that is not being properly used. I know subsystems like
> > >>>>>> remoteproc, SCMI and others heavily rely on DT to hardcode
> > >>>>>> properties of
> > >>>>>> system firmware which are rather better to be discovered dynamically.
> > >>>>>>
> > >>>>>> So I have an open question for you and the remoteproc subsystem
> > >>>>>> maintainers being:
> > >>>>>>
> > >>>>>> Is it feasible to rather leverage the benefits of a fully
> > >>>>>> discoverable
> > >>>>>> TEE bus rather than relying on platform bus/ DT to hardcode firmware
> > >>>>>> properties?
> > >>>>> The discoverable TEE bus does not works if the remoteproc is probed
> > >>>>> before the OP-TEE bus, in such case  no possibility to know if the TEE
> > >>>>> TA is not yet available or not available at all.
> > >>>>> This point is mentioned in a comment in rproc_tee_register().
> > >>> For the discussion, it’s probably better if I provide more details on
> > >>> the
> > >>> current OP-TEE implementation and the stm32mp processors.
> > >>>
> > >>> 1) STM32MP topology:
> > >>>    - STM32MP1: only a Cortex-M4 remote processor
> > >>>    -  STM32MP2x: a Cortex-M33 and a Cortex-M0 remote processors
> > >>>    At this stage, only the STM32MP15 is upstreamed; the STM32MP25 is
> > >>> waiting
> > >>>    for this series to be merged.
> > >>>
> > >>> 2) OP-TEE architecture:
> > >>> - A platform-agnostic Trusted Application (TA) handles the bus
> > >>> service.[1]
> > >>>    This TA supports managing multiple remote processors. It can be
> > >>> embedded
> > >>>    regardless of the number of remote processors managed in OP-TEE.
> > >>>    The decision to embed this service is made at build time based on the
> > >>>    presence of the remoteproc driver, so it is not device tree
> > >>> dependent.
> > >>>    - STM32MP15: TA activated only if the remoteproc OP-TEE driver is
> > >>> probed
> > >>>    - STM32MP2x: TA always activated as the OP-TEE remoteproc driver
> > >>> is always
> > >>> probed
> > >>>
> > >>> - A pseudo Trusted Application implements the platform porting[2],
> > >>>    relying on registered remoteproc platform drivers.
> > >>>
> > >>> - Platform driver(s) manage the remote processors.[3][4]
> > >>>    - If remoteproc is managed by OP-TEE: manages the remoteproc
> > >>> lifecycle
> > >>>    - If remoteproc is managed by Linux: provides access rights to
> > >>> Linux to
> > >>> manage
> > >>>      the remoteproc
> > >>>
> > >>>    - STM32MP15: driver probed only if the remoteproc is managed in
> > >>> OP-TEE
> > >>>    - STM32MP2x: driver probed in both cases for the Cortex-M33
> > >>>      For the STM32MP25, the TA is always present and queries the
> > >>> driver to
> > >>> check
> > >>>      if it supports secure loading.
> > >>>
> > >>>
> > >>> [1] https://elixir.bootlin.com/op-tee/4.7.0/source/ta/remoteproc
> > >>> [2] https://elixir.bootlin.com/op-tee/4.7.0/source/core/pta/stm32mp/
> > >>> remoteproc_pta.c
> > >>> [3]https://elixir.bootlin.com/op-tee/4.7.0/source/core/drivers/
> > >>> remoteproc/stm32_remoteproc.c
> > >>> [4]https://github.com/STMicroelectronics/optee_os/blob/4.0.0-stm32mp/
> > >>> core/drivers/remoteproc/stm32_remoteproc.c
> > >> Thanks for the background here.
> > >>
> > >>>> The reason here is that you are mixing platform and TEE bus for
> > >>>> remoteproc
> > >>>> driver. For probe, you rely on platform bus and then try to migrate to
> > >>>> TEE bus via rproc_tee_register() is the problem here. Instead you
> > >>>> should
> > >>>> rather probe remoteproc device on TEE bus from the beginning.
> > >>> The approach is interesting, but how can we rely on Device Tree (DT) for
> > >>> hardware configuration in this case?
> > >>> At a minimum, I need to define memory regions and mailboxes.
> > >> The hardware configuration in DT should be consumed by OP-TEE and the
> > >> kernel probes remoteproc properties from OP-TEE since it's an OP-TEE
> > >> mediated remoteproc service you are adding here.
> > >>>  From my perspective, I would still need a driver probed by DT that
> > >>> registers
> > >>> a driver on the TEE bus. Therefore, I still need a mechanism to decide
> > >>> whether the remote firmware is managed by the secure or non-secure
> > >>> context.
> > >> As I mentioned below, this should be achievable using the secure-status
> > >> property without introducing the new compatible:
> > >>
> > >> Kernel managed remoteproc:
> > >>     status = "okay"; secure-status = "disabled";     /* NS-only */
> > >>
> > >> OP-TEE managed remoteproc:
> > >>     status = "disabled"; secure-status = "okay";     /* S-only */
> > >>
> > >>> Another issue would be to be able to share the remoteproc TEE service
> > >>> between
> > >>> several platform remoteproc drivers, in case of multi remote processor
> > >>> support.
> > >> Making the TEE based remoteproc service independent of DT will surely
> > >> make it more scalable to other platforms too. Have a look at how OP-TEE
> > >> based HWRNG service scales across platforms.
> > >
> > > Another important service is SCMI, which drivers use to manage clocks
> > > and resets.
> > > These clocks and resets are declared in the Device Tree (DT). It seems
> > > to me that
> > > in this case, we are closer to SCMI than to the RNG service.
> > >
> > > I propose we discuss this based on a concrete example with the STM32MP25.
> > > Although not yet upstreamed, our plan is to manage signed firmware for the
> > > Cortex-M33 and Cortex-M0.
> > >
> > > Please find below my view of the DT resources to address.
> > >
> > > STM32MP25  Cortex-M33 and Cortex-M0 nodes:
> > >
> > > m33_rproc {
> > >    /* M33 watchdog interrupt */
> > >    interrupt-parent = <&intc>;
> > >    interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> > >    /* power domain management */
> > >    power-domains = <&cluster_pd>, <&ret_pd>;
> > >    power-domain-names = "default", "sleep";
> > >    /* RPMsg mailboxes + M33 graceful shutdown request */
> > >    mboxes = <&ipcc1 0x0>, <&ipcc1 0x1>, <&ipcc1 2>;
> > >    mbox-names = "vq0", "vq1", "shutdown";
> > >    memory-region = <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>;
> > >    status = "okay";
> > > };
> > >
> > > m0_rproc {
> > >    /* mailbox for graceful shutdown */
> > >    mboxes = <&ipcc2 2>;
> > >    mbox-names = "shutdown";
> > >    /* M0 watchdog */
> > >   interrupt-parent = <&intc>;
> > >   interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > >   /* M0 peripheral clocking (not accessible by the M0) */
> > >   clocks = <&scmi_clk CK_SCMI_GPIOZ_AM>,
> > >   <&scmi_clk CK_SCMI_GPIOZ>,
> > >   <&scmi_clk CK_SCMI_IPCC2>,
> > >   <&scmi_clk CK_SCMI_IPCC2_AM>,
> > >   <&rcc CK_LPTIM3_AM>,
> > >   <&rcc CK_LPUART1_AM>,
> > >   <&rcc CK_CPU3_AM>,
> > >   <&rcc CK_CPU3>,
> > >   <&rcc CK_LPUART1_C3>,
> > >   <&rcc CK_GPIOZ_C3>,
> > >   <&rcc CK_LPTIM3_C3>,
> > >   <&rcc CK_KER_LPUART1>,
> > >   <&rcc CK_KER_LPTIM3>,
> > >   <&scmi_clk CK_SCMI_GPIOZ>,
> > >   <&scmi_clk CK_SCMI_IPCC2>;
> > >   status = "okay";
> > > };
> > >
> > > If we want to remove the DT, we need to consider:
> > >
> > > - Mechanism to differentiate Cortex-M33 and Cortex-M0:
> > >    Similar to SCMI, the remoteproc OP-TEE service should support
> > >   multiprocessor setups without instantiating multiple services.
> > >
> > > - Mailboxes:
> > >
> > >    A phandle is needed because the mailbox driver is managed by the
> > >    Linux mailbox driver. STM32MP2 has two mailboxes.
> > >    Moving towards your proposal would imply creating a mailbox service
> > >    in TEE to manage non-secure mailboxes for non-secure IPC. This might
> > >    not be efficient for inter-processor communication. Hardware-wise, it
> > >    would require the IRQ to be handled by the secure context.
> > >
> > > - Memory regions:
> > >   - Hardware limitation: OP-TEE is limited in the number of memory regions
> > >     it can declare due to Firewall configuration. Moving IPC memory regions
> > >     reaches this limit. Currently, OP-TEE defines a single region with
> > > shareable
> > >     access rights, which Linux splits into at least three memory regions
> > > for RPMsg.
> > >   - Memory mapping: Memory regions still need to be declared in Linux to
> > > prevent
> > >     Linux from using them.
> > >   - Virtio/RPMsg: Memory region names are fixed (e.g., dev<X>vring<Y>),
> > > so OP-TEE
> > >    must declare memory regions in its DT according to Linux naming
> > > conventions.
> > >
> > > - Clock and reset:
> > >     Some clocks and resets are managed via SCMI, others are not. This
> > > would require
> > >    managing all clocks and resets through SCMI, with possible side
> > > effect on the
> > >    "unused" clock mechanism in Linux ( to be confirmed)
> > >
> > > - Power domain:
> > >    Information is needed at the Linux level to determine the low power
> > > mode.
> > >
> > > - Watchdog interrupt:
> > >    Should be managed by OP-TEE, which requires the hardware to have an
> > > associated
> > >    secure IRQ.
> > >
> > > - Miscellaneous vendor DT properties:
> > >     How to be sure that these can be addressed through TEE services?
> > >
> > > Regarding the existing DT needs, it seems to me that removing the DT
> > > would require
> > > moving all node resource management into TEE ( if really possible). This
> > > would
> > > increase TEE complexity and footprint, reduce system efficiency, and
> > > make supporting
> > > other platforms less scalable.
> > >
> > > That said, it probably also depends on the TEE implementation.
> > > And  we should support both. This could be done by introducing a second
> > > UUID.
> > > but in this case should it be the same driver?
> >
> > I am unsure how to move forward here. It seems to me that addressing Sumit's
> > request for a TEE without a device tree is not compatible with the current
> > OP-TEE implementation, at least for the STM32MP platforms.
> >
> > Perhaps the simplest approach is to abandon the effort to make this generic
> > and instead rename tee_remoteproc.c to stm32_tee_remoteproc.c, making it
> > platform-dependent. Then, if another platform wants to reuse it with OP-TEE
> > FFA or another TEE, the file can be renamed.
> >
> > Does this proposal would make sense to you?
> 
> I would certainly like to see a consensus, and more specifically, an
> implementation that follows what other drivers that interact with the
> secure world do.  I currently do not have a clear understanding of
> what those other drivers do, and doing the research will take
> bandwidth that I also currently do not have.

The major problem I see with this patchset is the probing of remoteproc
on platform bus and then try to move to a discoverable TEE bus. As I replied
in the other thread, we should address the unavoidable DT dependency following
what other discoverable buses like PCI etc. does.

-Sumit

> This situation is
> expected to persist at least until December.
> 
> As such I see two avenues for this patchset:
> (1) You seek to find a solution that is amenable to you, Sumit,
> Abdellatif and Harshal (I had to add the latter two to this email
> thread).
> (2) You wait until December, and likely beyond, until I have time to
> do the research needed to advise on the way forward.
> 
