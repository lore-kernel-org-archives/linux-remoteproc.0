Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH 1/2] driver: rproc: q6v5_pil: driver changes to validate mss boot on 8996
Date: Thu, 20 Oct 2016 22:47:28 +0530
Message-Id: <1476983849-26244-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, spjoshi@qti.qualcomm.com, kaushalk@qti.qualcomm.com, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>

Driver changes to validate mss boot on 8996, driver has been validated
on kernel tip after pulling glink, smd-rpm clk driver, smd-rpm regulator
etc. driver changes.

but patch consist only pil driver related changes, and those dependencies
which were required to compil on tip.

this is initial version to get first hand comment and hence being mailed
only to remoteproc list.

Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 788 +++++++++++++++++++++++++++----------
 1 file changed, 579 insertions(+), 209 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 2e0caaa..7f573fb 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -23,24 +23,38 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/smem.h>
+#include <linux/iopoll.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <linux/mutex.h>
 
 #include "remoteproc_internal.h"
 #include "qcom_mdt_loader.h"
 
 #include <linux/qcom_scm.h>
 
-#define MBA_FIRMWARE_NAME		"mba.b00"
+#define MBA_FIRMWARE_NAME		"mba.mbn"
 #define MPSS_FIRMWARE_NAME		"modem.mdt"
 
 #define MPSS_CRASH_REASON_SMEM		421
 
+/* PBL/MBA interface registers */
+#define RMB_MBA_IMAGE			0x00
+#define RMB_PBL_STATUS			0x04
+#define RMB_MBA_COMMAND			0x08
+#define RMB_MBA_STATUS			0x0C
+#define RMB_PMI_META_DATA		0x10
+#define RMB_PMI_CODE_START		0x14
+#define RMB_PMI_CODE_LENGTH		0x18
+#define RMB_PROTOCOL_VERSION		0x1C
+#define RMB_MBA_DEBUG_INFORMATION	0x20
+
 /* RMB Status Register Values */
 #define RMB_PBL_SUCCESS			0x1
 
@@ -49,37 +63,33 @@
 #define RMB_MBA_META_DATA_AUTH_SUCCESS	0x3
 #define RMB_MBA_AUTH_COMPLETE		0x4
 
-/* PBL/MBA interface registers */
-#define RMB_MBA_IMAGE_REG		0x00
-#define RMB_PBL_STATUS_REG		0x04
-#define RMB_MBA_COMMAND_REG		0x08
-#define RMB_MBA_STATUS_REG		0x0C
-#define RMB_PMI_META_DATA_REG		0x10
-#define RMB_PMI_CODE_START_REG		0x14
-#define RMB_PMI_CODE_LENGTH_REG		0x18
-
 #define RMB_CMD_META_DATA_READY		0x1
 #define RMB_CMD_LOAD_READY		0x2
 
 /* QDSP6SS Register Offsets */
-#define QDSP6SS_RESET_REG		0x014
-#define QDSP6SS_GFMUX_CTL_REG		0x020
-#define QDSP6SS_PWR_CTL_REG		0x030
+#define QDSP6SS_RESET			0x014
+#define QDSP6SS_GFMUX_CTL		0x020
+#define QDSP6SS_PWR_CTL			0x030
+#define QDSP6V6SS_MEM_PWR_CTL		0x034
+#define QDSP6SS_BHS_STATUS		0x078
+#define QDSP6SS_MEM_PWR_CTL		0x0B0
+#define QDSP6SS_STRAP_ACC		0x110
+#define QDSP6V62SS_BHS_STATUS		0x0C4
 
 /* AXI Halt Register Offsets */
 #define AXI_HALTREQ_REG			0x0
 #define AXI_HALTACK_REG			0x4
 #define AXI_IDLE_REG			0x8
 
-#define HALT_ACK_TIMEOUT_MS		100
+#define HALT_ACK_TIMEOUT_US		100000
 
 /* QDSP6SS_RESET */
 #define Q6SS_STOP_CORE			BIT(0)
 #define Q6SS_CORE_ARES			BIT(1)
-#define Q6SS_BUS_ARES_ENABLE		BIT(2)
+#define Q6SS_BUS_ARES_ENA		BIT(2)
 
 /* QDSP6SS_GFMUX_CTL */
-#define Q6SS_CLK_ENABLE			BIT(1)
+#define Q6SS_CLK_ENA			BIT(1)
 
 /* QDSP6SS_PWR_CTL */
 #define Q6SS_L2DATA_SLP_NRET_N_0	BIT(0)
@@ -93,28 +103,56 @@
 #define QDSS_BHS_ON			BIT(21)
 #define QDSS_LDO_BYP			BIT(22)
 
+/* QDSP6v55 parameters */
+#define QDSP6v55_LDO_ON                 BIT(26)
+#define QDSP6v55_LDO_BYP                BIT(25)
+#define QDSP6v55_BHS_ON                 BIT(24)
+#define QDSP6v55_CLAMP_WL               BIT(21)
+#define QDSP6v55_CLAMP_QMC_MEM          BIT(22)
+#define L1IU_SLP_NRET_N                 BIT(15)
+#define L1DU_SLP_NRET_N                 BIT(14)
+#define L2PLRU_SLP_NRET_N               BIT(13)
+#define QDSP6v55_BHS_EN_REST_ACK        BIT(0)
+
+#define HALT_CHECK_MAX_LOOPS            (200)
+#define BHS_CHECK_MAX_LOOPS             (200)
+#define QDSP6SS_XO_CBCR                 (0x0038)
+
+#define QDSP6SS_ACC_OVERRIDE_VAL	0x20
+#define STATUS_PBL_SUCCESS		0x1
+
+#define POLL_INTERVAL_US		50
+
+
+
 struct q6v5 {
 	struct device *dev;
 	struct rproc *rproc;
 
 	void __iomem *reg_base;
 	void __iomem *rmb_base;
-
-	struct regmap *halt_map;
-	u32 halt_q6;
-	u32 halt_modem;
-	u32 halt_nc;
+	void __iomem *restart_reg;
+	void __iomem *axi_halt_q6;
+	void __iomem *axi_halt_modem;
+	void __iomem *axi_halt_nc;
 
 	struct reset_control *mss_restart;
 
 	struct qcom_smem_state *state;
 	unsigned stop_bit;
 
-	struct regulator_bulk_data supply[4];
+	struct regulator_bulk_data supply[3];
 
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
@@ -128,12 +166,16 @@ struct q6v5 {
 	phys_addr_t mpss_reloc;
 	void *mpss_region;
 	size_t mpss_size;
+	bool ahb_clk_vote;
+
+	struct mutex q6_lock;
+	u32 boot_count;
+	bool unvote_flag;
 };
 
 enum {
 	Q6V5_SUPPLY_CX,
 	Q6V5_SUPPLY_MX,
-	Q6V5_SUPPLY_MSS,
 	Q6V5_SUPPLY_PLL,
 };
 
@@ -141,10 +183,9 @@ static int q6v5_regulator_init(struct q6v5 *qproc)
 {
 	int ret;
 
-	qproc->supply[Q6V5_SUPPLY_CX].supply = "cx";
-	qproc->supply[Q6V5_SUPPLY_MX].supply = "mx";
-	qproc->supply[Q6V5_SUPPLY_MSS].supply = "mss";
-	qproc->supply[Q6V5_SUPPLY_PLL].supply = "pll";
+	qproc->supply[Q6V5_SUPPLY_CX].supply = "vdd_cx";
+	qproc->supply[Q6V5_SUPPLY_MX].supply = "vdd_mx";
+	qproc->supply[Q6V5_SUPPLY_PLL].supply = "vdd_pll";
 
 	ret = devm_regulator_bulk_get(qproc->dev,
 				      ARRAY_SIZE(qproc->supply), qproc->supply);
@@ -153,40 +194,187 @@ static int q6v5_regulator_init(struct q6v5 *qproc)
 		return ret;
 	}
 
-	regulator_set_load(qproc->supply[Q6V5_SUPPLY_CX].consumer, 100000);
-	regulator_set_load(qproc->supply[Q6V5_SUPPLY_MSS].consumer, 100000);
-	regulator_set_load(qproc->supply[Q6V5_SUPPLY_PLL].consumer, 10000);
 
 	return 0;
 }
 
 static int q6v5_regulator_enable(struct q6v5 *qproc)
 {
-	struct regulator *mss = qproc->supply[Q6V5_SUPPLY_MSS].consumer;
 	struct regulator *mx = qproc->supply[Q6V5_SUPPLY_MX].consumer;
+	struct regulator *cx = qproc->supply[Q6V5_SUPPLY_CX].consumer;
+	struct regulator *vdd_pll = qproc->supply[Q6V5_SUPPLY_PLL].consumer;
 	int ret;
 
-	/* TODO: Q6V5_SUPPLY_CX is supposed to be set to super-turbo here */
+	ret = regulator_set_voltage(mx, INT_MAX, INT_MAX);
+	if (ret) {
+		dev_err(qproc->dev, "Failed to set voltage for vreg_mx\n");
+		return ret;
+	}
+
+	ret = regulator_enable(mx);
+	if (ret) {
+		dev_err(qproc->dev, "Failed to enable vreg_mx\n");
+		goto err_mx_enable;
+	}
+
+	ret = regulator_set_voltage(cx, INT_MAX, INT_MAX);
+	if (ret) {
+		dev_err(qproc->dev, "Failed to request vdd_cx voltage.\n");
+		goto err_cx_voltage;
+	}
+
+	ret = regulator_set_load(cx, 100000);
+	if (ret < 0) {
+		dev_err(qproc->dev, "Failed to set vdd_cx mode.\n");
+		goto err_cx_set_load;
+	}
+
+	ret = regulator_enable(cx);
+	if (ret) {
+		dev_err(qproc->dev, "Failed to vote for vdd_cx\n");
+		goto err_cx_enable;
+	}
 
-	ret = regulator_set_voltage(mx, 1050000, INT_MAX);
+	ret = regulator_set_voltage(vdd_pll, 1800000, 1800000);
+	if (ret) {
+		dev_err(qproc->dev, "Failed to set voltage for  vdd_pll\n");
+		goto err_vreg_pll_set_vol;
+	}
+
+	ret = regulator_set_load(vdd_pll, 10000);
+	if (ret < 0) {
+		dev_err(qproc->dev, "Failed to set vdd_pll mode.\n");
+		goto err_vreg_pll_load;
+	}
+
+	ret = regulator_enable(vdd_pll);
+	if (ret) {
+		dev_err(qproc->dev, "Failed to vote for vdd_pll\n");
+		goto err_vreg_pll_enable;
+	}
+
+	return 0;
+
+err_vreg_pll_enable:
+	regulator_set_load(vdd_pll, 0);
+err_vreg_pll_load:
+	regulator_set_voltage(vdd_pll, 0, INT_MAX);
+err_vreg_pll_set_vol:
+	regulator_disable(cx);
+err_cx_enable:
+	regulator_set_load(cx, 0);
+err_cx_set_load:
+	regulator_set_voltage(cx, 0, INT_MAX);
+err_cx_voltage:
+	regulator_disable(mx);
+err_mx_enable:
+	regulator_set_voltage(mx, 0, INT_MAX);
+
+	return ret;
+}
+
+static int q6v5_clk_enable(struct q6v5 *qproc)
+{
+	int ret;
+
+	ret = clk_prepare_enable(qproc->xo);
 	if (ret)
-		return ret;
+		goto out;
 
-	regulator_set_voltage(mss, 1000000, 1150000);
+	ret = clk_prepare_enable(qproc->pnoc_clk);
+	if (ret)
+		goto err_pnoc_vote;
 
-	return regulator_bulk_enable(ARRAY_SIZE(qproc->supply), qproc->supply);
+	ret = clk_prepare_enable(qproc->qdss_clk);
+	if (ret)
+		goto err_qdss_vote;
+
+	ret = clk_prepare_enable(qproc->ahb_clk);
+	if (ret)
+		goto err_ahb_clk;
+
+	ret = clk_prepare_enable(qproc->axi_clk);
+	if (ret)
+		goto err_axi_clk;
+
+	ret = clk_prepare_enable(qproc->rom_clk);
+	if (ret)
+		goto err_rom_clk;
+
+	ret = clk_prepare_enable(qproc->gpll0_mss_clk);
+	if (ret)
+		goto err_gpll0_mss_clk;
+
+	ret = clk_prepare_enable(qproc->snoc_axi_clk);
+	if (ret)
+		goto err_snoc_axi_clk;
+
+	ret = clk_prepare_enable(qproc->mnoc_axi_clk);
+	if (ret)
+		goto err_mnoc_axi_clk;
+
+	qproc->unvote_flag = false;
+	return 0;
+err_mnoc_axi_clk:
+	clk_disable_unprepare(qproc->snoc_axi_clk);
+err_snoc_axi_clk:
+	clk_disable_unprepare(qproc->gpll0_mss_clk);
+err_gpll0_mss_clk:
+	clk_disable_unprepare(qproc->rom_clk);
+err_rom_clk:
+	clk_disable_unprepare(qproc->axi_clk);
+err_axi_clk:
+	clk_disable_unprepare(qproc->ahb_clk);
+err_ahb_clk:
+	clk_disable_unprepare(qproc->qdss_clk);
+err_qdss_vote:
+	clk_disable_unprepare(qproc->pnoc_clk);
+err_pnoc_vote:
+	clk_disable_unprepare(qproc->xo);
+out:
+	dev_err(qproc->dev, "Clk Vote Failed\n");
+	return ret;
 }
 
-static void q6v5_regulator_disable(struct q6v5 *qproc)
+static void q6v5_clk_disable(struct q6v5 *qproc)
 {
-	struct regulator *mss = qproc->supply[Q6V5_SUPPLY_MSS].consumer;
-	struct regulator *mx = qproc->supply[Q6V5_SUPPLY_MX].consumer;
 
-	/* TODO: Q6V5_SUPPLY_CX corner votes should be released */
+	clk_disable_unprepare(qproc->mnoc_axi_clk);
+	clk_disable_unprepare(qproc->snoc_axi_clk);
+	clk_disable_unprepare(qproc->gpll0_mss_clk);
+	clk_disable_unprepare(qproc->rom_clk);
+	clk_disable_unprepare(qproc->axi_clk);
+	if (!qproc->ahb_clk_vote)
+		clk_disable_unprepare(qproc->ahb_clk);
+}
 
-	regulator_bulk_disable(ARRAY_SIZE(qproc->supply), qproc->supply);
-	regulator_set_voltage(mx, 0, INT_MAX);
-	regulator_set_voltage(mss, 0, 1150000);
+void q6v5_proxy_unvote(struct q6v5 *qproc)
+{
+	if (!qproc->unvote_flag) {
+		regulator_disable(qproc->supply[Q6V5_SUPPLY_PLL].consumer);
+		regulator_set_load(qproc->supply[Q6V5_SUPPLY_PLL].consumer, 0);
+		regulator_disable(qproc->supply[Q6V5_SUPPLY_CX].consumer);
+		regulator_set_load(qproc->supply[Q6V5_SUPPLY_CX].consumer, 0);
+		regulator_set_voltage(qproc->supply[Q6V5_SUPPLY_CX].consumer,
+			0, INT_MAX);
+
+		clk_disable_unprepare(qproc->qdss_clk);
+		clk_disable_unprepare(qproc->pnoc_clk);
+		clk_disable_unprepare(qproc->xo);
+
+		regulator_disable(qproc->supply[Q6V5_SUPPLY_MX].consumer);
+		regulator_set_voltage(qproc->supply[Q6V5_SUPPLY_MX].consumer,
+			0, INT_MAX);
+	}
+	qproc->unvote_flag = true;
+}
+
+static void pil_mss_restart_reg(struct q6v5 *qproc, u32 mss_restart)
+{
+	if (qproc->restart_reg) {
+		writel_relaxed(mss_restart, qproc->restart_reg);
+		udelay(2);
+	}
 }
 
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
@@ -203,6 +391,25 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
 	.load = q6v5_load,
 };
 
+static void modem_log_rmb_regs(void __iomem *base)
+{
+	pr_err("RMB_MBA_IMAGE: %08x\n", readl_relaxed(base + RMB_MBA_IMAGE));
+	pr_err("RMB_PBL_STATUS: %08x\n", readl_relaxed(base + RMB_PBL_STATUS));
+	pr_err("RMB_MBA_COMMAND: %08x\n",
+				readl_relaxed(base + RMB_MBA_COMMAND));
+	pr_err("RMB_MBA_STATUS: %08x\n", readl_relaxed(base + RMB_MBA_STATUS));
+	pr_err("RMB_PMI_META_DATA: %08x\n",
+				readl_relaxed(base + RMB_PMI_META_DATA));
+	pr_err("RMB_PMI_CODE_START: %08x\n",
+				readl_relaxed(base + RMB_PMI_CODE_START));
+	pr_err("RMB_PMI_CODE_LENGTH: %08x\n",
+				readl_relaxed(base + RMB_PMI_CODE_LENGTH));
+	pr_err("RMB_PROTOCOL_VERSION: %08x\n",
+				readl_relaxed(base + RMB_PROTOCOL_VERSION));
+	pr_err("RMB_MBA_DEBUG_INFORMATION: %08x\n",
+			readl_relaxed(base + RMB_MBA_DEBUG_INFORMATION));
+}
+
 static int q6v5_rmb_pbl_wait(struct q6v5 *qproc, int ms)
 {
 	unsigned long timeout;
@@ -210,12 +417,14 @@ static int q6v5_rmb_pbl_wait(struct q6v5 *qproc, int ms)
 
 	timeout = jiffies + msecs_to_jiffies(ms);
 	for (;;) {
-		val = readl(qproc->rmb_base + RMB_PBL_STATUS_REG);
+		val = readl_relaxed(qproc->rmb_base + RMB_PBL_STATUS);
 		if (val)
 			break;
 
-		if (time_after(jiffies, timeout))
+		if (time_after(jiffies, timeout)) {
+			modem_log_rmb_regs(qproc->rmb_base);
 			return -ETIMEDOUT;
+		}
 
 		msleep(1);
 	}
@@ -231,7 +440,7 @@ static int q6v5_rmb_mba_wait(struct q6v5 *qproc, u32 status, int ms)
 
 	timeout = jiffies + msecs_to_jiffies(ms);
 	for (;;) {
-		val = readl(qproc->rmb_base + RMB_MBA_STATUS_REG);
+		val = readl_relaxed(qproc->rmb_base + RMB_MBA_STATUS);
 		if (val < 0)
 			break;
 
@@ -240,8 +449,10 @@ static int q6v5_rmb_mba_wait(struct q6v5 *qproc, u32 status, int ms)
 		else if (status && val == status)
 			break;
 
-		if (time_after(jiffies, timeout))
+		if (time_after(jiffies, timeout)) {
+			modem_log_rmb_regs(qproc->rmb_base);
 			return -ETIMEDOUT;
+		}
 
 		msleep(1);
 	}
@@ -251,53 +462,89 @@ static int q6v5_rmb_mba_wait(struct q6v5 *qproc, u32 status, int ms)
 
 static int q6v5proc_reset(struct q6v5 *qproc)
 {
-	u32 val;
-	int ret;
+	int ret, i, count;
+	u64 val;
+
+	/* Override the ACC value if required */
+	writel_relaxed(QDSP6SS_ACC_OVERRIDE_VAL,
+				qproc->reg_base + QDSP6SS_STRAP_ACC);
 
 	/* Assert resets, stop core */
-	val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
-	val |= (Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE);
-	writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_RESET);
+	val |= (Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENA | Q6SS_STOP_CORE);
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_RESET);
+
+	/* BHS require xo cbcr to be enabled */
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_XO_CBCR);
+	val |= 0x1;
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_XO_CBCR);
+	mb();
+	for (count = HALT_CHECK_MAX_LOOPS; count > 0; count--) {
+		val = readl_relaxed(qproc->reg_base + QDSP6SS_XO_CBCR);
+		if (!(val & BIT(31)))
+			break;
+		udelay(1);
+	}
+
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_XO_CBCR);
+	if ((val & BIT(31)))
+	dev_err(qproc->dev, "Failed to enable xo branch clock.\n");
 
 	/* Enable power block headswitch, and wait for it to stabilize */
-	val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-	val |= QDSS_BHS_ON | QDSS_LDO_BYP;
-	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_PWR_CTL);
+	val |= QDSP6v55_BHS_ON;
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL);
 	udelay(1);
 
-	/*
-	 * Turn on memories. L2 banks should be done individually
-	 * to minimize inrush current.
-	 */
-	val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-	val |= Q6SS_SLP_RET_N | Q6SS_L2TAG_SLP_NRET_N |
-		Q6SS_ETB_SLP_NRET_N | Q6SS_L2DATA_STBY_N;
-	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-	val |= Q6SS_L2DATA_SLP_NRET_N_2;
-	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-	val |= Q6SS_L2DATA_SLP_NRET_N_1;
-	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
-	val |= Q6SS_L2DATA_SLP_NRET_N_0;
-	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	/* Put LDO in bypass mode */
+	val |= QDSP6v55_LDO_BYP;
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL);
+	mb();
+
+	/* Deassert QDSP6 compiler memory clamp */
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_PWR_CTL);
+	val &= ~QDSP6v55_CLAMP_QMC_MEM;
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL);
+	mb();
+
+	/* Deassert memory peripheral sleep and L2 memory standby */
+	val |= (Q6SS_L2DATA_STBY_N | Q6SS_SLP_RET_N);
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL);
+	mb();
+
+	/* Turn on L1, L2, ETB and JU memories 1 at a time */
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
+	for (i = 19; i >= 0; i--) {
+		val |= BIT(i);
+		writel_relaxed(val, qproc->reg_base +
+					QDSP6SS_MEM_PWR_CTL);
+		/*
+		 * Wait for 1us for both memory peripheral and
+		 * data array to turn on.
+		 */
+		 mb();
+		udelay(1);
+	}
+
+	/* Remove word line clamp */
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_PWR_CTL);
+	val &= ~QDSP6v55_CLAMP_WL;
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL);
+	mb();
 
 	/* Remove IO clamp */
 	val &= ~Q6SS_CLAMP_IO;
-	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL);
 
 	/* Bring core out of reset */
-	val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
-	val &= ~Q6SS_CORE_ARES;
-	writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_RESET);
+	val &= ~(Q6SS_CORE_ARES | Q6SS_STOP_CORE);
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_RESET);
 
 	/* Turn on core clock */
-	val = readl(qproc->reg_base + QDSP6SS_GFMUX_CTL_REG);
-	val |= Q6SS_CLK_ENABLE;
-	writel(val, qproc->reg_base + QDSP6SS_GFMUX_CTL_REG);
-
-	/* Start core execution */
-	val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
-	val &= ~Q6SS_STOP_CORE;
-	writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_GFMUX_CTL);
+	val |= Q6SS_CLK_ENA;
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_GFMUX_CTL);
 
 	/* Wait for PBL status */
 	ret = q6v5_rmb_pbl_wait(qproc, 1000);
@@ -313,48 +560,37 @@ static int q6v5proc_reset(struct q6v5 *qproc)
 	return ret;
 }
 
-static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
-				   struct regmap *halt_map,
-				   u32 offset)
+static void q6v5proc_halt_axi_port(void __iomem *halt_base)
 {
-	unsigned long timeout;
-	unsigned int val;
 	int ret;
-
-	/* Check if we're already idle */
-	ret = regmap_read(halt_map, offset + AXI_IDLE_REG, &val);
-	if (!ret && val)
-		return;
+	u32 status;
 
 	/* Assert halt request */
-	regmap_write(halt_map, offset + AXI_HALTREQ_REG, 1);
+	writel_relaxed(1, halt_base + AXI_HALTREQ_REG);
 
 	/* Wait for halt */
-	timeout = jiffies + msecs_to_jiffies(HALT_ACK_TIMEOUT_MS);
-	for (;;) {
-		ret = regmap_read(halt_map, offset + AXI_HALTACK_REG, &val);
-		if (ret || val || time_after(jiffies, timeout))
-			break;
-
-		msleep(1);
-	}
-
-	ret = regmap_read(halt_map, offset + AXI_IDLE_REG, &val);
-	if (ret || !val)
-		dev_err(qproc->dev, "port failed halt\n");
+	ret = readl_poll_timeout(halt_base + AXI_HALTACK_REG,
+		status, status != 0, 50, HALT_ACK_TIMEOUT_US);
+	if (ret)
+		pr_warn("Port %p halt timeout\n", halt_base);
+	else if (!readl_relaxed(halt_base + AXI_IDLE_REG))
+		pr_warn("Port %p halt failed\n", halt_base);
 
 	/* Clear halt request (port will remain halted until reset) */
-	regmap_write(halt_map, offset + AXI_HALTREQ_REG, 0);
+	writel_relaxed(0, halt_base + AXI_HALTREQ_REG);
 }
 
-static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
+static int q6v5_mpss_init_image(struct q6v5 *qproc,
+	const struct firmware *fw)
 {
-	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
 	dma_addr_t phys;
 	void *ptr;
 	int ret;
+	unsigned long attrs;
 
-	ptr = dma_alloc_attrs(qproc->dev, fw->size, &phys, GFP_KERNEL, dma_attrs);
+	attrs = DMA_ATTR_FORCE_CONTIGUOUS;
+	ptr = dma_alloc_attrs(qproc->dev, fw->size, &phys, GFP_KERNEL,
+			attrs);
 	if (!ptr) {
 		dev_err(qproc->dev, "failed to allocate mdt buffer\n");
 		return -ENOMEM;
@@ -362,16 +598,20 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 
 	memcpy(ptr, fw->data, fw->size);
 
-	writel(phys, qproc->rmb_base + RMB_PMI_META_DATA_REG);
-	writel(RMB_CMD_META_DATA_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
+	writel_relaxed(phys,
+		qproc->rmb_base + RMB_PMI_META_DATA);
+	writel_relaxed(RMB_CMD_META_DATA_READY,
+		qproc->rmb_base + RMB_MBA_COMMAND);
 
-	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_META_DATA_AUTH_SUCCESS, 1000);
+	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_META_DATA_AUTH_SUCCESS,
+			1000);
 	if (ret == -ETIMEDOUT)
 		dev_err(qproc->dev, "MPSS header authentication timed out\n");
 	else if (ret < 0)
-		dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
+		dev_err(qproc->dev, "MPSS header authentication failed: %d\n",
+			ret);
 
-	dma_free_attrs(qproc->dev, fw->size, ptr, phys, dma_attrs);
+	dma_free_attrs(qproc->dev, fw->size, ptr, phys, attrs);
 
 	return ret < 0 ? ret : 0;
 }
@@ -413,14 +653,16 @@ static int q6v5_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
 		if (!phdr->p_memsz)
 			continue;
 
-		size = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
+		size = readl_relaxed(qproc->rmb_base + RMB_PMI_CODE_LENGTH);
 		if (!size) {
-			writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
-			writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
+			writel_relaxed(boot_addr,
+				qproc->rmb_base + RMB_PMI_CODE_START);
+			writel_relaxed(RMB_CMD_LOAD_READY,
+				qproc->rmb_base + RMB_MBA_COMMAND);
 		}
 
 		size += phdr->p_memsz;
-		writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
+		writel_relaxed(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH);
 	}
 
 	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 10000);
@@ -455,7 +697,8 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 		qproc->mpss_reloc = fw_addr;
 
 	/* Initialize the RMB validator */
-	writel(0, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
+	writel_relaxed(0,
+		qproc->rmb_base + RMB_PMI_CODE_LENGTH);
 
 	ret = q6v5_mpss_init_image(qproc, fw);
 	if (ret)
@@ -473,9 +716,8 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	return ret < 0 ? ret : 0;
 }
 
-static int q6v5_start(struct rproc *rproc)
+static int q6v5_start(struct q6v5 *qproc)
 {
-	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
 	int ret;
 
 	ret = q6v5_regulator_enable(qproc);
@@ -484,25 +726,16 @@ static int q6v5_start(struct rproc *rproc)
 		return ret;
 	}
 
-	ret = reset_control_deassert(qproc->mss_restart);
+	ret = q6v5_clk_enable(qproc);
 	if (ret) {
-		dev_err(qproc->dev, "failed to deassert mss restart\n");
-		goto disable_vdd;
+		dev_err(qproc->dev, "failed to enable clocks\n");
+		goto err_clks;
 	}
 
-	ret = clk_prepare_enable(qproc->ahb_clk);
-	if (ret)
-		goto assert_reset;
+	pil_mss_restart_reg(qproc, 0);
 
-	ret = clk_prepare_enable(qproc->axi_clk);
-	if (ret)
-		goto disable_ahb_clk;
-
-	ret = clk_prepare_enable(qproc->rom_clk);
-	if (ret)
-		goto disable_axi_clk;
-
-	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
+	writel_relaxed(qproc->mba_phys,
+		qproc->rmb_base + RMB_MBA_IMAGE);
 
 	ret = q6v5proc_reset(qproc);
 	if (ret)
@@ -517,9 +750,8 @@ static int q6v5_start(struct rproc *rproc)
 		dev_err(qproc->dev, "MBA returned unexpected status %d\n", ret);
 		ret = -EINVAL;
 		goto halt_axi_ports;
-	}
-
-	dev_info(qproc->dev, "MBA booted, loading mpss\n");
+	} else
+		dev_info(qproc->dev, "MBA booted, loading segments\n");
 
 	ret = q6v5_mpss_load(qproc);
 	if (ret)
@@ -534,57 +766,93 @@ static int q6v5_start(struct rproc *rproc)
 	}
 
 	qproc->running = true;
-
-	/* TODO: All done, release the handover resources */
-
 	return 0;
 
 halt_axi_ports:
-	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
-	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
-	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
-
-	clk_disable_unprepare(qproc->rom_clk);
-disable_axi_clk:
-	clk_disable_unprepare(qproc->axi_clk);
-disable_ahb_clk:
-	clk_disable_unprepare(qproc->ahb_clk);
-assert_reset:
-	reset_control_assert(qproc->mss_restart);
-disable_vdd:
-	q6v5_regulator_disable(qproc);
+	q6v5proc_halt_axi_port(qproc->axi_halt_q6);
+	q6v5proc_halt_axi_port(qproc->axi_halt_modem);
+	q6v5proc_halt_axi_port(qproc->axi_halt_nc);
+	q6v5_clk_disable(qproc);
+err_clks:
+	pil_mss_restart_reg(qproc, 1);
+	q6v5_proxy_unvote(qproc);
 
 	return ret;
 }
 
-static int q6v5_stop(struct rproc *rproc)
+static int q6v5_stop(struct q6v5 *qproc)
 {
-	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
 	int ret;
-
-	qproc->running = false;
+	u64 val;
 
 	qcom_smem_state_update_bits(qproc->state,
 				    BIT(qproc->stop_bit), BIT(qproc->stop_bit));
 
 	ret = wait_for_completion_timeout(&qproc->stop_done,
-					  msecs_to_jiffies(5000));
+					  msecs_to_jiffies(10000));
 	if (ret == 0)
 		dev_err(qproc->dev, "timed out on wait\n");
 
 	qcom_smem_state_update_bits(qproc->state, BIT(qproc->stop_bit), 0);
 
-	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
-	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
-	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
+	q6v5proc_halt_axi_port(qproc->axi_halt_q6);
+	q6v5proc_halt_axi_port(qproc->axi_halt_modem);
+	q6v5proc_halt_axi_port(qproc->axi_halt_nc);
 
-	reset_control_assert(qproc->mss_restart);
-	clk_disable_unprepare(qproc->rom_clk);
-	clk_disable_unprepare(qproc->axi_clk);
-	clk_disable_unprepare(qproc->ahb_clk);
-	q6v5_regulator_disable(qproc);
+	/*
+	* Assert QDSP6 I/O clamp, memory wordline clamp, and compiler
+	* memory clamp as a software workaround to avoid high MX
+	* current during LPASS/MSS restart.
+	*/
+
+	val = readl_relaxed(qproc->reg_base + QDSP6SS_PWR_CTL);
+	val |= (Q6SS_CLAMP_IO | QDSP6v55_CLAMP_WL |
+			QDSP6v55_CLAMP_QMC_MEM);
+	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL);
+	mb();
+
+	pil_mss_restart_reg(qproc, 1);
+	if (qproc->running) {
+		q6v5_clk_disable(qproc);
+		q6v5_proxy_unvote(qproc);
+		qproc->running = false;
+	}
+
+	return 0;
+}
+
+static int mss_boot(struct rproc *rproc)
+{
+	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
+	int ret;
 
+	mutex_lock(&qproc->q6_lock);
+	if (!qproc->boot_count) {
+		ret = q6v5_start(qproc);
+		if (ret)
+			goto err_start;
+	}
+	qproc->boot_count++;
+	mutex_unlock(&qproc->q6_lock);
 	return 0;
+
+err_start:
+	mutex_unlock(&qproc->q6_lock);
+	q6v5_stop(qproc);
+
+	return ret;
+}
+
+static int mss_stop(struct rproc *rproc)
+{
+	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
+	int ret;
+
+	mutex_lock(&qproc->q6_lock);
+	if (!--qproc->boot_count)
+		ret = q6v5_stop(qproc);
+	mutex_unlock(&qproc->q6_lock);
+	return ret;
 }
 
 static void *q6v5_da_to_va(struct rproc *rproc, u64 da, int len)
@@ -600,8 +868,8 @@ static void *q6v5_da_to_va(struct rproc *rproc, u64 da, int len)
 }
 
 static const struct rproc_ops q6v5_ops = {
-	.start = q6v5_start,
-	.stop = q6v5_stop,
+	.start = mss_boot,
+	.stop = mss_stop,
 	.da_to_va = q6v5_da_to_va,
 };
 
@@ -651,86 +919,144 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t q6v5_handover_interrupt(int irq, void *dev)
+static irqreturn_t q6v5_ready_interrupt(int irq, void *dev)
 {
 	struct q6v5 *qproc = dev;
 
+	dev_info(qproc->dev, "Subsystem error monitoring/handling services are up\n");
 	complete(&qproc->start_done);
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t q6v5_handover_interrupt(int irq, void *dev)
+{
+	struct q6v5 *qproc = dev;
+
+	dev_info(qproc->dev, "Power/Clock ready interrupt received\n");
+	q6v5_proxy_unvote(qproc);
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t q6v5_stop_ack_interrupt(int irq, void *dev)
 {
 	struct q6v5 *qproc = dev;
 
+	dev_info(qproc->dev, "Received stop ack interrupt from modem\n");
 	complete(&qproc->stop_done);
 	return IRQ_HANDLED;
 }
 
 static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 {
-	struct of_phandle_args args;
 	struct resource *res;
-	int ret;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qdsp6");
 	qproc->reg_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(qproc->reg_base))
+	if (IS_ERR(qproc->reg_base)) {
+		dev_err(qproc->dev, "failed to get qdsp6_base\n");
 		return PTR_ERR(qproc->reg_base);
+	}
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rmb");
 	qproc->rmb_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(qproc->rmb_base))
+	if (IS_ERR(qproc->rmb_base)) {
+		dev_err(qproc->dev, "failed to get rmb_base\n");
 		return PTR_ERR(qproc->rmb_base);
+	}
 
-	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
-					       "qcom,halt-regs", 3, 0, &args);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");
-		return -EINVAL;
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+				"restart_reg");
+	qproc->restart_reg = devm_ioremap(&pdev->dev, res->start,
+			resource_size(res));
+	if (IS_ERR(qproc->restart_reg)) {
+		dev_err(qproc->dev, "failed to get restart_reg\n");
+		return PTR_ERR(qproc->restart_reg);
 	}
 
-	qproc->halt_map = syscon_node_to_regmap(args.np);
-	of_node_put(args.np);
-	if (IS_ERR(qproc->halt_map))
-		return PTR_ERR(qproc->halt_map);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+			"halt_q6");
+	qproc->axi_halt_q6 = devm_ioremap(&pdev->dev, res->start,
+			resource_size(res));
+	if (IS_ERR(qproc->axi_halt_q6)) {
+		dev_err(qproc->dev, "failed to get axi_halt_q6\n");
+		return PTR_ERR(qproc->axi_halt_q6);
+	}
 
-	qproc->halt_q6 = args.args[0];
-	qproc->halt_modem = args.args[1];
-	qproc->halt_nc = args.args[2];
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+			"halt_modem");
+	qproc->axi_halt_modem = devm_ioremap(&pdev->dev, res->start,
+			resource_size(res));
+	if (IS_ERR(qproc->axi_halt_modem)) {
+		dev_err(qproc->dev, "failed to get halt_modem\n");
+		return PTR_ERR(qproc->axi_halt_modem);
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+			"halt_nc");
+	qproc->axi_halt_nc = devm_ioremap(&pdev->dev, res->start,
+			resource_size(res));
+	if (IS_ERR(qproc->axi_halt_nc)) {
+		dev_err(qproc->dev, "failed to get axi_halt_nc\n");
+		return PTR_ERR(qproc->axi_halt_nc);
+	}
 
 	return 0;
 }
 
 static int q6v5_init_clocks(struct q6v5 *qproc)
 {
-	qproc->ahb_clk = devm_clk_get(qproc->dev, "iface");
+	qproc->ahb_clk = devm_clk_get(qproc->dev, "iface_clk");
 	if (IS_ERR(qproc->ahb_clk)) {
 		dev_err(qproc->dev, "failed to get iface clock\n");
 		return PTR_ERR(qproc->ahb_clk);
 	}
 
-	qproc->axi_clk = devm_clk_get(qproc->dev, "bus");
+	qproc->axi_clk = devm_clk_get(qproc->dev, "bus_clk");
 	if (IS_ERR(qproc->axi_clk)) {
 		dev_err(qproc->dev, "failed to get bus clock\n");
 		return PTR_ERR(qproc->axi_clk);
 	}
 
-	qproc->rom_clk = devm_clk_get(qproc->dev, "mem");
+	qproc->rom_clk = devm_clk_get(qproc->dev, "mem_clk");
 	if (IS_ERR(qproc->rom_clk)) {
 		dev_err(qproc->dev, "failed to get mem clock\n");
 		return PTR_ERR(qproc->rom_clk);
 	}
 
-	return 0;
-}
+	qproc->snoc_axi_clk = devm_clk_get(qproc->dev, "snoc_axi_clk");
+	if (IS_ERR(qproc->snoc_axi_clk)) {
+		dev_err(qproc->dev, "failed to get snoc_axi_clk\n");
+		return PTR_ERR(qproc->snoc_axi_clk);
+	}
 
-static int q6v5_init_reset(struct q6v5 *qproc)
-{
-	qproc->mss_restart = devm_reset_control_get(qproc->dev, NULL);
-	if (IS_ERR(qproc->mss_restart)) {
-		dev_err(qproc->dev, "failed to acquire mss restart\n");
-		return PTR_ERR(qproc->mss_restart);
+	qproc->mnoc_axi_clk = devm_clk_get(qproc->dev, "mnoc_axi_clk");
+	if (IS_ERR(qproc->mnoc_axi_clk)) {
+		dev_err(qproc->dev, "failed to get mnoc_axi_clk clock\n");
+		return PTR_ERR(qproc->mnoc_axi_clk);
+	}
+
+	qproc->gpll0_mss_clk = devm_clk_get(qproc->dev, "gpll0_mss_clk");
+	if (IS_ERR(qproc->gpll0_mss_clk)) {
+		dev_err(qproc->dev, "failed to get gpll0_mss_clk clock\n");
+		return PTR_ERR(qproc->gpll0_mss_clk);
+	}
+
+	qproc->xo = devm_clk_get(qproc->dev, "xo");
+	if (IS_ERR(qproc->xo)) {
+		dev_err(qproc->dev, "failed to get xo\n");
+		return PTR_ERR(qproc->xo);
+	}
+
+	qproc->pnoc_clk = devm_clk_get(qproc->dev, "pnoc_clk");
+	if (IS_ERR(qproc->pnoc_clk)) {
+		dev_err(qproc->dev, "failed to get pnoc_clk clock\n");
+		return PTR_ERR(qproc->pnoc_clk);
+	}
+
+	qproc->qdss_clk = devm_clk_get(qproc->dev, "qdss_clk");
+	if (IS_ERR(qproc->qdss_clk)) {
+		dev_err(qproc->dev, "failed to get qdss_clk clock\n");
+		return PTR_ERR(qproc->qdss_clk);
 	}
 
 	return 0;
@@ -776,7 +1102,8 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 
 	qproc->mba_phys = r.start;
 	qproc->mba_size = resource_size(&r);
-	qproc->mba_region = devm_ioremap_wc(qproc->dev, qproc->mba_phys, qproc->mba_size);
+	qproc->mba_region = devm_ioremap_wc(qproc->dev, qproc->mba_phys,
+			qproc->mba_size);
 	if (!qproc->mba_region) {
 		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
 			&r.start, qproc->mba_size);
@@ -793,7 +1120,8 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 
 	qproc->mpss_phys = qproc->mpss_reloc = r.start;
 	qproc->mpss_size = resource_size(&r);
-	qproc->mpss_region = devm_ioremap_wc(qproc->dev, qproc->mpss_phys, qproc->mpss_size);
+	qproc->mpss_region = devm_ioremap_wc(qproc->dev, qproc->mpss_phys,
+			qproc->mpss_size);
 	if (!qproc->mpss_region) {
 		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
 			&r.start, qproc->mpss_size);
@@ -803,11 +1131,40 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 	return 0;
 }
 
+/* user interface to boot standalone modem */
+
+static ssize_t qproc_boot_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t size)
+{
+	struct q6v5 *qproc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = rproc_boot(qproc->rproc);
+	return ret ? : size;
+}
+
+static ssize_t qproc_shutdown_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t size)
+{
+	struct q6v5 *qproc = dev_get_drvdata(dev);
+
+	rproc_shutdown(qproc->rproc);
+	return size;
+}
+
+static const struct device_attribute qproc_attrs[] = {
+	__ATTR(boot_modem, S_IWUSR, 0, qproc_boot_store),
+	__ATTR(shutdown_modem, S_IWUSR, 0, qproc_shutdown_store),
+};
+
+
 static int q6v5_probe(struct platform_device *pdev)
 {
 	struct q6v5 *qproc;
 	struct rproc *rproc;
-	int ret;
+	int ret, i;
 
 	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_ops,
 			    MBA_FIRMWARE_NAME, sizeof(*qproc));
@@ -842,9 +1199,9 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = q6v5_init_reset(qproc);
-	if (ret)
-		goto free_rproc;
+	qproc->ahb_clk_vote = of_property_read_bool(pdev->dev.of_node,
+			"qcom,ahb-clk-vote");
+	mutex_init(&qproc->q6_lock);
 
 	ret = q6v5_request_irq(qproc, pdev, "wdog", q6v5_wdog_interrupt);
 	if (ret < 0)
@@ -854,20 +1211,33 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto free_rproc;
 
-	ret = q6v5_request_irq(qproc, pdev, "handover", q6v5_handover_interrupt);
+	ret = q6v5_request_irq(qproc, pdev, "ready", q6v5_ready_interrupt);
+	if (ret < 0)
+		goto free_rproc;
+
+	ret = q6v5_request_irq(qproc, pdev, "handover",
+			q6v5_handover_interrupt);
 	if (ret < 0)
 		goto free_rproc;
 
-	ret = q6v5_request_irq(qproc, pdev, "stop-ack", q6v5_stop_ack_interrupt);
+	ret = q6v5_request_irq(qproc, pdev, "stop-ack",
+			q6v5_stop_ack_interrupt);
 	if (ret < 0)
 		goto free_rproc;
 
-	qproc->state = qcom_smem_state_get(&pdev->dev, "stop", &qproc->stop_bit);
+	qproc->state = qcom_smem_state_get(&pdev->dev, "stop",
+			&qproc->stop_bit);
 	if (IS_ERR(qproc->state)) {
-		ret = PTR_ERR(qproc->state);
+		dev_err(&pdev->dev, "unable to get smem state\n");
 		goto free_rproc;
 	}
 
+	for (i = 0; i < ARRAY_SIZE(qproc_attrs); i++) {
+		ret = device_create_file(&pdev->dev, &qproc_attrs[i]);
+		if (ret)
+			dev_err(&pdev->dev, "unable to create sysfs file\n");
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto free_rproc;
@@ -875,7 +1245,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	return 0;
 
 free_rproc:
-	rproc_free(rproc);
+	rproc_put(rproc);
 
 	return ret;
 }
@@ -885,7 +1255,7 @@ static int q6v5_remove(struct platform_device *pdev)
 	struct q6v5 *qproc = platform_get_drvdata(pdev);
 
 	rproc_del(qproc->rproc);
-	rproc_free(qproc->rproc);
+	rproc_put(qproc->rproc);
 
 	return 0;
 }
-- 
1.9.1
