Return-Path: <robh@kernel.org>
MIME-Version: 1.0
References: <1551795849-13672-1-git-send-email-fabien.dessenne@st.com>
 <1551795849-13672-2-git-send-email-fabien.dessenne@st.com>
 <20190327230722.GA13708@bogus> <41b7bd91-7c14-9227-381e-f0e751ae4079@st.com>
In-Reply-To: <41b7bd91-7c14-9227-381e-f0e751ae4079@st.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Apr 2019 20:29:33 -0500
Message-ID: <CAL_JsqK3BboUTW5TObyAjZCb5T0M-uVYt8pLYjPX598OgcuxkA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: stm32: add bindings for ML-AHB interconnect
Content-Type: text/plain; charset="UTF-8"
To: Fabien DESSENNE <fabien.dessenne@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, Loic PALLARDY <loic.pallardy@st.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Ludovic BARRE <ludovic.barre@st.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

 On Fri, Mar 29, 2019 at 10:59 AM Fabien DESSENNE
<fabien.dessenne@st.com> wrote:
>
> Hi Rob,
>
> Let me clarify the context and the reason of the proposed approach.
>
> The remoteproc framework deals with 'carveout' memory regions.
>  From the remoteproc_core.c:
>
>   * Some remote processors will ask us to allocate them physically contiguous
>   * memory regions (which we call "carveouts"), and map them to specific
>   * device addresses (which are hardcoded in the firmware). They may also have
>   * dedicated memory regions internal to the processors, and use them either
>   * exclusively or alongside carveouts.
>   *
>   * They may then ask us to copy objects into specific device addresses (e.g.
>   * code/data sections) or expose us certain symbols in other device address
>   * (e.g. their trace buffer).
>
> For this, the remoteproc drivers have to register these memory regions
> providing their memory mapping remote processor view / local processor
> view. See rproc_mem_entry_init() and rproc_add_carveout().
>
> An implementation solution consists in declaring the memory mapping inside
> the remoteproc driver. (Ex: imx_rproc_att_imx7d[] from imx_rproc.c)
>
> For the stm32 rproc driver that we are introducing, we would like to have
> something more flexible than hardcoded values.

I need an explanation that is not in terms of remoteproc. That's a Linux thing.

> One reason for this, is that some memory parts can be accessed through
> different 2 bus port, with different addresses and access speed, and we
> would like to let the user customize this.
>
> Using DeviceTree "ranges" seems to fit with these requirements.

'ranges' is strictly about the cpu's (running Linux) view of the
system. 'dma-ranges' is for the device's (the remoteproc) view of
memory. You simply cannot redefine them for your own custom use.

If the cpu has 2 views of the same memory, then you can use ranges to
describe that.

> If you think that this is not the right approach, please let me know if you
> think about something better.
>
> See also below my answer to your specific remarks
>
> BR
>
> On 28/03/2019 12:07 AM, Rob Herring wrote:
>
> > On Tue, Mar 05, 2019 at 03:24:02PM +0100, Fabien Dessenne wrote:
> >> Document the ML-AHB interconnect for stm32 SoCs.
> >>
> >> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> >> ---
> >>   .../devicetree/bindings/arm/stm32/mlahb.txt        | 30 ++++++++++++++++++++++
> >>   1 file changed, 30 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/stm32/mlahb.txt b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
> >> new file mode 100644
> >> index 0000000..880cb38
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
> >> @@ -0,0 +1,30 @@
> >> +ML-AHB interconnect bindings
> >> +
> >> +These bindings describe the STM32 SoCs ML-AHB interconnect bus which connects
> >> +a Cortex-M subsystem with dedicated memories.
> >> +
> >> +Required properties:
> >> +- compatible: should be "simple-bus"
> > A binding for simple-bus was the first thing that looked odd.
>
> Since we want to use "ranges" (or "dma-ranges"), we need to define a parent-bus.
> This bus has nothing specific, so it is a "simple-bus"

Okay, fair enough.

> >> +- ranges: describes memory addresses translation between the local CPU and the
> >> +       remote Cortex-M processor. Each memory region, is declared with 3
> >> +       parameters:
> >> +             - param 1: device base address (Cortex-M processor address)
> >> +             - param 2: physical base address (local CPU address)
> >> +             - param 3: size of the memory region.
> > Given that the driver is parsing ranges itself, this looks like abuse of
> > ranges.
>
> That's correct. As explained above, we need to provide the remoteproc framework
> with carveout mappings.
>
> >
> > What exactly is address 0 supposed to be here? If it is the M4's view of
> > memory, then dma-ranges is what you want to use here.
>
> "dma-ranges" is probably more appropriated here. But the driver still needs to
> parse this property.

That is more acceptable assuming what's in dma-ranges matches the
standard definition.

Rob
