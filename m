Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18612C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:45:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA66C64EBB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:45:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhBWXm0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 18:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233352AbhBWXim (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:38:42 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3212C06121C
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:24 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id q20so46354pfu.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1mq+57Jm1O/SI3Ar3tu9qAzNfEq1LOaTZvnWBe70UXM=;
        b=bDJYJ+uV0Y04uJLxLFoIFN9hEMwMonS1oWOlTmnQqGcIyW0bNmXWD99NKXjc+uk9Vi
         RPA9/LYA/tvFwNmU1U2kfLib8j620t4Km3L46Z+FOb1oX1k6UGBdBGRABT2cLX5t30St
         ECgz87UpRuSuCz6Agk+mhJHAXagn1RhM8DWsaczmG0hirydKd3lKTWm7UcA8W7t6J6LH
         tNDH3/UF7ChMV1VanK6YbidZ4cdtGOhT6xM/RUZzxHzM3Hc3JaYflUAnHdMCKkyCOtmd
         9RUgwbz3AcAdAOXDn7dWNpzrVJ5JIx365MyT2ovwaHgY6lcjyTXg+dSbB3q51tPtSa3+
         hsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1mq+57Jm1O/SI3Ar3tu9qAzNfEq1LOaTZvnWBe70UXM=;
        b=sxhexfKE7wm3t64uoUGu0Eir6b1+xtCw8DL0L6UsjoKKSnZo0ZxyhLO6lIRDrmZxqG
         s1PRp2hSenEbu+G+BPkGTFDBxVyqmqXFjzdary8FG09r7BCThorvjxgJm2WFSp5QkS0o
         AzqAjdhrJTLoDalTL2guAX9vikKGcvPstJK7V1d9jlAtiQzPCEYfcCigJ8YKYtSq2GDb
         nVvwyeGNLL2GI+pMuO2qyw8Wq7fX3nSCjIVbvj8Kzp2DyTWL4o98pI6hSzN0s0OlNUqf
         W5HuaTKR7rO9Xsw8CIl3sGPctXRasnroxSrf6ihR2e99wfARuAIx9J7eg3vciosG06je
         XpJg==
X-Gm-Message-State: AOAM533T5A0I8X9aFuIaqf1PhUeZTPz/Td4+uxrgG/QwCWaGknJC0tKT
        rgfPgU7mGKSwSfq5GQiuul0FbA==
X-Google-Smtp-Source: ABdhPJwSwMYbGtLEjvvq6ULUpR1HJGxWJcpn79Lb+4Chp/PQ2GsxIschv1R7KaMoGDC9nq4q0Z+Mag==
X-Received: by 2002:a62:5a45:0:b029:1e5:4c81:c59 with SMTP id o66-20020a625a450000b02901e54c810c59mr29105018pfb.51.1614123324584;
        Tue, 23 Feb 2021 15:35:24 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:23 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 07/16] remoteproc: stm32: Move memory parsing to rproc_ops
Date:   Tue, 23 Feb 2021 16:35:06 -0700
Message-Id: <20210223233515.3468677-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
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
index 0012b7bdce24..86572880c726 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1582,10 +1582,17 @@ static int rproc_attach(struct rproc *rproc)
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
@@ -1602,7 +1609,7 @@ static int rproc_attach(struct rproc *rproc)
 	ret = rproc_handle_resources(rproc, rproc_loading_handlers);
 	if (ret) {
 		dev_err(dev, "Failed to process resources: %d\n", ret);
-		goto disable_iommu;
+		goto unprepare_device;
 	}
 
 	/* Allocate carveout resources associated to rproc */
@@ -1621,6 +1628,9 @@ static int rproc_attach(struct rproc *rproc)
 
 clean_up_resources:
 	rproc_resource_cleanup(rproc);
+unprepare_device:
+	/* release HW resources if needed */
+	rproc_unprepare_device(rproc);
 disable_iommu:
 	rproc_disable_iommu(rproc);
 	return ret;
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index f647e565014b..3d45f51de4d0 100644
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
@@ -614,6 +603,7 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
 }
 
 static const struct rproc_ops st_rproc_ops = {
+	.prepare	= stm32_rproc_prepare,
 	.start		= stm32_rproc_start,
 	.stop		= stm32_rproc_stop,
 	.attach		= stm32_rproc_attach,
@@ -796,14 +786,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
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

