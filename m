Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95109C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Feb 2021 17:05:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FD8364F65
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Feb 2021 17:05:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237438AbhBDRFN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 Feb 2021 12:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236729AbhBDRFH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 Feb 2021 12:05:07 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE41C061788
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 Feb 2021 09:04:24 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id q7so4021219iob.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Feb 2021 09:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=APRvOwEYA8YgNTDl52MW2PBPMp7xx6X2PErkKlr6exE=;
        b=z2RP8MxoGmvaXGpyWzx1CtQJ6V8Evv6IRzRs48e2NbTteSoUltNeJEBcy9HxOUSAft
         v7YZu+m5PRnhjwGED724XgwN+xxBKF04LPV4dWAUlQr57GdNhHI0hG5S6bAmdSRzracb
         cmwcvcteHkBPpd8XMni2HufTAbBKrOyUF/NuxqUw7FgZgS5ADjy7EO9lV0flsNsxQTTA
         i4AT8NIYSM7awUD8enyGzY12AO3BsKqTj4RszNYMWL4JkzSKc9md2CijVYdeYxYxkcgv
         xwkucjZ+FSOoBdDl2OqMvvNLIrIr7P2zVQiA3lxF4R1NcWrf3CidpgurnMSZN3h5Mal7
         Ypkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=APRvOwEYA8YgNTDl52MW2PBPMp7xx6X2PErkKlr6exE=;
        b=JtA+JJQHx+tSBnZbUbdzOMyvQB0PYA2go8xiG8iauLuuCJ0FirESnR5NTZ5tEAQkKz
         UWaSJMYMNE/arClHjmg7LowNB3ZdMRQO4HwQiFmuFhGOZL/88Ee0otfuSbiFQXsNd7AP
         gpOzO4gKAEFxrGxutmF3zXWFGoMrTn+0rKqZFMwn5lelB/Xc3Q49J3KIU9S7nEO6pQ2n
         kPTyPQAbPRBff6j1qF/oAIysaJNe5bEOS/3tfNuSwHd58TC8sJ57kcaQYGw36APZIesu
         jAxOvZ+HvqhImGxW4dw0FhCSJqE4lge4fhQUrPF3w3FsEAW/o6WqgjPe+7jALkypSSSZ
         0N8Q==
X-Gm-Message-State: AOAM533TaMVIjkkWfEltx2KcqVTqCWaehHs0Ai56tFzktqbOakpa8VM1
        vMvBF6utuDPEvn1CiFW+5WmZHXYHQhVmMLqUna6afi7VYxQ=
X-Google-Smtp-Source: ABdhPJzi5VkUuMl18Ep4KFgHhQVsGuQyjYjqrRWgetEgshyAYv2A+qcQD7IXXBPYHwA/+tj0XSPV+ny+I90zITlCte8=
X-Received: by 2002:a05:6638:138e:: with SMTP id w14mr507601jad.98.1612458264356;
 Thu, 04 Feb 2021 09:04:24 -0800 (PST)
MIME-Version: 1.0
References: <20210111020250.6846-1-ben.levinsky@xilinx.com> <BYAPR02MB44074420E51EAB13ACDAA343B5B39@BYAPR02MB4407.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB44074420E51EAB13ACDAA343B5B39@BYAPR02MB4407.namprd02.prod.outlook.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 4 Feb 2021 10:04:13 -0700
Message-ID: <CANLsYkw8YBm-e7EnR+2vZqYDAdLNBmHk27+iMsU9FkdchMEeBA@mail.gmail.com>
Subject: Re: [PATCH v25 0/5] Provide basic driver to control Arm R5
 co-processor found on Xilinx ZynqMP
To:     Ben Levinsky <BLEVINSK@xilinx.com>
Cc:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 4 Feb 2021 at 09:03, Ben Levinsky <BLEVINSK@xilinx.com> wrote:
>
> Ping for comments
>

This patchset has been in my queue for a while now but was preempted
by other work.  I should be able to get to it within the next two
weeks.

> > -----Original Message-----
> > From: Ben Levinsky <ben.levinsky@xilinx.com>
> > Sent: Sunday, January 10, 2021 6:03 PM
> > To: mathieu.poirier@linaro.org
> > Cc: devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
> > kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Michal Simek
> > <michals@xilinx.com>
> > Subject: [PATCH v25 0/5] Provide basic driver to control Arm R5 co-processor
> > found on Xilinx ZynqMP
> >
> > R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
> > remotproc driver, we can boot the R5 sub-system in two different
> > configurations -
> >       * Split
> >       * Lockstep
> >
> > The Xilinx R5 Remoteproc Driver boots the R5's via calls to the Xilinx
> > Platform Management Unit that handles the R5 configuration, memory access
> > and R5 lifecycle management. The interface to this manager is done in this
> > driver via zynqmp_pm_* function calls.
> >
> > v25:
> > - reword error message for rpu configuration
> > - change char name[15] to 16 chars to have null terminated string
> >   in parse_mem_regions()
> > - reword comments in tcm_mem_alloc
> > - grammar in device tree bindings
> > - call xilinx platform cleanup in parse_tcm_banks() case of failure
> > - check value of mbox_send_message in all calls within this driver
> > - update include/linux/firmware/xlnx-zynqmp.h style to match for enum
> >   pm_node_id
> > - indentation in zynqmp_r5_remoteproc driver
> > - update style of constructing carveouts to match convention in ST
> >   remoteproc drivers. No longer iterate through memory-region property
> >   using of_count_phandle_with_args. Instead use of_phandle_iterator
> > - use rproc_of_resm_mem_entry_init for vdev0buffer carveout as per
> > feedback
> > - rework loop in zynqmp_r5_pm_request_sram as per feedback
> > - fix comment and linebreak in tcm_mem_alloc description
> > - add comments and remove extraneous devm_ioremap_wc call in
> > tcm_mem_alloc
> > - in parse_tcm_banks remove check for bank not being available
> > - rework order of locals and remove else in zynqmp_r5_rproc_kick
> > - document and update logic for zynqmp_r5_parse_fw
> > - add dev_dbg output in event_notified_idr_cb if
> >   rproc_vq_interrupt(rproc, id) == IRQ_NONE
> > - add comment for handle_event_notified mbox_send_message function call
> > - add comment for zynqmp_r5_mb_rx_cb
> > - update zynqmp_r5_setup_mbox to match convention of mbox setup in ST
> >   remoteproc drivers
> > - change return in zynqmp_r5_setup_mbox to use PTR_ERR
> > - add zynqmp_r5_cleanup_mbox
> > - in zynqmp_r5_probe, reteurn zynqmp_r5_rproc instead of taking in as arg.
> > - in zynqmp_r5_probe use return of PTR_ERR and use
> > zynqmp_r5_cleanup_mbox
> > - in zynqmp_r5_remoteproc_probe update use return value of
> > zynqmp_r5_probe as
> >   either zynqmp_r5_rproc* or PTR_ERR
> > - update loop that cleans up cluster and mboxes in
> > zynqmp_r5_remoteproc_probe
> > - update loop that cleans up cluster and mboxes in
> > zynqmp_r5_remoteproc_remove
> >
> > Previous version:
> > https://patchwork.kernel.org/project/linux-remoteproc/list/?series=393387
> >
> >
> > Ben Levinsky (5):
> >   firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
> >     configuration.
> >   firmware: xilinx: Add shutdown/wakeup APIs
> >   firmware: xilinx: Add RPU configuration APIs
> >   dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc
> >     bindings
> >   remoteproc: Add initial zynqmp R5 remoteproc driver
> >
> >  .../xilinx,zynqmp-r5-remoteproc.yaml          | 223 +++++
> >  drivers/firmware/xilinx/zynqmp.c              |  96 ++
> >  drivers/remoteproc/Kconfig                    |   8 +
> >  drivers/remoteproc/Makefile                   |   1 +
> >  drivers/remoteproc/zynqmp_r5_remoteproc.c     | 897 ++++++++++++++++++
> >  include/linux/firmware/xlnx-zynqmp.h          |  66 +-
> >  6 files changed, 1290 insertions(+), 1 deletion(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-
> > remoteproc.yaml
> >  create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c
> >
> > --
> > 2.17.1
>
