Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D694C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:49:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D436864E45
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhBKXtv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:49:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbhBKXsZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:48:25 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373C3C061A29
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:37 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id t11so5056679pgu.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tgj/edDkEdxRhIM+wgjO9M5oMofNW86OJezP/GK0ahs=;
        b=tHoROy0ZBJibDn2Qqw0ubJ5sF9B8braEhy6lRyzWgXr3EpwW0qQYoWp+Zbrht7G7uv
         4cNiCfhTHwoV4givIOfoimydEvmIMyV4eJjHD6yDoNO2YDJaT3iZlr2fF/HJv59lP0y8
         w2nEuhlU3Vf+iMOPH2CLHZebGHi00KdIGoCMas2RP6WifJdcObdP7Ib1FuU64SqvnSeH
         EGEyBmFuNQ46DgHbOd+crIbuvkIagiBxPseDjcdkyVGMuL/8cq3Qz3sM/iJ/ZGfONfMA
         /eUlZYGTNuh+WfzCohR4Adk9+Oih6wIJdaUUKyDzw3hMNGDRLuKJ8S6APfyZLpcdPfag
         9gJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tgj/edDkEdxRhIM+wgjO9M5oMofNW86OJezP/GK0ahs=;
        b=pEPcq/6lB40Smj5rPBIJ7cq021OZHiBU1UEGfMONKnjHnj9hz12MsmP6VbL6jxm7II
         kLLgUk5eFfJINQkD/NL/psSNi5363SRY59UwR/uBFniV/HrQJP2L5sc0Q711vsrxxq6Z
         TNZAQO9BogTd/DDSdEsXpuW/n4k+9m9v3AJmGSxokUL1S/24WUmrOTXXCMWOoQqPov+Q
         zDq0u9d/F7LOt6QXm/5c6i270Z4Ns0pD8mG2j7p+j1+wvnOgRdath3EW65rio+AhZbWe
         8ZMb7+L8OMufXq3ueO5vF/kFIfmOSzAtxC1B6G8lwsbgniTUjWzn4fqepUXFJPj+ZryS
         lbYA==
X-Gm-Message-State: AOAM532bbny19GoiHbkashTDKlhGUXDktDd/hu9mvQmJyZDMBLvGG9qo
        BPmREnhRaO3qW+W/IdRXaadJbg==
X-Google-Smtp-Source: ABdhPJyKO61ffs9xYFwkI9+D/+9eNomkdJ0fAGPKxg1PIyaMphQAzyYWlPk0zHKeEgATjSgKbuiVFQ==
X-Received: by 2002:a63:347:: with SMTP id 68mr554653pgd.164.1613087196808;
        Thu, 11 Feb 2021 15:46:36 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:36 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 08/19] remoteproc: stm32: Move resource table setup to rproc_ops
Date:   Thu, 11 Feb 2021 16:46:16 -0700
Message-Id: <20210211234627.2669674-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Move the setting of the resource table installed by an external
entity to rproc_ops::get_loaded_rsc_table().  This is to support
scenarios where a remote processor has been started by the core
but is detached at a later stage.  To re-attach the remote
processor, the address of the resource table needs to be available
at a later time than the platform driver's probe() function.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
New for V5:
- stm32_rproc_get_loaded_rsc_table() now returns a resource table pointer.
---
 drivers/remoteproc/stm32_rproc.c | 141 +++++++++++++++----------------
 1 file changed, 68 insertions(+), 73 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a180aeae9675..826cb7a045df 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -541,6 +541,73 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
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
@@ -549,6 +616,7 @@ static const struct rproc_ops st_rproc_ops = {
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= stm32_rproc_parse_fw,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
@@ -692,75 +760,6 @@ static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
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
@@ -800,10 +799,6 @@ static int stm32_rproc_probe(struct platform_device *pdev)
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

