Return-Path: <SRS0=YAOw=57=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52140C3815B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Apr 2020 20:49:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B08221707
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Apr 2020 20:49:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SwCYJ9CQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438465AbgDOUtM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 15 Apr 2020 16:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2438528AbgDOUtI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Apr 2020 16:49:08 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846D4C061A41
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 13:49:08 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id c23so518691pgj.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 13:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C6Z/2U1uSaMVZIS1zrhX5ycxTde0oQImP1UUauJl94M=;
        b=SwCYJ9CQNtNrDxPo10KzPwy/ANvNIUyE6IU+PI/Y+XyS4RgwDVTs1XDSRenCRHcku3
         Oi60l1cNkELSfLeIKpssWjCQVNCvhzvgfn6oJ+fbDWK+j3YtHqyqmr7tg7YtSKyh4eAK
         Z8aPM7rIsVFLNioM2ldcrEmsmhrJ6xBk9rqzl8MNtmMONDQkv+F5ufxs6HxAWS6BjjXh
         +B9KnfjStoKp/m+c+xFBSyN8z19xirInrN7y/vAARQZPvphs3ZI7cR9DjMqfvWVfQFpi
         aL/YU2rLmGdPwYAUYRebovMZFb69mIbA+Xuyb2Qffj5fBGY/gL9DH7AGR8+ftf3nzOs4
         qBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C6Z/2U1uSaMVZIS1zrhX5ycxTde0oQImP1UUauJl94M=;
        b=i7CrGwddjCnkUvCKEyfUeUzztSYsYUBvWyxaBI0jlvIZPCJbHLYwlmvYnpUKxBdulG
         j+XQt4DQSJYMlfud+/eN6ZFaYRrxFKyMsi8xiF4h2Pvy8FNyEMBVHQ1twwjMpPIATW22
         KBpb0p+7FiGcbGE8VcZVAA565eoMznhiPLRG+l3gKymHUSG6rzypfxoG+gmzlJv2hufe
         DGUzKaR1kTysTWhl4pn9HdxiVh2db1CPVOWor9SqjURwExErCwttjQjjHrW2nf8BcYgy
         fokccDNz0guCvKr/rolefnAMy+yG7LYCng6G2tIaDFP7cVCd4Yve+Dhi6eXEk+YaYE13
         5HnA==
X-Gm-Message-State: AGi0PuYFZYVR5k7i0re265a8X7rV/HhaSmqJe2zEGA4aonxbCgZ++G+u
        FEoxZWQSesKTQYk8orh0wAr9rg==
X-Google-Smtp-Source: APiQypIFhtjeAMS9QbnUxPjJwRI1p5Xcbg5ltSm/cXWA2dMBCmxFwFxeAotaA6qLGbnm5f4z9vfiww==
X-Received: by 2002:a62:58c6:: with SMTP id m189mr16314763pfb.161.1586983748099;
        Wed, 15 Apr 2020 13:49:08 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id i13sm14461861pfa.113.2020.04.15.13.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 13:49:07 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, elder@linaro.org, Markus.Elfring@web.de,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] remoteproc: Restructure firmware name allocation
Date:   Wed, 15 Apr 2020 14:48:56 -0600
Message-Id: <20200415204858.2448-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415204858.2448-1-mathieu.poirier@linaro.org>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200415204856.e8SuAp_yQhQcVnUsAJ-rLe6YMW4_blpNOa46cAQ6OZQ@z>

Improve the readability of function rproc_alloc_firmware() by using
a non-negated condition.

Suggested-by: Alex Elder <elder@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ebaff496ef81..0bfa6998705d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1984,14 +1984,14 @@ static int rproc_alloc_firmware(struct rproc *rproc,
 {
 	const char *p;
 
-	if (!firmware)
+	if (firmware)
+		p = kstrdup_const(firmware, GFP_KERNEL);
+	else
 		/*
 		 * If the caller didn't pass in a firmware name then
 		 * construct a default name.
 		 */
 		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
-	else
-		p = kstrdup_const(firmware, GFP_KERNEL);
 
 	if (!p)
 		return -ENOMEM;
-- 
2.20.1

