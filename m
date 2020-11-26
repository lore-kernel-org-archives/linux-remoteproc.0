Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3129C83013
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DEF9207BC
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EJgU0yrf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391194AbgKZVHa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 26 Nov 2020 16:07:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732947AbgKZVGq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Nov 2020 16:06:46 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 276B7C0617A7
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:46 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id k11so2593546pgq.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tgn2hTBqiW955JL5NPKA45JX/FzuG4XGgD1c5/FNO0E=;
        b=EJgU0yrfDUi8K8TBrpgjT/nsXFo2NQQXZN2x+vJPCyzkDxYqwcmziQyyjhr9ttVojI
         AonHYDAz2+W26V4stIv19k1UcMmylcC4/I9CgGet6RwL6Kyy2UAtfKTl0qfAIytXLqhX
         I80mt//amPrYAPJ30mKrzEQPvBJ7rmm1yEpGk/nEnef0VfU7s/1Qc42Z/Kl40xpDoJSd
         dESiphWO7uhj9Tb281SsmB4OmaJfa/D19zZLoG7bYC+c7eHkgt3LYYrudLSvRQDvTFIg
         OIkAC1WD33FWh0WsP8pEYguuVyKOJASEoFcHEDb+d5Lgd0MUj99UTtwvtWAFsePNQ3Z7
         T1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tgn2hTBqiW955JL5NPKA45JX/FzuG4XGgD1c5/FNO0E=;
        b=H9c3ZIvxUudY4XtIfzWHf7H+jemOAwgP9ANUxXDaIczSwabS9NHASJiDJ6PTy37ee6
         5cw4AnWqeGQXVivqsSOHEbXup/h+meenJYRZOi/trJkwuLkI6M/05Zo6fovkrLK/chb3
         26s1grjb9pRZUY6LcbSUz0J4YGS2y4x+u93keyafvBVboNBUHy/X79UGsZRc/evgzEQu
         0fjUKInZpPRVqswD0kMkXiDGAYqoyhXgARb/hJbFQ/Ojs6e9t16O5AYddWjJoHZBFfYp
         KV/mZLjTkhQZjURDjOOfVBoGWddfFEgvA9tFA88jGD5BrgoUz88nOQUwRP4WZTXNQylh
         YtlQ==
X-Gm-Message-State: AOAM531z/bm/SntQ4Y/bTCMivMrt7CwFAcpdTz99lMm43kr+dKrQXQSC
        F8384E2j7AWEoqbOMEtyOv5fNg==
X-Google-Smtp-Source: ABdhPJxxRX5T2XVObUhBwNopitD5QOQ5LaEDrJ75ibgn4vFqyaiYk50I+mOWW6AvrfKpk1GEYX69Jg==
X-Received: by 2002:a63:3309:: with SMTP id z9mr3796396pgz.243.1606424805726;
        Thu, 26 Nov 2020 13:06:45 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c203sm5612676pfc.10.2020.11.26.13.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 13:06:45 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com
Subject: [PATCH v3 02/15] remoteproc: Re-check state in rproc_shutdown()
Date:   Thu, 26 Nov 2020 14:06:29 -0700
Message-Id: <20201126210642.897302-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126210642.897302-1-mathieu.poirier@linaro.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The state of the remote processor may have changed between the
time a call to rproc_shutdown() was made and the time it is
executed.  To avoid moving forward with an operation that may
have been cancelled, recheck while holding the mutex.

Cc: <stable@vger.kernel.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 46c2937ebea9..e8b901f34c91 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1857,6 +1857,9 @@ void rproc_shutdown(struct rproc *rproc)
 		return;
 	}
 
+	if (rproc->state != RPROC_RUNNING)
+		goto out;
+
 	/* if the remote proc is still needed, bail out */
 	if (!atomic_dec_and_test(&rproc->power))
 		goto out;
-- 
2.25.1

