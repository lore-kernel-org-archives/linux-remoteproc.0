Return-Path: <SRS0=nfGK=6I=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5F4C54FD0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:25:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B89C215A4
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:25:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zhJLZdm4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729431AbgDXUZQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 24 Apr 2020 16:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729450AbgDXUZM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:25:12 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B467C09B04A
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:11 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h12so2949216pjz.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xbW7QKSbfjGivmoYcupmOInELZblEqFAL+Y8ISSJeX8=;
        b=zhJLZdm4i9zHW9J6fATQir/D5Ai12hcl4TYtW02jd8SpeKDblvWb5CS/Ycwq823GT1
         cLy6r19Jj0fGjZ9X4GPUilij4LfV9mraQQx/ZkYxoYF+9TnPfcwFMCs3Ok0yJjDPMyZK
         /IUqfRbNNrCDFSjFouVBcaotokUvWFxq7ZRixSFaL14ce03oFMMOXh0Tfunkoyxhqxq/
         pWpZufvPHGXIOvQXjWIj2X4KB5dlpQ2zn2/pRhzTYkUmnTtkeemdkS+/9COOjVIYV9gz
         kuDOF3IZunVa6102XlelZsHXZdFGhmZ5wD2ZjiLf6bUdabO103cCnAo3NYVP9EcuB7y6
         jAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xbW7QKSbfjGivmoYcupmOInELZblEqFAL+Y8ISSJeX8=;
        b=P1uQebtIrGi16gm7oMAVqS5WBzQ4/N6+4QhK6g5KtS819ui6cpCIQCbjmBnZY1mk3g
         dwkxbi1ikUDcJTe3pjSU9eTDVs3FjeqlLUNdx5w+7P59OlG+JKP7OOlHSdr3KlBTciR5
         vegraf5KfsD4r7DKwa8dOqnsBB6qKGffHviM71a/9Cvc3HddO2IAyczcfC72C+I8se7C
         JxO6Aj+nvYtW/wRPqjl9fdsO1N8/P36lEiXp5XTNdRWx0MrW1xK+P6vBcSQjQozAOZ76
         xa6zEytj2DzJsDy/ay9n1oMp3kurdIUzMkD/yFl20nf+WYAkattyWtbG7Yl+peRoXiiZ
         eimg==
X-Gm-Message-State: AGi0PuZXlWDAqKVwOhmbqzcsp2BJRakKZ2GinRXKwZjVtLsVguJ5S3Fz
        DuE19ctU+XqZhMr3B8b9yKDuhw==
X-Google-Smtp-Source: APiQypIIwwTi5PPDpuYGABCuyrPNQaN6gPmxklOQGbbWKG9LDZvIkkRNI7NFznTs3Om6Zw5dl3bZNA==
X-Received: by 2002:a17:90a:a796:: with SMTP id f22mr2222697pjq.42.1587759910724;
        Fri, 24 Apr 2020 13:25:10 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:25:10 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/12] remoteproc: stm32: Decouple rproc from DT parsing
Date:   Fri, 24 Apr 2020 14:24:56 -0600
Message-Id: <20200424202505.29562-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Remove the remote processor from the process of parsing the device tree
since (1) there is no correlation between them and (2) to use the
information that was gathered to make a decision on whether to
synchronise with the M4 or not.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 1ac90adba9b1..57a426ea620b 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -538,12 +538,11 @@ static int stm32_rproc_get_syscon(struct device_node *np, const char *prop,
 	return err;
 }
 
-static int stm32_rproc_parse_dt(struct platform_device *pdev)
+static int stm32_rproc_parse_dt(struct platform_device *pdev,
+				struct stm32_rproc *ddata, bool *auto_boot)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct rproc *rproc = platform_get_drvdata(pdev);
-	struct stm32_rproc *ddata = rproc->priv;
 	struct stm32_syscon tz;
 	unsigned int tzen;
 	int err, irq;
@@ -589,7 +588,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	err = regmap_read(tz.map, tz.reg, &tzen);
 	if (err) {
-		dev_err(&rproc->dev, "failed to read tzen\n");
+		dev_err(dev, "failed to read tzen\n");
 		return err;
 	}
 	ddata->secured_soc = tzen & tz.mask;
@@ -605,7 +604,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 	if (err)
 		dev_info(dev, "failed to get pdds\n");
 
-	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
+	*auto_boot = of_property_read_bool(np, "st,auto-boot");
 
 	return stm32_rproc_of_memory_translations(pdev, ddata);
 }
@@ -616,6 +615,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	struct stm32_rproc *ddata;
 	struct device_node *np = dev->of_node;
 	struct rproc *rproc;
+	bool auto_boot = false;
 	int ret;
 
 	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
@@ -626,9 +626,16 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (!rproc)
 		return -ENOMEM;
 
+	ddata = rproc->priv;
+
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
+
+	ret = stm32_rproc_parse_dt(pdev, ddata, &auto_boot);
+	if (ret)
+		goto free_rproc;
+
+	rproc->auto_boot = auto_boot;
 	rproc->has_iommu = false;
-	ddata = rproc->priv;
 	ddata->workqueue = create_workqueue(dev_name(dev));
 	if (!ddata->workqueue) {
 		dev_err(dev, "cannot create workqueue\n");
@@ -638,13 +645,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rproc);
 
-	ret = stm32_rproc_parse_dt(pdev);
-	if (ret)
-		goto free_wkq;
-
 	ret = stm32_rproc_request_mbox(rproc);
 	if (ret)
-		goto free_rproc;
+		goto free_wkq;
 
 	ret = rproc_add(rproc);
 	if (ret)
-- 
2.20.1

