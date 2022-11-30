Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CD4C4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Nov 2022 13:41:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiK3NlY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Nov 2022 08:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbiK3NlV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Nov 2022 08:41:21 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448973120A;
        Wed, 30 Nov 2022 05:41:13 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AUDesue103885;
        Wed, 30 Nov 2022 07:40:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1669815654;
        bh=Kf1pIXpN21OjccmnsgL0LDVDoAD1f4YAe6WMVl1iv9w=;
        h=From:To:CC:Subject:Date;
        b=DEobdYL+lhU4/vel/odWqLQt6m3kCXWQW0HQIqRxSib8sYkn6m1y0eNogGehZUbX+
         BvY4vATi63w/H9iFFwY0Bc8/oaCFs0DCVqsqqrIyiiIGBzhBF3IqJpNUU3f0mzQKbH
         AvbakS9QpymaVOSBmRB09kvNLlb7V828ml797bzs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AUDessL112391
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Nov 2022 07:40:54 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 30
 Nov 2022 07:40:54 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 30 Nov 2022 07:40:54 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AUDerPu079102;
        Wed, 30 Nov 2022 07:40:54 -0600
From:   Devarsh Thakkar <devarsht@ti.com>
To:     <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <p.zabel@pengutronix.de>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <s-anna@ti.com>
CC:     <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <hnagalla@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>
Subject: [PATCH v2 0/2] Add single core R5F IPC for AM62 SoC family
Date:   Wed, 30 Nov 2022 19:10:50 +0530
Message-ID: <20221130134052.7513-1-devarsht@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

AM62 SoC family don't have a R5F cluster, instead they have a single
core R5F. This enables IPC support with single core R5F for AM62
family of SoCs.

Devarsh Thakkar (2):
  Documentation: dt-bindings: k3-r5f-rproc: Add new compatible for AM62
    SoC family
  remoteproc: k3-r5: Use separate compatible string for TI AM62 SoC
    family

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 48 +++++++++++-----
 drivers/remoteproc/ti_k3_r5_remoteproc.c      | 55 +++++++++++++++----
 2 files changed, 77 insertions(+), 26 deletions(-)

-- 
2.17.1

