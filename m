Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA2BC4361B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81E5C64FDC
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232874AbhCJVLA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Mar 2021 16:11:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbhCJVKt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Mar 2021 16:10:49 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C78C061756
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:49 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id s21so2330800pjq.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NUbHk8qwWGNZJmBhl2P7smbU6eLp7vR5JHjlqmfrEWU=;
        b=OpJIo3bJghziHJAhj7AXoBb2a+K141G0BdZoGZ/7MZzz2dpfMnOo2i6Muf0cvN32O3
         Eu3rRRkYmRSrE8+0RitMnGpPHh3MyYFCDzqbLndfAHL3woFiBgu87NTytJdXKz3IdkSV
         Ah1EJsasCqPl3ajRID81RXz8NbxYI+f4TPrmZn8HAk3ihXZalq+9fKT/j+IkAj9is3+K
         nRgf6p4c69T8CRpe1ucPHGY6cW1XXACyHNZosYogAPfvWCXm/wNTmPysI2Fxa6TOUQHi
         XihBQ5WPr0mVcwoqD7KEyWVXZaBbp3t5oUsoCPpKu+2aO+eOD06YvM2EUaeuWd7l78NA
         rIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NUbHk8qwWGNZJmBhl2P7smbU6eLp7vR5JHjlqmfrEWU=;
        b=DqRPBtviqNn47Ro+O/1AF987q0bBdI3pGi9hQ5Yj64zIHLG3JrlLXz2jrqtO58QGmi
         FDlr+y1l3/tcz0Q/HU0Xa1vJzTxqbsI4gtqXzn6CWKvACdMNws7gNZ2rMC+OiXwnekoi
         8cV82N3qMmw7BJeV8yESlf7YuG9PGJHLvEW7WtVkN47z0/OQbAZ1hV8djB7Y+ITkxIAP
         LlIfgVUIDIRH26VX91sqqa74a8RGohOMAxrcJwRcydUTsJ5Xxp+Uuiqqj9Jsx9RrLjmn
         pNka7rbR3JFoSy9vF/Tyi5kE+vAD2/nEl4DKGK4XfsND4TG3jERqznVTX2iePqFHUrWr
         ionA==
X-Gm-Message-State: AOAM530VpgBXquGSyT0wpwOYgUlePxbHv8L4h0TwqRB7VIa6SZ01XcEX
        Op3VnNjnE1Czpm0MhlZr7vGnbQ==
X-Google-Smtp-Source: ABdhPJxZ8XGoEFuxacAuMUaLvjuRQGirFqHoWWOjzqKzwfTKllyZCkFZ2WZGETdJorG5/ObLa3IRpw==
X-Received: by 2002:a17:90a:1463:: with SMTP id j90mr5468566pja.205.1615410649200;
        Wed, 10 Mar 2021 13:10:49 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j21sm371508pfc.114.2021.03.10.13.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 13:10:48 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 15/17] remoteproc: Properly deal with a stop request when attached
Date:   Wed, 10 Mar 2021 14:10:23 -0700
Message-Id: <20210310211025.1084636-16-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
References: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Allow a remote processor that was started by another entity to be
switched off by the remoteproc core.  For that to happen a
rproc::ops::stop() operation needs to be available.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_cdev.c  | 3 ++-
 drivers/remoteproc/remoteproc_core.c  | 4 ++++
 drivers/remoteproc/remoteproc_sysfs.c | 3 ++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index b2cee9afb41b..0249d8f6c3f8 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -38,7 +38,8 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
 
 		ret = rproc_boot(rproc);
 	} else if (!strncmp(cmd, "stop", len)) {
-		if (rproc->state != RPROC_RUNNING)
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
 			return -EINVAL;
 
 		rproc_shutdown(rproc);
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f6f0813dade5..3670b70390dd 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1801,6 +1801,10 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	struct device *dev = &rproc->dev;
 	int ret;
 
+	/* No need to continue if a stop() operation has not been provided */
+	if (!rproc->ops->stop)
+		return -EINVAL;
+
 	/* Stop any subdevices for the remote processor */
 	rproc_stop_subdevices(rproc, crashed);
 
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 66801e6fe5cd..09eb700c5e7e 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -202,7 +202,8 @@ static ssize_t state_store(struct device *dev,
 		if (ret)
 			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
 	} else if (sysfs_streq(buf, "stop")) {
-		if (rproc->state != RPROC_RUNNING)
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
 			return -EINVAL;
 
 		rproc_shutdown(rproc);
-- 
2.25.1

