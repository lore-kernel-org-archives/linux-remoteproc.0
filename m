Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3D7C43217
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 May 2022 19:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387107AbiEBT2C (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 May 2022 15:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387089AbiEBT2B (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 May 2022 15:28:01 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1471FF1;
        Mon,  2 May 2022 12:24:31 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nfraprado)
        with ESMTPSA id EE26B1F43619
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1651519470;
        bh=XkLENWM+R3mXRcAnf7rx6wijc7C/RaUn71isMJVASJk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HVKO8pC3w6eYiPSquxenJQrMYI7U13/cmYQoDDE2VSCGKBJ/xAg0NBA4O+71HpmsD
         zuWLVrPr6/yfdIrfJIFS57Ftw6uinl16vDF9HSpDW9KN5tgHl6TZeYVQMVE6U/egZ6
         vEF9YxbLcFTyv3snK6oipLxlXeOOMSsE3Bb0e2ji7ckTovc83NEXPE32GJNf5xCAOw
         oFDzp7U/ThHiU71zgOO7RiITYVF45QYsoc1ntahTh58PsVMN5s6oC/hOKH+tHqLtzt
         zDz10r44TlOwBM/YVyLpnjOfxRW8PzebHhl6QGVWmukUAjY+LFFr8mDCqSyeOwknf1
         TcusRrYZWtckQ==
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
Subject: [PATCH v2 2/2] dt-bindings: remoteproc: mediatek: Add optional memory-region to mtk,scp
Date:   Mon,  2 May 2022 15:24:20 -0400
Message-Id: <20220502192420.2548512-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502192420.2548512-1-nfraprado@collabora.com>
References: <20220502192420.2548512-1-nfraprado@collabora.com>
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
I left out Angelo's R-b since of the 3 lines in the patch from v1, only
1 is left.

Changes in v2:
- Dropped type and description since it's a well-known property
- Set maxItems to 1

 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index ec9ddeb6ca2c..c6a92ac8db18 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -51,6 +51,9 @@ properties:
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

