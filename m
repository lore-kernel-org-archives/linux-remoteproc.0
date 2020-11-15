Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD74C2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Sun, 15 Nov 2020 11:51:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85218222C4
	for <linux-remoteproc@archiver.kernel.org>; Sun, 15 Nov 2020 11:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgKOLvH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 15 Nov 2020 06:51:07 -0500
Received: from aposti.net ([89.234.176.197]:40412 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbgKOLvH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 15 Nov 2020 06:51:07 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     od@zcrc.me, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] remoteproc: Add module parameter 'auto_boot'
Date:   Sun, 15 Nov 2020 11:50:56 +0000
Message-Id: <20201115115056.83225-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Until now the remoteproc core would always default to trying to boot the
remote processor at startup. The various remoteproc drivers could
however override that setting.

Whether or not we want the remote processor to boot, really depends on
the nature of the processor itself - a processor built into a WiFi chip
will need to be booted for the WiFi hardware to be usable, for instance,
but a general-purpose co-processor does not have any predeterminated
function, and as such we cannot assume that the OS will want the
processor to be booted - yet alone that we have a single do-it-all
firmware to load.

Add a 'auto_boot' module parameter that instructs the remoteproc whether
or not it should auto-boot the remote processor, which will default to
"true" to respect the previous behaviour.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/remoteproc/remoteproc_core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index dab2c0f5caf0..687b1bfd49db 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -44,6 +44,11 @@
 
 #define HIGH_BITS_MASK 0xFFFFFFFF00000000ULL
 
+static bool auto_boot = true;
+module_param(auto_boot, bool, 0400);
+MODULE_PARM_DESC(auto_boot,
+		 "Auto-boot the remote processor [default=true]");
+
 static DEFINE_MUTEX(rproc_list_mutex);
 static LIST_HEAD(rproc_list);
 static struct notifier_block rproc_panic_nb;
@@ -2176,7 +2181,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 		return NULL;
 
 	rproc->priv = &rproc[1];
-	rproc->auto_boot = true;
+	rproc->auto_boot = auto_boot;
 	rproc->elf_class = ELFCLASSNONE;
 	rproc->elf_machine = EM_NONE;
 
-- 
2.29.2

