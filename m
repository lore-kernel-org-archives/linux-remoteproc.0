Return-Path: <SRS0=tiv6=65=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FD4C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 May 2020 20:56:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2184205CB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 May 2020 20:56:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0F5P6QR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgEOU4r (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 May 2020 16:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgEOU4r (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 May 2020 16:56:47 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD27C061A0C
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 May 2020 13:56:45 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y18so1557139pfl.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 May 2020 13:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=orFzK+6AOl9Sz0N2w3p5SSg3SPmMkMh0jb6dZXjNAFs=;
        b=Q0F5P6QRitFiue2wR/cDiIouQJpg6OlMJOAvhOfJJJV+BCkRlICHzFBZNVMRT9R79n
         prN8/iO9zCtF66LVtSXtG8imACYZs01Q4RF/4bHHCZXUq0vEigqUvK56ZWhZCY+6jQDb
         RtOKwQM+tY1YAHd+htG7fa6bFaM0G2w4saA7Db60YYgHMhUgtz0SZ3fJ/9HkHV625Zmw
         l5/6sdMVBK3xLrqyiwjY+ZGXgVCdSGLNfAWzBi6WdpX3QhAJEBKZNLBir767ShjgfdwN
         l5rOwQoE4LOK6tCfNTl/4jpuVlp5rTMHIo2pLNBKNAL1RZGMVfTYn/wBT6YnEcp78pfg
         AMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=orFzK+6AOl9Sz0N2w3p5SSg3SPmMkMh0jb6dZXjNAFs=;
        b=Z5C/fATr0hi16wsa0zpFW96eQVTUXyap3D4pOj4wy8sxp6a4JZsigWAFZjsP/+WWqI
         Gqotl7sv2zWTq5AmEW0yAEbtGsISfL3VOY53733EY+z6KgSSwwfXaX6jsZ9UBRHhQvoK
         PCldcYviqyHDyk13egTS3jaI3LDcDSuhQGCYu1XpHHZmCQB2Hg9noYiblkuhZ/JEVvj+
         JKHa1+gOpyexECIIjarYfHxZaYbiIb9+peP+yOJ6B0gx/79+SuI8fY1HkETZRgDKyG14
         ONqlFcRwwnI5T5+ecip9fwpMtVxXT5aHoHCv+BrmHCDZeoXTguH+a+xWcp7izIZjI+UE
         H0JQ==
X-Gm-Message-State: AOAM532SoLheHUUGQImAY4ZIWJZYMVUlDsCGQH1OdmZnHluHVlLyf5Pj
        857j3uvY+plGRrFVF9lHJZUtmQ==
X-Google-Smtp-Source: ABdhPJyub8f4D2Sr5kKDWE0uzENCZouJxFMX5Ocsix4afISxccL4y7n7H4oSTBKCRjEoe36DNjepUw==
X-Received: by 2002:a62:1b84:: with SMTP id b126mr5815239pfb.123.1589576205487;
        Fri, 15 May 2020 13:56:45 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id z13sm2208903pjz.42.2020.05.15.13.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 13:56:44 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] rpmsg: core: Add wildcard match for name service
Date:   Fri, 15 May 2020 14:56:40 -0600
Message-Id: <20200515205642.13529-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515205642.13529-1-mathieu.poirier@linaro.org>
References: <20200515205642.13529-1-mathieu.poirier@linaro.org>
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
index a6361cad608b..5e01e8dede6b 100644
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

