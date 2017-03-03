Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: Add msm8996 specific changes in
 mss rproc driver.
References: <1485773044-31489-1-git-send-email-akdwived@codeaurora.org>
 <1485773044-31489-4-git-send-email-akdwived@codeaurora.org>
 <20170227224800.GE25384@codeaurora.org>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <82ef090c-71fb-dd20-f54b-b52931e78d08@codeaurora.org>
Date: Fri, 3 Mar 2017 23:43:12 +0530
MIME-Version: 1.0
In-Reply-To: <20170227224800.GE25384@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: bjorn.andersson@linaro.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 2/28/2017 4:18 AM, Stephen Boyd wrote:
> On 01/30, Avaneesh Kumar Dwivedi wrote:
>> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
>> index 35eee68..9c12a36 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pil.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
>> @@ -485,35 +497,99 @@ static int q6v5_rmb_mba_wait(struct q6v5 *qproc, u32 status, int ms)
>>   
>>   static int q6v5proc_reset(struct q6v5 *qproc)
>>   {
>> -	u32 val;
>> +	u64 val;
> Why u64? There isn't any readq/writeq usage here.
OK
>
>>   	int ret;
>> +	int i;
>>   
> [...]
>> +	if (qproc->version == MSS_MSM8996) {
>> +		/* Override the ACC value if required */
>> +		writel(QDSP6SS_ACC_OVERRIDE_VAL,
>> +			qproc->reg_base + QDSP6SS_STRAP_ACC);
>> +
>> +		/* Assert resets, stop core */
>> +		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
>> +		val |= (Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE);
> Useless parenthesis.
ok
>
>> +		writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
>> +
>> +		/* BHS require xo cbcr to be enabled */
>> +		val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
>> +		val |= 0x1;
>> +		writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
>>   
>> +		/* Read CLKOFF bit to go low indicating CLK is enabled */
>> +		ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_XO_CBCR,
>> +				val, !(val & BIT(31)), 1, HALT_CHECK_MAX_LOOPS);
>> +		if (ret) {
>> +			dev_err(qproc->dev,
>> +				"xo cbcr enabling timed out (rc:%d)\n", ret);
>> +			return ret;
>> +		}
>> +		/* Enable power block headswitch and wait for it to stabilize */
>> +		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		val |= QDSP6v56_BHS_ON;
>> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		udelay(1);
>> +
>> +		/* Put LDO in bypass mode */
>> +		val |= QDSP6v56_LDO_BYP;
>> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +
>> +		/* Deassert QDSP6 compiler memory clamp */
>> +		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		val &= ~QDSP6v56_CLAMP_QMC_MEM;
>> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +
>> +		/* Deassert memory peripheral sleep and L2 memory standby */
>> +		val |= (Q6SS_L2DATA_STBY_N | Q6SS_SLP_RET_N);
> Useless parenthesis.
ok
>
>> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +
>> +		/* Turn on L1, L2, ETB and JU memories 1 at a time */
>> +		val = readl(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
>> +		for (i = 19; i >= 0; i--) {
>> +			val |= BIT(i);
>> +			writel(val, qproc->reg_base +
>> +						QDSP6SS_MEM_PWR_CTL);
>> +			/*
>> +			 * Read back value to ensure the write is done then
>> +			 * wait for 1us for both memory peripheral and data
>> +			 * array to turn on.
>> +			 */
>> +			val |= readl(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
>> +			udelay(1);
>> +		}
>> +		/* Remove word line clamp */
>> +		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		val &= ~QDSP6v56_CLAMP_WL;
>> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +	} else {
>> +		/* Assert resets, stop core */
>> +		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
>> +		val |= (Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE);
> Useless parenthesis.
ok
>
>> +		writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
>> +
>> +		/* Enable power block headswitch and wait for it to stabilize */
>> +		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		val |= QDSS_BHS_ON | QDSS_LDO_BYP;
>> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		val |= readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		udelay(1);
>> @@ -849,6 +925,7 @@ static int q6v5_stop(struct rproc *rproc)
>>   {
>>   	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
>>   	int ret;
>> +	int val;
> u32 instead of int?
ok
>
>>   
>>   	qproc->running = false;
>>   
>> @@ -866,6 +943,15 @@ static int q6v5_stop(struct rproc *rproc)
>>   	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
>>   	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
>>   
>> +	if (qproc->version == MSS_MSM8996) {
>> +		/*
>> +		 * To avoid high MX current during LPASS/MSS restart.
>> +		 */
> Three lines could be one line comment instead.
ok.
>
>> +		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		val |= Q6SS_CLAMP_IO | QDSP6v56_CLAMP_WL |
>> +			QDSP6v56_CLAMP_QMC_MEM;
>> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +	}
>>   	reset_control_assert(qproc->mss_restart);
>>   	q6v5_clk_disable(qproc->dev, qproc->active_clks,
>>   				qproc->active_clk_count);
>> @@ -1213,6 +1299,47 @@ static int q6v5_remove(struct platform_device *pdev)
>>   	return 0;
>>   }
>>   
>> +static const struct rproc_hexagon_res msm8996_mss = {
>> +	.hexagon_mba_image = "mba.mbn",
>> +	.proxy_supply = (struct qcom_mss_reg_res[]) {
>> +		{
>> +			.supply = "vdd_mx",
>> +			.uV = 6,
>> +		},
>> +		{
>> +			.supply = "vdd_cx",
>> +			.uV = 7,
>> +			.uA = 100000,
>> +		},
> vdd cx and vdd mx are corners. The plan is to _not_ use the
> regulator framework for those, so treating them like supplies is
> incorrect here.
vdd cx and mx though in downstream are voted for corner but they are 
always ON domain upstream as per regulator team when i discussed with them.
should i drop them altogether?
>
>> +		{
>> +			.supply = "vdd_pll",
>> +			.uV = 1800000,
>> +			.uA = 100000,
>> +		},
>> +		{}
>> +	},

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
