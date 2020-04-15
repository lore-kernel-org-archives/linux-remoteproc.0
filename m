Return-Path: <SRS0=YAOw=57=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DA5C2BA19
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Apr 2020 20:49:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EFA12078B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Apr 2020 20:49:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rRvVXTP7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442157AbgDOUt0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 15 Apr 2020 16:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2438385AbgDOUtK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Apr 2020 16:49:10 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD13C061BD3
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 13:49:10 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id w3so479208plz.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 13:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5mMaRFdCaTH1ggi3Wx1BWKvNiF1AGQ87b+AkdJgmycY=;
        b=rRvVXTP7ZJzwJhf2Xmo3vX+8MSK3BDm3OT74D5LpCxb54uKGTRX9zNxmh53maUTuDX
         QlO9C4z4sCObkinTOLXaQQ+ON/0I1sFNi5yXsyhdqeKlYuAwtQsuQHGZSDpcEs++CmRK
         qUTQA/19pgl8Q8QVyB4puFqpgHqA0Exv6dun2x9Cq+/xlQ4DkG5CCTwpL98FIHzICtS5
         h7X58oq3qlBvBk++0wFqy9DK1rAQ8b8rIbf2/t6WrA29SL2S0+KA/nuA6Ve25BVwYsZw
         on2Q0Gk50Y8gAB4vJN69edaImi8dwcmrW4q2wpJKBaOH/Ayk73r1TtNEUslfU+b/yFdl
         zx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5mMaRFdCaTH1ggi3Wx1BWKvNiF1AGQ87b+AkdJgmycY=;
        b=aTZpsmGj19tII+W+BYL1Rrh+nBEoQt7i+HA0Qe71RFapiriiBod6CIy9IUxkgIo9WZ
         0V4d8sGINPuxOtchjKV3Btluol5B2mn/hS9S9jA3SLSoAxww1XFy4xO4/HdoG4GhZ7c1
         neVJBOFTbyyPZNFvbYeSvlzWR/AizHA5UucL6a9/JRLhsD8oVOmvUxtVFOetTWymSuyF
         kTw09WnaYjc2bg1n7wlDLthSOJJJCUQr7uQFxFLavwRGKIq1qGKK23LufNetWpI2IORR
         xMdkX4L2Es0FmLmI03GXaAgAyg92FqvB0vJ/gHjYlKafl0kSK/pduf9JUAXPcDIzEw0Y
         GEjA==
X-Gm-Message-State: AGi0PuaKhjhoQFCllD4SKXq1lS9SF7eTg69Fy6wbl8cfA9v9OkOt4wQc
        MzzxjPpmhHT8HRVx8iKq44vyjw==
X-Google-Smtp-Source: APiQypIEHhprsgf/g45tSL3P5lgi62wsjU6pB/U8o8/KQp+LhHz+Wmuz0Y2ljFPdYiZ7txC57NY54g==
X-Received: by 2002:a17:902:8d86:: with SMTP id v6mr6861724plo.57.1586983750173;
        Wed, 15 Apr 2020 13:49:10 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i13sm14461861pfa.113.2020.04.15.13.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 13:49:09 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, elder@linaro.org, Markus.Elfring@web.de,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] remoteproc: Get rid of tedious error path
Date:   Wed, 15 Apr 2020 14:48:58 -0600
Message-Id: <20200415204858.2448-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415204858.2448-1-mathieu.poirier@linaro.org>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200415204858.AIzCe5MB0wiQWx92b-KIb44riruVxsG9sCGqDmNhdv8@z>

Get rid of tedious error management by moving firmware and operation
allocation after calling device_initialize().  That way we take advantage
of the automatic call to rproc_type_release() to cleanup after ourselves
when put_device() is called.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index a5a0ceb86b3f..405c94f151a7 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2056,12 +2056,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	if (!rproc)
 		return NULL;
 
-	if (rproc_alloc_firmware(rproc, name, firmware))
-		goto free_rproc;
-
-	if (rproc_alloc_ops(rproc, ops))
-		goto free_firmware;
-
 	rproc->name = name;
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
@@ -2074,12 +2068,17 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.driver_data = rproc;
 	idr_init(&rproc->notifyids);
 
+	if (rproc_alloc_firmware(rproc, name, firmware))
+		goto put_device;
+
+	if (rproc_alloc_ops(rproc, ops))
+		goto put_device;
+
 	/* Assign a unique device index and name */
 	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
 	if (rproc->index < 0) {
 		dev_err(dev, "ida_simple_get failed: %d\n", rproc->index);
-		put_device(&rproc->dev);
-		return NULL;
+		goto put_device;
 	}
 
 	dev_set_name(&rproc->dev, "remoteproc%d", rproc->index);
@@ -2100,11 +2099,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->state = RPROC_OFFLINE;
 
 	return rproc;
-
-free_firmware:
-	kfree(rproc->firmware);
-free_rproc:
-	kfree(rproc);
+put_device:
+	put_device(&rproc->dev);
 	return NULL;
 }
 EXPORT_SYMBOL(rproc_alloc);
-- 
2.20.1

