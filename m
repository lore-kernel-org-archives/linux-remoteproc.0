Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5ADC433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:48:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4021464E4B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:48:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhBKXsj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:48:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbhBKXr2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:47:28 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D1DEC0617A7
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:32 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id lw17so5358526pjb.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yDRxGrQMToW3Vor3njhDmnUs8pFP7mgJszB9Khz+OuE=;
        b=pZyDs0BtrY8aWl00bxfY7/rUW4h0wlDAGZF0GeV3Qjiz2SqmaEQrAI4QSlfRj8N+9t
         PoVI/WLAZ3NDxNM5hkalhv6HF2k3fvD7jDtXfybSOhTpY4bDRLir4Cf1R2adpqvrhGQy
         5khsgwhoFSfmPZcXdo7/JDewtBmkZAk1IYQdDFq2cTDIxiiUEkd9nye2qvckKooNB/X2
         QJ+5nOWUGzNlS5whigrKloP656FOAc5MvLSt0LX1/X4B2rtoZN04Ktd/b0f5gVc669ws
         TQHICqjLS0U3PlKZMtwHKwDQIusCVq0qcEa4zKMWQwM1hLfrNnCcIOmKkw+mH/c/EZev
         jddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yDRxGrQMToW3Vor3njhDmnUs8pFP7mgJszB9Khz+OuE=;
        b=D/cz5QdWHQbanwsszWPrgMZfZ5bNPQtkSrPzqlKEGH4P0mq60ZMMDgl2QL7h+d05Q7
         M0GO70hQaZuTJN8Xn8MR0FERwNQVBR+586l95fa0A3sGikYJL1vTnTT605nZe7rzmSk/
         317RATR+c0O3oqLnqFVHL3KUHiG3E8VHCXH/tRlePnJdJXrPEQBg8colQG9C1Pp6wuV/
         7nM/bvgyn02mYpN8lHpMnpfr44KOQHoF+vkIpy2e5LR8rKQZ+vmqN8adPLebnvALQPGR
         t29xMcYiE8Qxb0fJ60gwi/gRkEt3StlNN0HRg+jVAGR3FztD+k5bCaYZoaoX6r8Dfh8O
         UWEA==
X-Gm-Message-State: AOAM533hW5chznH0SHL8KfFS2vXkN79cZqJceeDXHAXVc8TFy2TH8cwk
        cpw9sfRCa08Z5GPXT/dZj7a2C2WRDYbf7A==
X-Google-Smtp-Source: ABdhPJxLsHBBc4Hj7/zp8fSObveC7Gc5G+rloz07Pb/qyttL9SyyFfR9mw9l7nxeJl8Dn3HHTIye3A==
X-Received: by 2002:a17:90b:945:: with SMTP id dw5mr186517pjb.34.1613087191843;
        Thu, 11 Feb 2021 15:46:31 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:31 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 03/19] remoteproc: Remove useless check in rproc_del()
Date:   Thu, 11 Feb 2021 16:46:11 -0700
Message-Id: <20210211234627.2669674-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Whether started at probe() time or thereafter from the command
line, a remote processor needs to be shutdown before the final
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
index f1c097572e01..86bd66955060 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2350,10 +2350,8 @@ int rproc_del(struct rproc *rproc)
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

