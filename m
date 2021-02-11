Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63368C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:49:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CF8A64E42
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:49:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhBKXtL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:49:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbhBKXr7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:47:59 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5DE7C0611C3
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:35 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id t11so5056651pgu.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVwpD5CH0CelKEAwKMStpJEFTfFplMOWTWmoESYAzz8=;
        b=DGff/4uueqBV64J8FXV9C0ktQMhytE8fE22awY+TatRLv7FtkrA9Kc4tsYtLKKxuGP
         o+R4IYpmLgqG8eKjOJNHvNKlvg+61tr7X7z8xJJm4J9NsxD4vK1cDtG/ZOQNnEUvUrea
         crEz+54bwN5hndjqALVOZNbtmdr8F3iltsshLoIn+XQoXgE6G7lQy54ZHGf8IdCfSurQ
         8tXivkh3iagEJK2EatWZb9OH197Z36fRCzCk1UhXswAPCteM+Nja+5jdSmHsly0y/coo
         loDLJUJicOHvHdV14lDI/MB7ot7io9PYT/gcK5V9HBvaFSQ/Zkd7K6EMJGJKohCLr6QQ
         P2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVwpD5CH0CelKEAwKMStpJEFTfFplMOWTWmoESYAzz8=;
        b=mXubzT32VrgkLgYy66RedcGKmxkWyuAXzm30b1ttb39adQ57axO5MzKgL7z4HpQ0Xl
         ZasQ7dKsnsH9guGg9RLY8rqtRAeAw4VTkME76MmeXb8AeIYKoSzCmNqMd+omQSJgtrsv
         zjjYJC2Wtd8qOHshaGKmSTvecQ3/vXlfIihOWOTeKf2LCXHYnA4bwpXJUdpkKEqKhJnB
         cEWR5ahjnEC/iF9mTIs0aEyrva9nM5lKJU+Gwvk+Bdr1k56p/AqOlBU9YxifamQJ6qNb
         uOuvkQSBP+O04RdB7uAUAcrrlyHZhRIEaz/2UX1tRcYpNZ6ae8+jYipVbuwrZ/iFx+5j
         KvKQ==
X-Gm-Message-State: AOAM533GAg6akQTc9+ua/3Cmx+ApmMmdpO7Zb3OjLSYZSNql8kUlZrG+
        QzHLK0WsNpuOmnt3mG5g7s1Weg==
X-Google-Smtp-Source: ABdhPJwi60+A3fUoQDUgAktLCOxQ9mmNkoZkTdXWSZQmYN6Jy/5S/oQxs8QJ5ba0vn1olIzxjKi6cw==
X-Received: by 2002:a65:4788:: with SMTP id e8mr542190pgs.72.1613087192761;
        Thu, 11 Feb 2021 15:46:32 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:32 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 04/19] remoteproc: Rename function rproc_actuate()
Date:   Thu, 11 Feb 2021 16:46:12 -0700
Message-Id: <20210211234627.2669674-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
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
index 86bd66955060..8afc7e1bd28a 100644
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

