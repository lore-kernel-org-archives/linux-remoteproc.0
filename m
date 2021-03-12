Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589D0C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:25:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 266EC64F80
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:25:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbhCLQZC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:25:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232493AbhCLQY5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 12 Mar 2021 11:24:57 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA598C061574
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:24:56 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id w34so15127483pga.8
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2KkXz7Q+zlIq4fjTeJz23Qytt+RMPnrKFr7q6Kz46gw=;
        b=goU7+hhY1A+/8UPZ/6wfKNvo1Wd5VQk5jmBUyB4029x3LFD06OY4N/dUHCx+6JCMXN
         4Gv604F1GGYcYScSB4t+ihHzgM2x8Ch7DVxgVNjczyeVTttmuU3DBliaoapfQk5O23Kg
         hiUyz5WqO+6GDpVzqB9HytOAgr9LMdDGgQLfcjzobhPwF9/CjmUhEgtIiKPMMsEH6CLp
         2tpDMCtV8g1mZzaQ5Rocm2jwTzFqtBEpB8iKUmpUpHVZo1zXml1JKLnFf+I3Op6D5iHv
         sRNaLOOxIOXudYl7cgQogN2Pwugrii5UcRF2dH4UnCTzdcZcTQYoKD2wXsIGLdA0udHI
         IPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2KkXz7Q+zlIq4fjTeJz23Qytt+RMPnrKFr7q6Kz46gw=;
        b=KqAWZexP1zmvw1UQVKdKKkyvp056sOWm9tN96DT36bwNjSM32INvWTf4+/r83EFt1x
         tnctGgw+kOKkTKsTXpLsA4KJiE5/vSlf7q7jJx5NBPRyZEcffNJ7NneQCQYzyJpLGwev
         6YttQQbk3WyMLpUnm5BYyFXz1Vk+LyIBT83nKZkI0quAQWpgzQpoZG1nLa7Xa98LPrHd
         o7KHjuZED1Hi8NAwukvTNk1eMoRm9I1ZhakUGLlZLX2Zli1IBzfb9wBzn41WFWgxV3+T
         PKzYwSZnK9oKyETE/x51R9U4v+BOlZgfkdDYhBfE7kQ4Z8fTBP6mBmU4RGNpD2AuHeDK
         Icjw==
X-Gm-Message-State: AOAM532hlmvtokejS4qcKFTFn+PS58oPg/Oam4VEEu1GAtzptyv9Qwz4
        XkFd/bM4fmcZvnphKfTUC5QY+g==
X-Google-Smtp-Source: ABdhPJykxgaKFWIUgas1xT2OFrRSUDk0+gKUmLvfAEZ0CH1C6V+Xud5HnYNRHhvdgH1YX++ceZwngA==
X-Received: by 2002:a63:ea01:: with SMTP id c1mr4449870pgi.236.1615566296467;
        Fri, 12 Mar 2021 08:24:56 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm5899599pgb.35.2021.03.12.08.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:24:56 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 01/17] remoteproc: Remove useless check in rproc_del()
Date:   Fri, 12 Mar 2021 09:24:37 -0700
Message-Id: <20210312162453.1234145-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
References: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Whether started at probe() time or thereafter from the command
line, a remote processor needs to be shut down before the final
cleanup phases can happen.  Otherwise the system may be left in
an unpredictable state where the remote processor is expecting
the remoteproc core to be providing services when in fact it
no longer exist.

Invariably calling rproc_shutdown() is fine since it will return
immediately if the remote processor has already been switched
off.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ab150765d124..d2704501b653 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2347,10 +2347,8 @@ int rproc_del(struct rproc *rproc)
 	if (!rproc)
 		return -EINVAL;
 
-	/* if rproc is marked always-on, rproc_add() booted it */
 	/* TODO: make sure this works with rproc->power > 1 */
-	if (rproc->auto_boot)
-		rproc_shutdown(rproc);
+	rproc_shutdown(rproc);
 
 	mutex_lock(&rproc->lock);
 	rproc->state = RPROC_DELETED;
-- 
2.25.1

