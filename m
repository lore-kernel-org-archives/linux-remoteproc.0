Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00592C4361B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8F1323B6B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731339AbgLRRds (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Dec 2020 12:33:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727945AbgLRRdr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Dec 2020 12:33:47 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A651C0611E4
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:35 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id g18so1759115pgk.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=txg4LgzTONgLC7bOinTZzbCI37JS2siLcSWFwbF15Qk=;
        b=FT1wjtnmHCPECVPEQOVxWLN5IehXSRiI66FrjheH51idu4RnVyVuXK++01jSwEYClT
         KZcFQ0KFJhcsVGfoIH42EnumgM9kl6NEwU9q1v901FR335NFKd/uI3zQqmhFcU52+ZnU
         UrBN9FzQambsdleQEA8D+rYpufRq4QHqAZbw3u2I8hS4Ef79mMz71XebEFznG6UxpIN2
         EKW/X23xQvlKzToX003uherA1MKSw08scJZVf8NMCxj1EVa/iXVQZ7+M7FUbWOoBQx5V
         bNimp0NbeQwOPco7XjifzHPkmZTafaMiWHnat4Mjv2WN1m2Z993yQZMHJGR4wx/4klCI
         C8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=txg4LgzTONgLC7bOinTZzbCI37JS2siLcSWFwbF15Qk=;
        b=ISuwBaPuMOYaVbHfMZFGRDAIh24RhlNA7WvSorUhB86siUIedc9abUNxPkKTVwzMtv
         4ocw6OMK20FV/EIDslv10oB6STV4rDN0HhA9u/eHoWYdrL/4fSMSDBKsGGLr3JiSeW9T
         xqOhEs+NdAQ2fpl2WxEc5gpjUkRwJlBSJoSbhWrG/bVUov5QFJAPA4I8yH4WnYs6KHkK
         i4H5m0gZuwySucIY9s7uBtLzzINkTh0HAVcpmULjELoVdqJa52CJ4txSemPgNCss4XM8
         ownO9U9l4bR1687YJlMLQCOmp0GRfTVtUhB3v4JP9963+U26Wvzi+UuOckX6S0vJRSce
         gctg==
X-Gm-Message-State: AOAM530XwbWvGuZI5lxGSN9caKTVH73A0Q1vGR1CrsD6YYaZiR0bDntC
        jMtRKCsouiwAvQpXER8XCFADwA==
X-Google-Smtp-Source: ABdhPJxpl9rldBP7FevfT9lA0VGRaw7OCOci0QW9tFHtQzy20O1eC9TD5qAuoEvJvgQ74t1TCRI1AA==
X-Received: by 2002:a63:2060:: with SMTP id r32mr5077740pgm.129.1608312754801;
        Fri, 18 Dec 2020 09:32:34 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l11sm9892957pgt.79.2020.12.18.09.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 09:32:34 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/17] remoteproc: Rename function rproc_actuate()
Date:   Fri, 18 Dec 2020 10:32:15 -0700
Message-Id: <20201218173228.2277032-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
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
index f36786b47a4f..d0f6b39b56f9 100644
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

