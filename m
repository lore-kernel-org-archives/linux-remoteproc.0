Return-Path: <SRS0=Crw0=EE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E03C2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Thu, 29 Oct 2020 22:53:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B597B20639
	for <linux-remoteproc@archiver.kernel.org>; Thu, 29 Oct 2020 22:53:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cagqhdWw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgJ2WxI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 29 Oct 2020 18:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJ2WxH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 29 Oct 2020 18:53:07 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E895C0613D2
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Oct 2020 15:53:07 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id b3so3638218pfo.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Oct 2020 15:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zfIHsEDZ+nxAJWIcC74ZwDQW20w/aWLdxlSNkf7s2jE=;
        b=cagqhdWwP1sef7pP6jxwICaqKNSOJTFqa9K66YttEXaS4lhGvh5cmoF8LhbjIkXHud
         aB8sFiNwQQ8cUOXc5JqQPnN33zDfe54NrCUoJsnNgJ7tpH+JU8Ln5Uluo5jl4ZibkESz
         fLjgjnAHmVQaDNpYNCr9w6aAiCMNdcw9UE5FlA6JG8x39FP9PWlAHeam/ro+NSn+nb7R
         AgfjsHyMWhM03Ru1Pfpgg3g8uIJT3PzsCStUjb7MPV2SzwtDD5IzbDjFm2FptCxR5ixs
         b66i8pB+Sw4wQhZFbv4qkMoNsq2JbUAvolpu0BvETkPyvzqm3PQkmAlf87/vViVH1OTQ
         1Fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zfIHsEDZ+nxAJWIcC74ZwDQW20w/aWLdxlSNkf7s2jE=;
        b=iPSMbtDdl2hLOaM/PTl2FTGh/E5Bvr1HbGr/yUz63e0S1WWgvTIMdG4DdgNZ8dSEul
         T1HMynsk8qeB6zL+7MjyyQW1t7YROouq7UfnvaMh4cYkaed7NO/MBvtmGaIn5AX9aocW
         0JppaCfSWy9NLMqvJTHcznbTAa7QXyADYSFKSYDQJzYSrXPiZNu4QDLr3vUs5eKKXcBZ
         96NnN+EnDNAuGXATSczU2X1/Gu4n/zIFC2+UL3voeSmCCrk/tnG0dm707samiC39Vr48
         to/5JdEEHAg94iKv9yE/3WmPPspjlSDqMRY9KF/oWplIuZ2wisp56JN2Ekfgq3kLUODN
         in8A==
X-Gm-Message-State: AOAM532k1WN47yaRnbzFz0uuzHVIDvuYlNIMfXlopugqiZfLOR7axRLI
        HERISpomoXN8EFWS4KZIB/P2uQ==
X-Google-Smtp-Source: ABdhPJyld5yczo2siTwbs74G7xYlQMj/lJnXZHVPI/Nd4ogGdxgYIs/XMXKttvKb1w8MYWSqEcfLKg==
X-Received: by 2002:a62:8106:0:b029:152:1277:b5b7 with SMTP id t6-20020a6281060000b02901521277b5b7mr6795035pfd.1.1604011986893;
        Thu, 29 Oct 2020 15:53:06 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id e11sm3913915pfl.58.2020.10.29.15.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 15:53:06 -0700 (PDT)
Date:   Thu, 29 Oct 2020 16:53:04 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     sunnyliangjy@gmail.com, punit1.agrawal@toshiba.co.jp,
        stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v19 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
Message-ID: <20201029225304.GB1273972@xps15>
References: <20201019224007.16846-1-ben.levinsky@xilinx.com>
 <20201019224007.16846-5-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019224007.16846-5-ben.levinsky@xilinx.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Oct 19, 2020 at 03:40:06PM -0700, Ben Levinsky wrote:
> Add binding for ZynqMP R5 OpenAMP.
> 
> Represent the RPU domain resources in one device node. Each RPU
> processor is a subnode of the top RPU domain node.
> 
> Signed-off-by: Jason Wu <j.wu@xilinx.com>
> Signed-off-by: Wendy Liang <jliang@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> ---
> v3:
> - update zynqmp_r5 yaml parsing to not raise warnings for extra
>   information in children of R5 node. The warning "node has a unit
>   name, but no reg or ranges property" will still be raised though 
>   as this particular node is needed to describe the
>   '#address-cells' and '#size-cells' information.
> v4::
> - remove warning '/example-0/rpu@ff9a0000/r5@0: 
>   node has a unit name, but no reg or ranges property'
>   by adding reg to r5 node.
> v5:
> - update device tree sample and yaml parsing to not raise any warnings
> - description for memory-region in yaml parsing
> - compatible string in yaml parsing for TCM
> v6:
> - remove coupling TCM nodes with remoteproc 
> - remove mailbox as it is optional not needed
> v7:
> - change lockstep-mode to xlnx,cluster-mode
> v9:
> - show example IPC nodes and tcm bank nodes
> v11:
> - add property meta-memory-regions to illustrate link
>   between r5 and TCM banks
> - update so no warnings from 'make dt_binding_check'
> v14:
> - concerns were raised about the new property meta-memory-regions.
>   There is no clear direction so for the moment I kept it in the series
> - place IPC nodes in RAM in the reserved memory section
> v15:
> - change lockstep-mode prop as follows: if present, then RPU cluster is in
>   lockstep mode. if not present, cluster is in split mode.
> v17:
> - remove compatible string from tcm bank nodes
> - fix style for bindings
> - add boolean type to lockstep mode in binding
> - add/update descriptions memory-region, meta-memory-regions,
>   pnode-id, mbox* properties
> v18: 
> - update example remoteproc zynqmp r5 compat string, remove version
>   number
> - change property from memory-region to memory-regions
> ---
>  .../xilinx,zynqmp-r5-remoteproc.yaml          | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
> new file mode 100644
> index 000000000000..c202dca3b6d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Xilinx R5 remote processor controller bindings
> +
> +description:
> +  This document defines the binding for the remoteproc component that loads and
> +  boots firmwares on the Xilinx Zynqmp and Versal family chipset.
> +
> +  Note that the Linux has global addressing view of the R5-related memory (TCM)
> +  so the absolute address ranges are provided in TCM reg's.
> +
> +maintainers:
> +  - Ed Mooring <ed.mooring@xilinx.com>
> +  - Ben Levinsky <ben.levinsky@xilinx.com>
> +
> +properties:
> +  compatible:
> +    const: xlnx,zynqmp-r5-remoteproc
> +
> +  lockstep-mode:
> +    description:
> +      If this property is present, then the configuration is lock-step.
> +      Otherwise RPU is split.
> +    type: boolean
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      Interrupt mapping for remoteproc IPI. It is required if the
> +      user uses the remoteproc driver with the RPMsg kernel driver.
> +    maxItems: 6
> +
> +  memory-regions:
> +    description:
> +      collection of memory carveouts used for elf-loading and inter-processor

For each of the above the first line of the description had a capital letter
while this one (and the one below) don't.

> +      communication. each carveout in this case should be in DDR, not

Again this is abnormal - please fix everywhere.

> +      chip-specific memory. In Xilinx case, this is TCM, OCM, BRAM, etc.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +  meta-memory-regions:
> +    description:
> +      collection of memories that are not present in the top level memory
> +      nodes' mapping. For example, R5s' TCM banks. These banks are needed
> +      for R5 firmware meta data such as the R5 firmware's heap and stack.
> +      To be more precise, this is on-chip reserved SRAM regions, e.g. TCM,
> +      BRAM, OCM, etc.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +  pnode-id:
> +    maxItems: 1
> +    description:
> +      power node id that is used to uniquely identify the node for Xilinx
> +      Power Management. The value is then passed to Xilinx platform
> +      manager for power on/off and access.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  mboxes:
> +    description:
> +      array of phandles that describe the rx and tx for xilinx zynqmp
> +      mailbox driver. order of rx and tx is described by the mbox-names
> +      property. This will be used for communication with remote
> +      processor.
> +    maxItems: 2
> +
> +  mbox-names:
> +    description:
> +      array of strings that denote which item in the mboxes property array
> +      are the rx and tx for xilinx zynqmp mailbox driver
> +    maxItems: 2
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +
> +
> +examples:
> +  - |
> +     reserved-memory {
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +          ranges;
> +          elf_load: rproc@3ed000000 {
> +               no-map;
> +               reg = <0x3ed00000 0x40000>;
> +          };
> +
> +          rpu0vdev0vring0: rpu0vdev0vring0@3ed40000 {
> +               no-map;
> +               reg = <0x3ed40000 0x4000>;
> +          };
> +          rpu0vdev0vring1: rpu0vdev0vring1@3ed44000 {
> +               no-map;
> +               reg = <0x3ed44000 0x4000>;
> +          };
> +          rpu0vdev0buffer: rpu0vdev0buffer@3ed48000 {
> +               no-map;
> +               reg = <0x3ed48000 0x100000>;
> +          };
> +
> +     };
> +
> +     /*
> +      * Below nodes are required if using TCM to load R5 firmware
> +      * if not, then either do not provide nodes are label as disabled in

s/are/or

> +      * status property
> +      */
> +     tcm0a: tcm_0a@ffe00000 {
> +         reg = <0xffe00000 0x10000>;
> +         pnode-id = <0xf>;
> +         no-map;
> +         status = "okay";
> +         phandle = <0x40>;
> +     };
> +     tcm0b: tcm_1a@ffe20000 {
> +         reg = <0xffe20000 0x10000>;
> +         pnode-id = <0x10>;
> +         no-map;
> +         status = "okay";
> +         phandle = <0x41>;
> +     };
> +
> +     rpu {
> +          compatible = "xlnx,zynqmp-r5-remoteproc";
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +          ranges;
> +          lockstep-mode;
> +          r5_0 {
> +               ranges;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               memory-regions = <&elf_load>,
> +                               <&rpu0vdev0vring0>,
> +                               <&rpu0vdev0vring1>,
> +                               <&rpu0vdev0buffer>;
> +               meta-memory-regions = <&tcm_0a>, <&tcm_0b>;
> +               pnode-id = <0x7>;
> +          };
> +     };
> +
> +...
> -- 
> 2.17.1
> 
