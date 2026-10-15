Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C45379C32;
	Thu, 15 Oct 2026 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057610; cv=none; b=TB68OXC+X+csp5AUS5NMZSVqKrqq3f2y7PQxkjmAU9maAHf+MPLVaVapI/p4Aby1R9NdJGQ/do+YgyEktVRC5J6iy1HjO/I5Q5zSWNsOs7AclfEQpu1HDPb7iGGno8dfKf8dkzT52QC+xY9K4/1dpneUvHTXy3u3otQPgPyESrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057610; c=relaxed/simple;
	bh=2EKMJjGR4N/NuLjW5Qj7Ktzmxr9jrlSRhRGRQEYAqgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+viBi4Nr/9e/2WbbUS2b5djFjWujbprS36Wf+3U/1L0TTxj0zWH4stj69kIe6fEDIqZgbtRwYoKInFmEe1Ifm8lkiOP7+0d+6dc6ZMcdMDUbqC14TH+UzAohyBbl2tfn24ZkDK0kbQLUnJuXf/5Bf7G/m8rSxirgVZ7nPA8Drc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MklJ58uf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MklJ58uf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA521F000C5;
	Thu, 15 Oct 2026 09:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057609;
	bh=2lowusFO7l2EqRZuUkSYQhtV0VyeUDc9yC8uSUFrfKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MklJ58ufcdst+76YncuE0P3g0Fwp5bTk59g7ogs2UniZidJPVfGk+JRumqMcNNc5W
	 BhaYIGb9YkBGjR3zSF4JucEBQH2tWkMFOFQ8qXJ7eJ1EZEh6/CpBIlgd59hjLiMHLe
	 JtAJJEzp4jIwOnNfEGH/f7GOs1Z15owxNQKq2fJRoe4kMOlvMc2GEoPAbyh9A/nTF3
	 felAjV1ZTbr7v8nRBn2oUGPjrTNm3TlzMK2mbKwQZcNtFqHKCiULGeqqXbxiBY+Gaa
	 UMy8orsLP5tz0/vRK0k6gmN6OhHB99cd2QwX3W07F6kQjXdXZyR2SCn8uSl+mjgR9f
	 bCiOsNQCnEM3g==
Date: Thu, 15 Oct 2026 11:46:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, 
	mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michal.simek@amd.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, tanmay.shah@amd.com
Subject: Re: [PATCH 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
Message-ID: <20261015-humble-eager-mushroom-9db4aa@quoll>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-4-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014213426.2957480-4-ben.levinsky@amd.com>

On Wed, Oct 14, 2026 at 02:34:23PM -0700, Ben Levinsky wrote:
> Document the AMD programmable-logic Mailbox IP used for bidirectional
> FIFO communication between two processor-facing interfaces.
> 
> The same IP is used on ZynqMP, Versal, Versal NET and Versal Gen 2.
> Name each SoC in its compatible, and use amd,zynqmp-pl-mbox-2.1 as the
> fallback that drivers match.
> 
> Define the transmit and receive channel indices together with the register
> aperture, interrupt, and interface clock. Describe the FIFO depth chosen
> when the IP is configured, so that the driver can size received messages
> to it.
> 
> Assisted-by: LLM sparse

How sparse assists here? It's something new. Since when does it parse
yaml code?

> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  .../mailbox/amd,zynqmp-pl-mbox-2.1.yaml       | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml b/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml
> new file mode 100644
> index 000000000000..2cc0d106b888
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/amd,zynqmp-pl-mbox-2.1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMD Programmable Logic Mailbox IP
> +
> +maintainers:
> +  - Ben Levinsky <ben.levinsky@amd.com>
> +
> +description: |
> +  The AMD Programmable Logic Mailbox IP provides bidirectional message passing
> +  between two processor-facing interfaces. Each interface writes messages to
> +  a send FIFO and reads messages from a receive FIFO. The register aperture,
> +  interrupt, and clock described by a node belong to one processor-facing
> +  interface. Channel 0 represents transmit and channel 1 represents receive
> +  for that interface.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: amd,zynqmp-pl-mbox-2.1

What is 2.1? Your SoC has different versions?

> +      - items:
> +          - enum:
> +              - amd,versal-pl-mbox-2.1
> +              - amd,versal-net-pl-mbox-2.1
> +              - amd,versal2-pl-mbox-2.1
> +          - const: amd,zynqmp-pl-mbox-2.1
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  amd,mbox-pl-fifo-len:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 16
> +    maximum: 8192
> +    default: 16
> +    description:
> +      Depth of the send and receive FIFOs in 32-bit words, as configured by
> +      the C_MAILBOX_DEPTH parameter of the IP. Must match the configured
> +      depth.

So you have multiple mailboxes per one soc different in this?

Best regards,
Krzysztof

