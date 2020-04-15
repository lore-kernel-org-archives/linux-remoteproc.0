Return-Path: <SRS0=YAOw=57=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BD8C2BA19
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Apr 2020 20:49:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E27332076D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Apr 2020 20:49:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PzYRWN/b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438385AbgDOUt0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 15 Apr 2020 16:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2438617AbgDOUtI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Apr 2020 16:49:08 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C515C0610D5
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 13:49:07 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id n16so507005pgb.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 13:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M/7ZIhFX8/Fc/kbce4rxbSpECgFr3U/vKIkPqW4pN78=;
        b=PzYRWN/byflKqd6OsSapeqhz+jz3Mp2vQ5jbUXnfg6/ypN1MtKOn8kz4uKJUQnjzQG
         zL9RpPo175xED/M6X4ecXyXp9wovIFPGNRW+vCKEH+eTtbJbilLTRK/cmQUzEEYB/6VI
         IHAbUU2LU3KezQlCkAVUnVFv0miMuzp9V75us5/UFy0YG4Kg+vntVMcf5wJHLLue3cqe
         KXkHKwfe1+jIFj0/RvkoeUrxClhYzokqu4xvkkAIvlvoPmRgj9Ehc1beneiJ5mWPhGQV
         bZv86VCUMr1Ead/nuxSjFRA5+2wzV1gwpSY9RILXSi9gO8bNm2hbTRSUH6aHsbFQLa7L
         sxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M/7ZIhFX8/Fc/kbce4rxbSpECgFr3U/vKIkPqW4pN78=;
        b=tGBSLABxH9JD5j3/wJ+aU7QnG24AfGlbQ0snz2XRjY76N9RG2gcI0+CGs52wA3NEXs
         Mj97zfc/E0kEcviiiiN/E+gqqBz01hXGzdXWARVfs3/+hVixXo4NUr1r0ZZAADfgUWsm
         AkcbepwdPfFgfQyhkU4bX4XauqqUfWLgtYWx0AydqOrnywewA3IZuE7IfRz5rY741/jI
         G3GFqfc0IiNJWQWmIsOT2UduqO1POIRlUaIylV6UDnW3qU+cmxwGReRSCI9dRGiy03RC
         gtKg5a7IXWlvxoGbqHi5U/OsDlp8Ap8vsbYoDr/6m4qplB6HBip9yHA5NWxYNpqXQ5Qh
         UE0A==
X-Gm-Message-State: AGi0PuaO8YIaxmA+UtRFaaccstGgLOf1126LcujfmdKmmwY48XGMJg95
        Fsoi2vItYx2zhPGlbuh7qNbFiQ==
X-Google-Smtp-Source: APiQypKTLEovDZzfR01SF/kDnhw2CXF7O5puu/Gs/lR7mn9HqDXfXHpcuVfHesxn93ziRZJE2KXJbA==
X-Received: by 2002:a62:16d2:: with SMTP id 201mr27883268pfw.295.1586983747037;
        Wed, 15 Apr 2020 13:49:07 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i13sm14461861pfa.113.2020.04.15.13.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 13:49:06 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, elder@linaro.org, Markus.Elfring@web.de,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] remoteproc: Use kstrdup_const() rather than kstrup()
Date:   Wed, 15 Apr 2020 14:48:55 -0600
Message-Id: <20200415204858.2448-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415204858.2448-1-mathieu.poirier@linaro.org>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200415204855.9kzLHlUWPKn-m8OYweflGMBpL4adEx_DsGDLBmncAuI@z>

For cases where @firmware is declared "const char *", use function
kstrdup_const() to avoid needlessly creating another copy on the
heap.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 4 ++--
 include/linux/remoteproc.h           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9899467fa1cf..ebaff496ef81 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1982,7 +1982,7 @@ static const struct device_type rproc_type = {
 static int rproc_alloc_firmware(struct rproc *rproc,
 				const char *name, const char *firmware)
 {
-	char *p;
+	const char *p;
 
 	if (!firmware)
 		/*
@@ -1991,7 +1991,7 @@ static int rproc_alloc_firmware(struct rproc *rproc,
 		 */
 		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
 	else
-		p = kstrdup(firmware, GFP_KERNEL);
+		p = kstrdup_const(firmware, GFP_KERNEL);
 
 	if (!p)
 		return -ENOMEM;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 9c07d7958c53..38607107b7cb 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -489,7 +489,7 @@ struct rproc {
 	struct list_head node;
 	struct iommu_domain *domain;
 	const char *name;
-	char *firmware;
+	const char *firmware;
 	void *priv;
 	struct rproc_ops *ops;
 	struct device dev;
-- 
2.20.1

