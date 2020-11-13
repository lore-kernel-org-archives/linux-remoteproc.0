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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D0CC55ABD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Nov 2020 07:02:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5E9620B80
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Nov 2020 07:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fgm+y0VD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgKMHCe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 13 Nov 2020 02:02:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgKMHCe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 Nov 2020 02:02:34 -0500
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93C6C0613D1
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2020 23:02:21 -0800 (PST)
Received: by mail-qt1-x84a.google.com with SMTP id h26so5238384qtm.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2020 23:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=j5FOq3cPnWx/ENlFWQJtCdT3iUWxaQSgARSmLQ/sveE=;
        b=Fgm+y0VDBaeJl/93SSK4CkaNMA6QyIKahE2AcZJ1HXnZvwJtDFGUkNd6vJCgbvvfim
         eTsss/fi86Tru4W4xfM+EIRy8o2NSgC8IIqnIb1sqQQl4Ilbsl3qnTztXnhT8ftAGfn0
         H08qp1Sczclyd85gDGA++xeTo0K1Ywq2quqvwVe8Be2ExaMNtwq9QPa48gPgwYz0huwk
         aiDlllSUNgpuIsOZNW+pZKiKKwgzn3UX3ebhIhk+D1OLezmA51eITU8PRiXwNy+FeGJx
         TROnFAU/UTApCIFvMJ0IW1qOAUfyl5emoQHIm5k3IaBHgwgtVngI4ns+7fRV3Vb4NI17
         /BfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=j5FOq3cPnWx/ENlFWQJtCdT3iUWxaQSgARSmLQ/sveE=;
        b=IvoNtyOuSJe6WGI07V++FYU9VwlPCZ3bbXSVewXzOwDNHspiROv14HsJagKKN6Pjrh
         Bt5fpu7T3vqoGrMbiWj2LpfyzSCb/JuIG45PGiDyqOYMR4LLj2q3tTIhKKRIUa4SmX0l
         DNqWeDzJJLCFneT+XiBAM6o1H+eBLq7zwW4nKSUP9OSe8ivo9hPOZz0RYVFahW0Uo96A
         a/oW8+9pzanO9/GE7ZKLjjn6h6Ghw9i04jOLvEaC+W/LchqAWa1HL0TRGIA0d9zrvrnF
         SXFuAYFF4DkZTaGThfJIrC6zLcl5+VxEsJz4KdK64WCEGTFbAiw+Q2F+2VLJPtn2wtVC
         6qNA==
X-Gm-Message-State: AOAM532Ih2p7hJfLS4TRjeLQhFTsPe5Oy7Q0P/x4bDc267JNCvPvJ+xr
        ZYF0GLoi2wHPQDBAvg1d3NyUPRPUi/wB
X-Google-Smtp-Source: ABdhPJy9eyFdefDqQi/665Hf0+8tbnO1qV+pedR+tnbIbh/u/9XgvyubpCvZ5r8O0m68VORkzGMOkKJ94m/t
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:ad4:5483:: with SMTP id
 q3mr1020720qvy.24.1605250940904; Thu, 12 Nov 2020 23:02:20 -0800 (PST)
Date:   Fri, 13 Nov 2020 15:02:05 +0800
In-Reply-To: <20201113070207.836613-1-tzungbi@google.com>
Message-Id: <20201113070207.836613-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20201113070207.836613-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH 1/3] remoteproc/mediatek: fix boundary check
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, tzungbi@google.com,
        pihsun@chromium.org
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
index 577cbd5d421e..7ba00305009a 100644
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
 			return (void __force *)scp->cpu_addr + offset;
 	}
 
-- 
2.29.2.299.gdc1121823c-goog

