Return-Path: <SRS0=uUKq=D2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154FDC43457
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:35:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB30A223EA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 20:35:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bCztEImP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731765AbgJSUfO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Oct 2020 16:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731771AbgJSUet (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Oct 2020 16:34:49 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5733FC0613CE
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 13:34:49 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id bf6so411963plb.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2020 13:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eac2eJkbULJAn6wCUm/Bl8+weiuvIgiBhtMaMSxo0p4=;
        b=bCztEImPToOLpt4Vrgm2bFee+ACyaRaMzUI8kK8C/PWxoJCmHDWnCT+nK8qpT6+DXJ
         uOSMipESKk5A9eFh8IGFO2yD7ShORqDqO+ORkjsJ+rgYJfyDhHm4/C2pDXn7FXUF+4Z3
         fd5cftKW3BNHyQAR8+mGuGg87KKsaci7El24plXo4hQdIdFVbMFJRsVPUK4AtPUS0zPf
         0cDuTOKuXtwUB3gY5bHIMjEPRIadI4JyphBJMbcW1RBOQrApxwNraHndqCX/+g7XmfLV
         NIFUIsIphGzMjiCo6sFNIxlf3ZVf6xDp16cXYKmO6kyBhAZlQEF9RDNuQlDpaEaInMVt
         Uekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eac2eJkbULJAn6wCUm/Bl8+weiuvIgiBhtMaMSxo0p4=;
        b=sgMUcUuM0u9dCdPHyqdOS9KVkOyPU/4lP+Dc6Kvdb9JClcwhLoDB2lux4MYsKzCT8w
         EopjX+ANcp1SszjPTAATXgI3s6HLq4rhnAJth27mdvYiukkw4bCNBjsl5k4h2Iztzju8
         KLWylo/nz/QL3ut79YJAoRMQ4nTZf/ylkmSyIIuTrHt6NY0qMVnt3R2qWLBKsaL2m+il
         nw/5KfzMiy/M3WPLaFkNCEw+mMRdOOJ5SBzGmuBQRN5Kr45EgMKS4DFU7PMVu+qYvFro
         Ws/eKVda89GmUNqB1FPUGAxbAW4xx4NiqU6jgqmjdDsdSr9LrLlxZyZ7NbPQKX9GtW7q
         b5Dw==
X-Gm-Message-State: AOAM530rZbKijVMmWkWgDEagI0HRazJZKcY8ZyFl0KHB0MFvJk4/pjpM
        8zz3iiyj9HqMaT6F/St5B48tnw==
X-Google-Smtp-Source: ABdhPJz2/jTHYJG+YV8EPnH1F6PIcRNTNWnKolK/dOC8uBilBuLeN2P5VhPJLd8W1ft77hBPANBcAg==
X-Received: by 2002:a17:902:b113:b029:d3:c5c2:e667 with SMTP id q19-20020a170902b113b02900d3c5c2e667mr1564512plr.35.1603139688848;
        Mon, 19 Oct 2020 13:34:48 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q123sm631847pfq.56.2020.10.19.13.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:34:48 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/8] rpmsg: Make rpmsg_{register|unregister}_device() public
Date:   Mon, 19 Oct 2020 14:34:37 -0600
Message-Id: <20201019203438.501174-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201019203438.501174-1-mathieu.poirier@linaro.org>
References: <20201019203438.501174-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Make function rpmsg_register_device() and rpmsg_unregister_device()
functions public so that they can be used by other clients.  While
doing so get rid of two obsolete function, i.e register_rpmsg_device()
and unregister_rpmsg_device(), to prevent confusion.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/rpmsg/rpmsg_internal.h |  4 ----
 include/linux/rpmsg.h          | 12 ++++++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 810dd95cc9bd..0721294ed415 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -74,10 +74,6 @@ struct rpmsg_endpoint_ops {
 			     poll_table *wait);
 };
 
-int rpmsg_register_device(struct rpmsg_device *rpdev);
-int rpmsg_unregister_device(struct device *parent,
-			    struct rpmsg_channel_info *chinfo);
-
 struct device *rpmsg_find_device(struct device *parent,
 				 struct rpmsg_channel_info *chinfo);
 
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 97098a90c496..8ee1b1dab657 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -164,8 +164,9 @@ static inline __rpmsg64 cpu_to_rpmsg64(struct rpmsg_device *rpdev, u64 val)
 
 #if IS_ENABLED(CONFIG_RPMSG)
 
-int register_rpmsg_device(struct rpmsg_device *dev);
-void unregister_rpmsg_device(struct rpmsg_device *dev);
+int rpmsg_register_device(struct rpmsg_device *rpdev);
+int rpmsg_unregister_device(struct device *parent,
+			    struct rpmsg_channel_info *chinfo);
 int __register_rpmsg_driver(struct rpmsg_driver *drv, struct module *owner);
 void unregister_rpmsg_driver(struct rpmsg_driver *drv);
 void rpmsg_destroy_ept(struct rpmsg_endpoint *);
@@ -188,15 +189,18 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 
 #else
 
-static inline int register_rpmsg_device(struct rpmsg_device *dev)
+static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
 {
 	return -ENXIO;
 }
 
-static inline void unregister_rpmsg_device(struct rpmsg_device *dev)
+static inline int rpmsg_unregister_device(struct device *parent,
+					  struct rpmsg_channel_info *chinfo)
 {
 	/* This shouldn't be possible */
 	WARN_ON(1);
+
+	return -ENXIO;
 }
 
 static inline int __register_rpmsg_driver(struct rpmsg_driver *drv,
-- 
2.25.1

