Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588A3C432BE
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 23:51:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EEFE613A7
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 23:51:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbhHWXwG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 Aug 2021 19:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233360AbhHWXwG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Aug 2021 19:52:06 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010F7C06175F
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 16:51:23 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id n12so11165771plf.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 16:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qP9Pyq6spTLX2ZdL8bYbTvq8hc7AHiozjvavSsllrAo=;
        b=F3tqRJJHZnRMhQgjkRoOgfFLcjx3oIDMv1a1W++h1Yoh2cfrWpCsucfcmjlbVamBT8
         hjtmOYEMet7dHIvlPdxa7vrtyJhyTnwk8j0y6DkPINWRDoHuTzlPJUdZkrrzdqAS4Z1N
         wj3cC2Ph1Fr4TM1YKEIepU/foKCshexlcRRF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qP9Pyq6spTLX2ZdL8bYbTvq8hc7AHiozjvavSsllrAo=;
        b=h1lp/C8u5g49+RV+PbMN3mSFfN5JCsHpOoU0NNUk+s4I837ehkEHqQsA2reF7iEddf
         KO3ehIob5XHc0LcTcyL42FJXsEvovtGsYM610yO2f9BKJmmOFXshrbujzPKwO3y2P5wj
         AFY6npMVZsq7cc/yq4qVlh0CxMg6g5SQGPDMxiVgzXZ8XOa2ivNJJFlaBhj6XAO3u5dc
         KG33a2Ti9UpWtpN5armF+31zsukxsPRR67u4X22KnpdLsOPrLAQ5D+M0XrUNoPg4TBVK
         KHGKIlEwrVcqESYDQ2f36RWIOg3dAuBGrTQdcjnLS+Acyzc5WSqmB7LyqKi4vyr7R03b
         vSGg==
X-Gm-Message-State: AOAM531zHjdrXTFSt0kCzfTQwSg1ZOpznkPXDAroE55EI66W1IyGHE+T
        S0FDaXz/UbPl941KdIktvi7EAw==
X-Google-Smtp-Source: ABdhPJzIG/7d35YPbe2fIJVHKCJ6NuWUFE4zsXPv3awoTTePAiL+yylLYE3st+O7LQHJSaif0gADKw==
X-Received: by 2002:a17:902:d2c3:b0:136:3916:c936 with SMTP id n3-20020a170902d2c300b001363916c936mr566998plc.85.1629762682512;
        Mon, 23 Aug 2021 16:51:22 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d459:dfd5:c7a0:283c])
        by smtp.gmail.com with ESMTPSA id t14sm20074660pga.62.2021.08.23.16.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 16:51:22 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] remoteproc: qcom: wcnss: Drop unused smd include
Date:   Mon, 23 Aug 2021 16:51:19 -0700
Message-Id: <20210823235120.1203512-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This include isn't used anymore because the smd functions have been
moved to the qcom_common.c file.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/remoteproc/qcom_wcnss.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index f1cbc6b2edbb..33d786b93775 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -25,7 +25,6 @@
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
-#include <linux/rpmsg/qcom_smd.h>
 
 #include "qcom_common.h"
 #include "remoteproc_internal.h"

base-commit: 36a21d51725af2ce0700c6ebcb6b9594aac658a6
-- 
https://chromeos.dev

