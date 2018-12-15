Return-Path: <govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 15 Dec 2018 23:30:14 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH v2 6/6] remoteproc: qcom: wcss: Add non pas wcss Q6
 support for QCS404
In-Reply-To: <20181206164842.GB31596@builder>
References: <1539337244-9505-1-git-send-email-govinds@codeaurora.org>
 <1539337244-9505-7-git-send-email-govinds@codeaurora.org>
 <20181206164842.GB31596@builder>
Message-ID: <eb492d923d8dc1dc01d3ffadc7482fdd@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Thanks Bjorn for the review.

On 2018-12-06 22:18, Bjorn Andersson wrote:
> On Fri 12 Oct 02:40 PDT 2018, Govind Singh wrote:
>> diff --git 
>> a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt 
>> b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> index 601dd9f..cc83832 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> @@ -13,6 +13,7 @@ on the Qualcomm Hexagon core.
>>  		    "qcom,msm8974-mss-pil"
>>  		    "qcom,msm8996-mss-pil"
>>  		    "qcom,sdm845-mss-pil"
>> +		    "qcom,qcs404-wcss-non-pas"
> 
> Let's use the form qcom,qcs404-wcnss-pas for the PAS case and
> qcom,qcs404-wcnss-pil for the non-PAS.
> 

Addressed in v3.
>> 
>>  - reg:
>>  	Usage: required
>> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c 
>> b/drivers/remoteproc/qcom_q6v5_wcss.c
> [..]
>>  /* Q6SS Register Offsets */
>> -#define Q6SS_RESET_REG		0x014
>> +#define Q6SS_RESET_REG			0x014
> 
> Most of these changes to defines are just reformatting, making it hard
> to track what actually changed. Please do send a separate patch fixing
> the indentation instead.
> 

Addressed in v3.

>>  #define Q6SS_GFMUX_CTL_REG		0x020
>>  #define Q6SS_PWR_CTL_REG		0x030
>>  #define Q6SS_MEM_PWR_CTL		0x0B0
>> +#define Q6SS_STRAP_ACC			0x110
>> +#define Q6SS_CGC_OVERRIDE		0x034
>> +#define Q6SS_BCR_REG			0x6000
>> 
>>  /* AXI Halt Register Offsets */
>>  #define AXI_HALTREQ_REG			0x0
>> @@ -36,6 +44,9 @@
>>  #define Q6SS_CORE_ARES			BIT(1)
>>  #define Q6SS_BUS_ARES_ENABLE		BIT(2)
>> 
>> +/* Q6SS_BRC_RESET */
>> +#define Q6SS_BRC_BLK_ARES		BIT(0)
>> +
>>  /* Q6SS_GFMUX_CTL */
>>  #define Q6SS_CLK_ENABLE			BIT(1)
>> 
>> @@ -44,14 +55,15 @@
>>  #define Q6SS_SLP_RET_N			BIT(19)
>>  #define Q6SS_CLAMP_IO			BIT(20)
>>  #define QDSS_BHS_ON			BIT(21)
>> +#define QDSS_Q6_MEMORIES		GENMASK(15, 0)
>> 
>>  /* Q6SS parameters */
>> -#define Q6SS_LDO_BYP		BIT(25)
>> -#define Q6SS_BHS_ON		BIT(24)
>> -#define Q6SS_CLAMP_WL		BIT(21)
>> +#define Q6SS_LDO_BYP			BIT(25)
>> +#define Q6SS_BHS_ON			BIT(24)
>> +#define Q6SS_CLAMP_WL			BIT(21)
>>  #define Q6SS_CLAMP_QMC_MEM		BIT(22)
>>  #define HALT_CHECK_MAX_LOOPS		200
>> -#define Q6SS_XO_CBCR		GENMASK(5, 3)
>> +#define Q6SS_XO_CBCR			GENMASK(5, 3)
>> 
>>  /* Q6SS config/status registers */
>>  #define TCSR_GLOBAL_CFG0	0x0
>> @@ -70,12 +82,23 @@
>>  #define TCSR_WCSS_CLK_MASK	0x1F
>>  #define TCSR_WCSS_CLK_ENABLE	0x14
>> 
>> +enum {
>> +	WCSS_IPQ8074,
>> +	WCSS_QCS404,
>> +};
>> +
>>  struct wcss_data {
>> -	void (*pas_handover)(struct qcom_q6v5 *q6v5);
>>  	const char *firmware_name;
>>  	int crash_reason_smem;
>>  	int version;
>>  	int pas_id;
>> +	bool has_aggre2_clk;
> 
> Please don't introduce properties and code that you don't use.
> 

Addressed in v3.

>> +	bool aon_reset_required;
>> +	const char *ssr_name;
>> +	const char *sysmon_name;
>> +	int ssctl_id;
>> +	const struct rproc_ops *ops;
>> +	void (*pas_handover)(struct qcom_q6v5 *q6v5);
>>  };
>> 
>>  struct q6v5_wcss {
>> @@ -83,12 +106,37 @@ struct q6v5_wcss {
>> 
>>  	void __iomem *reg_base;
>>  	void __iomem *rmb_base;
>> +	void __iomem *q6stop_base;
>> 
>>  	struct regmap *halt_map;
>>  	u32 halt_q6;
>>  	u32 halt_wcss;
>>  	u32 halt_nc;
>> 
>> +	struct clk *xo;
>> +	struct clk *aggre2_clk;
> 
> You don't use aggre2_clk, so you can drop this.
> 
Addressed in v3.


>> +	struct clk *ahbfabric_cbcr_clk;
>> +	struct clk *gcc_abhs_cbcr;
>> +	struct clk *gcc_axim_cbcr;
>> +	struct clk *lcc_csr_cbcr;
>> +	struct clk *ahbs_cbcr;
>> +	struct clk *tcm_slave_cbcr;
>> +	struct clk *qdsp6ss_abhm_cbcr;
>> +	struct clk *qdsp6ss_sleep_cbcr;
>> +	struct clk *qdsp6ss_axim_cbcr;
>> +	struct clk *qdsp6ss_xo_cbcr;
>> +	struct clk *qdsp6ss_core_gfmux;
>> +	struct clk *wcss_bcr_cbcr;
> 
> It looks like you're able to group most of these up in one or more
> clk_bulk_data
> 

These clocks needs specific order, hence clk_bulk_data is not working.

>> +	struct regulator *cx_supply;
>> +	struct regulator *px_supply;
> 
> px_supply isn't documented in the DT binding, do you actually use it?
> 

Removed in v3.

>> +
>> +	bool has_aggre2_clk;
>> +	bool aon_reset_required;
>> +
>> +	struct qcom_rproc_glink glink_subdev;
>> +	struct qcom_rproc_ssr ssr_subdev;
>> +	struct qcom_sysmon *sysmon;
>> +
>>  	struct reset_control *wcss_aon_reset;
>>  	struct reset_control *wcss_reset;
>>  	struct reset_control *wcss_q6_reset;
>> @@ -99,7 +147,6 @@ struct q6v5_wcss {
>>  	phys_addr_t mem_reloc;
>>  	void *mem_region;
>>  	size_t mem_size;
>> -
>>  	int crash_reason_smem;
>>  	int pas_id;
>>  	int version;
>> @@ -245,6 +292,214 @@ static int q6v5_wcss_start(struct rproc *rproc)
>>  	return ret;
>>  }
> [..]
>> +static int q6v5_wcss_qcs404_reset(struct q6v5_wcss *wcss)
>> +{
>> +	unsigned long val;
>> +
>> +	writel(0x80800000, wcss->reg_base + Q6SS_STRAP_ACC);
>> +
>> +	/* Start core execution */
>> +	val = readl(wcss->reg_base + Q6SS_RESET_REG);
>> +	val &= ~Q6SS_STOP_CORE;
>> +	writel(val, wcss->reg_base + Q6SS_RESET_REG);
>> +
>> +	return 0;
>> +}
>> +
>> +static int q6v5_qcs404_wcss_start(struct rproc *rproc)
> 
> There are commonalities between this and the existing start function,
> can we align them instead of duplicating?
> 

Addressed in v3.

>> +{
>> +	struct q6v5_wcss *wcss = rproc->priv;
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(wcss->xo);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (wcss->has_aggre2_clk) {
>> +		ret = clk_prepare_enable(wcss->aggre2_clk);
>> +		if (ret)
>> +			goto disable_xo_clk;
>> +	}
>> +
>> +	ret = regulator_enable(wcss->cx_supply);
>> +	if (ret)
>> +		goto disable_aggre2_clk;
>> +
>> +	ret = regulator_enable(wcss->px_supply);
>> +	if (ret)
>> +		goto disable_cx_supply;
>> +
>> +	qcom_q6v5_prepare(&wcss->q6v5);
>> +
>> +	ret = q6v5_wcss_qcs404_power_on(wcss);
>> +	if (ret) {
>> +		dev_err(wcss->dev, "wcss clk_enable failed\n");
>> +		goto disable_px_supply;
>> +	}
>> +
>> +	writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
>> +
>> +	ret = q6v5_wcss_qcs404_reset(wcss);
> 
> Just inline the 5 lines here.
> 
Addressed in v3.

>> +	if (ret)
>> +		dev_err(wcss->dev, "De-assert QDSP6 out of reset failed\n");
> 
> The function can't fail...
> 
Addressed in v3.

>> +
>> +	ret = qcom_q6v5_wait_for_start(&wcss->q6v5, 5 * HZ);
>> +	if (ret == -ETIMEDOUT) {
>> +		dev_err(wcss->dev, "start timed out\n");
>> +		goto disable_px_supply;
>> +	}
>> +
>> +	return 0;
>> +
>> +disable_px_supply:
>> +	regulator_disable(wcss->px_supply);
>> +disable_cx_supply:
>> +	regulator_disable(wcss->cx_supply);
>> +disable_aggre2_clk:
>> +	if (wcss->has_aggre2_clk)
>> +		clk_disable_unprepare(wcss->aggre2_clk);
>> +disable_xo_clk:
>> +	clk_disable_unprepare(wcss->xo);
>> +
>> +	return ret;
>> +}
>> +
>>  static void q6v5_wcss_halt_axi_port(struct q6v5_wcss *wcss,
>>  				    struct regmap *halt_map,
>>  				    u32 offset)
>> @@ -279,6 +534,77 @@ static void q6v5_wcss_halt_axi_port(struct 
>> q6v5_wcss *wcss,
>>  	regmap_write(halt_map, offset + AXI_HALTREQ_REG, 0);
>>  }
>> 
>> +static int q6v5_qcs404_wcss_shutdown(struct q6v5_wcss *wcss)
>> +{
>> +	unsigned long val;
>> +	int ret;
>> +
>> +	q6v5_wcss_halt_axi_port(wcss, wcss->halt_map, wcss->halt_wcss);
>> +
>> +	/* assert clamps to avoid MX current inrush */
>> +	val = readl(wcss->reg_base + Q6SS_PWR_CTL_REG);
>> +	val |= (Q6SS_CLAMP_IO | Q6SS_CLAMP_WL | Q6SS_CLAMP_QMC_MEM);
>> +	writel(val, wcss->reg_base + Q6SS_PWR_CTL_REG);
>> +
>> +	/* Disable memories by turning off memory foot/headswitch */
>> +	writel((readl(wcss->reg_base + Q6SS_MEM_PWR_CTL) &
>> +		~QDSS_Q6_MEMORIES),
>> +		wcss->reg_base + Q6SS_MEM_PWR_CTL);
>> +
>> +	/* Clear the BHS_ON bit */
>> +	val = readl(wcss->reg_base + Q6SS_PWR_CTL_REG);
>> +	val &= ~Q6SS_BHS_ON;
>> +	writel(val, wcss->reg_base + Q6SS_PWR_CTL_REG);
>> +
>> +	clk_disable_unprepare(wcss->ahbfabric_cbcr_clk);
>> +	clk_disable_unprepare(wcss->lcc_csr_cbcr);
>> +	clk_disable_unprepare(wcss->tcm_slave_cbcr);
>> +	clk_disable_unprepare(wcss->qdsp6ss_abhm_cbcr);
>> +	clk_disable_unprepare(wcss->qdsp6ss_axim_cbcr);
>> +	clk_disable_unprepare(wcss->qdsp6ss_xo_cbcr);
>> +	clk_disable_unprepare(wcss->ahbs_cbcr);
>> +	clk_disable_unprepare(wcss->wcss_bcr_cbcr);
>> +	clk_disable_unprepare(wcss->qdsp6ss_core_gfmux);
>> +	clk_disable_unprepare(wcss->gcc_abhs_cbcr);
>> +
>> +	ret = reset_control_assert(wcss->wcss_reset);
>> +	if (ret) {
>> +		dev_err(wcss->dev, "wcss_reset failed\n");
>> +		return ret;
>> +	}
>> +	usleep_range(200, 300);
>> +
>> +	ret = reset_control_deassert(wcss->wcss_reset);
>> +	if (ret) {
>> +		dev_err(wcss->dev, "wcss_reset failed\n");
>> +		return ret;
>> +	}
> 
> Can't we deassert this in start(), as that would make it better follow
> the IPQ implementation.
> 

No, deassert in start is not working.

>> +	usleep_range(200, 300);
>> +
>> +	clk_disable_unprepare(wcss->gcc_axim_cbcr);
>> +
>> +	return 0;
>> +}
>> +
>> +static int q6v5_qcs404_wcss_stop(struct rproc *rproc)
>> +{
>> +	struct q6v5_wcss *wcss = rproc->priv;
>> +	int ret;
>> +
>> +	/* WCSS powerdown */
>> +	ret = qcom_q6v5_request_stop(&wcss->q6v5);
>> +	if (ret == -ETIMEDOUT)
>> +		dev_err(wcss->dev, "timed out on wait\n");
>> +
>> +	ret = q6v5_qcs404_wcss_shutdown(wcss);
> 
> This call is the only part that differs from the existing stop(), so
> please switch here instead of duplicating the function.
> 

Addressed in v3.

>> +	if (ret)
>> +		return ret;
>> +
>> +	qcom_q6v5_unprepare(&wcss->q6v5);
>> +
>> +	return 0;
>> +}
>> +
>>  static int q6v5_wcss_powerdown(struct q6v5_wcss *wcss)
>>  {
>>  	int ret;
>> @@ -312,7 +638,8 @@ static int q6v5_wcss_powerdown(struct q6v5_wcss 
>> *wcss)
>>  	}
>> 
>>  	/* 6 - De-assert WCSS_AON reset */
>> -	reset_control_assert(wcss->wcss_aon_reset);
>> +	if (wcss->aon_reset_required)
> 
> aon_reset_required is set for IPQ, which is the only case which will
> call this function, so no need to check for this.
> 
>> +		reset_control_assert(wcss->wcss_aon_reset);
>> 
>>  	/* 7 - Disable WCSSAON_CONFIG 13 */
>>  	val = readl(wcss->rmb_base + SSCAON_CONFIG);
>> @@ -392,6 +719,17 @@ static int q6v5_q6_powerdown(struct q6v5_wcss 
>> *wcss)
>>  	return 0;
>>  }
>> 
>> +static void q6v5_wcss_pas_handover(struct qcom_q6v5 *q6v5)
> 
> Why does the non-PAS driver have a method named pas_handover()?
> 
>> +{
>> +	struct q6v5_wcss *wcss = container_of(q6v5, struct q6v5_wcss, q6v5);
>> +
>> +	regulator_disable(wcss->px_supply);
>> +	regulator_disable(wcss->cx_supply);
>> +	if (wcss->has_aggre2_clk)
>> +		clk_disable_unprepare(wcss->aggre2_clk);
>> +	clk_disable_unprepare(wcss->xo);
>> +}
>> +
>>  static int q6v5_wcss_stop(struct rproc *rproc)
>>  {
>>  	struct q6v5_wcss *wcss = rproc->priv;
>> @@ -439,7 +777,7 @@ static int q6v5_wcss_load(struct rproc *rproc, 
>> const struct firmware *fw)
>>  				     wcss->mem_size, &wcss->mem_reloc);
>>  }
>> 
>> -static const struct rproc_ops q6v5_wcss_ops = {
>> +static const struct rproc_ops q6v5_wcss_ipq8074_ops = {
> 
> Rename this when you introduce it in the previous patch.
> 
Addressed in v3.

>>  	.start = q6v5_wcss_start,
>>  	.stop = q6v5_wcss_stop,
>>  	.da_to_va = q6v5_wcss_da_to_va,
>> @@ -447,23 +785,33 @@ static int q6v5_wcss_load(struct rproc *rproc, 
>> const struct firmware *fw)
>>  	.get_boot_addr = rproc_elf_get_boot_addr,
>>  };
>> 
>> +static const struct rproc_ops q6v5_wcss_qcs404_ops = {
>> +	.start = q6v5_qcs404_wcss_start,
>> +	.stop = q6v5_qcs404_wcss_stop,
>> +	.da_to_va = q6v5_wcss_da_to_va,
>> +	.load = q6v5_wcss_load,
>> +	.get_boot_addr = rproc_elf_get_boot_addr,
>> +};
>> +
>>  static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss)
>>  {
>>  	struct device *dev = wcss->dev;
>> 
>> -	wcss->wcss_aon_reset = devm_reset_control_get(dev, 
>> "wcss_aon_reset");
>> -	if (IS_ERR(wcss->wcss_aon_reset)) {
>> -		dev_err(wcss->dev, "unable to acquire wcss_aon_reset\n");
>> -		return PTR_ERR(wcss->wcss_aon_reset);
>> +	if (wcss->aon_reset_required) {
> 
> Pass desc, or an argument to the function, rather than stashing this
> value in wcss. And just leave wcss_aon_reset NULL when not used.
> 

Addressed in v3.

>> +		wcss->wcss_aon_reset = devm_reset_control_get_exclusive(dev, 
>> "wcss_aon_reset");
>> +		if (IS_ERR(wcss->wcss_aon_reset)) {
>> +			dev_err(wcss->dev, "fail to acquire wcss_aon_reset\n");
>> +			return PTR_ERR(wcss->wcss_aon_reset);
>> +		}
>>  	}
>> 
>> -	wcss->wcss_reset = devm_reset_control_get(dev, "wcss_reset");
>> +	wcss->wcss_reset = devm_reset_control_get_exclusive(dev, 
>> "wcss_reset");
> 
> Please submit this in a separate patch.
> 

Addressed in v3.

>>  	if (IS_ERR(wcss->wcss_reset)) {
>>  		dev_err(wcss->dev, "unable to acquire wcss_reset\n");
>>  		return PTR_ERR(wcss->wcss_reset);
>>  	}
>> 
>> -	wcss->wcss_q6_reset = devm_reset_control_get(dev, "wcss_q6_reset");
>> +	wcss->wcss_q6_reset = devm_reset_control_get_exclusive(dev, 
>> "wcss_q6_reset");
> 
> Ditto
> 
>>  	if (IS_ERR(wcss->wcss_q6_reset)) {
>>  		dev_err(wcss->dev, "unable to acquire wcss_q6_reset\n");
>>  		return PTR_ERR(wcss->wcss_q6_reset);
>> @@ -475,36 +823,73 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss 
>> *wcss)
>>  static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
>>  			       struct platform_device *pdev)
>>  {
>> +	struct device_node *syscon;
>>  	struct of_phandle_args args;
>>  	struct resource *res;
>>  	int ret;
>> 
>>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qdsp6");
>> -	wcss->reg_base = devm_ioremap_resource(&pdev->dev, res);
>> +	wcss->reg_base = devm_ioremap(&pdev->dev, res->start,
>> +				      resource_size(res));
> 
> Isn't this the same thing?
> 
>>  	if (IS_ERR(wcss->reg_base))
>>  		return PTR_ERR(wcss->reg_base);
>> 
>> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rmb");
>> -	wcss->rmb_base = devm_ioremap_resource(&pdev->dev, res);
>> -	if (IS_ERR(wcss->rmb_base))
>> -		return PTR_ERR(wcss->rmb_base);
>> -
>> -	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
>> -					       "qcom,halt-regs", 3, 0, &args);
>> -	if (ret < 0) {
>> -		dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");
>> -		return -EINVAL;
>> +	if (wcss->version == WCSS_QCS404) {
>> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>> +						   "q6stop");
>> +		if (!res) {
>> +			dev_err(&pdev->dev, "invalid q6stop_base resource\n");
>> +			return -EINVAL;
>> +		}
>> +
>> +		wcss->q6stop_base = devm_ioremap(&pdev->dev, res->start,
>> +						 resource_size(res));
>> +		if (IS_ERR(wcss->q6stop_base))
>> +			return PTR_ERR(wcss->q6stop_base);
>> +
>> +		syscon = of_parse_phandle(pdev->dev.of_node,
>> +					  "qcom,halt-regs", 0);
>> +		if (!syscon) {
>> +			dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");
>> +			return -EINVAL;
>> +		}
>> +
>> +		wcss->halt_map = syscon_node_to_regmap(syscon);
>> +		of_node_put(syscon);
>> +		if (IS_ERR(wcss->halt_map))
>> +			return PTR_ERR(wcss->halt_map);
>> +
>> +		ret = of_property_read_u32_index(pdev->dev.of_node,
>> +						 "qcom,halt-regs",
>> +						 1, &wcss->halt_wcss);
> 
> Okay, so the QCS404 doesn't need to halt q6 or nc?
> 

As per HPG doc, sequence does not have the same.

> I think you should change the fixed_args to
> of_property_read_variable_u32_array() and try not to duplicate this.
> 
>> +		if (ret < 0) {
>> +			dev_err(&pdev->dev, "no offset in syscon\n");
>> +			return ret;
>> +		}
>> +	} else {
>> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rmb");
>> +		wcss->rmb_base = devm_ioremap_resource(&pdev->dev, res);
>> +		if (IS_ERR(wcss->rmb_base))
>> +			return PTR_ERR(wcss->rmb_base);
>> +
>> +		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
>> +						       "qcom,halt-regs", 3,
>> +							0, &args);
>> +		if (ret < 0) {
>> +			dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");
>> +			return -EINVAL;
>> +		}
>> +
>> +		wcss->halt_map = syscon_node_to_regmap(args.np);
>> +		of_node_put(args.np);
>> +		if (IS_ERR(wcss->halt_map))
>> +			return PTR_ERR(wcss->halt_map);
>> +
>> +		wcss->halt_q6 = args.args[0];
>> +		wcss->halt_wcss = args.args[1];
>> +		wcss->halt_nc = args.args[2];
>>  	}
>> 
>> -	wcss->halt_map = syscon_node_to_regmap(args.np);
>> -	of_node_put(args.np);
>> -	if (IS_ERR(wcss->halt_map))
>> -		return PTR_ERR(wcss->halt_map);
>> -
>> -	wcss->halt_q6 = args.args[0];
>> -	wcss->halt_wcss = args.args[1];
>> -	wcss->halt_nc = args.args[2];
>> -
>>  	return 0;
>>  }
>> 
>> @@ -537,6 +922,144 @@ static int q6v5_alloc_memory_region(struct 
>> q6v5_wcss *wcss)
>>  	return 0;
>>  }
>> 
>> +static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
>> +{
>> +	int ret;
>> +
>> +	wcss->xo = devm_clk_get(wcss->dev, "xo");
>> +	if (IS_ERR(wcss->xo)) {
>> +		ret = PTR_ERR(wcss->xo);
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(wcss->dev, "failed to get xo clock");
>> +		return ret;
>> +	}
>> +
>> +	if (wcss->has_aggre2_clk) {
>> +		wcss->aggre2_clk = devm_clk_get(wcss->dev, "aggre2");
>> +		if (IS_ERR(wcss->aggre2_clk)) {
>> +			ret = PTR_ERR(wcss->aggre2_clk);
>> +			if (ret != -EPROBE_DEFER)
>> +				dev_err(wcss->dev,
>> +					"failed to get aggre2 clock");
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	wcss->gcc_abhs_cbcr = devm_clk_get(wcss->dev, "gcc_abhs_cbcr");
> 
> Please also update the binding to describe these clocks for this
> compatible.
> 
Addressed in v3.

> [..]
>> @@ -559,7 +1082,11 @@ static int q6v5_wcss_probe(struct 
>> platform_device *pdev)
>>  	wcss->dev = &pdev->dev;
>>  	wcss->pas_id = desc->pas_id;
>>  	wcss->version = desc->version;
>> -	wcss->crash_reason_smem = desc->crash_reason_smem;
>> +	wcss->has_aggre2_clk = desc->has_aggre2_clk;
>> +	wcss->aon_reset_required = desc->aon_reset_required;
>> +	platform_set_drvdata(pdev, wcss);
> 
> I don't see a platform_get_drvdata(), so do you really need this?
> 
>> +
>> +	wcss->version = desc->version;
>> 
>>  	ret = q6v5_wcss_init_mmio(wcss, pdev);
>>  	if (ret)
>> @@ -569,6 +1096,16 @@ static int q6v5_wcss_probe(struct 
>> platform_device *pdev)
>>  	if (ret)
>>  		goto free_rproc;
>> 
>> +	if (wcss->version == WCSS_QCS404) {
>> +		ret = q6v5_wcss_init_clock(wcss);
>> +		if (ret)
>> +			goto free_rproc;
>> +
>> +		ret = q6v5_wcss_init_regulator(wcss);
>> +		if (ret)
>> +			goto free_rproc;
> 
> Does the IPQ really not have any clocks or regulators?
> 
>> +	}
>> +
>>  	ret = q6v5_wcss_init_reset(wcss);
>>  	if (ret)
>>  		goto free_rproc;
>> @@ -578,6 +1115,14 @@ static int q6v5_wcss_probe(struct 
>> platform_device *pdev)
>>  	if (ret)
>>  		goto free_rproc;
>> 
>> +	if (wcss->version == WCSS_QCS404) {
>> +		qcom_add_glink_subdev(rproc, &wcss->glink_subdev);
>> +		qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, desc->ssr_name);
>> +		wcss->sysmon = qcom_add_sysmon_subdev(rproc,
>> +						      desc->sysmon_name,
>> +						      desc->ssctl_id);
> 
> Unless there's good reason I think you should just add these regardless
> of version.
> 
Addressed in v3.

>> +	}
>> +
>>  	ret = rproc_add(rproc);
>>  	if (ret)
>>  		goto free_rproc;
>> @@ -605,11 +1150,28 @@ static int q6v5_wcss_remove(struct 
>> platform_device *pdev)
>>  static const struct wcss_data wcss_ipq8074_res_init = {
>>  	.firmware_name = "IPQ8074/q6_fw.mdt",
>>  	.crash_reason_smem = 421,
>> +	.aon_reset_required = true,
>>  	.pas_handover = NULL,
>> +	.ops = &q6v5_wcss_ipq8074_ops,
>> +};
>> +
>> +static const struct wcss_data wcss_qcs404_res_init = {
>> +	.crash_reason_smem = 421,
>> +	.firmware_name = "wcnss.mdt",
>> +	.pas_id = 6,
> 
> Why does your non-PAS driver have a pas-id?
> 

Addressed in v3.

>> +	.version = WCSS_QCS404,
>> +	.has_aggre2_clk = false,
>> +	.aon_reset_required = false,
>> +	.ssr_name = "mpss",
>> +	.sysmon_name = "wcnss",
>> +	.ssctl_id = 0x12,
>> +	.ops = &q6v5_wcss_qcs404_ops,
>> +	.pas_handover = q6v5_wcss_pas_handover,
>>  };
>> 
>>  static const struct of_device_id q6v5_wcss_of_match[] = {
>> -	{ .compatible = "qcom,ipq8074-wcss-pil", .data = 
>> &wcss_ipq8074_res_init },
>> +	{ .compatible = "ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init 
>> },
> 
> You mistakenly dropped qcom, from the compatible here.
> 
Addressed in v3.


>> +	{ .compatible = "qcom,qcs404-wcss-non-pas", .data = 
>> &wcss_qcs404_res_init },
>> 
>>  	{ },
>>  };
> 
> Regards,
> Bjorn

BR,
Govind
