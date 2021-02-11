Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA33C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:49:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D972D64E44
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:49:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbhBKXtx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbhBKXss (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:48:48 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0EEC061A2E
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:38 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id q72so4366195pjq.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=52raNE6Ip4exp7Y9/K/NcM7vSGzuAdV+HOuZ1MCv9VM=;
        b=P1J/bRhyIkT1K7cKFoh+2BHP2oo6M/1O3Ec5B1QZogBLNdi4iWNqnLXlPvAF2WwIgM
         vsLEcoGS0So63cj2Nrdtf5Fvjzq4sU+97ecNOi0WSo5EcW+9WxycBRL2QSA3cD2Yxypw
         /4UmefrsH0MWX0WRLJvIWy++JVaJgDekpX/XeZkyhLf6LQngxfiBTxjliCGTxh1kJbf1
         r+nq6s0YM8i/4cYl+GZkAwmfUQr7uH7VhnfSy9+XHwtfJQsyreZ0WlYq6GqDOICo6rDT
         IWtw+dsu+rsJ+lsKOJXw3tbQMgGFcXrW34S378Ilrgy49bkcjVAihx1KKSgrI/VLETK5
         /X4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=52raNE6Ip4exp7Y9/K/NcM7vSGzuAdV+HOuZ1MCv9VM=;
        b=TCWn0a4Dik7eEstEmwWoYdJWLRvWVtjDcA89F+5R1AhIO7wi1CB0BnuqxvjXeA36UF
         usvqBXAd/kZyRfgW5Zd8XdhY9YYd75C0aoRv37sLBKocxP4GRVQ26RfPPRTKbPIXvXp6
         s2mIFxb4tMYvfA6LkaAgte+g0PLPoYOBItDBYQ8Zu5K7aSF+1irZ75kQFOtajURoXSE4
         9LZl6iL6+BtqSghlCV7D6djjJPAjk3fayVOq+c7Te0Ma5dKOAsYdYsN1qRo/Ab7h2ydn
         Xslp/b8gEEJLpGLekKX5aq3s2uaz0fkhzh1RLQ9WJIQMhc9PcPVhOZvpp433bHy6vCio
         jGWw==
X-Gm-Message-State: AOAM531zbHEyUUJKflGRpHBHXxtR2dLkB/FnFYd/zmqqZ9SlBV0Mu4Kz
        u+GhCPQ9uvjlOZyRLZutdYweYg==
X-Google-Smtp-Source: ABdhPJzuQVghDK2B3zhs2mFiouu1xi3TcQgsojXijUaAU/GiQNamdS2EjhwlGavRXXlq4nUV3vPRow==
X-Received: by 2002:a17:902:e752:b029:df:c991:8c4f with SMTP id p18-20020a170902e752b02900dfc9918c4fmr422611plf.52.1613087197818;
        Thu, 11 Feb 2021 15:46:37 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:37 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 09/19] remoteproc: stm32: Move memory parsing to rproc_ops
Date:   Thu, 11 Feb 2021 16:46:17 -0700
Message-Id: <20210211234627.2669674-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>

Some actions such as memory resources reallocation are needed when
trying to reattach a co-processor. Use the prepare() operation for
these actions.

Co-developed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_core.c | 14 ++++++++++++--
 drivers/remoteproc/stm32_rproc.c     | 27 ++++++---------------------
 2 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 741bc20de437..5c52c612a7f0 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1585,10 +1585,17 @@ static int rproc_attach(struct rproc *rproc)
 		return ret;
 	}
 
+	/* Do anything that is needed to boot the remote processor */
+	ret = rproc_prepare_device(rproc);
+	if (ret) {
+		dev_err(dev, "can't prepare rproc %s: %d\n", rproc->name, ret);
+		goto disable_iommu;
+	}
+
 	ret = rproc_set_loaded_rsc_table(rproc);
 	if (ret) {
 		dev_err(dev, "can't load resource table: %d\n", ret);
-		goto disable_iommu;
+		goto unprepare_device;
 	}
 
 	/* reset max_notifyid */
@@ -1605,7 +1612,7 @@ static int rproc_attach(struct rproc *rproc)
 	ret = rproc_handle_resources(rproc, rproc_loading_handlers);
 	if (ret) {
 		dev_err(dev, "Failed to process resources: %d\n", ret);
-		goto disable_iommu;
+		goto unprepare_device;
 	}
 
 	/* Allocate carveout resources associated to rproc */
@@ -1624,6 +1631,9 @@ static int rproc_attach(struct rproc *rproc)
 
 clean_up_resources:
 	rproc_resource_cleanup(rproc);
+unprepare_device:
+	/* release HW resources if needed */
+	rproc_unprepare_device(rproc);
 disable_iommu:
 	rproc_disable_iommu(rproc);
 	return ret;
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 826cb7a045df..6f0bb54dec15 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -207,16 +207,7 @@ static int stm32_rproc_mbox_idx(struct rproc *rproc, const unsigned char *name)
 	return -EINVAL;
 }
 
-static int stm32_rproc_elf_load_rsc_table(struct rproc *rproc,
-					  const struct firmware *fw)
-{
-	if (rproc_elf_load_rsc_table(rproc, fw))
-		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
-
-	return 0;
-}
-
-static int stm32_rproc_parse_memory_regions(struct rproc *rproc)
+static int stm32_rproc_prepare(struct rproc *rproc)
 {
 	struct device *dev = rproc->dev.parent;
 	struct device_node *np = dev->of_node;
@@ -274,12 +265,10 @@ static int stm32_rproc_parse_memory_regions(struct rproc *rproc)
 
 static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
-	int ret = stm32_rproc_parse_memory_regions(rproc);
-
-	if (ret)
-		return ret;
+	if (rproc_elf_load_rsc_table(rproc, fw))
+		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
 
-	return stm32_rproc_elf_load_rsc_table(rproc, fw);
+	return 0;
 }
 
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
@@ -609,6 +598,7 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
 }
 
 static const struct rproc_ops st_rproc_ops = {
+	.prepare	= stm32_rproc_prepare,
 	.start		= stm32_rproc_start,
 	.stop		= stm32_rproc_stop,
 	.attach		= stm32_rproc_attach,
@@ -793,14 +783,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	if (state == M4_STATE_CRUN) {
+	if (state == M4_STATE_CRUN)
 		rproc->state = RPROC_DETACHED;
 
-		ret = stm32_rproc_parse_memory_regions(rproc);
-		if (ret)
-			goto free_resources;
-	}
-
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
 	if (!ddata->workqueue) {
-- 
2.25.1

