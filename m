Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B17C4338F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Jul 2021 22:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3187460ED7
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Jul 2021 22:03:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbhGWVWk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 23 Jul 2021 17:22:40 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46638 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhGWVWk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 23 Jul 2021 17:22:40 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16NM3AI8056748;
        Fri, 23 Jul 2021 17:03:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627077790;
        bh=FF7s9FeiE7UAehlY5MJJ2DICyJ0WdcLF7kuc1bEetJ4=;
        h=From:To:CC:Subject:Date;
        b=U/iVnaYIupEZXqALOBvGHTA04H+1+tr9ZUDwZ36pi5d9IbjmdiE/EBXGePHk6dfkh
         pqSkAYucHyOPbz+ZGVHo7RIdo95vjanDRm2/0sdunca3Hg1/KzbXzDWrlcoKsmnCTk
         O5qnqgrEGt5twIqIpDEg9OVouy/NguhbNIXQnoKk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16NM3AOk106128
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 23 Jul 2021 17:03:10 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 23
 Jul 2021 17:02:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 23 Jul 2021 17:02:49 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16NM2nhY001427;
        Fri, 23 Jul 2021 17:02:49 -0500
Received: from localhost ([10.250.38.176])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 16NM2n6G126725;
        Fri, 23 Jul 2021 17:02:49 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Hari Nagalla <hnagalla@ti.com>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 0/5] K3 R5F & DSP IPC-only mode support
Date:   Fri, 23 Jul 2021 17:02:43 -0500
Message-ID: <20210723220248.6554-1-s-anna@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi All,

The following is a revised version of the series that adds the IPC-only
mode support for the TI K3 R5F and DSP (C66x and C71x) remoteprocs
covering AM65x, J721E, J7200 and AM64x SoCs. Patches are on top of
5.14-rc1 (the other dependent patches from v1 made it into 5.14-rc1).

Please see the v1 cover-letter [1] for the design details of the
'IPC-only' mode functionality.

The following are the main changes from v1, please see the individual
patches for the exact deltas:
 - The first patch in v1 "remoteproc: Introduce rproc_detach_device()
   wrapper" is dropped
 - Removed the addition of the rproc state flag 'detach_on_shutdown'
   and the 'ipc-only' state flag in each of the remoteproc drivers
 - IPC-only mode and remoteproc mode are supported by registering only
   the appropriate rproc ops.

The following is a summary of patches in v2:
 - Patch 1 enhances the remoteproc core to restrict stop on early-booted
   remoteprocs. 
 - Patches 2 and 4 refactor the mailbox request code out of start
   in the K3 R5F and DSP remoteproc drivers for reuse in the new attach
   callbacks.
 - Patch 3 adds the IPC-only mode support for R5F.
 - Patch 5 adds the IPC-only mode support for both K3 C66x and C71x
   DSPs.

I have re-verified the different combinations on J721E, J7200 and AM65x
SoCs. AM64x currently lacks early-boot support, but the logic is ready
for Single-CPU and Split modes that are specific to AM64x SoCs. 

regards
Suman

[1] https://patchwork.kernel.org/project/linux-remoteproc/cover/20210522000309.26134-1-s-anna@ti.com/

Suman Anna (5):
  remoteproc: Add support for detach-only during shutdown
  remoteproc: k3-r5: Refactor mbox request code in start
  remoteproc: k3-r5: Add support for IPC-only mode for all R5Fs
  remoteproc: k3-dsp: Refactor mbox request code in start
  remoteproc: k3-dsp: Add support for IPC-only mode for all K3 DSPs

 drivers/remoteproc/remoteproc_cdev.c      |   7 +
 drivers/remoteproc/remoteproc_core.c      |   5 +-
 drivers/remoteproc/remoteproc_sysfs.c     |   6 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 197 ++++++++++++----
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 265 +++++++++++++++++++---
 5 files changed, 407 insertions(+), 73 deletions(-)

-- 
2.32.0

