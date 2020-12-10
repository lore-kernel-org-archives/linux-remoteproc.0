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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0887DC4361B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 05:42:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBC4823D37
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 05:42:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgLJFmO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Dec 2020 00:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbgLJFmO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 00:42:14 -0500
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C05C0613CF
        for <linux-remoteproc@vger.kernel.org>; Wed,  9 Dec 2020 21:41:33 -0800 (PST)
Received: by mail-pg1-x549.google.com with SMTP id z24so2956618pgu.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Dec 2020 21:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=9quLWJEm+rPvZAGQXcN5gOWEhxtotZRuaHXyV7zIGTY=;
        b=XwleTwVI+9B1jHssMZnSKNKiN15cvKrAwjY55YjpspYNEBIVxBM8XUEMIb4fMhVM4+
         4hDHcCXML2YInFBu1CbhuseIIDxPkQE1QZYVLH8vH/ko8JxzkF7Lfn7/t1viQhw2pJy8
         nLECRbUz+WDonYzm/grwNNvA2a+z+tyazVbAKp9UHBrw/ZuQCSLMtz2fCcDDT0h1zOoM
         pBo6yOFxmQDp3TeBXNaPOE1HvkIow4I0OKSONq7fQ4li1ps0meT8pK74OCBtRbjHVYUT
         rgiorFxnNRyubCKv+ipiRbO8Q3XmlawYZNXXz1wnBwos6M3IQ6QWvQuuCWmQN5u1/Kwj
         ZKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=9quLWJEm+rPvZAGQXcN5gOWEhxtotZRuaHXyV7zIGTY=;
        b=nojVqDl7X41DykATrSPnHEi+HCZDOLrKsFXf1haTg/ksCDl/fHiCJa+OV/Fxv+GhgV
         siFfYVdE5rrWCgzhHPNsjQbRq9w5TvrcMHlVbhLBxHZ1NyswIiGBew4/y9zxNSNve+g6
         HgfXob1MdXUCqFSNLz5AJGC+0OHJTwuUyQBRfJ9iFcu1tbddSsOiV4f38AwYmKSgxjSH
         Pk2gUrJpGrLjHpnkK9fDEIF7qOw+bfYd9kmo4nUZTQnEhMnpV0N+WsruAlUDNUxWDads
         nLujBEE6EcY6qbLOkhV7v3XNDnp0ibN5dO1TD30mEjEq/lRwYbBM7oetxbILg8gY6zDM
         p3hA==
X-Gm-Message-State: AOAM533p8YuWJCytJq0r68rVRw8ISf1BFQ/06G7prOUfMEvOIG8Gt1s+
        Igh07OMDwdxMV6w/JS3ijeaCfoNzTd+F
X-Google-Smtp-Source: ABdhPJz6L6x6bm6k7FONoJ2bdSKbOIfOGHcWhhpnDLyuHCx3UBkzC91bCPbNWUXMoMwPnamDKbYrlHRGavac
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:902:a986:b029:db:cb2b:8bdb with SMTP
 id bh6-20020a170902a986b02900dbcb2b8bdbmr5016734plb.40.1607578893170; Wed, 09
 Dec 2020 21:41:33 -0800 (PST)
Date:   Thu, 10 Dec 2020 13:41:09 +0800
Message-Id: <20201210054109.587795-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH] remoteproc/mediatek: change MT8192 CFG register base
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The correct MT8192 CFG register base is 0x20000 off.  Changes the
registers accordingly.

Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_common.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index b3397d327786..fb022ff93dc1 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -32,22 +32,22 @@
 #define MT8183_SCP_CACHESIZE_8KB	BIT(8)
 #define MT8183_SCP_CACHE_CON_WAYEN	BIT(10)
 
-#define MT8192_L2TCM_SRAM_PD_0		0x210C0
-#define MT8192_L2TCM_SRAM_PD_1		0x210C4
-#define MT8192_L2TCM_SRAM_PD_2		0x210C8
-#define MT8192_L1TCM_SRAM_PDN		0x2102C
-#define MT8192_CPU0_SRAM_PD		0x21080
-
-#define MT8192_SCP2APMCU_IPC_SET	0x24080
-#define MT8192_SCP2APMCU_IPC_CLR	0x24084
+#define MT8192_L2TCM_SRAM_PD_0		0x10C0
+#define MT8192_L2TCM_SRAM_PD_1		0x10C4
+#define MT8192_L2TCM_SRAM_PD_2		0x10C8
+#define MT8192_L1TCM_SRAM_PDN		0x102C
+#define MT8192_CPU0_SRAM_PD		0x1080
+
+#define MT8192_SCP2APMCU_IPC_SET	0x4080
+#define MT8192_SCP2APMCU_IPC_CLR	0x4084
 #define MT8192_SCP_IPC_INT_BIT		BIT(0)
-#define MT8192_SCP2SPM_IPC_CLR		0x24094
-#define MT8192_GIPC_IN_SET		0x24098
+#define MT8192_SCP2SPM_IPC_CLR		0x4094
+#define MT8192_GIPC_IN_SET		0x4098
 #define MT8192_HOST_IPC_INT_BIT		BIT(0)
 
-#define MT8192_CORE0_SW_RSTN_CLR	0x30000
-#define MT8192_CORE0_SW_RSTN_SET	0x30004
-#define MT8192_CORE0_WDT_CFG		0x30034
+#define MT8192_CORE0_SW_RSTN_CLR	0x10000
+#define MT8192_CORE0_SW_RSTN_SET	0x10004
+#define MT8192_CORE0_WDT_CFG		0x10034
 
 #define SCP_FW_VER_LEN			32
 #define SCP_SHARE_BUFFER_SIZE		288
-- 
2.29.2.576.ga3fc446d84-goog

