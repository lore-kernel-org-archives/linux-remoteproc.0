Return-Path: <SRS0=mmP+=AS=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B13C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 21:31:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B46502075B
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 21:31:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W7JNiFoJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729328AbgGGVbZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Jul 2020 17:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729297AbgGGVbZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 17:31:25 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93B6C08C5E2
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2020 14:31:24 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x72so9549922pfc.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2020 14:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FfAaJp6b5HalmkhHN7cSjDzeHULwHynUsuI0BeNMqXI=;
        b=W7JNiFoJyW2TF5WpFjA0OtJAoBXDVTHORHDXhNJSr98obNYv7gMVpE5+Xp+PGW3xTP
         tYxHfU+c9G0QCi8Y9jufWdWXM1iooCKMX0NKSQFwIA1pZKIoOSPnOR4b4tKkdrgCMZXc
         zHyxK0ahj1BrGCKT7OY4G9gDaruMZbNoasT6EFhJKUi2/MUkRg3ZJzpEMbuP9xGgMoNn
         XoyJyovBrcG0BY0JDtLb1xj19CNwM3Zy9Pkz3sCekQ4TzEFCZjLKLhHsa2E39RJfhDpy
         JLmKa91jDaerOoNXuzIGniXMvSnvtkN2nCpD5KLmc5S6V99G4S2d/y/tUZiG6S87bz81
         djzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FfAaJp6b5HalmkhHN7cSjDzeHULwHynUsuI0BeNMqXI=;
        b=JSylOnh8bZY2W/gPcSAVcIXQnqdxOUMMlRKnzcrc+n3JXi1Fz9HdOiC+tSOVejOpRt
         /ax+zg91JIvdDuqEG4ngbW76A27CoxK7hm59NRzaPqLdDpuMDNKfpCwNMgbDCtqi4J/G
         6hHALkWiqE5M9dR24bGsUfgBhzxDjY2n9frbq08kOAfLioi0FkyapEuX5iCcRZEtzax4
         f59KKf3zG0kmRqxIOzvI6CPA0L5YBzKYHIhNOAKntiPtMLMFh/OBUNG+gcop6i0yje9n
         1CTpzDLbj1364ELbmRoWmKeKn2X3+sWOnTa0NsqGSdifengJlk9Yg9NOWhl6McD5nBNh
         U2PA==
X-Gm-Message-State: AOAM531YRLd8bMWdkjKspcINs/Zw5Fa069oJcAWLMaOrf2ed5cYW08S8
        wa/wP+JV29u5H5nboAf6SUGeuQ==
X-Google-Smtp-Source: ABdhPJzOb/JNsarcAf0GT3Q/J+fPJoVGP0wz87PXsnc3tu0ypOGcHBInuCtvZIn2ccSOQGJ7Yk7MaQ==
X-Received: by 2002:aa7:9422:: with SMTP id y2mr34496972pfo.211.1594157484318;
        Tue, 07 Jul 2020 14:31:24 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:31:23 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 08/11] remoteproc: stm32: Split function stm32_rproc_parse_fw()
Date:   Tue,  7 Jul 2020 15:31:09 -0600
Message-Id: <20200707213112.928383-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Split function stm32_rproc_parse_fw() in two parts, the first one
to parse the memory regions and the second one to load the
resource table.  That way parsing of the memory regions can be
re-used when attaching to the remote processor.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index cbeb5ceb15c5..9ab58fae252f 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -213,7 +213,7 @@ static int stm32_rproc_elf_load_rsc_table(struct rproc *rproc,
 	return 0;
 }
 
-static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+static int stm32_rproc_parse_memory_regions(struct rproc *rproc)
 {
 	struct device *dev = rproc->dev.parent;
 	struct device_node *np = dev->of_node;
@@ -266,6 +266,16 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 		index++;
 	}
 
+	return 0;
+}
+
+static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret = stm32_rproc_parse_memory_regions(rproc);
+
+	if (ret)
+		return ret;
+
 	return stm32_rproc_elf_load_rsc_table(rproc, fw);
 }
 
@@ -693,15 +703,20 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	if (state == M4_STATE_CRUN)
+	if (state == M4_STATE_CRUN) {
 		rproc->state = RPROC_DETACHED;
 
+		ret = stm32_rproc_parse_memory_regions(rproc);
+		if (ret)
+			goto free_resources;
+	}
+
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
 	if (!ddata->workqueue) {
 		dev_err(dev, "cannot create workqueue\n");
 		ret = -ENOMEM;
-		goto free_rproc;
+		goto free_resources;
 	}
 
 	platform_set_drvdata(pdev, rproc);
@@ -720,6 +735,8 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	stm32_rproc_free_mbox(rproc);
 free_wkq:
 	destroy_workqueue(ddata->workqueue);
+free_resources:
+	rproc_resource_cleanup(rproc);
 free_rproc:
 	if (device_may_wakeup(dev)) {
 		dev_pm_clear_wake_irq(dev);
-- 
2.25.1

