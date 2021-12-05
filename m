Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F28C433EF
	for <linux-remoteproc@archiver.kernel.org>; Sun,  5 Dec 2021 11:14:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233148AbhLELRl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 5 Dec 2021 06:17:41 -0500
Received: from www381.your-server.de ([78.46.137.84]:34500 "EHLO
        www381.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbhLELRk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 5 Dec 2021 06:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
         s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=3NKA9QP2Ld0dX0BX7RFASKp7umcZ+OrDPsg00zFz0JE=; b=l/VraHCMFMFAOIvdsFMZ/GtMNe
        JywprXw8oXYXsSxphsuFc1NOnVIxY4FZTi0Dpr2ABRd40Gsh/QIFbNqa0Ly4HnXgNYdjUTNqovn2u
        A/7sUYFquN8eEVG935oLz+FeywS0ebtFmfGhAEdwWfWs+AT4tPYgu0Wio2s8CH5nlYGRhT6x4B/Wu
        AozMvKXVHIfE3QwetROp/+8OhB/p3F8yhQ2WqruNVZCeCXp4LTptQulZS9zclPAUuLIGii2WkgJHi
        HvfgwaB7QIBNZsLMCQ3hI0lqiAvAfXflk0YDir3jPwyh8UO3CS0VdPHbdDA9xXyN71/5YvQ9suzvJ
        3tl6rQ8w==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <lars@metafoo.de>)
        id 1mtpTA-0002bs-7N; Sun, 05 Dec 2021 12:14:12 +0100
Received: from [2001:a61:2ba4:ec01:9e5c:8eff:fe01:8578] (helo=lars-desktop.fritz.box)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1mtpT9-0008iC-Ti; Sun, 05 Dec 2021 12:14:11 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>
Cc:     linux-remoteproc@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] remoteproc: ingenic: Request IRQ disabled
Date:   Sun,  5 Dec 2021 12:13:49 +0100
Message-Id: <20211205111349.51213-1-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26374/Sun Dec  5 10:24:12 2021)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The ingenic remoteproc driver requests its IRQ and then immediately
disables it.

The disable is necessary since irq_request() normally enables the IRQ. But
there is a new flag IRQF_NO_AUTOEN that when specified keeps the IRQ
disabled. Use this new flag rather than calling disable_irq().

This slightly reduce the boilerplate code and also avoids a theoretical
race condition where the IRQ could fire between irq_request() and
disable_irq().

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/remoteproc/ingenic_rproc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
index a356738160a4..9902cce28692 100644
--- a/drivers/remoteproc/ingenic_rproc.c
+++ b/drivers/remoteproc/ingenic_rproc.c
@@ -218,14 +218,13 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
 	if (vpu->irq < 0)
 		return vpu->irq;
 
-	ret = devm_request_irq(dev, vpu->irq, vpu_interrupt, 0, "VPU", rproc);
+	ret = devm_request_irq(dev, vpu->irq, vpu_interrupt, IRQF_NO_AUTOEN,
+			       "VPU", rproc);
 	if (ret < 0) {
 		dev_err(dev, "Failed to request IRQ\n");
 		return ret;
 	}
 
-	disable_irq(vpu->irq);
-
 	ret = devm_rproc_add(dev, rproc);
 	if (ret) {
 		dev_err(dev, "Failed to register remote processor\n");
-- 
2.30.2

