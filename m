Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 7 Nov 2016 22:49:07 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/3] remoteproc: qcom: Hexagon resource handling
Message-ID: <20161108064907.GJ25787@tuxbot>
References: <1478522240-11036-1-git-send-email-akdwived@codeaurora.org>
 <1478522240-11036-3-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478522240-11036-3-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 07 Nov 04:37 PST 2016, Avaneesh Kumar Dwivedi wrote:

> Handling of clock and regulator resources as well as reset
> register programing differ according to version of hexagon
> dsp hardware. Different version require different resources
> and different parameters for same resource. Hence it is
> needed that resource handling is generic and independent of
> hexagon dsp version.
> 

It would be much easier to review this if you didn't do all three
changes in the same patch, and at the same time changed the function
names. There's large parts of this patch where it's not obvious what the
actual changes are.

> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pil.c | 471 +++++++++++++++++++++++++++----------
>  1 file changed, 344 insertions(+), 127 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index b60dff3..1fc505b 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -30,6 +30,7 @@
>  #include <linux/reset.h>
>  #include <linux/soc/qcom/smem.h>
>  #include <linux/soc/qcom/smem_state.h>
> +#include <linux/mutex.h>
>  #include <linux/of_device.h>
>  
>  #include "remoteproc_internal.h"
> @@ -93,6 +94,8 @@
>  #define QDSS_BHS_ON			BIT(21)
>  #define QDSS_LDO_BYP			BIT(22)
>  
> +#define QDSP6v56_CLAMP_WL               BIT(21)
> +#define QDSP6v56_CLAMP_QMC_MEM          BIT(22)
>  struct q6_rproc_res {
>  	char **proxy_clks;
>  	int proxy_clk_cnt;
> @@ -129,11 +132,11 @@ struct q6v5 {
>  	struct qcom_smem_state *state;
>  	unsigned stop_bit;
>  
> -	struct regulator_bulk_data supply[4];
>  	const struct q6_rproc_res *q6_rproc_res;
> -	struct clk *ahb_clk;
> -	struct clk *axi_clk;
> -	struct clk *rom_clk;
> +	struct clk **active_clks;
> +	struct clk **proxy_clks;
> +	struct regulator **proxy_regs;
> +	struct regulator **active_regs;

Keeping these as statically sized arrays, potentially with unused
elements at the end removes the need for allocating the storage and the
double pointers.

>  
>  	struct completion start_done;
>  	struct completion stop_done;
> @@ -147,67 +150,245 @@ struct q6v5 {
>  	phys_addr_t mpss_reloc;
>  	void *mpss_region;
>  	size_t mpss_size;
> +	struct mutex q6_lock;
> +	bool proxy_unvote_reg;
> +	bool proxy_unvote_clk;

I still don't see the need for these 3 attributes.

>  };
>  
> -enum {
> -	Q6V5_SUPPLY_CX,
> -	Q6V5_SUPPLY_MX,
> -	Q6V5_SUPPLY_MSS,
> -	Q6V5_SUPPLY_PLL,
> -};
> +static int q6_regulator_init(struct q6v5 *qproc)
> +{
> +	struct regulator **reg_arr;
> +	int i;
> +
> +	if (qproc->q6_rproc_res->proxy_reg_cnt) {

If you keep proxy_regs and active_regs as arrays you don't need this
check.

> +		reg_arr = devm_kzalloc(qproc->dev,
> +		sizeof(reg_arr) * qproc->q6_rproc_res->proxy_reg_cnt,
> +		GFP_KERNEL);
> +
> +		for (i = 0; i < qproc->q6_rproc_res->proxy_reg_cnt; i++) {
> +			reg_arr[i] = devm_regulator_get(qproc->dev,
> +			qproc->q6_rproc_res->proxy_regs[i]);
> +			if (IS_ERR(reg_arr[i]))
> +				return PTR_ERR(reg_arr[i]);
> +			qproc->proxy_regs = reg_arr;
> +		}
> +	}
> +
> +	if (qproc->q6_rproc_res->active_reg_cnt) {
> +		reg_arr = devm_kzalloc(qproc->dev,
> +		sizeof(reg_arr) * qproc->q6_rproc_res->active_reg_cnt,
> +		GFP_KERNEL);
> +
> +		for (i = 0; i < qproc->q6_rproc_res->active_reg_cnt; i++) {
> +			reg_arr[i] = devm_regulator_get(qproc->dev,
> +			qproc->q6_rproc_res->active_regs[i]);
> +
> +			if (IS_ERR(reg_arr[i]))
> +				return PTR_ERR(reg_arr[i]);
> +			qproc->active_regs = reg_arr;
> +		}
> +	}

Please keep active_regs and proxy_regs as regulator_bulk_data and
continue to use devm_regulator_bulk_get(), it should make this code
cleaner.

> +
> +	return 0;
> +}
>  
> -static int q6v5_regulator_init(struct q6v5 *qproc)
> +static int q6_proxy_regulator_enable(struct q6v5 *qproc)
>  {
> -	int ret;
> +	int i, j, ret = 0;
> +	int **reg_loadnvoltsetflag;
> +	int *reg_load;
> +	int *reg_voltage;
> +
> +	reg_loadnvoltsetflag = qproc->q6_rproc_res->proxy_reg_action;
> +	reg_load = qproc->q6_rproc_res->proxy_reg_load;
> +	reg_voltage = qproc->q6_rproc_res->proxy_reg_voltage;

Rather then keeping these properties on int-arrays I strongly prefer
that you would have a struct { uV, uA } for each regulator.

> +
> +	for (i = 0; i < qproc->q6_rproc_res->proxy_reg_cnt; i++) {
> +		for (j = 0; j <= 1; j++) {
> +			if (j == 0 && *(reg_loadnvoltsetflag + i*j + j))

I'm sorry, but this is not clean. Please use the fact that we're not
writing assembly code and use the language to your advantage.

> +				regulator_set_load(qproc->proxy_regs[i],
> +				reg_load[i]);
> +			if (j == 1 && *(reg_loadnvoltsetflag + i*j + j))
> +				regulator_set_voltage(qproc->proxy_regs[i],
> +				reg_voltage[i], INT_MAX);
> +		}
> +	}
>  
> -	qproc->supply[Q6V5_SUPPLY_CX].supply = "cx";
> -	qproc->supply[Q6V5_SUPPLY_MX].supply = "mx";
> -	qproc->supply[Q6V5_SUPPLY_MSS].supply = "mss";
> -	qproc->supply[Q6V5_SUPPLY_PLL].supply = "pll";
> +	for (i = 0; i < qproc->q6_rproc_res->proxy_reg_cnt; i++) {
> +		ret = regulator_enable(qproc->proxy_regs[i]);
> +		if (ret) {
> +			for (; i > 0; --i) {
> +				regulator_disable(qproc->proxy_regs[i]);
> +				return ret;
> +			}
> +		}
> +	}

If you just keep your regulators in a regulator_bulk_data array then you
can replace this with regulator_bulk_enable(proxy_reg_cnt, proxy_regs);

>  
> -	ret = devm_regulator_bulk_get(qproc->dev,
> -				      ARRAY_SIZE(qproc->supply), qproc->supply);
> -	if (ret < 0) {
> -		dev_err(qproc->dev, "failed to get supplies\n");
> -		return ret;
> +	qproc->proxy_unvote_reg = true;

This should still not be needed.

> +
> +	return 0;
> +}
> +
> +static int q6_active_regulator_enable(struct q6v5 *qproc)
> +{
> +	int i, j, ret = 0;
> +	int **reg_loadnvoltsetflag;
> +	int *reg_load;
> +	int *reg_voltage;
> +
> +	reg_loadnvoltsetflag = qproc->q6_rproc_res->active_reg_action;
> +	reg_load = qproc->q6_rproc_res->active_reg_load;
> +	reg_voltage = qproc->q6_rproc_res->active_reg_voltage;
> +
> +	for (i = 0; i < qproc->q6_rproc_res->active_reg_cnt; i++) {
> +		for (j = 0; j <= 1; j++) {
> +			if (j == 0 && *(reg_loadnvoltsetflag + i*j + j))
> +				regulator_set_load(qproc->active_regs[i],
> +				reg_load[i]);
> +			if (j == 1 && *(reg_loadnvoltsetflag + i*j + j))
> +				regulator_set_voltage(qproc->active_regs[i],
> +				reg_voltage[i], INT_MAX);
> +		}
>  	}
>  
> -	regulator_set_load(qproc->supply[Q6V5_SUPPLY_CX].consumer, 100000);
> -	regulator_set_load(qproc->supply[Q6V5_SUPPLY_MSS].consumer, 100000);
> -	regulator_set_load(qproc->supply[Q6V5_SUPPLY_PLL].consumer, 10000);
> +	for (i = 0; i < qproc->q6_rproc_res->active_reg_cnt; i++) {
> +		ret = regulator_enable(qproc->active_regs[i]);
> +		if (ret) {
> +			for (; i > 0; --i) {
> +				regulator_disable(qproc->active_regs[i]);
> +				return ret;
> +			}
> +		}
> +	}
>  
>  	return 0;
>  }
>  
> -static int q6v5_regulator_enable(struct q6v5 *qproc)
> +static int q6_regulator_enable(struct q6v5 *qproc)
>  {
> -	struct regulator *mss = qproc->supply[Q6V5_SUPPLY_MSS].consumer;
> -	struct regulator *mx = qproc->supply[Q6V5_SUPPLY_MX].consumer;
>  	int ret;
>  
> -	/* TODO: Q6V5_SUPPLY_CX is supposed to be set to super-turbo here */
> +	if (qproc->q6_rproc_res->proxy_reg_cnt)
> +		ret = q6_proxy_regulator_enable(qproc);
>  
> -	ret = regulator_set_voltage(mx, 1050000, INT_MAX);
> -	if (ret)
> -		return ret;
> +	if (qproc->q6_rproc_res->active_reg_cnt)

q6_active_regulator_enable() is a no-op if active_reg_cnt is 0, so no
need to check that. Rather than having two functions, try to
parameterize the regulator enable functions so that you can have a
single function that you pass the active or proxy list.

> +		ret = q6_active_regulator_enable(qproc);
>  
> -	regulator_set_voltage(mss, 1000000, 1150000);
> +	return ret;
> +}
>  
> -	return regulator_bulk_enable(ARRAY_SIZE(qproc->supply), qproc->supply);
> +static int q6_proxy_regulator_disable(struct q6v5 *qproc)
> +{
> +	int i, j;
> +	int **reg_loadnvoltsetflag;
> +
> +	reg_loadnvoltsetflag = qproc->q6_rproc_res->proxy_reg_action;
> +	if (!qproc->proxy_unvote_reg)
> +		return 0;
> +	for (i = qproc->q6_rproc_res->proxy_reg_cnt-1; i >= 0; i--) {
> +		for (j = 0; j <= 1; j++) {
> +			if (j == 0 && *(reg_loadnvoltsetflag + i*j + j))
> +				regulator_set_load(qproc->proxy_regs[i], 0);
> +			if (j == 1 && *(reg_loadnvoltsetflag + i*j + j))
> +				regulator_set_voltage(qproc->proxy_regs[i],
> +				0, INT_MAX);
> +		}
> +	}
> +	for (i = qproc->q6_rproc_res->proxy_reg_cnt-1; i >= 0; i--)
> +		regulator_disable(qproc->proxy_regs[i]);
> +	qproc->proxy_unvote_reg = false;
> +	return 0;
>  }
>  
> -static void q6v5_regulator_disable(struct q6v5 *qproc)
> +static int q6_active_regulator_disable(struct q6v5 *qproc)
>  {
> -	struct regulator *mss = qproc->supply[Q6V5_SUPPLY_MSS].consumer;
> -	struct regulator *mx = qproc->supply[Q6V5_SUPPLY_MX].consumer;
> +	int i, j, ret = 0;
> +	int **reg_loadnvoltsetflag;
> +
> +	reg_loadnvoltsetflag = qproc->q6_rproc_res->active_reg_action;
> +
> +	for (i = qproc->q6_rproc_res->active_reg_cnt-1; i > 0; i--) {
> +		for (j = 0; j <= 1; j++) {
> +			if (j == 0 && *(reg_loadnvoltsetflag + i*j + j))
> +				regulator_set_load(qproc->active_regs[i], 0);
> +			if (j == 1 && *(reg_loadnvoltsetflag + i*j + j))
> +				regulator_set_voltage(qproc->active_regs[i],
> +				0, INT_MAX);
> +		}
> +	}
> +	for (i = qproc->q6_rproc_res->active_reg_cnt-1; i >= 0; i--)
> +		ret = regulator_disable(qproc->proxy_regs[i]);
> +	return 0;
> +}
> +
> +static void q6_regulator_disable(struct q6v5 *qproc)
> +{
> +	if (qproc->q6_rproc_res->proxy_reg_cnt)
> +		q6_proxy_regulator_disable(qproc);
>  
> -	/* TODO: Q6V5_SUPPLY_CX corner votes should be released */
> +	if (qproc->q6_rproc_res->active_reg_cnt)
> +		q6_active_regulator_disable(qproc);
> +}
>  
> -	regulator_bulk_disable(ARRAY_SIZE(qproc->supply), qproc->supply);
> -	regulator_set_voltage(mx, 0, INT_MAX);
> -	regulator_set_voltage(mss, 0, 1150000);
> +static int q6_proxy_clk_enable(struct q6v5 *qproc)

This is really the same as active_clk_enable(), so you should just have
a function that you pass an array of clocks and a count to - similar to
regulator_bulk_enable().

> +{
> +	int i, ret = 0;
> +
> +	for (i = 0; i < qproc->q6_rproc_res->proxy_clk_cnt; i++) {
> +		ret = clk_prepare_enable(qproc->proxy_clks[i]);
> +		if (ret) {
> +			for (; i > 0; --i) {
> +				clk_disable_unprepare(qproc->proxy_clks[i]);
> +				return ret;
> +			}
> +		}
> +	}
> +	qproc->proxy_unvote_clk = true;
> +	return 0;
>  }
>  
> +static void q6_proxy_clk_disable(struct q6v5 *qproc)
> +{
> +	int i;
> +
> +	if (!qproc->proxy_unvote_clk)
> +		return;
> +	for (i = qproc->q6_rproc_res->proxy_clk_cnt-1; i >= 0; i--)
> +		clk_disable_unprepare(qproc->proxy_clks[i]);
> +	qproc->proxy_unvote_clk = false;
> +}
> +
> +static int q6_active_clk_enable(struct q6v5 *qproc)
> +{
> +	int i, ret = 0;

No need to initialize ret, as its first use is an assignment.

> +
> +	for (i = 0; i < qproc->q6_rproc_res->active_clk_cnt; i++) {
> +		ret = clk_prepare_enable(qproc->active_clks[i]);
> +		if (ret) {

Use goto here, rather than nesting a error return in here.

> +			for (; i > 0; i--) {
> +				clk_disable_unprepare(qproc->active_clks[i]);
> +				return ret;
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
> +static void q6_active_clk_disable(struct q6v5 *qproc)
> +{
> +	int i;
> +
> +	for (i = qproc->q6_rproc_res->active_clk_cnt-1; i >= 0; i--)
> +		clk_disable_unprepare(qproc->active_clks[i]);
> +}
> +
> +static void pil_mss_restart_reg(struct q6v5 *qproc, u32 mss_restart)
> +{
> +	if (qproc->restart_reg) {
> +		writel_relaxed(mss_restart, qproc->restart_reg);
> +		udelay(2);
> +	}
> +}
>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct q6v5 *qproc = rproc->priv;
> @@ -340,11 +521,6 @@ static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
>  	unsigned int val;
>  	int ret;
>  
> -	/* Check if we're already idle */
> -	ret = regmap_read(halt_map, offset + AXI_IDLE_REG, &val);
> -	if (!ret && val)
> -		return;
> -

Please put this in its own commit and describe why it can't be there on
8996 and why it's okay to drop on 8974 and 8916.

>  	/* Assert halt request */
>  	regmap_write(halt_map, offset + AXI_HALTREQ_REG, 1);
>  
> @@ -366,7 +542,7 @@ static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
>  	regmap_write(halt_map, offset + AXI_HALTREQ_REG, 0);
>  }
>  
> -static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
> +static int q6_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>  {
>  	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
>  	dma_addr_t phys;
> @@ -395,7 +571,7 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>  	return ret < 0 ? ret : 0;
>  }
>  
> -static int q6v5_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
> +static int q6_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
>  {
>  	const struct elf32_phdr *phdrs;
>  	const struct elf32_phdr *phdr;
> @@ -451,7 +627,7 @@ static int q6v5_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
>  	return ret < 0 ? ret : 0;
>  }
>  
> -static int q6v5_mpss_load(struct q6v5 *qproc)
> +static int q6_mpss_load(struct q6v5 *qproc)
>  {
>  	const struct firmware *fw;
>  	phys_addr_t fw_addr;
> @@ -476,7 +652,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	/* Initialize the RMB validator */
>  	writel(0, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
>  
> -	ret = q6v5_mpss_init_image(qproc, fw);
> +	ret = q6_mpss_init_image(qproc, fw);
>  	if (ret)
>  		goto release_firmware;
>  
> @@ -484,7 +660,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	if (ret)
>  		goto release_firmware;
>  
> -	ret = q6v5_mpss_validate(qproc, fw);
> +	ret = q6_mpss_validate(qproc, fw);
>  
>  release_firmware:
>  	release_firmware(fw);
> @@ -492,36 +668,41 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	return ret < 0 ? ret : 0;
>  }
>  
> -static int q6v5_start(struct rproc *rproc)
> +static int q6_start(struct rproc *rproc)

Most of the changes in this function are renaming of functions and
variables, please don't do this as part of a functional change.

Best would be if you start with a commit that renames the necessary
parts and where you specify that there's "no functional change".

>  {
>  	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
>  	int ret;
>  
> -	ret = q6v5_regulator_enable(qproc);
> +	mutex_lock(&qproc->q6_lock);

We should already be protected by the rproc->lock here, please let me
know if there are any gaps.

> +	ret = q6_regulator_enable(qproc);
>  	if (ret) {
> -		dev_err(qproc->dev, "failed to enable supplies\n");
> +		dev_err(qproc->dev, "failed to enable reg supplies\n");

Supplies are regulators, but if you find this confusing then you
shouldn't abbreviate regulators as "reg".

>  		return ret;
>  	}
>  
> -	ret = reset_control_deassert(qproc->mss_restart);

So the correct order is: enable clocks, then deassert reset?

> +	ret = q6_proxy_clk_enable(qproc);
>  	if (ret) {
> -		dev_err(qproc->dev, "failed to deassert mss restart\n");
> -		goto disable_vdd;
> +		dev_err(qproc->dev, "failed to enable proxy_clk\n");
> +		goto err_proxy_clk;
>  	}
>  
> -	ret = clk_prepare_enable(qproc->ahb_clk);
> -	if (ret)
> -		goto assert_reset;
> -
> -	ret = clk_prepare_enable(qproc->axi_clk);
> -	if (ret)
> -		goto disable_ahb_clk;
> +	ret = q6_active_clk_enable(qproc);
> +	if (ret) {
> +		dev_err(qproc->dev, "failed to enable active clocks\n");
> +		goto err_active_clks;
> +	}
>  
> -	ret = clk_prepare_enable(qproc->rom_clk);
> -	if (ret)
> -		goto disable_axi_clk;
> +	if (!strcmp(qproc->q6_rproc_res->q6_version, "v56"))
> +		pil_mss_restart_reg(qproc, 0);
> +	else {
> +		ret = reset_control_deassert(qproc->mss_restart);
> +		if (ret) {
> +			dev_err(qproc->dev, "failed to deassert mss restart\n");
> +			goto err_deassert;
> +		}
> +	}
>  
> -	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
> +	writel_relaxed(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);

There's no functional reason for changing writel to writel_relaxed, so
please do this in a separate commit and motivate it well.

>  
>  	ret = q6v5proc_reset(qproc);
>  	if (ret)
> @@ -539,13 +720,11 @@ static int q6v5_start(struct rproc *rproc)
>  	}
>  
>  	dev_info(qproc->dev, "MBA booted, loading mpss\n");
> -
> -	ret = q6v5_mpss_load(qproc);
> +	ret = q6_mpss_load(qproc);
>  	if (ret)
>  		goto halt_axi_ports;
> -
>  	ret = wait_for_completion_timeout(&qproc->start_done,
> -					  msecs_to_jiffies(5000));
> +					  msecs_to_jiffies(10000));

Please put this in a separate commit and describe why 10 seconds is
better than 5.

>  	if (ret == 0) {
>  		dev_err(qproc->dev, "start timed out\n");
>  		ret = -ETIMEDOUT;
> @@ -553,36 +732,33 @@ static int q6v5_start(struct rproc *rproc)
>  	}
>  
>  	qproc->running = true;
> -
>  	/* TODO: All done, release the handover resources */
> -
> +	q6_proxy_clk_disable(qproc);
> +	q6_proxy_regulator_disable(qproc);

This is good, please drop the TODO comment now that we're done.

> +	mutex_unlock(&qproc->q6_lock);
>  	return 0;
>  
>  halt_axi_ports:
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
> -
> -	clk_disable_unprepare(qproc->rom_clk);
> -disable_axi_clk:
> -	clk_disable_unprepare(qproc->axi_clk);
> -disable_ahb_clk:
> -	clk_disable_unprepare(qproc->ahb_clk);
> -assert_reset:
> -	reset_control_assert(qproc->mss_restart);

Don't we need to assert the reset again?

> -disable_vdd:
> -	q6v5_regulator_disable(qproc);
> -
> +err_deassert:
> +	q6_active_clk_disable(qproc);
> +err_active_clks:
> +	q6_proxy_clk_disable(qproc);
> +err_proxy_clk:

It's better if the labels describe the action than the source of the
jump, so please keep the "disable_vdd" label for this - it also makes
your patch cleaner.

> +	q6_regulator_disable(qproc);
> +	mutex_unlock(&qproc->q6_lock);
>  	return ret;
>  }
>  
> -static int q6v5_stop(struct rproc *rproc)
> +static int q6_stop(struct rproc *rproc)
>  {
>  	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
>  	int ret;
> +	u64 val;
>  
> -	qproc->running = false;
> -
> +	mutex_lock(&qproc->q6_lock);
>  	qcom_smem_state_update_bits(qproc->state,
>  				    BIT(qproc->stop_bit), BIT(qproc->stop_bit));
>  
> @@ -597,16 +773,30 @@ static int q6v5_stop(struct rproc *rproc)
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
>  
> -	reset_control_assert(qproc->mss_restart);
> -	clk_disable_unprepare(qproc->rom_clk);
> -	clk_disable_unprepare(qproc->axi_clk);
> -	clk_disable_unprepare(qproc->ahb_clk);
> -	q6v5_regulator_disable(qproc);
> -
> +	if (!strcmp(qproc->q6_rproc_res->q6_version, "v56")) {

This would be much better as an enum than a string. But I keep wonder if
this is only for v5.6 of the Hexagon - perhaps should we clamp different
things on the various versions?.

> +		/*
> +		 * Assert QDSP6 I/O clamp, memory wordline clamp, and compiler
> +		 * memory clamp as a software workaround to avoid high MX
> +		 * current during LPASS/MSS restart.
> +		 */
> +
> +		val = readl_relaxed(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		val |= (Q6SS_CLAMP_IO | QDSP6v56_CLAMP_WL |
> +				QDSP6v56_CLAMP_QMC_MEM);
> +		writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		pil_mss_restart_reg(qproc, 1);

And by using the reset framework for mss_restart this will fall out of
the conditional segment and the else is gone.

> +	} else
> +		reset_control_assert(qproc->mss_restart);
> +	q6_active_clk_disable(qproc);
> +	q6_proxy_clk_disable(qproc);
> +	q6_proxy_regulator_disable(qproc);
> +	q6_active_regulator_disable(qproc);
> +	qproc->running = false;
> +	mutex_unlock(&qproc->q6_lock);
>  	return 0;
>  }
>  

Regards,
Bjorn
