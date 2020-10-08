Return-Path: <SRS0=dp89=DP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623B6C43467
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Oct 2020 12:37:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F02F6217BA
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Oct 2020 12:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i7gYIYyu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729829AbgJHMh3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 8 Oct 2020 08:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729807AbgJHMh3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Oct 2020 08:37:29 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE83C0613D3
        for <linux-remoteproc@vger.kernel.org>; Thu,  8 Oct 2020 05:37:28 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id p15so5543896ljj.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Oct 2020 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JV0JTqeznufs6Lca8I5W/rgwI4Aj9l9UXOO8/m8VgzQ=;
        b=i7gYIYyuRdlxNVuz9vcXkV/Faf0L0KBdU5GK3wDfAtUNYmTZO9btIgKr4RTie1oJR6
         eabKiu2D1SeoAbNZQXmv8uGq/Lq7oUahLzsMPAUmnbF2QIkGWxAWhBm/RGJuavYD4gZF
         LykLQSkiBf7hlFrdjd4n3vC4SvjXyrN3v/RCU6JhTPsWQK8GugPqEPEiwV5+fn8R+yZg
         S0IncXNb0YKS/I+mHW3huwkj/dpKwaEj6JvKbhmZM7DkYU8HhU17PErUYQvilfrr5gIp
         lxTCdPsz6u0mYN4exaLYk3WV223onu6dzZLw6roKZHDFJr9eLE6fgYLTW8x+UrDaptzN
         2/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JV0JTqeznufs6Lca8I5W/rgwI4Aj9l9UXOO8/m8VgzQ=;
        b=ACU69wuw4vhylYuat/7CrvvQou5TL9jXNDh8/CljfuN1DE7YydZxoY6cqTpW7b41lO
         10XhQNqjXcUGX7EOq32AHK7JDQ9JzqRHPWzse9GcbxDNa+fvcR0d5s4thJQt2fgakEfO
         xdw/nDYCuWjHCVtINWcuI512NmMn1jog+G+UqSjBpAn8qBCSCh3JLQ6+6FEH9bESkJXG
         qqWf+Kf+sTsI+hQpfFp6hGxDJ+nvbRnm4N7qrGJiMhrDppLai3sh0G0J3c2AViqD/t8q
         sKBSfwwah4kS6nyOrt/YKhfD62ki3mroFx3TxfZ2/Ig+8/CtCTVW9XYI2PUhbs452gx6
         ddSA==
X-Gm-Message-State: AOAM533Hu+FEqEMy8hBRIXv3McT8IwzQ6BcsR1F1NZOMq1DoiqxOpvtp
        btdGCJtAG3uglq/77U2yswTdqSCqS5ss2JJ+CfmlvQ==
X-Google-Smtp-Source: ABdhPJz3YUsYWniThIU2Vaw6C0IjjNUAjrxB49uXHpts1m5Cv34LreV1JkBiWhogxLov5d903ZJmZZg+Xzny/FL0+AE=
X-Received: by 2002:a2e:a549:: with SMTP id e9mr614746ljn.293.1602160646098;
 Thu, 08 Oct 2020 05:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201005160614.3749-1-ben.levinsky@xilinx.com> <20201005160614.3749-5-ben.levinsky@xilinx.com>
In-Reply-To: <20201005160614.3749-5-ben.levinsky@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Oct 2020 14:37:14 +0200
Message-ID: <CACRpkdb1x=U28VWZGDJh6gJSzaqeNxx0m+WtnUQZJKGvXjvXYQ@mail.gmail.com>
Subject: Re: [PATCH v18 4/5] dt-bindings: remoteproc: Add documentation for
 ZynqMP R5 rproc bindings
To:     Ben Levinsky <ben.levinsky@xilinx.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     ed.mooring@xilinx.com, sunnyliangjy@gmail.com,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Ben,

thanks for your patch! I noticed this today  and pay some interest
because in the past I used with implementing the support for
TCM memory on ARM32.

On Mon, Oct 5, 2020 at 6:06 PM Ben Levinsky <ben.levinsky@xilinx.com> wrote:

> Add binding for ZynqMP R5 OpenAMP.
>
> Represent the RPU domain resources in one device node. Each RPU
> processor is a subnode of the top RPU domain node.
>
> Signed-off-by: Jason Wu <j.wu@xilinx.com>
> Signed-off-by: Wendy Liang <jliang@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
(...)

> +title: Xilinx R5 remote processor controller bindings
> +
> +description:
> +  This document defines the binding for the remoteproc component that loads and
> +  boots firmwares on the Xilinx Zynqmp and Versal family chipset.

... firmwares for the on-board Cortex R5 of the Zynqmp .. (etc)

> +
> +  Note that the Linux has global addressing view of the R5-related memory (TCM)
> +  so the absolute address ranges are provided in TCM reg's.

Please do not refer to Linux in bindings, they are also for other
operating systems.

Isn't that spelled out "Tightly Coupled Memory" (please expand the acronym).

I had a hard time to parse this description, do you mean:

"The Tightly Coupled Memory (an on-chip SRAM) used by the Cortex R5
is double-ported and visible in both the physical memory space of the
Cortex A5 and the memory space of the main ZynqMP processor
cluster. This is visible in the address space of the ZynqMP processor
at the address indicated here."

That would make sense, but please confirm/update.

> +  memory-region:
> +    description:
> +      collection of memory carveouts used for elf-loading and inter-processor
> +      communication. each carveout in this case should be in DDR, not
> +      chip-specific memory. In Xilinx case, this is TCM, OCM, BRAM, etc.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

This is nice, you're reusing the infrastructure we already
have for these carveouts, good design!

> +  meta-memory-regions:
> +    description:
> +      collection of memories that are not present in the top level memory
> +      nodes' mapping. For example, R5s' TCM banks. These banks are needed
> +      for R5 firmware meta data such as the R5 firmware's heap and stack.
> +      To be more precise, this is on-chip reserved SRAM regions, e.g. TCM,
> +      BRAM, OCM, etc.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Is this in the memory space of the main CPU cluster?

It sure looks like that.

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
> +     };
> +     tcm0b: tcm_1a@ffe20000 {
> +         reg = <0xffe20000 0x10000>;
> +         pnode-id = <0x10>;
> +         no-map;
> +         status = "okay";
> +         phandle = <0x41>;
> +     };

All right so this looks suspicious to me. Please explain
what we are seeing in those reg entries? Is this the address
seen by the main CPU cluster?

Does it mean that the main CPU see the memory of the
R5 as "some kind of TCM" and that TCM is physically
mapped at 0xffe00000 (ITCM) and 0xffe20000 (DTCM)?

If the first is ITCM and the second DTCM that is pretty
important to point out, since this reflects the harvard
architecture properties of these two memory areas.

The phandle = thing I do not understand at all, but
maybe there is generic documentation for it that
I've missed?

Last time I checked (which was on the ARM32) the physical
address of the ITCM and DTCM could be changed at
runtime with CP15 instructions. I might be wrong
about this, but if that (or something similar) is still the case
you can't just say hardcode these addresses here, the
CPU can move that physical address somewhere else.
See the code in
arch/arm/kernel/tcm.c

It appears the ARM64 Linux kernel does not have any
TCM handling today, but that could change.

So is this just regular ARM TCM memory (as seen by
the main ARM64 cluster)?

If this is the case, you should probably add back the
compatible string, add a separate device tree binding
for TCM memories along the lines of
compatible = "arm,itcm";
compatible = "arm,dtcm";
The reg address should then ideally be interpreted by
the ARM64 kernel and assigned to the I/DTCM.

I'm paging Catalin on this because I do not know if
ARM64 really has [I|D]TCM or if this is some invention
of Xilinx's.

Yours,
Linus Walleij
