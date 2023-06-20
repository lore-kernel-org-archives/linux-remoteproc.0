Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA334EB64DC
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Jun 2023 17:03:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbjFTRD5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Jun 2023 13:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjFTRD4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Jun 2023 13:03:56 -0400
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5C210D0;
        Tue, 20 Jun 2023 10:03:55 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-77e35128efdso106107539f.1;
        Tue, 20 Jun 2023 10:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687280634; x=1689872634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCxVkIs3pUGBG0JtGXoEayTlvQd9BiV5q7V3iQO4g6s=;
        b=RpMLVqb7uBVBNEryAhraSXhbNg1zgPj5DxDtsmh3C0YaUqGpFMc1DXgDqNGC/VXxFZ
         Xdc7QoYLI/tr305FgSuY19OMsjwODIkNQObTDQNIxfjSnVLvZv5IcWfShMFMDA2vRYGu
         VOOKLR/RBkNe5cxs+HPzikd3/MrFCsATkZV6Z6hcizSq1Q4GOuYAU18D2jkI7Ag6SxXC
         W98F1AT2/I3YuYZE5n2lGr8RnH4c47SAcJDwEtYRLWhIaP+sVPlpMPt1B9UPo1SfY+tH
         vpaZ0aVR5CoDAKd7eiyArCBxic7tujTJy0NBT02oZCSTW34QqtVZAQQaYBzhTS4RD8uF
         q2kw==
X-Gm-Message-State: AC+VfDwwsqFFujwnUB/fRpOIQ2/Bp3aO8PysDjddTvVHCpDb6tO3HKw9
        nV9jQ4JmXe+Mmn5oAqBPHcjELoxBSA==
X-Google-Smtp-Source: ACHHUZ4es3Xqrn8GhEVk3UEKhL4IF8fsqsNITMRianUevVLqC4oKI3MpQ9s+qp6ckJXM7LEiHikbYQ==
X-Received: by 2002:a92:d78d:0:b0:33b:2ea9:9f8e with SMTP id d13-20020a92d78d000000b0033b2ea99f8emr4089408iln.12.1687280634282;
        Tue, 20 Jun 2023 10:03:54 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id o12-20020a92d38c000000b00340b48d5347sm691159ilo.77.2023.06.20.10.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 10:03:53 -0700 (PDT)
Received: (nullmailer pid 3827476 invoked by uid 1000);
        Tue, 20 Jun 2023 17:03:51 -0000
Date:   Tue, 20 Jun 2023 11:03:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc:     andersson@kernel.org, mathieu.poirier@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        michal.simek@amd.com, ben.levinsky@amd.com, tanmay.shah@amd.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@amd.com
Subject: Re: [PATCH] dt-bindings: remoteproc: add Tightly Coupled Memory
 (TCM) bindings
Message-ID: <20230620170351.GA3815971-robh@kernel.org>
References: <1686918865-2330677-1-git-send-email-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1686918865-2330677-1-git-send-email-radhey.shyam.pandey@amd.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 16, 2023 at 06:04:25PM +0530, Radhey Shyam Pandey wrote:
> Introduce bindings for TCM memory address space on AMD-xilinx Zynq
> UltraScale+ platform. As of now TCM addresses are hardcoded in xilinx
> remoteproc driver. This binding will help in defining TCM in device-tree
> and make it's access platform agnostic and data-driven from the driver.
> 
> Tightly-coupled memories(TCMs) are low-latency memory that provides
> predictable instruction execution and predictable data load/store
> timing. Each Cortex-R5F processor contains two 64-bit wide 64 KB memory
> banks on the ATCM and BTCM ports, for a total of 128 KB of memory.
> 
> In split mode, TCM resources(reg, ranges and power-domain) are documented
> in each R5 node and in lockstep mode TCM resources are documented in any
> of the R5 node.
> 
> It also extends the examples for TCM split and lockstep modes.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> The inspiration for integrating TCM nodes in R5 nodes is taken from
> "5ee79c2ed5bd dt-bindings: remoteproc: Add bindings for R5F subsystem
> on TI K3 SoCs".Once the binding is reviewed/accepted will send out
> driver changes in follow-up series.
> ---
>  .../remoteproc/xlnx,zynqmp-r5fss.yaml         | 86 +++++++++++++++++--
>  1 file changed, 81 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> index 9f677367dd9f..0bc3a8bb8374 100644
> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> @@ -20,6 +20,12 @@ properties:
>    compatible:
>      const: xlnx,zynqmp-r5fss
>  
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1

If these are translatable addresses, then you are missing 'ranges'.

> +
>    xlnx,cluster-mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 1, 2]
> @@ -37,7 +43,7 @@ properties:
>        2: single cpu mode
>  
>  patternProperties:
> -  "^r5f-[a-f0-9]+$":
> +  "^r5f(.*)+$":

That's just '^r5f'. If adding a unit-address is what you want then make 
the regex define that: "^r5f(@[0-9a-f]+|-[a-f0-9]+)$"

>      type: object
>      description: |
>        The RPU is located in the Low Power Domain of the Processor Subsystem.
> @@ -54,8 +60,27 @@ patternProperties:
>        compatible:
>          const: xlnx,zynqmp-r5f
>  
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 1

These (and ranges) apply to child nodes, but you don't have any at this 
level.

> +
> +      reg:
> +        items:
> +          - description: Address and Size of the ATCM internal memory region
> +          - description: Address and Size of the BTCM internal memory region
> +
> +      reg-names:
> +        items:
> +          - const: atcm
> +          - const: btcm
> +
> +      ranges: true
> +
>        power-domains:
> -        maxItems: 1
> +        minItems: 1
> +        maxItems: 3
>  
>        mboxes:
>          minItems: 1
> @@ -112,13 +137,64 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/power/xlnx-zynqmp-power.h>
> +
> +    //Split mode configuration
> +    remoteproc {
> +        compatible = "xlnx,zynqmp-r5fss";
> +        xlnx,cluster-mode = <0>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        r5f_0: r5f@ffe00000 {
> +            compatible = "xlnx,zynqmp-r5f";
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            reg = <0xffe00000 0x10000>, <0xffe20000 0x10000>;
> +            reg-names = "atcm", "btcm";
> +            ranges = <0x0 0xffe00000 0x10000>, <0x20000 0xffe20000 0x10000>;
> +            power-domains = <&zynqmp_firmware PD_RPU_0>,
> +                            <&zynqmp_firmware PD_R5_0_ATCM>,
> +                            <&zynqmp_firmware PD_R5_0_BTCM>;
> +            memory-region = <&rproc_0_fw_image>, <&rpu0vdev0buffer>, <&rpu0vdev0vring0>, <&rpu0vdev0vring1>;
> +            mboxes = <&ipi_mailbox_rpu0 0>, <&ipi_mailbox_rpu0 1>;
> +            mbox-names = "tx", "rx";
> +        };
> +
> +        r5f_1: r5f@ffe90000 {
> +            compatible = "xlnx,zynqmp-r5f";
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            reg = <0xffe90000 0x10000>, <0xffeb0000 0x10000>;
> +            reg-names = "atcm", "btcm";
> +            ranges = <0x0 0xffe90000 0x10000>, <0x20000 0xffeb0000 0x10000>;
> +            power-domains = <&zynqmp_firmware PD_RPU_1>,
> +                            <&zynqmp_firmware PD_R5_1_ATCM>,
> +                            <&zynqmp_firmware PD_R5_1_BTCM>;
> +            memory-region = <&rproc_1_fw_image>, <&rpu1vdev0buffer>, <&rpu1vdev0vring0>, <&rpu1vdev0vring1>;
> +            mboxes = <&ipi_mailbox_rpu1 0>, <&ipi_mailbox_rpu1 1>;
> +            mbox-names = "tx", "rx";
> +        };
> +    };
> +
> +  - |
> +    //Lockstep configuration
>      remoteproc {
>          compatible = "xlnx,zynqmp-r5fss";
>          xlnx,cluster-mode = <1>;
>  
> -        r5f-0 {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        r5f_00: r5f@ffe00000 {
>              compatible = "xlnx,zynqmp-r5f";
> -            power-domains = <&zynqmp_firmware 0x7>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            reg = <0xffe00000 0x20000>, <0xffe20000 0x20000>;
> +            reg-names = "atcm", "btcm";
> +            ranges = <0x0 0xffe00000 0x20000>, <0x20000 0xffe20000 0x20000>;
> +            power-domains = <&zynqmp_firmware PD_RPU_0>,
> +                            <&zynqmp_firmware PD_R5_0_ATCM>,
> +                            <&zynqmp_firmware PD_R5_0_BTCM>;
>              memory-region = <&rproc_0_fw_image>, <&rpu0vdev0buffer>, <&rpu0vdev0vring0>, <&rpu0vdev0vring1>;
>              mboxes = <&ipi_mailbox_rpu0 0>, <&ipi_mailbox_rpu0 1>;
>              mbox-names = "tx", "rx";
> @@ -126,7 +202,7 @@ examples:
>  
>          r5f-1 {
>              compatible = "xlnx,zynqmp-r5f";
> -            power-domains = <&zynqmp_firmware 0x8>;
> +            power-domains = <&zynqmp_firmware PD_RPU_1>;
>              memory-region = <&rproc_1_fw_image>, <&rpu1vdev0buffer>, <&rpu1vdev0vring0>, <&rpu1vdev0vring1>;
>              mboxes = <&ipi_mailbox_rpu1 0>, <&ipi_mailbox_rpu1 1>;
>              mbox-names = "tx", "rx";
> -- 
> 2.25.1
> 
