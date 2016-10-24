Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH 1/5] remoteproc: Add q6v55 specific parameters and enable probing for q6v55
Date: Mon, 24 Oct 2016 21:25:55 +0530
Message-Id: <1477324559-24752-2-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1477324559-24752-1-git-send-email-akdwived@codeaurora.org>
References: <1477324559-24752-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, akdwived@codeaurora.org, kaushalk@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Adding required definition of parameters along with new structure
fields specific to q6v55 and enabling probe for q6v55 mss remote-
proc driver.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  3 +-
 drivers/remoteproc/qcom_q6v5_pil.c                 | 33 ++++++++++++++++++++--
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 57cb49e..0986f8b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -7,7 +7,8 @@ on the Qualcomm Hexagon core.
 	Usage: required
 	Value type: <string>
 	Definition: must be one of:
-		    "qcom,q6v5-pil"
+		    "qcom,q6v5-pil",
+			"qcom,q6v55-pil"
 
 - reg:
 	Usage: required
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 2e0caaa..8df95a0 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -30,13 +30,14 @@
 #include <linux/reset.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <linux/mutex.h>
 
 #include "remoteproc_internal.h"
 #include "qcom_mdt_loader.h"
 
 #include <linux/qcom_scm.h>
 
-#define MBA_FIRMWARE_NAME		"mba.b00"
+#define MBA_FIRMWARE_NAME		"mba.mbn"
 #define MPSS_FIRMWARE_NAME		"modem.mdt"
 
 #define MPSS_CRASH_REASON_SMEM		421
@@ -65,6 +66,8 @@
 #define QDSP6SS_RESET_REG		0x014
 #define QDSP6SS_GFMUX_CTL_REG		0x020
 #define QDSP6SS_PWR_CTL_REG		0x030
+#define QDSP6SS_MEM_PWR_CTL		0x0B0
+#define QDSP6SS_STRAP_ACC		0x110
 
 /* AXI Halt Register Offsets */
 #define AXI_HALTREQ_REG			0x0
@@ -93,13 +96,24 @@
 #define QDSS_BHS_ON			BIT(21)
 #define QDSS_LDO_BYP			BIT(22)
 
+/* QDSP6v55 parameters */
+#define QDSP6v55_LDO_BYP                BIT(25)
+#define QDSP6v55_BHS_ON                 BIT(24)
+#define QDSP6v55_CLAMP_WL               BIT(21)
+#define QDSP6v55_CLAMP_QMC_MEM          BIT(22)
+
+#define HALT_CHECK_MAX_LOOPS            (200)
+#define QDSP6SS_XO_CBCR                 (0x0038)
+
+#define QDSP6SS_ACC_OVERRIDE_VAL	0x20
+
 struct q6v5 {
 	struct device *dev;
 	struct rproc *rproc;
 
 	void __iomem *reg_base;
 	void __iomem *rmb_base;
-
+	void __iomem *restart_reg;
 	struct regmap *halt_map;
 	u32 halt_q6;
 	u32 halt_modem;
@@ -115,6 +129,13 @@ struct q6v5 {
 	struct clk *ahb_clk;
 	struct clk *axi_clk;
 	struct clk *rom_clk;
+	struct clk *gpll0_mss_clk;
+	struct clk *snoc_axi_clk;
+	struct clk *mnoc_axi_clk;
+
+	struct clk *xo;
+	struct clk *pnoc_clk;
+	struct clk *qdss_clk;
 
 	struct completion start_done;
 	struct completion stop_done;
@@ -128,13 +149,18 @@ struct q6v5 {
 	phys_addr_t mpss_reloc;
 	void *mpss_region;
 	size_t mpss_size;
+	struct mutex q6_lock;
+	u32 boot_count;
+	bool unvote_flag;
+	bool is_q6v55;
+	bool ahb_clk_vote;
 };
 
 enum {
 	Q6V5_SUPPLY_CX,
 	Q6V5_SUPPLY_MX,
-	Q6V5_SUPPLY_MSS,
 	Q6V5_SUPPLY_PLL,
+	Q6V5_SUPPLY_MSS,
 };
 
 static int q6v5_regulator_init(struct q6v5 *qproc)
@@ -892,6 +918,7 @@ static int q6v5_remove(struct platform_device *pdev)
 
 static const struct of_device_id q6v5_of_match[] = {
 	{ .compatible = "qcom,q6v5-pil", },
+	{ .compatible = "qcom,q6v55-pil", },
 	{ },
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
