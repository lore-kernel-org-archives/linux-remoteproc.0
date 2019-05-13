Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 13 May 2019 12:19:22 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/8] dt-bindings: remoteproc: add bindings for stm32
 remote processor driver
Message-ID: <20190513171922.GA25458@bogus>
References: <1556784606-3016-1-git-send-email-fabien.dessenne@st.com>
 <1556784606-3016-3-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556784606-3016-3-git-send-email-fabien.dessenne@st.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Ludovic Barre <ludovic.barre@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, May 02, 2019 at 10:10:00AM +0200, Fabien Dessenne wrote:
> Add the device tree bindings document for the stm32 remoteproc devices.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  .../devicetree/bindings/remoteproc/stm32-rproc.txt | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> new file mode 100644
> index 0000000..a495757
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> @@ -0,0 +1,63 @@
> +STMicroelectronics STM32 Remoteproc
> +-----------------------------------
> +This document defines the binding for the remoteproc component that loads and
> +boots firmwares on the ST32MP family chipset.
> +
> +Required properties:
> +- compatible:	Must be "st,stm32mp1-m4"
> +- reg:		Address ranges of the RETRAM and MCU SRAM memories used by the
> +		remote processor.
> +- resets:	Reference to a reset controller asserting the remote processor.
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
> +- interrupts:	Should contain the watchdog interrupt
> +- mboxes:	This property is required only if the rpmsg/virtio functionality
> +		is used. List of phandle and mailbox channel specifiers:
> +		- a channel (a) used to communicate through virtqueues with the
> +		  remote proc.
> +		  Bi-directional channel:
> +		      - from local to remote = send message
> +		      - from remote to local = send message ack
> +		- a channel (b) working the opposite direction of channel (a)
> +		- a channel (c) used by the local proc to notify the remote proc
> +		  that it is about to be shut down.
> +		  Unidirectional channel:
> +		      - from local to remote, where ACK from the remote means
> +		        that it is ready for shutdown
> +- mbox-names:	This property is required if the mboxes property is used.
> +		- must be "vq0" for channel (a)
> +		- must be "vq1" for channel (b)
> +		- must be "shutdown" for channel (c)
> +- memory-region: List of phandles to the reserved memory regions associated with
> +		the remoteproc device. This is variable and describes the
> +		memories shared with the remote processor (eg: remoteproc
> +		firmware and carveouts, rpmsg vrings, ...).
> +		(see ../reserved-memory/reserved-memory.txt)
> +- st,syscfg-pdds: Reference to the system configuration which holds the remote
> +		processor deep sleep setting
> +	1st cell: phandle to syscon block
> +	2nd cell: register offset containing the deep sleep setting
> +	3rd cell: register bitmask for the deep sleep bit
> +- st,auto_boot:	If defined, when remoteproc is probed, it loads the default
> +		firmware and starts the remote processor.

s/_/-/

> +
> +Example:
> +	m4_rproc: m4@38000000 {
> +		compatible = "st,stm32mp1-m4";
> +		reg = <0x00000000 0x10000>,

Doesn't match the unit-address.

> +		      <0x10000000 0x40000>,
> +		      <0x30000000 0x40000>;
> +		resets = <&rcc MCU_R>;
> +		st,syscfg-holdboot = <&rcc 0x10C 0x1>;
> +		st,syscfg-tz = <&rcc 0x000 0x1>;
> +	};
> -- 
> 2.7.4
> 
