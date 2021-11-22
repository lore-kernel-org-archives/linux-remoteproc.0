Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470F9C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Nov 2021 12:27:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235215AbhKVMa6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 07:30:58 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38632 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234761AbhKVMa6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 07:30:58 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AMCRiiq100445;
        Mon, 22 Nov 2021 06:27:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1637584064;
        bh=RFOELONpazPjFEUocOZleZrVoiEn1nLSQfZ2WfIgFIw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ytyN/qK33MtqyQ7/jgb629NqUDNNlFrYObG7Rybmi3R1b/VtLRcx3cXEvW4Jna3SF
         NCO/t9qV/eJ1aO5o0Ig7WnqIxwb0ujb+TOrMDtHO9uK+cfIfMbPZ3MSYtvtPACdNuS
         U9NfiSXysqmaO0r4Tbd2W/B0ReUbPVcxlXPXZC5U=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AMCRipV094210
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 22 Nov 2021 06:27:44 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 22
 Nov 2021 06:27:44 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 22 Nov 2021 06:27:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AMCRhm6060724;
        Mon, 22 Nov 2021 06:27:44 -0600
From:   Hari Nagalla <hnagalla@ti.com>
To:     <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <a-govindraju@ti.com>
Subject: [PATCH 1/4] dt-bindings: remoteproc: k3-r5f: Update bindings for J721S2 SoCs
Date:   Mon, 22 Nov 2021 06:27:23 -0600
Message-ID: <20211122122726.8532-2-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122122726.8532-1-hnagalla@ti.com>
References: <20211122122726.8532-1-hnagalla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The TI K3 J721S2 SoCs have three dual-core Arm R5F clusters/subsystems,
with 2 R5F cores each, one in MCU voltage domain and the other two in
MAIN voltage domain.

These clusters are similar to J7200 R5F clusters. Compatible info is
updated for intuitively matching to the new J721S2 SoCs.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index eeef255c4045..36e095cbde4c 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -38,6 +38,7 @@ properties:
       - ti,j721e-r5fss
       - ti,j7200-r5fss
       - ti,am64-r5fss
+      - ti,j721s2-r5fss
 
   power-domains:
     description: |
@@ -64,9 +65,9 @@ properties:
     description: |
       Configuration Mode for the Dual R5F cores within the R5F cluster.
       Should be either a value of 1 (LockStep mode) or 0 (Split mode) on
-      most SoCs (AM65x, J721E, J7200), default is LockStep mode if omitted;
-      and should be either a value of 0 (Split mode) or 2 (Single-CPU mode)
-      on AM64x SoCs, default is Split mode if omitted.
+      most SoCs (AM65x, J721E, J7200, J721s2), default is LockStep mode if
+      omitted; and should be either a value of 0 (Split mode) or 2
+      (Single-CPU mode) on AM64x SoCs, default is Split mode if omitted.
 
 # R5F Processor Child Nodes:
 # ==========================
@@ -104,6 +105,7 @@ patternProperties:
           - ti,j721e-r5f
           - ti,j7200-r5f
           - ti,am64-r5f
+          - ti,j721s2-r5f
 
       reg:
         items:
-- 
2.17.1

