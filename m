Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A45C433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:35:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 713C02074F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbhA0Ifi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Jan 2021 03:35:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbhA0IdM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jan 2021 03:33:12 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D64C0613ED
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jan 2021 00:32:29 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id t18so1621430ybb.22
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jan 2021 00:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=+a0m3LuKmOdctmWgOFSSQsFlabVB3Kaf/W6pr4iH3tg=;
        b=awsbucR+8poF69HXjAAN3EvY1WueYbQJgcbdWYLBHw5zJmrUYVPK2tfp5SucTtrahc
         Cwz9dSeBoa+/nQBuQ7r2Ehxi3f9HFsU7eeGrKIIMjIXHg+48KUfQsOQw1eDn2+bVWJbF
         z05CejH8BXUin/1Rq/zyCIdFlNu2Fu7O18Q4Ggw3fsGc936oUlMCUW04HFQqfexVWNez
         KOXE1VI9b9GBLMgl64S0AnRKhFb8bfN4DmoQdgNfTX84ltRkVoVOnF8xRr49qqohahU/
         e2Ro5EtxmegUdrjz00giu/FNnGh3uYlLJQlp+Wgir+Jbv4pCuO4bdn5EHak/ZIDwTHB5
         dkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+a0m3LuKmOdctmWgOFSSQsFlabVB3Kaf/W6pr4iH3tg=;
        b=scbhYpctZsOb7BZNL6a6TwxhGydby6HjGxsj3xSg9lX+rTq1Jfo3K2qoOyAUSYT8Vz
         RD/RMPNnN4yfbVFcFI1SjL+qRBoTJ9KFLuTxyTa6DbOIEwu4iy2/81yhV9kuAEeBWfir
         SfVR68od+DBdlKHAMr6r4x2buqlIGi6Ssi/5TWb8gbwdcwNEbJtuPyt+eOVO2mP2kQfI
         JFJazglX3oL8OHyizEU4Qoeoh8zI1cdxuas6UmHGdEVslhmC1+DKf7mTC36T20QM1/b7
         bWvrK5ai1B41qgsUTd6ggtD6L8qysDEgjwjGVebfqGnB0cw0WRyZ8WdGN8l5pKUvHz5/
         OTpQ==
X-Gm-Message-State: AOAM531PgxdJXal+WScwRqTgO45R2xTw4KGWDO1EhJjTRCGOOYRPRiVg
        gVr2eI4VIAcAxGg/noh+UB3eDaEfzlKH
X-Google-Smtp-Source: ABdhPJya2SzL3qr8wMjzd6kk7QFftN0tLzBSfhW5Tsa1Ft4O70vVR3PxMz0LDDgj3J5gTNnGfIVoeWnhokM1
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:d17d:c7bb:69a2:7e2f])
 (user=tzungbi job=sendgmr) by 2002:a25:ce08:: with SMTP id
 x8mr14658300ybe.164.1611736348965; Wed, 27 Jan 2021 00:32:28 -0800 (PST)
Date:   Wed, 27 Jan 2021 16:31:33 +0800
In-Reply-To: <20210127083136.3745652-1-tzungbi@google.com>
Message-Id: <20210127083136.3745652-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20210127083136.3745652-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v3 1/4] remoteproc/mediatek: use devm_platform_ioremap_resource_byname
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

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index eba825b46696..d83e1164f02f 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -721,8 +721,7 @@ static int scp_probe(struct platform_device *pdev)
 	for (i = 0; i < SCP_IPI_MAX; i++)
 		mutex_init(&scp->ipi_desc[i].lock);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
-	scp->reg_base = devm_ioremap_resource(dev, res);
+	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
 	if (IS_ERR((__force void *)scp->reg_base)) {
 		dev_err(dev, "Failed to parse and map cfg memory\n");
 		ret = PTR_ERR((__force void *)scp->reg_base);
-- 
2.30.0.280.ga3ce27912f-goog

