Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099BC19AD85;
	Fri, 27 Sep 2024 17:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727459694; cv=none; b=ZGRTi4SuZQ+vhEXDN4c8D/qd1CPz3RJ+r3h+gu8zZ9AZfoocVVMM7LxYRIdLXxZ6P80RsCdPZaZOI76fHlIs8mwIXRF1BPeWhR55Vybvq9SI5AJJDwj1WiLLKaaOT5zkKwMurTbFjjiyIfuF1ExN3ZUavsQHr8uNleUYZwZe+C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727459694; c=relaxed/simple;
	bh=T/yHHLjFuHMeyNnrNGZw88F3h9EBXeADl+aBiBEkQ9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tlrHnfG+PRB3MYXLQaAP/4nFUJy8oyBaLkfUFTOjUYXBoGnjqRZLMBlNDxXPxCj0nXTKxp+uGwH8Mk+WkhMnH39IxA2JvxbgVcVEvw1b7mz+QDtY17xKZ2K/y1+pqvebpHC03A5rRIS4l49y9WYh2rLcpzJJo58oXhWZ7NxD6lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2DB514BF;
	Fri, 27 Sep 2024 10:55:20 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A9253F6A8;
	Fri, 27 Sep 2024 10:54:48 -0700 (PDT)
Message-ID: <ce534365-0110-4aba-b8b5-0a46c5ea81d0@arm.com>
Date: Fri, 27 Sep 2024 18:54:38 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: sse710: Add the External
 Systems remote processors
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 mathieu.poirier@linaro.org
Cc: Adam.Johnston@arm.com, Hugues.KambaMpiana@arm.com, Drew.Reed@arm.com,
 andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 liviu.dudau@arm.com, lpieralisi@kernel.org, robh@kernel.org,
 sudeep.holla@arm.com
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
 <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/08/2024 6:09 pm, Abdellatif El Khlifi wrote:
> Add devicetree binding schema for the External Systems remote processors
> 
> The External Systems remote processors are provided on the Corstone-1000
> IoT Reference Design Platform via the SSE-710 subsystem.
> 
> For more details about the External Systems, please see Corstone SSE-710
> subsystem features [1].
> 
> [1]: https://developer.arm.com/documentation/102360/0000/Overview-of-Corstone-1000/Corstone-SSE-710-subsystem-features
> 
> Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> ---
>   .../remoteproc/arm,sse710-extsys.yaml         | 90 +++++++++++++++++++
>   1 file changed, 90 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml b/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> new file mode 100644
> index 000000000000..827ba8d962f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/arm,sse710-extsys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SSE-710 External System Remote Processor

Thing is, this is not describing SSE-710. As far as I can work out, it 
is describing the firmware and hardware that a particular example 
implementation of the Corstone-1000 kit has chosen to put in the 
"external system" hole in the SSE-710 within that kit.

If I license SSE-710 alone or even the Corstone-1000 kit, I can put 
whatever I want in *my* implementation of those subsystems, so there 
clearly cannot possibly be a common binding for that.

For instance what if I decide to combine a Cortex-M core plus a radio 
and some other glue as my external subsystem? Do we have dozens of 
remoteproc bindings and drivers for weird fixed-function remoteprocs 
whose "firmware-name" implies a Bluetooth protocol stack? No, we treat 
them as Bluetooth controller devices. Look at 
devicetree/bindings/sound/fsl,rpmsg.yaml - it's even unashamedly an 
rpmsg client, but it's still not abusing the remoteproc subsystem 
because its function to the host OS is as an audio controller, not an 
arbitrarily configurable processor.

As I said before, all SSE-710 actually implements is a reset mechanism, 
so it only seems logical to model it as a reset controller, e.g. 
something like:

	hbsys: syscon@xyz {
		compatible = "arm,sse710-host-base-sysctrl", "syscon";
		reg = <xyz>;
		#reset-cells = <1>;
	};

	something {
		...
		resets = <&hbsys 0>;
	};

	something-else {
		...
		resets = <&hbsys 1>;
	};


Then if there is actually any meaningful functionality in the default 
extsys0 firmware preloaded on the FPGA setup then define a binding for 
"arm,corstone1000-an550-extsys0" to describe whatever that actually 
does. If a user chooses to create and load their own different firmware, 
they're going to need their own binding and driver for whatever *that* 
firmware does.

FWIW, driver-wise the mapping to the reset API seems straightforward - 
.assert hits RST_REQ, .deassert clears CPUWAIT (.status is possibly a 
combination of CPUWAIT and RST_ACK?)

Thanks,
Robin.

> +
> +maintainers:
> +  - Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> +  - Hugues Kamba Mpiana <hugues.kambampiana@arm.com>
> +
> +description: |
> +  SSE-710 is an heterogeneous subsystem supporting up to two remote
> +  processors aka the External Systems.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - arm,sse710-extsys
> +
> +  firmware-name:
> +    description:
> +      The default name of the firmware to load to the remote processor.
> +
> +  '#extsys-id':
> +    description:
> +      The External System ID.
> +    enum: [0, 1]
> +
> +  mbox-names:
> +    items:
> +      - const: txes0
> +      - const: rxes0
> +
> +  mboxes:
> +    description:
> +      The list of Message Handling Unit (MHU) channels used for bidirectional
> +      communication. This property is only required if the virtio-based Rpmsg
> +      messaging bus is used. For more details see the Arm MHUv2 Mailbox
> +      Controller at devicetree/bindings/mailbox/arm,mhuv2.yaml
> +
> +    minItems: 2
> +    maxItems: 2
> +
> +  memory-region:
> +    description:
> +      If present, a phandle for a reserved memory area that used for vdev
> +      buffer, resource table, vring region and others used by the remote
> +      processor.
> +    minItems: 2
> +    maxItems: 32
> +
> +required:
> +  - compatible
> +  - firmware-name
> +  - '#extsys-id'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    reserved-memory {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        extsys0_vring0: vdev0vring0@82001000 {
> +            reg = <0 0x82001000 0 0x8000>;
> +            no-map;
> +        };
> +
> +        extsys0_vring1: vdev0vring1@82009000 {
> +            reg = <0 0x82009000 0 0x8000>;
> +            no-map;
> +        };
> +    };
> +
> +    syscon@1a010000 {
> +        compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
> +        reg = <0x1a010000 0x1000>;
> +
> +        extsys0 {
> +            compatible = "arm,sse710-extsys";
> +            #extsys-id = <0>;
> +            firmware-name = "es_flashfw.elf";
> +            mbox-names = "txes0", "rxes0";
> +            mboxes = <&mhu0_hes0 0 1>, <&mhu0_es0h 0 1>;
> +            memory-region = <&extsys0_vring0>, <&extsys0_vring1>;
> +        };
> +    };
