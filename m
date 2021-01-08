Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C340C433E6
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Jan 2021 08:18:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30984235FF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Jan 2021 08:18:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbhAHISi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Jan 2021 03:18:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbhAHISh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Jan 2021 03:18:37 -0500
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0552C0612F6
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Jan 2021 00:17:57 -0800 (PST)
Received: by mail-pg1-x549.google.com with SMTP id e2so7001628pgg.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Jan 2021 00:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=MTRtl2UAGlXiRiGOyc8AHNRImXjzXH68pAaaOwyulHE=;
        b=V6EL31lTkHVGs10R8sodrz5276YWozWSBOItTi9gN8gncQV8Tjwe6RSj+PgZcVAoGV
         2U4TObb11sP/ILFF6IJYsHlKQHVF9DLwTvs992qHpCfPSMJlEOK0IFYVcCzdtidpHgtB
         pdC8DD4JR8/zqKrxfbQzsQS7svGn58Q41yz+4uJvKy00+iZmxFqtTm91OjE5PnYNC1ww
         +5fy/LHvystcDU6LK+0YhIXnj+p/aViMZY+LnxkjoZ9Je32qgLDuEUmsdtX9e6BT6IyO
         VGTl2hv/ITPcj+ME8pOhoY4kLJQIDiDqzzrjFOYxAjHfvcvpq1YRRIBRJWlZOlBOEw66
         jIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=MTRtl2UAGlXiRiGOyc8AHNRImXjzXH68pAaaOwyulHE=;
        b=h3EQWwl7BSY/N2A4H0npvx0KCTfGSOqeeLoNaqV3v/lGXZVVuQLX/dtDXnkS+y5M4H
         yzxUPo1fummOb4Gkjfv4L1zLgJcgv5tZqXI2OZgbmgPTPVrcQnb4IMECV5qxEcc8PfuH
         vHH6KkIo6chCAfepT9j2ah2AFpbcRqOhDWQNSlQo41IpWprsR3QSwAZ8FS9teOEo4HLL
         bUh4aG4xzIdIeVpmo3gkPOoILan6b9HhbV6kFm5BpK17hATEHgTCoqcPha3NbGo1AjHn
         Z/delRbjDVEoVFUXHMcUGmGxU8N5y0ju6Hjv423LEOywS6Jq6KS8Hs0EtdImHXloNc2B
         +p7A==
X-Gm-Message-State: AOAM532YmS3kRbg0Ne6WgR63j9LyBaUz0xgaZ+g2v5p7ywAuLUNn7AyT
        s/1tPvT/RJWkMDgqEqKuCk8et6HHiX+/
X-Google-Smtp-Source: ABdhPJxmyHvyUBXGANKNPo0GB8zfz2o/IJkoe30Xr6ThffKBgLQZuYb5UHeFQfE76Cz/didQG1YaHoJjCMFy
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:90a:1706:: with SMTP id
 z6mr1765727pjd.0.1610093876865; Fri, 08 Jan 2021 00:17:56 -0800 (PST)
Date:   Fri,  8 Jan 2021 16:17:35 +0800
In-Reply-To: <20210108081738.2175224-1-tzungbi@google.com>
Message-Id: <20210108081738.2175224-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20210108081738.2175224-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v2 1/4] remoteproc/mediatek: use devm_platform_ioremap_resource_byname
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, mathieu.poirier@linaro.org,
        devicetree@vger.kernel.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Replaces platform_get_resource_byname() and devm_ioremap_resource()
pairs to devm_platform_ioremap_resource_byname().

Note that, not every pairs are applicable to replace.  Especially when
it needs to access the resource struct from
platform_get_resource_byname().
For example:
scp->sram_size = resource_size(res);

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e0c235690361..1f0ed2974d5c 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -719,8 +719,7 @@ static int scp_probe(struct platform_device *pdev)
 	for (i = 0; i < SCP_IPI_MAX; i++)
 		mutex_init(&scp->ipi_desc[i].lock);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
-	scp->reg_base = devm_ioremap_resource(dev, res);
+	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
 	if (IS_ERR((__force void *)scp->reg_base)) {
 		dev_err(dev, "Failed to parse and map cfg memory\n");
 		ret = PTR_ERR((__force void *)scp->reg_base);
-- 
2.29.2.729.g45daf8777d-goog

