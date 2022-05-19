Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E07C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 May 2022 10:19:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236655AbiESKTZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 May 2022 06:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236609AbiESKTR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 May 2022 06:19:17 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30966A5ABB
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 03:19:16 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id p26so6413595eds.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 03:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rQZDF0ST+m3bjXxhfgKrKul8Pa3ypLxrdFU2KUJN6Wo=;
        b=yulejd8gCAcfcCJ6Hbz4UE8pg5QLnb0fCWsWWDGcCpZEpalnvHluHjDTMZwcUqEvBS
         TI1P7Eeo1L0VCdNbVplivDDT9YvH3KKapVz0QSM1jyBdfiESxEjiQstdwStrjVgcJZJ6
         J8DQD+pHP+InweqD5x6O7wh4QBqZN1xSGdDl9Ga1NsZPoSHHIB/6hb2Mzu2ddIDy/sgd
         wKmI25hsNlrcSz+C43HCmX0vIbFJqymCTcCdfA9j0SBuBc6a2Qj1QntZeO9u+M/9yx+I
         ATGXd4ebtIyF8nektWoOXEDUzVs0I+Z4eYU0SRVjZJs4A9g5dcczKHkbezctiENN1R+8
         IYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rQZDF0ST+m3bjXxhfgKrKul8Pa3ypLxrdFU2KUJN6Wo=;
        b=P8kdqpcD4nYwFj/1BUN9N7fxit8bnmgxMc+AmF1YGLB3zpjAd+wmVa/gQuepQwxpaB
         SaqFKfcnkyxmMxefB1KHIpPZ2xAx0YWiJJlVFkYOOcBNF+OGBRW9SODNCC2pyj04Iey5
         g5OXPtx/aMC2M+ydXwnRoetf4tanMxnKZp6mDPO6I+twp0P5Hu5ZzsabJArKNlROhQ08
         KQdjhTTNZVm9UeZfz2DFuIgD7eNSuGZJ6BebtuKMiTdR4Xlu8qMMcKqIRI6o28ZU5IGE
         9HLDpFRz3F8efZhs0o99bo/7kGjMDQBU7qFlA2Z0A4dmjG9LS+XalG12O/Jl1rwd5rdj
         iFig==
X-Gm-Message-State: AOAM530JiH81XB2Pa0LRhxgP6uGB7HE9bEbVv02dLy6aAR2tkc+tIrH5
        tVGPTOpzV6cZDKulyjRjEBlHxZr1KavHZK2FtI6gxA==
X-Google-Smtp-Source: ABdhPJxJRotEBuFNPsVGhczRDFHSLngF16rHucpJb9tpSyucqiOctuqwe+PayGCiBANvsl1m3CDpzIzQ37sdH0gPy2I=
X-Received: by 2002:aa7:cb1a:0:b0:41c:dd9c:2eaa with SMTP id
 s26-20020aa7cb1a000000b0041cdd9c2eaamr4404541edt.119.1652955554524; Thu, 19
 May 2022 03:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220518194426.3784095-1-tanmay.shah@xilinx.com>
In-Reply-To: <20220518194426.3784095-1-tanmay.shah@xilinx.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 19 May 2022 11:19:03 +0100
Message-ID: <CANLsYkw9HuLso9bGL4fM7C9qH+basgKA9yKFwms4WB4OUHqymQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add Xilinx RPU subsystem support
To:     Tanmay Shah <tanmay.shah@xilinx.com>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        michal.simek@xilinx.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Tanmay,

I have replaced the previous version of this set with this one in my
queue.  That way you don't go back to the bottom.

Thanks,
Mathieu.

On Wed, 18 May 2022 at 20:46, Tanmay Shah <tanmay.shah@xilinx.com> wrote:
>
> This patch series adds bindings document for RPU subsystem found on Xilinx
> ZynqMP platforms. It also adds device nodes and driver to enable RPU
> subsystem in split mode and lockstep mode.
>
> Xilinx ZynqMP platform contains Remote Processing Unit(RPU). RPU subsystem
> contains two arm cortex r5f cores. RPU subsystem can be configured in
> split mode, lockstep mode and single-cpu mode.
>
> RPU subsystem also contains 4 Tightly Coupled Memory(TCM) banks.
> In lockstep mode, all 4 banks are combined and total of 256KB memory is
> made available to r5 core0. In split mode, both cores can access two
> TCM banks i.e. 128 KB.
>
> RPU can also fetch data and execute instructions from DDR memory along with
> TCM memory.
> ---
>
> Changes in v5:
>   - Add constraints of the possible values of xlnx,cluster-mode property
>   - fix description of power-domains property for r5 core
>   - Remove reg, address-cells and size-cells properties as it is not required
>   - Fix description of mboxes property
>   - Add description of each memory-region and remove old .txt binding link
>     reference in the description
>   - Remove optional reg property from r5fss node
>   - Move r5fss node out of axi node
>
> Changes in v4:
>   - Add memory-region, mboxes and mbox-names properties in dt-bindings example
>   - Add reserved memory region node and use it in Xilinx dt RPU subsystem node
>   - Remove redundant header files
>   - use dev_err_probe() to report errors during probe
>   - Fix missing check on error code returned by zynqmp_r5_add_rproc_core()
>   - Fix memory leaks all over the driver when resource allocation fails for any core
>   - make cluster mode check only at one place
>   - remove redundant initialization of variable
>   - remove redundant use of of_node_put()
>   - Fix Comment format problem
>   - Assign offset of zynqmp_tcm_banks instead of duplicating it
>   - Add tcm and memory regions rproc carveouts during prepare instead of parse_fw
>   - Remove rproc_mem_entry object from r5_core
>   - Use put_device() and rproc_del() APIs to fix memory leaks
>   - Replace pr_* with dev_*. This was missed in v3, fix now.
>   - Use "GPL" instead of "GPL v2" in MODULE_LICENSE macro. This was reported by checkpatch script.
>
> Changes in v3:
>   - Fix checkpatch script indentation warning
>   - Remove unused variable from xilinx remoteproc driver
>   - use C style comments, i.e /*...*/
>   - Remove redundant debug information which can be derived using /proc/device-tree
>   - Fix multiline comment format
>   - s/"final fot TCM"/"final for TCM"
>   - Function devm_kzalloc() does not return an code on error, just NULL.
>     Remove redundant error check for this function throughout the driver.
>   - Fix RPU mode configuration and add documentation accordingly
>   - Get rid of the indentations to match function documentation style with rest of the driver
>   - Fix memory leak by only using r5_rproc->priv and not replace it with new instance
>   - Use 'i' for the outer loop and 'j' for the inner one as per convention
>   - Remove redundant error and NULL checks throughout the driver
>   - Use devm_kcalloc() when more than one element is required
>   - Add memory-regions carveouts during driver probe instead of parse_fw call
>     This removes redundant copy of reserved_mem object in r5_core structure.
>   - Fix memory leak by using of_node_put()
>   - Fix indentation of tcm_mem_map function args
>   - Remove redundant init of variables
>   - Initialize tcm bank size variable for lockstep mode
>   - Replace u32 with phys_addr_t for variable stroing memory bank address
>   - Add documentation of TCM behavior in lockstep mode
>   - Use dev_get_drvdata instead of platform driver API
>   - Remove info level messages
>   - Fix checkpatch.pl warnings
>   - Add documentation for the Xilinx r5f platform to understand driver design
>
> Changes in v2:
>   - Remove proprietary copyright footer from cover letter
>
>
> Ben Levinsky (3):
>   firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
>     configuration.
>   firmware: xilinx: Add shutdown/wakeup APIs
>   firmware: xilinx: Add RPU configuration APIs
>
> Tanmay Shah (3):
>   dt-bindings: remoteproc: Add Xilinx RPU subsystem bindings
>   arm64: dts: xilinx: zynqmp: Add RPU subsystem device node
>   drivers: remoteproc: Add Xilinx r5 remoteproc driver
>
>  .../bindings/remoteproc/xlnx,r5f-rproc.yaml   |  128 ++
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |   33 +
>  drivers/firmware/xilinx/zynqmp.c              |   97 ++
>  drivers/remoteproc/Kconfig                    |   12 +
>  drivers/remoteproc/Makefile                   |    1 +
>  drivers/remoteproc/xlnx_r5_remoteproc.c       | 1045 +++++++++++++++++
>  include/dt-bindings/power/xlnx-zynqmp-power.h |    6 +
>  include/linux/firmware/xlnx-zynqmp.h          |   60 +
>  8 files changed, 1382 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/xlnx,r5f-rproc.yaml
>  create mode 100644 drivers/remoteproc/xlnx_r5_remoteproc.c
>
>
> base-commit: 01a1a0c8d456b11f2f6b9b822414481beaa44d6f
> --
> 2.25.1
>
