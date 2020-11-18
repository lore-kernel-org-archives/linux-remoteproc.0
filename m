Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C4EC64E7B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 21:37:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC11920715
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 21:37:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="no8NmVJ0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727271AbgKRVhQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 16:37:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727237AbgKRVhL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 16:37:11 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE17C061A53
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 13:37:10 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id y7so2366407pfq.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 13:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jz6JCYyURz+3oCPXxnAvwJDQutjB3zynS7kiUzNmMdo=;
        b=no8NmVJ0uLTOe3xrw/pOr/wq5Axf3Jpz0z4ao3AI6IPNiKgl7fYcBh3rwBhyK1Lx79
         Y1K7O6ni78WsDi7JgJ9K0J1HPzWeFb81ybauXhBeLK8x9BrU3ZLiPUqIYuUPb2m6G+2l
         SrDq3Q+nzTvwq6a47nsl2JGHfqAJAPOiWNXP5i6Zv4HnFxxL59/jawbiBIvPm3yAm+RV
         AilcGgXEeQoz3c8TPvsi60FO3rik1OI166hXkbdyK51dpDQZCIAMZKM3LnDtdCU2lJWz
         Zm8/TF6b1mXo8DOdj5m4UzaXruMDXEqwMYbNLX5gDh1JoKwqlHZ27YZDniQag+tJyuNy
         QOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jz6JCYyURz+3oCPXxnAvwJDQutjB3zynS7kiUzNmMdo=;
        b=fXB6m1atzDnoPa062LQVEj+qRiKQhBEjoYnfVaxA0udx2hGegsH2DwiPD8IxMsP7PG
         CqZ/ohGwVym1Coh+PpeSPOCRN8GehHM6ThG5pm6DhGsyjmGAOsWziqGK03Tk+ViwpFlg
         9lHALwIa15cVQuLctIDJ6dtX2vC6zqfZUX/zH7jz6OmseMHf1v+WhG/peoLAHmL5364d
         2QnX5e/27yUishzrNGFmnvQrkA70rg0dqYLmGIzz8NuSbesFGWQRvz7ajl2L0BLUJLs8
         d4qzAJ7u8QFOoqR2ZDYRiripMOgU5NNfEDL97vqhuVPxaUXuVDbx1s5OkDILRmWJvEvg
         X3Dg==
X-Gm-Message-State: AOAM531TsDRh0YZ0EnH3FPxCXcZMROs5KoxKVCjikksVC55JUntJOfjf
        +TWO5SLva4wgq5g9jurwEWEVyA==
X-Google-Smtp-Source: ABdhPJyO9knuWxEulG+GqJzfpyUzibox6S+EV5G2TvAeje7vTPsO4RzlJ1cMOJzAnYyGP/bMMhpIsA==
X-Received: by 2002:a63:1805:: with SMTP id y5mr9607064pgl.27.1605735429652;
        Wed, 18 Nov 2020 13:37:09 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e6sm26575694pfn.190.2020.11.18.13.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 13:37:09 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/8] rpmsg: Make rpmsg_{register|unregister}_device() public
Date:   Wed, 18 Nov 2020 14:36:59 -0700
Message-Id: <20201118213700.74106-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118213700.74106-1-mathieu.poirier@linaro.org>
References: <20201118213700.74106-1-mathieu.poirier@linaro.org>
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

