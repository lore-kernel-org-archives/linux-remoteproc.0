Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0144C43219
	for <linux-remoteproc@archiver.kernel.org>; Sun,  1 May 2022 10:36:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345339AbiEAKjZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 1 May 2022 06:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345408AbiEAKjA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 1 May 2022 06:39:00 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7CFB55
        for <linux-remoteproc@vger.kernel.org>; Sun,  1 May 2022 03:35:33 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id k27so13693069edk.4
        for <linux-remoteproc@vger.kernel.org>; Sun, 01 May 2022 03:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P5SJ0prQPuqhEEnv9mJGWexl2VtF37ePCbdL0P3xJOE=;
        b=svfL1I+2wl5x+Zd0hm/4EZBKG7V2DlVUwNT7cZQnc5V6QU3wHOjpXkvD4xrcDsHLXD
         VPErpHC2eIfpHdHmZHmZCEMNXiaAU18UZrBDHXe7Ca7c2C3P8Sk8HWwo6f6Y/yjkeuKh
         UIRKaWHVww8+4g3GtFK3rzodb6JLSKEETKII1uwkDr0YKtH6UMumdoVz+gS70vw1A3qZ
         9qIqD0izGNNPuuo19wePcqyELYeMdsPvV//GQVRaWfQeKXXTxyGhYjWJWBkhfrUeCR5o
         ZIiqyjHzGFrQfd/OxBakUQiMcTTU4LSEZTfsXGs6jCw7/bOFHsIn/CqbLwCqaERQe4d/
         ndqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P5SJ0prQPuqhEEnv9mJGWexl2VtF37ePCbdL0P3xJOE=;
        b=SO/gmYBkbTx/Pz7lqp/IKlc08dH3ByGkU0bXUb7MuIWGWV8eXPcGiik18x6CIgPARc
         EZkoNcqXTOPMjn3o9DQVvxnASyolX4ki8DWdv6rRHDarJj2h+N8pih5MN56rfWSkmenY
         RYHnunIrmtmQyzXcBuD4hBTdk2JushZ6gY66S+sVMVtvXgGqjcOwkj7D2/OED93j2vRO
         yXeoH9e3ytF3eq0L6DCIwPN1Loo8FqKv1YJt/FrvZrm0EcEo54GhNVXv8PRu7g/fM18s
         x6Z5qQ4U1YEnAsQ/GCrI4o0ZVerTnGZ5UWPgPGPIYHq6IwXWUyNn3W+YDn/Q3T5WN6Yk
         ar6g==
X-Gm-Message-State: AOAM5305cn6VxwLpw0suMUwTdW4oXW2xvxPtA7MjU/1h5wBTfo/mRRRM
        gKd/ojObr2Xkv3Fcuo35AQ3ZBw==
X-Google-Smtp-Source: ABdhPJwzLoBDBVY4RhMnB4U3+dXfC69/rPS8QXnoJ3JfADABhMn4tll9V0JPfkAVWGh2aSKS32iykg==
X-Received: by 2002:a05:6402:3553:b0:426:2b19:a4b0 with SMTP id f19-20020a056402355300b004262b19a4b0mr8401154edd.66.1651401331916;
        Sun, 01 May 2022 03:35:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zp1-20020a17090684e100b006f3ef214df1sm2464438ejb.87.2022.05.01.03.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 03:35:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/8] rpmsg: qcom: glink: replace strncpy() with strscpy_pad()
Date:   Sun,  1 May 2022 12:35:16 +0200
Message-Id: <20220501103520.111561-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The use of strncpy() is considered deprecated for NUL-terminated
strings[1]. Replace strncpy() with strscpy_pad(), to keep existing
pad-behavior of strncpy, similarly to commit 08de420a8014 ("rpmsg:
glink: Replace strncpy() with strscpy_pad()").  This fixes W=1 warning:

  In function ‘qcom_glink_rx_close’,
    inlined from ‘qcom_glink_work’ at ../drivers/rpmsg/qcom_glink_native.c:1638:4:
  drivers/rpmsg/qcom_glink_native.c:1549:17: warning: ‘strncpy’ specified bound 32 equals destination size [-Wstringop-truncation]
   1549 |                 strncpy(chinfo.name, channel->name, sizeof(chinfo.name));

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rpmsg/qcom_glink_native.c | 2 +-
 drivers/rpmsg/qcom_smd.c          | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 07586514991f..5bc5a0a6a8a7 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1546,7 +1546,7 @@ static void qcom_glink_rx_close(struct qcom_glink *glink, unsigned int rcid)
 	cancel_work_sync(&channel->intent_work);
 
 	if (channel->rpdev) {
-		strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
+		strscpy_pad(chinfo.name, channel->name, sizeof(chinfo.name));
 		chinfo.src = RPMSG_ADDR_ANY;
 		chinfo.dst = RPMSG_ADDR_ANY;
 
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 6ccfa12abd10..7c8c29f6c91d 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1089,7 +1089,7 @@ static int qcom_smd_create_device(struct qcom_smd_channel *channel)
 
 	/* Assign public information to the rpmsg_device */
 	rpdev = &qsdev->rpdev;
-	strncpy(rpdev->id.name, channel->name, RPMSG_NAME_SIZE);
+	strscpy_pad(rpdev->id.name, channel->name, RPMSG_NAME_SIZE);
 	rpdev->src = RPMSG_ADDR_ANY;
 	rpdev->dst = RPMSG_ADDR_ANY;
 
@@ -1323,7 +1323,7 @@ static void qcom_channel_state_worker(struct work_struct *work)
 
 		spin_unlock_irqrestore(&edge->channels_lock, flags);
 
-		strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
+		strscpy_pad(chinfo.name, channel->name, sizeof(chinfo.name));
 		chinfo.src = RPMSG_ADDR_ANY;
 		chinfo.dst = RPMSG_ADDR_ANY;
 		rpmsg_unregister_device(&edge->dev, &chinfo);
-- 
2.32.0

