Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC3AC433FE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Feb 2022 08:12:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbiBPIND (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Feb 2022 03:13:03 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbiBPINA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Feb 2022 03:13:00 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF4817226F;
        Wed, 16 Feb 2022 00:12:48 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21G8CfOT020144;
        Wed, 16 Feb 2022 02:12:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1644999161;
        bh=L3o6viKp+9KP+Ivv8wMZofS9DdBqsiGNMjqvAUCvnec=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=uIBjswu6fJqUiDp1DWkFd0gpTvEvi9Y9PLk9Gm1YqD0Ft2q9/8gv6XzrCmUK1pWmR
         14iC7DaBBvyzNOFMQ3mFuha2ECqkecQ2OiCZGUp44ocnEYmwUZfUJD9h5ZetcIx1/n
         EQLx4Wj2KuYGW3HF/wuzEMAb7RXw/1pFBZlNfHq4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21G8CfSh009945
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Feb 2022 02:12:41 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 16
 Feb 2022 02:12:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 16 Feb 2022 02:12:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21G8CdW4032955;
        Wed, 16 Feb 2022 02:12:40 -0600
From:   Puranjay Mohan <p-mohan@ti.com>
To:     <kishon@ti.com>, <vigneshr@ti.com>, <s-anna@ti.com>,
        <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     Puranjay Mohan <p-mohan@ti.com>
Subject: [PATCH v5 2/2] remoteproc: wkup_m3: Set sysfs_read_only flag
Date:   Wed, 16 Feb 2022 13:42:24 +0530
Message-ID: <20220216081224.9956-3-p-mohan@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220216081224.9956-1-p-mohan@ti.com>
References: <20220216081224.9956-1-p-mohan@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The Wakeup M3 remote processor is controlled by the wkup_m3_ipc
client driver, so set the newly introduced 'sysfs_read_only' flag
to not allow any overriding of the remoteproc firmware, state,
recovery, or coredump from userspace.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
Changes in v4->v5
rename deny_sysfs_ops to sysfs_read_only
---
drivers/remoteproc/wkup_m3_rproc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index 484f7605823e..a0c204cb0979 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -163,6 +163,7 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 	}
 
 	rproc->auto_boot = false;
+	rproc->sysfs_read_only = true;
 
 	wkupm3 = rproc->priv;
 	wkupm3->rproc = rproc;
-- 
2.17.1

