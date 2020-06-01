Return-Path: <SRS0=OrS8=7O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB01C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 19:01:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D711206E2
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 19:01:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u5/FuQaV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbgFAR4A (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Jun 2020 13:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbgFARz7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:55:59 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7648C08C5C0
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:55:58 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id w20so3841828pga.6
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mt1xsDxJMbdYjwmldK7j7a3WkNUGnKAAzigiHh0OZYk=;
        b=u5/FuQaVxT5K7fVveXroKYGE2Zkc2ldozzP6SgKNozz77UeMbxAqCMvbgzVT8RVLFA
         Scg4NCGQT4Sqz9xEoi8yNghdiu3YgMMNBjOvFgSkBZD2e3V8BWngoTlOfX0OSbxUXBAR
         N7yJa2o/eGXN/O4gAijAldki0lalo/I7xkj1OwnLQPDaPI59ltWTcV7QeAH1Nep5jYOZ
         c4vMH+DMedwZSIqH2iJyjH0t/8loYGv8Uk3bIdG4kC3BU1jafTVZmZyWJBJelJlSwy/l
         Nixoyy16uXwvpYgUYsPModiPoxQA2EJwhA3SbYihK5ht40Ag4OMwVIxvmW19nWOiTzrz
         uBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mt1xsDxJMbdYjwmldK7j7a3WkNUGnKAAzigiHh0OZYk=;
        b=oQpkSu2xOWWs6CyxJz4JpCz2VN+7KzfWqyT0N1b5VO025pVaO3RadlpgQBbPRCPa4j
         OnsJqEjnMh5vqABa6axVlcvsz8LRXsZ+d3gbYovN8B/nIf+0iT1qUUNvwxLl9fIShw9E
         S0bQnzu4f+xBDzxYxOPZPjjQCZ3qwbpjX0XvNF6GsLkx/WZvNGwUjYijuRaa5xTgY+TY
         A+ryv5AOsFA/UlIqmpZXm23UDDSu2dmU7ruFH/T4XDIIBMN2VyxjxEGRjwCX3nVaqey5
         DzgDtrHLAddOxs7xRNU7BfppGjjdxsNGlc65swdNDgblp2U+cn3zuQT81S4JU2Csxart
         oqhw==
X-Gm-Message-State: AOAM531XDv/fu41kUJJmvDjV+jBtHJ50P6WhTtrrRTYLxoUZ0NkXBoNI
        u9eJooXroaftBaGcFS+dUPl4kg==
X-Google-Smtp-Source: ABdhPJzE2aa5iEK5faj4x4YJ+CgK8FSIvkIzTyWsM91Imyim08uFbh4bfBtcgO0gJflpEkMgLor8XA==
X-Received: by 2002:a62:1e84:: with SMTP id e126mr22019473pfe.67.1591034158196;
        Mon, 01 Jun 2020 10:55:58 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:55:57 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 03/11] remoteproc: stm32: Decouple rproc from DT parsing
Date:   Mon,  1 Jun 2020 11:55:44 -0600
Message-Id: <20200601175552.22286-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
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
index 94fd687fb5b2..1e512ddf2591 100644
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
@@ -626,9 +625,15 @@ static int stm32_rproc_probe(struct platform_device *pdev)
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
@@ -638,13 +643,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 
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

