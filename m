Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1960C433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5143064FE2
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbhCJVK5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Mar 2021 16:10:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232128AbhCJVKg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Mar 2021 16:10:36 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C4AC061762
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:36 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id s21so2052048pfm.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2jJc3BSjHAcYnbTw4MOaj/dDyMsPBuKZdItUtKx3Gk4=;
        b=JvSBNrOwT/BnAKgKpNhlkSTYvTD2OI+O7iOuY0PtlRoYcGrlCpK4sq78krhhcEhTHp
         1cXlwwm2Tewq5r7I9Lvr7/gWNpWBL/T+BMlYqJOZ9kUDjSt7haJPxI9GCZi5hmlY1COr
         e6EnAT9eFeTJWkkOBweGALqhJHYKwV5xTF6i1uUKNmBA+zFUFvtjRnaN9oQZQlG0Ybhh
         Pi/275iyR1oLXihEmAeFGoBzmVwip9cOWzV/au6f0YPCiDU8Sz4B+nzv1R3Hdadb2BPL
         +xs/aET2+OMEubAoXqiTTaJBRXsaui8+9D45ZCiJl52pbqjpDxlMu5lqC7/HATnnSogC
         yO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2jJc3BSjHAcYnbTw4MOaj/dDyMsPBuKZdItUtKx3Gk4=;
        b=fsmvifmWyzpkngNsfcBrQbVXLRt8HygRaCCKqMgV6g7EPrN1SVc0YKTCtCSQqKqCKU
         NtqWyRK3Y7H7kU2NzzAi4LZuzONsdpATooTrB5ZcQ5ae6sZS2WMmjV52oNqPkFEo/Z3G
         FSuX/8eDOJYnlAWz6ooToIwV43AE5n3BajTw0UGVsUGq/KRf+DSQva3I6DbiJ97rwili
         DPuHLidl22cdiIamVAB0blG/EJvChs+ux6QRiuWrhSL6DSWziRclmVdBBhN4w0b2B3Kn
         faXLPmhRVaD2C4DGP0gRwT1waw8k+zl0NTUmYyAhy0P6bTB4zJaPe42GaujlCorMnIqU
         6uLA==
X-Gm-Message-State: AOAM530IN3kJs51h7bPXZk2hmsA/uSVB3zqRopxV2N8Ua0fsQoZd2yIb
        hEQr3J0jTirv5Gd5p0+LrfIa8w==
X-Google-Smtp-Source: ABdhPJxCjM6eNHD957QdGJx0Bo2lwSN85QoCQx+w7kVxr/ItIg+w9o6F4fB0t29XQTlebrOLyo29vw==
X-Received: by 2002:a65:5843:: with SMTP id s3mr4351714pgr.425.1615410636314;
        Wed, 10 Mar 2021 13:10:36 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j21sm371508pfc.114.2021.03.10.13.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 13:10:35 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 06/17] remoteproc: stm32: Move resource table setup to rproc_ops
Date:   Wed, 10 Mar 2021 14:10:14 -0700
Message-Id: <20210310211025.1084636-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
References: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Move the setting of the resource table installed by an external
entity to rproc_ops::get_loaded_rsc_table().  This is to support
scenarios where a remote processor has been attached to but is
detached at a later stage.  To re-attach the remote processor,
the address of the resource table needs to be available
at a later time than the platform driver's probe() function.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 141 +++++++++++++++----------------
 1 file changed, 68 insertions(+), 73 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index ccb3c14a0023..f647e565014b 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -546,6 +546,73 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
 	}
 }
 
+static int stm32_rproc_da_to_pa(struct rproc *rproc,
+				u64 da, phys_addr_t *pa)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+	struct stm32_rproc_mem *p_mem;
+	unsigned int i;
+
+	for (i = 0; i < ddata->nb_rmems; i++) {
+		p_mem = &ddata->rmems[i];
+
+		if (da < p_mem->dev_addr ||
+		    da >= p_mem->dev_addr + p_mem->size)
+			continue;
+
+		*pa = da - p_mem->dev_addr + p_mem->bus_addr;
+		dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
+
+		return 0;
+	}
+
+	dev_err(dev, "can't translate da %llx\n", da);
+
+	return -EINVAL;
+}
+
+static struct resource_table *
+stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+	phys_addr_t rsc_pa;
+	u32 rsc_da;
+	int err;
+
+	/* The resource table has already been mapped, nothing to do */
+	if (ddata->rsc_va)
+		goto done;
+
+	err = regmap_read(ddata->rsctbl.map, ddata->rsctbl.reg, &rsc_da);
+	if (err) {
+		dev_err(dev, "failed to read rsc tbl addr\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!rsc_da)
+		/* no rsc table */
+		return ERR_PTR(-ENOENT);
+
+	err = stm32_rproc_da_to_pa(rproc, rsc_da, &rsc_pa);
+	if (err)
+		return ERR_PTR(err);
+
+	ddata->rsc_va = devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
+	if (IS_ERR_OR_NULL(ddata->rsc_va)) {
+		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
+			&rsc_pa, RSC_TBL_SIZE);
+		ddata->rsc_va = NULL;
+		return ERR_PTR(-ENOMEM);
+	}
+
+done:
+	/* Assuming the resource table fits in 1kB is fair */
+	*table_sz = RSC_TBL_SIZE;
+	return (struct resource_table *)ddata->rsc_va;
+}
+
 static const struct rproc_ops st_rproc_ops = {
 	.start		= stm32_rproc_start,
 	.stop		= stm32_rproc_stop,
@@ -554,6 +621,7 @@ static const struct rproc_ops st_rproc_ops = {
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= stm32_rproc_parse_fw,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
@@ -695,75 +763,6 @@ static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
 	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg, state);
 }
 
-static int stm32_rproc_da_to_pa(struct platform_device *pdev,
-				struct stm32_rproc *ddata,
-				u64 da, phys_addr_t *pa)
-{
-	struct device *dev = &pdev->dev;
-	struct stm32_rproc_mem *p_mem;
-	unsigned int i;
-
-	for (i = 0; i < ddata->nb_rmems; i++) {
-		p_mem = &ddata->rmems[i];
-
-		if (da < p_mem->dev_addr ||
-		    da >= p_mem->dev_addr + p_mem->size)
-			continue;
-
-		*pa = da - p_mem->dev_addr + p_mem->bus_addr;
-		dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
-
-		return 0;
-	}
-
-	dev_err(dev, "can't translate da %llx\n", da);
-
-	return -EINVAL;
-}
-
-static int stm32_rproc_get_loaded_rsc_table(struct platform_device *pdev,
-					    struct rproc *rproc,
-					    struct stm32_rproc *ddata)
-{
-	struct device *dev = &pdev->dev;
-	phys_addr_t rsc_pa;
-	u32 rsc_da;
-	int err;
-
-	err = regmap_read(ddata->rsctbl.map, ddata->rsctbl.reg, &rsc_da);
-	if (err) {
-		dev_err(dev, "failed to read rsc tbl addr\n");
-		return err;
-	}
-
-	if (!rsc_da)
-		/* no rsc table */
-		return 0;
-
-	err = stm32_rproc_da_to_pa(pdev, ddata, rsc_da, &rsc_pa);
-	if (err)
-		return err;
-
-	ddata->rsc_va = devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
-	if (IS_ERR_OR_NULL(ddata->rsc_va)) {
-		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
-			&rsc_pa, RSC_TBL_SIZE);
-		ddata->rsc_va = NULL;
-		return -ENOMEM;
-	}
-
-	/*
-	 * The resource table is already loaded in device memory, no need
-	 * to work with a cached table.
-	 */
-	rproc->cached_table = NULL;
-	/* Assuming the resource table fits in 1kB is fair */
-	rproc->table_sz = RSC_TBL_SIZE;
-	rproc->table_ptr = (struct resource_table *)ddata->rsc_va;
-
-	return 0;
-}
-
 static int stm32_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -803,10 +802,6 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 		ret = stm32_rproc_parse_memory_regions(rproc);
 		if (ret)
 			goto free_resources;
-
-		ret = stm32_rproc_get_loaded_rsc_table(pdev, rproc, ddata);
-		if (ret)
-			goto free_resources;
 	}
 
 	rproc->has_iommu = false;
-- 
2.25.1

