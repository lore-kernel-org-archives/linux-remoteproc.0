Return-Path: <SRS0=YAOw=57=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5C6C2BA2B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Apr 2020 20:49:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3774220732
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Apr 2020 20:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H8SbRls/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438349AbgDOUtD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 15 Apr 2020 16:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2438343AbgDOUtD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Apr 2020 16:49:03 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13D0C061A0F
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 13:49:01 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id cl8so358053pjb.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 13:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zAUMwcz72DsKEuRs9bmL8Y0NybdOC1J0IH9IhQjMIJE=;
        b=H8SbRls/eH+WXZTeEn017Mn94wfGTRZ63+KJ84mB/Sx9X6+gmd7jHt2e1KOHDb+H2v
         muxqS+OeqsD++0tyg/qpzsRMD7e15CqwIlmrtfnyEg2Uqjhp7TQFCOEJGUDlW9sXhqBV
         gOq55woguGrjyT9mE6P2euZNMBXyiFBzmJcVSr69aFnCS4I46kH7AvI0hihXdtxL++ar
         2JhP3aizQ3oNVB+W9AyvVThNXjl4Img4lT4YHPzqs+HsFy7bMFzOrLeYeXEbtVPsAfIg
         pWe8O9SV1uNnCs1sI1WKgkjYTvj09xmP6m2ahlPi5k/der8QpCVVpwEerfetP7BlpQxQ
         JkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zAUMwcz72DsKEuRs9bmL8Y0NybdOC1J0IH9IhQjMIJE=;
        b=bRkPV/ww7+WEDf1ue2kNWvoHIY/8z6zf7aPk/buHRnhomdU5w7+fXYe7UKIoJUUtoC
         D1m44fGGptOKwTJiMa1glW8ElsfkuWkmDICY7DefYUp+o0IEPqWjLdHirBzhxfTB85bH
         M2w7dUe9sKEfL+ZRwoZTG8H3W53BL33Fz23TXOHYtJgI26x3NOti3dVrrQdzNFXeJgrm
         fJTxGLng5OWGXLHWILQh0O6La+q+6JtMHWGpiaAgE2SE6aWN9QItbZN53rGw9U+Zd9ck
         f1cZH12YE6l48cJRZ3KpfFGaYw6R8FHZZbbxGYzfoamCdHEOJ4Uj+ZvX/rGzHaTRWedp
         F7Ig==
X-Gm-Message-State: AGi0PuaO63TF30hhPEAnYli4YEwUGzhxqUSVCCdsI7BRwG99xTcHe1E5
        F5A3Y4IUmbfR2RF1o4ZsPyAYyA==
X-Google-Smtp-Source: APiQypL0QuvSDhEfisupDM9x2X5iJzOnRw1su0Bt0l9c1CMw1ilBYIgBy+dToz3M/f1hgmjWwsJPhg==
X-Received: by 2002:a17:90a:2602:: with SMTP id l2mr1255975pje.110.1586983741413;
        Wed, 15 Apr 2020 13:49:01 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i13sm14461861pfa.113.2020.04.15.13.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 13:49:01 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, elder@linaro.org, Markus.Elfring@web.de,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] remoteproc: Fix IDR initialisation in rproc_alloc()
Date:   Wed, 15 Apr 2020 14:48:52 -0600
Message-Id: <20200415204858.2448-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415204858.2448-1-mathieu.poirier@linaro.org>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200415204852.WBnqdmiD8Fy2pJzKfNpOVaj0LGf_df6feCo9TfoTpNg@z>

From: Alex Elder <elder@linaro.org>

If ida_simple_get() returns an error when called in rproc_alloc(),
put_device() is called to clean things up.  By this time the rproc
device type has been assigned, with rproc_type_release() as the
release function.

The first thing rproc_type_release() does is call:
    idr_destroy(&rproc->notifyids);

But at the time the ida_simple_get() call is made, the notifyids
field in the remoteproc structure has not been initialized.

I'm not actually sure this case causes an observable problem, but
it's incorrect.  Fix this by initializing the notifyids field before
calling ida_simple_get() in rproc_alloc().

Fixes: b5ab5e24e960 ("remoteproc: maintain a generic child device for each rproc")
Signed-off-by: Alex Elder <elder@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e12a54e67588..80056513ae71 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2053,6 +2053,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.type = &rproc_type;
 	rproc->dev.class = &rproc_class;
 	rproc->dev.driver_data = rproc;
+	idr_init(&rproc->notifyids);
 
 	/* Assign a unique device index and name */
 	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
@@ -2078,8 +2079,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 
 	mutex_init(&rproc->lock);
 
-	idr_init(&rproc->notifyids);
-
 	INIT_LIST_HEAD(&rproc->carveouts);
 	INIT_LIST_HEAD(&rproc->mappings);
 	INIT_LIST_HEAD(&rproc->traces);
-- 
2.20.1

