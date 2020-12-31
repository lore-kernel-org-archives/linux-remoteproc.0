Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC49C433E6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 31 Dec 2020 18:15:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA4C8223E8
	for <linux-remoteproc@archiver.kernel.org>; Thu, 31 Dec 2020 18:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgLaSPL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 31 Dec 2020 13:15:11 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:38172 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgLaSPL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 31 Dec 2020 13:15:11 -0500
Received: by mail-ot1-f41.google.com with SMTP id j20so18583833otq.5;
        Thu, 31 Dec 2020 10:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iq0dcWEVlFUmNv6kk0ISrl3suC2cnVnqKLX0qddM2wo=;
        b=Yo50ISLJ7OXL/R6+eTS4WRMk2FYA5o3p9hWgMZ62y3ADTC8mdub4beYebzWNT88fcG
         KhRa9URt5dv6RVVjLfIjafF4Y+NL4sQO86LzZToPBJX5mJIFjNDR4pBq082MUQ/dgzuE
         VAw9nKeCNKCRnSCfcjdqD7eFozen+LBSp2MkMkE5MNjowEB5SSAVZ5HZVox+Klo4miRS
         hjzayWuNSYsvtLefeDhwoCOjWEhl2j86JMHnnisqltiFe5LYuvnar/9Xcbkq7r7oGfEW
         OIL5f+3jAsJ8JnYZb0IePCE5nLljnL7m/bidvHuW2ouU3SshLWLJDecKjxvXE8EGPpgh
         O4tQ==
X-Gm-Message-State: AOAM533D0PKYsofZuBwLnYHCfN1HDtfTyFj74GAD+0xUISs1BER1woTV
        RlC+oHPF6y31HKP1ohLrWfXswiFaXQ==
X-Google-Smtp-Source: ABdhPJxnSl31FNRefQoVvm0p3wnIQvQHkxPiFa4SHrf1hPyKCmgwy5k8a1uYLMvcEdPkcGpykvuJig==
X-Received: by 2002:a05:6830:1de8:: with SMTP id b8mr41585182otj.204.1609438470100;
        Thu, 31 Dec 2020 10:14:30 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id f25sm11148595oou.39.2020.12.31.10.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 10:14:28 -0800 (PST)
Received: (nullmailer pid 2077595 invoked by uid 1000);
        Thu, 31 Dec 2020 18:14:25 -0000
Date:   Thu, 31 Dec 2020 11:14:25 -0700
From:   Rob Herring <robh@kernel.org>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        ohad@wizery.com
Subject: Re: [PATCH 2/5] dt-bindings: Amlogic: add the documentation for the
 SECBUS2 registers
Message-ID: <20201231181425.GA2075418@robh.at.kernel.org>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
 <20201230012724.1326156-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230012724.1326156-3-martin.blumenstingl@googlemail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Dec 30, 2020 at 02:27:21AM +0100, Martin Blumenstingl wrote:
> The Meson8/Meson8b/Meson8m2 SoCs have a register bank called SECBUS2 which
> contains registers for various IP blocks such as pin-controller bits for
> the BSD_EN and TEST_N GPIOs as well as some AO ARC core control bits.
> The registers can be accessed directly when not running in "secure mode".
> When "secure mode" is enabled then these registers have to be accessed
> through secure monitor calls.
> 
> So far these SoCs are always known to boot in "non-secure mode".
> Add a binding documentation using syscon (as these registers are shared
> across different IPs) for the SECBUS2 registers.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../arm/amlogic/amlogic,meson-mx-secbus2.yaml | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
> new file mode 100644
> index 000000000000..cfa8e9de6c28
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/arm/amlogic/amlogic,meson-mx-secbus2.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson8/Meson8b/Meson8m2 SECBUS2 register interface
> +
> +maintainers:
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +
> +description: |
> +  The Meson8/Meson8b/Meson8m2 SoCs have a register bank called SECBUS2 which
> +  contains registers for various IP blocks such as pin-controller bits for
> +  the BSD_EN and TEST_N GPIOs as well as some AO ARC core control bits.
> +  The registers can be accessed directly when not running in "secure mode".
> +  When "secure mode" is enabled then these registers have to be accessed
> +  through secure monitor calls.
> +
> +# We need a select here so we don't match all nodes with 'syscon'

No, you don't. The default 'select' will ignore 'syscon' and 
'simple-mfd'.

> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - amlogic,meson8-secbus2
> +          - amlogic,meson8b-secbus2
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - amlogic,meson8-secbus2
> +        - amlogic,meson8b-secbus2
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    secbus2: system-controller@4000 {
> +      compatible = "amlogic,meson8-secbus2", "syscon";
> +      reg = <0x4000 0x2000>;
> +    };
> -- 
> 2.30.0
> 
