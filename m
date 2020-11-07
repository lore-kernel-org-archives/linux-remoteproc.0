Return-Path: <SRS0=MZUM=EN=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EB8C388F7
	for <linux-remoteproc@archiver.kernel.org>; Sat,  7 Nov 2020 23:36:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DF9D20885
	for <linux-remoteproc@archiver.kernel.org>; Sat,  7 Nov 2020 23:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8SbYwJC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbgKGXgm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 7 Nov 2020 18:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgKGXgl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 7 Nov 2020 18:36:41 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8299C0613CF;
        Sat,  7 Nov 2020 15:36:40 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id s30so7103746lfc.4;
        Sat, 07 Nov 2020 15:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZPk64J/LdH72s7qNPb60/1YSvZ1La3jkk8O0W53U28U=;
        b=g8SbYwJCs9zn6d+LbKtveqnsZblPzD0Z2Ra5QJ2I6RRLbp8OQcilcL0IkxQhkFct79
         OErVaGcpwFzpRMpjj4e8Cp44O0M4PVQERfF7/uNhDAYsShGTRVOP2R1yNP/hNYriLkPN
         G7gE5BTlvBPrgoUyTpZyiDxnIBKTlUF8l7wgIiGRCOTYp3JAlVVPJbwFDAUJBdTRF6ml
         FrYZt94/Lrf5qK2CKx0Sfmhe7c6Bz3Cfb+ShrY21cTtxSdms2KI0sa8R/BfCr0T+lwcy
         UdoJkMlW5Q3xJtP2tO6n310qhGJysUqXhBkWjJTLGGZ4TQfRyyLgIOuLmV2scQtGO7BL
         Aw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZPk64J/LdH72s7qNPb60/1YSvZ1La3jkk8O0W53U28U=;
        b=MbZdXbkkdQSf8lnyPAb3vFIRIR+IVTvlobxBbL/1a6j+I7e/Yw4BcjZRmJ2og7allD
         TNLbBa70+af8ifuCPXXy16HDCbqhRTd3s3XSveDeYXvl6Ut1Njgufk2tgiGp2ZmOf41H
         STNo16DoLDMLaCK90mFJ95JCZqiwjC82xR7OCqkvqCf3F8aSTA6CjSMsWq/kA59hPd8l
         KHDRJcZxgwr+UwczMHxrNM7yb7OdoPm0eQjjgldLS5FsWnAoOC+QLujD4gPDYG7XcqRF
         +W4g9oonTEYQkDAK9YmyP/Zx5hNzqMXpTfaevkg7HB1LEj3+4IOjhObluxkUdv5ro2hp
         XrPg==
X-Gm-Message-State: AOAM531PDL5F+LjSsQ1GtsUBE+exXR/E7MOFWdcy+TbZHXHsmwflQkrA
        kT6oZbw8XJdFmaicyFb2mqM=
X-Google-Smtp-Source: ABdhPJz+syd0FX/vzuZMTG1A+beDoADnelVvLuxQWYXbKBfLUhJGhgVxDvaFgNZgMpfS9QQDZKcfBA==
X-Received: by 2002:ac2:4422:: with SMTP id w2mr2964750lfl.219.1604792198857;
        Sat, 07 Nov 2020 15:36:38 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-112.NA.cust.bahnhof.se. [155.4.221.112])
        by smtp.gmail.com with ESMTPSA id j23sm782772lfm.16.2020.11.07.15.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 15:36:38 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 2/2] remoteproc: stm32: Constify st_rproc_ops
Date:   Sun,  8 Nov 2020 00:36:30 +0100
Message-Id: <20201107233630.9728-3-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
References: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The only usage of st_rproc_ops is to pass its address to rproc_alloc()
which accepts a const pointer. Make it const to allow the compiler to
put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index d2414cc1d90d..a180aeae9675 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -541,7 +541,7 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
 	}
 }
 
-static struct rproc_ops st_rproc_ops = {
+static const struct rproc_ops st_rproc_ops = {
 	.start		= stm32_rproc_start,
 	.stop		= stm32_rproc_stop,
 	.attach		= stm32_rproc_attach,
-- 
2.29.2

