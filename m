Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B39C6379F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 21:37:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B0AE20780
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 21:37:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+5VPhwl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgKRVhL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 16:37:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbgKRVhI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 16:37:08 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8226C0613D4
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 13:37:07 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id w6so2405562pfu.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 13:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YpJGL4iVaQpB7OmyOGqz/Jf0POXHK+Nggf2uFVT9Buw=;
        b=Y+5VPhwluelryGOQCt3n3SLvjhuuBuGqMkLhujB4uQYgQFEmpW1VtT+R2h5FjpMVam
         QZ/+hbIPzVkdLVm6Xi4r5vIcBFrZYlmWam9WdErqkFSyTCWTIaA65gFBn3BeBCnjYkqj
         07AQYXYcCc+abgZN6IFLtlQTMTiI2T9XMeCntMGvzXhCwUXoiqUcYOxWODcBj1KGilpj
         untdq2Ijm29Xf1sFR8YZ8RSEG/OIDZipc+ExWrgoaycXiLwXn2Bty4skr81+T1UYo08I
         +CuHidQMa23Z/PhfDzYcBVFLaQTNefZNJ+1CnomlPhItmI7IBxP7l4jaFmE4rccHJ74K
         rZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YpJGL4iVaQpB7OmyOGqz/Jf0POXHK+Nggf2uFVT9Buw=;
        b=d+BAujdZCQ8WLNMF4ZFe4M1vC3Y7z2r0wi+mC9+VJtDa9eHv0/DX5jYM//JrlEDdP+
         YciOFbCA5e0rAu4ouXaqv+Yg0mBajndqw5BsTbqmgoUhXs7tm7u5nyZB5yAx5ibmoWyl
         sAZ/0x1dPO7gomFK6pDMJiL42XVBka/oM66Ha4E2MK05i2+kQez7/7JIfOscZQJnJ1Te
         OP+9+RF3GxInFS2JAN6jKGsQwAxR2uFWHZMjtyxf+N9lp7JKiFGLRgBMJf7Ku6VexvA2
         O1qGjtOsKJH09f4Lgj3CplAAPKBboOJyr5aU6G1JjYL/f7qetLC+iIvlUtDaG1kz3jD2
         +BJA==
X-Gm-Message-State: AOAM5334Zcc/OBO/ns6tKW0cvGCNrNQFhcxC7hHhL8BKD9oR5gn2MM3V
        n9aiPwx8QdhLeHMH1pzdexD/fg==
X-Google-Smtp-Source: ABdhPJwsUsXFF9FMgUN8DIMvjHiLqOfSJCNaXznrpB/8orPbOgGOmPHLoZNHgr/DAnezYeTM6CpaYw==
X-Received: by 2002:a63:3116:: with SMTP id x22mr9671299pgx.278.1605735427551;
        Wed, 18 Nov 2020 13:37:07 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e6sm26575694pfn.190.2020.11.18.13.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 13:37:07 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/8] rpmsg: core: Add channel creation internal API
Date:   Wed, 18 Nov 2020 14:36:57 -0700
Message-Id: <20201118213700.74106-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118213700.74106-1-mathieu.poirier@linaro.org>
References: <20201118213700.74106-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Add the channel creation API as a first step to be able to define the
name service announcement as a rpmsg driver independent from the RPMsg
virtio bus.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/rpmsg/rpmsg_core.c     | 44 ++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h | 10 ++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 91de940896e3..e5daee4f9373 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -20,6 +20,50 @@
 
 #include "rpmsg_internal.h"
 
+/**
+ * rpmsg_create_channel() - create a new rpmsg channel
+ * using its name and address info.
+ * @rpdev: rpmsg device
+ * @chinfo: channel_info to bind
+ *
+ * Returns a pointer to the new rpmsg device on success, or NULL on error.
+ */
+struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
+					  struct rpmsg_channel_info *chinfo)
+{
+	if (WARN_ON(!rpdev))
+		return NULL;
+	if (!rpdev->ops || !rpdev->ops->create_channel) {
+		dev_err(&rpdev->dev, "no create_channel ops found\n");
+		return NULL;
+	}
+
+	return rpdev->ops->create_channel(rpdev, chinfo);
+}
+EXPORT_SYMBOL(rpmsg_create_channel);
+
+/**
+ * rpmsg_release_channel() - release a rpmsg channel
+ * using its name and address info.
+ * @rpdev: rpmsg device
+ * @chinfo: channel_info to bind
+ *
+ * Returns 0 on success or an appropriate error value.
+ */
+int rpmsg_release_channel(struct rpmsg_device *rpdev,
+			  struct rpmsg_channel_info *chinfo)
+{
+	if (WARN_ON(!rpdev))
+		return -EINVAL;
+	if (!rpdev->ops || !rpdev->ops->release_channel) {
+		dev_err(&rpdev->dev, "no release_channel ops found\n");
+		return -ENXIO;
+	}
+
+	return rpdev->ops->release_channel(rpdev, chinfo);
+}
+EXPORT_SYMBOL(rpmsg_release_channel);
+
 /**
  * rpmsg_create_ept() - create a new rpmsg_endpoint
  * @rpdev: rpmsg channel device
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 3fc83cd50e98..f1de73e0f2d6 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -20,6 +20,8 @@
 
 /**
  * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
+ * @create_channel:	create backend-specific channel, optional
+ * @release_channel:	release backend-specific channel, optional
  * @create_ept:		create backend-specific endpoint, required
  * @announce_create:	announce presence of new channel, optional
  * @announce_destroy:	announce destruction of channel, optional
@@ -29,6 +31,10 @@
  * advertise new channels implicitly by creating the endpoints.
  */
 struct rpmsg_device_ops {
+	struct rpmsg_device *(*create_channel)(struct rpmsg_device *rpdev,
+					       struct rpmsg_channel_info *chinfo);
+	int (*release_channel)(struct rpmsg_device *rpdev,
+			       struct rpmsg_channel_info *chinfo);
 	struct rpmsg_endpoint *(*create_ept)(struct rpmsg_device *rpdev,
 					    rpmsg_rx_cb_t cb, void *priv,
 					    struct rpmsg_channel_info chinfo);
@@ -75,6 +81,10 @@ int rpmsg_unregister_device(struct device *parent,
 struct device *rpmsg_find_device(struct device *parent,
 				 struct rpmsg_channel_info *chinfo);
 
+struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
+					  struct rpmsg_channel_info *chinfo);
+int rpmsg_release_channel(struct rpmsg_device *rpdev,
+			  struct rpmsg_channel_info *chinfo);
 /**
  * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
  * @rpdev:	prepared rpdev to be used for creating endpoints
-- 
2.25.1

