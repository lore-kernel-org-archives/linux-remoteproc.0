Return-Path: <SRS0=rFSt=CY=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA42C433E2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 01:29:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A276212CC
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 01:29:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F1z8pHLt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgIOB3c (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Sep 2020 21:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgIOB3T (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Sep 2020 21:29:19 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B46C06174A
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2020 18:29:19 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id bd2so468660plb.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2020 18:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t+LDE3L9Rd8xod+nf/fpSOnkKm7sgObU6S8Jc8pawso=;
        b=F1z8pHLtsMKTgjLCJwEKW1if7OlBk/BJGXliEkqJtz1XyhXOnJ6eq+idoYzutmORrC
         MCYok4vVyi2rIjFcZ+cmb/RfEJyO5ApwdANGHg+08822wHnGrMQFMnljHKnIuE1MtpZp
         +JUPGEicjz4uFX/LVv9vOLH1UhhJB5h9qw1xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t+LDE3L9Rd8xod+nf/fpSOnkKm7sgObU6S8Jc8pawso=;
        b=ePk7UVroay2vI7q5ZWAZ5Vo376uwFsgx6MJhVc8mDkvikvokXMhLje2623jafELm4I
         yJ3Zsfd0GR+d5x/kSyh7JGayeWTCkS7aGs3DsMt35piiSkIQLWMq8ABmAFWKi2NVJ2K0
         VJpPOyzUWcoY4XiuihOzLVyunGqtwRQS7TDryFGZpHRuZ8VAxWv0HbKUcZ5zb56qZ/6i
         P7YAZ8G+DyNd6rvoPGtXZIDPso7ltAhFBVAPj/hTfmwi+FBNCGn73dLbiWRVUn3npVsk
         w0UUJJ8gVkfH0fYU21lUrD+EBBpsvDaZAnzrWiG6rVgByJEZQrMRD+zxmSf/KNTCHUAV
         BV6Q==
X-Gm-Message-State: AOAM533Pq3prCMrKeWpLsE9L4sBO/D3kcxU9DfYmz84GNpzCn6r0lNIB
        iWG29gweRJyOcV0UBabuhDvqlQ==
X-Google-Smtp-Source: ABdhPJy+etAFBiDkHJSo/6zbE90jCDLyZuj1RY6mOM/cNh2QN369FMFz48olkXcBWv6vXwIGmu6wrw==
X-Received: by 2002:a17:90a:ca03:: with SMTP id x3mr1945421pjt.92.1600133358893;
        Mon, 14 Sep 2020 18:29:18 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id bx18sm10173790pjb.6.2020.09.14.18.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 18:29:18 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH RESEND RESEND] remoteproc: scp: add COMPILE_TEST dependency
Date:   Tue, 15 Sep 2020 10:29:11 +0900
Message-Id: <20200915012911.489820-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
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
Hi remoteproc maintainers,

Second resend as I got no reaction for almost 1 month on this one-liner.
Pretty please?

As explained in
https://www.spinics.net/lists/linux-media/msg175991.html, we need this
patch in order to merge a driver series in the media tree. If that
looks ok to you, can we pull it in the media tree along with the series
that depends on it?

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
2.28.0.526.ge36021eeef-goog

