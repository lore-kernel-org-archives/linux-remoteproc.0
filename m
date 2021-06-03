Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A878CC47096
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Jun 2021 14:42:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DC72613DE
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Jun 2021 14:42:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhFCOog (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 3 Jun 2021 10:44:36 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57238 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhFCOog (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Jun 2021 10:44:36 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 153EgOXB104770;
        Thu, 3 Jun 2021 09:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622731344;
        bh=8Ijv9UhqrX4N4JBpKzCRsR+ej46JBo6anCxAPeEUMPQ=;
        h=From:To:CC:Subject:Date;
        b=q9XSpqFptmst7UmoFKzsfIWJFK7OUdT/oIPVqFHtK3OQpPiLUocAMH6GkKCAfau3p
         ujJBD1j0Bn0N8WaY/HzJnsrIUe/xBTbVcHlkMlsuj7Qn8gkBIQhKr8lhVSZt8SwSI8
         sP9Zr9C4j4fd04rfBpYToFeEc1NbARZk8vejoBVg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 153EgOgQ078876
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Jun 2021 09:42:24 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 3 Jun
 2021 09:42:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 3 Jun 2021 09:42:24 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 153EgOGP078619;
        Thu, 3 Jun 2021 09:42:24 -0500
Received: from localhost ([10.250.35.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 153EgOTq031160;
        Thu, 3 Jun 2021 09:42:24 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wilken Gottwalt <wilken.gottwalt@posteo.net>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, <devicetree@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [RFC PATCH] dt-bindings: hwlock: sun6i: Fix various warnings in binding
Date:   Thu, 3 Jun 2021 09:42:16 -0500
Message-ID: <20210603144216.10327-1-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The allwinner,sun6i-a31-hwspinlock.yaml binding has a mismatched
$id and fails to compile the example due to undefined args specifier
values for clocks and resets. Fix both of these issues.

Fixes: f9e784dcb63f ("dt-bindings: hwlock: add sun6i_hwspinlock")
Signed-off-by: Suman Anna <s-anna@ti.com>
---
Hi Wilken,

This fixes the warnings for now on linux-next, but I think the example
should be including sun6i-a31-ccu.h files instead to be accurate, and
those files are missing the definitions for CLK_BUS_SPINLOCK and
RST_BUS_SPINLOCK. Feel free to send a newer version or do an incremental
patch on top.

regards
Suman

 .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
index 733c3d01e56c..10e5a53e447b 100644
--- a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/hwlock/allwinner,sun6i-hwspinlock.yaml#
+$id: http://devicetree.org/schemas/hwlock/allwinner,sun6i-a31-hwspinlock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: SUN6I hardware spinlock driver for Allwinner sun6i compatible SoCs
@@ -36,6 +36,9 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/sun8i-a23-a33-ccu.h>
+    #include <dt-bindings/reset/sun8i-a23-a33-ccu.h>
+
     hwlock@1c18000 {
         compatible = "allwinner,sun6i-a31-hwspinlock";
         reg = <0x01c18000 0x1000>;
-- 
2.30.1

