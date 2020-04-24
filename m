Return-Path: <SRS0=nfGK=6I=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E852CC54FCB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:02:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C24FD214AF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:02:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qszvw6G5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729499AbgDXUCP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 24 Apr 2020 16:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729478AbgDXUBw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:01:52 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6852FC09B04C
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:52 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h12so2929747pjz.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x5AHzcS8sGC9RgEnYTkEdMtqDh+A4mE2SJWyouyzavc=;
        b=Qszvw6G5hey/OgSVSi18emlbljJRMDrWac3iPQQrHxseohEWF+b/gOBuTe3FeI7Rdi
         N70dW6ppXpbePUI7XLXYE6qv9No8YpF1Ny00lB2qULYDCzvKaofA/IW632rEAqAbS2lP
         KuDNIbU6Rdf1A4AG2Z+UGWblwCigb/HunNdtWjlx9O69ntpyYF0M2UOlA/L9Duznq0TV
         es9aiuHwxnHRCL5ovv90Er7EuA96nL6RsxDq2+St98vJuOpgiWwX3T3og+9O4ZWVCyqo
         RecNKOO5in7OfsMy/oSIDBE60tOaS0WJpLc+NlQZmQVK+kHkLCNeCCQsNgcIOzWlsblK
         9IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x5AHzcS8sGC9RgEnYTkEdMtqDh+A4mE2SJWyouyzavc=;
        b=LP0P5imxcPioKrZiCLXrc2rsQBYVdU0OwDNJQopTpasFgQydF331RHaGK5WUQWwyV+
         2iU62mpFIuqJLC5Sdnk5KEt1pLyBhce5I8PNHne5PhoPt6JcIQ/43hMcKrw4PF26GeWb
         mSHxWvESiwRdxjcCxU384slbTQ3bndd9AJPa7ZVLKY83M2oYUilQ+DIwt1/rYQUX6LCD
         05M8SdqCWBW6qAcvmY6kqgukC5bYEV2q8p4yUzJuZO940hroa0cbb5qwJLrbumTGrE8r
         5KjdPYj8dwAXULJOSimAZs8jrYzRt2jiNX3ure9i4qy1Y0S7RFl6OdgyQdND3jGEMt0w
         e6zg==
X-Gm-Message-State: AGi0PuZccKgb1Z+a2Y0SXQCXbezEmDd1nXIkMu7sN/2vjelbrNPYpSAI
        ycrTlRlGE04a8d/rmHvp724ovw==
X-Google-Smtp-Source: APiQypIGm772GdNEbMZRG1Sl2BHW92OFtPhGXH1b/EFdq/5lG+DrWOi9wf3UyXMrfeaSEtc6o2N63A==
X-Received: by 2002:a17:90a:5d02:: with SMTP id s2mr7992200pji.148.1587758511852;
        Fri, 24 Apr 2020 13:01:51 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o11sm5532224pgd.58.2020.04.24.13.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:01:51 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/14] remoteproc: Deal with synchronisation when changing FW image
Date:   Fri, 24 Apr 2020 14:01:32 -0600
Message-Id: <20200424200135.28825-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424200135.28825-1-mathieu.poirier@linaro.org>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch prevents the firmware image from being displayed or changed
when the remoteproc core is synchronising with a remote processor. This
is needed since there is no guarantee about the nature of the firmware
image that is loaded by the external entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_sysfs.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 7f8536b73295..cdd322a6ecfa 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -13,9 +13,20 @@
 static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
+	ssize_t ret;
 	struct rproc *rproc = to_rproc(dev);
 
-	return sprintf(buf, "%s\n", rproc->firmware);
+	/*
+	 * In most instances there is no guarantee about the firmware
+	 * that was loaded by the external entity.  As such simply don't
+	 * print anything.
+	 */
+	if (rproc_needs_syncing(rproc))
+		ret = sprintf(buf, "\n");
+	else
+		ret = sprintf(buf, "%s\n", rproc->firmware);
+
+	return ret;
 }
 
 /* Change firmware name via sysfs */
@@ -39,6 +50,17 @@ static ssize_t firmware_store(struct device *dev,
 		goto out;
 	}
 
+	/*
+	 * There is no point in trying to change the firmware if loading the
+	 * image of the remote processor is done by another entity.
+	 */
+	if (rproc_needs_syncing(rproc)) {
+		dev_err(dev,
+			"can't change firmware while synchronising with MCU\n");
+		err = -EBUSY;
+		goto out;
+	}
+
 	len = strcspn(buf, "\n");
 	if (!len) {
 		dev_err(dev, "can't provide a NULL firmware\n");
-- 
2.20.1

