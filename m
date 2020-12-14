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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D18C4361B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Dec 2020 05:11:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A10F822472
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Dec 2020 05:11:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgLNFLp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Dec 2020 00:11:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgLNFLp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Dec 2020 00:11:45 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5BDC0613CF
        for <linux-remoteproc@vger.kernel.org>; Sun, 13 Dec 2020 21:11:05 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id o9so4256641yba.4
        for <linux-remoteproc@vger.kernel.org>; Sun, 13 Dec 2020 21:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=fgDcU1+oW2fdsmRYSzA1iVZIhvNfGHQmRRDgjGCVILY=;
        b=FSUxYP1MqGPvbTcmRAbdlr1QlCR3wVcjs0XvfBgYfJnjiAp/nm2d4PYU+9/Kfkmxcb
         bd6mQWPPOJ6sn4wlk0+9eQl9jNb+a5iCHySTv8dQy+6y9KZC8YLoi8ZzPMi0o10tsfY+
         QWu7XNiOsufywy7Y4edFNElO8q2w5aNnX1+b0EeSQww/ypEQV4x5OUIgS8OMlr5N1SeN
         IND0dcxvwMuz0mcuFFsfTGApyQdVLx6B0G21/ag2opRZZmF0LZm8jGGkeIbLFo2JOQvI
         X7XWT+fHz/HqzwQrhwAWgm7/VfX8qnDC031Z0ONimpTmHYyvHgYihCH0Sy9Uv/nv7h8A
         B1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=fgDcU1+oW2fdsmRYSzA1iVZIhvNfGHQmRRDgjGCVILY=;
        b=KfcX6Ea93qaKj64skZYiSOp8Gw/y+4Mzg87HwZCanAf93BBbq3Odtm9nFrRq0FgG0+
         HrkBsyG+QopF2MaWXVA0rFO4ECA2zcc8mA/m2VpO/kgtdD+Z92Rkz4vQqbCxwjX+McLO
         P5wtXJUH+5quKdBBPBgEq9SqfDL+4w+nFAPcE6yxvoitIt9goJqsGAWy0uLnMBgHdNxl
         5uVLLyTHv4or3ivTxWzqtQW3kkGV75GhIdqnphvW9ADp4/WySevW52fD29LT+gXwWlaW
         7m2+n9Da+2aMPDhRmUsMCshJGraIwT32BW8sK6d5u6bNorrf4xSYK726MLfit0WePQSx
         hk0A==
X-Gm-Message-State: AOAM533qDGcilSOqr8s0gu71PzXgfHf8EdhVQ5n/RcXRzOON3915is7W
        YZA1D9gC6B2qS3mRDO1qK/ZhNjGs+tZf
X-Google-Smtp-Source: ABdhPJzrnWMwRRK57Q5VAbPJn0pCX1fnZeJ9HQg3zGBuhiUBKMRNDFguMlUZZwjTydDnOzvzLGAv5hLAYEFL
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:f20a:: with SMTP id
 i10mr33399723ybe.37.1607922664156; Sun, 13 Dec 2020 21:11:04 -0800 (PST)
Date:   Mon, 14 Dec 2020 13:10:47 +0800
Message-Id: <20201214051047.859110-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH] remoteproc/mediatek: enable MPU for all memory regions in
 MT8192 SCP
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Enables MPU for all memory regions in MT8192 SCP.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_common.h | 1 +
 drivers/remoteproc/mtk_scp.c    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 94bc54b224ee..5f7cd2336cef 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -47,6 +47,7 @@
 
 #define MT8192_CORE0_SW_RSTN_CLR	0x10000
 #define MT8192_CORE0_SW_RSTN_SET	0x10004
+#define MT8192_CORE0_MEM_ATT_PREDEF	0x10008
 #define MT8192_CORE0_WDT_CFG		0x10034
 
 #define SCP_FW_VER_LEN			32
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index f025aba67abc..130c0b9511df 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -369,6 +369,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	mt8192_power_on_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
 	mt8192_power_on_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
 
+	/* enable MPU for all memory regions */
+	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
+
 	return 0;
 }
 
-- 
2.29.2.684.gfbc64c5ab5-goog

