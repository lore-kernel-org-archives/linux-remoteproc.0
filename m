Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453F0C433FE
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 May 2022 21:32:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444505AbiEFVgX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 6 May 2022 17:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444485AbiEFVgV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 6 May 2022 17:36:21 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76E795DBEC;
        Fri,  6 May 2022 14:32:37 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nfraprado)
        with ESMTPSA id ABEA51F46F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1651872756;
        bh=7/ruMOw9euAiDMHjfy/tYPDDLSQ2ojwszbkys9iXdo8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cyOHKSKEm0Xl8bq7Ms0QZLOsaU/N6hUKUV6TpMGAReQ1A6WY6leaqWNUJfgviOnCf
         OGPhAvVL2lmDWpsdiWjVz1H2p6ldfa6xpevW8ZbRn1mxDuZ94NLQAaOQPoBW5kr24W
         JMAMXFneC5iwv/XgHH5+bM8WBp9BUnCbIkEtXoAkp0u7rtVpm0J1FIRG2Uu3dcDGEo
         47l3VZSE78ZM+jmj3HORqEXuoP4c4P5vN/OTavCHPbTPxXq782c4mM6cDAs+nS7lxM
         j7G/gtFGS0OMz4IQA2kjs/Mit4Za3N11h5GPJXSUIy4wj7lZ2rn/Bi/4MdreXeugE/
         lRe86rpNYlZRA==
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
Subject: [PATCH v4 2/2] dt-bindings: remoteproc: mediatek: Add optional memory-region to mtk,scp
Date:   Fri,  6 May 2022 17:32:26 -0400
Message-Id: <20220506213226.257859-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220506213226.257859-1-nfraprado@collabora.com>
References: <20220506213226.257859-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The SCP co-processor can optionally be passed a reserved memory region
to use. Add this property in the dt-binding.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>

---

(no changes since v2)

Changes in v2:
- Dropped type and description since it's a well-known property
- Set maxItems to 1

 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index e1793a85e610..b0503146d7fe 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -42,6 +42,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.36.0

