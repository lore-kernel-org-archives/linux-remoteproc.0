Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38481C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Sep 2021 09:55:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1ACF561212
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Sep 2021 09:55:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241613AbhIQJ4c (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 17 Sep 2021 05:56:32 -0400
Received: from egress-ip33b.ess.de.barracuda.com ([18.185.115.237]:44748 "EHLO
        egress-ip33b.ess.de.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241454AbhIQJ4b (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Sep 2021 05:56:31 -0400
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198]) by mx-outbound19-12.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Fri, 17 Sep 2021 09:55:08 +0000
Received: by mail-pl1-f198.google.com with SMTP id m18-20020a170902db1200b0013b994f3709so4876818plx.20
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Sep 2021 02:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QB8NxGfldn0ZW62MV3i+kZyEGH1apCb7zjxlCREGC5o=;
        b=GXoJmBrS0TgwapaeusnK49vzhsMHqCJDrp1XAGr2w9CqOH8DChrx82JGC5aGJGw5CR
         XCupOfz99xda1/rnU4iuQhGriE0WhEgqezxJ9sxpCyL8y5bZHpxSHh2WoXsM45y/arK5
         0qtdeu4sEkWJXpURktVm9rRiTUYUox1BAV0Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QB8NxGfldn0ZW62MV3i+kZyEGH1apCb7zjxlCREGC5o=;
        b=bqsSieauIHRAdGtpSLWvMGtaHeIuWOsO2Vrjpb8AbnJKopAzahtOH8vYOHb71W1/7j
         KsLGD11i52w67AZ/hxr/a2ngOVYZf8NRCzgKdn0CjlTHGdPA3e3IKu6UwgOAWCLh4e5T
         cQ9TG+Bwi4grOSCr0pPiaglxYQt7Bvp+biGHFXsCNmD9UceFZvZ/l1uK23k6W+y8wmHa
         OmFF6BBcd9QKqV31VHvGLdL5+ewx5PiXBYMeKiZdi8sX9DRWrKepijOxQCR55L5eqoxr
         WYxTuBrLa4iQpo57EpH8K9cJMZq0MsqKwzFG5ojEoHYG1SHXwGsrTj8Ljt0+eEULXvEY
         OjmA==
X-Gm-Message-State: AOAM530JdamyIJ0yts699Pt3bjSDJYOtyLdSMF5lAt4Arkd05+0uNl8v
        5ws2jYrt9ZkQWP8jVYoA6g4zSIk8SK1bsyXegmLolNX873b4fu8HeCU5RBOx8unVXKRvuu2dVqU
        nYIKwiNZFrXCp//6wOsbT1kpWLcbkM3dpJ/5osQZB6pGcOYFBR1W7HpXfdMiidxEuig==
X-Received: by 2002:a63:7453:: with SMTP id e19mr8970573pgn.243.1631872507000;
        Fri, 17 Sep 2021 02:55:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/O5dLoAsia5gmNWlpvAL+HxZASOmtWKqP7o/JPIBjw6jtKUb9+M7e1iPxfpd1ILgMRdpOLw==
X-Received: by 2002:a63:7453:: with SMTP id e19mr8970555pgn.243.1631872506818;
        Fri, 17 Sep 2021 02:55:06 -0700 (PDT)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id p2sm6077333pgd.84.2021.09.17.02.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 02:55:06 -0700 (PDT)
From:   Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To:     Suman Anna <s-anna@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Sinthu Raja <sinthu.raja@ti.com>
Subject: [PATCH V3 1/2] dt-bindings: remoteproc: k3-r5f: Remove board-specific compatible from DT example
Date:   Fri, 17 Sep 2021 15:24:25 +0530
Message-Id: <20210917095426.19277-2-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917095426.19277-1-sinthu.raja@ti.com>
References: <20210917095426.19277-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1631872507-304876-5430-1463-1
X-BESS-VER: 2019.1_20210916.2102
X-BESS-Apparent-Source-IP: 209.85.214.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.234537 [from 
        cloudscan20-104.eu-central-1b.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
        0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Sinthu Raja <sinthu.raja@ti.com>

The example includes a board-specific compatible property, this is
wrong as the example should be board agnostic. Replace the same with a
generic soc node.

Fixes: 5ee79c2ed5bd ("dt-bindings: remoteproc: Add bindings for R5F subsystem on TI K3 SoCs")
Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---

Changes in V3: new patch in the series.

 .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index 130fbaacc4b1..eeef255c4045 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -230,9 +230,7 @@ additionalProperties: false
 
 examples:
   - |
-    / {
-        model = "Texas Instruments K3 AM654 SoC";
-        compatible = "ti,am654-evm", "ti,am654";
+    soc {
         #address-cells = <2>;
         #size-cells = <2>;
 
-- 
2.32.0

