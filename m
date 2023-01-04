Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49DFC4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Jan 2023 11:53:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234344AbjADLxy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Jan 2023 06:53:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbjADLxx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Jan 2023 06:53:53 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8F51ADA2;
        Wed,  4 Jan 2023 03:53:52 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 3EFF26602D0C;
        Wed,  4 Jan 2023 11:53:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1672833230;
        bh=vGIrNPLCcr65JC/O+0PWf40qVae7K+5q7WHDW1Hum3I=;
        h=From:To:Cc:Subject:Date:From;
        b=b2FCOK98a4NnyLgDjVuYNeWlwidB/dngUfZHKU7IG4U96Pw11t475t5qr7V7bY7Vh
         74ELdP0Oo82eudalTqnb6E8nzEZ/Pxcd5uoxqwvZOEIsthD6P67YKML3LJ59KdueK6
         eSLumbEPXBBNKeZvmxLsgYQZO3BiCfXA3wju5y8i9///nDvpKJ//lCkPXqMpPgTgaS
         xX5gR06MUqxDQLpTE2Alxb1QA2+uTr4OXljkn5CdrPWIzcBaY7ndfVrXTStu5H2JGZ
         eNWPxiEGWjkQGlA9vQr6aB25YOOUypkxEW60C+5dMC/y8zQGIB4K7/ved00ypkSN4Z
         4aqK7g0hPQg6g==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     andersson@kernel.org
Cc:     mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        wenst@chromium.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/2] MediaTek SCP IPI cleanups
Date:   Wed,  4 Jan 2023 12:53:39 +0100
Message-Id: <20230104115341.320951-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Cleanups bringing no functional changes.
Tested on MT8173 Elm, MT8192 Asurada, MT8195 Tomato.

This series applies only on top of [1].

[1]: https://lore.kernel.org/lkml/20230104083110.736377-1-wenst@chromium.org/

AngeloGioacchino Del Regno (2):
  remoteproc/mtk_scp: Use readl_poll_timeout_atomic() for polling
  remoteproc/mtk_scp: Remove timeout variable from scp_ipi_send()

 drivers/remoteproc/mtk_scp_ipi.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

-- 
2.39.0

