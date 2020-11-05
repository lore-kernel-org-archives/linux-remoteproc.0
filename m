Return-Path: <SRS0=+gsc=EL=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0CFC388F7
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 22:50:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1056520715
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 22:50:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dg+UmQq4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732563AbgKEWu4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Nov 2020 17:50:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732446AbgKEWug (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Nov 2020 17:50:36 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F28C061A4A
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2020 14:50:35 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id x13so2508983pfa.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2020 14:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YpJGL4iVaQpB7OmyOGqz/Jf0POXHK+Nggf2uFVT9Buw=;
        b=dg+UmQq4rnbB69SgYtfcIvF6lUBkAgAB6O6+PdTlzR9M2yWMrtGZzEG9Fxm5w3TSmn
         kWibwcXh7r+zTrI19GDA4rKKH46l0c5JIdZ7wizOU5wLB9BVZXE+2Xr7wQKC2+zsLpmG
         L4+tHyNGy+GMTfsb/VF68kXIpsZKIF0RfVIRODYpi6CullEQREB/lJOLn1ZYpAiVTE5p
         j35BxlcDXbbI5nsvk+XWku7QEgqlkdlzN/tCUKzzFPkMIHS76W0AhwoZL0A+5ZhixNf2
         b2hhwVl9FPcb+2lyR9UG2FPoLn4OF0NkdlN1z9Hnsh9iBgTQspXY1lfiRGkOny9tpE5+
         imWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YpJGL4iVaQpB7OmyOGqz/Jf0POXHK+Nggf2uFVT9Buw=;
        b=aq6R7lx5YZqwBD4vr8XL6HhLqJzXgkqQJ8a8eKSI9+fsUzPg6Yo68lrfVIlQx1qXBJ
         y1uHM7nZChKBh+z0+nXjhA1LyQcQg/pK5ssyL0gUW0QTnkgNQDbNque47GrOr43vXQQ1
         h89NXOF4kS/6kPwjfV8arLji7brgmzbmYsIzX/aNHfweeUUSQUNsOnJrb6ULI0wdh7gZ
         ORe0HHL1mGZ0Omczj3QsHlBHAx/pTIks0EduLKRNvg/I1h2u6HvSSBgUXVpy/LBVfEsS
         L+LhdQLTqwTobNELzAfMGqkR6mLQnguqrzMcwzg0WuYF4MRIqIJ2BwPAJxpNm8Xdhb/7
         Q+PQ==
X-Gm-Message-State: AOAM5339O694suUU91JF9hynr7224sN6kGgOJWKVz5P+FJ7gaiUxlGU+
        D2HKHc5yAeSdEg8LFZ+PlRs5Dw==
X-Google-Smtp-Source: ABdhPJwSs1s+/D8WPb1XQ+VXRi0m9dgYGdtIA44gMmVmmSHZi+HT+vC9cQ3RZzLicxyrqCxH00HCTQ==
X-Received: by 2002:a05:6a00:14d0:b029:18a:add4:9df7 with SMTP id w16-20020a056a0014d0b029018aadd49df7mr4397025pfu.2.1604616635481;
        Thu, 05 Nov 2020 14:50:35 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id d145sm3854501pfd.136.2020.11.05.14.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 14:50:34 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/8] rpmsg: core: Add channel creation internal API
Date:   Thu,  5 Nov 2020 15:50:25 -0700
Message-Id: <20201105225028.3058818-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
References: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
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

