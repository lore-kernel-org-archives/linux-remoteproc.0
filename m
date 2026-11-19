Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107593;
	b=yWegnj2IF8NS4fk2qrMVfLyqGp6NnLQUICUIsv14lcAN0G7hKnTM/hw1bEQnnNMGO8to
	 owfavjWV0NOdm81QYLgSTPrHDYU1xpXzpg3nyMzsrXSrJrgv3uJKcuVz/KDGsPlwwGsEc
	 snDa+JdiBySbC1u7uDVwqHUA6ic/x1l4it+Rn8zGFaBStea5c+i497b8/lmhq0BsdctT+
	 wc/aHtAyK0f5mXGh9PHOrQxVD63Rdbuq691NkMIGnRboQfuPBm+wQuoP0oOHqBbM/kga0
	 cRc0MSBp9sDBsktQ7fHd23khaWP7pduHMSMSyH3CBpYXtFeC80gx+kEn1HbgkrheYdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RJzTbt4b5o1R8Zwzsovu5HVY5FLB11k288WW5ys9/qo=;
	b=kLJZJk7xCxv+Sulp6uG+ebuJOFtNbiWN703hGA5Lqd+v7HTl8x1IQ/MQwX6BzbDATSv+
	 qITwqhr8hnVCVUM0IzWOYihUz5J3NWCHyxg+CC8Sj3rK5olt1k+C0/LenlJisX03Sxxig
	 eriRP8HerEkB3LFzcRcCkPgi9iXhU9GLBaytbzWXUYnLLD3EiC006ed7X+9bryiiEyWgU
	 FIAOHyd+qRZrP9Zen4qMc0QsnX8SKQWIFcUPvq1+ndhQdOTkdIDUBoBLG+oAB/wRJG6TW
	 r2/JLDOIiNjfBoPh9V24vHvCVPQO2KJElKnDp6Ifd4fEfjMOz6qZOLkLcgRCoSMmm3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=St+5EPMT;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DDF606A32C
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 16:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64DDF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=St+5EPMT
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ed0890476fso14352425ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 08:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795107592; x=1795712392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RJzTbt4b5o1R8Zwzsovu5HVY5FLB11k288WW5ys9/qo=;
        b=St+5EPMTj9lz9zMplsRGje+/j0VqZ3/ZiCoiTrVyK6XHh5WKimiqwWqlf+RP+O7fmL
         LH6aTfNlbbrMjY3gh7FBxnjjbyBRjevL3S/30nY3TvlbNrAtDK8IM1jsc2lBl/1dlppN
         bIAHe9vQ+OEStwYXvf0t0JKGOysMV5R9ZPyYRG/c+yGhdMyoXyrcjQgrCg5QCt04/xx/
         ABqOGswIM9PJLWO0XABTM5FeC0xUGt9Sg0LdmqWaoKVHay8LbTGrzzSYRimlaQKCcDOx
         TVHJGkm5+zarjtkWXB8aL+AyTFgI/WeZUasL6jMsuJ5uQZz9k6d4iD+bzOsvbhTwo58g
         fWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107592; x=1795712392;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJzTbt4b5o1R8Zwzsovu5HVY5FLB11k288WW5ys9/qo=;
        b=XS2/8j2iwnZMcIvWZwHWLPVlErNuiipnky8BMg3If6TuSI9De268G2b3nT7tuA+i0B
         sHc5n9KkgiKojm2nZSiFR/zHZrD+vYr1bVuF0XdtjGm/Gnh5XFbN1gyUqfw8TjD+R9Ps
         K4aNXilwivq0QQVZJEmP4ZY5KUV5f0/iqeezKcZaTgsob8f9udm/BG5oZpUEO+mJ1DJ7
         8WPNe2MenSwk55LWea2my/D0NL/9ymzj2domZyaJbWRzc2A4sdrgiJygjbbupHPjdaNQ
         uM6pGvzg9pADFB8MYHRYBH/FiWtmGQLRP4/Te+JlggMvnjs8kndWEGhfoeMgfkBgnxTV
         tCiw==
X-Forwarded-Encrypted: i=1; AL+hErGvRbsIdqDDprLU4jGVEs9HITYPsOGwGQjh+zsFMab3ux2Gme7DdoXAVEsD2Wo9FWr8Z0MUnWhFNjvCQgU61t8Y@vger.kernel.org
X-Gm-Message-State: APuU4Z8HrtkWFkVhLvl/WjP1Tum/m3KaSnaU2LuBtlygo1dv2K/sAlGI
	AU5pMtF1nhWCGcQQKh3BjPRKo4ONRZkDsujeBGJnQIp252MGOFMdyU6WLkE0EbR2RVg=
X-Gm-Gg: AZFdTZdcfi09ZNqOZ66OxfO7NPtLZV0cLqhF8/bU2eQ3DsCGfcMU8diz257NhJWf2Ie
	GMDNM43RfW9krMNdhxSmzmmoZDfFml//jPJ1V8nxA0HMP21ET3D32wk3oDEQ4OC5pCx5zBhPkI8
	DtBuKYpOR+X1UWCth6nSOjpKR8GgYVD/eCLB7sVU/8cfIg8pVb16nIg8xv6T+PjbRcwaxnyyWr0
	x3NrKegGG57yEYIhlkEGbftGokgI5ZXqwFQV4azgQZA72IUNvN2Id3SfgppnBg2YDvsnp0p9VxX
	wVIjBpGATHqFZk0rxEYAMoqK4OCqp8Hhy94EycFPE8mnfenaIoYjK2CtkzsefCQ8XRKBKm+JeuQ
	LrpyloTGh5Y+QRx9ox/YRiChXLLS7YufeTWAlJOnhnhKdEcwJR7NTKQaEm7ZUbkPugVqkM/Ks/Z
	kSd3EQmtzF7Aj5YQjdNkxS02W/XPNN8iuUjluO6j1XmQLZZyoV7RP41+JUgkLRV0p+GOL1U1gSE
	pLRkEpl+0bgH+U3a4x4jU7scN3NFzsprZauHJ8Z+i5iciWSz/mVtyzzDT4ici23pGhTqlJ7NVO8
	dca/q5Wi6n6yK85v03ODFi8r9oIh2Kf9
X-Received: by 2002:a17:903:4586:b0:2ed:fd82:e905 with SMTP id d9443c01a7336-2f03f207db7mr5065875ad.31.1795107591652;
        Thu, 19 Nov 2026 08:59:51 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9bd7:226d:1022:f6ef])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ed3b3c1sm3054985ad.0.2026.11.19.08.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:59:51 -0800 (PST)
Date: Thu, 19 Nov 2026 10:59:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
Message-ID: <av8rBP9x0I-ikEJy@p14s>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-4-ben.levinsky@amd.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105051902.1646651-4-ben.levinsky@amd.com>

On Wed, Nov 04, 2026 at 09:18:59PM -0800, Ben Levinsky wrote:
> Document the AMD programmable-logic Mailbox IP used for bidirectional
> FIFO communication between two processor-facing interfaces.
> 
> The Mailbox is a soft IP core instantiated in programmable logic, and the
> same SoC can carry different versions of it, so it is not a SoC block.
> Like other PL soft IP bindings, use a single compatible that names the IP
> core and its version, amd,pl-mailbox-2.1. "pl" distinguishes it from the
> IPI hardware that can also act as a mailbox.
>
> Define the transmit and receive channel indices together with the register
> aperture, interrupt, and interface clock. Describe the FIFO depth chosen
> for each IP instance when the design is synthesized. It cannot be read
> from the registers, and the driver needs it to size received messages.

"register aperture"?  What is that?

> 
> Assisted-by: Claude:claude-opus-5.5
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  .../bindings/mailbox/amd,pl-mailbox-2.1.yaml  | 73 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml b/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
> new file mode 100644
> index 000000000000..dc16a2e1142b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/amd,pl-mailbox-2.1.yaml#
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
> +  The Mailbox is a soft IP core instantiated in programmable logic, not a
> +  SoC block, so the compatible names the IP core and its version (2.1).
> +  The "pl" part distinguishes it from the IPI hardware that can also be
> +  used as a mailbox.
> +
> +properties:
> +  compatible:
> +    const: amd,pl-mailbox-2.1
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
> +  amd,pl-mailbox-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 16
> +    maximum: 8192
> +    default: 16
> +    description:
> +      Depth of the send and receive FIFOs in 32-bit words. The depth is the
> +      C_MAILBOX_DEPTH parameter chosen for each IP instance when the design
> +      is synthesized, so instances in one design can differ, and it cannot
> +      be read from the registers. Must match the synthesized depth.
> +
> +  '#mbox-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - '#mbox-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mailbox@b2060000 {
> +        compatible = "amd,pl-mailbox-2.1";
> +        reg = <0xb2060000 0x10000>;
> +        interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&pl_clk>;
> +        amd,pl-mailbox-depth = <16>;
> +        #mbox-cells = <1>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e3f9f2751fe..3722a66b9960 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1306,6 +1306,12 @@ S:	Supported
>  T:	git https://gitlab.freedesktop.org/agd5f/linux.git
>  F:	drivers/gpu/drm/amd/pm/
>  
> +AMD PROGRAMMABLE LOGIC MAILBOX DRIVER
> +M:	Ben Levinsky <ben.levinsky@amd.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
> +
>  AMD PSTATE DRIVER
>  M:	Huang Rui <ray.huang@amd.com>
>  M:	Mario Limonciello <mario.limonciello@amd.com>
> -- 
> 2.34.1
> 
