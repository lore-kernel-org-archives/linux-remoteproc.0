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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F35C4742C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 08:41:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE4F520684
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 08:41:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QOBEhTLv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgKPI0O (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 03:26:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKPI0O (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 03:26:14 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BABC0613CF
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:26:13 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id c137so3249781ybf.21
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=iRKdGUeQKewf5nuXxBX2agP7HYNBW301CirwCFhx4pU=;
        b=QOBEhTLv6QVv/QjZqTP+H+yyG/6mzw35iNQXRNy1YtY/1cays5xvfiDfdKHvbTTDS+
         2YSyEvQ1HADSKiodkgTxOjX1QQDG/L/gJ5iA9Hz6adaEPpASQUu9DvqifQpNAgE0nU5T
         PFlgzbIQ6XbOXWAe2kerZkJUBEkmpnLyQ/IFB7WXMy76lv+rK/fasC7cEZd6DmdebDpv
         S9uV5tIvfjS1zglfg1qhhPaqBfBcIyqFWgO309RdbxgEAR6aj4e4GoSvWVjA7JrnV0Un
         l8bNzLcVj+e56k+Eq1KzcueJlH62U0gTkqNjKyzsuqyyr4g2L8Ist6sX40HSJZh9IgFE
         7Tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=iRKdGUeQKewf5nuXxBX2agP7HYNBW301CirwCFhx4pU=;
        b=qzC7xVglstcPuRJL5GU+/WIc+T68jLk/ROAYNyCEnWQAHqjnNM9p1ZNvE6Xbi0nVn7
         JUJY4KDUCh3sTld0Qg58cnczFobwwV27zsvwUcMNzgAjbfaKMELbK5RfJlEQEaHHyfg/
         F7vEyKRBzPdcciA1/4vWECtZhBdS4lLE3BqYNUk859pnGc0QHIr5NsEwdDHBEZnWvc2Y
         90RfX5u7rbsXrWTwp6OpOfAGSoVV+EVmMhxWT/eTjDRgDZ8VfcNgHeEvTSIXOPzHewSm
         v7XIsMi0NFDdMjKqRKoJMboY9e+3P5zMC+gXO80eCsX/ALYcnirCJs4BsCguBy0lvEYZ
         Ue2g==
X-Gm-Message-State: AOAM531Nc8G2rtAD6dedzgWrdNYxxwFhgrr310/0CCHTA4v8CYDGL9p5
        VOMtzBQivtTyhlSfzjNsBHas9ZPQFa/c
X-Google-Smtp-Source: ABdhPJw0N0XKpM+KTbbElpvFZIMiwftJ2h8EAOI91tZQq6qWMiAPMPFuFLr/2HlvN0EDQXvVSWUOTPNvIvX4
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:da0f:: with SMTP id
 n15mr13910518ybf.481.1605515172335; Mon, 16 Nov 2020 00:26:12 -0800 (PST)
Date:   Mon, 16 Nov 2020 16:25:37 +0800
In-Reply-To: <20201116082537.3287009-1-tzungbi@google.com>
Message-Id: <20201116082537.3287009-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20201116082537.3287009-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 2/2] remoteproc/mediatek: fix sparse errors on dma_alloc
 and dma_free
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

Fixes the following sparse errors on dma_alloc_coherent() and
dma_free_coherent().

On drivers/remoteproc/mtk_scp.c:559:23:
warning: incorrect type in assignment (different address spaces)
   expected void [noderef] __iomem *cpu_addr
   got void *

On drivers/remoteproc/mtk_scp.c:572:56:
warning: incorrect type in argument 3 (different address spaces)
   expected void *cpu_addr
   got void [noderef] __iomem *cpu_addr

The cpu_addr is not a __iomem address.  Removes the marker.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_common.h | 2 +-
 drivers/remoteproc/mtk_scp.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 47b4561443a9..b3397d327786 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -99,7 +99,7 @@ struct mtk_scp {
 	bool ipi_id_ack[SCP_IPI_MAX];
 	wait_queue_head_t ack_wq;
 
-	void __iomem *cpu_addr;
+	void *cpu_addr;
 	dma_addr_t dma_addr;
 	size_t dram_size;
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 8ed89ea1eb78..a1e23b5f19b9 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -413,7 +413,7 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
 	} else if (scp->dram_size) {
 		offset = da - scp->dma_addr;
 		if (offset >= 0 && (offset + len) < scp->dram_size)
-			return (void __force *)scp->cpu_addr + offset;
+			return scp->cpu_addr + offset;
 	}
 
 	return NULL;
-- 
2.29.2.299.gdc1121823c-goog

