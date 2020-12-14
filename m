Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01654C1B0D9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Dec 2020 05:06:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C70BD2085B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Dec 2020 05:06:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727633AbgLNFG2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Dec 2020 00:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgLNFG2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Dec 2020 00:06:28 -0500
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A0FC0613D6
        for <linux-remoteproc@vger.kernel.org>; Sun, 13 Dec 2020 21:05:48 -0800 (PST)
Received: by mail-qk1-x749.google.com with SMTP id 189so7974663qko.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 13 Dec 2020 21:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=GUtMS/yoA8AlX35KWXx+OtSpGWP4nVdoiq93Y3LhngQ=;
        b=An+eAZV+jljp8c47GZayDSqeDwsRylkUVZ4MKqRbHnCV51SXxfvmLoLhkx7S8IyQ5T
         itglr6QOCQ+UXv3TlO+pqxRGWAqlN3+sEifWjsO1ZR+fkIjMFUkSFKOdxoeUfEv56Jo8
         hzB0aVBmm4dbYULgrE1AND+4o0PKjjfJKLSt+MvkvmiV0eS2gmAr6UAaf29Bznvt/Vto
         z1Un4WItskkMwmtkNRgOiSPVhXhenIqis5W0JvIU/G49TLCPahvBPnvDFDsYqSEO+HxH
         CCpD0Tx8DlNblfv0uXYxrMxz8fTAuJtyKBPUZ70jqs/RrSKWHHFofTaFgWkaW4wFDYtu
         DzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=GUtMS/yoA8AlX35KWXx+OtSpGWP4nVdoiq93Y3LhngQ=;
        b=qs6sVJVO7xHFHkNwdtsA2bLE+y6Lkz7Glbnky08qtCtt7vVMJDMsiUqJYgpK1fS6ZF
         drkcNDMHotkLz15GOhS8ip0AdCAq/4Mh47b4AvcYUr8itRLEbJPKvDNbLRGFdbXBqtpq
         NFYNM3Ff1TbTuBH7GK9JA16g1/ipUjdEiWZHtLvNhm62qnRYnVxwI1biNzwR8MrQeXWS
         hgz2+evY5yO3aeMkvbbJfaW8xwOwNi2ESuQge2YN9W9XblnSBU9elezuWhfZBBYTOVuv
         Ik5oSBoeVj/2IllXgMySzhiwlq7oVoiAfCVp/+y3Ak6MaOFRpSAuWnnvVOCKJYH/6S0a
         xGeQ==
X-Gm-Message-State: AOAM530YiPY7yFa0tL77/39Ewxgkdmgzsanrauq65SKVYdABelaKA/pj
        Rt+Z6KQZk/OAVFX9LKEFG1RZR+jTG2x7
X-Google-Smtp-Source: ABdhPJxZkqsL5injXgfq7FIilIF3cOR4K4Sb1FhdSzaQnJhs6x8iVHpL1LCGl2mU/1BNaZKzYCSSLrxveN01
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:df94:: with SMTP id
 w20mr29806672qvl.33.1607922347262; Sun, 13 Dec 2020 21:05:47 -0800 (PST)
Date:   Mon, 14 Dec 2020 13:05:20 +0800
In-Reply-To: <20201214050521.845396-1-tzungbi@google.com>
Message-Id: <20201214050521.845396-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20201214050521.845396-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH 1/2] dt-bindings: remoteproc: mediatek: add L1TCM memory region
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Adds L1TCM memory region.  The reg-name is "l1tcm".

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
index 3ba668bab14b..3f5f78764b60 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
@@ -6,10 +6,10 @@ Mediatek SoCs.
 
 Required properties:
 - compatible		Should be "mediatek,mt8183-scp"
-- reg			Should contain the address ranges for the two memory
-			regions, SRAM and CFG.
-- reg-names		Contains the corresponding names for the two memory
-			regions. These should be named "sram" & "cfg".
+- reg			Should contain the address ranges for memory regions:
+			SRAM, CFG, and L1TCM.
+- reg-names		Contains the corresponding names for the memory regions:
+			"sram", "cfg", and "l1tcm".
 - clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
 - clock-names		Contains the corresponding name for the clock. This
 			should be named "main".
-- 
2.29.2.684.gfbc64c5ab5-goog

