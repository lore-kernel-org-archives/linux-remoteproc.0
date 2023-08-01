Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81765C0015E
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Aug 2023 14:11:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233794AbjHAOLs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 1 Aug 2023 10:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233891AbjHAOLn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 1 Aug 2023 10:11:43 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46CE2728;
        Tue,  1 Aug 2023 07:11:33 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 371EBM2R070104;
        Tue, 1 Aug 2023 09:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1690899082;
        bh=W/F51boW0s52ykPrOys8Lt+Gz7rqGfuRoOXlgbyvudQ=;
        h=From:To:CC:Subject:Date;
        b=Kj5QwuC+CxoGWdlnsJiyf70niUD3ikWSuRaA89Q6FlSuN0nkyXSrJzSg5S3tnhOtG
         KYCopODz/gMtc+Ijimk12oOWcZW15doscugwxmnnsnIvIJcPHm49aiDOLhL4g7vs2v
         kxPCE5CAgZE1KgaUrfDDdaOeZ1Nh1cL1ZkyDU5eQ=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 371EBMmC000732
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Aug 2023 09:11:22 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Aug 2023 09:11:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Aug 2023 09:11:21 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 371EBLMm039003;
        Tue, 1 Aug 2023 09:11:21 -0500
From:   Hari Nagalla <hnagalla@ti.com>
To:     <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <p.zabel@pengutronix.de>, <martyn.welch@collabora.com>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/3] TI K3 M4F support on AM64x and AM62x SoCs
Date:   Tue, 1 Aug 2023 09:11:14 -0500
Message-ID: <20230801141117.2559-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following series introduces K3 M4F remoteproc driver support for
AM64x and AM62x SoC families. These SoCs have a ARM Cortex M4F core in
the MCU voltage domain. For safety oriented applications, this core is
operated independently with out any IPC to other cores on the SoC.
However, for non safety applications, some customers use it as a remote
processor and so linux remote proc support is extended to the M4F core.

See AM64x Technical Reference Manual (SPRUIM2C – SEPTEMBER 2021) for
further details: https://www.ti.com/lit/pdf/SPRUIM2

Hari Nagalla (1):
  dt-bindings: remoteproc: k3-m4f: Add bindings for K3 AM64x SoCs

Martyn Welch (2):
  remoteproc: k3: Split out functions common with M4 driver
  remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem

 .../bindings/remoteproc/ti,k3-m4f-rproc.yaml  | 123 ++++
 drivers/remoteproc/Kconfig                    |  13 +
 drivers/remoteproc/Makefile                   |   3 +-
 drivers/remoteproc/ti_k3_common.c             | 513 +++++++++++++++
 drivers/remoteproc/ti_k3_common.h             | 108 ++++
 drivers/remoteproc/ti_k3_dsp_remoteproc.c     | 598 +-----------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c      | 333 ++++++++++
 7 files changed, 1121 insertions(+), 570 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml
 create mode 100644 drivers/remoteproc/ti_k3_common.c
 create mode 100644 drivers/remoteproc/ti_k3_common.h
 create mode 100644 drivers/remoteproc/ti_k3_m4_remoteproc.c

-- 
2.34.1

