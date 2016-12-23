Date: Thu, 22 Dec 2016 17:04:27 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 6/7] remoteproc: qcom: Implement Hexagon core specific
 changes.
Message-ID: <20161223010427.GE10519@minitux>
References: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
 <1481804490-8583-7-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481804490-8583-7-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 15 Dec 04:21 PST 2016, Avaneesh Kumar Dwivedi wrote:

> +/* QDSP6v56 parameters */
> +#define QDSP6v56_LDO_BYP                BIT(25)
> +#define QDSP6v56_BHS_ON                 BIT(24)
> +#define QDSP6v56_CLAMP_WL               BIT(21)
> +#define QDSP6v56_CLAMP_QMC_MEM          BIT(22)
> +#define HALT_CHECK_MAX_LOOPS            200
> +#define QDSP6SS_XO_CBCR                 0x0038

Indent these with tabs, like the others.

> +#define QDSP6SS_ACC_OVERRIDE_VAL	0x20
> +
>  struct reg_info {
>  	struct regulator *reg;
>  	int uV;
> @@ -111,6 +123,7 @@ struct rproc_hexagon_res {
>  	struct qcom_mss_reg_res active_supply[2];
>  	char **proxy_clk_string;
>  	char **active_clk_string;
> +	int hexagon_ver;
>  };
>  
>  struct q6v5 {
> @@ -152,8 +165,14 @@ struct q6v5 {
>  	phys_addr_t mpss_reloc;
>  	void *mpss_region;
>  	size_t mpss_size;
> +	int hexagon_ver;

Please name this "version" instead, there's little confusion to what it
is.

>  };
>  
> +enum {
> +	MSS_MSM8916, /*hexagon on msm8916*/
> +	MSS_MSM8974, /*hexagon on msm8974*/
> +	MSS_MSM8996, /*hexagon on msm8996*/

You can skip the comments now.

> +};
>  
>  static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
>  				const struct qcom_mss_reg_res *reg_res)
> @@ -341,35 +360,107 @@ static int q6v5_rmb_mba_wait(struct q6v5 *qproc, u32 status, int ms)
>  
>  static int q6v5proc_reset(struct q6v5 *qproc)
>  {
> -	u32 val;
> +	u64 val;
>  	int ret;
> +	int i;
>  
> -	/* Assert resets, stop core */
> -	val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
> -	val |= (Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE);
> -	writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
>  
> -	/* Enable power block headswitch, and wait for it to stabilize */
> -	val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> -	val |= QDSS_BHS_ON | QDSS_LDO_BYP;
> -	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> -	udelay(1);
> -
> -	/*
> -	 * Turn on memories. L2 banks should be done individually
> -	 * to minimize inrush current.
> -	 */
> -	val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> -	val |= Q6SS_SLP_RET_N | Q6SS_L2TAG_SLP_NRET_N |
> -		Q6SS_ETB_SLP_NRET_N | Q6SS_L2DATA_STBY_N;
> -	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> -	val |= Q6SS_L2DATA_SLP_NRET_N_2;
> -	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> -	val |= Q6SS_L2DATA_SLP_NRET_N_1;
> -	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> -	val |= Q6SS_L2DATA_SLP_NRET_N_0;
> -	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +	if (qproc->hexagon_ver == 0x2) {

== MSS_MSM8996

> +		/* Override the ACC value if required */
> +		writel(QDSP6SS_ACC_OVERRIDE_VAL,
> +			qproc->reg_base + QDSP6SS_STRAP_ACC);
> +
> +		/* Assert resets, stop core */
> +		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
> +		val |= (Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE);
> +		writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
>  
> +		/* BHS require xo cbcr to be enabled */
> +		val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
> +		val |= 0x1;
> +		writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);

Please add a comment here, describing what we're waiting for (rather
than just "a magical bit 31")

> +		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_XO_CBCR,
> +				val, !(val & BIT(31)), 1, HALT_CHECK_MAX_LOOPS);
> +		if (ret) {
> +			dev_err(qproc->dev,
> +				"xo cbcr enabling timed out (rc:%d)\n", ret);
> +			return ret;
> +		}
> +		if ((val & BIT(31))) {

If bit 31 is set when the readl_poll_timeout() hits the timeout the
condition will evaluate to false and "ret" will be -ETIMEDOUT. So I
don't think this can happen.

> +			dev_err(qproc->dev,
> +				"Failed to enable xo branch clock.\n");
> +			return -EINVAL;
> +		}
> +		/*
> +		 * Enable power block headswitch,
> +		 * and wait for it to stabilize

This comment fits within 80 characters, so no need to line wrap it.

> +		 */
> +		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		val |= QDSP6v56_BHS_ON;
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		udelay(1);

Please insert a single empty line here, to create some separation
between the "steps".

> +		/* Put LDO in bypass mode */
> +		val |= QDSP6v56_LDO_BYP;
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		/*
> +		 * Deassert QDSP6 compiler memory clamp
> +		 */
> +		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		val &= ~QDSP6v56_CLAMP_QMC_MEM;
> +		writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);

Please drop the _relaxed

> +
> +		/* Deassert memory peripheral sleep and L2 memory standby */
> +		val |= (Q6SS_L2DATA_STBY_N | Q6SS_SLP_RET_N);
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +
> +		/* Turn on L1, L2, ETB and JU memories 1 at a time */
> +		val = readl(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
> +		for (i = 19; i >= 0; i--) {
> +			val |= BIT(i);
> +			writel(val, qproc->reg_base +
> +						QDSP6SS_MEM_PWR_CTL);
> +			/*
> +			 * Wait for 1us for both memory peripheral and
> +			 * data array to turn on.
> +			 */

/* Read back value to ensure the write is done */

And move the 1us comment below the read.

> +			 val |= readl(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);

Please correct the indentation of this line.

> +			udelay(1);
> +		}
> +		/* Remove word line clamp */
> +		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		val &= ~QDSP6v56_CLAMP_WL;
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +	} else {
> +		/* Assert resets, stop core */
> +		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
> +		val |= (Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE);
> +		writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
> +		/*
> +		 * Enable power block headswitch,
> +		 * and wait for it to stabilize
> +		 */
> +		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		val |= QDSS_BHS_ON | QDSS_LDO_BYP;
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		udelay(1);
> +
> +		/*
> +		 * Turn on memories. L2 banks should be done individually
> +		 * to minimize inrush current.
> +		 */
> +		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		val |= Q6SS_SLP_RET_N | Q6SS_L2TAG_SLP_NRET_N |
> +			Q6SS_ETB_SLP_NRET_N | Q6SS_L2DATA_STBY_N;
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		val |= Q6SS_L2DATA_SLP_NRET_N_2;
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		val |= Q6SS_L2DATA_SLP_NRET_N_1;
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		val |= Q6SS_L2DATA_SLP_NRET_N_0;
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +	}
>  	/* Remove IO clamp */
>  	val &= ~Q6SS_CLAMP_IO;
>  	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> @@ -664,6 +755,7 @@ static int q6v5_stop(struct rproc *rproc)
>  {
>  	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
>  	int ret;
> +	int val;
>  
>  	qproc->running = false;
>  
> @@ -681,6 +773,15 @@ static int q6v5_stop(struct rproc *rproc)
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
>  
> +	if (qproc->hexagon_ver == 0x2) {

== MSS_MSM8996

> +		/*
> +		 * To avoid high MX current during LPASS/MSS restart.
> +		 */
> +		val = readl_relaxed(qproc->reg_base + QDSP6SS_PWR_CTL_REG);

Please no _relaxed()

> +		val |= Q6SS_CLAMP_IO | QDSP6v56_CLAMP_WL |
> +			QDSP6v56_CLAMP_QMC_MEM;
> +		writel_relaxed(val,	qproc->reg_base + QDSP6SS_PWR_CTL_REG);

Dito

> +	}
>  	reset_control_assert(qproc->mss_restart);
>  	q6v5_clk_disable(qproc->dev, qproc->active_clks,
>  				qproc->active_clk_count);

Regards,
Bjorn
