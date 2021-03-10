Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83BCC43333
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 889486500D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbhCJVLA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Mar 2021 16:11:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbhCJVKr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Mar 2021 16:10:47 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D55C061756
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:30 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id ba1so9130685plb.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eI1kKtC7UxMHnJr2s3EPvhdO8fxk/LLGwiTP5XOosV0=;
        b=UBK4sB9rPqlGopn6Z5INCKpCrPpZzqDE+I4XbK7nThpRAvYlKYvf3tUmJmo+qNLft7
         YEbmENwVcmoNpmuThUeSA66fABdXcBujiuxHZEPpA+IqXN5COkMH+bP1e84DJ9Rvk8zV
         NAdmN2K9aq5Tmi+2m/Y050H1+e3FtbhVLB7+NCUnn0p25IAeju0QiliJYJQFEkDIKVja
         psakErG2aFSIYt715LmTouU0MREfP0KYkWL4PgcZ4M90kwrZSi4Ex70mStUPAqJaFo8v
         bkd/Yd6wg9sis9/FaDXTVKnyAym3NHKxzbLk0HMjXfeFP7JBYOdS46A3WJCEzA+qdzDs
         uD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eI1kKtC7UxMHnJr2s3EPvhdO8fxk/LLGwiTP5XOosV0=;
        b=KvMphmPHYki1DR1aJ/WeWhA1LIhPLIGRLTFNSKWABONHKRBBH0Tr3YP77TnPIlk59X
         jFAf42FZ/b9iDppzYykUH3z/Pg1CHUc/EUL3jzC/jTRgqsXi1AHSPRNeBqr1zaZkWzDP
         8sI31n6E+sL5eKryoEXQEnI/VijxJ8M67xbWM4iKnnIQiUxMQBCfxP98FAmFFJ4wHqC9
         yV+6F9ndk5LaJ2kYQJyozf9CL7waK0vLQHcQ4usjW1tjMHeuQ2f/acG98CqnSOpAf9yO
         WEXc/NoG09BSYL4mh2X991b0EjI0e3NLhk8h2OrMF0qbaUhpOqRgqiBw6D1sr4zgmwx8
         SzTg==
X-Gm-Message-State: AOAM531V7ttAcFTb5Qpn9AmCeASEBsG0KNQhLH1hSI4RheHJiB+KLvhi
        WthEEs5aBVunUdC39nWUcXlQ9A==
X-Google-Smtp-Source: ABdhPJy4lW4Frr82V0PylUcRUwzYr/y79yLaMzDeiCIpOzcFfrucwFzywRye98FeurtrRXubLxOEuQ==
X-Received: by 2002:a17:90a:bd90:: with SMTP id z16mr5579736pjr.123.1615410630433;
        Wed, 10 Mar 2021 13:10:30 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j21sm371508pfc.114.2021.03.10.13.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 13:10:29 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 02/17] remoteproc: Rename function rproc_actuate()
Date:   Wed, 10 Mar 2021 14:10:10 -0700
Message-Id: <20210310211025.1084636-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
References: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Rename function rproc_actuate() to rproc_attach().  That way it is
easy to understand that it does the opposite of rproc_detach().

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d2704501b653..7b66e1e96e4a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1416,7 +1416,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
-static int rproc_attach(struct rproc *rproc)
+static int __rproc_attach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1541,7 +1541,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
  * Attach to remote processor - similar to rproc_fw_boot() but without
  * the steps that deal with the firmware image.
  */
-static int rproc_actuate(struct rproc *rproc)
+static int rproc_attach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1581,7 +1581,7 @@ static int rproc_actuate(struct rproc *rproc)
 		goto clean_up_resources;
 	}
 
-	ret = rproc_attach(rproc);
+	ret = __rproc_attach(rproc);
 	if (ret)
 		goto clean_up_resources;
 
@@ -1802,7 +1802,7 @@ int rproc_boot(struct rproc *rproc)
 	if (rproc->state == RPROC_DETACHED) {
 		dev_info(dev, "attaching to %s\n", rproc->name);
 
-		ret = rproc_actuate(rproc);
+		ret = rproc_attach(rproc);
 	} else {
 		dev_info(dev, "powering up %s\n", rproc->name);
 
-- 
2.25.1

