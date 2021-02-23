Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B495DC433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:45:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 631A161493
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:45:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232136AbhBWXla (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 18:41:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232868AbhBWXhT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:37:19 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F6DC061793
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:20 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id b15so48557pjb.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=waytkFv28UuOXcaaNeh19CxfKAUzKWp03mnaFrOUKvo=;
        b=sufk6rE3/dXnMqzi78VzeEuWwNSyI9Jafh5/gweW9kamLR3HYQEs/qr0R2FCq+SpLV
         TUHEr6smwUpZYibTMKN+7V+oTpSBLajAf4fbj9gUmGw65vUbNqYScn9J+y3IXVaRdrlk
         o+YGaCC9XXt/0a3xDztIAps6TaKutwVtyv37jY6lnY0HlCHC6AcZ4+ivZJqp8WjfBJSc
         uJdJEQnEe6FC5u3mu4/GfQTxlCh1znYrjeWMHinbrt1vE1xJM1XfKZDN6XOCeiv5LUhi
         fHMpsUs5ArvPYM/UlxQjwiM92KTXDpbOcC4f4zRyqF3aNQP/NtJ9Y1cqQ4JK4nSO3555
         nPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=waytkFv28UuOXcaaNeh19CxfKAUzKWp03mnaFrOUKvo=;
        b=H9ck5wwJshwsE0pIm5A9uEQ9S50JrKiZQTQ9qbyGrd4y2z41r5BQbUhGIeG2RAh//1
         4zVXtji7r+XLSdwp7BcQzEQ9GpcqfBr2PLVcJsuvMg6Uqg0G9v5ZipPeJWgIwRInv63o
         uitYSNrpjOnuVAEPusz+GN51FC5xa3ByCrLHGvv7T7wFcuAYzR/a8COoNyeS5IHIoKx6
         zDbjGqgUx80mZ5FuBtS4U/qXlsWiDB5iXU2Fb4Xm+nR2RBjNCgU3X3feuwl1hayqiS7+
         jBV5+SiGWFSq2L3V5Yc6SYPgaVYIWzuuSGBRI5WzATLk578MJ6j1E7IvOG8zoSnUGLfg
         T77w==
X-Gm-Message-State: AOAM531RJAvxHHZcT0DU+JdhVhGNHFAWkdusndiFFum6DfPEX9CWL0Uq
        rZrSugmSpoviHCOLrFoj7y7HTg==
X-Google-Smtp-Source: ABdhPJyz53wXTScCJJHK+0zal+VXwSHeBnigEJ0IybsgF/8onQIB+fzZZu6AviRn5AHuVdwP6tT/6A==
X-Received: by 2002:a17:902:e993:b029:e4:1426:8e71 with SMTP id f19-20020a170902e993b02900e414268e71mr5806317plb.74.1614123320126;
        Tue, 23 Feb 2021 15:35:20 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:19 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 03/16] remoteproc: Add new RPROC_ATTACHED state
Date:   Tue, 23 Feb 2021 16:35:02 -0700
Message-Id: <20210223233515.3468677-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a new RPROC_ATTACHED state to take into account scenarios
where the remoteproc core needs to attach to a remote processor
that is booted by another entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_sysfs.c | 1 +
 include/linux/remoteproc.h            | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 1dbef895e65e..4b4aab0d4c4b 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -172,6 +172,7 @@ static const char * const rproc_state_string[] = {
 	[RPROC_RUNNING]		= "running",
 	[RPROC_CRASHED]		= "crashed",
 	[RPROC_DELETED]		= "deleted",
+	[RPROC_ATTACHED]	= "attached",
 	[RPROC_DETACHED]	= "detached",
 	[RPROC_LAST]		= "invalid",
 };
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index f28ee75d1005..b0a57ff73849 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -405,6 +405,8 @@ struct rproc_ops {
  * @RPROC_RUNNING:	device is up and running
  * @RPROC_CRASHED:	device has crashed; need to start recovery
  * @RPROC_DELETED:	device is deleted
+ * @RPROC_ATTACHED:	device has been booted by another entity and the core
+ *			has attached to it
  * @RPROC_DETACHED:	device has been booted by another entity and waiting
  *			for the core to attach to it
  * @RPROC_LAST:		just keep this one at the end
@@ -421,8 +423,9 @@ enum rproc_state {
 	RPROC_RUNNING	= 2,
 	RPROC_CRASHED	= 3,
 	RPROC_DELETED	= 4,
-	RPROC_DETACHED	= 5,
-	RPROC_LAST	= 6,
+	RPROC_ATTACHED	= 5,
+	RPROC_DETACHED	= 6,
+	RPROC_LAST	= 7,
 };
 
 /**
-- 
2.25.1

