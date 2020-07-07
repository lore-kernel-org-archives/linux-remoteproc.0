Return-Path: <SRS0=mmP+=AS=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B880C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 21:31:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A7A520773
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 21:31:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlg4YzlY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729306AbgGGVbW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Jul 2020 17:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729244AbgGGVbV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 17:31:21 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60202C061755
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2020 14:31:21 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d194so17233430pga.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2020 14:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SLaqUlqIXEKDw6i85lizbwO407gGhXi2WgUCdFT1Ou4=;
        b=vlg4YzlYmvKnq0oZiRA/WZQZV9aTD1HT5uRwu7wRIjrPwUyorhubGe1al5Kz0My1np
         ez3h7UKM28lZ9RHgN/nlSWooHmU7ppDl1sWqV/scpmPN7++XuCidW7Iz/WaKmnzOqR/a
         JHup0M8XeOQor04qjakUv+rAg76hp/7PLXJtNwOYvpk6DJZPtnVOO2XTXl55D/WTuyXU
         CHEUkEad2ljkpoWL8pmAriaHw2iwphdwQKTc8oz71DDXXf31ZpgjUy6XQ5lEp1d774mZ
         8Ar0GR4BTEvkI+BW1tLbmyuftnYt4DfgzMurlZ8PNATS8qjnVjQnIfe/9wfi+7Gs/YEV
         /ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SLaqUlqIXEKDw6i85lizbwO407gGhXi2WgUCdFT1Ou4=;
        b=O+glg5sj6eA4XuiwaC89jN1KhhX/9FBD3PtEFz1+lqNXtTO/cH4CSF98h2ZCemwnbU
         S2JChfzbwXC0VaUBpexC02KfSVSQ0M3OyToIqO4mvJ1m0iLeRJFBAE82tawBMBJO0pn5
         gaB2ypSrludLpXN8q0uQYFft97qO0Zb7/QKV7lCPWkpkAfcuQzsbbRPqAFjE7/oLWWs/
         TECpl6KOql2v8WG0TDqKrYzy5D1jz9tnYblhEjiP0YrVrLlkFaA21W0PHtUOeO9i07Gi
         1nWbi1iaKfk4iV2K/WMVFHtBfzy+7+TFYXgcY+mr5CCq/lLaFs3lf1iH9CMyXBbWYbRc
         OJFg==
X-Gm-Message-State: AOAM531Wqj+ANsqZ29DfdnzeVzXEVZUg2U/j4CiqA7OjI8DUsNwSEcbp
        bFwsOM8JEV2Eg8AODZcQIXEwYQ==
X-Google-Smtp-Source: ABdhPJyxF5Ve+kukkL9TmVEdAdGxntg6WddAg9u0VffB7KEjWpj59KKeIydccl7sGqBDGW7ydmzbLw==
X-Received: by 2002:a63:7cf:: with SMTP id 198mr45501912pgh.309.1594157480837;
        Tue, 07 Jul 2020 14:31:20 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:31:20 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 05/11] remoteproc: stm32: Parse syscon that will manage M4 synchronisation
Date:   Tue,  7 Jul 2020 15:31:06 -0600
Message-Id: <20200707213112.928383-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Get from the DT the syncon to probe the state of the remote processor
and the location of the resource table.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 986f34a336a7..961a53f67ec5 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -71,6 +71,8 @@ struct stm32_rproc {
 	struct reset_control *rst;
 	struct stm32_syscon hold_boot;
 	struct stm32_syscon pdds;
+	struct stm32_syscon m4_state;
+	struct stm32_syscon rsctbl;
 	int wdg_irq;
 	u32 nb_rmems;
 	struct stm32_rproc_mem *rmems;
@@ -607,6 +609,30 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	*auto_boot = of_property_read_bool(np, "st,auto-boot");
 
+	/*
+	 * See if we can check the M4 status, i.e if it was started
+	 * from the boot loader or not.
+	 */
+	err = stm32_rproc_get_syscon(np, "st,syscfg-m4-state",
+				     &ddata->m4_state);
+	if (err) {
+		/* remember this */
+		ddata->m4_state.map = NULL;
+		/* no coprocessor state syscon (optional) */
+		dev_warn(dev, "m4 state not supported\n");
+
+		/* no need to go further */
+		return 0;
+	}
+
+	/* See if we can get the resource table */
+	err = stm32_rproc_get_syscon(np, "st,syscfg-rsc-tbl",
+				     &ddata->rsctbl);
+	if (err) {
+		/* no rsc table syscon (optional) */
+		dev_warn(dev, "rsc tbl syscon not supported\n");
+	}
+
 	return 0;
 }
 
-- 
2.25.1

