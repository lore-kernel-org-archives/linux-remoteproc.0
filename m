Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D022C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Jan 2021 08:19:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB08723447
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Jan 2021 08:19:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbhAHITO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Jan 2021 03:19:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727182AbhAHITO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Jan 2021 03:19:14 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7A9C0612FC
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Jan 2021 00:18:05 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id l8so14846212ybj.16
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Jan 2021 00:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=bI+0dIEYVTi9BtzYNPAvr6WiFZISRySVGENe/QVVeXw=;
        b=Iyscw6HOMElHAJAqxy6xFyo6nkn4oDAvWAg+pUIizUYF/vLoLvVh+XHIA75PrE2M69
         dduZxqboECIIG01/0rGLNzDPeZxb7bnQYF9lFkxuOCXGQDyMFbfa8FA1+v3qDAybmn2H
         I6huQgDIThU7nbf8A+IZtNO1r5Qtjz+jdLWVOzBryoFrJKTutnQDSGRZ+iEP04Rv9khF
         MnWRbYRgHNgBGsrbDMS4jWu3pCeo+uVvmWLHwQUN1IXXrRgRsK0ibfUj2qwDTo78idJI
         kmTOVtuIr9Y2cgngOalOyhzyfsTBaFGLWlOcwutTD0spWf9sBmblvs92aZ03PRch+atu
         Yy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bI+0dIEYVTi9BtzYNPAvr6WiFZISRySVGENe/QVVeXw=;
        b=hmGYL0V4o9zkNmh1ToP+ymHmJWWn/djDt1Pb/19iki26uVmG90rvJRkDSqb93t059x
         y4J95edP0nvD7tlKxw7CWX8bXNkO0PEUNQKkcn8jNQL9Aszn26c5JDv1YR1VSsdQpxIN
         3DTNWr7k+fj1OL8EZnWBA6YP7XCK3bp2dsYfgqdWNHNMjruE1nGNBqH3cYPqA4Z+L7cP
         vM0XHINIhwDXKHkmat05/79GW5VzvipiTfOD4kautYCN1lh9n8MAmLtKG0OEoKyraC6g
         jBQ+iBBhO0+xmyKG6ipELLlqbF4v7YlCppZhJrTuBKrDqDtwg6kjchaXXvECYRvbuBj0
         toog==
X-Gm-Message-State: AOAM533Jzg9O6auOG05QcNI8R3yxbSffGDPIkONJJoU/PjRjNW+ADgHI
        vEtF16F4JcgelUGcgJqkJbkM2NCNydZa
X-Google-Smtp-Source: ABdhPJygnrtyISlSlZ02dPQVOsCdCcsdrrSWjhpY98JkLLd5qOr7KV+rZKsNbB9nbQf38IzFNJeKIP5MZsSZ
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:c5c1:: with SMTP id
 v184mr4291137ybe.449.1610093884486; Fri, 08 Jan 2021 00:18:04 -0800 (PST)
Date:   Fri,  8 Jan 2021 16:17:37 +0800
In-Reply-To: <20210108081738.2175224-1-tzungbi@google.com>
Message-Id: <20210108081738.2175224-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20210108081738.2175224-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v2 3/4] dt-bindings: remoteproc: mediatek: add L1TCM memory region
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, mathieu.poirier@linaro.org,
        devicetree@vger.kernel.org, tzungbi@google.com,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Adds L1TCM memory region.  The reg-name is "l1tcm".

Acked-by: Rob Herring <robh@kernel.org>
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
2.29.2.729.g45daf8777d-goog

