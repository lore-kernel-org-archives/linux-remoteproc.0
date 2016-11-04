Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH 1/5] remoteproc: Add q6v55 specific parameters and enable
 probing for q6v55
References: <1477324559-24752-1-git-send-email-akdwived@codeaurora.org>
 <1477324559-24752-2-git-send-email-akdwived@codeaurora.org>
 <20161025184708.GM7509@tuxbot>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Message-ID: <6169b510-c48b-d422-0e3d-8cdd3afca429@codeaurora.org>
Date: Fri, 4 Nov 2016 18:57:41 +0530
MIME-Version: 1.0
In-Reply-To: <20161025184708.GM7509@tuxbot>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, kaushalk@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 10/26/2016 12:17 AM, Bjorn Andersson wrote:
> On Mon 24 Oct 08:55 PDT 2016, Avaneesh Kumar Dwivedi wrote:
>
>> Adding required definition of parameters along with new structure
>> fields specific to q6v55 and enabling probe for q6v55 mss remote-
>> proc driver.
>>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  3 +-
>>   drivers/remoteproc/qcom_q6v5_pil.c                 | 33 ++++++++++++++++++++--
>>   2 files changed, 32 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> index 57cb49e..0986f8b 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>> @@ -7,7 +7,8 @@ on the Qualcomm Hexagon core.
>>   	Usage: required
>>   	Value type: <string>
>>   	Definition: must be one of:
>> -		    "qcom,q6v5-pil"
>> +		    "qcom,q6v5-pil",
>> +			"qcom,q6v55-pil"
>>   
>>   - reg:
>>   	Usage: required
>> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
>> index 2e0caaa..8df95a0 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pil.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
>> @@ -30,13 +30,14 @@
>>   #include <linux/reset.h>
>>   #include <linux/soc/qcom/smem.h>
>>   #include <linux/soc/qcom/smem_state.h>
>> +#include <linux/mutex.h>
>>   
>>   #include "remoteproc_internal.h"
>>   #include "qcom_mdt_loader.h"
>>   
>>   #include <linux/qcom_scm.h>
>>   
>> -#define MBA_FIRMWARE_NAME		"mba.b00"
>> +#define MBA_FIRMWARE_NAME		"mba.mbn"
> On 8974 we must load the mba.b00, on 8916 and 8996 we must load mba.mbn.
> But looking at downstream we seem to have:
>
> 8974: q6v5 -> mba.b00
> 8916: q6v56 -> mba.mbn
> 8996: q6v55 -> mba.mbn
>
> So we should be able to pick this based on compatible then.
OK, have take care of in patch set v2
>
>>   #define MPSS_FIRMWARE_NAME		"modem.mdt"
>>   
>>   #define MPSS_CRASH_REASON_SMEM		421
>> @@ -65,6 +66,8 @@
>>   #define QDSP6SS_RESET_REG		0x014
>>   #define QDSP6SS_GFMUX_CTL_REG		0x020
>>   #define QDSP6SS_PWR_CTL_REG		0x030
>> +#define QDSP6SS_MEM_PWR_CTL		0x0B0
>> +#define QDSP6SS_STRAP_ACC		0x110
>>   
>>   /* AXI Halt Register Offsets */
>>   #define AXI_HALTREQ_REG			0x0
>> @@ -93,13 +96,24 @@
>>   #define QDSS_BHS_ON			BIT(21)
>>   #define QDSS_LDO_BYP			BIT(22)
>>   
>> +/* QDSP6v55 parameters */
>> +#define QDSP6v55_LDO_BYP                BIT(25)
>> +#define QDSP6v55_BHS_ON                 BIT(24)
>> +#define QDSP6v55_CLAMP_WL               BIT(21)
>> +#define QDSP6v55_CLAMP_QMC_MEM          BIT(22)
>> +
>> +#define HALT_CHECK_MAX_LOOPS            (200)
>> +#define QDSP6SS_XO_CBCR                 (0x0038)
>> +
>> +#define QDSP6SS_ACC_OVERRIDE_VAL	0x20
>> +
>>   struct q6v5 {
>>   	struct device *dev;
>>   	struct rproc *rproc;
>>   
>>   	void __iomem *reg_base;
>>   	void __iomem *rmb_base;
>> -
>> +	void __iomem *restart_reg;
> The restart_reg is a register in the gcc, on 8974 this is exposed as a
> reset by gcc. Please add the GCC_MSS_RESTART to the list of resets in
> gcc-msm8996 rather than remapping and poking the register directly from
> this driver.
         Infact i had done it the way suggested above before i sent out 
initial
         patchset, but then when i discussed with internal clock team, 
they said they will
         not support MSS RESET to be done via GCC because

         "MSS_RESET is not a block reset, GCC reset controller is used 
only when we need a BCR to be reset,
         and which has a special purpose. MSS RESET doesn't fall under 
block resets, it is not a clock and
         cannot be associated with clock."

         Downstream also MSS RESET is programmed through dev_ioremap.
>
>>   	struct regmap *halt_map;
>>   	u32 halt_q6;
>>   	u32 halt_modem;
>> @@ -115,6 +129,13 @@ struct q6v5 {
>>   	struct clk *ahb_clk;
>>   	struct clk *axi_clk;
>>   	struct clk *rom_clk;
>> +	struct clk *gpll0_mss_clk;
>> +	struct clk *snoc_axi_clk;
>> +	struct clk *mnoc_axi_clk;
>> +
>> +	struct clk *xo;
>> +	struct clk *pnoc_clk;
>> +	struct clk *qdss_clk;
> Please introduce these changes as they are needed by the implementation,
> rather than in a separate patch. It makes it much much easier to review.
OK, have take care of in patch set v2
>
>>   
>>   	struct completion start_done;
>>   	struct completion stop_done;
>> @@ -128,13 +149,18 @@ struct q6v5 {
>>   	phys_addr_t mpss_reloc;
>>   	void *mpss_region;
>>   	size_t mpss_size;
>> +	struct mutex q6_lock;
>> +	u32 boot_count;
>> +	bool unvote_flag;
>> +	bool is_q6v55;
>> +	bool ahb_clk_vote;
> Dito
>
>>   };
>>   
>>   enum {
>>   	Q6V5_SUPPLY_CX,
>>   	Q6V5_SUPPLY_MX,
>> -	Q6V5_SUPPLY_MSS,
>>   	Q6V5_SUPPLY_PLL,
>> +	Q6V5_SUPPLY_MSS,
>>   };
>>   
>>   static int q6v5_regulator_init(struct q6v5 *qproc)
>> @@ -892,6 +918,7 @@ static int q6v5_remove(struct platform_device *pdev)
>>   
>>   static const struct of_device_id q6v5_of_match[] = {
>>   	{ .compatible = "qcom,q6v5-pil", },
>> +	{ .compatible = "qcom,q6v55-pil", },
> Just out of curiosity, is the version 55 or 5.5?
Version is q6v56 1.3
>
>>   	{ },
>>   };
> Regards,
> Bjorn
