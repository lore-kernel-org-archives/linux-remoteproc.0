Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33837E7E652
	for <linux-remoteproc@archiver.kernel.org>; Tue, 26 Sep 2023 16:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235188AbjIZQpc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 26 Sep 2023 12:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235377AbjIZQpc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 26 Sep 2023 12:45:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62FF180;
        Tue, 26 Sep 2023 09:45:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62842C433C7;
        Tue, 26 Sep 2023 16:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695746725;
        bh=aYyNkcYVEy5iUmtkKozylsTv6tDrVJnDNQ3yWacAOpE=;
        h=From:To:Cc:Subject:Date:From;
        b=qq2tfooTqqPYFON0eSeyQI07FZu1DUcA8mcw4uBpxv1/cgJOQRnZ93YtiKi/61vKS
         UAYcUWY/ICSiL+GOadHAG2K5n5KfxIxdfUG9ho7TLRoc33/bpFVx4qq6m+waAyh/n9
         HpcjGSw6bDZ9LkKqz6EtET7UqIpCeML9hecUhZJ9IW0tBP9qZ91PhMoJHjO8pLe45x
         zb1JyUuu/h1CApqiBKjopN4PmYLLQlbAA7VLLCK/veDYnoCJ4dHpkwJwoZEQTAVsPE
         f2wL1UboIZ/WN2yO43riAsOtVxN7efRf1RP0q+Ko+gHgNyTxz6JBW3NsKHOqzLsyv3
         wFfYrCigx4ctQ==
Received: (nullmailer pid 102369 invoked by uid 1000);
        Tue, 26 Sep 2023 16:45:22 -0000
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: remoteproc: mtk,scp: Add missing additionalProperties on child node schemas
Date:   Tue, 26 Sep 2023 11:45:08 -0500
Message-Id: <20230926164513.101958-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Just as unevaluatedProperties or additionalProperties are required at
the top level of schemas, they should (and will) also be required for
child node schemas. That ensures only documented properties are
present for any node.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 895415772d1d..24422fd56e83 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -91,6 +91,7 @@ allOf:
 
 additionalProperties:
   type: object
+  additionalProperties: false
   description:
     Subnodes of the SCP represent rpmsg devices. The names of the devices
     are not important. The properties of these nodes are defined by the
-- 
2.40.1

