Return-Path: <robh@kernel.org>
MIME-Version: 1.0
References: <1555426699-5340-1-git-send-email-fabien.dessenne@st.com>
 <1555426699-5340-3-git-send-email-fabien.dessenne@st.com> <20190430004051.GA7391@bogus>
 <ff424530-6e7b-cec9-910f-1897d60de2a1@st.com>
In-Reply-To: <ff424530-6e7b-cec9-910f-1897d60de2a1@st.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Apr 2019 15:37:25 -0500
Message-ID: <CAL_JsqJjMy43Juhse_PwRqjwjG2swkiJsQgagZWAb53an9B-6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: remoteproc: add bindings for stm32
 remote processor driver
Content-Type: text/plain; charset="UTF-8"
To: Fabien DESSENNE <fabien.dessenne@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, Loic PALLARDY <loic.pallardy@st.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Ludovic BARRE <ludovic.barre@st.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Apr 30, 2019 at 9:15 AM Fabien DESSENNE <fabien.dessenne@st.com> wrote:
>
> Hi Rob,
>
>
> On 30/04/2019 2:40 AM, Rob Herring wrote:
> > On Tue, Apr 16, 2019 at 04:58:13PM +0200, Fabien Dessenne wrote:
> >> Add the device tree bindings document for the stm32 remoteproc devices.
> >>
> >> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> >> ---
> >>   .../devicetree/bindings/remoteproc/stm32-rproc.txt | 64 ++++++++++++++++++++++
> >>   1 file changed, 64 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> >> new file mode 100644
> >> index 0000000..430132c
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> >> @@ -0,0 +1,64 @@
> >> +STMicroelectronics STM32 Remoteproc
> >> +-----------------------------------
> >> +This document defines the binding for the remoteproc component that loads and
> >> +boots firmwares on the ST32MP family chipset.
> >> +
> >> +Required properties:
> >> +- compatible:       Must be "st,stm32mp1-m4"
> >> +- reg:              Address ranges of the remote processor dedicated memories.
> >> +            The parent node should provide an appropriate ranges property
> >> +            for properly translating these into bus addresses.
> > dma-ranges, but that's independent of 'reg'.
> >
> > It needs to list how many reg regions and what they are.
>
> The "reg" property needs to be removed since it is not used by the
> driver : the "memory-region" property (defined below) provides with all
> the needed memory information.

I'm not sure that's the right direction. reserved-memory nodes
generally should be in the range of system memory (i.e. what /memory
nodes define).

> Unfortunately, when I remove this "reg" property from the DeviceTree, I
> have this warning when building (W=123) the DTB:
>
>   "Warning (avoid_unnecessary_addr_size): /mlahb: unnecessary
> #address-cells/#size-cells without "ranges" or child "reg" property"
>
> IMHO, there is something wrong in the dtc script which seems to ignore
> the "dma-ranges" property that needs to have #address-cells/#size-cells
> defined. Just like "ranges".

Perhaps.

>
> The quick patch below (add check for "dma-ranges" ) in
> scripts/dtc/checks.c solves this issue.
>
> static void check_avoid_unnecessary_addr_size(struct check *c, struct
> dt_info *dti,
>                            struct node *node)
> {
> ...
>      if (get_property(node, "ranges") || get_property(node,
> "dma-ranges") || !node->children)
>          return;
> ...
>
> Can you confirm that I can remove the "reg" property and ignore the warning?

That should cause another warning because the 'simple-bus' checks
expect to have nodes with addresses as 'simple-bus' means MMIO bus.
That may have been the check which was broken for a while and I just
fixed not too long ago.

Rob
