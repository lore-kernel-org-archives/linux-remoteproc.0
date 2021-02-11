Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394ECC433E6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F4C564E42
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhBKXry (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:47:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbhBKXrF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:47:05 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A988CC061797
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:31 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id n10so5057739pgl.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2KYl68Dz1gSnngZXwIN4sqByIS0YQQztG8qhw3LioGM=;
        b=zIatSa7CJYFApIdlA+4ilgXNyRLDat4ml/F/f4McziCPqJX/qShgyLX1ikZm1Hx8L9
         ogLgeKsFhOGJqUsy/9s7dsqrPpsb58CdyJtW4xpXr4AHoqgsOOVhKDGUJ2GWAF4jNRHS
         SFy2Qm8eNeRt0gF6tugmbnUwJOHDorASZOeV11ZeoqIep9k8QOlPN4bEnWpu0nEM+jag
         h/dJCsLpRCCXnAf+QYGOxitC4pyrYUUXIt6Qpb/03n37zjB5ZdfVMDHNX+TPNV7wANH8
         FO5sPFiNQoLsIBIaiHBzjSGH64MyFuqyKxIY+mWI7cHXP6QXVuCOFHCZdGVHYRrLbX3F
         aH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2KYl68Dz1gSnngZXwIN4sqByIS0YQQztG8qhw3LioGM=;
        b=QAV7qCBZMF/bSAV7wWeALoYQzAOSqxlmzWt5fD4InM5j9zqjinCwBezGXu3dTc9Fo0
         O/Fltq0jhy/EamnnyFESWNgmX5p8OpZrIJmPDQsAk+WfVbtdlYD7rHJ4DHOZ9PUlJznl
         M4vXrEtMCWL6YVEcjP0bIcRZJOVm5ToooUA+dyuifLJSnzqqrBlvtyToCf73vUAvlVRI
         GlpeJxuGPQ2bHvUEUWcqUxoHjkq0b3d2mxT7rW07D37wCzd3poCi+lJH9btpC9/aPq1K
         rf2HZWWt5ayBjH5d5smx9LWSn43QaJNnl8VeJFRqApXIu6f+wXOm7uAQKfW1rXx3KDft
         ZPcQ==
X-Gm-Message-State: AOAM531ucl8smJ/7bbDj5eY5CJtsl/4skoYgsz41NG4B2j2lUgUg8TOS
        pgl2ujFOor8u8xsnFiCVgJxiNg==
X-Google-Smtp-Source: ABdhPJwimie60L2qE+VDXtDsRyA3fx/afzXxDMnPnvMXXaaUYPUehkvHoQwKs/gicTDp11o+U93fgw==
X-Received: by 2002:a63:f95b:: with SMTP id q27mr567144pgk.82.1613087190926;
        Thu, 11 Feb 2021 15:46:30 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:30 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 02/19] remoteproc: Re-check state in rproc_shutdown()
Date:   Thu, 11 Feb 2021 16:46:10 -0700
Message-Id: <20210211234627.2669674-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
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
index 2394eef383e3..f1c097572e01 100644
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

