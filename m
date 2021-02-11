Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0E4C433E6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:51:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE19D64D87
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbhBKXva (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:51:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhBKXuL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:50:11 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FF1C0698CB
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:46 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id t11so5056924pgu.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JUKRbtXS9Mr9gnhKh7QWVFErht5px8OG4XwmxGU2Xok=;
        b=ja9OFZ5S7rJunmDwqE98g/+VHmWIS2v0SVgAJcyyLVL9YfenhvW0b1SJablX0yX31/
         Du0RidCR/3xix84ILBIbpDpiNLPUz0oBRg5bRLsMg1wTaPbjeMACmdhD87AZBMoQsn0L
         zVLqam8Osu/OIvprLTn+9aCc8AZwM/U9A/BYNNX6rRa9JRvSMyBB6oOcj+ZuT8c51vFo
         Bwa7e0+ubOL0zXIVKEyK+z4eBkxzTocc4xRygVIovDhOtvqIT3CChf989mHJCKyVlCcC
         tG5RaZ0AHepQrHgm5QdfhBoSQL9fM2U1h9wtR4NZwP4P/HAxjClaLxQBXuMs4P54cPNm
         fuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JUKRbtXS9Mr9gnhKh7QWVFErht5px8OG4XwmxGU2Xok=;
        b=SC6FCMo+X1sRVvRJ1F7hadTDWDZpUBjcFcbVyEZ7d7A+GsFtX+N70FcTWxxtdJ8ajd
         MnLFlQxopEGsZ7uIEU8F03lH+6AIwlPb/VO2MdPcDLbBRFbJopCv4TfgXPSEHOKWIKHK
         +RlRiadTZOjG6+72dgpxsb2aM4fetTaB7KrJjie7iNh+3Bsh3rwNENSauT4LggeiBq7w
         Lro/9YEG50eEUahpd3iJ+dcrXNR4e2gXs2nG1UOC/3PttFMCL3U8M8kXyaPqkHQbMqpJ
         0/kWl9kPjQO2fvGdf7yO94LHOkCY7wv0QktscdkDUIIGPliQ8KKb9eiMlZhladpfQ/ue
         Cm6Q==
X-Gm-Message-State: AOAM530sNu2RoNuZW1nOjTzxGY15VSsukEZqWK0cHwTVy0fLDTKGI7fR
        sSQH3itY0BeponkX2ow98somVg==
X-Google-Smtp-Source: ABdhPJxx2ybCqQs0oSIcttdzCUilr0HzumP1KxAGC59SFw54lrMOGsvEgrFhoBBv+dzeOR+XRW5hZQ==
X-Received: by 2002:a62:1c86:0:b029:1e0:cacb:8447 with SMTP id c128-20020a621c860000b02901e0cacb8447mr531680pfc.16.1613087204748;
        Thu, 11 Feb 2021 15:46:44 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:44 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 16/19] remoteproc: Properly deal with a stop request when attached
Date:   Thu, 11 Feb 2021 16:46:24 -0700
Message-Id: <20210211234627.2669674-17-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
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
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
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
index 0dd9f02f52b6..12bd177aa8cd 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1740,6 +1740,10 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	struct device *dev = &rproc->dev;
 	int ret;
 
+	/* No need to continue if a stop() operation has not been provided */
+	if (!rproc->ops->stop)
+		return -EINVAL;
+
 	/* Stop any subdevices for the remote processor */
 	rproc_stop_subdevices(rproc, crashed);
 
@@ -1977,7 +1981,7 @@ int rproc_shutdown(struct rproc *rproc)
 		return ret;
 	}
 
-	if (rproc->state != RPROC_RUNNING) {
+	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED) {
 		ret = -EPERM;
 		goto out;
 	}
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index f9694def9b54..3696f2ccc785 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -201,10 +201,11 @@ static ssize_t state_store(struct device *dev,
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

