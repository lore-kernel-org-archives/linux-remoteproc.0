Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B81C4707A
	for <linux-remoteproc@archiver.kernel.org>; Sat, 22 May 2021 00:03:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F15F5613F5
	for <linux-remoteproc@archiver.kernel.org>; Sat, 22 May 2021 00:03:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbhEVAFD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 21 May 2021 20:05:03 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58096 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbhEVAE7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 May 2021 20:04:59 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14M03L1e026975;
        Fri, 21 May 2021 19:03:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621641801;
        bh=/Dda2Enr1NOVMTMDbxwZnH3VUCymyUFTjOOqOuep2F8=;
        h=From:To:CC:Subject:Date;
        b=rFBkXQ+1XeD16j0IM3K1PAFz/PXq0Gc+ozhJJ1s7pEy6TPVsBjWBdT8MqploQKSLC
         XYr9W6UgFuHI+8rreChjr/Tp3zsR6rW+p1Dle1kg/UyczYd0a+X67G1F9HsASVfUr0
         BKW7QiWyhxPmueWrb9jywzbV578eRadvo0lx4j0U=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14M03LQP123688
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 May 2021 19:03:21 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 19:03:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 19:03:21 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14M03LsE113279;
        Fri, 21 May 2021 19:03:21 -0500
Received: from localhost ([10.250.35.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 14M03LMI091510;
        Fri, 21 May 2021 19:03:21 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/6] K3 R5F & DSP IPC-only mode support
Date:   Fri, 21 May 2021 19:03:03 -0500
Message-ID: <20210522000309.26134-1-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi All,

The following series adds the IPC-only mode support for the TI K3 R5F
and DSP (C66x and C71x) remoteprocs covering AM65x, J721E, J7200 and
AM64x SoCs. Patches are on top of 5.13-rc1 + Minor remoteproc cleanup
series [1] + TI K3 R5F remoteproc support on AM64x series [2].

The 'IPC-only' mode terminology essentially means establishing only the
IPC rpmsg stack for remoteprocs that are booted early by bootloaders and
supporting only 'attach' and 'detach' of the remoteprocs. The existing
remoteproc infrastructure does support 'stop' of an early-booted remote
processor, and the TI K3 remoteprocs are intentionally being limited to
'detach', and are designed to only establish and tear apart IPC (the 
virtio devices that provide the IPC transport) without ever shutting
down the core. This is done by introducing a new flag in remoteproc core
in Patch 2. Support for the regular 'stop' can be enhanced in the future
easily by adding a new sysfs or configfs file that changes this flag,
but IPC-only is the expected usage model for now on K3 SoCs.

Following is a summary of some of the design details:
 - The TI K3 SoCs use a dedicated system processor for Power and Clocks
   and the IPC-only mode is detected by communicating with this central
   processor and checking on the power status of remoteprocs.
 - The driver support is provided through the recently added .attach(),
  .detach() and .get_loaded_rsc_table() rproc ops, and new RPROC_ATTACHED
   and RPROC_DETACHED state flags.
 - The default kernel dts cluster modes and TCM configuration for R5Fs
   are ignored and overridden by querying this config from the system
   processor in IPC-only mode. Any core not booted earlier will fall back
   to using the kernel dts (eg: R5F Core0 can be booted by bootloader, and
   R5F Core1 will be booted using kernel).
 - The remoteproc firmwares are not loaded again in kernel to retrieve
   the resource table. This allows early-boot to be done from different
   boot media such as OSPI or eMMC, and be completely independent of the
   rootfs in SDCard or NFS.
 - The IPC-only mode support follows a design-by-contract (DBC) approach
   to achieve the above. The resource tables are always expected to be at
   the base on the DDR memory region reserved for firmwares (base of the
   second memory-region property in the remoteproc dts node). This also
   eliminates the need for dts properties being dynamically updated to
   provide the resource table address (there are no dedicated h/w
   registers either like with the ST SoCs). This scales to designs where
   either U-Boot is not involved or a different processor is used to
   load the various remoteprocs.
 - The "stop" command results in a failure when the remoteproc is in
   IPC-only mode, and "detach" serves as the corresponding replacement.
   Note that there is no equivalent "attach" command, and "start" command
   also serves as "attach" for remoteprocs that are in detached state.
 - The remoteproc sysfs 'state' file shows the mode as "detached"
   when the early-booted remoteproc is detached. "offline" continues
   to be shown when the remoteproc is powered off.

Following is the summary of patches:
 - Patch 1 is a minor cleanup patch in remoteproc core to make the 
   helper functions look symmetric.
 - Patch 2 introduces a new flag 'detach_on_shutdown' and enhances
   the remoteproc core to restrict stop on early-booted remoteprocs.
   This patch provides the required behavior for K3 IPC-only mode (no
   stopping of early-booted rprocs). The default behavior continues
   to support stopping of remoteproc like with the existing code.
 - Patches 3 and 5 refactor the mailbox request code out of start
   for reuse in the new attach callbacks.
 - Patch 4 adds the IPC-only mode support for R5F.
 - Patch 6 adds the IPC-only mode support for both K3 C66x and C71x
   DSPs.

Patches 1, 3 and 5 can be considered cleanup, so I suggest these be
picked up if there are any major comments on the others.

I have verified the different combinations on J721E, J7200 and AM65x
SoCs. AM64x currently lacks early-boot support, but the logic is ready
for Single-CPU and Split modes that are specific to AM64x SoCs. 

regards
Suman

[1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=485235
[2] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=456755 

Suman Anna (6):
  remoteproc: Introduce rproc_detach_device() wrapper
  remoteproc: Add support for detach-only during shutdown
  remoteproc: k3-r5: Refactor mbox request code in start
  remoteproc: k3-r5: Add support for IPC-only mode for all R5Fs
  remoteproc: k3-dsp: Refactor mbox request code in start
  remoteproc: k3-dsp: Add support for IPC-only mode for all K3 DSPs

 drivers/remoteproc/remoteproc_cdev.c      |   7 +
 drivers/remoteproc/remoteproc_core.c      |   7 +-
 drivers/remoteproc/remoteproc_internal.h  |   8 +
 drivers/remoteproc/remoteproc_sysfs.c     |   6 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 214 ++++++++++++++---
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 279 ++++++++++++++++++++--
 include/linux/remoteproc.h                |   3 +
 7 files changed, 459 insertions(+), 65 deletions(-)

-- 
2.30.1

