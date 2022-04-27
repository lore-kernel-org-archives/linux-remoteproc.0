Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831FAC433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Apr 2022 08:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359429AbiD0Iif (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Apr 2022 04:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359124AbiD0Iie (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Apr 2022 04:38:34 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF9F641F80;
        Wed, 27 Apr 2022 01:35:22 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23R8ZIvb071615;
        Wed, 27 Apr 2022 03:35:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1651048518;
        bh=/V2lAezG8ZDZkl3aUCo7fcu7p89u7vy2ng7qAeayCao=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=NEsoj7O7B47SPV9Vr2MBuUz74O/oSszCvFJOrZeydqnNOms1fvX2wYiEqWeEV3cHt
         fcMd6AOBq2RWGLpwTk4AXMd3PexZjtsfKBz9dLstAODLTgEQgquFX79sjKbWhZs4Z1
         r7TAg+HDAQ7o/p8y9EgjTJuXG5wGCK8NoTTZ7KmE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23R8ZI74064607
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 27 Apr 2022 03:35:18 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 03:35:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 03:35:17 -0500
Received: from a0393678ub.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23R8ZBCg009219;
        Wed, 27 Apr 2022 03:35:15 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Suman Anna <s-anna@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: pru: Update bindings for K3 AM62x SoCs
Date:   Wed, 27 Apr 2022 14:05:08 +0530
Message-ID: <20220427083509.14458-2-kishon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220427083509.14458-1-kishon@ti.com>
References: <20220427083509.14458-1-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Update the PRU remoteproc bindings for the PRU cores on AM62x SoCs.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
index d7c3a78e37e6..e351550b012c 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
@@ -47,6 +47,7 @@ properties:
       - ti,j721e-pru    # for PRUs in K3 J721E SoC family
       - ti,j721e-rtu    # for RTUs in K3 J721E SoC family
       - ti,j721e-tx-pru # for Tx_PRUs in K3 J721E SoC family
+      - ti,am625-pru    # for PRUs in K3 AM62x SoC family
 
   reg:
     items:
-- 
2.17.1

