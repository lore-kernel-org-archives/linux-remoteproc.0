Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4D9C433E6
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:46:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56B0D64EC3
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:46:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBWXqH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 18:46:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233785AbhBWXkR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:40:17 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C58FC061221
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:27 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id w18so42164pfu.9
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZQJKNkYdJD+3H3cXZ1fnXW9mmfT2GDRPmw5t76E+z4s=;
        b=ttJfPAO38DPwRk7QDxMpxEP4AkrTQ+bdqW821L2JbyNrPr+ztnhUsH9KLuRItEmDtw
         wjQCHPOaFFLXndgzQnwNsBRWQjbE7Nkv3yYhyyPiKSUF4zrOkf81EB7HH/CVMNKLReOl
         40lPa9a7imYaNlA0rnzPsIxBHz9UH15WkcvPepLH//K3qI2oqRpyv+7m/k2trU8fH2hQ
         nCa+l/PeuYtT9ao0c9zxmD1+rbke6+GR9K6hp4Sg8uRsgpQCH/ava+wbb6iKyBePKvfY
         UbrZyzFTq9u9hpTsiLWuG/HWgK8cSyKRcwltNqNB6pOAUHD0w8vNeGX2ClFMu//8RtR/
         V/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZQJKNkYdJD+3H3cXZ1fnXW9mmfT2GDRPmw5t76E+z4s=;
        b=HKLKJ9Do0PUEDK/irto402RNlG9P9K8sFM8ZwxIwox4pTyfjnmI/zikI+5RMRhFoQ3
         DnWbASZKAr58pi0R4WXElUKCwdW76CxMESFfwO7ITpygVizEtJTcr1rzlxBOa5mW6RTg
         4NOBVz9UrcetuP5D8+CVB4ksoYSKK+UJd7pj/zUJr2vL/ovUCFPhMmxdgYhXsbohb5ov
         7SAVPJWnRbo386NZJYYfLWXflGYQu70QVuGPZd2JCln5Hugq3WebzAzbRtg2MT5sHsx1
         MnaRyt1R/DIeRVA+KII2VESbWVyCnYkBkzjAVE5M1ldWuK4JK1K8wml2jE9pwGKJvwtV
         zYUQ==
X-Gm-Message-State: AOAM532vnpvVp1aYrRtjuji2rbVxNfmsG5EixX9D2/vdkkhTWz5M/csD
        Asz3Jc5iFcZucxZdyKs61mWJ3A==
X-Google-Smtp-Source: ABdhPJyEhqRX/KZWWyw75LLa3g9cesvmVpn7ESbIlO+bDp+Sw/fJGi8whC21vuhA6iI2rCtr8TkLzg==
X-Received: by 2002:a05:6a00:9d:b029:1ed:c1d6:5042 with SMTP id c29-20020a056a00009db02901edc1d65042mr8009649pfj.71.1614123327093;
        Tue, 23 Feb 2021 15:35:27 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:26 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 09/16] remoteproc: Introduce function __rproc_detach()
Date:   Tue, 23 Feb 2021 16:35:08 -0700
Message-Id: <20210223233515.3468677-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
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
---
 drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 86572880c726..0f680b7ff8f1 100644
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

