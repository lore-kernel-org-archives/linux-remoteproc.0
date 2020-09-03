Return-Path: <SRS0=MlSR=CM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1242C433E7
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Sep 2020 00:06:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 854B720773
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Sep 2020 00:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W+DOsAlA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgICAGQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Sep 2020 20:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbgICAGP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Sep 2020 20:06:15 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCADBC061244
        for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2020 17:06:15 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k15so581262pji.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2020 17:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z04vsoOUn7JwZd/p6IxCr5Uu7ufkQph2sZ/+/wCM6Mk=;
        b=W+DOsAlATrKpzZEseA1m7WhWDyUKst3T4q0mLaydrOeoREGz2Ox1/Mri6QwMsxSXBs
         bcBBGjMJOVLmsIrZB2EGrL1jFeMJ4viiasi1GsuGzLm8jkP9RCcNAiJ+hL4LgWS9M8n+
         1kvwnTLA1NUrvLZv81NBSsHsU70A6yjZaSqpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z04vsoOUn7JwZd/p6IxCr5Uu7ufkQph2sZ/+/wCM6Mk=;
        b=rlZkkc8SxYVca/6pwAbG/J/9my24OCElsa0nW9Wdk1PCCj2ttXhT9tDHaqRQ0kvzcF
         NjecfAS9A3bimfPBnxf203LPwma5MCJ0HbViYjpSMHU3sesSR88e3sfPVDlJv1gmPbJh
         OtdXcV45EyDZFnk3hgt8GDYiv+HxVYgpeZATOobDIxkfR0GH1COBIvi0eIbodNq61pQk
         CCXpPe4OlAIzdJpcQNJNrojAZ+LFhDfRmad6gQbcDM7vnXZ2mFI6/G5jKkQ1s6D1PW/h
         kPEAvGfe6p104QUWZAltf8gp0YtBQG4P+ZyaG5iV9uGjwpMP0XPuO6zwEoCgFJKKfXqj
         AmHg==
X-Gm-Message-State: AOAM5317dvgLuOAejPBzqmeI0vBIhbxvtuiIZGq4nnf1XgqOwELZYMrC
        yMRPWjt30lM64N9SYGAWya5Lmg==
X-Google-Smtp-Source: ABdhPJyDYOH+kR2LzNuzKkhYgxKK4anL0GLAhY3wBw4PKVEzGUP9xXeD0JDhuJkTGMRs9dOYGjD3Rg==
X-Received: by 2002:a17:90b:2388:: with SMTP id mr8mr220861pjb.161.1599091575254;
        Wed, 02 Sep 2020 17:06:15 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:7220:84ff:fe09:41dc])
        by smtp.gmail.com with ESMTPSA id gt13sm478342pjb.43.2020.09.02.17.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:06:14 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v3] rpmsg: Avoid double-free in mtk_rpmsg_register_device
Date:   Thu,  3 Sep 2020 08:05:58 +0800
Message-Id: <20200903080547.v3.1.I56cf27cd59f4013bd074dc622c8b8248b034a4cc@changeid>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

If rpmsg_register_device fails, it will call
mtk_rpmsg_release_device which already frees mdev.

Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---

Changes in v3:
 - 12-char Fixes tag (Mathieu Poirier)

Changes in v2:
 - Drop useless if and ret variable (Markus Elfring)

 drivers/rpmsg/mtk_rpmsg.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 83f2b8804ee9..96a17ec29140 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -200,7 +200,6 @@ static int mtk_rpmsg_register_device(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
 	struct rpmsg_device *rpdev;
 	struct mtk_rpmsg_device *mdev;
 	struct platform_device *pdev = mtk_subdev->pdev;
-	int ret;
 
 	mdev = kzalloc(sizeof(*mdev), GFP_KERNEL);
 	if (!mdev)
@@ -219,13 +218,7 @@ static int mtk_rpmsg_register_device(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
 	rpdev->dev.parent = &pdev->dev;
 	rpdev->dev.release = mtk_rpmsg_release_device;
 
-	ret = rpmsg_register_device(rpdev);
-	if (ret) {
-		kfree(mdev);
-		return ret;
-	}
-
-	return 0;
+	return rpmsg_register_device(rpdev);
 }
 
 static void mtk_register_device_work_function(struct work_struct *register_work)
-- 
2.28.0.402.g5ffc5be6b7-goog

