Return-Path: <SRS0=WYtW=6P=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EF5C35280
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 May 2020 20:49:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC8DE208DB
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 May 2020 20:49:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e8vDMWTh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgEAUt7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 1 May 2020 16:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgEAUtx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 May 2020 16:49:53 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6728FC061A0C
        for <linux-remoteproc@vger.kernel.org>; Fri,  1 May 2020 13:49:53 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id v2so4025023plp.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 01 May 2020 13:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rPSBjxIDwygeKfuxnDmh7us54CEsUpI3IRfmPSCNbNw=;
        b=e8vDMWThBfs7a6yjwzTrCktMA4Cj85h/E2aFUagMlYcIodl0zfeQXFeak79rnpFzgB
         4J/sw5obj9GexZhcTYflw7H3FNTIJ0/KGIhDrYYhFYpBXZc20GRIv+m82Jz3ikguWYt0
         0/9P6OmcDyM02KylPCbXH5uaBDzvFwk4SFn6oAjK8PpMLgs7Q918LjJ+gqtNGLJ8A+Qq
         /jrXfzMb/1vHB4DB9kfCP+0OYB+nHHJUFx/MgcDpgP3g3WpJ8S87/nH1MeBPreTIj4xj
         Am8z8RB6aU2ihWUGYOoT7qPdgpfGk7T/WSaud83xVdu78gkHmW7x3MU2cNb0FTjpPnYT
         yvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rPSBjxIDwygeKfuxnDmh7us54CEsUpI3IRfmPSCNbNw=;
        b=DIPRmxhhGcNSDhYmsn5OQH/0txwrctAZlnDYOpcAjtMAYNSXXfkfRtYaqm74btKH2j
         O3seDI1Q+RHt9qlpbrMlS/witPXBBv/KtZtuMDrDEbCXrjC29wtA4QHlduWs8i4jW0sN
         u/TSMtelA7Sq9AdLNokaMIKAfCAEl0pe9hwqmwel8ANOmrqcBLrIenpJUjUn3sgmVCTL
         vOkC7EYEkVy8bsIJ0xR7KFF6es08Tk7T7GRg3H5eqHZCMJ+ggZPwfrGi7L3GIt/FPA/+
         y1oLbWZrRAjnnhwrMKIOuxYoBhIDRAxUwrtri9T/LQQiKpmPkQzVr06JOD3FCApEHhdm
         9t5A==
X-Gm-Message-State: AGi0PuaTfdpVjIT2i9zlgAGQ2G9500Z/Kv3tIDyY+c8BimUBvucgIrDE
        trJ2QsoJWaZK3bLZWlpPH7wOVA==
X-Google-Smtp-Source: APiQypL2wNFyMGZCRDYqGDzmUrxENm/GLU6xsfGnr1DsG0kAr5xNgwDOXGaiMeDLtTojEPQZdKBFWA==
X-Received: by 2002:a17:90a:6d03:: with SMTP id z3mr1762925pjj.32.1588366192944;
        Fri, 01 May 2020 13:49:52 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 23sm497072pjb.11.2020.05.01.13.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 13:49:52 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] rpmsg: core: Add wildcard match for name service
Date:   Fri,  1 May 2020 14:49:49 -0600
Message-Id: <20200501204950.18629-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200501204950.18629-1-mathieu.poirier@linaro.org>
References: <20200501204950.18629-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Adding the capability to supplement the base definition published
by an rpmsg_driver with a postfix description so that it is possible
for several entity to use the same service.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/rpmsg_core.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index e330ec4dfc33..bfd25978fa35 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -399,7 +399,25 @@ ATTRIBUTE_GROUPS(rpmsg_dev);
 static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
 				  const struct rpmsg_device_id *id)
 {
-	return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
+	size_t len = min_t(size_t, strlen(id->name), RPMSG_NAME_SIZE);
+
+	/*
+	 * Allow for wildcard matches.  For example if rpmsg_driver::id_table
+	 * is:
+	 *
+	 * static struct rpmsg_device_id rpmsg_driver_sample_id_table[] = {
+	 *      { .name = "rpmsg-client-sample" },
+	 *      { },
+	 * }
+	 *
+	 * Then it is possible to support "rpmsg-client-sample*", i.e:
+	 *	rpmsg-client-sample
+	 *	rpmsg-client-sample_instance0
+	 *	rpmsg-client-sample_instance1
+	 *	...
+	 *	rpmsg-client-sample_instanceX
+	 */
+	return strncmp(id->name, rpdev->id.name, len) == 0;
 }
 
 /* match rpmsg channel and rpmsg driver */
-- 
2.20.1

