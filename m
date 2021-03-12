Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF717C43333
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9596B64F80
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbhCLQZg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232471AbhCLQZG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 12 Mar 2021 11:25:06 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5696FC061574
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:06 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d8so12140272plg.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s41xNBSRWZdaT0/t4ukszEcW0OmYZRiq0VgJP9qHLTU=;
        b=N/OZ19vzKvAIJ45rejwYBpeamiYN00ABVqI68joDL+QjYaI9gYGoCi3Z+3GLz4XRb0
         hI12xVXbF7V1IwT9jLhof8caFqkLO+IZm9vOUqiJbygWJDLp0mNFm4UyeR+hcrxf/cy+
         iUkLGJs/uWcaBAqbAU1UgTlOMpffP4vypEvCfwf9L/vFp+lczPZGKm04wnJvRKhvMLOZ
         18XIb+Uh61beMhRc1ouGNQMo/khePGxGrd3fU9jOpiWdT93Bc/3tZ2VWij1s4tAuXctX
         ATo2QZvC8ey9nk3OEqEs1zWSFu1IrX4PelzWOkOK6eoAvRbLZRmuZn65tL/iOLRkFvs+
         FJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s41xNBSRWZdaT0/t4ukszEcW0OmYZRiq0VgJP9qHLTU=;
        b=WKkezQ6PcFNyQwEkIfMJdm7Ttc+WV4eMqs4vQp6FkcJFYy1H+pv85xGvAh1zzI6Yu6
         mX5+99EVqMMbOo28sp/YwvNu4Zlw494KL79k8QjYtJUONtrJKBuI2BOImcLZ3GMtq/9d
         YtE2tYun96Xn5Z8C1RktD+OFyLUEQ6BNMrM8rmafExPxq4SpOAIoqi9cFJq8Lj004jQ4
         g8HErrqO+LgLL1/2gF7YKny8JVoyMZ/R/xOpQ3iCGRk/pi4Vz2QW3jRnJRwWwXO7sjT9
         DjEIXq3+1eP5A4RVbRH35xmrhBhIc9A8HUTygTd8CzMJIvmWQyZGn72mrPDlZ1YRyNmu
         MErA==
X-Gm-Message-State: AOAM531AW+ZfPMZxyQZfG4nNEtQrhqgd1dVEmXTSvY26XcTS7C8xXtxB
        vnt+mEPxqWaMs+XExsBoCp5GZA==
X-Google-Smtp-Source: ABdhPJy4xjO8O6EA3p4/QVUnSBaJ9fYPirTjbD+/VVyrO7DYDSm/KBsbvJSiwwZA7GMRhblw/5m7ug==
X-Received: by 2002:a17:902:da91:b029:e5:cd82:b4c3 with SMTP id j17-20020a170902da91b02900e5cd82b4c3mr13938873plx.73.1615566305939;
        Fri, 12 Mar 2021 08:25:05 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm5899599pgb.35.2021.03.12.08.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:25:05 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 09/17] remoteproc: Introduce function __rproc_detach()
Date:   Fri, 12 Mar 2021 09:24:45 -0700
Message-Id: <20210312162453.1234145-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
References: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce function __rproc_detach() to perform the same kind of
operation as rproc_stop(), but instead of switching off the
remote processor using rproc->ops->stop(), it uses
rproc->ops->detach().  That way it is possible for the core
to release the resources associated with a remote processor while
the latter is kept operating.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 1d8bb588d996..f2a005eadfd5 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1706,6 +1706,36 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	return 0;
 }
 
+/*
+ * __rproc_detach(): Does the opposite of __rproc_attach()
+ */
+static int __maybe_unused __rproc_detach(struct rproc *rproc)
+{
+	struct device *dev = &rproc->dev;
+	int ret;
+
+	/* No need to continue if a detach() operation has not been provided */
+	if (!rproc->ops->detach)
+		return -EINVAL;
+
+	/* Stop any subdevices for the remote processor */
+	rproc_stop_subdevices(rproc, false);
+
+	/* Tell the remote processor the core isn't available anymore */
+	ret = rproc->ops->detach(rproc);
+	if (ret) {
+		dev_err(dev, "can't detach from rproc: %d\n", ret);
+		return ret;
+	}
+
+	rproc_unprepare_subdevices(rproc);
+
+	rproc->state = RPROC_DETACHED;
+
+	dev_info(dev, "detached remote processor %s\n", rproc->name);
+
+	return 0;
+}
 
 /**
  * rproc_trigger_recovery() - recover a remoteproc
-- 
2.25.1

