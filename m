Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12ACDC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Feb 2022 13:28:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbiBVN3N (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Feb 2022 08:29:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbiBVN3L (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Feb 2022 08:29:11 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 109A896838
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Feb 2022 05:28:46 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3D152405CE
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Feb 2022 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645536524;
        bh=6XeuQoqUzMUksn+ZuaBzNCPcuTk2LLoHTJkT0DsbDHY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=l+jSuB5kQ1lmyW8rQz/DZ+VWC8Igl1AmWR1AMEFpj+kkXQh/BWl7WEUvUIug41P8c
         4iokWU//2k/s9MKrbVJWqyuc1GO7u0N7h9kJVI4+hF6Mcn+4ejsrLbxu4RPE3Pd22O
         +0Zi4aVNZzH1i7gfyViiXiSi5o0anowWH9xwWw/TL9M49aYH8WAu8N6NnEHDVHAn+c
         1CFraz2N6vPJIz55V12MqPgsghOvdwA7Fe2XctHy5Oliz8ab0wR8atBP4X5tpYeFlX
         TcfTYJPYL6affSA2qOoTAVCeDniCm56t1pVREpQCc1WJcFi8ie/bh98SpFbMljpGN+
         rqcSNZQtqI/Kg==
Received: by mail-ej1-f70.google.com with SMTP id i20-20020a17090671d400b006d0ed9c68c1so2490914ejk.14
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Feb 2022 05:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6XeuQoqUzMUksn+ZuaBzNCPcuTk2LLoHTJkT0DsbDHY=;
        b=0k9NByeRx8aZIHidZ5x+DPCRVDBIHsixuvbUC87oM16czARyZqxaUVQ06bnJDaxok4
         xPYFAqb6K3MJU+EJ2S13YEXBhOQyKjs+Znv5mMXr2kp1RyMgfBF8QY7CNfLYLQkuNVM/
         ZQqM1n/dsv8rjayykqbTiLWnrF/15S0txOnuuvc3NjCZMeTaA9pTdnF5YpUW/VvulHh0
         wMu701Zny2fkrEYVoMnpHlf+6zmfd908C1nXUTDPta02DqciJEBS7bSL1bL72E4X3L2b
         4nUMrSNCeWOYxmcJmsGPzpNKPf6kZM0ZNObgg9Tmw6giJeTI8cDpF2WD1s40xFOeJghq
         lq+A==
X-Gm-Message-State: AOAM530fc8EUsGAF3V5FU5c/mqAjXleIYz2aASVQ9S+lkyDWJB3E/xlO
        kXDibbbWU7s1HaS/SnBR6y0hKZIPadTYBGC9HxBA/KouQvCN1NIppVZ+xPXtf+cJmoVeyOCy/au
        tgChpK4ZyqHRXzZP8ZP6EaHq9qHqNbpYQkE3q949rbGdy6tE=
X-Received: by 2002:a17:906:1656:b0:6cf:571c:f91d with SMTP id n22-20020a170906165600b006cf571cf91dmr19602327ejd.377.1645536523431;
        Tue, 22 Feb 2022 05:28:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymWh8nTis0+whBJdlEUIaYxkLfPNPRZyT/AbiwgON8MIxb/gad15tlt22GRXjxl9FycTeAJw==
X-Received: by 2002:a17:906:1656:b0:6cf:571c:f91d with SMTP id n22-20020a170906165600b006cf571cf91dmr19602313ejd.377.1645536523213;
        Tue, 22 Feb 2022 05:28:43 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id c5sm10029875edk.43.2022.02.22.05.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 05:28:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        stable@vger.kernel.org
Subject: [RFT PATCH 2/3] slimbus: qcom-ngd: fix kfree() of const memory on setting driver_override
Date:   Tue, 22 Feb 2022 14:27:06 +0100
Message-Id: <20220222132707.266883-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The driver_override field from platform driver should not be initialized
from const memory because the core later kfree() it, for example when
driver_override is set via sysfs.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 7040293c2ee8..5987d8f8a8fd 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1455,7 +1455,14 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 		}
 		ngd->id = id;
 		ngd->pdev->dev.parent = parent;
-		ngd->pdev->driver_override = QCOM_SLIM_NGD_DRV_NAME;
+		ngd->pdev->driver_override = kstrdup(QCOM_SLIM_NGD_DRV_NAME,
+						     GFP_KERNEL);
+		if (!ngd->pdev->driver_override) {
+			platform_device_put(ngd->pdev);
+			kfree(ngd);
+			of_node_put(node);
+			return -ENOMEM;
+		}
 		ngd->pdev->dev.of_node = node;
 		ctrl->ngd = ngd;
 
-- 
2.32.0

