Return-Path: <SRS0=nfGK=6I=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69DBC54FCB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:25:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3D23214AF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:25:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nEIHT4o5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729464AbgDXUZP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 24 Apr 2020 16:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729458AbgDXUZN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:25:13 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C93EC09B048
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:12 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id n24so4142988plp.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mrZHw3wDEqsWxtX6I3Qw+OHrqvqS6c3mqgfKBC8xSv8=;
        b=nEIHT4o5k+submU1rUBIRjPzreeeM7YSY4E7V1SEGu5YkKslbOpGjRxk2PVJ0e6xHd
         SXjmkQFR0s76Vs+SIhZbiqdwxsxXClpb114b/0W8uabUhIKFao3OKd1L4nuMX1znjiPe
         qQP7XgxiC4lZLDwECOiQbzUW0fEuqUgbDTn0rw28bGRcuJ7ngPnzqT2ZSGJLoxMn/PxZ
         fffRPF6DxDAFWbgEb6z50zzUw7NNjxuXSWuXCgJJacAYw3fPqEgIUoslVBSEZMjMwBxp
         BI43yLdV4LCUQzNbtcSRkmPWV1eRNty/VNcNXkODiU/gepJb91dnMBcF8aeufnmxkkCX
         lQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mrZHw3wDEqsWxtX6I3Qw+OHrqvqS6c3mqgfKBC8xSv8=;
        b=nk4q6Wy2fGlN3tE4YrbgmGf47UnLHMku8hYjojiEZHDIZrPLLCiA3VMj8wnDAVEUN6
         x8e5wVMhar4BkqHiS2uHXsgYRP0DdLGz9vTROdhzZEg5X7Em5EBre6Fq3s51imPeDU0I
         DyoXOvRSDtQQiXWLvZXL2RLw9Ir1HpiiQzxYNAgu00Yl/YrBehJaYTfBSQhU2e605DX5
         pMzw7TDMCrqcoJQDQMliJp81gal5K9LYgqqJv3zXRFkflnY/xn+HWxdDs4oc/b53Bfye
         uwUVbxu+DvYGkgtJJPckRHbUbaszDTdVzAjvwsx9kckqmPNpJRugmQOLya8AIt08LzBO
         bgUg==
X-Gm-Message-State: AGi0PuYjKDQKXZwKK7NhW0DBXEY9dnyIi5S7gK/yP3kjPZOln7X3Ixtb
        wa2eIXgxJSqiJi7Mgo5RnHijRQ==
X-Google-Smtp-Source: APiQypIckGk/05A/UD8d3TxSQDoWu1T4/CMGlEehpQVQAKrC1wqh0IN3n+KIr7o6Kj7ucki41lXmAQ==
X-Received: by 2002:a17:90a:d703:: with SMTP id y3mr8770619pju.75.1587759911901;
        Fri, 24 Apr 2020 13:25:11 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:25:11 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/12] remoteproc: stm32: Remove memory translation from DT parsing
Date:   Fri, 24 Apr 2020 14:24:57 -0600
Message-Id: <20200424202505.29562-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Other than one has to be done after the other, there is no correlation
between memory translation and DT parsing.  As move function
stm32_rproc_of_memory_translations() to stm32_rproc_probe() so that
stm32_rproc_parse_dt() can be extended to look for synchronisation
related binding in a clean way.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 57a426ea620b..658439d4b00a 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
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
 	rproc->auto_boot = auto_boot;
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
-- 
2.20.1

