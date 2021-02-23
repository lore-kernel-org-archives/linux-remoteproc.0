Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD751C433E6
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:46:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8752264DAF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhBWXp3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 18:45:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233922AbhBWXma (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:42:30 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB51C061A29
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:33 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id e9so16366plh.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9dNXLfIEwaBmyxdvGPLcXIZoYDoiye95/dFOxo0lMe4=;
        b=FacrPQa+2h15QlpIr28yddn6IuvoguAmRAZYlTCp41sRk7VfSbFMMi2D9zF2VeoMVT
         lvlrXDCraOoq8hw/Hd6ybksPaLxpOFGajiMU2ieGncuh6NybqdpyvHRRkwXU/UjOBGM+
         TUQgRGVRW4k05wOMkgzVXIYlWss60zHMqwZvLSiwQsmkXhgVszeak0UuXk5E6Iw8z7Hd
         wu1QmI7wa2PfmOxwH1qiYm/V8xlSYqdvXwvMgazNhLtLuLOwSiPZN3DdNyRAgga/VkdD
         END38q1jtAVeC7pWOVX2IAEp9taTPnTKdHNiWUZ89mdX6PgHv+/nG5g/As1233+t08MD
         YRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9dNXLfIEwaBmyxdvGPLcXIZoYDoiye95/dFOxo0lMe4=;
        b=dzDVChQVGPYCI0Ym2INGEHtjAjTkar2U91MUDqwesGaWCeQwBUysIeKwJ7rOPSsVLc
         FXHBXd12LXkzC46Ic9fhHKLbeDQR+AXWIkMr6SrGxAckHQkNSmEQ0FZodmZ7j7KYetu1
         2D2HNPuEP3dZTK/OpltyoKCLFXL1DslLNLbllETAyxdnxnbwx98BbOAM9EsEb6H/d3jc
         xpTQdUz9OY0fxwybpVs6woGVDBCC6ifDYe4H4nJdRx3Sa+x5zAxiRRe5n/oKWJXnz76J
         EUCwkSg/1RbHKvATemCHXLMPWIAtYmZ6LnmLCq6qMzlkibZjEq4Z0/iUjdjAWlyVoFSy
         rygQ==
X-Gm-Message-State: AOAM5303jzrsjRujnKeBjuET5QJaIbITlOeEOjuF/INHgtY6fO4R/6Kl
        m1hU1ORSJDH8AEQdRhSiRDC5Uw==
X-Google-Smtp-Source: ABdhPJzDAGh6wh3Npt8Bm/YQ7HhxIWxiSdzM/fQpCszCDx97I+KOxtsQXnMjbwrn7gO/M6IugUvOzA==
X-Received: by 2002:a17:90a:4a0a:: with SMTP id e10mr1161914pjh.112.1614123333381;
        Tue, 23 Feb 2021 15:35:33 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:33 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 16/16] remoteproc: Refactor rproc delete and cdev release path
Date:   Tue, 23 Feb 2021 16:35:15 -0700
Message-Id: <20210223233515.3468677-17-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_del() and rproc_cdev_release() to take
into account the current state of the remote processor when choosing
the state to transition to.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
New for V6:
- The RPROC_RUNNING -> RPROC_DETACHED transition is no longer permitted.
  to avoid dealing with complex resource table management problems.
- Transition to the next state is no longer dictated by a DT binding for
  the same reason as above.
- Removed Peng and Arnaud's RB tags because of the above.
---

 drivers/remoteproc/remoteproc_cdev.c | 10 ++++++++--
 drivers/remoteproc/remoteproc_core.c |  9 +++++++--
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index 2db494816d5f..0b8a84c04f76 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -86,11 +86,17 @@ static long rproc_device_ioctl(struct file *filp, unsigned int ioctl, unsigned l
 static int rproc_cdev_release(struct inode *inode, struct file *filp)
 {
 	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, cdev);
+	int ret = 0;
+
+	if (!rproc->cdev_put_on_release)
+		return 0;
 
-	if (rproc->cdev_put_on_release && rproc->state == RPROC_RUNNING)
+	if (rproc->state == RPROC_RUNNING)
 		rproc_shutdown(rproc);
+	else if (rproc->state == RPROC_ATTACHED)
+		ret = rproc_detach(rproc);
 
-	return 0;
+	return ret;
 }
 
 static const struct file_operations rproc_fops = {
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 00452da25fba..a05d5fec43b1 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2542,11 +2542,16 @@ EXPORT_SYMBOL(rproc_put);
  */
 int rproc_del(struct rproc *rproc)
 {
+	int ret = 0;
+
 	if (!rproc)
 		return -EINVAL;
 
 	/* TODO: make sure this works with rproc->power > 1 */
-	rproc_shutdown(rproc);
+	if (rproc->state == RPROC_RUNNING)
+		rproc_shutdown(rproc);
+	else if (rproc->state == RPROC_ATTACHED)
+		ret = rproc_detach(rproc);
 
 	mutex_lock(&rproc->lock);
 	rproc->state = RPROC_DELETED;
@@ -2565,7 +2570,7 @@ int rproc_del(struct rproc *rproc)
 
 	device_del(&rproc->dev);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(rproc_del);
 
-- 
2.25.1

