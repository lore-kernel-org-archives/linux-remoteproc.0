Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2BBC433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 18:04:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 449062371F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 18:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgLGSEz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 7 Dec 2020 13:04:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgLGSEy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 7 Dec 2020 13:04:54 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33749C061749
        for <linux-remoteproc@vger.kernel.org>; Mon,  7 Dec 2020 10:04:14 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id s21so10811850pfu.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Dec 2020 10:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pemtUxbnIHdy7nZLjzIFWDscWKaIJzriqu/FiVLySJ4=;
        b=XclHISPe5HvoXZsQw6QjDHa+9Wbj81p0X+sDCqlGs6Mc7gI5g20Oz31ilw9vj05Myk
         a3fxlydg+WSGUSqVNSMFXqGfzbxmby/ejXR9PR1yXAmqNSTIOxpOAd7jMZyac4v1KOLN
         vmUvS/UqHJ34DAA2XJKTtUpVODE238jhFDnTMMHSgB/ZzRTWdew/uhFy0y28f0RMqVKx
         qDvADqGyA3wuNRnzf7AAZ4QDqkNdDcXGmrQ9/Hrq0oLbUau2sE0zsZ2Bl3NBo8YMZcjj
         TMMo4KSeYkyMG/Y7TfKn4zDjVVthXeoIjEf3eCmT3N7yg2jHLKJnh6RlpmFEsxKvYRFV
         w5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pemtUxbnIHdy7nZLjzIFWDscWKaIJzriqu/FiVLySJ4=;
        b=AU4H9YPm9xLDeikHQJxH2NV5go/Zk5ih2NEjH1dfj4kAsj4QZMfGjTECNAAJT/meOk
         fA8RBHPCP3tGjpJHsLecpuW/zdHHbwLkShxEqAHhXc4pA0ne8ug9WzuV5RffpEpOPCL6
         WviDJRh3DiH2S3mH2flIz8xUFGJA8UVCSpYehk7dQjO3McxKjbf6vLYdW+cbTbVFp+La
         z9DxbtsORqgOnhTqH/6IrKy2uCRpkDQvJYrSCTHLrC+pPsSoeOTj3yCIEsDTfVbvgVV9
         sMyLj66N7z8pzF7fS1JM3chqAz6P0mh7KekHEPs6oGn1i2Vv67v/sF1x3SFwUHFsk1/2
         G21w==
X-Gm-Message-State: AOAM5339c2rs7StzngqiEGdGbuqFbo6imFEJIoWV5rsOMpYz9ML94KKB
        +Yw7cdSEfbALbS56koYqnj9u8g==
X-Google-Smtp-Source: ABdhPJw8q2W1yXRjIyR26Q5eQGfd7A6A9l48jY9e/7hxCMCVuxX7YznnHOYaj9Z5BoeT1ccb6IEN2w==
X-Received: by 2002:a62:ed01:0:b029:19a:a667:9925 with SMTP id u1-20020a62ed010000b029019aa6679925mr16579784pfh.35.1607364253583;
        Mon, 07 Dec 2020 10:04:13 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id x18sm3405080pfr.158.2020.12.07.10.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 10:04:12 -0800 (PST)
Date:   Mon, 7 Dec 2020 11:04:10 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v24 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
Message-ID: <20201207180410.GB1509079@xps15>
References: <20201130155717.26008-1-ben.levinsky@xilinx.com>
 <20201130155717.26008-5-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130155717.26008-5-ben.levinsky@xilinx.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Rob Herring is the maintainer of all the yaml files - he is the one this patch
needs to go to.  I merely look at them to understand the platform device
implementation.

On Mon, Nov 30, 2020 at 07:57:16AM -0800, Ben Levinsky wrote:
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
> v24: update for 'make dt_binding_check' errors
> ---
>  .../xilinx,zynqmp-r5-remoteproc.yaml          | 223 ++++++++++++++++++
>  1 file changed, 223 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
> new file mode 100644
> index 000000000000..bccbdee8c3f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
> @@ -0,0 +1,223 @@
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
> +  boots firmwares on the Xilinx Zynqmp and Versal family chipsets.
> +
> +  Note that the Linux has global addressing view of the R5-related memory (TCM)
> +  so the absolute address ranges are provided in TCM reg's.
> +
> +maintainers:
> +  - Ed Mooring <ed.mooring@xilinx.com>
> +  - Ben Levinsky <ben.levinsky@xilinx.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^r5fss(@.*)?"
> +
> +  compatible:
> +    enum:
> +      - xlnx,zynqmp-r5-remoteproc
> +
> +  reg:
> +    items:
> +      - description: Address and Size of Xilinx RPU Configuration register
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +# Optional properties:
> +# --------------------
> +  xlnx,cluster-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    description: |
> +      Configuration Mode for the Dual R5F cores within the R5F cluster.
> +      Should be either a value of 1 (LockStep mode) or 0 (Split mode),
> +      default is LockStep mode if omitted.
> +
> +
> +#R5F Processor Child Nodes:
> +# ==========================
> +
> +patternProperties:
> +  "^r5f_[a-f0-9]+$":
> +    type: object
> +    description: |
> +      The R5F Sub-System device node should define one or two R5F child nodes,
> +      each node representing a Xilinx instantiation of the Arm Cortex R5F core.
> +      There should be one or two child nodes if the R5F is in Split mode and
> +      one child node if the R5F is in Lockstep mode.
> +
> +      In Split mode each R5F core has two associated TCM Banks. R5_0 has
> +      TCM Banks 0A and 0B and R5_1 has TCM Banks 1A and 1B.
> +
> +      In Lockstep mode only one R5F child node should be defined. This one
> +      child has access to TCM Banks 0A, 0B, 1A and 1B and any of the four can
> +      be included in the child R5F's sram property.
> +
> +      The example below shows Split mode with two child nodes.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - xilinx,r5f
> +
> +# The following properties are mandatory for R5F Core0 in both LockStep and Split
> +# modes, and are mandatory for R5F Core1 _only_ in Split mode.
> +
> +      memory-region:
> +        description: |
> +          Phandles to the memory nodes to be associated with the

Is a word missing here?

> +          The reserved memory nodes should be carveout nodes, and
> +          should be defined with a "no-map" property as per the bindings in
> +          Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +        minItems: 1
> +        maxItems: 6
> +        items:
> +          - description: Region used for dynamic DMA allocations like vrings and
> +                         vring buffers
> +          - description: region reserved for firmware image sections
> +        additionalItems: true
> +
> +      power-domain:
> +        description: |
> +          Power node ID that is used to uniquely identify the RPU for Xilinx
> +          Power Management.
> +        maxItems: 1
> +
> +# Optional properties:
> +# --------------------
> +# The following properties are optional properties for each of the R5F cores:
> +
> +      mboxes:
> +        description: |
> +          Standard property to specify a mailbox
> +          This property is required only if the rpmsg/virtio functionality
> +          is used
> +
> +           Refer to the zynqmp-ipi-mailbox documentation for client usage of this
> +           property

Indentation problem

> +        maxItems: 1
> +
> +      mbox-names:
> +        description: |
> +          Refer to the zynqmp-ipi-mailbox documentation for client usage of this
> +          property
> +        items:
> +          - const: tx
> +          - const: rx
> +
> +      sram:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        minItems: 1
> +        maxItems: 4
> +        description: |
> +          Phandles to one or more reserved on-chip SRAM regions. The regions
> +          should be defined as child nodes of the respective SRAM node, and
> +          should be defined as per the generic bindings in,
> +          Documentation/devicetree/bindings/sram/sram.yaml
> +
> +    required:
> +      - compatible
> +      - power-domain
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - reg
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    / {
> +        compatible = "xlnx,zynqmp-zcu102-rev1.0", "xlnx,zynqmp-zcu102", "xlnx,zynqmp";
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        model = "ZynqMP ZCU102 ";
> +
> +        zynqmp_ipi1 {
> +          compatible = "xlnx,zynqmp-ipi-mailbox";
> +          interrupt-parent = <&gic>;
> +          interrupts = <0 33 4>;
> +          xlnx,ipi-id = <5>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          ipi_mailbox_rpu0: mailbox@ff990600 {
> +            reg = <0xff990600 0x20>,
> +                  <0xff990620 0x20>,
> +                  <0xff9900c0 0x20>,
> +                  <0xff9900e0 0x20>;
> +            reg-names = "local_request_region",
> +            "local_response_region",
> +            "remote_request_region",
> +            "remote_response_region";
> +            #mbox-cells = <1>;
> +            xlnx,ipi-id = <3>;
> +          };
> +          ipi_mailbox_rpu1: mailbox@ff990780 {
> +            reg = <0xff990780 0x20>,
> +                  <0xff9907a0 0x20>,
> +                  <0xff9907c0 0x20>,
> +                  <0xff9905a0 0x20>;
> +            reg-names = "local_request_region",
> +            "local_response_region",
> +            "remote_request_region",
> +            "remote_response_region";
> +            #mbox-cells = <1>;
> +            xlnx,ipi-id = <3>;
> +          };
> +        };
> +
> +        r5fss@ff9a0000 {
> +          compatible = "xlnx,zynqmp-r5-remoteproc";
> +          #address-cells = <2>;
> +          #size-cells = <2>;
> +          ranges;
> +          reg = <0x0 0xff9a0000 0x0 0x10000>;
> +          xlnx,cluster-mode = <0>;
> +
> +          r5f_0 {
> +               compatible = "xilinx,r5f";
> +               memory-region = <&elf_load0>,
> +                               <&rpu0vdev0vring0>,
> +                               <&rpu0vdev0vring1>,
> +                               <&rpu0vdev0buffer>;
> +               sram = <&tcm_0a>, <&tcm_0b>;
> +               mboxes = <&ipi_mailbox_rpu0 0x0 &ipi_mailbox_rpu0 0x1>;
> +               mbox-names = "tx", "rx";
> +               power-domain = <0x7>;
> +          };
> +          r5f_1 {
> +               compatible = "xilinx,r5f";
> +               memory-region = <&elf_load1>,
> +                               <&rpu1vdev0vring0>,
> +                               <&rpu1vdev0vring1>,
> +                               <&rpu1vdev0buffer>;
> +               sram = <&tcm_1a>, <&tcm_1b>;
> +               mboxes = <&ipi_mailbox_rpu1 0x0 &ipi_mailbox_rpu1 0x1>;
> +               mbox-names = "tx", "rx";
> +               power-domain = <0x8>;
> +          };
> +
> +        };
> +    };
> +
> +...
> -- 
> 2.17.1
> 
