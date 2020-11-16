Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61796C4742C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 09:11:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BD9522240
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 09:11:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GXgOGre7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgKPIoh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 03:44:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbgKPIog (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 03:44:36 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DEFC0613CF
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:44:36 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id c2so9725876qtx.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=U1SYL24RcTv9N7iT3p8Gk3jg0reoXyBjPpMVxH+Yb2c=;
        b=GXgOGre7Vz7fMb34bNE5Fnr0Fuz4xu004X0MvPHy3/ZVL+bYlIvBjrV+j3YFiM1CTK
         mJkoYwcw3HaG/wFWu+8a8eNgFdyZ+lugSDUKxpy2+KE2NszFF0T4QCsaW2mRSU0o1cr0
         L4JjnBcgjutYdsDlHwx8ar2SgdZzcFlAMC8payn3TF3SmxFFyMHRpVKYKwva/yq8awSr
         wVcZ3GEscUwsETAU+tAXkq1+65Jv1of7kB0ZGMYWCVf5FwPvBffxwIrF+WOJpVYS0v3R
         7yr57qXUpXc/ywOqBLbco3E3QgGAYb4X9rQf2/4JaE+1hQFmMa8LP0vowZgbRmzD8ypy
         08bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=U1SYL24RcTv9N7iT3p8Gk3jg0reoXyBjPpMVxH+Yb2c=;
        b=YScpFg01ddQ0XEhafj7nRc/TEaQe4mW3A0F1NcBBrCLrNJ1uq0PQQLHV18BPxMvsPJ
         U07n0SHzJuxJSMylWUEAB4mx4s5GE3sJT/HtsHz7GvDe/YQBms8IGT5Jb28c98/sa5yK
         xW+KOC/8CnRq3GfxrZjvk01XdcuKSTRMuNgf6MQu1GnXFimYJlYkoNmFMNttjg3pRqVl
         u4NKHeV1lzBT3TjexKU0CSYkCdnJhjg32HzeRQtAW8TAGfjxdQ4mUn/x8uNePgA7vGxH
         0iJDg2hY7oUo2566ZAp4n7T4K3IGd7ZRl9DfyDajt3HC26wooHhRfDIcaVtUBHKvkPnc
         mHuQ==
X-Gm-Message-State: AOAM5329ipDpolWq+Q346NRCeRW56qB8Vm75SH4yFTUM30O5VNy+vJkj
        qmff20wtItb5N3m+u8j+hUvXP8TUidsJ
X-Google-Smtp-Source: ABdhPJzhbiY6OL3SEP4f5SvcBbQqzn20Wueip3Hg4YPjnhhPTZC1kw4E3QbluKfoOYm2U9VaaZ7MgAacn1oH
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:a8c4:: with SMTP id
 h4mr404502qvc.58.1605516275666; Mon, 16 Nov 2020 00:44:35 -0800 (PST)
Date:   Mon, 16 Nov 2020 16:44:11 +0800
In-Reply-To: <20201116084413.3312631-1-tzungbi@google.com>
Message-Id: <20201116084413.3312631-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20201116084413.3312631-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 1/3] remoteproc/mediatek: fix boundary check
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, pihsun@chromium.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

It is valid if offset+length == sram_size.

For example, sram_size=100, offset=99, length=1.  Accessing offset 99
with length 1 is valid.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index a1e23b5f19b9..0abbeb62cf43 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -408,11 +408,11 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
 
 	if (da < scp->sram_size) {
 		offset = da;
-		if (offset >= 0 && (offset + len) < scp->sram_size)
+		if (offset >= 0 && (offset + len) <= scp->sram_size)
 			return (void __force *)scp->sram_base + offset;
 	} else if (scp->dram_size) {
 		offset = da - scp->dma_addr;
-		if (offset >= 0 && (offset + len) < scp->dram_size)
+		if (offset >= 0 && (offset + len) <= scp->dram_size)
 			return scp->cpu_addr + offset;
 	}
 
-- 
2.29.2.299.gdc1121823c-goog

