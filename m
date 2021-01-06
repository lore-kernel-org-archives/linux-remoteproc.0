Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96808C433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 03:59:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6405C22D04
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Jan 2021 03:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbhAFD7W (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Jan 2021 22:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbhAFD7V (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jan 2021 22:59:21 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD79AC06134C
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Jan 2021 19:58:41 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id x13so2125616oic.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Jan 2021 19:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jeaye40HSgiogM0RtB9LhClup78Pf9qm+C4hmRRt0II=;
        b=v3kccsmQ30hRPQn39cMqEBN0laDnsXHic1iZOBvfhjspwhVbm+36D1GdZVBq70NGvd
         IG5y+u0/U0dFAg6hNyn6/KpdZ9Yk2rVDPPYWmA5Oe6eHcyHTDR/asQaipc9q7uB9mj9q
         HzuoeUdYDg8khuVRu4Wi4TJqPf0I6dNTpEyS+R4mkWoX0HF/4tD0NHxnQzgGCHvAx/hd
         kg9wnnbu+TZPXCDup/9TtStkszCL3xUwYHjQzdyk2yXeLiggc8m7OnXwhqdbAUcnK17h
         feio65C0JNwPCC08DY/jBXz3GKChgDieT/jBA1xipq7Ugjss5fimyV/DAMFBNshSN8cK
         Ptiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jeaye40HSgiogM0RtB9LhClup78Pf9qm+C4hmRRt0II=;
        b=Ix5cFtnOhRpESc4U81WxNXvjKgxjc6agbqw7jj8OeqKeZsyJZU98BNwvgpKR8sRkzn
         Mi0DrUZnVbJj0Yeca820w0bkIsP8YqDNLSTogCOBEMjebwHJkf5RWHR5SJ6VJzBG2H1E
         EOMlCGFS45GdzoHHMM9u0IwdIbiP15+zIhXyC0BcZVkF6qDmLHFbrhOMnShHoif19u80
         MjBqyjob2bWna5ID3KJe8XXM68iWD59TRYmD2GRWZFhYKVYFk1NRsN9uOvN4r2O7a25m
         mPyGzj/S6Q0kzZD1cCqrzJbj4Px61GxustY+x6EGmrrvQDmXVzKMt05Ribx1vW2hEZ9t
         OUew==
X-Gm-Message-State: AOAM531q8m6Nm9hzNphKhHjYyejUNjL7czF6jPNbJHMTYTbtm+5Yv7/r
        6uaNSdED/fOhuaF//vlBv2dkgQ==
X-Google-Smtp-Source: ABdhPJyOrloJHKeu0LaF+eSlKzSYLWavopnvRTr7Jj+RnWKVXeSi1bL32oBlfVt3tQ8hmrvlDhpQGQ==
X-Received: by 2002:aca:3306:: with SMTP id z6mr1897359oiz.141.1609905521129;
        Tue, 05 Jan 2021 19:58:41 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t2sm292350otj.47.2021.01.05.19.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 19:58:40 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] rpmsg: glink: Guard qcom_glink_ssr_notify() with correct config
Date:   Tue,  5 Jan 2021 19:59:05 -0800
Message-Id: <20210106035905.4153692-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The qcom_glink_ssr_notify() function doesn't relate to the SMEM specific
GLINK config, but the common RPMSG_QCOM_GLINK config. Update the guard
to properly reflect this.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 include/linux/rpmsg/qcom_glink.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/linux/rpmsg/qcom_glink.h b/include/linux/rpmsg/qcom_glink.h
index daded9fddf36..22fc3a69b683 100644
--- a/include/linux/rpmsg/qcom_glink.h
+++ b/include/linux/rpmsg/qcom_glink.h
@@ -7,12 +7,17 @@
 
 struct qcom_glink;
 
+#if IS_ENABLED(CONFIG_RPMSG_QCOM_GLINK)
+void qcom_glink_ssr_notify(const char *ssr_name);
+#else
+static inline void qcom_glink_ssr_notify(const char *ssr_name) {}
+#endif
+
 #if IS_ENABLED(CONFIG_RPMSG_QCOM_GLINK_SMEM)
 
 struct qcom_glink *qcom_glink_smem_register(struct device *parent,
 					    struct device_node *node);
 void qcom_glink_smem_unregister(struct qcom_glink *glink);
-void qcom_glink_ssr_notify(const char *ssr_name);
 
 #else
 
@@ -24,7 +29,6 @@ qcom_glink_smem_register(struct device *parent,
 }
 
 static inline void qcom_glink_smem_unregister(struct qcom_glink *glink) {}
-static inline void qcom_glink_ssr_notify(const char *ssr_name) {}
 #endif
 
 #endif
-- 
2.29.2

