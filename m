Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 4/4] remoteproc/k3-dsp: Add support for C71x DSPs
Date: Wed, 25 Mar 2020 15:47:01 -0500
Message-ID: <20200325204701.16862-5-s-anna@ti.com>
In-Reply-To: <20200325204701.16862-1-s-anna@ti.com>
References: <20200325204701.16862-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Clement Leger <cleger@kalray.eu>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Lokesh Vutla <lokeshvutla@ti.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The Texas Instrument's K3 J721E SoCs have a newer next-generation
C71x DSP Subsystem in the MAIN voltage domain in addition to the
previous generation C66x DSP subsystems. The C71x DSP subsystem is
based on the TMS320C71x DSP CorePac module. The C71x CPU is a true
64-bit machine including 64-bit memory addressing and single-cycle
64-bit base arithmetic operations and supports vector signal processing
providing a significant lift in DSP processing power over C66x DSPs.
J721E SoCs use a C711 (a one-core 512-bit vector width CPU core) DSP
that is cache coherent with the A72 Arm cores.

Each subsystem has one or more Fixed/Floating-Point DSP CPUs, with 32 KB
of L1P Cache, 48 KB of L1D SRAM that can be configured and partitioned as
either RAM and/or Cache, and 512 KB of L2 SRAM configurable as either RAM
and/or Cache. The CorePac also includes a Matrix Multiplication Accelerator
(MMA), a Stream Engine (SE) and a C71x Memory Management Unit (CMMU), an
Interrupt Controller (INTC) and a Powerdown Management Unit (PMU) modules.

Update the existing K3 DSP remoteproc driver to add support for this C71x
DSP subsystem. The firmware loading support is provided by using the newly
added 64-bit ELF loader support, and is limited to images using only
external DDR memory at the moment. The L1D and L2 SRAMs are used as scratch
memory when using as RAMs, and cannot be used for loadable segments. The
CMMU is also not supported to begin with, and the driver is designed to
treat the MMU as if it is in bypass mode.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 7b712ef74611..48d26f7d5f48 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -649,6 +649,9 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 
 	rproc->has_iommu = false;
 	rproc->recovery_disabled = true;
+	/* C71x is a 64-bit processor, so plug in generic .sanity_check ops */
+	rproc->ops->sanity_check = rproc_elf_sanity_check;
+
 	kproc = rproc->priv;
 	kproc->rproc = rproc;
 	kproc->dev = dev;
@@ -789,6 +792,12 @@ static const struct k3_dsp_mem_data c66_mems[] = {
 	{ .name = "l1dram", .dev_addr = 0xf00000 },
 };
 
+/* C71x cores only have a L1P Cache, there are no L1P SRAMs */
+static const struct k3_dsp_mem_data c71_mems[] = {
+	{ .name = "l2sram", .dev_addr = 0x800000 },
+	{ .name = "l1dram", .dev_addr = 0xe00000 },
+};
+
 static const struct k3_dsp_dev_data c66_data = {
 	.mems = c66_mems,
 	.num_mems = ARRAY_SIZE(c66_mems),
@@ -796,8 +805,16 @@ static const struct k3_dsp_dev_data c66_data = {
 	.uses_lreset = true,
 };
 
+static const struct k3_dsp_dev_data c71_data = {
+	.mems = c71_mems,
+	.num_mems = ARRAY_SIZE(c71_mems),
+	.boot_align_addr = SZ_2M,
+	.uses_lreset = false,
+};
+
 static const struct of_device_id k3_dsp_of_match[] = {
 	{ .compatible = "ti,j721e-c66-dsp", .data = &c66_data, },
+	{ .compatible = "ti,j721e-c71-dsp", .data = &c71_data, },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, k3_dsp_of_match);
-- 
2.23.0
