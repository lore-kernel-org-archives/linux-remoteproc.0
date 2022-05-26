Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59E4C433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 May 2022 17:56:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233574AbiEZR42 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 26 May 2022 13:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348481AbiEZR4W (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 May 2022 13:56:22 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CA3E2752
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 May 2022 10:56:04 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id fd25so2709345edb.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 May 2022 10:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0wemacEpvRnNbjYzbAUaSfcRIvJpzHDpFPLzYRVvuYA=;
        b=do/n+rf16PaaTppQfhtpvIsAWSp2gjDki7cCQkybLSFXOREw5Drhp3nRRkKGWpHcF2
         MOCov53k7+IFBt17Jeo0BsarZci4VVdnxXFFHwLOqaK1KshnqntllFw3oaiTvo7+F69p
         SgXFVGthNPzcL6MrMvv2WKPqSKGA9STmq4ARjHbF0bG9J30U4v1ABXrA5nk72PHGgVGm
         X7le6/oArssNWYQ+NHekh/q3W7evSWvMrer8O+502DgZ8N+XLNvE3/yNfHkxF9UyMU1Z
         fa35vtvjbeF12VFPxvyvqEhAV2EZTVkGLK+xKyCZsr91zjSsgkHO6e3DlMH1elPMI7za
         dvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0wemacEpvRnNbjYzbAUaSfcRIvJpzHDpFPLzYRVvuYA=;
        b=Cb+Qh84ISUwC4bcf/b7scGMOFjPEXokxJanBEc+k9LcBFlHXKHhcQSh1EX2KjX3Ay0
         e75EaLlBS/KelA6fy2/IvZJ+0HM6mECOsBDDBmmcjbzgIufoMb6VZVgcbjrZSyVMH8Kw
         Ixb+P7xgtK1rhZ/Hmlm/JA0WK8mRUlhfEvkTYHmTaLQfWb6bf5/X+EdNUHU3MydRnO37
         x4jqLa6vRIL/SEs02KTH63vUukOEC9SGylrXYkxAhimQsXJQ9kT/XaBsYgB87T2O38r+
         axzSMNwXvCnaW5D9D0KHC6PQpu6orI/0cFD8A1gBrt1QD5VgKU4fz5eTbLbz8PZpWWa1
         ckFw==
X-Gm-Message-State: AOAM5315HWE4GjfQGg+2qnJKvguESkbwp0I8PWfkYJKuyfpE+u7DTsLw
        yKiHTGIExryNqIRJLUyleA3a09U8PsKCNj5kTwrMRzrEh6z8qQ==
X-Google-Smtp-Source: ABdhPJwgGTKh4TKnI1s+3ZCvChjw2a7um0JTJ4DIWNsYUrhJB0xyFkV+TgBh3uA/Vl1HwQAA1T1q7/Gtr1/tRYSpixc=
X-Received: by 2002:a05:6402:3312:b0:42a:e883:5397 with SMTP id
 e18-20020a056402331200b0042ae8835397mr21030439eda.74.1653587762947; Thu, 26
 May 2022 10:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220518194426.3784095-1-tanmay.shah@xilinx.com>
 <CANLsYkw9HuLso9bGL4fM7C9qH+basgKA9yKFwms4WB4OUHqymQ@mail.gmail.com>
 <b4bef7c4-7f12-1cdb-c2f0-a248c125b9b4@xilinx.com> <bb0ad4ee-a9ad-e70a-5870-7552fa1cca51@xilinx.com>
In-Reply-To: <bb0ad4ee-a9ad-e70a-5870-7552fa1cca51@xilinx.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 26 May 2022 11:55:51 -0600
Message-ID: <CANLsYkw2Yo5DwyPY=W7-mQ+SNxnRhLcRE2YdJp+Jd4pSgJX35A@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add Xilinx RPU subsystem support
To:     Tanmay Shah <tanmay.shah@xilinx.com>
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 26 May 2022 at 10:41, Tanmay Shah <tanmay.shah@xilinx.com> wrote:
>
>
> On 5/19/22 8:10 PM, tanmay.shah@xilinx.com wrote:
> >
> >
> > On 5/19/22 3:19 AM, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> >> Hi Tanmay,
> >>
> >> I have replaced the previous version of this set with this one in my
> >> queue.  That way you don't go back to the bottom.
> >>
> >
> > Thanks Mathieu. Sure it will help.
> >
> Hi Mathieu,
>
> Just want to check on reviews. Are you any close to review this version ?
>
> I have minor fixes in bindings, but if I can get reviews on driver in
> this version, I can send driver related changes in v6 as well.
>
> If my patch is not any close in queue (let's say within next week) I
> will go ahead and post v6 that is fixing only bindings.

Unfortunately I won't be able to review your work before the end of
next week.  At this time this is what my queue look like:

[PATCH V4 0/2] remoteproc: support self recovery
[RFC PATCH v5 0/4] remoteproc: restructure the remoteproc VirtIO device
[PATCH v3 0/5] Introduce PRU remoteproc consumer API
[PATCH v5 0/6] Add Xilinx RPU subsystem support
[PATCH 0/2] dma-mapping, remoteproc: Fix dma_mem leak after rproc_shutdown

>
>
> Thanks,
>
> Tanmay
>
> >> Thanks,
> >> Mathieu.
> >>
> >> On Wed, 18 May 2022 at 20:46, Tanmay Shah <tanmay.shah@xilinx.com>
> >> wrote:
> >> >
> >> > This patch series adds bindings document for RPU subsystem found on
> >> Xilinx
> >> > ZynqMP platforms. It also adds device nodes and driver to enable RPU
> >> > subsystem in split mode and lockstep mode.
> >> >
> >> > Xilinx ZynqMP platform contains Remote Processing Unit(RPU). RPU
> >> subsystem
> >> > contains two arm cortex r5f cores. RPU subsystem can be configured in
> >> > split mode, lockstep mode and single-cpu mode.
> >> >
> >> > RPU subsystem also contains 4 Tightly Coupled Memory(TCM) banks.
> >> > In lockstep mode, all 4 banks are combined and total of 256KB
> >> memory is
> >> > made available to r5 core0. In split mode, both cores can access two
> >> > TCM banks i.e. 128 KB.
> >> >
> >> > RPU can also fetch data and execute instructions from DDR memory
> >> along with
> >> > TCM memory.
> >> > ---
> >> >
> >> > Changes in v5:
> >> >    - Add constraints of the possible values of xlnx,cluster-mode
> >> property
> >> >    - fix description of power-domains property for r5 core
> >> >    - Remove reg, address-cells and size-cells properties as it is
> >> not required
> >> >    - Fix description of mboxes property
> >> >    - Add description of each memory-region and remove old .txt
> >> binding link
> >> >      reference in the description
> >> >    - Remove optional reg property from r5fss node
> >> >    - Move r5fss node out of axi node
> >> >
> >> > Changes in v4:
> >> >    - Add memory-region, mboxes and mbox-names properties in
> >> dt-bindings example
> >> >    - Add reserved memory region node and use it in Xilinx dt RPU
> >> subsystem node
> >> >    - Remove redundant header files
> >> >    - use dev_err_probe() to report errors during probe
> >> >    - Fix missing check on error code returned by
> >> zynqmp_r5_add_rproc_core()
> >> >    - Fix memory leaks all over the driver when resource allocation
> >> fails for any core
> >> >    - make cluster mode check only at one place
> >> >    - remove redundant initialization of variable
> >> >    - remove redundant use of of_node_put()
> >> >    - Fix Comment format problem
> >> >    - Assign offset of zynqmp_tcm_banks instead of duplicating it
> >> >    - Add tcm and memory regions rproc carveouts during prepare
> >> instead of parse_fw
> >> >    - Remove rproc_mem_entry object from r5_core
> >> >    - Use put_device() and rproc_del() APIs to fix memory leaks
> >> >    - Replace pr_* with dev_*. This was missed in v3, fix now.
> >> >    - Use "GPL" instead of "GPL v2" in MODULE_LICENSE macro. This
> >> was reported by checkpatch script.
> >> >
> >> > Changes in v3:
> >> >    - Fix checkpatch script indentation warning
> >> >    - Remove unused variable from xilinx remoteproc driver
> >> >    - use C style comments, i.e /*...*/
> >> >    - Remove redundant debug information which can be derived using
> >> /proc/device-tree
> >> >    - Fix multiline comment format
> >> >    - s/"final fot TCM"/"final for TCM"
> >> >    - Function devm_kzalloc() does not return an code on error, just
> >> NULL.
> >> >      Remove redundant error check for this function throughout the
> >> driver.
> >> >    - Fix RPU mode configuration and add documentation accordingly
> >> >    - Get rid of the indentations to match function documentation
> >> style with rest of the driver
> >> >    - Fix memory leak by only using r5_rproc->priv and not replace
> >> it with new instance
> >> >    - Use 'i' for the outer loop and 'j' for the inner one as per
> >> convention
> >> >    - Remove redundant error and NULL checks throughout the driver
> >> >    - Use devm_kcalloc() when more than one element is required
> >> >    - Add memory-regions carveouts during driver probe instead of
> >> parse_fw call
> >> >      This removes redundant copy of reserved_mem object in r5_core
> >> structure.
> >> >    - Fix memory leak by using of_node_put()
> >> >    - Fix indentation of tcm_mem_map function args
> >> >    - Remove redundant init of variables
> >> >    - Initialize tcm bank size variable for lockstep mode
> >> >    - Replace u32 with phys_addr_t for variable stroing memory bank
> >> address
> >> >    - Add documentation of TCM behavior in lockstep mode
> >> >    - Use dev_get_drvdata instead of platform driver API
> >> >    - Remove info level messages
> >> >    - Fix checkpatch.pl warnings
> >> >    - Add documentation for the Xilinx r5f platform to understand
> >> driver design
> >> >
> >> > Changes in v2:
> >> >    - Remove proprietary copyright footer from cover letter
> >> >
> >> >
> >> > Ben Levinsky (3):
> >> >    firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
> >> >      configuration.
> >> >    firmware: xilinx: Add shutdown/wakeup APIs
> >> >    firmware: xilinx: Add RPU configuration APIs
> >> >
> >> > Tanmay Shah (3):
> >> >    dt-bindings: remoteproc: Add Xilinx RPU subsystem bindings
> >> >    arm64: dts: xilinx: zynqmp: Add RPU subsystem device node
> >> >    drivers: remoteproc: Add Xilinx r5 remoteproc driver
> >> >
> >> >   .../bindings/remoteproc/xlnx,r5f-rproc.yaml   |  128 ++
> >> >   arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |   33 +
> >> >   drivers/firmware/xilinx/zynqmp.c              |   97 ++
> >> >   drivers/remoteproc/Kconfig                    |   12 +
> >> >   drivers/remoteproc/Makefile                   |    1 +
> >> >   drivers/remoteproc/xlnx_r5_remoteproc.c       | 1045
> >> +++++++++++++++++
> >> >   include/dt-bindings/power/xlnx-zynqmp-power.h |    6 +
> >> >   include/linux/firmware/xlnx-zynqmp.h          |   60 +
> >> >   8 files changed, 1382 insertions(+)
> >> >   create mode 100644
> >> Documentation/devicetree/bindings/remoteproc/xlnx,r5f-rproc.yaml
> >> >   create mode 100644 drivers/remoteproc/xlnx_r5_remoteproc.c
> >> >
> >> >
> >> > base-commit: 01a1a0c8d456b11f2f6b9b822414481beaa44d6f
> >> > --
> >> > 2.25.1
> >> >
> >>
