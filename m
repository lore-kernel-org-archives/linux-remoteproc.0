Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE3CC433E6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:23:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FD772073C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:23:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbhA0IXB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Jan 2021 03:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbhA0IVc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jan 2021 03:21:32 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F4AC0613D6
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jan 2021 00:20:51 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id f127so1609423ybf.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jan 2021 00:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=m63EAmeXqIPZihoN5M7lU0BGu+fGoCuFKs5wvqm9uCA=;
        b=A38tSlugr9efDA+LeHkBD/HUda1hBTlNbl7J32yuQz1GqzRWG8F58h/i1UGyDUEepF
         +ClPSZhqCa0Mu2UWQl4mFrhisFN2pM+cto10cgBLwrZFkG4+dlu97XDYTRGx7Dj48N1n
         fWYGVmUrPGwPkqomLxlUN+TGFAYnmZSnNgQbtOky9TVF7dxVAtR8hY0NDmcdcB1dZoMA
         O7u4Ii3AYfhqAG6E2MozUXAIBh4+/23JhFRQiij3ZgSq9OyCSSTBASlk1NbRN7lc635s
         x9xjeZWshFWULgKzpV56PWfVpX3Xgnn/y940vBQ8Ygb+wUuxwo6VyYEERswUpILwKICU
         fBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=m63EAmeXqIPZihoN5M7lU0BGu+fGoCuFKs5wvqm9uCA=;
        b=Wxmcgc441O1XDDi3EmtnpW58GvYD9A+G4Ys4E/uA7SC6KeksOLPE3clLsMLBfi0LD9
         +exCUV26Flm+SDvQ/ake0FvoBnaH6FQ3UaFdo4qDae0bNiQ47F2y8NQsebu8NlE42pGE
         Cg1yLEkofzZAlsvdSgm+ClZWYxuvg9YH+ytAsBP1moAArJFul8+t1EmGpmVkLzktluuA
         aYAf5tRFA8yojcNnonTLqZzJTKry2Bvh2PdBMNZp+vOALwmkEJD9uTsTlXg6XKupr0bx
         VnsTbW2xWd4jX2InPMKntHhSQFdr/86IN//GONUM2zNXBamO/dp55PoFahwbmaXSpll2
         SQ9w==
X-Gm-Message-State: AOAM532Y79jzBWcRrPIYKl5TFQQCNhQQ23BoiKUzawg3gqF/Ft6TRaA5
        USBMpL0ad74IIsj/kHv1Fm6z0NipP1He
X-Google-Smtp-Source: ABdhPJynQgwplEBxjt9UAAah6WMRYX2BQntT4VDdhIhRFxcAABTS8xP8M0U6ru671sdENwBgDKegwjsfmrsK
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:d17d:c7bb:69a2:7e2f])
 (user=tzungbi job=sendgmr) by 2002:a25:b8ca:: with SMTP id
 g10mr13488161ybm.517.1611735651150; Wed, 27 Jan 2021 00:20:51 -0800 (PST)
Date:   Wed, 27 Jan 2021 16:20:46 +0800
Message-Id: <20210127082046.3735157-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH] remoteproc/mediatek: acknowledge watchdog IRQ after handled
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Acknowledges watchdog IRQ after handled or kernel keeps receiving the
interrupt.

Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_common.h |  1 +
 drivers/remoteproc/mtk_scp.c    | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 988edb4977c3..bcab38511bf3 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -47,6 +47,7 @@
 
 #define MT8192_CORE0_SW_RSTN_CLR	0x10000
 #define MT8192_CORE0_SW_RSTN_SET	0x10004
+#define MT8192_CORE0_WDT_IRQ		0x10030
 #define MT8192_CORE0_WDT_CFG		0x10034
 
 #define SCP_FW_VER_LEN			32
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e0c235690361..eba825b46696 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -197,17 +197,19 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
 
 	scp_to_host = readl(scp->reg_base + MT8192_SCP2APMCU_IPC_SET);
 
-	if (scp_to_host & MT8192_SCP_IPC_INT_BIT)
+	if (scp_to_host & MT8192_SCP_IPC_INT_BIT) {
 		scp_ipi_handler(scp);
-	else
-		scp_wdt_handler(scp, scp_to_host);
 
-	/*
-	 * SCP won't send another interrupt until we clear
-	 * MT8192_SCP2APMCU_IPC.
-	 */
-	writel(MT8192_SCP_IPC_INT_BIT,
-	       scp->reg_base + MT8192_SCP2APMCU_IPC_CLR);
+		/*
+		 * SCP won't send another interrupt until we clear
+		 * MT8192_SCP2APMCU_IPC.
+		 */
+		writel(MT8192_SCP_IPC_INT_BIT,
+		       scp->reg_base + MT8192_SCP2APMCU_IPC_CLR);
+	} else {
+		scp_wdt_handler(scp, scp_to_host);
+		writel(1, scp->reg_base + MT8192_CORE0_WDT_IRQ);
+	}
 }
 
 static irqreturn_t scp_irq_handler(int irq, void *priv)
-- 
2.30.0.280.ga3ce27912f-goog

