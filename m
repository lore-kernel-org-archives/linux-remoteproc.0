Return-Path: <SRS0=+gsc=EL=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039D8C56201
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 22:50:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFB262087D
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 22:50:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lyq6cBR5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732475AbgKEWuv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Nov 2020 17:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732493AbgKEWui (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Nov 2020 17:50:38 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C634C0613D3
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2020 14:50:38 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id e21so2378069pgr.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2020 14:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jz6JCYyURz+3oCPXxnAvwJDQutjB3zynS7kiUzNmMdo=;
        b=Lyq6cBR5bESwgDz7BezLJTREjb84mC72Z4RznrhqvsM1m+LcHkR/OBZ6evj8vv8K/Y
         d+uakuZvP05xdUAYUHd02N3vT1SwapEoFpR4b05gQ3XWX71+tmc3OxjJ3nEHeEWJyK+q
         JsdSpSBGDSbB5R3mxfcXe2GWes4kUxXVyCR0zZXyXdN8DA5HF3DGfcjto3qdjU2NSGBD
         EkJhQWHbRSUTC+Ds3m4WK9nMNEDPollDiegkcfYAXUk18VVC2w7l/VBRGyzIBtC+sN+P
         GLAln0Tax0kGF5IcP+x15WFtAc32t1w5BOC8mhvFvizwe48G5lygy6NLCQG2TO/tBrWR
         a4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jz6JCYyURz+3oCPXxnAvwJDQutjB3zynS7kiUzNmMdo=;
        b=T5qPYe25Yu54ELhLMIACwwNwp4zWOIcOA2udxyogJVxn8FXR1kWAYlf9F37ro6DCHE
         TEdIy57CsyUkgYMmd9iPZwUiY9bjAA4yE2DKeLFGf7yCnaAL9cWzoTub54YwoiRiTA2q
         OJLbuq/n3fEkaGu7do4K72GkFr6ZWxwMaHg1kGt7l/7aEzxRL9eU52s30OtlqlXzN7ud
         LN9zmaK/oNgRRCQNhEwru3h3hHKK4LzMZIArjKfwyz2jNTQWR7j2u1xCFQ2pMPYUxsVo
         Jv0QK6T8ewI8dsGLgSDSgoweaWNA5bvGrvaIE5T9eV/El60k3m1UiMxJzKOOqLOxqdb1
         0phA==
X-Gm-Message-State: AOAM530O+dcEDMu8ZIfFWYlw8v5jxd1FdiwpE4iSCTyLnsRbebM/Es4H
        tSyBbgFdsA2+AgQXfhvTzUrnUQ==
X-Google-Smtp-Source: ABdhPJwVscyvOD2/BQ8bxMexnSNdtAko1LauXmsbgiYM3BeHOTcfB1XMH1i2d+8Aiq9BtCLJwIsWsg==
X-Received: by 2002:a17:90a:2c46:: with SMTP id p6mr4655524pjm.166.1604616637666;
        Thu, 05 Nov 2020 14:50:37 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id d145sm3854501pfd.136.2020.11.05.14.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 14:50:37 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/8] rpmsg: Make rpmsg_{register|unregister}_device() public
Date:   Thu,  5 Nov 2020 15:50:27 -0700
Message-Id: <20201105225028.3058818-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
References: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
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
index f1de73e0f2d6..a76c344253bf 100644
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
index faf2daff6238..a5db828b2420 100644
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

