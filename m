Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B849EC4741F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62DA0206DD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TPGcCggK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbgJ3T51 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T51 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:27 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E435FC0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:26 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id w11so3480378pll.8
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YbXz95cBHuTD6slrQPDDMWERewQd5djkfELMnXVXJ+k=;
        b=TPGcCggKjlQlzOPaFB62QSBjJEG1nDSXoNZRFIaGF0jSWQY4CMtDh8da0JBN9sroQm
         5aqfzTDkdcQc1BHt5QL8N5bXB3a4EVf8CEV5VXVMDPXgg9jjX1OaVQ8lpV8kNvmLZplY
         yEhDl8ItXdPFUki0DYmIhcptKX3T4G+Rsrm6ulDoJjP1DHgbJOo7zlRMNqP/Qti6QRpy
         JRgGE4uC0470W0cmYcdrgTgUlxLdu6UX2NaTh7hZV451NAipLgU1Jy0SD0QsYQHH6UQJ
         nHGggJtnAskyA+Ns5CKOqEyVzn+P7SpEM6KXomSGzovkFYm7wWnUFekdi7MHLMxYHL8O
         pHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YbXz95cBHuTD6slrQPDDMWERewQd5djkfELMnXVXJ+k=;
        b=BGH0TSEli3aS6GsO8ifzPYQluTdWXVg2PVFqlL6s7EtU4swWPJlZnvuj+L00vwXws9
         gtx+eklgK/zPqE/UCdnWml3x+n7fPzGjO57o+X56f9bIzS+PUSHnQD4Rq/jEC08I1kMN
         L862WwTw4ty8Ss7DJyyiZnytvzkojnAcTHdAEmjC8f/4HsaRJp7/RMAhTNQZOU7+ALZn
         xwrA+pEmsN/Q9JUBp9FJ2YUhOq4oA7KrKxZRcUbELD70Y+1erJ7t5BDeqUo9oz8zEkZO
         neIgLaYcn/m7J6/sVsUYGZj5v8kJIFebfSmZoJMiuIB+w090gmtRiqjyhLWypQj/X5sT
         l+bg==
X-Gm-Message-State: AOAM532KEjeWdnEvQJ6eob1lDsC1HlMauyQAgud0wJ1mwWy1AzfU519V
        Qa4RHvV91wwcHW2D6J07tS1DKw==
X-Google-Smtp-Source: ABdhPJyVMHm51PFs2+SdBrCZZg20llug89N/1UXhIo+c40/XDY7VN7U258hIqa4AjzR+fdofu6OciQ==
X-Received: by 2002:a17:902:76cc:b029:d6:6007:9372 with SMTP id j12-20020a17090276ccb02900d660079372mr9986613plt.50.1604087846502;
        Fri, 30 Oct 2020 12:57:26 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:25 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 11/14] remoteproc: Properly deal with a stop request when attached
Date:   Fri, 30 Oct 2020 13:57:10 -0600
Message-Id: <20201030195713.1366341-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch introduces the capability to stop a remote processor
that has been attached to by the remoteproc core.  For that to
happen a rproc::ops::stop() operation need to be available.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_cdev.c  | 5 +++--
 drivers/remoteproc/remoteproc_core.c  | 6 +++++-
 drivers/remoteproc/remoteproc_sysfs.c | 5 +++--
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index b19ea3057bde..d06f8d4919c7 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -37,10 +37,11 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
 
 		ret = rproc_boot(rproc);
 	} else if (!strncmp(cmd, "stop", len)) {
-		if (rproc->state != RPROC_RUNNING)
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
 			return -EINVAL;
 
-		rproc_shutdown(rproc);
+		ret = rproc_shutdown(rproc);
 	} else {
 		dev_err(&rproc->dev, "Unrecognized option\n");
 		ret = -EINVAL;
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f58475f6dcab..229fa2cad0bd 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1642,6 +1642,10 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	struct device *dev = &rproc->dev;
 	int ret;
 
+	/* No need to continue if a stop() operation has not been provided */
+	if (!rproc->ops->stop)
+		return -EINVAL;
+
 	/* Stop any subdevices for the remote processor */
 	rproc_stop_subdevices(rproc, crashed);
 
@@ -1880,7 +1884,7 @@ int rproc_shutdown(struct rproc *rproc)
 		return ret;
 	}
 
-	if (rproc->state != RPROC_RUNNING) {
+	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED) {
 		ret = -EPERM;
 		goto out;
 	}
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 99ff51fd9707..96751c087585 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -230,10 +230,11 @@ static ssize_t state_store(struct device *dev,
 		if (ret)
 			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
 	} else if (sysfs_streq(buf, "stop")) {
-		if (rproc->state != RPROC_RUNNING)
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
 			return -EINVAL;
 
-		rproc_shutdown(rproc);
+		ret = rproc_shutdown(rproc);
 	} else {
 		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
 		ret = -EINVAL;
-- 
2.25.1

