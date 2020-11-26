Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6EEC8300E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ECC3207BC
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cny5LHKn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391011AbgKZVGy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 26 Nov 2020 16:06:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391550AbgKZVGx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Nov 2020 16:06:53 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482ECC061A04
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:52 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id r2so1674325pls.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wtAqiIL4OGNOjCOWpJIS67EUO5pm7/BCFlTCx9jyrY0=;
        b=Cny5LHKnxJRw0cPNWlSxQxJLAOqavXYkvssYv+komoercg8UQCRqLL1Dt7dN7w10mi
         /jK2HtPu8TjYHOvz6LNUomKVqNs56Aeu6E/keXOpMJPmGO4hnrVRc8Th++2ZHOWpI/9z
         KRcnuSvQkpZvQ1rZsaJjNGubmkPscveRVANqlUSvnzOU/y8VNfcRsxznJk2dQbZXLOLI
         OlLlLzprXxRgjI65ETsbLde3wmKcelqXo7ApjN07j5dgdWrUh8rupWQZ2+G8Q87vrCVl
         slY8OqOhgTS/ro3JbICqr1YtfZjJC3lgBJGgTLU4G0Ku3Vq5P79Hhpaqg8TID0lxIqnm
         p+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wtAqiIL4OGNOjCOWpJIS67EUO5pm7/BCFlTCx9jyrY0=;
        b=rvmjrG5OIHw6XngKgs7S82qU51+chS5nXL7GuiwuiFjFp7Ip2+XeAGiKbktZsiZsI5
         6mnJQcUFgkOlkWzRSv51FModInM/wDHBtG1fufIgYqEYQYCRQVezPBYWOOsOnGp+I/+v
         8BxR23KxPvpnXmC8XgPoi0lOlxWdVFb8gWl2hJ72VDG+Rn69VzQJDwwh9wiDUcfx6uqA
         BI/ljNrk6bay5foVPa/YXmJCHgJ1hEcyh5IuwnY7HMMW6HVM69zh2d7H/80MeSFg1k2K
         VvNV2G2KqcWXZVKS5318PPzuYeZytVgkulXpD8+NSXaGIzyIzmlI4zgU9Htkyy1D8pu0
         6IGw==
X-Gm-Message-State: AOAM532gYiNdk/ZWoGLW+LGJzamHbAqZU/cs840gpFti88UwwTQ4GmNM
        2/cyKkspJDWMoP0PrBFvXnCkqA==
X-Google-Smtp-Source: ABdhPJzXhimwa/OrmYJEQnvo5tzdCrzQIJZMyNWoA6mBeVghxJC2zkl1KMx7mnMTN/Z1vkrQ1d35Vw==
X-Received: by 2002:a17:902:e9cc:b029:da:1d7a:f5fa with SMTP id 12-20020a170902e9ccb02900da1d7af5famr4151197plk.38.1606424811844;
        Thu, 26 Nov 2020 13:06:51 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c203sm5612676pfc.10.2020.11.26.13.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 13:06:51 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com
Subject: [PATCH v3 08/15] remoteproc: Introduce function __rproc_detach()
Date:   Thu, 26 Nov 2020 14:06:35 -0700
Message-Id: <20201126210642.897302-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126210642.897302-1-mathieu.poirier@linaro.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
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
 drivers/remoteproc/remoteproc_core.c | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 539667948bc8..928b3f975798 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1664,6 +1664,37 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	return 0;
 }
 
+/*
+ * __rproc_detach(): Does the opposite of rproc_attach()
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
+		rproc_start_subdevices(rproc);
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

