Return-Path: <SRS0=mmP+=AS=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB56C433E2
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 21:31:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E350206BE
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 21:31:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hO5KQZfd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729406AbgGGVbs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Jul 2020 17:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729272AbgGGVbT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 17:31:19 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EECE0C08C5DC
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2020 14:31:18 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g67so19708331pgc.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2020 14:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+L0m/PbK8aAeOqWVeHEDiQMGUfIG8Y+7XMpTLF4upOo=;
        b=hO5KQZfdIYV9UKLk8tm/GVrR9qniYpxEpiWAOkGK6bNh7bMsV12fLzXgF1oZwkyEmf
         EeRitVug9C20gBfxS902ydj/2iwb3Lb7aIyGVIixOP+HfS6PVVK3XSjc0Cr5F30t9tJq
         ujornd12j3tHjWuqHiltfQpRmg/B5UAAzcymoqmqjswEf/qFRcZynG2Bmx/TgOBR5NzM
         su8L6AZs11QiYOWYiYoKnKHTZ4DnMHlEgHwz8uARF9rZTv6K080jyE8K/epp1Rq6Qrk/
         JKEA1Bxl+LJtTFmIVY1f88BEuOOug/0vd3bel1r+/qTjlP4pRLSFcSXNpyK+IxcuxT+G
         jtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+L0m/PbK8aAeOqWVeHEDiQMGUfIG8Y+7XMpTLF4upOo=;
        b=OtHpjuUGBUP21s5ZWEngo4ayLT04orRLAjAFfk8bbXgHXYhnsOPusdwH68eH1bZr1z
         CQWHNRp3majz/j90dDVbhleapxMrtdlCa7UBDBo2T0dfq6CFEsq3noPTFr09O7wqwyW7
         cPKbD/pXIEeIPhhdQ8x9UelTgaWBb8q8+Z0Ng90ngv7NKTaFSUCVtxnTF+cWVRG0desF
         vz81hFjI0KhUtZx70fUCjnJnUra7XQTQppf6wSmzgE0zPwxBfJZbOKUl1TdUypnsqbqU
         LvrfnYdlznbSV/wyeOJ3nr4epZUTkwfwE6c17ODEYJ8QrpS0oyqwczDGxKjrhZfK5ubo
         Mcxw==
X-Gm-Message-State: AOAM531FtU+xWFf0lWFnygwqSzCYh3I2UDblZeEehFygrWyHu+BK4xrU
        oRmwD1odOXEyQDMOKXpYpdjMOg==
X-Google-Smtp-Source: ABdhPJy5YoOmopDSmZVb4RmdnfIlkVTXGx+dSWHb1XXneUf7zCK2cwndwbSwl/5CE2KYpSGEZ6D6uA==
X-Received: by 2002:a62:fb06:: with SMTP id x6mr51125770pfm.28.1594157478432;
        Tue, 07 Jul 2020 14:31:18 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:31:17 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 03/11] remoteproc: stm32: Decouple rproc from DT parsing
Date:   Tue,  7 Jul 2020 15:31:04 -0600
Message-Id: <20200707213112.928383-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index c00f60d42ab6..cbba995a80a2 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -539,12 +539,11 @@ static int stm32_rproc_get_syscon(struct device_node *np, const char *prop,
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
@@ -590,7 +589,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	err = regmap_read(tz.map, tz.reg, &tzen);
 	if (err) {
-		dev_err(&rproc->dev, "failed to read tzen\n");
+		dev_err(dev, "failed to read tzen\n");
 		return err;
 	}
 	ddata->secured_soc = tzen & tz.mask;
@@ -606,7 +605,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 	if (err)
 		dev_info(dev, "failed to get pdds\n");
 
-	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
+	*auto_boot = of_property_read_bool(np, "st,auto-boot");
 
 	return stm32_rproc_of_memory_translations(pdev, ddata);
 }
@@ -627,9 +626,15 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (!rproc)
 		return -ENOMEM;
 
+	ddata = rproc->priv;
+
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
+
+	ret = stm32_rproc_parse_dt(pdev, ddata, &rproc->auto_boot);
+	if (ret)
+		goto free_rproc;
+
 	rproc->has_iommu = false;
-	ddata = rproc->priv;
 	ddata->workqueue = create_workqueue(dev_name(dev));
 	if (!ddata->workqueue) {
 		dev_err(dev, "cannot create workqueue\n");
@@ -639,13 +644,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 
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
2.25.1

