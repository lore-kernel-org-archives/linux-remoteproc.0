Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5C2C4338F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Aug 2021 08:05:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4DB26108E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Aug 2021 08:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239292AbhHRIGJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Aug 2021 04:06:09 -0400
Received: from egress-ip4b.ess.de.barracuda.com ([18.185.115.208]:47154 "EHLO
        egress-ip4b.ess.de.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239164AbhHRIFy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Aug 2021 04:05:54 -0400
X-Greylist: delayed 1473 seconds by postgrey-1.27 at vger.kernel.org; Wed, 18 Aug 2021 04:05:54 EDT
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69]) by mx-outbound22-121.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 18 Aug 2021 08:05:17 +0000
Received: by mail-vs1-f69.google.com with SMTP id p13-20020a67a60d0000b02902a88e22a5e8so311664vse.14
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Aug 2021 01:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UkIuG9kG2oKl5x8f+ApK/mUtbc6w+fjs3SOOWN0kRIM=;
        b=lr0HtKv9rPHKgCeJK6CrjS5BRAZ1C4gQekRy3DuWQbU6als+LRedy/my6VvNNdKrzL
         oeepcNTjfgJEUIJB6A/fUlLESmSSfLP77HUvbevgfa4yUecJmIAGHdHdJXIY/5T/ZKpV
         3/DSkwHpdm/UGUhK/7lqjaNCTabKq3+R8tSCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UkIuG9kG2oKl5x8f+ApK/mUtbc6w+fjs3SOOWN0kRIM=;
        b=EATM1aYmJHqSAxqc65/lPkMMdv7pxmi6gvgcOMn6uRO3btGzc0ul98CvvVW0VC8CI6
         AC+K897C4MFgh66PsslxN1iB/SXtw9KSkWMem+DwP3JVQXnzxDMMh1rC6QbZqTepzK5t
         mC1NqrkaiiElr7+91l85xiz7G9UjeKd/oNuttT/ZXNIWGNa7I6AdtymGr4oRAD/qZkF7
         bfkeHnXYwymk3u9ueBqSc923YrhYIauU5dBrnJo7Oa1+dEVLr/izk2fe3OPbhOkwi9sk
         G2dkorlSfoEZ75gZ5wpSgUKmLgQ0IjgIP1KhZZNmwLNlS+GS3wpFG4MW0QHzarJfz0Qx
         VPww==
X-Gm-Message-State: AOAM531aGOh6UEfXHVEgnKwnYmx2AehvHpQeBUrvgMhuyEj10+1iY0Da
        gg8C4J7MDM7yQfaEUd1CWR4bMeQsDJe6/94eGBFlnGMNP3aV19ejQ46g4tYNC+qjiN+sVcGAj03
        pSQdNhBazeTjh87SCqp2Xzo5S21/CxBtOU3X/v2/wcuWnAob/2cr8VAVDwHgQy0yQrA==
X-Received: by 2002:a17:903:248f:b029:128:d5ea:18a7 with SMTP id p15-20020a170903248fb0290128d5ea18a7mr6302801plw.83.1629272441673;
        Wed, 18 Aug 2021 00:40:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW12eztIemFNz4nqgJdsosiXRAEcL1J4Iw8uicr4OKsG4mgSPpr0fXRPt4Rust4y8D+4i9aA==
X-Received: by 2002:a17:903:248f:b029:128:d5ea:18a7 with SMTP id p15-20020a170903248fb0290128d5ea18a7mr6302778plw.83.1629272441424;
        Wed, 18 Aug 2021 00:40:41 -0700 (PDT)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id 186sm5224756pfg.11.2021.08.18.00.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 00:40:40 -0700 (PDT)
From:   Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Sinthu Raja <sinthu.raja@ti.com>
Subject: [PATCH V1] dt-bindings: remoteproc: k3-dsp: Update example to remove board specific
Date:   Wed, 18 Aug 2021 13:10:30 +0530
Message-Id: <20210818074030.1877-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1629273917-305753-5338-7616-1
X-BESS-VER: 2019.1_20210805.2250
X-BESS-Apparent-Source-IP: 209.85.217.69
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.234027 [from 
        cloudscan12-251.eu-central-1a.ess.aws.cudaops.com]
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

The example includes a board-specific compatible property, but developers
need to add the board name each time when a new board is added to the K3
J721E SoC list. This grows the compatible string-list. So, drop the
board-specific compatible string and add cbass_main as a parent node to
avoid parent node and child node address-cells mismatch error.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
Changes in V1:
Fixed alignment issue which caused the yaml parse error.

 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 6070456a7b67..e44a9397b8db 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -132,10 +132,8 @@ required:
 unevaluatedProperties: false
 
 examples:
-  - |
-    / {
-        model = "Texas Instruments K3 J721E SoC";
-        compatible = "ti,j721e";
+  - |+
+    cbass_main {
         #address-cells = <2>;
         #size-cells = <2>;
 
-- 
2.31.1

