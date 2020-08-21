Return-Path: <SRS0=5kUu=B7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A74C433E3
	for <linux-remoteproc@archiver.kernel.org>; Fri, 21 Aug 2020 11:58:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C480420732
	for <linux-remoteproc@archiver.kernel.org>; Fri, 21 Aug 2020 11:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VbU9dYV8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgHUL6o (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 21 Aug 2020 07:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728153AbgHUL6n (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 Aug 2020 07:58:43 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333F0C061386
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Aug 2020 04:58:43 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 17so956562pfw.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Aug 2020 04:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8wwALmJf2yOUBlAVphfdDCbFhBIoI3I+yyAPjEYKwGY=;
        b=VbU9dYV8zGQ9ErKd5Kv3BJ2dMtJwWGBOJ5p4wtBlKuXxEPr+H4CPr4Ts6dJGxLZvcW
         9jQEwIUIYOANdBnc3VddeQpwnHHrTdUAssdLV1oJlz2ESEBSIyEIZqiL6rjzQacC4vpw
         pFU8zMI0dtOlMhZy7tZBv0Qwb32Lr+61z1Msk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8wwALmJf2yOUBlAVphfdDCbFhBIoI3I+yyAPjEYKwGY=;
        b=rc7SjuKC1kvgjRBYIUpWOLbji4QRtS94gzfcTERiVwvKmm4Qx9K8GqKwYFlM2iLSZk
         //PBfmrSDGWiVacpZcwB+jzSgZBw0/9S4OnYOt29uK9HZPhZsIFNF4KGAMVjP0ZFns46
         wto1qW2rjarCLooJdFoDob9Wh6TR+Pp159hVaa3WjZnl4q1AJIckXPqc8FxwLDZRkY3C
         1qAAXmBI+gUp3GtkLLRLzP/rAcK3FeUtirbmpN2blj8dUetMm1785n35r4EuofJ324Lx
         V3PrI/8Ba/aUO5JIM9XYTR14aD90L9PTs9MLNJWETSslmIC1EE7HjUKd1IJcLGBORX83
         RnEQ==
X-Gm-Message-State: AOAM5317WzdJA5/LofiHEkNXo6z1PWNpXw93OvJUt9w8wduPdopmxAT7
        svwmuisYNP6sFrXxxrYE6Z7/Lg==
X-Google-Smtp-Source: ABdhPJxj2/IcGvXyrpUTqH4K0va20IlRXBrvav0Bn9aTrp30J/em6/ykXs1DoBMcjImd/TliTgC5WA==
X-Received: by 2002:a63:1417:: with SMTP id u23mr2093891pgl.289.1598011122524;
        Fri, 21 Aug 2020 04:58:42 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id k21sm2054422pgl.0.2020.08.21.04.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 04:58:41 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] remoteproc: scp: add COMPILE_TEST dependency
Date:   Fri, 21 Aug 2020 20:58:32 +0900
Message-Id: <20200821115832.2893484-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This will improve this driver's build coverage.

Reported-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/remoteproc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index c6659dfea7c7..d1fcada71017 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -43,7 +43,7 @@ config INGENIC_VPU_RPROC
 
 config MTK_SCP
 	tristate "Mediatek SCP support"
-	depends on ARCH_MEDIATEK
+	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select RPMSG_MTK_SCP
 	help
 	  Say y here to support Mediatek's System Companion Processor (SCP) via
-- 
2.28.0.297.g1956fa8f8d-goog

