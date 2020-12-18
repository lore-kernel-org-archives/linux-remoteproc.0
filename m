Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59BAC3527E
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E5D023B6C
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732927AbgLRRee (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Dec 2020 12:34:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732909AbgLRRec (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Dec 2020 12:34:32 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BDACC0619FA
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:43 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id h186so1958904pfe.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kq/8af8gfyQHRLTjjFQpBmU8IlBKCx8ZUO1N7tlkmUM=;
        b=Xqy5A3cJrzblGn7kkF9K33fBX2hXDtOtmwTf+9wvM8bXNE3G4KFPGZ4lqjziYwxJIC
         5pultxhG4IXdogclYCM3/RVu9w30nQ/ynI67lOSHfm5G4XPPb38I8BW7JhrBs9rMQr/o
         8o7UCO+zUhE7aAlHdIwfSKBUs0ZqhWLPGpTB4a0Yu2Iww1eDG7BWSDr3a5xLqDhLrR3S
         rfDZ1zIn0jnkJTo5E45UmQkGvHRlFQ23IcYsUKGDddXxRQeG9GFO2hL4kg/gWvOgD0m5
         breNaRghLvch90zF8EyPek85TkUj+UKKdQcvx3Yc/G4WFsilC6wDe0YE8WxWeilNvFKN
         iUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kq/8af8gfyQHRLTjjFQpBmU8IlBKCx8ZUO1N7tlkmUM=;
        b=T72w2Q0FeXzr+l45oh0SfVzZbIXOltJat6COh5HpsDqVPChtvngmrYjn++RZDnM3QX
         e/dOQVU9qpz64kbYSB/H7XkNgwvVFh/ClWq8UDNGovorvFQp3hTLseduDB50V2ldvKGp
         fuoXVwfDonzz0cjhlQAPYbywetj2jzkw8quGB5PBCujfxGVhcFA6Xd/QAeJ7NxF21P2q
         O/2rKgBca/9ijFUTdmc9VlWH+FNQGOYh/nDcpQanHhrrQI8MLJQwVInvI3gQ2uKVMm0q
         q89vi89/YOySR0zgTiCXORoCeTJv4iit8DzTXm88GjzAmVBHKKLd3tETyra2Q8hIfVIv
         usMw==
X-Gm-Message-State: AOAM5329AvNP0uqPkJm+78YviudRbHvSUyjPXP8XRAqDYJfKFiQdDBYf
        N9AtyJYQg7oJyRsS+IvN+MZ/QA==
X-Google-Smtp-Source: ABdhPJwNj21hgIvlcHibG1MkQ4DsJhmLrpdyxNVyETJNxGhMSoeftqYfxD+zBCtmcy8HAPC7E2/Hnw==
X-Received: by 2002:aa7:9f09:0:b029:19e:cb56:e124 with SMTP id g9-20020aa79f090000b029019ecb56e124mr5253730pfr.38.1608312762797;
        Fri, 18 Dec 2020 09:32:42 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l11sm9892957pgt.79.2020.12.18.09.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 09:32:42 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/17] remoteproc: Introduce function __rproc_detach()
Date:   Fri, 18 Dec 2020 10:32:22 -0700
Message-Id: <20201218173228.2277032-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
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
 drivers/remoteproc/remoteproc_core.c | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index fc28053c7f89..e665ed4776c3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1670,6 +1670,48 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
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
+	/*
+	 * If the remote processors was started by the core then a cached_table
+	 * is present and we must follow the same cleanup sequence as we would
+	 * for a shutdown().  As it is in rproc_stop(), use the cached resource
+	 * table for the rest of the detach process since ->table_ptr will
+	 * become invalid as soon as carveouts are released in
+	 * rproc_resource_cleanup().
+	 */
+	if (rproc->cached_table)
+		rproc->table_ptr = rproc->cached_table;
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

