Return-Path: <afa@pengutronix.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH] remoteproc: stm32: demote warning about optional property absence
Date: Mon, 24 Feb 2020 18:25:19 +0100
Message-Id: <20200224172519.15315-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>, linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The mainline device trees lack the "st,syscfg-pdds", so probing the
driver always throws the warning. As the property is optional per binding
and the driver can deal with its absence, demote the warning to info log
level.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a18f88044111..2e07a95439c8 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -602,7 +602,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	err = stm32_rproc_get_syscon(np, "st,syscfg-pdds", &ddata->pdds);
 	if (err)
-		dev_warn(dev, "failed to get pdds\n");
+		dev_info(dev, "failed to get pdds\n");
 
 	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
 
-- 
2.25.0
