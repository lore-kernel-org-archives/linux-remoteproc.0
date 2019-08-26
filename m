Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH] remoteproc: stm32: clear MCU PDDS at firmware start
Date: Mon, 26 Aug 2019 17:38:06 +0200
Message-ID: <1566833886-16571-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

When remoteproc stops a firmware, it sets the MCU PDDS flag, allowing
the platform to reach the Standby power mode if needed.
Symmetrically, clear this flag before running a firmware.
This fixes the issue where the system goes to Standby mode when the
MCU crashes while MPU is in CSTOP mode.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index e2da719..1c95913 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -383,10 +383,21 @@ static void stm32_rproc_add_coredump_trace(struct rproc *rproc)
 
 static int stm32_rproc_start(struct rproc *rproc)
 {
+	struct stm32_rproc *ddata = rproc->priv;
 	int err;
 
 	stm32_rproc_add_coredump_trace(rproc);
 
+	/* clear remote proc Deep Sleep */
+	if (ddata->pdds.map) {
+		err = regmap_update_bits(ddata->pdds.map, ddata->pdds.reg,
+					 ddata->pdds.mask, 0);
+		if (err) {
+			dev_err(&rproc->dev, "failed to clear pdds\n");
+			return err;
+		}
+	}
+
 	err = stm32_rproc_set_hold_boot(rproc, false);
 	if (err)
 		return err;
-- 
2.7.4
