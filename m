Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5A6C43219
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Feb 2022 12:03:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbiBIMDa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 9 Feb 2022 07:03:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbiBIMDK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Feb 2022 07:03:10 -0500
X-Greylist: delayed 2546 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Feb 2022 03:34:53 PST
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E188CDF28AC9;
        Wed,  9 Feb 2022 03:34:52 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21996EFf090046;
        Wed, 9 Feb 2022 03:06:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1644397574;
        bh=vZWnswFoW5qNOblJvZoycCjjkCTkGBkJNS2nZCj+Hwg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=KbuttjlqOH5cn0/jKQqyDGySCCS6DrAfpKA8kK1fXDwwP+bNeE1gIxAmR36OcYoXE
         SzCJsCtWKrfqFSBSQjZjGokRcH/braWtJJlC264buHZUFv0b9pKqWcwd4eio7bawK5
         7saZ2Fe0sZkmLR0P8F7mlpVLMDakXX44FQD3Sb4M=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21996EVk117791
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Feb 2022 03:06:14 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 9
 Feb 2022 03:06:14 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 9 Feb 2022 03:06:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21996DSi118771;
        Wed, 9 Feb 2022 03:06:13 -0600
From:   Puranjay Mohan <p-mohan@ti.com>
To:     <puranjay12@gmail.com>, <kishon@ti.com>, <vigneshr@ti.com>,
        <s-anna@ti.com>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     Puranjay Mohan <p-mohan@ti.com>
Subject: [PATCH v4 2/2] remoteproc: wkup_m3: Set deny_sysfs_ops flag
Date:   Wed, 9 Feb 2022 14:33:42 +0530
Message-ID: <20220209090342.13220-3-p-mohan@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220209090342.13220-1-p-mohan@ti.com>
References: <20220209090342.13220-1-p-mohan@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The Wakeup M3 remote processor is controlled by the wkup_m3_ipc
client driver, so set the newly introduced 'deny_sysfs_ops' flag
to not allow any overriding of the remoteproc firmware or state
from userspace.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
---
 drivers/remoteproc/wkup_m3_rproc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index 484f7605823e..bbb84bb28af8 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -163,6 +163,7 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 	}
 
 	rproc->auto_boot = false;
+	rproc->deny_sysfs_ops = true;
 
 	wkupm3 = rproc->priv;
 	wkupm3->rproc = rproc;
-- 
2.17.1

