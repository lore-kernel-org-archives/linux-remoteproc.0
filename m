Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C30AC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Feb 2022 22:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiBYXAP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 25 Feb 2022 18:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239002AbiBYXAP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Feb 2022 18:00:15 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6072D1AE656;
        Fri, 25 Feb 2022 14:59:42 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nfraprado)
        with ESMTPSA id BF9381F46804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1645829981;
        bh=t19nw/t143xzVk+Pi630XyI7MsIs/Qg22pD/AG+WnVg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RED1y/2IFuJpJ/GLLEHcBSw+7IZBlOjLU4a6jmNflSTDX671E7OI3W2itFXoYlVRd
         Sr6GGRnhhm+lBA6fB64D3oSFM3k4I3KpwxNjevYnrM4CMUxP+l9k3p0cgUvVZ+bO/B
         iV+G2hBmVhJdXrVsTyFtVSaQysaS+iaODik64ZTpc67u1snqyxnTbFMIfJku3cRFmd
         PnmOIUyXl4FP1dHUH8TMv9pEI7Db94BNV35BmxAhhgjziUmSXFxwry2riqyxih+fmM
         0u96qhKp0xvXIh9z7AxlIP3nDuOOteTqlrMi1x93uKJ9iDqfO5Z3sziQ+6vuLLI+oF
         D8f+uZ7J0L7hQ==
From:   =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: remoteproc: mediatek: Add interrupts property to mtk,scp
Date:   Fri, 25 Feb 2022 17:58:52 -0500
Message-Id: <20220225225854.81038-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225225854.81038-1-nfraprado@collabora.com>
References: <20220225225854.81038-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The SCP node can have an associated interrupt. Add a property for it.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index d21a25ee96e6..103ccea462f8 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -41,6 +41,9 @@ properties:
   clock-names:
     const: main
 
+  interrupts:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.35.1

