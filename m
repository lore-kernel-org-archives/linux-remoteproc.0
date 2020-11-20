Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34533C64E7B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 21:43:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D23092408E
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 21:43:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="deptNpfm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728622AbgKTVm4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 16:42:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728597AbgKTVmz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 16:42:55 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB61C061A48
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 13:42:54 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id b63so9122102pfg.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 13:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jz6JCYyURz+3oCPXxnAvwJDQutjB3zynS7kiUzNmMdo=;
        b=deptNpfmflZwWDqDo3Id15PhX9Tird93huJPB1xqkiBorMz3shPfzHEgJjdZqZDTlh
         If82pWCZXM4wMn9wMLaenvqyC6JzycJ4r8O/eV9XVR0hzPgTqcT+OMxmc45lNRvuAvli
         9Q2L1EbmmSHq0pxB2R5Hs5yS9BiscSj9rzYOE/+iUmYQ4kHkgIQZTsKtdUgZgx4UA6nA
         091p5WQkWqK02a8XJmNzfWy4/kr9L8XBctt/ZI0HtXBx8g9As7CQ3LkBUK2eQea2xjqV
         m7R2mjl+o2rdao9tUbpEol1eMDn38ERrtGe+FWX1GFLy5apZxHiSvEw3FF4ZLB9OpnDA
         /aNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jz6JCYyURz+3oCPXxnAvwJDQutjB3zynS7kiUzNmMdo=;
        b=pXYA7NyF7avIFhahJlQtqPGG+jC63aFwF85CzXRFl6d6IDQbdzJ1VVbfyl71cPXarN
         9H1h9SMF8M0H+MeahIKB9fv3uh1KujOm2hqn58OKjo9tcqUKbZO5ADfzB2sMBW79zysU
         2hnOWQMS6oPNNW/q2/pD4cYq58Sj657t++UbFBQaqqXWGuOsbyi3p+nQXr2pQxCRz5ux
         7zumANll/Ky53NOqFFLXJksMF8kAhBM2qYVZrqXM5sQJCtqHEcjlmp613Fy9nB//ouMg
         ij5YHaW2DCScPANs0JXpcZYdEskEWjvMVgLvxLWu99oKUfE+W8Sop5B9DnvsRXWbtVSt
         Egpw==
X-Gm-Message-State: AOAM531d/lhk7VxymKl89NZn3B5ZVQAwnWkF13zjcUKb5wnNSGnEZ2IM
        GPu6nDc0EEfTUPI0OZJ0paqWxQ==
X-Google-Smtp-Source: ABdhPJzrztUNm2PRB0j1V6mCKN9yvNLsSqqp0ukcJoMO+nxm5elkxfF7LGalzdde7CuNXiNyy0n5IA==
X-Received: by 2002:a65:6a50:: with SMTP id o16mr12342978pgu.292.1605908573849;
        Fri, 20 Nov 2020 13:42:53 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm4713197pfj.157.2020.11.20.13.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 13:42:53 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/8] rpmsg: Make rpmsg_{register|unregister}_device() public
Date:   Fri, 20 Nov 2020 14:42:44 -0700
Message-Id: <20201120214245.172963-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120214245.172963-1-mathieu.poirier@linaro.org>
References: <20201120214245.172963-1-mathieu.poirier@linaro.org>
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

