Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D584C6FD1F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Mar 2023 18:02:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjCNSCz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Mar 2023 14:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjCNSCy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Mar 2023 14:02:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB834A883B
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Mar 2023 11:02:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc8yz-00018W-9f; Tue, 14 Mar 2023 19:02:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc8yy-0047yk-HR; Tue, 14 Mar 2023 19:02:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc8yx-004sLe-OM; Tue, 14 Mar 2023 19:02:43 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 3/3] hwspinlock: u8500: Convert to platform remove callback returning void
Date:   Tue, 14 Mar 2023 19:02:41 +0100
Message-Id: <20230314180241.2865888-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314180020.2865734-1-u.kleine-koenig@pengutronix.de>
References: <20230314180020.2865734-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=HSK28UWJer9wy6dvxn2/zs3Nb8RRY+sTqfI1QldsPDU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkELa2MkB4WaOBXVMj2GLq1yZJyczHTDKb2DuJg OQ3uErBBxmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBC2tgAKCRDB/BR4rcrs CSSDB/wPmqb7R3opXgRTijrp3oiuSrNy7CpuzrHdtz1/yabiE0moU0ZgS5DPAaMssAYU3mO85tu 6zX8u1iYEXF7aP5pOaZgoOeyJh28JXJ9zRVmR06dg/rox1Xj3UhkAqhmyeBnfjD0agwPyYq50Uk CadgpB3lFp/7XJ9ieCQsekbl2OAhbQxHoTt7x9oQt8KMUGFQBZZ7fTiLHCVItzgSDuGt5dSas3s xYtbcFa+X8epMg7p8SMQ+V2DFziNemPmovJrOLSjqRMARMQ1AUfRyTKB+I5jsStGzyc8dpr4rB9 U7LefKytjxH8ws9ttGRImosr+OwPv8lYDwBCt4t6M+1lwKHs
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwspinlock/u8500_hsem.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwspinlock/u8500_hsem.c b/drivers/hwspinlock/u8500_hsem.c
index 67845c0c9701..1edca1092f29 100644
--- a/drivers/hwspinlock/u8500_hsem.c
+++ b/drivers/hwspinlock/u8500_hsem.c
@@ -120,20 +120,18 @@ static int u8500_hsem_probe(struct platform_device *pdev)
 					 pdata->base_id, num_locks);
 }
 
-static int u8500_hsem_remove(struct platform_device *pdev)
+static void u8500_hsem_remove(struct platform_device *pdev)
 {
 	struct hwspinlock_device *bank = platform_get_drvdata(pdev);
 	void __iomem *io_base = bank->lock[0].priv - HSEM_REGISTER_OFFSET;
 
 	/* clear all interrupts */
 	writel(0xFFFF, io_base + HSEM_ICRALL);
-
-	return 0;
 }
 
 static struct platform_driver u8500_hsem_driver = {
 	.probe		= u8500_hsem_probe,
-	.remove		= u8500_hsem_remove,
+	.remove_new	= u8500_hsem_remove,
 	.driver		= {
 		.name	= "u8500_hsem",
 	},
-- 
2.39.2

