Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A526C43381
	for <linux-remoteproc@archiver.kernel.org>; Sat,  2 Jan 2021 21:00:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDD502075F
	for <linux-remoteproc@archiver.kernel.org>; Sat,  2 Jan 2021 21:00:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbhABU76 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 2 Jan 2021 15:59:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbhABU76 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 2 Jan 2021 15:59:58 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB8FC061573;
        Sat,  2 Jan 2021 12:59:17 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id i24so22960674edj.8;
        Sat, 02 Jan 2021 12:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ywgU0RqknLqPrZiMHs7nQjxQoQ/2d1Llugr9rRHrcUE=;
        b=nTzXSsLMgjBkPOAji4+eKD2k58N7k6whoOZN/Tj/TQWrTcRDD4obYaEI30ntGHCnNO
         0W1mCPQYL8N0tDfY0DwySC1trF4Sf+Q3kAa0C5rWnWOHs65XBuOjz94R7I0i9wOdNxHL
         9FbZAttDo2a9kydgIuTwxQn8IXb5Be2HkAqfeiB9sFYXw003GpRKmGJ5ZouXAFJ1VWDk
         LlMnw98aZ1AY/cLqbh15fYBYTPgVnmPL6VHuTRsjdvnRHaqW8YTkPdZ6p0pEZBusRKFV
         Zt5pbHgIMX7IkkDk6FAXBaqEdo5tGK0i+Gxfws85YUdlj9ueFF1WcXxfu2sFYQkZLqAv
         kRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ywgU0RqknLqPrZiMHs7nQjxQoQ/2d1Llugr9rRHrcUE=;
        b=ifToocsT2aw9bLJoz1zKiBN+y6mCazDKqdWeCVNODX21XdZGIeTzMFMuHPHRCsyaT0
         NrUvRsvTvIi6xg7zphNK/Lj/4QPZ8MG4tIh0PGzDx/be35aif9owOucJslPSNgPR11gc
         CntCOEH1hdRwq1Jvsp0NADd4Yor/KicUEyJReIgHyzj1Z/fzkDTAhX08AefyuXNHwY8T
         M+tiqMVo2baEApzqxLGUFGfcZ4TDASsZQOYnUc2hmqMZFbj2ACXjK5eF57eSLy5439Ke
         r0gLULygkfWRknhR8DqUmgVu7qxbHsF2STuk8+ABcG7uV/D+kRMxJd2uvTXN/d+zbhF2
         j2Cg==
X-Gm-Message-State: AOAM532A1NuNi8j4NEbbwgwzTL8glFrDHz8he+sGMZQZBWICcB+NcR/B
        APgy9YKU1qUekRoYvM/U5onbb44s0cA=
X-Google-Smtp-Source: ABdhPJw3+ko0VZX14qsFf/BNsYrFexeTS/1D1ZEDnK/05bBIvDZ7G0qwLteAixk33fJQF6HJwa/0Sg==
X-Received: by 2002:aa7:d494:: with SMTP id b20mr66478539edr.330.1609621155953;
        Sat, 02 Jan 2021 12:59:15 -0800 (PST)
Received: from localhost.localdomain (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de. [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id v18sm41420617edx.30.2021.01.02.12.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 12:59:15 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     ohad@wizery.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/5] dt-bindings: sram: Add compatible strings for the Meson AO ARC SRAM
Date:   Sat,  2 Jan 2021 21:59:00 +0100
Message-Id: <20210102205904.2691120-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Amlogic Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4 core
typically used for managing system suspend. A section of the SoCs SRAM
is mapped as memory for this ARC core. Add new compatible strings for
the SRAM section for the ARC core memory.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 19d116ff9ddc..6d65771e979c 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -72,6 +72,8 @@ patternProperties:
             - allwinner,sun4i-a10-sram-d
             - allwinner,sun9i-a80-smp-sram
             - allwinner,sun50i-a64-sram-c
+            - amlogic,meson8-ao-arc-sram
+            - amlogic,meson8b-ao-arc-sram
             - amlogic,meson8-smp-sram
             - amlogic,meson8b-smp-sram
             - amlogic,meson-gxbb-scp-shmem
-- 
2.30.0

