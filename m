Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925B4C3E8C5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 27 Nov 2020 21:52:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CD6A21534
	for <linux-remoteproc@archiver.kernel.org>; Fri, 27 Nov 2020 21:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2Q+nJPu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728726AbgK0VwN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 27 Nov 2020 16:52:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730732AbgK0Vus (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Nov 2020 16:50:48 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CE5C0613D4;
        Fri, 27 Nov 2020 13:50:48 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id f17so5265975pge.6;
        Fri, 27 Nov 2020 13:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Z2ig0YQSnUunmi3IX5y1I8JdsSlOi9idmsNtTiBo7ok=;
        b=l2Q+nJPuH8NmB2PzY1VrPimThUwNcXTaaau4xpvXD74XejsIqKORZEnL4B38xx49mD
         K8JEtwZykO/tjwfkL+2ChwaP699bdQW5TjaCwQd9gsXG++TC9jnQ84m+t+bMHFQ5rywT
         5kr5Bib8Zk0mcP96Ql/0clgy8QGTIiKL6cO1e+SpyLFtpzaBo6QaQ1V0OJD7sc2ipEKT
         u8eUiHBU6fMb+XCaYjuVMVsqxHd/FD7bX5s/OcPP9XEbwKE/zcEIoYxmU9F0I98CHxCD
         YSQodiw2rBrb4u/K08nXay/H3aioN5jjURZ4gJmi1KtslmDucGBwdN4A3Tg+ipkqu1Jw
         d3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Z2ig0YQSnUunmi3IX5y1I8JdsSlOi9idmsNtTiBo7ok=;
        b=NAF8lVgAWGbMhGvBFOyCLNwLbatKdB5IqKS+kgTX9N2pRvIRNVKL0I5uN0aOzh2Huv
         W9qh9MKufxEe9fxnMGcRedVSaaQS6H6cMf0pVYSFdLmfxrCkrcwXN1plmVgxX0y4xfcl
         AFbXm3PesKAB9y1Z9C/weBZ6wxXesGm3q3mPLItr5EcviQFMzd6Tbb0J9nGd6/E4fKWo
         QqXN8g/9/c4QaP5yt3ilG1u8EL9BpVxigZ+9FMdxZqzAXIPDSdll35/gPwVj2YSfy6mp
         Nf4S1XqP+VTSgNobrbNCbyo5f39MitnpqjHRy/vx5WukRHEL2mWw8uHZRL+9iUV/2L0s
         91ag==
X-Gm-Message-State: AOAM530skfLNy6pkgZd1trLMrptUlKh3/4Vux121QVgbV9+bRIUfMh6m
        Sp+Yv4gxfm16nhLDJSKb740=
X-Google-Smtp-Source: ABdhPJyMU67Zli7Ek+SiL7ugkA0JFhHVA+oYndLCD2wsRVJhJtVJufk0Oif0dm6UmkXVakJsIe1CiA==
X-Received: by 2002:aa7:91d2:0:b029:19a:8ccd:8b0 with SMTP id z18-20020aa791d20000b029019a8ccd08b0mr8730745pfa.40.1606513847674;
        Fri, 27 Nov 2020 13:50:47 -0800 (PST)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.167.220.174])
        by smtp.gmail.com with ESMTPSA id e141sm8545912pfh.13.2020.11.27.13.50.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Nov 2020 13:50:47 -0800 (PST)
From:   Souptick Joarder <jrdr.linux@gmail.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, matthias.bgg@gmail.com
Cc:     linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH] remoteproc/mediatek: Fix kernel test robot warning
Date:   Sat, 28 Nov 2020 03:20:55 +0530
Message-Id: <1606513855-21130-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Kernel test robot throws below warning ->

>> drivers/remoteproc/mtk_scp.c:755:37: warning: unused variable
>> 'mt8183_of_data' [-Wunused-const-variable]
   static const struct mtk_scp_of_data mt8183_of_data = {
                                       ^
>> drivers/remoteproc/mtk_scp.c:765:37: warning: unused variable
>> 'mt8192_of_data' [-Wunused-const-variable]
   static const struct mtk_scp_of_data mt8192_of_data = {
                                       ^
As suggested by Bjorn, there's no harm in just dropping the
of_match_ptr() wrapping of mtk_scp_of_match in the definition of
mtk_scp_driver and we avoid this whole problem.

Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/remoteproc/mtk_scp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 7e0f1e1..5f42b9c 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -772,21 +772,19 @@ static int scp_remove(struct platform_device *pdev)
 	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
 };
 
-#if defined(CONFIG_OF)
 static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
 	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
-#endif
 
 static struct platform_driver mtk_scp_driver = {
 	.probe = scp_probe,
 	.remove = scp_remove,
 	.driver = {
 		.name = "mtk-scp",
-		.of_match_table = of_match_ptr(mtk_scp_of_match),
+		.of_match_table = mtk_scp_of_match,
 	},
 };
 
-- 
1.9.1

