Return-Path: <SRS0=mmP+=AS=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4897AC433E1
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 21:31:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27384207D0
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Jul 2020 21:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EYA+6vGb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729302AbgGGVbV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Jul 2020 17:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729282AbgGGVbU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Jul 2020 17:31:20 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A93FC08C5DC
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2020 14:31:20 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d194so17233408pga.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2020 14:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lt6hUGBu1W7gsJ62+tKE3hemun/1WgbhEsuA1Og1vF8=;
        b=EYA+6vGb/dMe9sd7/qMvUrBIuiCU2hyLidvuwJvMVTaVq7cJfuCekg36Ms2kRMi08U
         6yXLvuXAolskKfdtO1Kut8RhdLL5mPrSSkRzXdDo8V6v03M/b2a8sTYMy+zeHW4x+XNx
         A1RJ+1yVSpdbDPAFSUYJuDofNh3IrjQF0YAhPGrxQeJzyj6KYzz9J01cNkW1FIfEOq2B
         ZfT/JtOeRUnX94GOiiFdR2XOHVHfcCG5ApyDEh4q77/HJiNqgNK3Ik+9Cl3N2HiwPKXR
         aHl1WOcih1ambPW3OyrNmvKYprl1TgbNrDbwJXCIthofRqHwGqHD2W/Ofyb9O3kKsd+T
         WN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lt6hUGBu1W7gsJ62+tKE3hemun/1WgbhEsuA1Og1vF8=;
        b=nDIJmhaiqprIydk0BhXN7RWfdW72p/ex8wUJ5NN64qVWA7LuXbeRyvCLnxY6K6DCy3
         N1A87NxHtT2inmh2bve+Za0Ts+qKRwLrx2MfRHhWDrlowQBL4TJizQfac2dUCvoZLNME
         J/CImj3MoOo8/L7Y/zEZbjaiP7BE8EbeyZ2KO0v3WRV2KMx4GphBtRekCwX4f0lqBQuX
         sfwppmwEWGqd/Bopwoup5ZLSUeL+Fo721HjZe0PRXVuL5lJEftt8pW4JJAlK0W3IYoyP
         SX/u7MUdVheq0nrMMA+RJ7/CE+o7mrZGk++uhonlKD02aPg7Rz6msyridzgezoU8C9HU
         06qw==
X-Gm-Message-State: AOAM533LqTtBdx19gP2RXNkrCAchf40AARA6xOS0QsZ9aSctK35RnD5V
        6yjtvltxGGYPtggxn+Ag3f93+g==
X-Google-Smtp-Source: ABdhPJwZ/wF7h8d7pCKt8rGnuyo24lrnRwS6wYuDGgfzl0bj2KI5KVsQvHU3bXAD6dcZ+syoMsQ7ng==
X-Received: by 2002:a63:8c10:: with SMTP id m16mr47225696pgd.149.1594157479588;
        Tue, 07 Jul 2020 14:31:19 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:31:19 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 04/11] remoteproc: stm32: Remove memory translation from DT parsing
Date:   Tue,  7 Jul 2020 15:31:05 -0600
Message-Id: <20200707213112.928383-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Other than one has to be done after the other, there is no correlation
between memory translation and DT parsing.  As such move function
stm32_rproc_of_memory_translations() to stm32_rproc_probe() so that
stm32_rproc_parse_dt() can be extended to look for attach bindings
in a clean way.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index cbba995a80a2..986f34a336a7 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -607,7 +607,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	*auto_boot = of_property_read_bool(np, "st,auto-boot");
 
-	return stm32_rproc_of_memory_translations(pdev, ddata);
+	return 0;
 }
 
 static int stm32_rproc_probe(struct platform_device *pdev)
@@ -634,6 +634,10 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	ret = stm32_rproc_of_memory_translations(pdev, ddata);
+	if (ret)
+		goto free_rproc;
+
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
 	if (!ddata->workqueue) {
-- 
2.25.1

