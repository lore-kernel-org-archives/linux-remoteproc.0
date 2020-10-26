Return-Path: <SRS0=//YT=EB=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BE9C2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Oct 2020 16:05:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D53D322450
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Oct 2020 16:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603728340;
	bh=q/sLyZoxAzN0WQctrlHt+ewBfmRDQkL2JNNfDqnhmeg=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=zgOn43ejtx9KdTWxq/oOyjdVMQPwT1VBv00hrfLHzxkZGTTDkdlPQbOSbGUh0j3NW
	 yJo6dl2ByGyWZXHgIPQwgSrM28YqNSo/uHY/5BOmeYZfss54u4P3NmXdq5C1lnDQh0
	 +4E4ew2SHoPVcvbDgWsvSZsqSecQDmG035Wjc0Ck=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1784923AbgJZQFk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Oct 2020 12:05:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:51676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1784922AbgJZQFk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Oct 2020 12:05:40 -0400
Received: from localhost.localdomain (unknown [192.30.34.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BBDD922409;
        Mon, 26 Oct 2020 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603728339;
        bh=q/sLyZoxAzN0WQctrlHt+ewBfmRDQkL2JNNfDqnhmeg=;
        h=From:To:Cc:Subject:Date:From;
        b=TcEjf6oDy/GWhQ4DvDQy3OR3ocnpBES8xgp+3A25JN0VPqEyjdYePKix6Fw/TJhdI
         8Kzxa/U3iJYx3Eh3ohScJhnR2UJiYzdCg5dFIGOv2XSuroEYCo4jugJZEHHbLBDfEf
         TkK67pjKsjwSPngA/HXWkbmabEYJbjwXyLP2NkWk=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Suman Anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: ti_k3: fix -Wcast-function-type warning
Date:   Mon, 26 Oct 2020 17:05:23 +0100
Message-Id: <20201026160533.3705998-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The function cast causes a warning with "make W=1"

drivers/remoteproc/ti_k3_r5_remoteproc.c: In function 'k3_r5_probe':
drivers/remoteproc/ti_k3_r5_remoteproc.c:1368:12: warning: cast between incompatible function types from 'int (*)(struct platform_device *)' to 'void (*)(void *)' [-Wcast-function-type]

Rewrite the code to avoid the cast, and fix the incorrect return
type of the callback.

Fixes: 6dedbd1d5443 ("remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index d9307935441d..40fa7a4d2ec8 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -940,9 +940,9 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 	return ret;
 }
 
-static int k3_r5_cluster_rproc_exit(struct platform_device *pdev)
+static void k3_r5_cluster_rproc_exit(void *data)
 {
-	struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
+	struct k3_r5_cluster *cluster = platform_get_drvdata(data);
 	struct k3_r5_rproc *kproc;
 	struct k3_r5_core *core;
 	struct rproc *rproc;
@@ -967,8 +967,6 @@ static int k3_r5_cluster_rproc_exit(struct platform_device *pdev)
 		rproc_free(rproc);
 		core->rproc = NULL;
 	}
-
-	return 0;
 }
 
 static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
@@ -1255,9 +1253,9 @@ static void k3_r5_core_of_exit(struct platform_device *pdev)
 	devres_release_group(dev, k3_r5_core_of_init);
 }
 
-static void k3_r5_cluster_of_exit(struct platform_device *pdev)
+static void k3_r5_cluster_of_exit(void *data)
 {
-	struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
+	struct k3_r5_cluster *cluster = platform_get_drvdata(data);
 	struct platform_device *cpdev;
 	struct k3_r5_core *core, *temp;
 
@@ -1351,9 +1349,7 @@ static int k3_r5_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_add_action_or_reset(dev,
-				       (void(*)(void *))k3_r5_cluster_of_exit,
-				       pdev);
+	ret = devm_add_action_or_reset(dev, k3_r5_cluster_of_exit, pdev);
 	if (ret)
 		return ret;
 
@@ -1364,9 +1360,7 @@ static int k3_r5_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_add_action_or_reset(dev,
-				       (void(*)(void *))k3_r5_cluster_rproc_exit,
-				       pdev);
+	ret = devm_add_action_or_reset(dev, k3_r5_cluster_rproc_exit, pdev);
 	if (ret)
 		return ret;
 
-- 
2.27.0

