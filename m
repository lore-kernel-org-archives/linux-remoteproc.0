Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC62C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Sep 2021 12:33:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3256D60F50
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Sep 2021 12:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237643AbhITMei (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Sep 2021 08:34:38 -0400
Received: from egress-ip33a.ess.de.barracuda.com ([18.185.115.192]:54214 "EHLO
        egress-ip33a.ess.de.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233036AbhITMef (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Sep 2021 08:34:35 -0400
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197]) by mx-outbound45-0.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 20 Sep 2021 12:33:04 +0000
Received: by mail-pf1-f197.google.com with SMTP id x17-20020a627c11000000b004479c22b9d1so3003769pfc.21
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Sep 2021 05:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SEL1gkIAJp4KVblBAp/xhehzJxXPAFWh7FPt5vFeWVs=;
        b=OYMo6gnbLCtZZtBUzwIqSzxff70GhWSCYTxM54e15pLXvWDJBNHICSOMtZpsEDW/P4
         8bPJNlbEttfsryty2dACC8alIulPFB9RPS/uzx416TRpWRfw1+5i1qRi9Bc3gxAfMjGz
         g1URznygBLY+7fLMfbyXjdWLtF3gZ3OdN6EgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SEL1gkIAJp4KVblBAp/xhehzJxXPAFWh7FPt5vFeWVs=;
        b=hwdKviubyhHNQjptCBhGC5x2nExGBRmp0PJnmmDZdZCSxQPBxY1SGeZJIHNmaQMJAp
         ZlpOmfxqMrWmB7+yuOnkyvn2g94KQdmQx5vbuLOYUS1Tk2kYyqBUbYhZpumk7kWvm3CC
         8oix6Cim74enkkqoHvaFpkKZkY3uko89OXTC3lrg3uIvl9mjJniIAqGMy81SMRFBtkvv
         VPEImwsaRD45x/d2c5TJ2liQegZXau1gLhYLXMFzXSqpRcq7O6VGUj+iHTofI6WMvSmS
         bK3MPAxhCaQHQ4pDsEEjXMk0MuZM2d/YJ8md6mrV88qZfiKB16m/McexC0nCXmaTayoy
         TTNg==
X-Gm-Message-State: AOAM530zqWx4gGsVAfaZpCxM+1RjW/3mWxqB4z64qnkd8J29vbWHEelD
        75UKf6ipR8Zo3pFwHCwRaeqDtgcrMzDq9TE5s+c4iabtd7+PKvWhUVlak9OFSvdup63V+SHDbog
        1BS93DgbL+a2z0U2LDnfwupF67jcvaRyjUfcaVURzRyxO8t0WlhYMvaOn/202ICQDTQ==
X-Received: by 2002:a17:902:a50f:b029:11a:b033:e158 with SMTP id s15-20020a170902a50fb029011ab033e158mr22604831plq.26.1632141183822;
        Mon, 20 Sep 2021 05:33:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjw48yoSF+t1cM9uQwmmG4D25VWxribqv/ULIu0flFFUYM1g25aTWElA0jtLb7zkd+Nj5KlA==
X-Received: by 2002:a17:902:a50f:b029:11a:b033:e158 with SMTP id s15-20020a170902a50fb029011ab033e158mr22604807plq.26.1632141183540;
        Mon, 20 Sep 2021 05:33:03 -0700 (PDT)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id d14sm7605712pfq.61.2021.09.20.05.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:33:03 -0700 (PDT)
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
Subject: [PATCH V3] dt-bindings: hwlock: omap: Remove redundant binding example
Date:   Mon, 20 Sep 2021 18:01:52 +0530
Message-Id: <20210920123152.32751-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1632141184-311520-5378-220-1
X-BESS-VER: 2019.1_20210917.1726
X-BESS-Apparent-Source-IP: 209.85.210.197
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.234608 [from 
        cloudscan15-161.eu-central-1a.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.50 BSF_RULE7568M          META: Custom Rule 7568M 
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
        0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_RULE7568M, BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Sinthu Raja <sinthu.raja@ti.com>

The example includes a board-specific compatible property, this is wrong
as the example should be board agnostic and should represent the particular
binding. Also, the file includes two similar examples but with a different
compatible. So, drop the entire second example

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>

---

Changes in V3:
Addressed review comment, that includes adding Suggested By: tag to the 
commit message

V2: https://lore.kernel.org/all/20210917170805.5079-1-sinthu.raja@ti.com/
V1: https://lore.kernel.org/all/20210917094740.18891-1-sinthu.raja@ti.com/

 .../bindings/hwlock/ti,omap-hwspinlock.yaml   | 33 +------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
index ae1b37dbee75..0a955c7b9706 100644
--- a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
@@ -39,39 +39,8 @@ additionalProperties: false
 examples:
 
   - |
-    /* OMAP4 SoCs */
-    hwspinlock: spinlock@4a0f6000 {
+    spinlock@4a0f6000 {
         compatible = "ti,omap4-hwspinlock";
         reg = <0x4a0f6000 0x1000>;
         #hwlock-cells = <1>;
     };
-
-  - |
-    / {
-        /* K3 AM65x SoCs */
-        model = "Texas Instruments K3 AM654 SoC";
-        compatible = "ti,am654-evm", "ti,am654";
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        bus@100000 {
-            compatible = "simple-bus";
-            #address-cells = <2>;
-            #size-cells = <2>;
-            ranges = <0x00 0x00100000 0x00 0x00100000 0x00 0x00020000>, /* ctrl mmr */
-                     <0x00 0x30800000 0x00 0x30800000 0x00 0x0bc00000>; /* Main NavSS */
-
-            bus@30800000 {
-                compatible = "simple-mfd";
-                #address-cells = <2>;
-                #size-cells = <2>;
-                ranges = <0x00 0x30800000 0x00 0x30800000 0x00 0x0bc00000>;
-
-                spinlock@30e00000 {
-                    compatible = "ti,am654-hwspinlock";
-                    reg = <0x00 0x30e00000 0x00 0x1000>;
-                    #hwlock-cells = <1>;
-                };
-            };
-        };
-    };
-- 
2.31.1

