Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96507C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 11:00:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ED3960F4B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 11:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233905AbhI0LCW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 07:02:22 -0400
Received: from egress-ip4a.ess.de.barracuda.com ([18.184.203.227]:42956 "EHLO
        egress-ip4a.ess.de.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233903AbhI0LCV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 07:02:21 -0400
X-Greylist: delayed 1342 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 Sep 2021 07:02:21 EDT
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70]) by mx-outbound40-42.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 27 Sep 2021 11:00:41 +0000
Received: by mail-oo1-f70.google.com with SMTP id d18-20020a4a9cd2000000b0029afc2f9586so16721622ook.19
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 04:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sCG/LglCvdRg/oGkfksE39oKp0qqB5Zh3UzOqOO6HuM=;
        b=FwQfvnoxXTujx5hOw76v4pnT2w7YEeZHvO6q7nOgbKKqy96GE0NSlCjZeKpxPwrREr
         L4LvQDN/jpwZoBNV35bquH70KAZxYOKTiaFYsZc/IUjrwkhcwV/56Ph0WRtRJ4tEOXcW
         oPMU9OUSIbkmeIimgN+ulbnArdtLknRmMuJLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sCG/LglCvdRg/oGkfksE39oKp0qqB5Zh3UzOqOO6HuM=;
        b=aLfZNTwDK5ZYPC0pqVT6aIiH89XRIwdyO9ddELIH+ePiZGegwqN82nYNv2y0iWKOGM
         JZogikKIoYpezu3xlhp40VLMYxueZEA8WiKF3mugfuHxOzEdMZEoVTPjri9ULU6a7B5l
         MwuoH95AMdVvM4rdp60qTPGWAXJ0HaLbdN2JUdJfQk67Y9QxMoKo9Gm1SBAuPbCSdlQe
         CfDj2kONmWBcjCwGTQUHcdOwIZ7M/37rJx4+bm/5t6hv+ISruxjL54OozqUIH+133QD8
         Comur4RtJdz/WISvOY8KmiI8utPJiuMQzoLgVokkag9y9aW6y2+HQAEaJhs1RvNIsavm
         vSmA==
X-Gm-Message-State: AOAM533gHwHwC1OBvQSUALiI1H1MBBDO0WQnJOVrYXRrxIvlt7p4j3YH
        1TU0Dfho1ynVd3y7cr/tDdGkmoyxWsW4WrJxVHcBnkVVNxgGv5n28NuiDsvyhIcLuRP26ul4lXm
        ziHm5yFVkpOSjlYOR3eLIuGKBfZSU4NurWny+SA5IYaaxYAjEuwgCnjzHTLdnl5/6pQ==
X-Received: by 2002:a17:90b:1102:: with SMTP id gi2mr18954392pjb.43.1632739105765;
        Mon, 27 Sep 2021 03:38:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzciYVKi71v8xhIPcFz9bTM5VAy8i1i3VXdLzJ4HCmoplHzneMMjjuWJuzNm1cOfqljbCNOmw==
X-Received: by 2002:a17:90b:1102:: with SMTP id gi2mr18954367pjb.43.1632739105559;
        Mon, 27 Sep 2021 03:38:25 -0700 (PDT)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id t68sm18030894pgc.59.2021.09.27.03.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 03:38:25 -0700 (PDT)
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
Subject: [PATCH V4 2/2] dt-bindings: remoteproc: k3-dsp: Cleanup SoC compatible from DT example
Date:   Mon, 27 Sep 2021 16:08:11 +0530
Message-Id: <20210927103811.11222-3-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927103811.11222-1-sinthu.raja@ti.com>
References: <20210927103811.11222-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1632740440-310282-5430-1106-1
X-BESS-VER: 2019.1_20210921.2035
X-BESS-Apparent-Source-IP: 209.85.161.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.234759 [from 
        cloudscan10-245.eu-central-1a.ess.aws.cudaops.com]
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

The K3 DSP binding example used the root-node with a SoC compatible
property originally to address the dt_binding_check warnings resulting
from using a value of 2 for #address-cells and #size-cells as per most
common usage on K3 SoCs. Clean this up and replace it with a generic soc
node to keep it agnostic of the SoC or board compatibles that are outside
the scope of this binding.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Suman Anna <s-anna@ti.com>
---

Changes since V4:
* review comment updates, including, commit message and $subject updates
  & dropped Fixes tag.

V3: https://lore.kernel.org/all/20210917095426.19277-3-sinthu.raja@ti.com/
V2: https://lore.kernel.org/all/20210818074030.1877-1-sinthu.raja@ti.com/
V1: https://lore.kernel.org/all/20210817152005.21575-1-sinthu.raja@ti.com/

 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml       | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 6070456a7b67..5ec6505ac408 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -133,9 +133,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    / {
-        model = "Texas Instruments K3 J721E SoC";
-        compatible = "ti,j721e";
+    soc {
         #address-cells = <2>;
         #size-cells = <2>;
 
-- 
2.31.1

