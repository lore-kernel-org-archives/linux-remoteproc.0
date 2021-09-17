Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAA5C433FE
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Sep 2021 09:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7032F60F48
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Sep 2021 09:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241449AbhIQJtz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 17 Sep 2021 05:49:55 -0400
Received: from egress-ip33b.ess.de.barracuda.com ([18.185.115.237]:40790 "EHLO
        egress-ip33b.ess.de.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233677AbhIQJtw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Sep 2021 05:49:52 -0400
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70]) by mx-outbound47-143.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Fri, 17 Sep 2021 09:48:27 +0000
Received: by mail-pj1-f70.google.com with SMTP id j14-20020a17090a318e00b001796382f0caso6940744pjb.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Sep 2021 02:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zg9NR0tSN21z3Xw9wATEsBQgHLP/VfeOw0/h62Yv3Ho=;
        b=aRU2GrRB/Xljgd8vbtFT+MYi+kjI1fCJHzWR/eowU1ei1WGy303gfJViTSKJrDtOi1
         jYe2Tna0Lxg0QSyXSvcxtAasWZznuyxkzQTyW85vsqWsZL20zqIAJWjyofwKaWR7c/i2
         89IlusNBpOerYRS6waSMf577WoVRXjmCEfAIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zg9NR0tSN21z3Xw9wATEsBQgHLP/VfeOw0/h62Yv3Ho=;
        b=hM5xTfzEMQWLMP0OjFavcVu3uK8Mf7EADe1aUtJ+xfRdKxPoQHsSX97WD7iNzwe962
         AizcRdi1nv0nHFy7xoZxjabN3qv9hfTQEDw0QxoSagCKLxCzikccGQ0CgqYNvrc7EBFK
         86UGW8xFph7JNVkA3pEnD/vdpu2PsmxtU/S/vwQOByoEpcpMZRBVTdruhSoSG0eS/nIO
         caBkSgfsCPGc9xDybzq6+BUUCzIGwE8ckGy147Y/wIjefg90keO8aEmMX4rIjaaceSFw
         zLNk91WrBgeIyst7dfFCsx0FG9hM4SER9Mdez17LVeKN43S4mFt4Wch8C7+3oCdAT4t5
         7aQQ==
X-Gm-Message-State: AOAM532X9iVl2G4W6ek14W4u2Kx7EKOAdkgaTdkqGhWGKJLTkr19Zjsn
        +9eVX1BBrU6O5j4SbOy+rM+B2/Qv3P04vs1ilEyuSqgeQ+H468+HfbBKf6IBQCe0aZlR7eoVozr
        uM1Snbny5scRcKtx4dtN3/LzTVk0NxsAw+2XuMchMcGUwECriWu6biYWnSfvMm5iA9g==
X-Received: by 2002:a63:235f:: with SMTP id u31mr9211756pgm.248.1631872106614;
        Fri, 17 Sep 2021 02:48:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHTgAmXPTPvEhSyqwKadxqkCmkk3t2nlenuC8rzOzF2qP7V/rxCowvgAU3zOBFx5Rf9WHPwg==
X-Received: by 2002:a63:235f:: with SMTP id u31mr9211736pgm.248.1631872106322;
        Fri, 17 Sep 2021 02:48:26 -0700 (PDT)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id j25sm5409245pff.34.2021.09.17.02.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 02:48:25 -0700 (PDT)
From:   Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To:     Suman Anna <s-anna@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Nishanth Menon <nm@ti.com>,
        Sinthu Raja <sinthu.raja@ti.com>
Subject: [PATCH] dt-bindings: hwlock: omap: Remove board-specific compatible from DT example
Date:   Fri, 17 Sep 2021 15:17:40 +0530
Message-Id: <20210917094740.18891-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1631872107-312175-5438-1047-1
X-BESS-VER: 2019.1_20210916.2102
X-BESS-Apparent-Source-IP: 209.85.216.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.234537 [from 
        cloudscan11-125.eu-central-1a.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Sinthu Raja <sinthu.raja@ti.com>

The example includes a board-specific compatible property, this is
wrong as the example should be board agnostic. Replace the same with a
generic soc node.

Fixes: d8db9dc34871 ("dt-bindings: hwlock: omap: Convert binding to YAML")
Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

This patch was triggered by discussions in [1].

When applying the patch, if you could provide an immutable tag for the
bindings, it would help line things up for new platforms to be added for
us. See [2] for the context

[1] https://lore.kernel.org/all/20210818074030.1877-1-sinthu.raja@ti.com/
[2] https://lore.kernel.org/linux-arm-kernel/20210125141642.4yybjnklk3qsqjdy@steersman/

 .../devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml        | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
index ae1b37dbee75..d56dc1bebdc6 100644
--- a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
@@ -47,10 +47,8 @@ examples:
     };
 
   - |
-    / {
+    soc {
         /* K3 AM65x SoCs */
-        model = "Texas Instruments K3 AM654 SoC";
-        compatible = "ti,am654-evm", "ti,am654";
         #address-cells = <2>;
         #size-cells = <2>;
 
-- 
2.32.0

