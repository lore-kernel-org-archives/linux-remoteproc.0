Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9992CC55178
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46EF0206ED
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hv9kblV9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbgJ3T5R (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T5Q (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:16 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E671C0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:16 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 133so6213581pfx.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NAwcucSRPOvdUr2SPYKPCVd/pqIxd9KNTkWdNua/hYQ=;
        b=hv9kblV9NRZikDjW8YsqxR4e1fb2iYOtADdoC0JHwBxFSgXrhB/MMZxBAg8htzy9Yh
         jNuyenU6aylTfnBumpnBXqfEyOBgOqM1KmnSnpJ0rKJ56vFMbuoAF7IVTxG4zD79Wju4
         d6vrCDaxPM3DTpk+mSnQMtZsma7mI5c+/KZwdfD+m1U4/7I8U1iByJki2OgvJD06MmIS
         t/y0tT+tids0JVh0kd0HfXHh5LZBqMsYkULe64qVy26qEPE53qk0D71HtjqbK+nHYqlR
         g1fKPLfnFd0jM/SQ4fPBtYOXYKmc8ZQktEMJsL/DaeavHNthDuFeiAUxTELrQ7ObR1Ps
         WyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NAwcucSRPOvdUr2SPYKPCVd/pqIxd9KNTkWdNua/hYQ=;
        b=iXLlnYhebw3Rmc9GABJKDlyKHfAB2bW6t8Mzb1sROPKay7ZxmgLdDGZKGf9tUIVUDW
         ENJyg+ky1R3Z6aMQXHbz8RacgAktbgQfGEyo0gBse66ZImBQDi759RAorEqXuqTqg9zD
         cg/KxmBC94iRJRWZkE8+H559uxu3dZ4Qxi3HGbHJKWwnpZGbKgbVWGN8wraM/GUqqdM+
         mg4NzGc8VIa0TOtD041may8kX4oljHoySq99GUYYzPQ0WH7k/kBsxCtsj/b0REhchSHi
         bl2LGVtVgzhZdzTr/VT6DEfBlkU0P2CZQToLRSZOF15xTl26mxCsmlZbI7YtdLILBBIa
         U9oA==
X-Gm-Message-State: AOAM531aV5tHFstcFFLxJGVyLvf2knyFFK27li/RWGVwQgkUBO5wCme+
        hyxZSRqY7O9NLctsWbt6pjT7CY2nA0We9MtA
X-Google-Smtp-Source: ABdhPJyWhwkQV28YUU4uUZuTQwKznPAIp4iOmdzrmHmLx5fxc5gRG5MFvK+utVl6JSIVHA3zmCPJ2Q==
X-Received: by 2002:a63:380d:: with SMTP id f13mr3634650pga.105.1604087835937;
        Fri, 30 Oct 2020 12:57:15 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:15 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 01/14] remoteproc: Re-check state in rproc_shutdown()
Date:   Fri, 30 Oct 2020 13:57:00 -0600
Message-Id: <20201030195713.1366341-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
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
---
 drivers/remoteproc/remoteproc_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index dab2c0f5caf0..e55568d1e7e2 100644
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

