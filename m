Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37F3C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Apr 2022 08:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359435AbiD0Iif (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Apr 2022 04:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359431AbiD0Iif (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Apr 2022 04:38:35 -0400
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82EBC41F96;
        Wed, 27 Apr 2022 01:35:23 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23R8ZFvW087644;
        Wed, 27 Apr 2022 03:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1651048515;
        bh=FacmxPfefrEWneqx3G+QeibL9rMwFRlRDEBR402Xf6w=;
        h=From:To:CC:Subject:Date;
        b=v4NnyNmCh0LVCPdlJ4bNJpsNvzX2bglVX4Lz86HB1bzqb1OFzbGD9MjeQ2loXVeik
         y6P23dkvn0VqY+oOzEd9+WXejPGDXJCGLQZa5VJm1Vl/IKPmxPRJqJKFs8m8jncRot
         z2ockmVeKEllfIjO3PKYildwyWNQU2hdpU0yl3xA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23R8ZFZo023086
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 27 Apr 2022 03:35:15 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 03:35:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 03:35:14 -0500
Received: from a0393678ub.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23R8ZBCf009219;
        Wed, 27 Apr 2022 03:35:12 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Suman Anna <s-anna@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 0/2] remoteproc: pru: Enable PRU cores on K3 AM62x SoCs
Date:   Wed, 27 Apr 2022 14:05:07 +0530
Message-ID: <20220427083509.14458-1-kishon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Series adds AM62x specific compatible string to enable PRUSS-M in
AM62x SoCs.

Kishon Vijay Abraham I (2):
  dt-bindings: remoteproc: pru: Update bindings for K3 AM62x SoCs
  remoteproc: pru: Add support for various PRU cores on K3 AM62x SoCs

 Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml | 1 +
 drivers/remoteproc/pru_rproc.c                                 | 1 +
 2 files changed, 2 insertions(+)

-- 
2.17.1

