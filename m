Return-Path: <SRS0=gNgS=AZ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD64EC433F7
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jul 2020 19:51:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 961CF22B51
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jul 2020 19:51:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D7G6DnxR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729732AbgGNTvI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Jul 2020 15:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729723AbgGNTum (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jul 2020 15:50:42 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B921C08C5DD
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 12:50:42 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ch3so2102533pjb.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 12:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jY+hhKB0ddRkOQj+QLLC4GBsl3mMolKfuwtvmOZ1afk=;
        b=D7G6DnxRXvBsUxmYZu4OCJ1QzqB/HUCmIZPe6CGSR7XUDniZ5vTvX/eldrgOyDqZMC
         gg/vlKlxk3G9ckQFvjxqJrtLSdCInI6qFOZoQrAxPra//+Ai0qDJ77SQfpDUv6Ha2Ib3
         9MBBDih8VptIniwyjNclOpZFUSUoOSOR3DzNhuAXBcBQnXQ+bH7ieqNmTXFZ4s0qcPuT
         DiVWGg39TXGZhWtllo6aq5WNL7ki4uBIlNq+PTrQoWYlGwX/Leavv+8y+QWDnAKg/LvX
         ca1QFmOfMF6feCcna9vVM5/Lxi+Q9bPmHaDNwPV0k9AeBS//7/7XYjyk1G4tWtgpZHfn
         FUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jY+hhKB0ddRkOQj+QLLC4GBsl3mMolKfuwtvmOZ1afk=;
        b=nf4coZsUyXfU+5OGKggMDqu6nFG9HFkuhI7VmER1epJ740UGxeqo/zLJkb4Cgorypm
         +WxOwkFErvrBpUy1krQ+fVNbTIWy9VIAb5lFdpG0UfdmRbeUtZIhdHVSgMmDkiZblokU
         1VCxAKfutYMaa6KUO/yxlPyd7SSQxpYqcYrxx/FDM+XTQG4kP2X+yDDUQ4QDzW43tfek
         ZGGCMtIDfVmmdvPAY662amRCW6l45Vs567lP5Fq6zt0W8JAvkBJgTLcF1xCcIfFLa5Df
         iDXfomhzM2g7OzNtv5MaXe/SmTV0PUulYxQD0yfzRwuDUBpfddJl4LQgkOfmKVM13YhG
         Xdcg==
X-Gm-Message-State: AOAM533T2DZx2r4QoXF4eUkHwTHTQwiVDoNmCvkBs7encoW8HGCIwDzj
        iez5GHfukfncLUmSQTCxVlcOKw==
X-Google-Smtp-Source: ABdhPJy0+Yjbb5Wid6Xe48CAfbptCtTGZF2jm/cc4qS7GYa62Ba4oin3KhNDZYaiwhjeq0d2EOcfYw==
X-Received: by 2002:a17:90b:4b0c:: with SMTP id lx12mr5659999pjb.133.1594756242037;
        Tue, 14 Jul 2020 12:50:42 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id g8sm16736689pgr.70.2020.07.14.12.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 12:50:41 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/9] remoteproc: Introducing function rproc_actuate()
Date:   Tue, 14 Jul 2020 13:50:30 -0600
Message-Id: <20200714195035.1426873-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714195035.1426873-1-mathieu.poirier@linaro.org>
References: <20200714195035.1426873-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce function rproc_actuate() that provides the same
functionatlity as rproc_fw_boot(), but without the steps that
involve interaction with the firmware image.  That way we can
deal with scenarios where the remoteproc core is attaching
to a remote processor that has already been started by another
entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 59 +++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 1e8e66a25bd6..fd424662801f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1369,7 +1369,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
-static int __maybe_unused rproc_attach(struct rproc *rproc)
+static int rproc_attach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1490,6 +1490,63 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+/*
+ * Attach to remote processor - similar to rproc_fw_boot() but without
+ * the steps that deal with the firmware image.
+ */
+static int __maybe_unused rproc_actuate(struct rproc *rproc)
+{
+	struct device *dev = &rproc->dev;
+	int ret;
+
+	/*
+	 * if enabling an IOMMU isn't relevant for this rproc, this is
+	 * just a nop
+	 */
+	ret = rproc_enable_iommu(rproc);
+	if (ret) {
+		dev_err(dev, "can't enable iommu: %d\n", ret);
+		return ret;
+	}
+
+	/* reset max_notifyid */
+	rproc->max_notifyid = -1;
+
+	/* reset handled vdev */
+	rproc->nb_vdev = 0;
+
+	/*
+	 * Handle firmware resources required to attach to a remote processor.
+	 * Because we are attaching rather than booting the remote processor,
+	 * we expect the platform driver to properly set rproc->table_ptr.
+	 */
+	ret = rproc_handle_resources(rproc, rproc_loading_handlers);
+	if (ret) {
+		dev_err(dev, "Failed to process resources: %d\n", ret);
+		goto disable_iommu;
+	}
+
+	/* Allocate carveout resources associated to rproc */
+	ret = rproc_alloc_registered_carveouts(rproc);
+	if (ret) {
+		dev_err(dev, "Failed to allocate associated carveouts: %d\n",
+			ret);
+		goto clean_up_resources;
+	}
+
+	ret = rproc_attach(rproc);
+	if (ret)
+		goto clean_up_resources;
+
+	return 0;
+
+clean_up_resources:
+	rproc_resource_cleanup(rproc);
+disable_iommu:
+	rproc_disable_iommu(rproc);
+	return ret;
+}
+
 /*
  * take a firmware and boot it up.
  *
-- 
2.25.1

