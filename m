Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CE8C4742C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 08:41:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DB8B208C7
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 08:41:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JsL/W1lT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgKPI0K (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 03:26:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgKPI0J (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 03:26:09 -0500
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70EE0C0613CF
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:26:09 -0800 (PST)
Received: by mail-qv1-xf49.google.com with SMTP id u19so10275039qvx.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=FGK3po+1mabmofbsrOAmqgZTB285sISrAEMhHIPEXVY=;
        b=JsL/W1lTuj6I5ZApSjpS7ca/5BQyo4GmrFUADec+nmp2dPG5WZqt3B+a7DbQaVymYU
         x6f2oycz6c8JtN9wbjU7JRHN5+lvqWJAIiT97Q5+7aQVf/Io/EUh2rKdP/QJ9N8XWQaS
         9gaGS9xBbiCluwBzhShkSc2E5FHOUW+cSc+46uw7R4MS5y94nQImZ2Ihb7HlwdcfFjgY
         L+SsuYC5oaTo4rUy5ZOGTDLTXH0rLMswsJHlMJrrSUkuvqVhGc+2xz75zROYAw52tcuA
         pz5sB6lq3VnDeAxlylx+pHesOCHROgprfGpQ9q7kY023QojLs4IjQ6879cCAY8Vn3Z3x
         C0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FGK3po+1mabmofbsrOAmqgZTB285sISrAEMhHIPEXVY=;
        b=E1m/QWkH1OTZXbBKQkSn6lezIP4jQbynyzlbgS5hQppy3DPSWtpVTRZSdmcC/weUHt
         Tw5VZqrfkmSooywOJTFs8oNTLKi59BFl8Il95q3enCh+uAQ4ncEN4z0Ql5/5xmGEy3BD
         ZDMJJF1AENQN/DsAGw+iNcXA3EMHcWGjAMhksq3KA9mCkfS101EogncZVUv6ENMEjw0P
         aAzM3AEV8lMgufkp4JSpLpOrxydxjPT6qr0syXAzJZUjT3E/MVYfWlUm27y3YsZGIqC3
         qrBYEDzwGhDT8zcqA5YYRFkQBCSFR4ASmqJZI7uy5Hl6nL11aGvoYg4sszKKZov3R3Ph
         +jug==
X-Gm-Message-State: AOAM533lUAjB/l/sEI8kMYASCcwYhx+PiFnRa8KsZqQ5yxMo/3iXvT32
        8nN5NAlhB2pq3jA5EHPTAgSHO4J1nClS
X-Google-Smtp-Source: ABdhPJzDrTnHczzHtkZNBK/N7SQ6we1yTn8KBhiJm4PEqnZsFVM7m+93BhG3MptVNJqxfLnG0DfgmB+BOgq7
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:ad4:54cd:: with SMTP id
 j13mr13656224qvx.8.1605515168633; Mon, 16 Nov 2020 00:26:08 -0800 (PST)
Date:   Mon, 16 Nov 2020 16:25:36 +0800
In-Reply-To: <20201116082537.3287009-1-tzungbi@google.com>
Message-Id: <20201116082537.3287009-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20201116082537.3287009-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 1/2] remoteproc/mediatek: fix sparse errors on sram power
 on and off
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, groeck@chromium.org,
        drinkcat@chromium.org, pihsun@chromium.org, tzungbi@google.com,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Fixes the following sparse errors on sram power on and off:

On drivers/remoteproc/mtk_scp.c:306:17:
warning: incorrect type in argument 2 (different address spaces)
   expected void volatile [noderef] __iomem *addr
   got void *addr

On drivers/remoteproc/mtk_scp.c:307:9:
warning: incorrect type in argument 2 (different address spaces)
   expected void volatile [noderef] __iomem *addr
   got void *addr

On drivers/remoteproc/mtk_scp.c:314:9:
warning: incorrect type in argument 2 (different address spaces)
   expected void volatile [noderef] __iomem *addr
   got void *addr

On drivers/remoteproc/mtk_scp.c:316:17:
warning: incorrect type in argument 2 (different address spaces)
   expected void volatile [noderef] __iomem *addr
   got void *addr

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 577cbd5d421e..8ed89ea1eb78 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -298,7 +298,7 @@ static int mt8183_scp_before_load(struct mtk_scp *scp)
 	return 0;
 }
 
-static void mt8192_power_on_sram(void *addr)
+static void mt8192_power_on_sram(void __iomem *addr)
 {
 	int i;
 
@@ -307,7 +307,7 @@ static void mt8192_power_on_sram(void *addr)
 	writel(0, addr);
 }
 
-static void mt8192_power_off_sram(void *addr)
+static void mt8192_power_off_sram(void __iomem *addr)
 {
 	int i;
 
-- 
2.29.2.299.gdc1121823c-goog

