Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113AEC64EC4
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Mar 2023 16:29:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbjCJQ3f (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Mar 2023 11:29:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbjCJQ3R (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Mar 2023 11:29:17 -0500
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B87F132D3;
        Fri, 10 Mar 2023 08:25:52 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32AGPjJD055636;
        Fri, 10 Mar 2023 10:25:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1678465545;
        bh=IZLmJ1drzeDlkAPuPqNqYdVnaxm41aYQJiXZVCir8+w=;
        h=From:To:CC:Subject:Date;
        b=hf3Ksbkc/7x585yUXl8GQClBQEvFNoz6Xk++ZzTkVfGFOvQKQ3J41sNSbSq0MJUMC
         Q8naHj2USOTxf+c73TWUnCTEHMTbQNoKIADSBtS0lR8m14chSA7DF8tUk+1870LXVm
         CYq4BKtNid0yEUW3NKAXCb6cWDqT45rO/AI173jw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32AGPjL5015726
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 10 Mar 2023 10:25:45 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 10
 Mar 2023 10:25:45 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 10 Mar 2023 10:25:45 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32AGPib6010679;
        Fri, 10 Mar 2023 10:25:45 -0600
From:   Devarsh Thakkar <devarsht@ti.com>
To:     <andersson@kernel.org>, <devicetree@vger.kernel.org>,
        <mathieu.poirier@linaro.org>, <p.zabel@pengutronix.de>,
        <linux-remoteproc@vger.kernel.org>, <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <s-anna@ti.com>
CC:     <hnagalla@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <devarsht@ti.com>, <rogerq@kernel.org>
Subject: [PATCH v7 0/3] Add single core R5F IPC for AM62 SoC family                                     
Date:   Fri, 10 Mar 2023 21:55:41 +0530
Message-ID: <20230310162544.3468365-1-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Devarsh Thakkar (3):
  remoteproc: k3-r5: Simplify cluster mode setting usage
  dt-bindings: remoteproc: ti: Add new compatible for AM62 SoC family
  remoteproc: k3-r5: Use separate compatible string for TI AM62x SoC
    family

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  |  76 ++++++++----
 drivers/remoteproc/ti_k3_r5_remoteproc.c      | 110 ++++++++++++------
 2 files changed, 130 insertions(+), 56 deletions(-)
---
V2: 
  - dt-bindings: Avoid acronyms, use "Device Manager" instead of "DM" 
V3: 
  - dt-bindings: Use separate if block for each compatible for ti,cluster-mode property
  - dt-bindings: Rearrange compatibles as per alphabatical order
V4:
  - dt-bindings: Place each enum in separate line in allOf
V5: 
  - No change (fixing typo in email address) 
V6: 
  - dt-bindings: Remove reviewed-by due to new modifications to use cluster-mode=3
    Introduce Simplify cluster-mode setting preamble patch per review comments
  - Use CLUSTER_MODE_SINGLECORE for AM62x
  - Set PROC_BOOT_CFG_FLAG_R5_SINGLE_CORE for single core.
V7: 
  - Override to appropriate cluster-mode per firmware status flag without checking soc_data
  - Set appropriate mode as default if not provided in DT                         
  - Check mode validity against SoC data during probe
  - Rebase on top of 6.3 linux-next 
-- 
2.34.1

