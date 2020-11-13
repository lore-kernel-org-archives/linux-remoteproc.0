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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E8AC388F7
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Nov 2020 07:02:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCC2820B80
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Nov 2020 07:02:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vVZ4pBXY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgKMHCZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 13 Nov 2020 02:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgKMHCZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 Nov 2020 02:02:25 -0500
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D26C0613D6
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2020 23:02:25 -0800 (PST)
Received: by mail-pg1-x54a.google.com with SMTP id o23so5629350pgv.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2020 23:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=od5RzXQQDUYNdgHqpNLuL0ghCcmfAozESYAcDCe7NAo=;
        b=vVZ4pBXYbM3nzNUI1cLnpzMC29BCXXpYtA5AMN+l263aJDpnRb2tDK+Ts1e7ULWBvH
         L0NPUQTsoBc01RAQPpDr7iqR+uWyyn4oNauHZU55d1UHPgMzxVPDFe7JjBUCvWz+/yVI
         935k29j8WUY2NO/EY38KYEFBIWOiBBEiVQ1JOglwOy7oNuI+dz6472ixF/ShVRqnchlu
         mM8/dfep+ArTnx1ih6xHVBBBizLe7na/YmTjvZ2FkhNKOhqU0DctIDs84mZwOgbzXHVS
         xWy3Qqh2YbAMwCAd1aVjjfATU6mqQ3tNcQ0FEsnJ3cPgfhQZnve17bfRDJE/x8FXpetc
         ZrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=od5RzXQQDUYNdgHqpNLuL0ghCcmfAozESYAcDCe7NAo=;
        b=oA09yjAtWYcc7V7FwW8jYnSL2EYAwjAbVGZqwXO+3EcDUQ67lohsyUBTLPvgylSmw/
         qbeR/YsURQDaAaxcg53wAMbkOmYiOXyPcKiRpWA2rDwMyjEOfc2KvK4p9zQJeImmOLQR
         Ij7HYaRRpKiRDkUdVy5ZmixpAWxrExNM9ZDDP7VmJ8+y80mo3nXzlFWtrRT4Yb/gjPv1
         gI78WKPX2yMxem4Bls9WvBMKUg9fUzm1bP6/bRtUGlYo3bcEhGjm8JL7DEnzWvtjhRiV
         gmg1vem4pQgqpjBJ+dMYgUWekkFOiNv7u2COYQYzTvLk+NYSiLDymzD+uN8UJiNcCvsX
         NMcw==
X-Gm-Message-State: AOAM531LsG6xZU7lU0jkBNGO/gOrTFdRTSMgo0ZBMCx0OW7QScm2CYJ9
        KRHLhMXZnOnGSD8oxXxBgOomGVngx8p0
X-Google-Smtp-Source: ABdhPJwTrEoI2V870amcgehFqHWitjg4WqLqzPkOKYCxwyxo0RZHFnPV/ysQuGnhBWchSZF6+jQjlqEeiqca
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:aa7:9e4e:0:b029:18b:7623:7cdb with SMTP id
 z14-20020aa79e4e0000b029018b76237cdbmr790147pfq.45.1605250944835; Thu, 12 Nov
 2020 23:02:24 -0800 (PST)
Date:   Fri, 13 Nov 2020 15:02:06 +0800
In-Reply-To: <20201113070207.836613-1-tzungbi@google.com>
Message-Id: <20201113070207.836613-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20201113070207.836613-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH 2/3] remoteproc/mediatek: skip if filesz is 0
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

The main purpose of the loop is to load the memory to the SCP SRAM.
If filesz is 0, can go to next program header directly.

We don't need to try to validate the FW binary for those filesz==0
segments.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 7ba00305009a..60ba4cece074 100644
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

