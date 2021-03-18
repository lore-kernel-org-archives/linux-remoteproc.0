Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D97C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 21:59:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0B5464F45
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 21:59:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbhCRV7D (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 18 Mar 2021 17:59:03 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59494 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbhCRV6z (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Mar 2021 17:58:55 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12ILwnlp031737;
        Thu, 18 Mar 2021 16:58:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1616104729;
        bh=r0I/5gEUl9u/+u0BQsSSziZQ5jRmsqIYQXTlRPcwgsg=;
        h=From:To:CC:Subject:Date;
        b=NugvkazagSkVXvE3hocNAc0n9wB+fzG/McXT7gj4LS0a1NtMAVlQcaxghyUHefuxT
         qBhvW0OPsfxZlnoD31GGMIALf4+GVXJq1DeFBdghUHvVIx9B4RPMJAe7NghK0RhzZb
         zbVPeK9wJeUp8kYmtlfJN3I9hIK4Ixrw+1QXzQ0g=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12ILwnBb097713
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 18 Mar 2021 16:58:49 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 18
 Mar 2021 16:58:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 18 Mar 2021 16:58:49 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12ILwmu8043227;
        Thu, 18 Mar 2021 16:58:48 -0500
Received: from localhost ([10.250.32.139])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 12ILwmio096141;
        Thu, 18 Mar 2021 16:58:48 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/2] TI K3 R5F remoteproc support on AM46x SoCs
Date:   Thu, 18 Mar 2021 16:58:40 -0500
Message-ID: <20210318215842.8196-1-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi All,

The following series enhances the K3 R5F remoteproc driver to add support
for the R5F clusters on the newer TI K3 AM64x SoC family. The AM64x SoCs
have 2 R5FSS clusters and no DSPs. Both clusters are capable of supporting
either the conventional Split-mode or a brand new "Single-CPU" mode.

The revised R5FSS IP has the following unique features:
 1. The new Single-CPU mode allows the Core1 TCMs to be combined with
    the Core0 TCMs effectively doubling the amount of TCMs available.
    This is same behavior as LockStep-mode on J7200 SoCs, but all other
    previous SoCs could only use the Core0 TCMs. This combined TCMs appear
    contiguous at the respective Core0 TCM addresses.
 2. TCMs are auto-initialized during module power-up, and the behavior
    is programmable through a SEC_MMR register bit. This is same as on
    J7200 SoCs, and is not present on earlier AM65x and J721E SoCs.

The series is based on 5.12-rc2, and can apply on top of the current
rproc-next branch as well.

regards
Suman

Suman Anna (2):
  dt-bindings: remoteproc: k3-r5f: Update bindings for AM64x SoCs
  remoteproc: k3-r5: Extend support to R5F clusters on AM64x SoCs

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  |  31 +++-
 drivers/remoteproc/ti_k3_r5_remoteproc.c      | 155 ++++++++++++++----
 2 files changed, 152 insertions(+), 34 deletions(-)

-- 
2.30.1

