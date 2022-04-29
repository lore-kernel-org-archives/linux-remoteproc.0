Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F734C433FE
	for <linux-remoteproc@archiver.kernel.org>; Fri, 29 Apr 2022 21:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbiD2VOr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 29 Apr 2022 17:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232693AbiD2VOp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 29 Apr 2022 17:14:45 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5951D080A;
        Fri, 29 Apr 2022 14:11:25 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nfraprado)
        with ESMTPSA id 8384A1F469E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1651266684;
        bh=M4PKB7Pt1wtHjyvgT7kprcmuUgppO8szgoIad51yx9c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wl77Ok5b3IK3LDT0M2d7Yk0V5PV38zHEL1zVj2XHPrQqs/jmFV7V3wqBjZ4RJE7Xz
         C5BriECYW80aHA9eVOLBHDTASK562vHHtUtKagRiUb4yqm2MYYS1gMITNHSPqR3P23
         9qbjmw0yAOTxMFCEllAyrnIcGmRvORrtZSR3tPc0YgVXUQptzm+zcHnsTicOcB9/Hg
         35SwPgoJGrHPYDm2Y1nsRVFZrjgEIHfEaRtiBZC/X2KdAEPTc27xndRa//BTVxGeaf
         SfksPiozhMk2QPvAxUHLO7fI5084icjuFg5vGEflLIE5hYFuuoAe6sh1yano/gGP+e
         OAh9c4zhQOZug==
From:   =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: remoteproc: mediatek: Add optional memory-region to mtk,scp
Date:   Fri, 29 Apr 2022 17:11:10 -0400
Message-Id: <20220429211111.2214119-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220429211111.2214119-1-nfraprado@collabora.com>
References: <20220429211111.2214119-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The SCP co-processor can optionally be passed a reserved memory region
to use. Add this property in the dt-binding.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index ec9ddeb6ca2c..64a9d2c7ed0d 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -51,6 +51,10 @@ properties:
   interrupts:
     maxItems: 1
 
+  memory-region:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to reserved memory region.
+
 required:
   - compatible
   - reg
-- 
2.36.0

