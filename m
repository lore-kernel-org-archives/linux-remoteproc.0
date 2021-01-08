Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED27C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Jan 2021 08:19:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43800235F7
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Jan 2021 08:19:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbhAHITO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Jan 2021 03:19:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727169AbhAHITO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Jan 2021 03:19:14 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C931C0612FA
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Jan 2021 00:18:01 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id w17so3736737qta.20
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Jan 2021 00:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=R57CcAcJp5uD5dq5EWgT5pOw4gxHlrQ3Su0vEVAHoVA=;
        b=BwTJuMFDGoSghD5LbsH5Cw7LX0/rKMZncBvaYZmRRftCpPS9ikO90ooY3zKsdBHh0R
         CWQ4iBzzkqTJ39D0Yw4W6CAF5nepOQ+ExE7x9ZiXEDenNPmY3P9HZigEYXbkFkkHNsSU
         SJXVByg5dPtfQXULAO04yhngGjj2YUq7Sv4aqVoQlhd4ahZQia3YHUOrbgHirzEep4Qi
         bUbwkQyT5tM/KCUUj4xsczk/IsYJ/zjKkdFcukHKGbmz5KoJMoWo/nTusrS7wY71Zg4T
         c5adwvygIR9zH2k8XCT4ixdFebAy+5sDWfL7DoGk0iuA1ly9FHeF++vt2ORArBYSCTlW
         L9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=R57CcAcJp5uD5dq5EWgT5pOw4gxHlrQ3Su0vEVAHoVA=;
        b=uMfYkHP5cVl4u0s4MrpYOGVkL1W0yCJ70dLCOfOe2oWDxOkGKQOPUlh+ogX1aWlbPH
         msvbNrTYmlshJqBwaq/hKxkuLHwI/9ECVuhTiDgvkjLZHrJJeVsjVxgQeQOrq4cG8u3E
         64XmedoIZgIRRBlEz3wIbowXK1cIgAh50av+YklAo3OBf2byjzUqXOnUH3oX5Sz8emr9
         4wSCgvLK6M5WOcuDn3yOxbnfKjm3TzePA1pW1fGy7SKzH0JYLiEj0h3OCL0ufyou7GJr
         B0An3XVumD4qXFrNG00f0vddlI2edYTgVez+zI9xeIpTI9luhN95FM+ZLneAY2QbkV1D
         AukA==
X-Gm-Message-State: AOAM532YLI96kDS4iP3GTUNTG1ygq1LLFcUNFQbkGyh9QARZujW/9In+
        jRKtOV3ubrdAZJiwy27UZIkN8Fh850lY
X-Google-Smtp-Source: ABdhPJwHhuxkzvvD6e9WI7V4kGI7pAXOpvrQPy2rirJ5V9r+aLhmL4ro1CwshF/ltrcIA1JYp9UCtMgshgTP
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:f185:: with SMTP id
 m5mr5692827qvl.19.1610093880727; Fri, 08 Jan 2021 00:18:00 -0800 (PST)
Date:   Fri,  8 Jan 2021 16:17:36 +0800
In-Reply-To: <20210108081738.2175224-1-tzungbi@google.com>
Message-Id: <20210108081738.2175224-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20210108081738.2175224-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v2 2/4] remoteproc/mediatek: enable MPU for all memory regions
 in MT8192 SCP
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, mathieu.poirier@linaro.org,
        devicetree@vger.kernel.org, tzungbi@google.com,
        stable@vger.kernel.org
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

Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
Cc: <stable@vger.kernel.org> # v5.10+
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from previous version[1]:
- Adds Fixes and Cc tags.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=410291

 drivers/remoteproc/mtk_common.h | 1 +
 drivers/remoteproc/mtk_scp.c    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 988edb4977c3..661c998288d7 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -47,6 +47,7 @@
 
 #define MT8192_CORE0_SW_RSTN_CLR	0x10000
 #define MT8192_CORE0_SW_RSTN_SET	0x10004
+#define MT8192_CORE0_MEM_ATT_PREDEF	0x10008
 #define MT8192_CORE0_WDT_CFG		0x10034
 
 #define SCP_FW_VER_LEN			32
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 1f0ed2974d5c..c33c41fe54cd 100644
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
2.29.2.729.g45daf8777d-goog

