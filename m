Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05668C432C3
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9BF464FCD
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbhCJVK7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Mar 2021 16:10:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232181AbhCJVKq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Mar 2021 16:10:46 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F8BC061574
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:46 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id gb6so2336802pjb.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=//t8ceQV9F1IbLzcb1N9QjBaVQNk+K1abKjB3CMSp5E=;
        b=rfkm0nJEZoMdLtilTXPgnGadhHuTtG+vM1fymP6gqGdeCnlKc4F3KB3Uaq/4o3K8Cj
         ZbaN+Ybje2iSv1GM27/q82Hn5SvEDzItHSyb+kYTu3LNsulPhcXzLF8IbMQU6oNEF/iu
         MHnF625jXIXo225Nhk2Sxzxb+v7XZFpIAjZkW0mPrhJJmmdtRblLANQC8+1TlbXuB9QQ
         Gk9OKYl5UgQWNKLC7vouDjdEgoSgeJaWR5hHGu81uIrXlhXaNmaKc9C45M8dT5cnJagu
         qa0+ylB5RwENeF6kWFLCSSgbJeUTBQK2LKrqLl/gwb1h/Xtpx6f1q0SPjmDGDEY5WV7t
         H3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=//t8ceQV9F1IbLzcb1N9QjBaVQNk+K1abKjB3CMSp5E=;
        b=YkI/hUHyHU+c2S09+86PMRQGmkg82NWzxn4yFaKZBIUcijA/2RnOBJYVFWW0Vs41nT
         2ulNwlhRzk2CGBnYNRZZ+fMTiksMyqzaSD/MZpORpg+pqdmsstZkceJByqJO1L/DVDlT
         oPDQ8GZcfkSbKCVy8BQBhfRYb1jPXKk543Cljns2Allo1oIorjkaI/d2eg5EXGwqdv+l
         fIpHF+N7IDF+xAW/ztmWqMQ5KSLl3i/qzpnZ2unpZbUrSriXM94caz433zNTsCaJz2VO
         uX/A7py+8/do4a4q5QlNxIStExKSFbhhcHlyu0rowrK3YGCK+V14hFwTOnDNjBtlpXA6
         JyyA==
X-Gm-Message-State: AOAM532gEAg9eiD79pfHYA9f4+SJhxf0UBsB4R2Fvn/YbK2TicXi4WwT
        jlZORZeaeKbtKCy9+Z1PioBHlA==
X-Google-Smtp-Source: ABdhPJztCx1IRaiY8WWUM/s+nmMh+Th74pFv36zfIr1uIduR9+Qdsma6eynemzXDr+wNoGlEZmYNwg==
X-Received: by 2002:a17:90a:86c9:: with SMTP id y9mr5427957pjv.205.1615410646372;
        Wed, 10 Mar 2021 13:10:46 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j21sm371508pfc.114.2021.03.10.13.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 13:10:45 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 13/17] remoteproc: Properly deal with a kernel panic when attached
Date:   Wed, 10 Mar 2021 14:10:21 -0700
Message-Id: <20210310211025.1084636-14-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
References: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
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
index c488b1aa6119..f6f0813dade5 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2728,7 +2728,11 @@ static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
 
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

