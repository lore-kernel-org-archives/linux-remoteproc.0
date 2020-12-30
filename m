Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF92C43333
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Dec 2020 01:28:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1AB2221F8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Dec 2020 01:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgL3B2Z (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Dec 2020 20:28:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgL3B2X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Dec 2020 20:28:23 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70967C06179B;
        Tue, 29 Dec 2020 17:27:43 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id u19so14152508edx.2;
        Tue, 29 Dec 2020 17:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ywgU0RqknLqPrZiMHs7nQjxQoQ/2d1Llugr9rRHrcUE=;
        b=Rj8sOYCIS+E/MVa5ui7wQLxQvcV4br+unm0GXxfRMUVlGrsVmTT4tqm4go25pqIMYA
         IT21SXvZZKWQ5kM/Iwc6licAvzMedXfc5gp4V3kj75OR81MOjx3uuHrZ0Qm8Qn9kRXEX
         u5G4KjxywmTJUJlnXVgwlmTQg1z4QSCI00xqr+6ByMVtTOZPgJU5kurQG6KXYT5B6+Wz
         v64C2+wovgn3UKz4bBI2eyzur5JNRFBEPTlBPrUB2bsipAGEZ7giztyyh74d03B8pxNi
         kMhBmJeKCROWqvlcuRBZhaJ3Mzar3EhDxOziSZp/NptCb2b4scDHOTHlN+dNyBYo9IfN
         9U9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ywgU0RqknLqPrZiMHs7nQjxQoQ/2d1Llugr9rRHrcUE=;
        b=KcG5ajkselOHpApgCTeBZjpGJ0wcfyZCLpzTAvXWCfN9ltGJm5+hkezMhWqfRkxV/9
         /iPmzLhlcv0L+mDCoTeJ44B4nM6c+e8N1hkWT6wj3NqBhoGtABHc/oglBDCzyROrPxjU
         YQCZv/yDrtYFWM/K+ljJ437E0wYIshFoe5pUTuwkRHdSVRM2xzeoigQyQAo9NuBKQoVN
         Yz/I5D76CPxIlxj8e+wHqpQyMojOxH8LzNI+4X6v8lMFZbuFX0BwgXFjfBFI32zy5A58
         9DKyv5q7VdjW6DeckHdqoJnKoMgIHSQ0TZIRcWGFWlR17VqNIQowRxw+R8SIr6T1PjNi
         nfkw==
X-Gm-Message-State: AOAM530PBVqOw9jKDWJx5hq8193buHGD6mUR8/dW+weeBvfE0WZ9wDZW
        x3f5oW+4A9E1GlHlcIr3UPb3bDc5Nj0=
X-Google-Smtp-Source: ABdhPJzydY6e89yCgNrlsCho+Eqw9nrvxV6BTll14imCz7x61V1dXkTAfpJW6o8YTwcmkpXnPnrcSQ==
X-Received: by 2002:aa7:d608:: with SMTP id c8mr47385390edr.260.1609291661976;
        Tue, 29 Dec 2020 17:27:41 -0800 (PST)
Received: from localhost.localdomain (p200300f1372a4000428d5cfffeb99db8.dip0.t-ipconnect.de. [2003:f1:372a:4000:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id f20sm26576696edx.92.2020.12.29.17.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Dec 2020 17:27:41 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        ohad@wizery.com, robh+dt@kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/5] dt-bindings: sram: Add compatible strings for the Meson AO ARC SRAM
Date:   Wed, 30 Dec 2020 02:27:20 +0100
Message-Id: <20201230012724.1326156-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
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

