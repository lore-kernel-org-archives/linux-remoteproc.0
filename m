Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A2D2BDC3E
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Oct 2025 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759941504; cv=none; b=pWE8WTyURRGEYUnTIcz3xcuEasNWDcN3EmwAfc6va2NSkvBA/bsRmZKKblAnwQ6aYmMC27jy7+Nc12bzYrtiUuNxdHIYdBn2cvcK2uIoLCZYWB+5Nd0/iXxPUB9kpIv2JSaQcp6uCm/96v9/m4+3DWuonE1oYCDAE6RfQLAmiAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759941504; c=relaxed/simple;
	bh=upFsg9baQcPYAIdfMFdNWFkcwVQ87cCOjQeqU1tNv5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIbhvIcZmdsK/05fMJTH5b/XXtJOu/jvEeqv8L3MAnhGLlAsMZT0Z9kJsvVqbuLgcwGekRmC0wB+Ty/yaYd38C/xtH5IkpM0SGslq258EVQjQW9k918jeNJxY1Tl2l7ckXOgzJAiwKy3RErTjraSylkF6/CLf+K0EOh5GokyQyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CHedki5x; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CHedki5x"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-62fca01f0d9so14847a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 09:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759941499; x=1760546299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpoineAZsS/O1PBo6hjFOxIAdK8lFJMmlZFDPhwt2Go=;
        b=CHedki5xMbDLx9direHIG/ozdARk5kktgIkJGjajKJb4HUeUT7EQ/C7CMC+HXnpicX
         x8n0QmpkRz+uA+QQF8UTtaLYmcq85DYbJFcKL0j55u+nIlCLim7An5+xcix+FqzscYr/
         49UjJmtwhYYVRSt7zPaBXtpbk/g/PCIRAZGMmRdGOn2zUF4Z/PE3CLQsM7quXQKI04U8
         aU0UzEnDjJm9zQ1EFcalRocRn1LesxPkuaNJTkDxpeSrCMXZslY2HelESVmiKaDWbfs9
         eB3ERwDcepgkpEmzHSYSERBQ2DFcaRfjz2rENTuWL0BZ/PcyvwsB6CW1tP0H6PwIsQKZ
         SWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759941499; x=1760546299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpoineAZsS/O1PBo6hjFOxIAdK8lFJMmlZFDPhwt2Go=;
        b=dcLvVEJA0yevzp/7Sc1+ZzZ2t2ly6EoyM+sAq344qgUnvhC1LFUoVjaJ5krlGh310t
         +nX2qNE2Na/ryRjNMq4H3lNMonqd4HdmRDOHZpBq7arR0pqIB4cECuvRZRBBSIdkxojY
         uLqXqk4FiVo6BZbnb+Sg/0ukPZEoQZDgk+lgZ6oaUkekWqt6Psi6J0NzZ6tg6/9Ta8Y1
         TETYfOUvNUVBB2eBTkWr4XQOPvXusF1vBR2qA0i3FGuZpUEb+OebKptFznLuewFOB5D9
         a6TmfYkskAF6ZxmCcnHG2LbAjs5P1UUAtFrL3BDifenWpo6qxBW/9GzJDh92pPko6jER
         c7hA==
X-Forwarded-Encrypted: i=1; AJvYcCXPXAFmwLcBOPAoSeX6M4SLPIKExOGRM5rawA3mA57cGctgYlquMwaIvd4aDlXOWZ2lTYXu317xoVxFPTbZDqwp@vger.kernel.org
X-Gm-Message-State: AOJu0YwPRbGmovlV5VXcDTqLHcAlWDtO+vaDqChrv4IW6UBulKk8k+lz
	hfsipnGSlexMGbj6PmaxVciX+9iY6AyHWJenXw12I+JFFlaK5E9GkKhA38uGXixWxPiagvscG3V
	IeSn3tq6KIgCqJk0KPOVjQSljYlmFV4e6Y3rguvVqcA==
X-Gm-Gg: ASbGnct2ul4Ec6L/HbHJXFJtge7aG2FPxULNwV0X5Ez+sFCqm4wy2UwgjEwAsy/WtQ5
	6IgvVEbDEggFOcjGbUgekCPxBtCXn4tiRICbPHev0BV7zq4IvcgigMqvP0pTkhZKXsQKHwVXuWp
	016gwfynAieVrNqpbNO8qxOcBbh78ABSoqaMRt1VeBdq2sIhEVy631sCxezmWlLWhLiw5tikvvq
	U6pINSxZrZqJoIY+R30klavM6GOeSoGlSyYTOV7LzL+vEWA5TyrpWhErupv8+h/BfnXiH14Vf+B
	k2Nma/AcqqSHQvscdfHrAcUt8X1Inr4cUoG6i17SiYFLjCHaJzcYWZmpwoJdhhyNAY3/
X-Google-Smtp-Source: AGHT+IFUSouzzahEE0ZXiMAzh0PP4/V5SLYKNAVEEQ3aHZvPryhFs7/um/zmAcJHxRpbEIqHnshdklRUPARiLL52/44=
X-Received: by 2002:a05:6402:3546:b0:638:1599:6c25 with SMTP id
 4fb4d7f45d1cf-639d5b5db50mr3657752a12.1.1759941498665; Wed, 08 Oct 2025
 09:38:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
 <20250625094028.758016-5-arnaud.pouliquen@foss.st.com> <aMkqifHSdlCs4VjA@sumit-X1>
 <62bdb238-7440-451b-84ef-79f846b10ba0@foss.st.com> <aMqIhFdIqp5auH22@sumit-X1>
 <8d385f2e-6470-4d66-be0b-a2a448a81fa4@foss.st.com> <aMz8XuHzIomNhmra@sumit-X1>
 <0e5a44df-f60a-4523-a791-6318b3c81425@foss.st.com> <f5b0e106-a731-461b-b401-1aa1f9892465@foss.st.com>
In-Reply-To: <f5b0e106-a731-461b-b401-1aa1f9892465@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 8 Oct 2025 10:38:07 -0600
X-Gm-Features: AS18NWCf-4pbSm4V2cCNzLsqw4ewfJdvM1S_DUhnEjZ4V-PHM0kzNUE7Jh8-rzE
Message-ID: <CANLsYkz58-TFhbPcsMMV27WBGphPc7UP5HfgMZZMrqxnqWqhNA@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH v19 4/6] dt-bindings: remoteproc: Add
 compatibility for TEE support
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, Sumit Garg <sumit.garg@kernel.org>, 
	quic_hdev@quicinc.com
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Oct 2025 at 07:50, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Bjorn, Mathieu, Sumit,
>
> On 9/22/25 10:57, Arnaud POULIQUEN wrote:
> >
> >
> > On 9/19/25 08:46, Sumit Garg wrote:
> >> On Wed, Sep 17, 2025 at 03:47:40PM +0200, Arnaud POULIQUEN wrote:
> >>>
> >>> On 9/17/25 12:08, Sumit Garg wrote:
> >>>> On Tue, Sep 16, 2025 at 03:26:47PM +0200, Arnaud POULIQUEN wrote:
> >>>>> Hello Sumit,
> >>>>>
> >>>>> On 9/16/25 11:14, Sumit Garg wrote:
> >>>>>> Hi Arnaud,
> >>>>>>
> >>>>>> First of all apologies for such a late review comment as previousl=
y I
> >>>>>> wasn't CCed or involved in the review of this patch-set. In case
> >>>>>> any of
> >>>>>> my following comments have been discussed in the past then feel
> >>>>>> free to
> >>>>>> point me at relevant discussions.
> >>>>> No worries, there are too many versions of this series to follow
> >>>>> all the
> >>>>> past discussions. I sometimes have difficulty remembering all the
> >>>>> discussions myself :)
> >>>>>
> >>>>>> On Wed, Jun 25, 2025 at 11:40:26AM +0200, Arnaud Pouliquen wrote:
> >>>>>>> The "st,stm32mp1-m4-tee" compatible is utilized in a system
> >>>>>>> configuration
> >>>>>>> where the Cortex-M4 firmware is loaded by the Trusted Execution
> >>>>>>> Environment
> >>>>>>> (TEE).
> >>>>>> Having a DT based compatible for a TEE service to me just feels
> >>>>>> like it
> >>>>>> is redundant here. I can see you have also used a TEE bus based
> >>>>>> device
> >>>>>> too but that is not being properly used. I know subsystems like
> >>>>>> remoteproc, SCMI and others heavily rely on DT to hardcode
> >>>>>> properties of
> >>>>>> system firmware which are rather better to be discovered dynamical=
ly.
> >>>>>>
> >>>>>> So I have an open question for you and the remoteproc subsystem
> >>>>>> maintainers being:
> >>>>>>
> >>>>>> Is it feasible to rather leverage the benefits of a fully
> >>>>>> discoverable
> >>>>>> TEE bus rather than relying on platform bus/ DT to hardcode firmwa=
re
> >>>>>> properties?
> >>>>> The discoverable TEE bus does not works if the remoteproc is probed
> >>>>> before the OP-TEE bus, in such case  no possibility to know if the =
TEE
> >>>>> TA is not yet available or not available at all.
> >>>>> This point is mentioned in a comment in rproc_tee_register().
> >>> For the discussion, it=E2=80=99s probably better if I provide more de=
tails on
> >>> the
> >>> current OP-TEE implementation and the stm32mp processors.
> >>>
> >>> 1) STM32MP topology:
> >>>    - STM32MP1: only a Cortex-M4 remote processor
> >>>    -  STM32MP2x: a Cortex-M33 and a Cortex-M0 remote processors
> >>>    At this stage, only the STM32MP15 is upstreamed; the STM32MP25 is
> >>> waiting
> >>>    for this series to be merged.
> >>>
> >>> 2) OP-TEE architecture:
> >>> - A platform-agnostic Trusted Application (TA) handles the bus
> >>> service.[1]
> >>>    This TA supports managing multiple remote processors. It can be
> >>> embedded
> >>>    regardless of the number of remote processors managed in OP-TEE.
> >>>    The decision to embed this service is made at build time based on =
the
> >>>    presence of the remoteproc driver, so it is not device tree
> >>> dependent.
> >>>    - STM32MP15: TA activated only if the remoteproc OP-TEE driver is
> >>> probed
> >>>    - STM32MP2x: TA always activated as the OP-TEE remoteproc driver
> >>> is always
> >>> probed
> >>>
> >>> - A pseudo Trusted Application implements the platform porting[2],
> >>>    relying on registered remoteproc platform drivers.
> >>>
> >>> - Platform driver(s) manage the remote processors.[3][4]
> >>>    - If remoteproc is managed by OP-TEE: manages the remoteproc
> >>> lifecycle
> >>>    - If remoteproc is managed by Linux: provides access rights to
> >>> Linux to
> >>> manage
> >>>      the remoteproc
> >>>
> >>>    - STM32MP15: driver probed only if the remoteproc is managed in
> >>> OP-TEE
> >>>    - STM32MP2x: driver probed in both cases for the Cortex-M33
> >>>      For the STM32MP25, the TA is always present and queries the
> >>> driver to
> >>> check
> >>>      if it supports secure loading.
> >>>
> >>>
> >>> [1] https://elixir.bootlin.com/op-tee/4.7.0/source/ta/remoteproc
> >>> [2] https://elixir.bootlin.com/op-tee/4.7.0/source/core/pta/stm32mp/
> >>> remoteproc_pta.c
> >>> [3]https://elixir.bootlin.com/op-tee/4.7.0/source/core/drivers/
> >>> remoteproc/stm32_remoteproc.c
> >>> [4]https://github.com/STMicroelectronics/optee_os/blob/4.0.0-stm32mp/
> >>> core/drivers/remoteproc/stm32_remoteproc.c
> >> Thanks for the background here.
> >>
> >>>> The reason here is that you are mixing platform and TEE bus for
> >>>> remoteproc
> >>>> driver. For probe, you rely on platform bus and then try to migrate =
to
> >>>> TEE bus via rproc_tee_register() is the problem here. Instead you
> >>>> should
> >>>> rather probe remoteproc device on TEE bus from the beginning.
> >>> The approach is interesting, but how can we rely on Device Tree (DT) =
for
> >>> hardware configuration in this case?
> >>> At a minimum, I need to define memory regions and mailboxes.
> >> The hardware configuration in DT should be consumed by OP-TEE and the
> >> kernel probes remoteproc properties from OP-TEE since it's an OP-TEE
> >> mediated remoteproc service you are adding here.
> >>>  From my perspective, I would still need a driver probed by DT that
> >>> registers
> >>> a driver on the TEE bus. Therefore, I still need a mechanism to decid=
e
> >>> whether the remote firmware is managed by the secure or non-secure
> >>> context.
> >> As I mentioned below, this should be achievable using the secure-statu=
s
> >> property without introducing the new compatible:
> >>
> >> Kernel managed remoteproc:
> >>     status =3D "okay"; secure-status =3D "disabled";     /* NS-only */
> >>
> >> OP-TEE managed remoteproc:
> >>     status =3D "disabled"; secure-status =3D "okay";     /* S-only */
> >>
> >>> Another issue would be to be able to share the remoteproc TEE service
> >>> between
> >>> several platform remoteproc drivers, in case of multi remote processo=
r
> >>> support.
> >> Making the TEE based remoteproc service independent of DT will surely
> >> make it more scalable to other platforms too. Have a look at how OP-TE=
E
> >> based HWRNG service scales across platforms.
> >
> > Another important service is SCMI, which drivers use to manage clocks
> > and resets.
> > These clocks and resets are declared in the Device Tree (DT). It seems
> > to me that
> > in this case, we are closer to SCMI than to the RNG service.
> >
> > I propose we discuss this based on a concrete example with the STM32MP2=
5.
> > Although not yet upstreamed, our plan is to manage signed firmware for =
the
> > Cortex-M33 and Cortex-M0.
> >
> > Please find below my view of the DT resources to address.
> >
> > STM32MP25  Cortex-M33 and Cortex-M0 nodes:
> >
> > m33_rproc {
> >    /* M33 watchdog interrupt */
> >    interrupt-parent =3D <&intc>;
> >    interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> >    /* power domain management */
> >    power-domains =3D <&cluster_pd>, <&ret_pd>;
> >    power-domain-names =3D "default", "sleep";
> >    /* RPMsg mailboxes + M33 graceful shutdown request */
> >    mboxes =3D <&ipcc1 0x0>, <&ipcc1 0x1>, <&ipcc1 2>;
> >    mbox-names =3D "vq0", "vq1", "shutdown";
> >    memory-region =3D <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>;
> >    status =3D "okay";
> > };
> >
> > m0_rproc {
> >    /* mailbox for graceful shutdown */
> >    mboxes =3D <&ipcc2 2>;
> >    mbox-names =3D "shutdown";
> >    /* M0 watchdog */
> >   interrupt-parent =3D <&intc>;
> >   interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> >   /* M0 peripheral clocking (not accessible by the M0) */
> >   clocks =3D <&scmi_clk CK_SCMI_GPIOZ_AM>,
> >   <&scmi_clk CK_SCMI_GPIOZ>,
> >   <&scmi_clk CK_SCMI_IPCC2>,
> >   <&scmi_clk CK_SCMI_IPCC2_AM>,
> >   <&rcc CK_LPTIM3_AM>,
> >   <&rcc CK_LPUART1_AM>,
> >   <&rcc CK_CPU3_AM>,
> >   <&rcc CK_CPU3>,
> >   <&rcc CK_LPUART1_C3>,
> >   <&rcc CK_GPIOZ_C3>,
> >   <&rcc CK_LPTIM3_C3>,
> >   <&rcc CK_KER_LPUART1>,
> >   <&rcc CK_KER_LPTIM3>,
> >   <&scmi_clk CK_SCMI_GPIOZ>,
> >   <&scmi_clk CK_SCMI_IPCC2>;
> >   status =3D "okay";
> > };
> >
> > If we want to remove the DT, we need to consider:
> >
> > - Mechanism to differentiate Cortex-M33 and Cortex-M0:
> >    Similar to SCMI, the remoteproc OP-TEE service should support
> >   multiprocessor setups without instantiating multiple services.
> >
> > - Mailboxes:
> >
> >    A phandle is needed because the mailbox driver is managed by the
> >    Linux mailbox driver. STM32MP2 has two mailboxes.
> >    Moving towards your proposal would imply creating a mailbox service
> >    in TEE to manage non-secure mailboxes for non-secure IPC. This might
> >    not be efficient for inter-processor communication. Hardware-wise, i=
t
> >    would require the IRQ to be handled by the secure context.
> >
> > - Memory regions:
> >   - Hardware limitation: OP-TEE is limited in the number of memory regi=
ons
> >     it can declare due to Firewall configuration. Moving IPC memory reg=
ions
> >     reaches this limit. Currently, OP-TEE defines a single region with
> > shareable
> >     access rights, which Linux splits into at least three memory region=
s
> > for RPMsg.
> >   - Memory mapping: Memory regions still need to be declared in Linux t=
o
> > prevent
> >     Linux from using them.
> >   - Virtio/RPMsg: Memory region names are fixed (e.g., dev<X>vring<Y>),
> > so OP-TEE
> >    must declare memory regions in its DT according to Linux naming
> > conventions.
> >
> > - Clock and reset:
> >     Some clocks and resets are managed via SCMI, others are not. This
> > would require
> >    managing all clocks and resets through SCMI, with possible side
> > effect on the
> >    "unused" clock mechanism in Linux ( to be confirmed)
> >
> > - Power domain:
> >    Information is needed at the Linux level to determine the low power
> > mode.
> >
> > - Watchdog interrupt:
> >    Should be managed by OP-TEE, which requires the hardware to have an
> > associated
> >    secure IRQ.
> >
> > - Miscellaneous vendor DT properties:
> >     How to be sure that these can be addressed through TEE services?
> >
> > Regarding the existing DT needs, it seems to me that removing the DT
> > would require
> > moving all node resource management into TEE ( if really possible). Thi=
s
> > would
> > increase TEE complexity and footprint, reduce system efficiency, and
> > make supporting
> > other platforms less scalable.
> >
> > That said, it probably also depends on the TEE implementation.
> > And  we should support both. This could be done by introducing a second
> > UUID.
> > but in this case should it be the same driver?
>
> I am unsure how to move forward here. It seems to me that addressing Sumi=
t's
> request for a TEE without a device tree is not compatible with the curren=
t
> OP-TEE implementation, at least for the STM32MP platforms.
>
> Perhaps the simplest approach is to abandon the effort to make this gener=
ic
> and instead rename tee_remoteproc.c to stm32_tee_remoteproc.c, making it
> platform-dependent. Then, if another platform wants to reuse it with OP-T=
EE
> FFA or another TEE, the file can be renamed.
>
> Does this proposal would make sense to you?

I would certainly like to see a consensus, and more specifically, an
implementation that follows what other drivers that interact with the
secure world do.  I currently do not have a clear understanding of
what those other drivers do, and doing the research will take
bandwidth that I also currently do not have.  This situation is
expected to persist at least until December.

As such I see two avenues for this patchset:
(1) You seek to find a solution that is amenable to you, Sumit,
Abdellatif and Harshal (I had to add the latter two to this email
thread).
(2) You wait until December, and likely beyond, until I have time to
do the research needed to advise on the way forward.

>
> Thanks and Regards,
> Arnaud
>
> >
> >>
> >>>>> Then, it is not only a firmware property in our case. Depending on =
the
> >>>>> compatible string, we manage the hardware differently. The same
> >>>>> compatibles
> >>>>> are used in both OP-TEE and Linux. Based on the compatible, we can
> >>>>> assign
> >>>>> memories, clocks, and resets to either the secure or non-secure
> >>>>> context.
> >>>>> This approach is implemented on the STM32MP15 and STM32MP2x platfor=
ms.
> >>>> You should have rather used the DT property "secure-status" [1] to s=
ay
> >>>> the remoteproc device is being managed by OP-TEE instead of Linux. T=
hen
> >>>> the Linux driver will solely rely on TEE bus to have OP-TEE mediated
> >>>> remoteproc device.
> >>>>
> >>>> [1] https://github.com/devicetree-org/dt-schema/
> >>>> blob/4b28bc79fdc552f3e0b870ef1362bb711925f4f3/dtschema/schemas/dt-
> >>>> core.yaml#L52
> >>> My issue with this property is that this would break the
> >>> compatibility with
> >>> legacy DT that only support loading by Linux
> >> No, it's not a DT ABI break at all. It is always possible for a
> >> hardware to be re-configured to change assignment of peripherals among
> >> OP-TEE and Linux kernel.
> >>
> >>> As specified in [5] :If "secure-status" is not specified it defaults
> >>> to the
> >>> same value as "status"; [5]
> >>> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/
> >>> secure.txt
> >> This is mostly meant for peripherals that can be probed by both OP-TEE
> >> and Linux kernel via DT. But here in case of remoteproc, there needs t=
o
> >> exclusive access control for either via Linux kernel or OP-TEE. Hence,
> >> the
> >> "status" and "secure-status" properties should be updated accordingly.
> >>
> >>>>> More details are available in the ST WIKI:
> >>>>> https://wiki.st.com/stm32mpu/wiki/OP-
> >>>>> TEE_remoteproc_framework_overview#Device_tree_configuration
> >>>>> https://wiki.st.com/stm32mpu/wiki/
> >>>>> Linux_remoteproc_framework_overview#Device_tree_configuration
> >>>>>
> >>>>>>> For instance, this compatible is used in both the Linux and OP-
> >>>>>>> TEE device
> >>>>>>> trees:
> >>>>>>> - In OP-TEE, a node is defined in the device tree with the
> >>>>>>>      "st,stm32mp1-m4-tee" compatible to support signed remoteproc
> >>>>>>> firmware.
> >>>>>>>      Based on DT properties, the OP-TEE remoteproc framework is
> >>>>>>> initiated to
> >>>>>>>      expose a trusted application service to authenticate and
> >>>>>>> load the remote
> >>>>>>>      processor firmware provided by the Linux remoteproc
> >>>>>>> framework, as well
> >>>>>>>      as to start and stop the remote processor.
> >>>>>>> - In Linux, when the compatibility is set, the Cortex-M resets
> >>>>>>> should not
> >>>>>>>      be declared in the device tree. In such a configuration, the
> >>>>>>> reset is
> >>>>>>>      managed by the OP-TEE remoteproc driver and is no longer
> >>>>>>> accessible from
> >>>>>>>      the Linux kernel.
> >>>>>>>
> >>>>>>> Associated with this new compatible, add the "st,proc-id"
> >>>>>>> property to
> >>>>>>> identify the remote processor. This ID is used to define a unique
> >>>>>>> ID,
> >>>>>>> common between Linux, U-Boot, and OP-TEE, to identify a coprocess=
or.
> >>>>>> This "st,proc-id" is just one such property which can rather be
> >>>>>> directly
> >>>>>> probed from the TEE/OP-TEE service rather than hardcoding it in DT
> >>>>>> here.
> >>>>> Do you mean a topology discovery mechanism through the TEE remotepr=
oc
> >>>>> service?
> >>>>>
> >>>>> For the STM32MP15, it could work since we have only one remote
> >>>>> processor.
> >>>>> However, this is not the case for the STM32MP25, which embeds both =
a
> >>>>> Cortex-M33 and a Cortex-M0.
> >>>> I rather mean here whichever properties you can currently dicovering
> >>>> via
> >>>> DT can rather be discovered by invoke command taking property name
> >>>> as input
> >>>> and value as output.
> >>> That would means services to get system resources such as memory regi=
on
> >>> mailbox, right?
> >> Yeah.
> >>
> >>>>> Could you please elaborate on how you see the support of multiple
> >>>>> remote
> >>>>> processors without using an hardcoded identifier?
> >>>> By multiple remote processors, do you mean there can be multiple
> >>>> combinations of which remote processor gets managed via OP-TEE or no=
t?
> >>> On stm32mp25 we have 2 remote processors a cortex-M33 and a cortex-M0
> >>> We should be able to manage them using the proc_idAnother point is
> >>> that We
> >>> should allow an other Secure OS could implement the TEE remoteproc
> >>> service
> >>> managing the remote processors with different proc_id values, to
> >>> avoid to
> >>> specify somewhere an unique proc ID per remote processor.
> >> Okay I see, so you can add unique proc ID to DT which gets consumed by
> >> OP-TEE and Linux discovers the same via the TEE service.
> > Yes the Linux passes the proc ID as argument of the
> > tee_client_open_session().
> > In OP-TEE, the TEE service checks the match with the proc ID registered
> > by the
> > OP-TEE remote proc drivers.
> >
> > Regards,
> > Arnaud
> >
> >>
> >>>>>> I think the same will apply to other properties as well.
> >>>>> Could you details the other properties you have in mind?
> >>>> I think the memory regions including the resource table can also be
> >>>> probed directly from the TEE service too. Is there any other DT
> >>>> property
> >>>> you rely upon when remoteproc is managed via OP-TEE?
> >>> The memory regions that include the resource table are already declar=
ed
> >>> in OP-TEE. The memory regions defined in the Linux device tree are fo=
r
> >>> RPMsg (IPC). These memories are registered by the Linux remoteproc
> >>> driver
> >>> in the Linux rproc core.
> >>>
> >> Sure, so they can also be discovered by TEE service.
> >>
> >> -Sumit
> >
> > _______________________________________________
> > Linux-stm32 mailing list
> > Linux-stm32@st-md-mailman.stormreply.com
> > https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
>
