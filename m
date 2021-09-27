Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7C7C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 11:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09679610E8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 11:08:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbhI0LKM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 07:10:12 -0400
Received: from egress-ip4a.ess.de.barracuda.com ([18.184.203.227]:38982 "EHLO
        egress-ip4a.ess.de.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233967AbhI0LKK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 07:10:10 -0400
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200]) by mx-outbound12-93.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 27 Sep 2021 11:08:28 +0000
Received: by mail-il1-f200.google.com with SMTP id x17-20020a927c11000000b0024da94ff1a6so18488527ilc.15
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 04:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ntIyrbSafYiDvlVbOgBMSDN0S7pH0Ry7iK8d0o69m1A=;
        b=IQu+yNd1m6x8LyerLd2JZbodQ3CsQsmN9e69ru/DkDWrcpczVR6EomYcKborITZsoj
         8Uej0qWygcvTWUvYRPuCFdL7ZuJqqQMH/HHvqLuLeng7dCX4Dyq8K9QNuVSnn2AySpWh
         BwiKTtfPczhzcoJ/EhN1KoFz9lNlHxYcShW9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ntIyrbSafYiDvlVbOgBMSDN0S7pH0Ry7iK8d0o69m1A=;
        b=4Vkr4Tac3CK1lpHQ9Kt8jqOwOo4SM+hmU0ta4Kfis8K7Kh4vrgLQv4HJx9ys0j94hk
         1DPcu1ZEbkzRSNQFZX4iYzPmltf63YU6PnZor6ZcLhCXWmSsgBOGw9wUao/lyzUPbMYP
         R0T9ZzL4xIV/3e4SbEbidPJgSWeCAIx2v+zrY757WYRMXEW+8DdEsyX35YdYhNOd6+Cc
         FSFDooovgFQ5UjYEVpu7svieMprCO+lOrr2AHSdmgtGn8ljPew8XkSmGdOpRuAeSyE0k
         y5AHhL3AVxEzK8PUkSoUJ0lGaglYhtcAfcR/+eDkMFF06vgbm9M+YNmMrME2x4b5s6rW
         DaxA==
X-Gm-Message-State: AOAM5317VfGLw+fmCpBiJn+VVVHk+C4R8Phn49D+j4iJDdz73DcjRxbp
        fxeDy9Ni19+v1AWPudJOt1OffjH07k5xVUIvMO7/HV1ZQpkP0MJffEnlPlDqd44L86ol8mLY2ap
        +MMD3f6quE3pfRSuJ+CfgNzLc+bzcXADzHJzYDAQNKj2OhvaZZzTedm2TxxxLsXG+/g==
X-Received: by 2002:a63:b64e:: with SMTP id v14mr15855925pgt.245.1632739102087;
        Mon, 27 Sep 2021 03:38:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzM4LUrJVV8GvMkFUYG+hjSNHal5e6clFijKO6S3b9d14/ttamlNf2ZDUep2Pz2j5RaXTZHzg==
X-Received: by 2002:a63:b64e:: with SMTP id v14mr15855913pgt.245.1632739101822;
        Mon, 27 Sep 2021 03:38:21 -0700 (PDT)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id t68sm18030894pgc.59.2021.09.27.03.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 03:38:21 -0700 (PDT)
From:   Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To:     Suman Anna <s-anna@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Sinthu Raja <sinthu.raja@ti.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH V4 1/2] dt-bindings: remoteproc: k3-r5f: Cleanup SoC compatible from DT example
Date:   Mon, 27 Sep 2021 16:08:10 +0530
Message-Id: <20210927103811.11222-2-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927103811.11222-1-sinthu.raja@ti.com>
References: <20210927103811.11222-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1632740907-303165-5396-1435-1
X-BESS-VER: 2019.1_20210921.2035
X-BESS-Apparent-Source-IP: 209.85.166.200
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.234759 [from 
        cloudscan14-74.eu-central-1a.ess.aws.cudaops.com]
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

The K3 R5F binding example used the root-node with a SoC compatible
property originally to address the dt_binding_check warnings resulting
from using a value of 2 for #address-cells and #size-cells as per most
common usage on K3 SoCs. Clean this up and replace it with a generic soc
node to keep it agnostic of the SoC or board compatibles that are outside
the scope of this binding.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Suman Anna <s-anna@ti.com>
---

Changes in V4: new patch in the series.
* review comment updates, including, commit message and $subject updates
   & dropped Fixes tag.

V3: https://lore.kernel.org/all/20210917095426.19277-2-sinthu.raja@ti.com/

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
2.31.1

