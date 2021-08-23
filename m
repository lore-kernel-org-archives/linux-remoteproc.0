Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D15C4320A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 23:51:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4989F613AD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 23:51:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbhHWXwI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 Aug 2021 19:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233450AbhHWXwG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Aug 2021 19:52:06 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F88C061757
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 16:51:23 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id e15so11142605plh.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 16:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ofv+j2S2FbiKvsZuOL3LOydJGqLAS0ftgkBRlwGwLQA=;
        b=DRUPWBF+7oiDZ6doVRUz5uLuTc8hII8QmvugZNqz/WWkU12lBZlIkv/4xxEEvDL3Ay
         DUSEcibMrh8t3srnfcL7KddUkz7JG0mo96E71E3w6bv4uKcZSR3n7XRbrm9b4UbgCooF
         UA8Iw81QZ/AiQg5PvmgYLI2vvVHgp8Fe3/Zbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ofv+j2S2FbiKvsZuOL3LOydJGqLAS0ftgkBRlwGwLQA=;
        b=RmVS3nueK5x6mZNWvezOJl9j2tX39AJQK9QzzmVmGzcD5fh2ax4CsYpLvFMEI2GQ/s
         auqvj5PhEjZXftzZ6x6uKnKTwkBKkHhYjSqzlPXJQ485zXSVp1HhUSnmVFUFT305Bx46
         KmjFV18/PfalpWWsiJpKK8U9g+L8iyQF6Is+PFRv+Odh2DhFh27U93fDlsikX91isL69
         3h0uNmWsUskoXa56kg6lizxpYi43OgUfzccm9EnN3iasv67zZZn0UfZY/mNOWSeHg/l1
         n+5hdJeQRy+aIYQV3ylPNRRFS4EDXqPEm0Km+uXYnSbHo21qzsHvTXdiV+gv8V+faQhB
         qpOg==
X-Gm-Message-State: AOAM531gq5m3r9dY+P2XXXvXbgfuHY4gU7N0AqraBUBIxu8SbdmXBfs+
        +bFz/84u0BkAhkZMRzNOO3+EtQ==
X-Google-Smtp-Source: ABdhPJzkpDY3t+VBB6BNghMoJ+ykky8fF3OI69J+keDxdweBYcplBMJj87ECZHqX3Cj7LOzRjdmjtQ==
X-Received: by 2002:a17:90a:458c:: with SMTP id v12mr1178683pjg.50.1629762683388;
        Mon, 23 Aug 2021 16:51:23 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d459:dfd5:c7a0:283c])
        by smtp.gmail.com with ESMTPSA id t14sm20074660pga.62.2021.08.23.16.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 16:51:23 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] remoteproc: qcom: Loosen dependency on RPMSG_QCOM_SMD
Date:   Mon, 23 Aug 2021 16:51:20 -0700
Message-Id: <20210823235120.1203512-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
In-Reply-To: <20210823235120.1203512-1-swboyd@chromium.org>
References: <20210823235120.1203512-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

There doesn't seem to be any actual build time dependency on the
RPMSG_QCOM_SMD, besides that these drivers should be a module if the smd
rpmsg code is a module. Drop the compile test dependency so that these
drivers can be used without RPMSG_QCOM_SMD being enabled. This is useful
for the qcom SoCs that are using RPMSG_QCOM_GLINK_SMEM instead of
RPMSG_QCOM_SMD and thus don't want to enable the SMD driver when it is
never used.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/remoteproc/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 9a6eedc3994a..f30d00a3aabe 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -154,7 +154,7 @@ config QCOM_Q6V5_ADSP
 	tristate "Qualcomm Technology Inc ADSP Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
-	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
+	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
@@ -173,7 +173,7 @@ config QCOM_Q6V5_MSS
 	tristate "Qualcomm Hexagon V5 self-authenticating modem subsystem support"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
-	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
+	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
@@ -192,7 +192,7 @@ config QCOM_Q6V5_PAS
 	tristate "Qualcomm Hexagon v5 Peripheral Authentication Service support"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
-	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
+	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
@@ -213,7 +213,7 @@ config QCOM_Q6V5_WCSS
 	tristate "Qualcomm Hexagon based WCSS Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
-	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
+	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
@@ -246,7 +246,7 @@ config QCOM_SYSMON
 config QCOM_WCNSS_PIL
 	tristate "Qualcomm WCNSS Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
-	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
+	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
 	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
 	depends on QCOM_SMEM
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
-- 
https://chromeos.dev

