Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v3 3/3] remoteproc: qcom: Adding q6v56 reset sequence.
References: <1478522240-11036-1-git-send-email-akdwived@codeaurora.org>
 <1478522240-11036-4-git-send-email-akdwived@codeaurora.org>
 <20161108065515.GK25787@tuxbot>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Message-ID: <2f0e1e1f-4d72-43af-35cd-a26ed5e8b986@codeaurora.org>
Date: Wed, 16 Nov 2016 20:48:11 +0530
MIME-Version: 1.0
In-Reply-To: <20161108065515.GK25787@tuxbot>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 11/8/2016 12:25 PM, Bjorn Andersson wrote:
> On Mon 07 Nov 04:37 PST 2016, Avaneesh Kumar Dwivedi wrote:
>
>> Adding additional reset sequence steps required specific
>> to q6v56 based on version check, along with some trivial
>> changes in name of local functions.
>>
> Please don't change readl/writel to their relaxed version in the same
> commit as you do functional changes. And please don't change function
> names here either.
>
> Both makes the review really hard and the actual changes non-obvious.

Ok, corrected.
>
> Regards,
> Bjorn
>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pil.c | 132 +++++++++++++++++++++++++++----------
>>   1 file changed, 98 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
>> index 1fc505b..68eda4f 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pil.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
>> @@ -66,6 +66,8 @@
>>   #define QDSP6SS_RESET_REG		0x014
>>   #define QDSP6SS_GFMUX_CTL_REG		0x020
>>   #define QDSP6SS_PWR_CTL_REG		0x030
>> +#define QDSP6SS_MEM_PWR_CTL		0x0B0
>> +#define QDSP6SS_STRAP_ACC		0x110
>>   
>>   /* AXI Halt Register Offsets */
>>   #define AXI_HALTREQ_REG			0x0
>> @@ -94,8 +96,14 @@
>>   #define QDSS_BHS_ON			BIT(21)
>>   #define QDSS_LDO_BYP			BIT(22)
>>   
>> +/* QDSP6v56 parameters */
>> +#define QDSP6v56_LDO_BYP                BIT(25)
>> +#define QDSP6v56_BHS_ON                 BIT(24)
>>   #define QDSP6v56_CLAMP_WL               BIT(21)
>>   #define QDSP6v56_CLAMP_QMC_MEM          BIT(22)
>> +#define HALT_CHECK_MAX_LOOPS            (200)
>> +#define QDSP6SS_XO_CBCR                 (0x0038)
>> +#define QDSP6SS_ACC_OVERRIDE_VAL	0x20
>>   struct q6_rproc_res {
>>   	char **proxy_clks;
>>   	int proxy_clk_cnt;
>> @@ -389,7 +397,8 @@ static void pil_mss_restart_reg(struct q6v5 *qproc, u32 mss_restart)
>>   		udelay(2);
>>   	}
>>   }
>> -static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>> +
>> +static int q6_load(struct rproc *rproc, const struct firmware *fw)
>>   {
>>   	struct q6v5 *qproc = rproc->priv;
>>   
>> @@ -400,10 +409,10 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>>   
>>   static const struct rproc_fw_ops q6_fw_ops = {
>>   	.find_rsc_table = qcom_mdt_find_rsc_table,
>> -	.load = q6v5_load,
>> +	.load = q6_load,
>>   };
>>   
>> -static int q6v5_rmb_pbl_wait(struct q6v5 *qproc, int ms)
>> +static int q6_rmb_pbl_wait(struct q6v5 *qproc, int ms)
>>   {
>>   	unsigned long timeout;
>>   	s32 val;
>> @@ -423,7 +432,7 @@ static int q6v5_rmb_pbl_wait(struct q6v5 *qproc, int ms)
>>   	return val;
>>   }
>>   
>> -static int q6v5_rmb_mba_wait(struct q6v5 *qproc, u32 status, int ms)
>> +static int q6_rmb_mba_wait(struct q6v5 *qproc, u32 status, int ms)
>>   {
>>   
>>   	unsigned long timeout;
>> @@ -449,40 +458,95 @@ static int q6v5_rmb_mba_wait(struct q6v5 *qproc, u32 status, int ms)
>>   	return val;
>>   }
>>   
>> -static int q6v5proc_reset(struct q6v5 *qproc)
>> +static int q6proc_reset(struct q6v5 *qproc)
>>   {
>> -	u32 val;
>> -	int ret;
>> +	int ret, i, count;
>> +	u64 val;
>> +
>> +	/* Override the ACC value if required */
>> +	if (!strcmp(qproc->q6_rproc_res->q6_version, "v56"))
>> +		writel_relaxed(QDSP6SS_ACC_OVERRIDE_VAL,
>> +				qproc->reg_base + QDSP6SS_STRAP_ACC);
>>   
>>   	/* Assert resets, stop core */
>> -	val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
>> +	val = readl_relaxed(qproc->reg_base + QDSP6SS_RESET_REG);
>>   	val |= (Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE);
>> -	writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
>> +	writel_relaxed(val, qproc->reg_base + QDSP6SS_RESET_REG);
>>   
>> +	/* BHS require xo cbcr to be enabled */
>> +	if (!strcmp(qproc->q6_rproc_res->q6_version, "v56")) {
>> +		val = readl_relaxed(qproc->reg_base + QDSP6SS_XO_CBCR);
>> +		val |= 0x1;
>> +		writel_relaxed(val, qproc->reg_base + QDSP6SS_XO_CBCR);
>> +		for (count = HALT_CHECK_MAX_LOOPS; count > 0; count--) {
>> +			val = readl_relaxed(qproc->reg_base + QDSP6SS_XO_CBCR);
>> +			if (!(val & BIT(31)))
>> +				break;
>> +			udelay(1);
>> +		}
>> +
>> +		val = readl_relaxed(qproc->reg_base + QDSP6SS_XO_CBCR);
>> +		if ((val & BIT(31)))
>> +			dev_err(qproc->dev, "Failed to enable xo branch clock.\n");
>> +	}
>>   	/* Enable power block headswitch, and wait for it to stabilize */
>> -	val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> -	val |= QDSS_BHS_ON | QDSS_LDO_BYP;
>> -	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +	val = readl_relaxed(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +	val |= QDSP6v56_BHS_ON;
>> +	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>>   	udelay(1);
>>   
>> -	/*
>> -	 * Turn on memories. L2 banks should be done individually
>> -	 * to minimize inrush current.
>> -	 */
>> -	val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> -	val |= Q6SS_SLP_RET_N | Q6SS_L2TAG_SLP_NRET_N |
>> -		Q6SS_ETB_SLP_NRET_N | Q6SS_L2DATA_STBY_N;
>> -	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> -	val |= Q6SS_L2DATA_SLP_NRET_N_2;
>> -	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> -	val |= Q6SS_L2DATA_SLP_NRET_N_1;
>> -	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> -	val |= Q6SS_L2DATA_SLP_NRET_N_0;
>> -	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +	/* Put LDO in bypass mode */
>> +	val |= QDSP6v56_LDO_BYP;
>> +	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +
>> +	if (!strcmp(qproc->q6_rproc_res->q6_version, "v56")) {
>> +		/*
>> +		 * Deassert QDSP6 compiler memory clamp
>> +		 */
>> +		val = readl_relaxed(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		val &= ~QDSP6v56_CLAMP_QMC_MEM;
>> +		writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +
>> +		/* Deassert memory peripheral sleep and L2 memory standby */
>> +		val |= (Q6SS_L2DATA_STBY_N | Q6SS_SLP_RET_N);
>> +		writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>>   
>> +		/* Turn on L1, L2, ETB and JU memories 1 at a time */
>> +		val = readl_relaxed(qproc->reg_base + QDSP6SS_MEM_PWR_CTL);
>> +		for (i = 19; i >= 0; i--) {
>> +			val |= BIT(i);
>> +			writel_relaxed(val, qproc->reg_base +
>> +						QDSP6SS_MEM_PWR_CTL);
>> +			/*
>> +			 * Wait for 1us for both memory peripheral and
>> +			 * data array to turn on.
>> +			 */
>> +			 mb();
>> +			udelay(1);
>> +		}
>> +		/* Remove word line clamp */
>> +		val = readl_relaxed(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		val &= ~QDSP6v56_CLAMP_WL;
>> +		writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +	} else {
>> +		/*
>> +		 * Turn on memories. L2 banks should be done individually
>> +		 * to minimize inrush current.
>> +		 */
>> +		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		val |= Q6SS_SLP_RET_N | Q6SS_L2TAG_SLP_NRET_N |
>> +			Q6SS_ETB_SLP_NRET_N | Q6SS_L2DATA_STBY_N;
>> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		val |= Q6SS_L2DATA_SLP_NRET_N_2;
>> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		val |= Q6SS_L2DATA_SLP_NRET_N_1;
>> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +		val |= Q6SS_L2DATA_SLP_NRET_N_0;
>> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +	}
>>   	/* Remove IO clamp */
>>   	val &= ~Q6SS_CLAMP_IO;
>> -	writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>> +	writel_relaxed(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>>   
>>   	/* Bring core out of reset */
>>   	val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
>> @@ -490,9 +554,9 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>   	writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
>>   
>>   	/* Turn on core clock */
>> -	val = readl(qproc->reg_base + QDSP6SS_GFMUX_CTL_REG);
>> +	val = readl_relaxed(qproc->reg_base + QDSP6SS_GFMUX_CTL_REG);
>>   	val |= Q6SS_CLK_ENABLE;
>> -	writel(val, qproc->reg_base + QDSP6SS_GFMUX_CTL_REG);
>> +	writel_relaxed(val, qproc->reg_base + QDSP6SS_GFMUX_CTL_REG);
>>   
>>   	/* Start core execution */
>>   	val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
>> @@ -500,7 +564,7 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>   	writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
>>   
>>   	/* Wait for PBL status */
>> -	ret = q6v5_rmb_pbl_wait(qproc, 1000);
>> +	ret = q6_rmb_pbl_wait(qproc, 1000);
>>   	if (ret == -ETIMEDOUT) {
>>   		dev_err(qproc->dev, "PBL boot timed out\n");
>>   	} else if (ret != RMB_PBL_SUCCESS) {
>> @@ -560,7 +624,7 @@ static int q6_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>>   	writel(phys, qproc->rmb_base + RMB_PMI_META_DATA_REG);
>>   	writel(RMB_CMD_META_DATA_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
>>   
>> -	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_META_DATA_AUTH_SUCCESS, 1000);
>> +	ret = q6_rmb_mba_wait(qproc, RMB_MBA_META_DATA_AUTH_SUCCESS, 1000);
>>   	if (ret == -ETIMEDOUT)
>>   		dev_err(qproc->dev, "MPSS header authentication timed out\n");
>>   	else if (ret < 0)
>> @@ -618,7 +682,7 @@ static int q6_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
>>   		writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
>>   	}
>>   
>> -	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 10000);
>> +	ret = q6_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 10000);
>>   	if (ret == -ETIMEDOUT)
>>   		dev_err(qproc->dev, "MPSS authentication timed out\n");
>>   	else if (ret < 0)
>> @@ -704,11 +768,11 @@ static int q6_start(struct rproc *rproc)
>>   
>>   	writel_relaxed(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
>>   
>> -	ret = q6v5proc_reset(qproc);
>> +	ret = q6proc_reset(qproc);
>>   	if (ret)
>>   		goto halt_axi_ports;
>>   
>> -	ret = q6v5_rmb_mba_wait(qproc, 0, 5000);
>> +	ret = q6_rmb_mba_wait(qproc, 0, 5000);
>>   	if (ret == -ETIMEDOUT) {
>>   		dev_err(qproc->dev, "MBA boot timed out\n");
>>   		goto halt_axi_ports;
>> -- 
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project.
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
