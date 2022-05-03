Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A473C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 May 2022 21:11:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242655AbiECVPC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 3 May 2022 17:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiECVPA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 3 May 2022 17:15:00 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E0D3587E;
        Tue,  3 May 2022 14:11:27 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nfraprado)
        with ESMTPSA id 613F91F41693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1651612286;
        bh=b6/DfUMzFN0FDTboudtmnTW/K0RtsVzlnmRHB0NutEY=;
        h=From:To:Cc:Subject:Date:From;
        b=HP96vztyI0eC4J/ls+gpZ/TFO5BN2+VM6gebHlvDI371amS3BySvEreWV+QMIc6yd
         b2NtPVywkw3RJRFgZdAH5JvlOMI8eCXw5hWdt1Z+yKh3Ee3TJu/gxjeDipTMz48oHO
         GV1R6cR4urofebnSpAjOORHVzAZsX1pDslrY/J3CbXcwHU8fgYirWmloCSi3y6YceQ
         KrqgaMuI3N5n+7T3tebwLGrwLm85gx/kt4JEEKWOGpzJJpvOOJMsXjnvj4y/lniGNJ
         xm1EVbZLC9d0lC7pCGlbn5ugFtv7+DxnCPIq71J0JfgHL7dRUKZWznYz2R5v1RyCgS
         1URLtOiA07FQw==
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
Subject: [PATCH v3 0/2] Mediatek SCP dt-binding tweaks
Date:   Tue,  3 May 2022 17:11:12 -0400
Message-Id: <20220503211114.2656099-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


Two simple patches for the Mediatek SCP dt-binding. The first fixes the
reg/reg-names property while the second adds a new optional
memory-region property.

v2: https://lore.kernel.org/all/20220502192420.2548512-1-nfraprado@collabora.com
v1: https://lore.kernel.org/all/20220429211111.2214119-1-nfraprado@collabora.com

Changes in v3:
- Made the cfg reg required again. After looking again into the mtk-scp
  driver, only l1tcm is optional.

Changes in v2:
- Dropped type and description from memory-region since it's a
  well-known property
- Set memory-region maxItems to 1

Nícolas F. R. A. Prado (2):
  dt-bindings: remoteproc: mediatek: Make l1tcm reg optional for mtk,scp
  dt-bindings: remoteproc: mediatek: Add optional memory-region to
    mtk,scp

 .../devicetree/bindings/remoteproc/mtk,scp.yaml          | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.36.0

