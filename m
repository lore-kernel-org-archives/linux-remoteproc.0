Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BC1C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 29 Apr 2022 21:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbiD2VOl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 29 Apr 2022 17:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiD2VOk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 29 Apr 2022 17:14:40 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B66CE665;
        Fri, 29 Apr 2022 14:11:20 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nfraprado)
        with ESMTPSA id D8AF81F4699C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1651266679;
        bh=vGQAjdZ3iJkV/fg/QPQxJzmeLpJuTQKMjR6O+7rTCyM=;
        h=From:To:Cc:Subject:Date:From;
        b=h9q+nV9PaAmxttoiUWaF2CEscgxVP6cAHHnaATFnuPcanNTj3Z2GcgHF3L44AMOHZ
         K7DbzQ90OjkguYL94vYwVnkNSnvAzKs9gHDH6wGQgypYBp6xzE8y7j315K1rdHKP/T
         Ln/hG4pj/wD0Kv9ou2nQrIMiea2yK/iA2A4IHVZUyaayf4cLmrXoUI/VA8GYFjsQbe
         fhduhwHgHI30Ugk6jkkCB3upZ396tTtl1YNaawyf/99d8qQYanIxQ/JtlV2YX9WTJF
         tumohQfwV5gwO2qeQvlmnkR6rZQhdBFLlXQ/HXNVq6MTfnxyhhwn4rBjeRq26aaNjQ
         qKl20RGld6Wrg==
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
Subject: [PATCH 0/2] Mediatek SCP dt-binding tweaks
Date:   Fri, 29 Apr 2022 17:11:08 -0400
Message-Id: <20220429211111.2214119-1-nfraprado@collabora.com>
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


Nícolas F. R. A. Prado (2):
  dt-bindings: remoteproc: mediatek: Fix optional reg-names for mtk,scp
  dt-bindings: remoteproc: mediatek: Add optional memory-region to
    mtk,scp

 .../devicetree/bindings/remoteproc/mtk,scp.yaml  | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

-- 
2.36.0

