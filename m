Return-Path: <SRS0=YAOw=57=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13011C2BA19
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Apr 2020 20:49:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E153120732
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Apr 2020 20:49:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="egNlW/CS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438664AbgDOUtJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 15 Apr 2020 16:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2438385AbgDOUtE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Apr 2020 16:49:04 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C50C061A0F
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 13:49:04 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id c138so582851pfc.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 13:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I1hbSYFCQB3yszokgcBiVGsdFzFeGt348+BuoHZMJzg=;
        b=egNlW/CSCwQuT6WGzglAGTyPjuWi+aGrzOCTdAGwOaEZ7Kgd4B9RHAHH55pOxZzhmU
         392kfFr/2vEyV/vcSXdhaRtDqsBzgkk9bN6rOGcWYH1muIyaNkpbGbllThNX7j60A0Vh
         q4anYq+OzpZrkotySrS6xCtJElR2oV1SpdbngP+leW4q05vQnieuIZuU727i3Zyi2ymc
         MKQ0947uj0Vey76Ffkj4cYYDMALiAYiHasNiLP8liGtVREahPINgxg8IZIFPQddBO2u9
         4BqXf3mIatbMDNLPQsb1flw4HNfji5X6Rc5S+bxDskvpggXJnMecuW5CEVdenaNw75DG
         MN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I1hbSYFCQB3yszokgcBiVGsdFzFeGt348+BuoHZMJzg=;
        b=PrLAbLUR8sIWvi8dqxe5ELPYQh87ZvkmzdBEda0muEEHiww6xnMlB4o0cO3hDDJCes
         Q58sUkSnA09pP9bhj0ZRbewI2t4Oj+FqZKyv5TwdP6UVnfTKsZt3HFMv875QLbfbVGhF
         9d/oOWecP8OHP2TjoJvHAT9/Pvqptr/6Ugz+ARgAs7bi8rEp+HNS7g/UXL15bL95SiDS
         u074I6CptkoDW546jTJSj/aUjKNRV1skjt+B7L2RjWXUVtgs/XGbdObSP2F5CCZ5XBT8
         KxoW5m5lzDvzaksOlLm2IJycJPWy81ihgsvYm+p3q/UOo9qOTdh210k6fJoDAZc4ocRC
         72qA==
X-Gm-Message-State: AGi0PuZTfMl1dn2IJ13FXtOvEHAXOcZaPuykLXBlr+00ctaA1hWUVK/v
        spIWwY4EvFdLF1kzIrtZaFQtjA==
X-Google-Smtp-Source: APiQypJLUVSXF1Os2JTEHHQ8RcYmeMke3mHN+xDj0GD7Bj66NnNDTeCvgwM5GZlNCsN+NS6a6SupSw==
X-Received: by 2002:a63:4047:: with SMTP id n68mr27922364pga.321.1586983744336;
        Wed, 15 Apr 2020 13:49:04 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i13sm14461861pfa.113.2020.04.15.13.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 13:49:03 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, elder@linaro.org, Markus.Elfring@web.de,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] remoteproc: Split firmware name allocation from rproc_alloc()
Date:   Wed, 15 Apr 2020 14:48:53 -0600
Message-Id: <20200415204858.2448-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415204858.2448-1-mathieu.poirier@linaro.org>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200415204853.nd-7Y8SKNWAZiIJ-bMOpC_MX-1eVwC1OiJHvUN4PVVY@z>

Make the firmware name allocation a function on its own in an
effort to cleanup function rproc_alloc().

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 66 ++++++++++++++++------------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 80056513ae71..4dee63f319ba 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1979,6 +1979,33 @@ static const struct device_type rproc_type = {
 	.release	= rproc_type_release,
 };
 
+static int rproc_alloc_firmware(struct rproc *rproc,
+				const char *name, const char *firmware)
+{
+	char *p, *template = "rproc-%s-fw";
+	int name_len;
+
+	if (!firmware) {
+		/*
+		 * If the caller didn't pass in a firmware name then
+		 * construct a default name.
+		 */
+		name_len = strlen(name) + strlen(template) - 2 + 1;
+		p = kmalloc(name_len, GFP_KERNEL);
+		if (!p)
+			return -ENOMEM;
+		snprintf(p, name_len, template, name);
+	} else {
+		p = kstrdup(firmware, GFP_KERNEL);
+		if (!p)
+			return -ENOMEM;
+	}
+
+	rproc->firmware = p;
+
+	return 0;
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -2007,42 +2034,21 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 			  const char *firmware, int len)
 {
 	struct rproc *rproc;
-	char *p, *template = "rproc-%s-fw";
-	int name_len;
 
 	if (!dev || !name || !ops)
 		return NULL;
 
-	if (!firmware) {
-		/*
-		 * If the caller didn't pass in a firmware name then
-		 * construct a default name.
-		 */
-		name_len = strlen(name) + strlen(template) - 2 + 1;
-		p = kmalloc(name_len, GFP_KERNEL);
-		if (!p)
-			return NULL;
-		snprintf(p, name_len, template, name);
-	} else {
-		p = kstrdup(firmware, GFP_KERNEL);
-		if (!p)
-			return NULL;
-	}
-
 	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
-	if (!rproc) {
-		kfree(p);
+	if (!rproc)
 		return NULL;
-	}
+
+	if (rproc_alloc_firmware(rproc, name, firmware))
+		goto free_rproc;
 
 	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
-	if (!rproc->ops) {
-		kfree(p);
-		kfree(rproc);
-		return NULL;
-	}
+	if (!rproc->ops)
+		goto free_firmware;
 
-	rproc->firmware = p;
 	rproc->name = name;
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
@@ -2091,6 +2097,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->state = RPROC_OFFLINE;
 
 	return rproc;
+
+free_firmware:
+	kfree(rproc->firmware);
+free_rproc:
+	kfree(rproc);
+	return NULL;
 }
 EXPORT_SYMBOL(rproc_alloc);
 
-- 
2.20.1

