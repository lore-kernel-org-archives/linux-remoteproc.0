Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2D4C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Jan 2021 23:56:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AF3A2071A
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Jan 2021 23:56:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbhAEX4N (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Jan 2021 18:56:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbhAEX4N (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jan 2021 18:56:13 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3980AC061793
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Jan 2021 15:55:33 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id o6so1033583iob.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Jan 2021 15:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P9cxczu5SWz8K1Y8wh3jbN1kCg9PCTdSsNoKF/csdlw=;
        b=qmNvR6Y/mZMkV6xILKuddIBlO+MgpZ1uOjExFkQI7O3ZtG3D4htKuT+nhTw2Woju73
         BBYSDSi1wgJNMcEDvZqYZlQjcfGA7YEPkNaoEUMHd7p4c/6F3XY4/+ED9arPqqvbVt92
         A75zfWz4A3zw6/dB1NE09vYCvq+/WH1AWWmvASlOKfCeLGn5ROr6V9wLcKsGR7xJKyrY
         BmDpRISIOchC7Ldtj6+DKjH6twXii0PxPzTJiLYF21W5ifrt3dCHR5YC3I2X0V/5d/1M
         7f16lvU2pmb8vsnQlafiaMXfmlSWiXqc3K3LIMvzWwhSSTbbulHzapjjIMtOg/kEcxzB
         xv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P9cxczu5SWz8K1Y8wh3jbN1kCg9PCTdSsNoKF/csdlw=;
        b=k+OzuaMqEnrMXneDhHl6kzWqfpdolxpsbZoeUztnw1tp5xuPw51m0a4/ifWM4B4u3m
         IfIhlgcTUtG0vFw1WcIbn8b8xwNPt068h2+KAptrOQTaEA9NvOnwupalaes+LAOsJfhX
         thJu032f8ZVtvtujTg9VLJbzcb+vuQt+E2oUushMUO/jSmGISpAA4UsgT7eV4savpCu7
         l17+J7lWg2ePLHY++tF3obmhpsUO10u4oMDinpZw+F/xVLJ9vb9qxbKcTq86AGjkA/ZN
         w6psPt5JcmruTKvv44cF/ENlVeuId6xRmfFEg1VlEpcSt6/VI59l0Uk14FS78v6MuGDM
         0p3g==
X-Gm-Message-State: AOAM5325Sjxy4MUt6+ejXm1G2BhSYrlY13y0kfpwuwTdDYidxSnjSAmT
        kcSod5eZPfu/Xm272pzQnEHi+w==
X-Google-Smtp-Source: ABdhPJzW0+1wnI9+dPf7LC4hQ8rzEpvmwauqfoEQSeWVbbF2/K0RUMfJbui7qv5jnsQNWqNZ6ZlyTw==
X-Received: by 2002:a5d:959a:: with SMTP id a26mr1194505ioo.94.1609890932533;
        Tue, 05 Jan 2021 15:55:32 -0800 (PST)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id a18sm543488ilt.52.2021.01.05.15.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 15:55:31 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, ohad@wizery.com
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rpmsg: glink: add a header file
Date:   Tue,  5 Jan 2021 17:55:28 -0600
Message-Id: <20210105235528.32538-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

With an x86_64 architecture W=1 build, qcom_glink_ssr_notify() is
reported as having no previous prototype.  The prototype is found in
"qcom_glink.h", so we just need "qcom_glink_ssr.c" to include that
file.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/rpmsg/qcom_glink_ssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/qcom_glink_ssr.c b/drivers/rpmsg/qcom_glink_ssr.c
index dcd1ce6169747..4da6c7d985568 100644
--- a/drivers/rpmsg/qcom_glink_ssr.c
+++ b/drivers/rpmsg/qcom_glink_ssr.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/rpmsg.h>
+#include <linux/rpmsg/qcom_glink.h>
 #include <linux/remoteproc/qcom_rproc.h>
 
 /**
-- 
2.20.1

