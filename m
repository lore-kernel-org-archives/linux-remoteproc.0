Return-Path: <SRS0=C6No=CL=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CE2C433E2
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Sep 2020 11:07:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E209F2078E
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Sep 2020 11:07:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FA9jJNgx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgIBLHx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Sep 2020 07:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgIBLHv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Sep 2020 07:07:51 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 102A9C061244
        for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2020 04:07:51 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q1so2179904pjd.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2020 04:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lRbPBiajhyZAHFvs+KY/rfMq5G+YigmViKEtUETUpvU=;
        b=FA9jJNgxjJvc9qlnqShwrPZn3AEONW5P4dh7YWPvhcMQXHUhYKjBtiz3kMOeuGCATx
         Fy2XOfBQo6n6bix1+nBZec3g6ou+954h1o+5cfOJzwZUNJHfWktY+cMSeDA8TgrPe3YS
         rHMF0UnGCJcoP9bav+/CLE+5Ymz2ejyJTM0JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lRbPBiajhyZAHFvs+KY/rfMq5G+YigmViKEtUETUpvU=;
        b=BIkgz681Q3EFFpGkqg3PC8r3FVES77nfValizz1A5qv/zCeFPKB3MtjtIyZNxY/pCU
         Y84gVBJNogKDDUGVhP+i93P8vR70/DCC2zR4KeKiqiuovpILkrBoqfaOqxrg0GNqBORd
         o7lW26XlHYLaqSkLKg3r/b8cDDe1B/Y+J339y499IvuYUJ9vJnaMoXajUZdQJ47dTNfk
         uEp/RlEYiJaAiDmx++Hc9EQ7yOs81Pzw5sGunWNiPxHJwrTFBTM0fQxYRX+Enjsiwh1a
         lzAh1bXuzrpyOcin8YtNEQNzmJBqeX59GDprz7fS1k6xvAiKgVKOawTywmKKzK6r4dtb
         pZ+A==
X-Gm-Message-State: AOAM5319khQK7snD/AVhrxueNcrud0WP/T5xsAl0DUVALVNQHlj6CWGz
        DARLWcajxSbN27CJ8gcW/zgpcg==
X-Google-Smtp-Source: ABdhPJz6nufpjZkKMfLCKDxGwZCBogTUned6t9PlQr+Oz/xkKLuHnC2Bj9IhrBEVpB0uYV1lm1f3LQ==
X-Received: by 2002:a17:902:fe91:b029:d0:5d99:c1a2 with SMTP id x17-20020a170902fe91b02900d05d99c1a2mr6013188plm.0.1599044870566;
        Wed, 02 Sep 2020 04:07:50 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:7220:84ff:fe09:41dc])
        by smtp.gmail.com with ESMTPSA id l13sm5523144pgq.33.2020.09.02.04.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 04:07:49 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2] rpmsg: Avoid double-free in mtk_rpmsg_register_device
Date:   Wed,  2 Sep 2020 19:07:15 +0800
Message-Id: <20200902190709.v2.1.I56cf27cd59f4013bd074dc622c8b8248b034a4cc@changeid>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

If rpmsg_register_device fails, it will call
mtk_rpmsg_release_device which already frees mdev.

Fixes: 7017996951fde84 ("rpmsg: add rpmsg support for mt8183 SCP.")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

Changes in v2:
 - Drop useless if and ret variable (Markus Elfring)

 drivers/rpmsg/mtk_rpmsg.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 83f2b8804ee989d..96a17ec2914011d 100644
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

