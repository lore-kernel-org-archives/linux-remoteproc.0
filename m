Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39860C433FE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Feb 2022 19:16:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244323AbiBWTQ1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Feb 2022 14:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244322AbiBWTQZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Feb 2022 14:16:25 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD6D41628
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Feb 2022 11:15:55 -0800 (PST)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C795B3F1CF
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Feb 2022 19:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645643747;
        bh=WWBR/3RyyId0ctzqGYcSjorUZAyYEVp2bjQXWveQ/28=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=TjeopNUz7/nbBI+UMG2CszLnUYtmxUu7jy/oPyj9nNVoCoH3pBJqQZ53aBE7KP8FX
         32woSHF9PCaU/BMTPYc8ymO61BIwiL/gz4V1HcFadjsjESczGBUWcIpqkcoZZutR1Y
         bc9GIdYl2XAlkFk1h0E0LzmXhGWo/dFS+/ZCIkBhPRtLv4HmoSdKJbtk2+7MLYHGd9
         oILj5Am51qAfssbfQOmaTeLZjLRaoey0s+4SIgANNNgD6JsUe05BNMsmid89rYBIpn
         v1WRAt9pWG9WhYyBCwDSN1XDglalUWLCelqtCMBoG9E18oVH2yu5P9+xili2h4QOR3
         VGyo5u9PBJf3g==
Received: by mail-wr1-f70.google.com with SMTP id t8-20020adfa2c8000000b001e8f6889404so8607567wra.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Feb 2022 11:15:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WWBR/3RyyId0ctzqGYcSjorUZAyYEVp2bjQXWveQ/28=;
        b=VDgiIbx+waspZt2uK0cXF+FyUPzCCurX0pkLoaCwgs/yQbUY36Bf6UwOy8V2wsgOjB
         c2WLrZEFaMbO4bUmNOK+GMB/zf1p/VoinoOulOlcnsaEMmuVK/9W6KLWmz9znrIT80vB
         XSZk5g4fXwt6DMb3X0aODNjWCgKRFPhdTcFL+8hKZBI2BZJmYICvJbI7XRMapWNANDpT
         KXHj5vpHtTdd7PoOFaKrKNR50uCR0aXNeaCkMUO7F663LD1jQsZfP4H8f09n7GxABlLi
         zZONil9ovfT1lI/v7Mz8TlwRoqxWcxNJQ3+Q7wJlCYqXs/YnJchmAcB1QNKsZFodDIsN
         LEcA==
X-Gm-Message-State: AOAM532xzPrx/Fe0tGR0TkhV795BvA48zLCU7l1Q1p5o3PMuSzmuaO2o
        aVrJzWlII14t45Ecy/+fhzAKr6uamQG/fsTvYEACaqPHNrmxBoGU8r+cq21mBqhJTttre1/pJav
        ZL520s1zqmJD8GHQfwR/5h4+7JiVtlFGjmCHWS/tM7pMDrtE=
X-Received: by 2002:a05:6402:70d:b0:410:ba4d:736f with SMTP id w13-20020a056402070d00b00410ba4d736fmr891841edx.0.1645643727231;
        Wed, 23 Feb 2022 11:15:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8vcySNYfbv43Pk2WXynTAOxXboVgUUSRQKZSxFWxW+kHULs5hedJTU2eFScz4UFZao2eyYQ==
X-Received: by 2002:a05:6402:70d:b0:410:ba4d:736f with SMTP id w13-20020a056402070d00b00410ba4d736fmr891811edx.0.1645643727044;
        Wed, 23 Feb 2022 11:15:27 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id b3sm208368ejl.67.2022.02.23.11.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 11:15:26 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        stable@vger.kernel.org
Subject: [PATCH v2 09/11] clk: imx: scu: fix kfree() of static memory on setting driver_override
Date:   Wed, 23 Feb 2022 20:14:39 +0100
Message-Id: <20220223191441.348109-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The driver_override field from platform driver should not be initialized
from static memory (string literal) because the core later kfree() it,
for example when driver_override is set via sysfs.

Use dedicated helper to set driver_override properly.

Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/imx/clk-scu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 083da31dc3ea..15e1d670e51f 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -683,7 +683,12 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 		return ERR_PTR(ret);
 	}
 
-	pdev->driver_override = "imx-scu-clk";
+	ret = driver_set_override(&pdev->dev, &pdev->driver_override,
+				  "imx-scu-clk");
+	if (ret) {
+		platform_device_put(pdev);
+		return ret;
+	}
 
 	ret = imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
 	if (ret)
-- 
2.32.0

