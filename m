Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 27 Mar 2019 18:23:01 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/8] dt-bindings: remoteproc: add bindings for stm32
 remote processor driver
Message-ID: <20190327232301.GA2172@bogus>
References: <1551795849-13672-1-git-send-email-fabien.dessenne@st.com>
 <1551795849-13672-3-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551795849-13672-3-git-send-email-fabien.dessenne@st.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Ludovic Barre <ludovic.barre@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Mar 05, 2019 at 03:24:03PM +0100, Fabien Dessenne wrote:
> Add the device tree bindings document for the stm32 remoteproc devices.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  .../devicetree/bindings/remoteproc/stm32-rproc.txt | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> new file mode 100644
> index 0000000..cc90c88
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> @@ -0,0 +1,67 @@
> +STMicroelectronics STM32 Remoteproc
> +-----------------------------------
> +This document defines the binding for the remoteproc component that loads and
> +boots firmwares on the ST32MP family chipset.
> +
> +Required properties:
> +- compatible:	Must be "st,stm32mp1-rproc"

'rproc' is what this is called in the h/w manual?

> +- reg:		Address ranges of the remote processor dedicated memories.
> +		The parent node should provide an appropriate ranges property
> +		for properly translating these into bus addresses.
> +- resets:	Reference to a reset controller asserting the remote processor.
> +- reset-names:	Must be "mcu_rst"

-names is kind of pointless when there is only 1 entry.

> +- st,syscfg-holdboot: Reference to the system configuration which holds the
> +		remote processor reset hold boot
> +	1st cell: phandle of syscon block
> +	2nd cell: register offset containing the hold boot setting
> +	3rd cell: register bitmask for the hold boot field
> +- st,syscfg-tz: Reference to the system configuration which holds the RCC trust
> +		zone mode
> +	1st cell: phandle to syscon block
> +	2nd cell: register offset containing the RCC trust zone mode setting
> +	3rd cell: register bitmask for the RCC trust zone mode bit
> +
> +Optional properties:
> +- interrupt-parent: phandle to the interrupt controller node.

This is implied.

> +- interrupts:	Should contain the watchdog interrupt
> +- interrupt-names: Must be "wdg"

-names is kind of pointless when there is only 1 entry.

> +- mboxes:	List of phandle and mailbox channel specifiers:

How would one talk to the processor if this is optional?

> +		- a channel (a) used to communicate through virtqueues with the
> +		  remote proc.
> +		  Bi-directional channel:
> +		      - from local to remote = send message
> +		      - from remote to local = send message ack
> +		- a channel (b) working the opposite direction of channel (a)
> +		- a channel (c) used by the local proc to notify the remote proc
> +		  that it is about to be shut down.
> +		  Mono-directional channel:

Unidirectional

> +		      - from local to remote, where ACK from the remote means
> +		        that it is ready for shutdown
> +- mbox-names:	This property is required if the mboxes property is used.
> +		- must be "vq0" for channel (a)
> +		- must be "vq1" for channel (b)
> +		- must be "shutdown" for channel (c)
> +- memory-region: list of phandles to the reserved memory regions associated with
> +		the remoteproc device
> +		(see ../reserved-memory/reserved-memory.txt)

How many?

> +- st,syscfg-pdds: Reference to the system configuration which holds the remote
> +		processor deep sleep setting
> +	1st cell: phandle to syscon block
> +	2nd cell: register offset containing the deep sleep setting
> +	3rd cell: register bitmask for the deep sleep bit
> +- auto_boot:	If defined, when remoteproc is probed, it looks for a default
> +		firmware and if it finds some, it loads the firmware and starts
> +		the remote processor.

How do you know what is and isn't default firmware? Seems like this 
could be accomplished using the standard 'firmware-name' to specify what 
firmware to load and boot.

> +- recovery:	If defined, remoteproc enables the crash recovery process.

Doesn't seem like a static DT property. This is a feature to enable or 
something you set on boot to recover?

> +
> +Example:
> +	m4_rproc: m4@0 {
> +		compatible = "st,stm32mp1-rproc";
> +		reg = <0x00000000 0x10000>,
> +		      <0x10000000 0x40000>,
> +		      <0x30000000 0x40000>;
> +		resets = <&rcc MCU_R>;
> +		reset-names = "mcu_rst";
> +		st,syscfg-holdboot = <&rcc 0x10C 0x1>;
> +		st,syscfg-tz = <&rcc 0x000 0x1>;
> +	};
> -- 
> 2.7.4
> 
