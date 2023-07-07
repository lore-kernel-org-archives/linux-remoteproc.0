Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41BFEB64D9
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 Jul 2023 23:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjGGXZR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 Jul 2023 19:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjGGXZR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 Jul 2023 19:25:17 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B8E2106;
        Fri,  7 Jul 2023 16:25:15 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 1AA5386307;
        Sat,  8 Jul 2023 01:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1688772303;
        bh=KyuDqypJqy4PITTMyrCUAaIaAbCclPHKKt5tlXM8dzM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZyOcr2ZQEpDJvhWYgjCibSlekvgvTXPxBEvwzug9IgHGBvur6mZ5uROch1sqHkNF7
         XAg6+fgWlXroJA6KkM4k6gojGuUY5Dtq/JNoy+lEhbDg8+/5kb9K8GzCTc+VutW6Yd
         fxIg7q4Dow6GXHzuy+atNsl4FhvU9IqgyK7Tsag7wLpxYvUXuORZ7ma+daVaXwWo7n
         wdRci9doseKkic39f1lT6n0Yy0cWxdFwKrMVs5REXqyk0LrO3oAAX6Zcf5+q0kdkaX
         2lZjSdX82ocFp1UE3DB9kOvdT14iE3IJhC2djpmXP5YhLJJ0s3Ld0wec1qyHhlRrZx
         jaTSofE1V1r1w==
From:   Marek Vasut <marex@denx.de>
To:     linux-remoteproc@vger.kernel.org
Cc:     Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Ye Li <ye.li@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] remoteproc: imx_rproc: add start up delay
Date:   Sat,  8 Jul 2023 01:24:44 +0200
Message-Id: <20230707232444.374431-2-marex@denx.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230707232444.374431-1-marex@denx.de>
References: <20230707232444.374431-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

There is case that after remoteproc start remote processor[M4], the M4
runs slow and before M4 finish its own rpmsg framework initialization,
linux sends out vring kick message, then M4 firmware drops the kick
message. Some NXP released Cortex-M[x] images has such limitation that
it requires linux sends out vring kick message after M4 firmware finish
its rpmsg framework initialization.

Reviewed-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Ye Li <ye.li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Note: picked from NXP downstream LF-6630-2 remoteproc: imx_rproc: add start up delay
https://github.com/nxp-imx/linux-imx.git 0b1b91c95b291a3b60d6224b13f6a95a75896abf
---
Note: Literally all of the NXP BSP 2.13.0 firmware builds fail to boot
      without this being set to something like 50..500 ms , so this is
      rather useful to have.
---
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-remoteproc@vger.kernel.org
---
 drivers/remoteproc/imx_rproc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index f9874fc5a80ff..d0eb96d6a4fe1 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -6,6 +6,7 @@
 #include <dt-bindings/firmware/imx/rsrc.h>
 #include <linux/arm-smccc.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
 #include <linux/interrupt.h>
@@ -110,6 +111,7 @@ struct imx_rproc {
 	u32				core_index;
 	struct device                   **pd_dev;
 	struct device_link              **pd_dev_link;
+	u32				startup_delay;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -382,6 +384,9 @@ static int imx_rproc_start(struct rproc *rproc)
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
 
+	if (priv->startup_delay)
+		msleep(priv->startup_delay);
+
 	return ret;
 }
 
@@ -1090,6 +1095,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
 
+	ret = of_property_read_u32(dev->of_node, "fsl,startup-delay-ms", &priv->startup_delay);
+	if (ret)
+		priv->startup_delay = 0;
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
-- 
2.40.1

