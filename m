Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E65C3526F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A319F23B70
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732694AbgLRReI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Dec 2020 12:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732697AbgLRReH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Dec 2020 12:34:07 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2990EC0619E0
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:41 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 15so1745099pgx.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S1HgCKBSeYWceu/5Tsos67As2E/8FgrkAm9u2K2eWO4=;
        b=K3x5/W+4ULJWJq8l1Xd1CrmV5GLr2egnactNfaaxBBudoYDP98hWuY9AKWADXn3sNo
         rg8GirM0BO7YfJ6Xx/jTtMdlMnhoP1HC1SMcRAlMtni21IomvYF98rQ9V5uYtB7P8fuw
         jK05p4Xz1+HGRGpohfJXxFPnqPXtoFsL2qlnqbf/diJ+x+XukYL95mfJNYxypHI2uybz
         VB0lkh1qPoU3TrgQXk8THBwebaCScTknt+tyZqOAar1y0PXPA9m+rb7hhm4ieF7vVO1W
         FOoHkIvQup28bX6TAzsW4LKjS/884fW9yO5LVDXkBrbfvRDWrspz/gugSNIaOkDb40I9
         vdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S1HgCKBSeYWceu/5Tsos67As2E/8FgrkAm9u2K2eWO4=;
        b=XcQV8RorhKcV+OiSKsQHSDw2frKypc434pl9/OneM4UOTNInVsiwbSJZgIjLN8e9UX
         K30g6lMEWUHFNruAGQLNO9sZ77qvIi/NxnaiYUikBf/vopflVIw7XvYLfl+RXYxv6EkB
         hPTD9VXupThnIg9jnpZKWgcTLaDu3NgKizY+PHH/Om65+wXA1GlOFCBg/QCyNpEpH6TQ
         phUIvbqxbebvpVmIfD+kaJuQkJ2K01e+1QpoGhxia8py4Wb6drx+00PDPOY9ugmkFlK+
         CFsLVbn9sNzNFyOkdde+8lRRcGR24S4fjGJCwsyXcRJCGoVzSegntDO69zNY09O3K3WS
         ie7A==
X-Gm-Message-State: AOAM531b0ralvTJ7qNf4lXrRvDZQZGBGegLZ6ssiBXRC6h5SvcJupYEC
        DVTt6EGAsvGlOYHfbWq5VuTJcA==
X-Google-Smtp-Source: ABdhPJz0u6bhRN0P+E0shxtDgSEotIsq6JFr2tK1pJBY/vhdVJJ5rnIxc8u9MwxAcby/zCik8akL1A==
X-Received: by 2002:a62:19cc:0:b029:19e:321b:a22e with SMTP id 195-20020a6219cc0000b029019e321ba22emr4824607pfz.73.1608312760748;
        Fri, 18 Dec 2020 09:32:40 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l11sm9892957pgt.79.2020.12.18.09.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 09:32:40 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/17] remoteproc: Properly deal with a kernel panic when attached
Date:   Fri, 18 Dec 2020 10:32:20 -0700
Message-Id: <20201218173228.2277032-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The panic handler operation of registered remote processors
should also be called when remote processors have been
attached to.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 19545b7925e2..fc28053c7f89 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2414,7 +2414,11 @@ static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(rproc, &rproc_list, node) {
-		if (!rproc->ops->panic || rproc->state != RPROC_RUNNING)
+		if (!rproc->ops->panic)
+			continue;
+
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
 			continue;
 
 		d = rproc->ops->panic(rproc);
-- 
2.25.1

