Return-Path: <SRS0=9bPA=DG=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81010C47420
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Sep 2020 18:36:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 282E12074A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Sep 2020 18:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601404571;
	bh=lEvcncYDQNyqcIIjkusub4pyWEbJRVYD0/iQIqmlg64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=AR071sZsNsStLHyF9k1rmZMauEIoVs8p42U3dcq6eRUyqO9C+5Q8BIlwAdJhVK4Vz
	 Nh3/DNFMfFGG9TsyEaWwulWGWMPYuIfYGy5K4R+AQc5eL9MuIawpFRqzq/CiHig0th
	 SEsR0xMbQUR8SJr0OoHNRtGNKqBUNYPde2WIabqM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgI2SgK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Sep 2020 14:36:10 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38316 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728341AbgI2SgE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Sep 2020 14:36:04 -0400
Received: by mail-ot1-f67.google.com with SMTP id y5so5445778otg.5;
        Tue, 29 Sep 2020 11:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IlSkqdphqKTO009g0fq1K14KI/lnuHp40ufCtsxgDoU=;
        b=JndPTrOOPa/1hVoV+UGDNM5fl7hChYCQRVjD6lMG9ykFDaIgu5kbO/DkPKFe2tPx7k
         CR5zIo/Dp5dkEMiiRzILugI/+CiPch73ZZ5Wqji8/mp/y6vq0tfMWRrUhrOhhWW4i1Dp
         VjrRAXVkwswvJ/pqjtCR52BLeq1YrBlGol2eMi5X78j+ZOOmEKOU/k6kFsE/G+4YJ2je
         ol9RO9aUjoDbFbQJq3DxehzjK4gOn54YC7d7cljuSbZwYfMRM+5pCD03fymRYaUCToIx
         48YR83yBHeSOkLdg6XgDN188p6X0j56hY6fs3oZoX3psadxKw4CxvSO8Bi+Id4ZU5q/e
         92eg==
X-Gm-Message-State: AOAM531fzI3tTkujYZayMSpxUM3rloGoGjNQ2lexD+2gmWg3p+cNzvoM
        SXzRW4WrNuE5kWMqarEzyQ==
X-Google-Smtp-Source: ABdhPJwCAWMgESySEtLvlkXxZ5yrYSY7bUzq09eQIT1AyxZwXp1XoWNRQ5Gm5RAiEdzvVCRYVIv+IQ==
X-Received: by 2002:a9d:77d3:: with SMTP id w19mr3789573otl.44.1601404563208;
        Tue, 29 Sep 2020 11:36:03 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i205sm1172128oih.23.2020.09.29.11.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 11:36:02 -0700 (PDT)
Received: (nullmailer pid 926876 invoked by uid 1000);
        Tue, 29 Sep 2020 18:36:01 -0000
Date:   Tue, 29 Sep 2020 13:36:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com,
        devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jason Wu <j.wu@xilinx.com>, Wendy Liang <jliang@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v16 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
Message-ID: <20200929183601.GA892636@bogus>
References: <20200922223930.4710-1-ben.levinsky@xilinx.com>
 <20200922223930.4710-5-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922223930.4710-5-ben.levinsky@xilinx.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Sep 22, 2020 at 03:39:29PM -0700, Ben Levinsky wrote:
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
> ---
>  .../xilinx,zynqmp-r5-remoteproc.yaml          | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
> new file mode 100644
> index 000000000000..ce02e425692e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
> @@ -0,0 +1,120 @@
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

blank line needed.

TCMs specifically I'm concerned about how they are represented in system 
DT and here...

> +maintainers:
> +  - Ed Mooring <ed.mooring@xilinx.com>
> +  - Ben Levinsky <ben.levinsky@xilinx.com>
> +
> +properties:
> +  compatible:
> +    const: "xlnx,zynqmp-r5-remoteproc-1.0"

Don't need quotes.

The use of version numbers was allowed for Xilinx programmable IP. I 
don't think this falls into that category.

> +
> +  lockstep-mode:
> +    description:
> +      If this property is present, then the configuration is lock-step.

boolean...

> +      Otherwise RPU is split.
> +    maxItems: 1

...or an array?

Either way, doesn't work for TI R5.

> +
> +  interrupts:
> +    description:
> +      Interrupt mapping for remoteproc IPI. It is required if the
> +      user uses the remoteproc driver with the RPMsg kernel driver.
> +    maxItems: 6
> +
> +  memory-region:
> +    description:
> +      collection of memory carveouts used for elf-loading and inter-processor
> +      communication.
> +    maxItems: 4
> +    minItems: 4

Need to define what each region is.

One blank line between properties.

> +  meta-memory-regions:
> +    description:
> +      collection of memories that are not present in the top level memory
> +      nodes' mapping. For example, R5s' TCM banks. These banks are needed
> +      for R5 firmware meta data such as the R5 firmware's heap and stack

Humm, needs a better explanation.

> +  pnode-id:
> +    maxItems: 1

What's this?

> +  mboxes:
> +    maxItems: 2

Need to define what each one is.

> +  mbox-names:
> +    maxItems: 2

Need to define the names.

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
> +      * status property
> +      */
> +     tcm0a: tcm_0a@ffe00000 {
> +         reg = <0xffe00000 0x10000>;
> +         pnode-id = <0xf>;
> +         no-map;
> +         status = "okay";
> +         phandle = <0x40>;
> +         compatible = "xlnx,tcm";

TCM is a Xilinx specific thing?

> +     };
> +     tcm0b: tcm_1a@ffe20000 {
> +         reg = <0xffe20000 0x10000>;
> +         pnode-id = <0x10>;
> +         no-map;
> +         status = "okay";
> +         compatible = "xlnx,tcm";
> +         phandle = <0x41>;
> +     };
> +
> +     rpu {
> +          compatible = "xlnx,zynqmp-r5-remoteproc-1.0";
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +          ranges;
> +          lockstep-mode;
> +          r5_0 {
> +               ranges;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               memory-region = <&elf_load>,
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
