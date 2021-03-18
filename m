Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A25EC433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 22:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F18664F45
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 22:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhCRV7e (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 18 Mar 2021 17:59:34 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50976 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233197AbhCRV7C (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Mar 2021 17:59:02 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12ILwsD3103423;
        Thu, 18 Mar 2021 16:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1616104734;
        bh=POInSGcn1A0sYD6GmUBURxm/uKrd3X4N8cZ5GglriSQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HemKxjZAAxlw+aeVYvGVAr0PXB8FC1y9Mq0Cw2vDx3ESOGsSa0cHJdEGh8F1M7vJo
         NqUEyZ/RRdeONSWMG8LPzKtT+b135r1fuyCOEkodjznmXb9BJ+akw+RtL5ap9GaX98
         BiLVia4nmD7eOPs5fxyta+BHFlxBrhGCBybwSqow=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12ILwstR005000
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 18 Mar 2021 16:58:54 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 18
 Mar 2021 16:58:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 18 Mar 2021 16:58:54 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12ILws5x088239;
        Thu, 18 Mar 2021 16:58:54 -0500
Received: from localhost ([10.250.32.139])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 12ILwsfY096158;
        Thu, 18 Mar 2021 16:58:54 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: k3-r5f: Update bindings for AM64x SoCs
Date:   Thu, 18 Mar 2021 16:58:41 -0500
Message-ID: <20210318215842.8196-2-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318215842.8196-1-s-anna@ti.com>
References: <20210318215842.8196-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The K3 AM64x SoCs have two dual-core Arm R5F clusters/subsystems, with
2 R5F cores each, both in the MAIN voltage domain.

These clusters are a revised IP version compared to those present on
J721E and J7200 SoCs, and supports a new "Single-CPU" mode instead of
LockStep mode. Update the K3 R5F remoteproc bindings with the compatible
info relevant to these R5F clusters/subsystems on K3 AM64x SoCs.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 31 ++++++++++++++++---
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index d905d614502b..130fbaacc4b1 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -14,8 +14,12 @@ description: |
   processor subsystems/clusters (R5FSS). The dual core cluster can be used
   either in a LockStep mode providing safety/fault tolerance features or in a
   Split mode providing two individual compute cores for doubling the compute
-  capacity. These are used together with other processors present on the SoC
-  to achieve various system level goals.
+  capacity on most SoCs. These are used together with other processors present
+  on the SoC to achieve various system level goals.
+
+  AM64x SoCs do not support LockStep mode, but rather a new non-safety mode
+  called "Single-CPU" mode, where only Core0 is used, but with ability to use
+  Core1's TCMs as well.
 
   Each Dual-Core R5F sub-system is represented as a single DTS node
   representing the cluster, with a pair of child DT nodes representing
@@ -33,6 +37,7 @@ properties:
       - ti,am654-r5fss
       - ti,j721e-r5fss
       - ti,j7200-r5fss
+      - ti,am64-r5fss
 
   power-domains:
     description: |
@@ -56,11 +61,12 @@ properties:
 
   ti,cluster-mode:
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1]
     description: |
       Configuration Mode for the Dual R5F cores within the R5F cluster.
-      Should be either a value of 1 (LockStep mode) or 0 (Split mode),
-      default is LockStep mode if omitted.
+      Should be either a value of 1 (LockStep mode) or 0 (Split mode) on
+      most SoCs (AM65x, J721E, J7200), default is LockStep mode if omitted;
+      and should be either a value of 0 (Split mode) or 2 (Single-CPU mode)
+      on AM64x SoCs, default is Split mode if omitted.
 
 # R5F Processor Child Nodes:
 # ==========================
@@ -97,6 +103,7 @@ patternProperties:
           - ti,am654-r5f
           - ti,j721e-r5f
           - ti,j7200-r5f
+          - ti,am64-r5f
 
       reg:
         items:
@@ -198,6 +205,20 @@ patternProperties:
 
     unevaluatedProperties: false
 
+if:
+  properties:
+    compatible:
+      enum:
+        - ti,am64-r5fss
+then:
+  properties:
+    ti,cluster-mode:
+      enum: [0, 2]
+else:
+  properties:
+    ti,cluster-mode:
+      enum: [0, 1]
+
 required:
   - compatible
   - power-domains
-- 
2.30.1

