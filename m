Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23F8C4742C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 04:42:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FCE62067C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 04:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SeNYLc8f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgKPEll (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 15 Nov 2020 23:41:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgKPElk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 15 Nov 2020 23:41:40 -0500
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD73C0613CF
        for <linux-remoteproc@vger.kernel.org>; Sun, 15 Nov 2020 20:41:40 -0800 (PST)
Received: by mail-qv1-xf4a.google.com with SMTP id a1so10010792qvj.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 15 Nov 2020 20:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=L/Hyw/5+8FMUHf9mlyLFosllpkdODuY36N0muhsO6pA=;
        b=SeNYLc8fPYeyODSSnn1j21NFYkp7g/V5aMDLV0HHM1cBZmtQ2Bnf4sGVEASUx5KmE9
         Dqr9K5ty4NXeWgjVnd/HV44Z0Ctj2D4k8AenVb+e1dCuF3xDE2wfwkwxiwd2cP0CVtY6
         iLnimhDAo1SZhpP4DwwunMbJOWu1dXV1oG2lcgWjD1SqDxrZvu6Z7ORHlRuDF1QjbjLX
         pOztEbUe6UHvG9qTI4FOu8nzJYDCGQ0rAuWWXxXmvHNDupIgz0C8oihmhOU9gd3PV0Ie
         X5sbzqduT1JY5ct5zuLUzS1CNVNG2EW1wPvTudw2mbCWWy1fJB0FoMwTaK0W1OH9VqRL
         Tfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=L/Hyw/5+8FMUHf9mlyLFosllpkdODuY36N0muhsO6pA=;
        b=GybH+qJd67i3stGg544vyZ4du0udPrSMcwqf54fLyAlBVlqsNUmVDJAAHFeGLHQCJ/
         uVTfBSkr2Cn17gpznFpls6QcPGFmJhOgBrl4J8nyBHFCRgQk5OK22kIhlPc72Xv/AaZP
         hS0+nyC2R6W+xAGXAlasNKzMRNjE+Vlm3znypkW34a9KxRGxQDpLqJukQEmNDZ6FR2lw
         B8huPjUjYJSLwbswdj4/2mWzr0rsn6xXnOBa4ByDxGcfS4T0SF0vKaS6cn/xRNaGM5qi
         Bol2J4Y1s3rSyBKtG1lv33/qEuclt3e8EDR56eJFsU9TrBq+wPM/Ikke/RrDn6gWgjAY
         ZTPw==
X-Gm-Message-State: AOAM531IaAxlwAv1HwFRjhxSrn68E71cF3hMxpD2KEpdQw7F8k/PBHdN
        JY1dNzXGIOyrvdx0gQVvQuHyEwb9kH86
X-Google-Smtp-Source: ABdhPJwlUZKwFUkd14meTGvBaF1ql7+7WS1zjDUWfkhpwxcXNQ/Bo0bAPkU3d34JO5BbnMTBJc4/2w+bDFTx
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:a0d:: with SMTP id
 dw13mr13692010qvb.54.1605501699533; Sun, 15 Nov 2020 20:41:39 -0800 (PST)
Date:   Mon, 16 Nov 2020 12:41:21 +0800
Message-Id: <20201116044121.2457272-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH] remoteproc/mediatek: fix sparse errors
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, tzungbi@google.com,
        groeck@google.com, pihsun@google.com, drinkcat@google.com,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Fixes the following sparse errors:

warning: incorrect type in argument 2 (different address spaces)
   expected void volatile [noderef] __iomem *addr
   got void *addr
warning: incorrect type in argument 1 (different address spaces)
   expected void *addr
   got void [noderef] __iomem *
warning: incorrect type in assignment (different address spaces)
   expected void [noderef] __iomem *cpu_addr
   got void *
warning: incorrect type in argument 3 (different address spaces)
   expected void *cpu_addr
   got void [noderef] __iomem *cpu_addr

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 577cbd5d421e..99d5a4de3e2f 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -298,7 +298,7 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
 	return 0;
 }
 
-static void mt8192_power_on_sram(void *addr)
+static void mt8192_power_on_sram(void __iomem *addr)
 {
 	int i;
 
@@ -307,7 +307,7 @@ static void mt8192_power_on_sram(void *addr)
 	writel(0, addr);
 }
 
-static void mt8192_power_off_sram(void *addr)
+static void mt8192_power_off_sram(void __iomem *addr)
 {
 	int i;
 
@@ -556,8 +556,9 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 
 	/* Reserved SCP code size */
 	scp->dram_size = MAX_CODE_SIZE;
-	scp->cpu_addr = dma_alloc_coherent(scp->dev, scp->dram_size,
-					   &scp->dma_addr, GFP_KERNEL);
+	scp->cpu_addr = (void __iomem *)dma_alloc_coherent(
+					scp->dev, scp->dram_size,
+					&scp->dma_addr, GFP_KERNEL);
 	if (!scp->cpu_addr)
 		return -ENOMEM;
 
@@ -569,8 +570,8 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
 	if (scp->dram_size == 0)
 		return;
 
-	dma_free_coherent(scp->dev, scp->dram_size, scp->cpu_addr,
-			  scp->dma_addr);
+	dma_free_coherent(scp->dev, scp->dram_size,
+			  (void __force *)scp->cpu_addr, scp->dma_addr);
 	of_reserved_mem_device_release(scp->dev);
 }
 
-- 
2.29.2.299.gdc1121823c-goog

