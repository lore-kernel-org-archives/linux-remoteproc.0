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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F1AC4742C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 11:43:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43A8022245
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 11:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kehch9xJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbgKPIok (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 03:44:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbgKPIok (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 03:44:40 -0500
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0596FC0613CF
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:44:40 -0800 (PST)
Received: by mail-pg1-x54a.google.com with SMTP id f12so3137555pgj.15
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=U3Gi1qahwlJP98+q+DzLZd9zkdZHDpsmepdISgH+9NE=;
        b=kehch9xJroI7LjWkkrpaK2y/pA8zVVNmlv6bS9Hbia0MVnrY0lfoB8heEZAxrT4eQq
         fqe9MOaa7/zAwhOHo+YXMJR5NKRvjqcmt5RB+q7UMvH19i1c4vR4w+S5FAVQugwZRgeN
         oODQ4xY8Xf0tbfWP08c2BW/dkJzdrkSJwhd91t+4DTd494czrp0MNGsUV940AjKk4FIF
         0HuTUm9j5cKpr1eghbwhADpRLMY7r1JHk469OR3d5F7XJQb5YIApr8NFeNLukci6Jz9l
         MdR2MBIPLn629hut04JnPig15lPf9BOIL6yaC/vjblJddFywFtcVD8he0amkWpjrkDyl
         XyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=U3Gi1qahwlJP98+q+DzLZd9zkdZHDpsmepdISgH+9NE=;
        b=swDjphUli9NS/M2DGbfZ83E/72O7yZ/zbRpOElvqP5aigZX9FHFzVQkzJhlComInlM
         m/Cx6GccCGIaP8HNAjWcmFSuY48+yR++nC3d8PPqnzYdEhFS/FcIpjHiUVcm+bavK0jT
         5rtipUtPL83UHc36j7dFJSZmApz1EjgnFCeJLbus808sESBPc40mqz2pqyImTlIhsKu6
         VKwCjcgQQWqoK6Qsr/2LLaXwQ738K71kVa9jLMyV83nXAL1PKmBGqhWqF/07+Ws9URCS
         7B+SgimMzBWeG0uB26uU5q74RAKEV3tuURGiPPyEmtxYE4WuGc031tGZWRTTGaF6Xdq0
         pYzg==
X-Gm-Message-State: AOAM533CjPbgiEZwUTGXKfIk2zL0jZ/mjwra3WTYrTm+MMgFFZECDy5m
        0OYzchlHGPS6LuAkJC6MZrFyvL8L6U7A
X-Google-Smtp-Source: ABdhPJxg+Z8Zu9B3dSqceVno3+Brgq9ObO149i6jMRBUlUkXml8qKyHkCmVunSfSYifJf7XSVOpNenMRFqPo
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:902:a503:b029:d8:e685:3e58 with SMTP
 id s3-20020a170902a503b02900d8e6853e58mr5843637plq.68.1605516279549; Mon, 16
 Nov 2020 00:44:39 -0800 (PST)
Date:   Mon, 16 Nov 2020 16:44:12 +0800
In-Reply-To: <20201116084413.3312631-1-tzungbi@google.com>
Message-Id: <20201116084413.3312631-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20201116084413.3312631-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 2/3] remoteproc/mediatek: skip if filesz is 0
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

The main purpose of the loop is to load the memory to the SCP SRAM.
If filesz is 0, can go to next program header directly.

We don't need to try to validate the FW binary for those filesz==0
segments.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 0abbeb62cf43..74ed675f61a6 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -234,12 +234,14 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		u32 offset = phdr->p_offset;
 		void __iomem *ptr;
 
-		if (phdr->p_type != PT_LOAD)
-			continue;
-
 		dev_dbg(dev, "phdr: type %d da 0x%x memsz 0x%x filesz 0x%x\n",
 			phdr->p_type, da, memsz, filesz);
 
+		if (phdr->p_type != PT_LOAD)
+			continue;
+		if (!filesz)
+			continue;
+
 		if (filesz > memsz) {
 			dev_err(dev, "bad phdr filesz 0x%x memsz 0x%x\n",
 				filesz, memsz);
@@ -263,9 +265,7 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		/* put the segment where the remote processor expects it */
-		if (phdr->p_filesz)
-			scp_memcpy_aligned(ptr, elf_data + phdr->p_offset,
-					   filesz);
+		scp_memcpy_aligned(ptr, elf_data + phdr->p_offset, filesz);
 	}
 
 	return ret;
-- 
2.29.2.299.gdc1121823c-goog

