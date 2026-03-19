Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD743A6B8F;
	Thu, 19 Mar 2026 08:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907566; cv=none; b=E0af44JxP09AskRyWrl3eUMwiAP/IPYL8Re2BAn0ur2jt6+5FSpviqbIsT0WmxZKUqyGDIZdvA/HF2k8jAoqHXPcEpizYwE9ZI4S4SM6KOk0P8jvG7j8RfKrXgbjpttnUCdKQ0NQUDk3bqfm6yj4YcZuto12HV0L8lqIEaSqauE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907566; c=relaxed/simple;
	bh=4JCWNF+D/qWHcNu86lWPqI3P/Ks4jxVkRRfjXis1WB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ank5E+bQWVaQRQwDQjWVr6T8eLESHSL3mHEiO9b4Q/0uAXu3TtqWe989zD0gIl/8+eOsN/v3LW3Z154XU+Eh3G1LtKsFOChlqxVy1PGjwVS8+xes+phNSX/kEtMRepDOidWPAAp+iKC+TdP5RkqclH7HsuGO8vTYFIGr0oHqZZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPJywGWm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPJywGWm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD00C19424;
	Thu, 19 Mar 2026 08:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773907566;
	bh=4JCWNF+D/qWHcNu86lWPqI3P/Ks4jxVkRRfjXis1WB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPJywGWmfPZKo4esFCd879TXQJvbVAD2piXfU4mtgyq9Zd4VcIigyHRLZaniM+AT1
	 DDSGrTb18/IGjBT2vl9PL7tjXDWVt8mZB/W/zHqEveP77YHO3N+8XLAZili5hOhvRD
	 3Ep0CcTceZNeof0PKKDgqBl8VnpubVB3H3OCk9U7yI0OGVEMkv9tv6vTqeoYfyPHsX
	 awSjW9RNWaf9p2Cpza8WkNWThQu7XNSh3q6d4yYYICM869q/XOTWD9c9JrKurNK98k
	 VtILAttqv7Ww0SGR27d1IAjLYU41dnH6K9J+dNZ2joj2RY/dPzSvL1jePwpNgCbpnc
	 ijcCCxdNNy1EQ==
Date: Thu, 19 Mar 2026 09:06:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v21 2/6] dt-bindings: remoteproc: Add STM32
 TEE-controlled rproc binding
Message-ID: <20260319-glistening-ultramarine-ibis-1eb3d6@quoll>
References: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
 <20260317180329.1207625-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317180329.1207625-3-arnaud.pouliquen@foss.st.com>

On Tue, Mar 17, 2026 at 07:03:23PM +0100, Arnaud Pouliquen wrote:
> Add a Device Tree binding for the STM32 remote processor controlled
> via a Trusted Application running in OP-TEE.
> This binding describes the interface and properties required for STM32MP
> remoteproc instances managed by the TEE rproc service, including a
> linkage to the TEE backend through the property "rproc-tee-phandle".
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> V21 updates:
> - the m4 node is no more declared as a child of the optee-rproc node
> - "rproc-tee-phandle" property is introduced to reference the optee-rproc
> ---
>  .../remoteproc/st,stm32-rproc-tee.yaml        | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
> new file mode 100644
> index 000000000000..ca4dd1c8e7b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc-tee.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/st,stm32-rproc-tee.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 remote processor controlled via TEE
> +
> +maintainers:
> +  - Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> +
> +description: |
> +  STM32MP remote processor controlled by a Trusted Application
> +  running in OP-TEE. This node is a child of the TEE remoteproc service
> +  (UUID 80a4c275-0a47-4905-8285-1486a9771a08) and exposes a remoteproc
> +  instance managed by the Linux remoteproc core via the TEE rproc service.
> +
> +  Firmware loading, authentication and remote processor start/stop are managed
> +  by the TEE application. The STM32-specific driver handles platform resources
> +  such as the mailboxes and reserved-memory.
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp1-m4-tee

Drop "tee", it suggests that compatible is tied to implementation of FW
you put there.

> +
> +  reg:
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Remote processor identifier used by the TEE service. The <0> value
> +      in the example denotes a single instance with ID 0.
> +    maxItems: 1
> +
> +  mboxes:
> +    description: |
> +      Mailbox channels used for rpmsg/virtio functionality and processor
> +      shutdown.
> +    maxItems: 3
> +
> +  mbox-names:
> +    items:
> +      - const: vq0
> +      - const: vq1
> +      - const: shutdown
> +
> +  memory-region:
> +    description: |
> +      List of phandles to reserved-memory nodes describing the memory layout
> +      for the interprocessors communication.

Drop description. You miss maxItems, though.

> +
> +  interrupts:
> +    description: |

Same comments...

> +      Optional watchdog / status interrupt line used to detect crashes
> +      and optionally wake up the system.
> +    maxItems: 1
> +
> +  st,auto-boot:
> +    type: boolean
> +    description: |
> +      If present, the remote processor will be automatically started by
> +      the remoteproc core at boot.

That's policy, not DT property.

> +
> +  wakeup-source:
> +    type: boolean
> +    description: |
> +      Indicates that the watchdog interrupt can be used as a wakeup source.
> +
> +  rproc-tee-phandle:

Missing vendor prefix, drop phandle. You do not say that "st,auto-boot"
is "st,auto-boot-boolean"

> +    description: |
> +      Phandle to the remote processor backend node and its identifier. This property
> +      is used to link the TEE remoteproc service to the remote processor instance
> +      it controls. The value is a phandle reference to the remote processor node,
> +      followed by a cell specifying the remote processor identifier used by the TEE.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Missing constraints.

I also do not understand which bus node this is being child, if not
remote proc.

> +
> +required:
> +  - compatible
> +  - reg
> +  - rproc-tee-phandle
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    firmware {
> +        tee_rproc: optee-rproc {
> +            compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
> +        };
> +    };

Drop

> +
> +    m4: m4@0 {

Drop unused label.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

e.g. mcu, because m4 feels like given model (Cortex M4?).

> +      compatible = "st,stm32mp1-m4-tee";
> +      reg = <0 0>;
> +
> +      mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
> +      mbox-names = "vq0", "vq1", "shutdown";
> +
> +      memory-region = <&vdev0vring0>, <&m_ipc_shm>, <&mcuram2>,
> +                      <&vdev0vring1>, <&vdev0buffer>, <&retram>;
> +
> +      interrupt-parent = <&exti>;
> +      interrupts = <68 1>;
> +
> +      rproc-tee-phandle = <&tee_rproc 0>;
> +      st,auto-boot;
> +      wakeup-source;
> +
> +      status = "okay";

Drop

Best regards,
Krzysztof

