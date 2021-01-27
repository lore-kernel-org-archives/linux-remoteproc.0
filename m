Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09310C433E9
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE95D20754
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbhA0Ifk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Jan 2021 03:35:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhA0IdZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jan 2021 03:33:25 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A228BC061788
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jan 2021 00:32:33 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id c12so1674631ybf.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jan 2021 00:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=SmiMh0LR1+qpBQs71pN3MQ5z1dtkmQlW7LOu3fdZxYc=;
        b=rrXwZ9bm2rsHie+KDd9fWKXYVFbzbfhsHlMQSz9gFMUP3reWooj6uuA2HmrOYrLwiq
         kYs86koHVLx0gEw+UWH7PoHcVPLY4AOA0dZnCcgev+X/R/bdnfebMQb7DrovteE/wM1T
         jV98B5EgPoINEulnzdhCIshFSA/EunLfsVSn21Vn6/RACRPvQmFiNU7hJGXsC8BW8/xP
         rwRXE5q7jG1MgI3J21y5/kpGDvzlBGYhNnaTGKDG5mTNlrX2TJFMJaAtv3/Z1mLrWeMO
         6sizgSXNlb/+n/M64KGj3ZPUQ2gJb1DRhbgiYHDPnVciKsjOG3cfs+X2peN5j9PX+X+L
         g9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=SmiMh0LR1+qpBQs71pN3MQ5z1dtkmQlW7LOu3fdZxYc=;
        b=ABGU23fMBP2YbC0kWUkfme5YqdVtrCPqp0EcN/2ip6/riPMN78IwWbpQs1ivPthMlC
         5zey9D5c8bLdy36A3neS+uiQky5Ju1xhD6NJb4TjXLWKmUpBSQ7wIUFR/QJZPJAYWcJB
         Mg2FP8pXq0D6TCZe5TH3Sv2XYTV+dTaHYP5qP8UDTnwQ1vYaDHig8Kgfn9yzlY94Mxh/
         7VuQRSDge7lKDbN/zq4XV+xeHhigLD0xkO70LhqfKiq71CeN7UPLubJkkdR0AMNgOXqI
         u99EJu7lUmjjENfIkA4f0+Ly+ERKKk2pGTD4/Pd8SprqQtwBBZOzrym44g9aVNPIf+oM
         hcjQ==
X-Gm-Message-State: AOAM533hTrL2pVe2y88JnxvhjEaTYwL6eNYUuv1K+RSOvZtIiWMmROHW
        u3WThVxIfO94j1xx+GwK6IdQBBPCrSLW
X-Google-Smtp-Source: ABdhPJyoBFYN8c1zqNrS1+bqbnoMM0Q2Xo7B1whfoExZWSybm5Lh61Rr2MDPRz8tvDy5a2u+4L+Gn8Y+NvHI
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:d17d:c7bb:69a2:7e2f])
 (user=tzungbi job=sendgmr) by 2002:a25:b813:: with SMTP id
 v19mr14700220ybj.178.1611736352922; Wed, 27 Jan 2021 00:32:32 -0800 (PST)
Date:   Wed, 27 Jan 2021 16:31:34 +0800
In-Reply-To: <20210127083136.3745652-1-tzungbi@google.com>
Message-Id: <20210127083136.3745652-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20210127083136.3745652-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v3 2/4] remoteproc/mediatek: enable MPU for all memory regions
 in MT8192 SCP
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, mathieu.poirier@linaro.org,
        devicetree@vger.kernel.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The register MT8192_CORE0_MEM_ATT_PREDEF contains attributes for each
memory region.  It defines whether a memory region can be managed by MPU
or not.

In the past, due to the default settings in the register, MT8192 SCP
works luckily.  After enabling L1TCM, SCP starts to access memory region
that is not included in the default settings.  As a result, SCP hangs.

Enables MPU for all memory regions in MT8192 SCP.

Note that the register is read only once when SCP resets.  Thus, it must
be set from kernel side.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_common.h | 1 +
 drivers/remoteproc/mtk_scp.c    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index bcab38511bf3..204691138677 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -47,6 +47,7 @@
 
 #define MT8192_CORE0_SW_RSTN_CLR	0x10000
 #define MT8192_CORE0_SW_RSTN_SET	0x10004
+#define MT8192_CORE0_MEM_ATT_PREDEF	0x10008
 #define MT8192_CORE0_WDT_IRQ		0x10030
 #define MT8192_CORE0_WDT_CFG		0x10034
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index d83e1164f02f..05b157689121 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -371,6 +371,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	mt8192_power_on_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
 	mt8192_power_on_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
 
+	/* enable MPU for all memory regions */
+	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
+
 	return 0;
 }
 
-- 
2.30.0.280.ga3ce27912f-goog

