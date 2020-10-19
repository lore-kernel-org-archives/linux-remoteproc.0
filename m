Return-Path: <SRS0=uUKq=D2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93BAC4363A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:35:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 578ED22403
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:35:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zRE1aOBi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731757AbgJSUer (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Oct 2020 16:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731751AbgJSUer (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Oct 2020 16:34:47 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A629C0613D0
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 13:34:47 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id h4so461780pjk.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 13:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xnj3SkDDlv12uyfMXCuN86NVQaJ7sKZdrNRQOSosCNE=;
        b=zRE1aOBicUmfrA+lPasXqFAsOQkbqmQkyaF+pwaQgnDEVwu5SUAWXe+TeVJJp1Nj0S
         FFH4/ESNlZojU/2QTo0ELxIWFjcGWWM7EI8svyDmLj3zn8SA9VKAaeliO/7dY3FIjjPo
         R5SKtNo0367gGnkhus9LVCDUqX+EOvdC/L7Gjsx6lMqMHmF5cl9ePLFJVZnHRRa8FM6L
         rgsJf1rCYMSxTXnE8oONAMQOp0XKkQgtP4mlfrkK64dpEXUA76XkVrp1Jiok93S3CEHT
         5NOxjspAw0BQbTMaRQyVqLLu0pWOITIw5xNEHZLsYqe83nips2WSy1HYEu9RzmaMkkMq
         0DTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xnj3SkDDlv12uyfMXCuN86NVQaJ7sKZdrNRQOSosCNE=;
        b=E+VCBxws2g6QBlMnLyciZQ+AE9noHAEUgSGUuzRr5ezFTG6iNDxdYZoBn9pfyBTdPG
         7m5F61Q8BB83a8CCpSPV/AjdQQIiJ8ekBjdRmFJtg/7fqqYDwL62ZLywiEZSQPITYaWW
         IjYhG8+LMBL5k7tpufirp18p9RejXfzx5ghbENl2D70qp94E1AjZ5OaYYt8JttnHXO4W
         IrBJtXicyPkR86vaHVaLiXYc7dwh+uJP3Xp2Uu1ljq5+ViINwGj2I02nCs3jTKTMwQVx
         h56PTFXHvZQG6IWt0o2hJeDzViTincRe9u0UEVpvhDmAaMae5AJpBzvKEjsvHMt0RvU6
         PPmg==
X-Gm-Message-State: AOAM530xD6RXB/ZjkdqQ6CpBi9aYMKng/AynFiNlG27trQ+kDGdSMCfb
        swjz9IUgY0m2dytmCnfd4S+8lQ==
X-Google-Smtp-Source: ABdhPJwHu9ZU1kfkOs2ATvJpllw9Qb2NqdDUHZwj1RLgrRR3YXnBQJD1+Zsmm/rwZ3t0sJs0yk7eQQ==
X-Received: by 2002:a17:90b:11c7:: with SMTP id gv7mr1179755pjb.228.1603139686537;
        Mon, 19 Oct 2020 13:34:46 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q123sm631847pfq.56.2020.10.19.13.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:34:46 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] rpmsg: core: Add channel creation internal API
Date:   Mon, 19 Oct 2020 14:34:35 -0600
Message-Id: <20201019203438.501174-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201019203438.501174-1-mathieu.poirier@linaro.org>
References: <20201019203438.501174-1-mathieu.poirier@linaro.org>
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
index a6361cad608b..a5c4b80debf3 100644
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
+struct rpmsg_device * rpmsg_create_channel(struct rpmsg_device *rpdev,
+					   struct rpmsg_channel_info *chinfo)
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
index 3fc83cd50e98..810dd95cc9bd 100644
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
 
+struct rpmsg_device * rpmsg_create_channel(struct rpmsg_device *rpdev,
+					   struct rpmsg_channel_info *chinfo);
+int rpmsg_release_channel(struct rpmsg_device *rpdev,
+			  struct rpmsg_channel_info *chinfo);
 /**
  * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
  * @rpdev:	prepared rpdev to be used for creating endpoints
-- 
2.25.1

