Return-Path: <SRS0=KI6G=7A=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 090D9C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 May 2020 21:08:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E24F7207C4
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 May 2020 21:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgERVIf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 May 2020 17:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgERVIf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 May 2020 17:08:35 -0400
Received: from omr1.cc.vt.edu (omr1.cc.ipv6.vt.edu [IPv6:2607:b400:92:8300:0:c6:2117:b0e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBE3C05BD0A
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 May 2020 14:08:35 -0700 (PDT)
Received: from mr6.cc.vt.edu (mr6.cc.ipv6.vt.edu [IPv6:2607:b400:92:8500:0:af:2d00:4488])
        by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id 04IL8YXu008046
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 May 2020 17:08:34 -0400
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
        by mr6.cc.vt.edu (8.14.7/8.14.7) with ESMTP id 04IL8T3E014804
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 May 2020 17:08:34 -0400
Received: by mail-qt1-f198.google.com with SMTP id 19so3702260qtp.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 May 2020 14:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:mime-version:date
         :message-id;
        bh=kM/2TLwbOWyz4JRQ8aP48mBwa+htNbB3MxdeeuZE8tM=;
        b=JWNoxBQn8t0QXJ9RsSb9pgLaeXxhf7QaSavVH4OfqtyDG5gqrFSQJkppEB9bNPBRUW
         L2dcDneUD6D/y0XZuyI2yCksPn2pVG0433xe7XRxl5ZsYQIEsEZRpLh9MGHC+Gu75eD2
         CeyWfAlb6s3TT8HsVlrar9jG1TmV7PZGRkbpauJlTvAPxHFkDKQbR6kNOyg49ajrO7Iq
         AqEot1fdbjdHFTt2RY0w4XYGhSAYHkeESKz61/ffrZVQW1ceblT9/6fZ/7IIDP8IFoAY
         rMh2OBJJK9iz1vNLL8wVBP03VcFNRifOoc6wxdWBCXpP5JvjEGvWI2B/NC9VPPlKCde/
         atDg==
X-Gm-Message-State: AOAM5302oBsqq2N5RkWbk1LVsysVZybriHNbYYBYPtWX9tUMNXkbHN/4
        qBpm0h30umixpLzV4PRFKssntX+johjXcmcCrL/+rLPaTZoIAVH7MCub6d2hQ8lIOvB9BOYBXmD
        WSzQUAK1b9m3NV4dGevKpvg0LrDs8Jc9UvDTHGViu
X-Received: by 2002:a05:620a:1e:: with SMTP id j30mr18210091qki.470.1589836108920;
        Mon, 18 May 2020 14:08:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXD+xC5+XKAl2RVDYaqJrxN/4ysReFfKpWWyp/+kjyPqs4ASEt78jxmru36a7x0DnMQdTyWg==
X-Received: by 2002:a05:620a:1e:: with SMTP id j30mr18210074qki.470.1589836108615;
        Mon, 18 May 2020 14:08:28 -0700 (PDT)
Received: from turing-police ([2601:5c0:c001:c9e1::359])
        by smtp.gmail.com with ESMTPSA id o3sm10085708qtt.56.2020.05.18.14.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 14:08:27 -0700 (PDT)
From:   "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: wcss: Fix function call for new API
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date:   Mon, 18 May 2020 17:08:26 -0400
Message-ID: <77652.1589836106@turing-police>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

commit 8a226e2c71: remoteproc: wcss: add support for rpmsg communication

throws a compile error:

   CC [M]  drivers/remoteproc/qcom_q6v5_wcss.o
drivers/remoteproc/qcom_q6v5_wcss.c: In function 'q6v5_wcss_probe':
drivers/remoteproc/qcom_q6v5_wcss.c:563:2: error: too few arguments to function 'qcom_add_glink_subdev'
  qcom_add_glink_subdev(rproc, &wcss->glink_subdev);
  ^~~~~~~~~~~~~~~~~~~~~
In file included from drivers/remoteproc/qcom_q6v5_wcss.c:16:
drivers/remoteproc/qcom_common.h:35:6: note: declared here
 void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
      ^~~~~~~~~~~~~~~~~~~~~

Update to API change from commit  cd9fc8f:  remoteproc: qcom: Pass ssr_name to glink subdevice

Signed-off-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 48d16d81f94d..99ecc0e6276e 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -560,7 +560,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	qcom_add_glink_subdev(rproc, &wcss->glink_subdev);
+	qcom_add_glink_subdev(rproc, &wcss->glink_subdev,"q6wcss");
 	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, "q6wcss");
 
 	ret = rproc_add(rproc);

