Return-Path: <SRS0=nfGK=6I=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0B2C54FCB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:25:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BD02215A4
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gp0+Zj2A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbgDXUZT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 24 Apr 2020 16:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729513AbgDXUZS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:25:18 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4478AC09B049
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:17 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id e6so4335103pjt.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KQbiUnUIr9QFPfrMWtrls9xYCut1DTLsNUPTpZeLJzM=;
        b=Gp0+Zj2AsVqjmrkROdpibc9WVlvp7tcdcOdZdQHBsR3UgKeec463gD/gEO3BwUfxId
         4qs80FR5WSpzNR1SqjnslyncQsgieuO8FYOSgr5hwqOfCi41IVUjNNC5q5Zzr6j2I3yi
         KJjHDvIlGO48gwfAIbEwO3n5i2jge5R4cWWMaHUprhq/I4laBl8nmafuy317N+fyZmX8
         gy/EOSGWad5Rt3pnr1KQ/DTkoocO+75wrBOQXlXeVt7zb1LIqqCqbavhbNh3j+XucUBk
         YEIf7REW3jwi9Nf2//7v64N+cSG95iVoOExMctUIfyLuDu0h5IOb/KzEZb2XNtq0cgZZ
         9ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KQbiUnUIr9QFPfrMWtrls9xYCut1DTLsNUPTpZeLJzM=;
        b=WzJh90KCGlAdiD66pZbPOIrueIWJMrAXAY3RYIC8HajW/hnsusU/NmXFxZUCtEQjgl
         O45XS/VpyO0+BzreGSlzC7/PX0NKqRnT/E6xeVBecS2VhyFvwoDIiPh1qrhgLxFEQ/u/
         XZxplUTpK9WwrZVW4f2+hur/bcCNlde5JUA5xHYcy3GNpojuyOhRJSS3zC4fC9l4s3HX
         v87HPSnGq1sRr31KbhUCbBgY5ng9GmrXG0jXoiDPWVgyZZGVQm0TyBk39Fyjuao67HrG
         eVlGuSkXFKDqnTjV8hSGAI9c7Y11APHGh7hxevoL7TvJv6NFKJz455EJ+sr1vM+u73kU
         iwXA==
X-Gm-Message-State: AGi0PuaNvbT1k6hmItDl/N1zONdo77YiT8hzbBQauEJAlIAxWvIbchkJ
        yaF3LOu/pVfVmdQoSUz4xvjWkA==
X-Google-Smtp-Source: APiQypIv6YWdkGqDXxYu9zKGxgTIDNuyx5qK9TgKQ6Q3MhTchnZhEiINgsaF5cc/+xunWfpXSGwU1A==
X-Received: by 2002:a17:90a:1a46:: with SMTP id 6mr8190985pjl.111.1587759916801;
        Fri, 24 Apr 2020 13:25:16 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:25:16 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/12] remoteproc: stm32: Introduce new start ops for synchronisation
Date:   Fri, 24 Apr 2020 14:25:01 -0600
Message-Id: <20200424202505.29562-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce new start functions to be used when synchonising with an MCU.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 8ba69e903851..404f17a97095 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -449,6 +449,13 @@ static int stm32_rproc_start(struct rproc *rproc)
 	return stm32_rproc_set_hold_boot(rproc, true);
 }
 
+static int stm32_rproc_sync_start(struct rproc *rproc)
+{
+	stm32_rproc_add_coredump_trace(rproc);
+
+	return stm32_rproc_set_hold_boot(rproc, true);
+}
+
 static int stm32_rproc_stop(struct rproc *rproc)
 {
 	struct stm32_rproc *ddata = rproc->priv;
@@ -522,6 +529,10 @@ static struct rproc_ops st_rproc_ops = {
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
 
+static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
+	.start		= stm32_rproc_sync_start,
+};
+
 static const struct of_device_id stm32_rproc_match[] = {
 	{ .compatible = "st,stm32mp1-m4" },
 	{},
-- 
2.20.1

