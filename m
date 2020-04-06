Return-Path: <nikita.shubin@maquefel.me>
From: nikita.shubin@maquefel.me
Subject: [PATCH v2 1/3] remoteproc: imx_rproc: set pc on start
Date: Mon,  6 Apr 2020 14:33:08 +0300
Message-Id: <20200406113310.3041-2-nikita.shubin@maquefel.me>
In-Reply-To: <20200406113310.3041-1-nikita.shubin@maquefel.me>
References: <20200304142628.8471-1-NShubin@topcon.com>
 <20200406113310.3041-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: nikita.shubin@maquefel.me
Cc: Nikita Shubin <NShubin@topcon.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

In case elf file interrupt vector is not supposed to be at OCRAM_S,
it is needed to write elf entry point to OCRAM_S + 0x4, to boot M4
firmware.

Otherwise firmware located anywhere besides OCRAM_S won't boot.

The firmware must set stack poiner as first instruction:

Reset_Handler:
    ldr   sp, = __stack      /* set stack pointer */

Signed-off-by: Nikita Shubin <NShubin@topcon.com>
---
 drivers/remoteproc/imx_rproc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 3e72b6f38d4b..bebc58d0f711 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -45,6 +45,8 @@
 
 #define IMX7D_RPROC_MEM_MAX		8
 
+#define IMX_BOOT_PC			0x4
+
 /**
  * struct imx_rproc_mem - slim internal memory structure
  * @cpu_addr: MPU virtual address of the memory region
@@ -85,6 +87,7 @@ struct imx_rproc {
 	const struct imx_rproc_dcfg	*dcfg;
 	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
 	struct clk			*clk;
+	void __iomem			*bootreg;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
@@ -162,11 +165,16 @@ static int imx_rproc_start(struct rproc *rproc)
 	struct device *dev = priv->dev;
 	int ret;
 
+	/* write entry point to program counter */
+	writel(rproc->bootaddr, priv->bootreg);
+
 	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
 				 dcfg->src_mask, dcfg->src_start);
 	if (ret)
 		dev_err(dev, "Failed to enable M4!\n");
 
+	dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
+
 	return ret;
 }
 
@@ -182,6 +190,9 @@ static int imx_rproc_stop(struct rproc *rproc)
 	if (ret)
 		dev_err(dev, "Failed to stop M4!\n");
 
+	/* clear entry points */
+	writel(0, priv->bootreg);
+
 	return ret;
 }
 
@@ -243,7 +254,8 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
 static const struct rproc_ops imx_rproc_ops = {
 	.start		= imx_rproc_start,
 	.stop		= imx_rproc_stop,
-	.da_to_va       = imx_rproc_da_to_va,
+	.da_to_va	= imx_rproc_da_to_va,
+	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
 
 static int imx_rproc_addr_init(struct imx_rproc *priv,
@@ -360,6 +372,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		goto err_put_rproc;
 	}
 
+	priv->bootreg = imx_rproc_da_to_va(rproc, IMX_BOOT_PC, sizeof(u32));
+
 	/*
 	 * clk for M4 block including memory. Should be
 	 * enabled before .start for FW transfer.
-- 
2.25.1
