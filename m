Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07635C433EF
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Feb 2022 13:53:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbiB0Ny2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 27 Feb 2022 08:54:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbiB0NyW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 27 Feb 2022 08:54:22 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B4314026
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 05:53:44 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C7A083FCA5
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645970021;
        bh=x+DOMuEjhXppqlmSDNC0RKdzUzslcBqDhsGS9OsoQS4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=TVOVbta0ueT8ZRURaUSUSMpiCRWXCaUi2ZGIkk6uD7987ADPOR5ImN8CseFr1uncU
         lvz5fH+do659CaVP1MZQdPXe0YuNqBT1i6fg8rmzXDSLJm4/o/pd+7DNcIyAw8EWxt
         2HhMlH1L397N8uP0NwnNY+SfZVkWlYDmLQ0i7u7qnCOIE4VJOGEchiQn+mXcDO+VFI
         7guOPGBfMCgdfUXtG0e6qh4ggfA4WL6WANe/imQ4fPSNgZTeB+m5mbCWIL6dZEM4Jh
         U3Oj5Q+YNKSGnra0mxalKc/jPgcJbtAI0yRqnocGgl+0uR3ZX3BMcGHXnMd0OIZNcB
         xEG6pyVhMh1HQ==
Received: by mail-ed1-f69.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso4235632edt.20
        for <linux-remoteproc@vger.kernel.org>; Sun, 27 Feb 2022 05:53:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x+DOMuEjhXppqlmSDNC0RKdzUzslcBqDhsGS9OsoQS4=;
        b=PlIoqWHTpv4FeVX812scwNa/+8Zw0z+2NoBs2zh4beS3zRfYIlGndjtKBiG520wbuU
         t94EjxpmAur18sD7DnsYBfhXCyBhxoR2yHrrYbSJ5kajoXP/uIgDCct8MUU5FqrS0Gas
         lpUnkTv+Gr/UTyiPcT6ausgFFInOQa5/bEhgfxJPQXB7GiEX/cXLKymgzTt129mGSaSa
         5MsxbgKRrTvbwIjXKJIXIaYXljAteZcBuc/xgu4oSFfV3+9OqPmFqiGXi5uGiyLMmqFL
         u/SXQi7JF0ytrpz4BPi5C6JPun17KdZL+/PwLk6nYrKwuy7clUhRjglT5UcJQs4hVwja
         U0hw==
X-Gm-Message-State: AOAM532vf9eOpflv07j1/2cM4CQmunWStpmvTpDroeL9XnRbKuMAHzU2
        RuTw58hvgaeUGbYaY96wrr4X1P2EJt5EytFv5bW6X88T7qUOoQIVkg6GiNaQrAncF6BMehx6TQB
        pwqwqxcV5bmVD3nd6r9b5YnOUAJUrtMf8cDh/7qUM+6B/ZIA=
X-Received: by 2002:a17:906:354f:b0:6b4:1449:2d03 with SMTP id s15-20020a170906354f00b006b414492d03mr13078913eja.197.1645970019291;
        Sun, 27 Feb 2022 05:53:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLkm/ya1hWTxNWHY0owECzZBrknUNuVIsi2Y1TI9mIZSzwklvOz9AjjK7v7g0U5lSZuOzjqQ==
X-Received: by 2002:a17:906:354f:b0:6b4:1449:2d03 with SMTP id s15-20020a170906354f00b006b414492d03mr13078900eja.197.1645970019102;
        Sun, 27 Feb 2022 05:53:39 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id w11-20020a056402128b00b00412ec3f5f74sm4600760edv.62.2022.02.27.05.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 05:53:38 -0800 (PST)
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
Subject: [PATCH v3 09/11] clk: imx: scu: Fix kfree() of static memory on setting driver_override
Date:   Sun, 27 Feb 2022 14:53:27 +0100
Message-Id: <20220227135329.145862-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
References: <20220227135214.145599-1-krzysztof.kozlowski@canonical.com>
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
index 083da31dc3ea..4b2268b7d0d0 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -683,7 +683,12 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 		return ERR_PTR(ret);
 	}
 
-	pdev->driver_override = "imx-scu-clk";
+	ret = driver_set_override(&pdev->dev, &pdev->driver_override,
+				  "imx-scu-clk", strlen("imx-scu-clk"));
+	if (ret) {
+		platform_device_put(pdev);
+		return ERR_PTR(ret);
+	}
 
 	ret = imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
 	if (ret)
-- 
2.32.0

