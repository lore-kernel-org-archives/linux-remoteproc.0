Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C87C4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 12 Oct 2022 15:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbiJLP1Q (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 12 Oct 2022 11:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbiJLP1P (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 12 Oct 2022 11:27:15 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2894D17F
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Oct 2022 08:27:14 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id f27so3032222qkh.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Oct 2022 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cyOn+XjhMrkROUZxuY81sZKNPsWKYHOGOyEQrBWv/Ko=;
        b=ILJgM3xVO0tv24Z1liMTbC+6lSxwxapAMZoN0MXneb4BfPvujCP63uAv25AZdl/yKU
         jTFPQoaN/IlwjiRq5nRvj3qfOniHoqBymUh6iYrsk9fHcbKizFtC6vSL3nkOMlVMtLzw
         vsl/p81LPGTQcw+q6JFLVnuHByT0oz87QPnJRmQQBAe2WT5nzBT697gWXdKlp1tKwwMi
         nBYaGiSs/T27onVYKKIeCSRXRx2VuJL6dSvLLQ8RslELgfYWbZ/3hjopXo3qH99ZnIlP
         6i27+VGlYnZMZOH/9R1RHTwxcrxC6zq2O0d9ysHImx3X/KDNDofj8d5/NiAw1tufh7X3
         BsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cyOn+XjhMrkROUZxuY81sZKNPsWKYHOGOyEQrBWv/Ko=;
        b=o1g2o9ciGc0oGGBJPwrsdGc5/NzTAAcZSLdpZw4W9qTwEGY+vWlxGZDfTJpnifdJCV
         Z0hUcnz6UIjRm/u09Z484BvZDs4vEhbGBqQ9M3gLRaJBdcZ5vrC5hosIym6eyT/E2+cT
         LjrYrrbS38/U+VlgWHjfIJ29DpRCLZvNNQIfLmGkQougBJHpSdeHGSjSI/RINxPVLDmw
         ORQl9AeQeg1PWwnVWEW7IWJd6oFg7SY+SZhjFPpVCL4tuufLel+810jwH0AFGPQPJHs1
         QJtjH3n1Y2ZpX2j4rx/xVRdqwBpxOEHWonW0+Y0XUocWt1lLz1yN+sWHAKMdKsEzD5LJ
         xrWg==
X-Gm-Message-State: ACrzQf2VWIiUZql9omzeiE+lVtkN5hQvWu5IeLfAHVevlCa4N8/S8388
        TEZcNYzEaQ6zJ+3Bo8FOOaZYTw==
X-Google-Smtp-Source: AMsMyM4itbCgzgNfgASHz/vlYDDlKaHFmCfg/cUdJzUglgTaIjdWhaDmIdu8FQnnBvkHuxYUpZYr+w==
X-Received: by 2002:a05:620a:4448:b0:6e2:5ec9:c697 with SMTP id w8-20020a05620a444800b006e25ec9c697mr20636959qkp.438.1665588433177;
        Wed, 12 Oct 2022 08:27:13 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id y8-20020a05620a25c800b006cbe3be300esm15799584qko.12.2022.10.12.08.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 08:27:12 -0700 (PDT)
Message-ID: <78805233-0802-7a7e-f1b1-84c566084833@linaro.org>
Date:   Wed, 12 Oct 2022 11:24:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v6 1/5] dt-bindings: remoteproc: Add PRU consumer bindings
Content-Language: en-US
To:     MD Danish Anwar <danishanwar@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Suman Anna <s-anna@ti.com>, Roger Quadros <rogerq@kernel.org>,
        nm@ti.com, vigneshr@ti.com, srk@ti.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tero Kristo <t-kristo@ti.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Puranjay Mohan <p-mohan@ti.com>
References: <20221012114429.2341215-1-danishanwar@ti.com>
 <20221012114429.2341215-2-danishanwar@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221012114429.2341215-2-danishanwar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/10/2022 07:44, MD Danish Anwar wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> Add a YAML binding document for PRU consumers. The binding includes

Add a DT schema binding for ...

Second thing: where is a user of this common binding? How do you apply
this schema to anything?

> all the common properties that can be used by different PRU consumer
> or application nodes and supported by the PRU remoteproc driver.
> These are used to configure the PRU hardware for specific user
> applications.
> 
> The application nodes themselves should define their own bindings.
> 
> Co-developed-by: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  .../bindings/remoteproc/ti,pru-consumer.yaml  | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> new file mode 100644
> index 000000000000..16be98b7d600
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/ti,pru-consumer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common TI PRU Consumer Binding
> +
> +maintainers:
> +  - Suman Anna <s-anna@ti.com>
> +
> +description: |
> +  A PRU application/consumer/user node typically uses one or more PRU device
> +  nodes to implement a PRU application/functionality. Each application/client
> +  node would need a reference to at least a PRU node, and optionally define
> +  some properties needed for hardware/firmware configuration. The below
> +  properties are a list of common properties supported by the PRU remoteproc
> +  infrastructure.
> +
> +  The application nodes shall define their own bindings like regular platform
> +  devices, so below are in addition to each node's bindings.
> +
> +properties:
> +  ti,prus:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: phandles to the PRU, RTU or Tx_PRU nodes used
> +    minItems: 1
> +    maxItems: 6
> +    items:
> +      maxItems: 1
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    minItems: 1
> +    maxItems: 6
> +    description: |
> +      firmwares for the PRU cores, the default firmware for the core from
> +      the PRU node will be used if not provided. The firmware names should
> +      correspond to the PRU cores listed in the 'ti,prus' property
> +
> +  ti,pruss-gp-mux-sel:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 6
> +    items:
> +      enum: [0, 1, 2, 3, 4]
> +    description: |
> +      array of values for the GP_MUX_SEL under PRUSS_GPCFG register for a PRU.
> +      This selects the internal muxing scheme for the PRU instance. Values
> +      should correspond to the PRU cores listed in the 'ti,prus' property. The
> +      GP_MUX_SEL setting is a per-slice setting (one setting for PRU0, RTU0,
> +      and Tx_PRU0 on K3 SoCs). Use the same value for all cores within the
> +      same slice in the associative array. If the array size is smaller than
> +      the size of 'ti,prus' property, the default out-of-reset value (0) for the
> +      PRU core is used.
> +
> +required:
> +  - ti,prus
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    /* PRU application node full example */
> +    icssg2_eth: icssg2-eth {
> +      compatible = "ti,am654-icssg-prueth";
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&icssg2_rgmii_pins_default>;
> +      sram = <&msmc_ram>;
> +      ti,prus = <&pru2_0>, <&rtu2_0>, <&tx_pru2_0>,
> +        <&pru2_1>, <&rtu2_1>, <&tx_pru2_1>;

Fix alignment. In other places as well.


> +      firmware-name = "ti-pruss/am65x-sr2-pru0-prueth-fw.elf",
> +          "ti-pruss/am65x-sr2-rtu0-prueth-fw.elf",
> +          "ti-pruss/am65x-sr2-txpru0-prueth-fw.elf",
> +          "ti-pruss/am65x-sr2-pru1-prueth-fw.elf",
> +          "ti-pruss/am65x-sr2-rtu1-prueth-fw.elf",
> +          "ti-pruss/am65x-sr2-txpru1-prueth-fw.elf";
> +

Best regards,
Krzysztof

