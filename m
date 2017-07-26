Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 26 Jul 2017 12:08:37 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/3] drivers: remoteproc: Add Hexagon Q6 - WCSS
 integrated core driver
Message-ID: <20170726190837.GQ20973@minitux>
References: <1498745861-20531-1-git-send-email-sricharan@codeaurora.org>
 <1498745861-20531-3-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1498745861-20531-3-git-send-email-sricharan@codeaurora.org>
To: Sricharan R <sricharan@codeaurora.org>
Cc: ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 29 Jun 07:17 PDT 2017, Sricharan R wrote:

> IPQ8074 has an integrated Hexagon dsp core Q6v5 and a wireless lan
> (Lithium) IP. This patch adds the remoteproc driver to reset, load
> and boot Q6 firmware.
> 

There is a fair amount of code in this driver that seems to be
equivalent to Avaneesh q6v5 patches for MSM8996.

The differences coming from the MBA + MPSS vs single-image we have to
live with, but can we do something about the Q6 programming sequences?
E.g. extract them to a common file?

> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  drivers/remoteproc/Kconfig     |  13 +
>  drivers/remoteproc/Makefile    |   1 +
>  drivers/remoteproc/q6v5-wcss.c | 784 +++++++++++++++++++++++++++++++++++++++++

Please keep the qcom_* naming scheme.

[..]
> diff --git a/drivers/remoteproc/q6v5-wcss.c b/drivers/remoteproc/q6v5-wcss.c
[..]
> +#include <linux/elf.h>

Doesn't look like you need this anymore.

[..]
> +#include <linux/qcom_scm.h>

You don't need this.

[..]
> +
> +#define WCSS_CRASH_REASON_SMEM 421
> +#define WCNSS_PAS_ID		6
> +#define STOP_ACK_TIMEOUT_MS 10000
> +
> +#define QDSP6SS_RST_EVB 0x10
> +#define QDSP6SS_RESET 0x14
> +#define QDSP6SS_DBG_CFG 0x18
> +#define QDSP6SS_XO_CBCR 0x38
> +#define QDSP6SS_MEM_PWR_CTL 0xb0
> +#define QDSP6SS_BHS_STATUS 0x78
> +#define TCSR_GLOBAL_CFG0 0x0
> +#define TCSR_GLOBAL_CFG1 0x4
> +
> +#define QDSP6SS_GFMUX_CTL 0x20
> +#define QDSP6SS_PWR_CTL 0x30
> +#define TCSR_HALTREQ 0x0
> +#define TCSR_HALTACK 0x4
> +#define TCSR_Q6_HALTREQ 0x0
> +#define TCSR_Q6_HALTACK 0x4
> +#define SSCAON_CONFIG 0x8
> +#define SSCAON_STATUS 0xc
> +#define HALTACK BIT(0)
> +#define BHS_EN_REST_ACK BIT(0)

It would be nice to have the values of these indented, to make things a
little bit easier to read.

[..]
> +static struct resource_table *q6v5_find_rsc_table(struct rproc *rproc,
> +						  const struct firmware *fw,
> +						  int *tablesz)

You can omit this function, there's a dummy in qcom_common.[ch] with the
same name for the same purpose.

> +{
> +	static struct resource_table table = { .ver = 1, };
> +
> +	*tablesz = sizeof(table);
> +	return &table;
> +}
> +
> +static int q6v5_init_clocks(struct device *dev, struct q6v5 *qproc)
> +{
> +	int i;
> +	const char *cname;
> +	struct property *prop;
> +
> +	qproc->clk_cnt = of_property_count_strings(dev->of_node,
> +						   "clock-names");
> +
> +	if (!qproc->clk_cnt)
> +		return 0;

I strongly prefer that you explicitly list the clocks expected here,
rather than trusting DT.

And please transition this to the newly added clk-bulk interface (see
clk_bulk_get() et al).

> +
> +	qproc->clks = devm_kzalloc(dev, sizeof(*qproc->clks) * qproc->clk_cnt,
> +				   GFP_KERNEL);
> +
> +	of_property_for_each_string(dev->of_node, "clock-names", prop, cname) {
> +		struct clk *c = devm_clk_get(dev, cname);
> +
> +		if (IS_ERR_OR_NULL(c)) {
> +			if (PTR_ERR(c) != -EPROBE_DEFER)
> +				dev_err(dev, "Failed to get %s clock\n", cname);
> +
> +			return PTR_ERR(c);
> +		}
> +
> +		qproc->clks[i++] = c;
> +	}
> +
> +	return 0;
> +}
> +
> +static int q6v5_clk_enable(struct q6v5 *qproc)
> +{
> +	int rc;
> +	int i;
> +
> +	for (i = 0; i < qproc->clk_cnt; i++) {
> +		rc = clk_prepare_enable(qproc->clks[i]);
> +		if (rc)
> +			goto err;
> +	}
> +
> +	return 0;
> +err:
> +	for (i--; i >= 0; i--)
> +		clk_disable_unprepare(qproc->clks[i]);
> +
> +	return rc;
> +}

As of v4.13-rc1 you can call clk_bulk_prepare_enable() instead of this
function.

> +
> +static int wcss_powerdown(struct q6v5 *qproc)
> +{
> +	unsigned int nretry = 0;
> +	unsigned int val = 0;
> +	int ret;
> +
> +	/* Assert WCSS/Q6 HALTREQ - 1 */

I presume the numbers at the end of these comments corresponds to the
steps in your programming manual, if so it's okay to keep them. But
please make move them to the front, like /* N: comment */

> +	nretry = 0;
> +
> +	ret = regmap_update_bits(qproc->tcsr, qproc->halt_wcss + TCSR_HALTREQ,
> +				 1, 1);

Is there a reason to do read-modify-write on this register? I use
regmap_write() in the other driver.

> +	if (ret)
> +		return ret;
> +
> +	while (1) {
> +		regmap_read(qproc->tcsr, qproc->halt_wcss + TCSR_HALTACK,
> +			    &val);
> +		if (val & HALTACK)
> +			break;
> +		mdelay(1);
> +		nretry++;
> +		if (nretry >= 10) {
> +			pr_warn("can't get TCSR haltACK\n");
> +			break;
> +		}
> +	}

Would it be possible to move q6v5proc_halt_axi_port() to qcom_common.c
(or a tcsr driver?) and use that instead?

> +
> +	/* Check HALTACK */

I presume this comment does not relate to the code that follows it?

> +	/* Set MPM_SSCAON_CONFIG 13 - 2 */

Shouldn't this be "Disable MPM_WCSSAON_CONFIG 13"?

> +	val = readl(qproc->mpm_base + SSCAON_CONFIG);
> +	val |= BIT(13);
> +	writel(val, qproc->mpm_base + SSCAON_CONFIG);
> +
> +	/* Set MPM_SSCAON_CONFIG 15 - 3 */
> +	val = readl(qproc->mpm_base + SSCAON_CONFIG);
> +	val |= BIT(15);
> +	val &= ~(BIT(16));
> +	val &= ~(BIT(17));
> +	val &= ~(BIT(18));

Skip all the extra parenthesis.

> +	writel(val, qproc->mpm_base + SSCAON_CONFIG);
> +
> +	/* Set MPM_SSCAON_CONFIG 1 - 4 */
> +	val = readl(qproc->mpm_base + SSCAON_CONFIG);
> +	val |= BIT(1);
> +	writel(val, qproc->mpm_base + SSCAON_CONFIG);
> +
> +	/* wait for SSCAON_STATUS to be 0x400 - 5 */
> +	nretry = 0;
> +	while (1) {
> +		val = readl(qproc->mpm_base + SSCAON_STATUS);
> +		/* ignore bits 16 to 31 */
> +		val &= 0xffff;
> +		if (val == BIT(10))
> +			break;
> +		nretry++;
> +		mdelay(1);
> +		if (nretry == 10) {
> +			pr_warn("can't get SSCAON_STATUS\n");
> +			break;
> +		}
> +	}

Please replace this loop with:
	ret = readl_poll_timeout(qproc->mpm_base + SSCAON_STATUS, val,
				 val & 0xffff == 0x400, 1000, 10000);

> +
> +	/* Enable Q6/WCSS BLOCK ARES - 6 */
> +	reset_control_assert(qproc->wcss_aon_reset);
> +
> +	/* Enable MPM_WCSSAON_CONFIG 13 - 7 */
> +	val = readl(qproc->mpm_base + SSCAON_CONFIG);
> +	val &= (~(BIT(13)));

Skip all the extra parenthesis.

> +	writel(val, qproc->mpm_base + SSCAON_CONFIG);
> +
> +	/* Enable A2AB/ACMT/ECHAB ARES - 8 */
> +	/* De-assert WCSS/Q6 HALTREQ - 8 */
> +	reset_control_assert(qproc->wcss_reset);
> +
> +	ret = regmap_update_bits(qproc->tcsr, qproc->halt_wcss + TCSR_HALTREQ,
> +				 1, 0);
> +
> +	return ret;
> +}
> +
> +static int q6_powerdown(struct q6v5 *qproc)
> +{
> +	int i = 0, ret;
> +	unsigned int nretry = 0;
> +	unsigned int val = 0;
> +
> +	/* Halt Q6 bus interface - 9*/
> +	ret = regmap_update_bits(qproc->tcsr, qproc->halt_q6 + TCSR_Q6_HALTREQ,
> +				 1, 1);
> +	if (ret)
> +		return ret;
> +
> +	nretry = 0;
> +	while (1) {
> +		regmap_read(qproc->tcsr, qproc->halt_q6 + TCSR_Q6_HALTACK,
> +			    &val);
> +		if (val & HALTACK)
> +			break;
> +		mdelay(1);
> +		nretry++;
> +		if (nretry >= 10) {
> +			pr_err("can't get TCSR Q6 haltACK\n");
> +			break;
> +		}
> +	}

Again, can we utilize q6v5proc_halt_axi_port()? (Or replace the tcsr
syscon with a driver)

> +
> +	/* Disable Q6 Core clock - 10 */
> +	val = readl(qproc->q6_base + QDSP6SS_GFMUX_CTL);
> +	val &= (~(BIT(1)));

Parenthesis.

> +	writel(val, qproc->q6_base + QDSP6SS_GFMUX_CTL);
> +
> +	/* Clamp I/O - 11 */
> +	val = readl(qproc->q6_base + QDSP6SS_PWR_CTL);
> +	val |= BIT(20);
> +	writel(val, qproc->q6_base + QDSP6SS_PWR_CTL);
> +
> +	/* Clamp WL - 12 */
> +	val = readl(qproc->q6_base + QDSP6SS_PWR_CTL);
> +	val |= BIT(21);
> +	writel(val, qproc->q6_base + QDSP6SS_PWR_CTL);
> +
> +	/* Clear Erase standby - 13 */
> +	val = readl(qproc->q6_base + QDSP6SS_PWR_CTL);
> +	val &= (~(BIT(18)));
> +	writel(val, qproc->q6_base + QDSP6SS_PWR_CTL);
> +
> +	/* Clear Sleep RTN - 14 */
> +	val = readl(qproc->q6_base + QDSP6SS_PWR_CTL);
> +	val &= (~(BIT(19)));
> +	writel(val, qproc->q6_base + QDSP6SS_PWR_CTL);
> +
> +	/* turn off QDSP6 memory foot/head switch one bank at a time - 15*/
> +	for (i = 0; i < 20; i++) {
> +		val = readl(qproc->q6_base + QDSP6SS_MEM_PWR_CTL);
> +		val &= (~(BIT(i)));

Parenthesis.

> +		writel(val, qproc->q6_base + QDSP6SS_MEM_PWR_CTL);
> +		mdelay(1);
> +	}
> +
> +	/* Assert QMC memory RTN - 16 */
> +	val = readl(qproc->q6_base + QDSP6SS_PWR_CTL);
> +	val |= BIT(22);
> +	writel(val, qproc->q6_base + QDSP6SS_PWR_CTL);
> +
> +	/* Turn off BHS - 17 */
> +	val = readl(qproc->q6_base + QDSP6SS_PWR_CTL);
> +	val &= (~(BIT(24)));
> +	writel(val, qproc->q6_base + QDSP6SS_PWR_CTL);
> +	udelay(1);
> +	/* Wait till BHS Reset is done */
> +	nretry = 0;
> +	while (1) {
> +		val = readl(qproc->q6_base + QDSP6SS_BHS_STATUS);
> +		if (!(val & BHS_EN_REST_ACK))
> +			break;
> +		mdelay(1);
> +		nretry++;
> +		if (nretry >= 10) {
> +			pr_err("BHS_STATUS not OFF\n");
> +			break;
> +		}
> +	}

readl_poll_timeout()

> +
> +	/* HALT CLEAR - 18 */
> +	ret = regmap_update_bits(qproc->tcsr, qproc->halt_q6 + TCSR_Q6_HALTREQ,
> +				 1, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable Q6 Block reset - 19 */
> +	reset_control_assert(qproc->wcss_q6_reset);
> +
> +	return 0;
> +}
> +
> +static int q6_rproc_stop(struct rproc *rproc)
> +{
> +	struct q6v5 *qproc = rproc->priv;
> +	int ret = 0;
> +
> +	qproc->running = false;
> +
> +	/* WCSS powerdown */
> +	qcom_smem_state_update_bits(qproc->state, BIT(qproc->stop_bit),
> +				    BIT(qproc->stop_bit));
> +
> +	ret = wait_for_completion_timeout(&qproc->stop_done,
> +					  msecs_to_jiffies(5000));
> +	if (ret == 0) {
> +		dev_err(qproc->dev, "timed out on wait\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	qcom_smem_state_update_bits(qproc->state, BIT(qproc->stop_bit), 0);
> +
> +	ret = wcss_powerdown(qproc);
> +	if (ret)
> +		return ret;
> +
> +	/* Q6 Power down */
> +	ret = q6_powerdown(qproc);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int q6_rproc_start(struct rproc *rproc)
> +{
> +	struct q6v5 *qproc = rproc->priv;
> +	int temp = 19;
> +	unsigned long val = 0;
> +	unsigned int nretry = 0;
> +	int ret = 0;
> +
> +	ret = q6v5_clk_enable(qproc);
> +	if (ret) {
> +		dev_err(qproc->dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	/* Release Q6 and WCSS reset */
> +	reset_control_deassert(qproc->wcss_reset);
> +	reset_control_deassert(qproc->wcss_q6_reset);
> +
> +	/* Lithium configuration - clock gating and bus arbitration */

Should this go in a tcsr driver?

> +	ret = regmap_update_bits(qproc->tcsr,
> +				 qproc->halt_gbl + TCSR_GLOBAL_CFG0,
> +				 0x1F, 0x14);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(qproc->tcsr,
> +				 qproc->halt_gbl + TCSR_GLOBAL_CFG1,
> +				 1, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Write bootaddr to EVB so that Q6WCSS will jump there after reset */
> +	writel(rproc->bootaddr >> 4, qproc->q6_base + QDSP6SS_RST_EVB);
> +	/* Turn on XO clock. It is required for BHS and memory operation */
> +	writel(0x1, qproc->q6_base + QDSP6SS_XO_CBCR);
> +	/* Turn on BHS */
> +	writel(0x1700000, qproc->q6_base + QDSP6SS_PWR_CTL);

Avaneesh provided defines for most of these magic numbers, please follow
that.

> +	udelay(1);
> +
> +	/* Wait till BHS Reset is done */
> +	while (1) {
> +		val = readl(qproc->q6_base + QDSP6SS_BHS_STATUS);
> +		if (val & BHS_EN_REST_ACK)
> +			break;
> +		mdelay(1);
> +		nretry++;
> +		if (nretry >= 10) {
> +			pr_err("BHS_STATUS not ON\n");
> +			break;
> +		}
> +	}

Use readl_poll_timeout()

> +
> +	/* Put LDO in bypass mode */
> +	writel(0x3700000, qproc->q6_base + QDSP6SS_PWR_CTL);
> +	/* De-assert QDSP6 complier memory clamp */
> +	writel(0x3300000, qproc->q6_base + QDSP6SS_PWR_CTL);
> +	/* De-assert memory peripheral sleep and L2 memory standby */
> +	writel(0x33c0000, qproc->q6_base + QDSP6SS_PWR_CTL);
> +
> +	/* turn on QDSP6 memory foot/head switch one bank at a time */
> +	while  (temp >= 0) {

Please use a for loop, and replace "temp" with "i".

This is identical to Avaneesh patch, so let's make sure the code is
identical as well.


> +		val = readl(qproc->q6_base + QDSP6SS_MEM_PWR_CTL);
> +		val = val | 1 << temp;

val |= BIT(temp);

> +		writel(val, qproc->q6_base + QDSP6SS_MEM_PWR_CTL);
> +		val = readl(qproc->q6_base + QDSP6SS_MEM_PWR_CTL);

Please include a comment on the read back here.

> +		mdelay(10);
> +		temp -= 1;
> +	}
> +	/* Remove the QDSP6 core memory word line clamp */
> +	writel(0x31FFFFF, qproc->q6_base + QDSP6SS_PWR_CTL);
> +	/* Remove QDSP6 I/O clamp */
> +	writel(0x30FFFFF, qproc->q6_base + QDSP6SS_PWR_CTL);
> +
> +	/* Bring Q6 out of reset and stop the core */
> +	writel(0x5, qproc->q6_base + QDSP6SS_RESET);
> +
> +	/* Retain debugger state during next QDSP6 reset */
> +	writel(0x0, qproc->q6_base + QDSP6SS_DBG_CFG);
> +	/* Turn on the QDSP6 core clock */
> +	writel(0x102, qproc->q6_base + QDSP6SS_GFMUX_CTL);
> +	/* Enable the core to run */
> +	writel(0x4, qproc->q6_base + QDSP6SS_RESET);
> +
> +	ret = wait_for_completion_timeout(&qproc->start_done,
> +					  msecs_to_jiffies(5000));
> +	if (ret == 0) {
> +		dev_err(qproc->dev, "start timed out\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	qproc->running = true;
> +
> +	return 0;
> +}
> +
> +static struct rproc_ops q6v5_rproc_ops = {
> +	.start		= q6_rproc_start,
> +	.stop		= q6_rproc_stop,
> +};
> +
> +static struct rproc_fw_ops q6_fw_ops;
> +
> +static int q6v5_request_irq(struct q6v5 *qproc,
> +			    struct platform_device *pdev,
> +			    const char *name,
> +			    irq_handler_t thread_fn)
> +{
> +	int ret;
> +
> +	ret = platform_get_irq_byname(pdev, name);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "no %s IRQ defined\n", name);
> +		return ret;
> +	}
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, ret,
> +					NULL, thread_fn,
> +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					"q6v5", qproc);
> +	if (ret)
> +		dev_err(&pdev->dev, "request %s IRQ failed\n", name);
> +
> +	return ret;
> +}
> +
> +static irqreturn_t q6v5_fatal_interrupt(int irq, void *dev)
> +{
> +	struct q6v5 *qproc = dev;
> +	char *msg;
> +	size_t len;
> +
> +	if (!qproc->running)
> +		return IRQ_HANDLED;
> +
> +	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, WCSS_CRASH_REASON_SMEM, &len);
> +	if (!IS_ERR(msg) && len > 0 && msg[0])
> +		dev_err(qproc->dev, "Fatal error from wcss: %s\n", msg);
> +	else
> +		dev_err(qproc->dev, "Fatal error received no message!\n");
> +
> +	rproc_report_crash(qproc->rproc, RPROC_FATAL_ERROR);
> +
> +	if (!IS_ERR(msg))
> +		msg[0] = '\0';
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t q6v5_handover_interrupt(int irq, void *dev)
> +{
> +	struct q6v5 *qproc = dev;
> +
> +	complete(&qproc->start_done);
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t q6v5_stop_ack_interrupt(int irq, void *dev)
> +{
> +	struct q6v5 *qproc = dev;
> +
> +	complete(&qproc->stop_done);
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t q6v5_wdog_interrupt(int irq, void *dev)
> +{
> +	struct q6v5 *qproc = dev;
> +	char *msg;
> +	size_t len;
> +
> +	if (!qproc->running) {
> +		complete(&qproc->stop_done);
> +		return IRQ_HANDLED;
> +	}
> +
> +	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, WCSS_CRASH_REASON_SMEM, &len);
> +	if (!IS_ERR(msg) && len > 0 && msg[0])
> +		dev_err(qproc->dev, "Watchdog bite from wcss %s\n", msg);
> +	else
> +		dev_err(qproc->dev, "Watchdog bit received no message!\n");
> +
> +	rproc_report_crash(qproc->rproc, RPROC_WATCHDOG);
> +
> +	if (!IS_ERR(msg))
> +		msg[0] = '\0';
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
> +
> +	return qcom_mdt_load(qproc->dev, fw, rproc->firmware, WCNSS_PAS_ID,
> +			     qproc->mem_region, qproc->mem_phys,
> +			     qproc->mem_size, false);
> +}
> +
> +static int q6_alloc_memory_region(struct q6v5 *qproc)
> +{
> +	struct device_node *node;
> +	struct resource r;
> +	int ret;
> +
> +	node = of_parse_phandle(qproc->dev->of_node, "memory-region", 0);
> +	if (!node) {
> +		dev_err(qproc->dev, "no memory-region specified\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = of_address_to_resource(node, 0, &r);
> +	if (ret)
> +		return ret;
> +
> +	qproc->mem_phys = r.start;
> +	qproc->mem_size = resource_size(&r);
> +	qproc->mem_region = devm_ioremap_wc(qproc->dev, qproc->mem_phys,
> +					    qproc->mem_size);
> +	if (!qproc->mem_region) {
> +		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
> +			&r.start, qproc->mem_size);
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
> +static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
> +{
> +	struct of_phandle_args args;
> +	struct resource *res;
> +	int ret;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +					   "mpm");
> +	if (IS_ERR_OR_NULL(res))
> +		return -ENODEV;
> +
> +	qproc->mpm_base = ioremap(res->start, resource_size(res));
> +	if (IS_ERR_OR_NULL(qproc->mpm_base))
> +		return PTR_ERR(qproc->mpm_base);

Is this the same MPM block that is used to configure sleep related
things later? If so I think we shouldn't map it directly here, but
introduce a separate driver for it.

> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +					   "q6");
> +	if (IS_ERR_OR_NULL(res)) {
> +		ret = -ENODEV;
> +		goto free_mpm;
> +	}
> +
> +	qproc->q6_base = ioremap(res->start, resource_size(res));

Except for the error path of this function these memory regions are
never unmapped. Please use devm_ioremap_wc() instead.

> +	if (IS_ERR_OR_NULL(qproc->q6_base)) {
> +		ret = PTR_ERR(qproc->q6_base);
> +		goto free_mpm;
> +	}
> +
> +	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
> +					       "qcom,halt-regs", 3,
> +					       0, &args);
> +	if (ret < 0)
> +		goto free_q6;
> +
> +	qproc->tcsr = syscon_node_to_regmap(args.np);
> +	of_node_put(args.np);
> +	if (IS_ERR_OR_NULL(qproc->tcsr)) {
> +		ret = PTR_ERR(qproc->tcsr);
> +		goto free_q6;
> +	}
> +
> +	qproc->halt_gbl = args.args[0];
> +	qproc->halt_q6 = args.args[1];
> +	qproc->halt_wcss = args.args[2];
> +
> +	return 0;
> +
> +free_q6:
> +	iounmap(qproc->q6_base);
> +
> +free_mpm:
> +	iounmap(qproc->mpm_base);
> +
> +	return ret;
> +}
> +
> +static int q6_rproc_probe(struct platform_device *pdev)
> +{
> +	struct q6v5 *qproc;
> +	struct rproc *rproc;
> +	int ret;
> +	struct qcom_smem_state *state;
> +	unsigned int stop_bit;
> +	const char *firmware_name = of_device_get_match_data(&pdev->dev);
> +
> +	state = qcom_smem_state_get(&pdev->dev, "stop",
> +				    &stop_bit);
> +	if (IS_ERR(state))
> +		/* Wait till SMP2P is registered and up */
> +		return -EPROBE_DEFER;
> +
> +	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_rproc_ops,
> +			    firmware_name,
> +			    sizeof(*qproc));
> +	if (unlikely(!rproc))
> +		return -ENOMEM;
> +
> +	qproc = rproc->priv;
> +	qproc->dev = &pdev->dev;
> +	qproc->rproc = rproc;
> +	rproc->has_iommu = false;
> +
> +	q6_fw_ops = *rproc->fw_ops;
> +	q6_fw_ops.find_rsc_table = q6v5_find_rsc_table;
> +	q6_fw_ops.load = q6v5_load;

I would prefer that you do define a static const object with these, like
in the other qcom drivers.

But in order to do that you would need to export
rproc_elf_get_boot_addr(), which is in line with another item on my todo
list, so please do this.

[..]
> +
> +free_rproc:
> +	rproc_put(rproc);

Use rproc_free() instead of rproc_put() to free up resources of
rproc_alloc()

> +	return -EIO;
> +}
> +
> +static int q6_rproc_remove(struct platform_device *pdev)
> +{
> +	struct q6v5 *qproc;
> +	struct rproc *rproc;
> +
> +	qproc = platform_get_drvdata(pdev);
> +	rproc = qproc->rproc;
> +
> +	rproc_del(rproc);
> +	rproc_put(rproc);

rproc_free()

> +
> +	return 0;
> +}
> +

Regards,
Bjorn
