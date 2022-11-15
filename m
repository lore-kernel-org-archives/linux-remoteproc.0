Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C31C4332F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Nov 2022 06:09:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbiKOGJn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Nov 2022 01:09:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiKOGJm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Nov 2022 01:09:42 -0500
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E1A26F4;
        Mon, 14 Nov 2022 22:09:42 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AF69Zdx087472;
        Tue, 15 Nov 2022 00:09:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1668492575;
        bh=Kf1pIXpN21OjccmnsgL0LDVDoAD1f4YAe6WMVl1iv9w=;
        h=From:To:CC:Subject:Date;
        b=ui057dE+rp22o03aDV5fGoiZZAjaI4qSBom4xqqRsrwsm+kREpRHnG/b0bjaYc5Db
         u3LjjpJVa5X42nrxHOfQXz691UkXZQP7BsqbVJ6BxtrkjQntGkrBD7jBTVNaLRcezq
         dxvfpQ8pldGl50oz7iRwQIYM+E+9O6/73XFqYUVs=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AF69Zw5094550
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Nov 2022 00:09:35 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 15
 Nov 2022 00:09:35 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 15 Nov 2022 00:09:35 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AF69YGa120993;
        Tue, 15 Nov 2022 00:09:34 -0600
From:   Devarsh Thakkar <devarsht@ti.com>
To:     <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <p.zabel@pengutronix.de>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-anna@ti.com>
CC:     <hnagalla@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>
Subject: [PATCH 0/2] Add single core R5F IPC for AM62 SoC family
Date:   Tue, 15 Nov 2022 11:39:32 +0530
Message-ID: <20221115060934.13279-1-devarsht@ti.com>
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

