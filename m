Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B596AC4361B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Dec 2020 03:05:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C4C223434
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Dec 2020 03:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbgLQDEw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Dec 2020 22:04:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727262AbgLQDEw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Dec 2020 22:04:52 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E4EC0617A7
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Dec 2020 19:04:11 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id b5so3262748pjk.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Dec 2020 19:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=2OShYK3cxttn34XBpwf6upnK9s0bIYer5Kl6XYLdf3g=;
        b=mtcwFqcGIhXVaOQzBmuoweU6wes3MKwesB6hNJhtfaGrUtHMulZK5oR1A1hAV7Pd4Y
         qFnULivaUIKPeFOQzZoXf08RrBBSd++PBugZgCXPhiJLERPBsHWUj37gdNEStB0oPhv+
         5laHL0h/jqNldFsbpx3FcYtJj0e4CXlLm5/a2LOS6e7jqwGC8Y8XXXp9uU/ydFf9ka2t
         YdipjftiSutrDfKDfvx+UTCbf/ij6OTAllFGkEI35z1/dNEkqjaFlPgNJdkg3LQkt+x7
         57scNyn4i7WJRE8p5T2/yUu4nBPe1d0ee3tFUvcz+OXJH+hGBFoHY1ecnpNokveJZEqv
         fcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2OShYK3cxttn34XBpwf6upnK9s0bIYer5Kl6XYLdf3g=;
        b=Y16nRi7sA4M0qz7XcDmK1KexOqKsHWEumBtwwdpmI3CNOdQZCxK+MrI5r00Qd51jAY
         MCZZhXEt/N1kgnqu18E7ODH8LrQdmg0DEZ85lKzQer/jH/3SxENtFtFjU4fiWzPInXjm
         iVECY2HvLImdxBmN4RAcTl4CweeSGAGcVTwQQ7dZ1kSJYBmDrc82xHXYe0gF603V9Jok
         dsi4f1ticYnZc+6p7XSyB20WUfIMF7DDc/WCXHIeXxM457xe5XvggZZWYAOWxo9RH2h+
         LfoYibC1xxv3VNz61tEvF6IFKmD3cWtCByO0+HOt5JA96fZNNwnE9PJfvivVTb8F7IYw
         3JmA==
X-Gm-Message-State: AOAM531C4P9lr5OhciTFc2D3Gy+O6zbuvziwbxGGvkOhF7wmD5jN0+6d
        70GvZvVxYafOPnoiiBT7rDnrKA==
X-Google-Smtp-Source: ABdhPJzjsGhTbXQUP6JIFv2xSVy9MTdU2w93YM+Nji7Dqa0++qRPapAO4Bk/Km/Fdxn3qmj6Nwe5Lw==
X-Received: by 2002:a17:902:848e:b029:dc:1aa4:114d with SMTP id c14-20020a170902848eb02900dc1aa4114dmr4382311plo.18.1608174251173;
        Wed, 16 Dec 2020 19:04:11 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 3sm3810675pfv.92.2020.12.16.19.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 19:04:10 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] remoteproc: qcom: add more help text qcom options
Date:   Thu, 17 Dec 2020 11:04:00 +0800
Message-Id: <20201217030400.6235-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

With these more help text added, hopefully it's easier to understand the
distinctions of these qcom remoteproc drivers.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/remoteproc/Kconfig | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index d99548fb5dde..062a990a7d19 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -150,7 +150,9 @@ config QCOM_Q6V5_ADSP
 	select QCOM_RPROC_COMMON
 	help
 	  Say y here to support the Peripheral Image Loader
-	  for the Qualcomm Technology Inc. ADSP remote processors.
+	  for the non-TrustZone part of Qualcomm Technology Inc. ADSP and CDSP
+	  remote processors. The TrustZone part is handled by QCOM_Q6V5_PAS
+	  driver.
 
 config QCOM_Q6V5_MSS
 	tristate "Qualcomm Hexagon V5 self-authenticating modem subsystem support"
@@ -167,7 +169,8 @@ config QCOM_Q6V5_MSS
 	select QCOM_SCM
 	help
 	  Say y here to support the Qualcomm self-authenticating modem
-	  subsystem based on Hexagon V5.
+	  subsystem based on Hexagon V5. The TrustZone based system is
+	  handled by QCOM_Q6V5_PAS driver.
 
 config QCOM_Q6V5_PAS
 	tristate "Qualcomm Hexagon v5 Peripheral Authentication Service support"
@@ -185,7 +188,9 @@ config QCOM_Q6V5_PAS
 	help
 	  Say y here to support the TrustZone based Peripherial Image Loader
 	  for the Qualcomm Hexagon v5 based remote processors. This is commonly
-	  used to control subsystems such as ADSP, Compute and Sensor.
+	  used to control subsystems such as ADSP (Application DSP),
+	  CDSP (Compute DSP), MPSS (Modem Peripheral SubSystem), and
+	  SLPI (Sensor Low Power Island).
 
 config QCOM_Q6V5_WCSS
 	tristate "Qualcomm Hexagon based WCSS Peripheral Image Loader"
@@ -202,7 +207,8 @@ config QCOM_Q6V5_WCSS
 	select QCOM_SCM
 	help
 	  Say y here to support the Qualcomm Peripheral Image Loader for the
-	  Hexagon V5 based WCSS remote processors.
+	  Hexagon V5 based WCSS remote processors on e.g. IPQ8074.  This is
+	  a non-TrustZone wireless subsystem.
 
 config QCOM_SYSMON
 	tristate "Qualcomm sysmon driver"
@@ -231,8 +237,10 @@ config QCOM_WCNSS_PIL
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
-	  Say y here to support the Peripheral Image Loader for the Qualcomm
-	  Wireless Connectivity Subsystem.
+	  Say y here to support the Peripheral Image Loader for loading WCNSS
+	  firmware and boot the core on e.g. MSM8974, MSM8916. The firmware is
+	  verified and booted with the help of the Peripheral Authentication
+	  System (PAS) in TrustZone.
 
 config ST_REMOTEPROC
 	tristate "ST remoteproc support"
-- 
2.17.1

