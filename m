Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9CAC6369E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 01:06:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67CFE2468D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 01:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="v70/1Z6J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbgKSBFz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 20:05:55 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58806 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgKSBFy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 20:05:54 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AJ15lrJ035171;
        Wed, 18 Nov 2020 19:05:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605747947;
        bh=UWoxl2yYZsVlDBS/IWm40lAm6V7kxSUa0dxqsHXyHQs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=v70/1Z6JLPnhLYR/NYfVAqBaneBLEdhLuv6SaBLwYKtILQlX4z+3eR2Ws8hrTBnc5
         faGXEe4+eKzJF0zYAlPejJQuyHcwgtm0XK/LthmHJVmdizyNQDDxseK8nzWH1tvSYf
         OUG6sWYRH9gwHMny6hRDgK3mKiWMnt5n4bARuQ4s=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AJ15l5V052384
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Nov 2020 19:05:47 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 18
 Nov 2020 19:05:46 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 18 Nov 2020 19:05:46 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AJ15kFk056335;
        Wed, 18 Nov 2020 19:05:46 -0600
Received: from localhost ([10.250.38.244])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 0AJ15kVO076056;
        Wed, 18 Nov 2020 19:05:46 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 1/3] dt-bindings: remoteproc: k3-r5f: Update bindings for J7200 SoCs
Date:   Wed, 18 Nov 2020 19:05:29 -0600
Message-ID: <20201119010531.21083-2-s-anna@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201119010531.21083-1-s-anna@ti.com>
References: <20201119010531.21083-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The TI K3 J7200 SoCs have two dual-core Arm R5F clusters/subsystems,
with 2 R5F cores each, one in each of the MCU and MAIN voltage domains.

These clusters are a revised IP version compared to those present on
J721E SoCs. Update the K3 R5F remoteproc bindings with the compatible
info relevant to these R5F clusters/subsystems on K3 J7200 SoCs.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index 4069f0f5e8fa..d905d614502b 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -32,6 +32,7 @@ properties:
     enum:
       - ti,am654-r5fss
       - ti,j721e-r5fss
+      - ti,j7200-r5fss
 
   power-domains:
     description: |
@@ -95,6 +96,7 @@ patternProperties:
         enum:
           - ti,am654-r5f
           - ti,j721e-r5f
+          - ti,j7200-r5f
 
       reg:
         items:
-- 
2.28.0

