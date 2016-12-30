Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v5 2/7] remoteproc: qcom: Add and initialize proxy and
 active clocks.
References: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
 <1481804490-8583-3-git-send-email-akdwived@codeaurora.org>
 <20161222214207.GA10519@minitux>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <89757411-df44-95c0-37a6-fb3395c6144c@codeaurora.org>
Date: Fri, 30 Dec 2016 16:20:16 +0530
MIME-Version: 1.0
In-Reply-To: <20161222214207.GA10519@minitux>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 12/23/2016 3:12 AM, Bjorn Andersson wrote:
> On Thu 15 Dec 04:21 PST 2016, Avaneesh Kumar Dwivedi wrote:
>
>> Certain regulators and clocks need voting by rproc on behalf of hexagon
>> only during restart operation but certain clocks and voltage need to be
>> voted till hexagon is up, these regulators and clocks are identified as
>> proxy and active resource respectively, whose handle is being obtained
>> by supplying proxy and active clock name string.
>>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pil.c | 65 +++++++++++++++++++++++++++-----------
>>   1 file changed, 47 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
>> index d875448..8c8b239 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pil.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
>> @@ -95,6 +95,8 @@
>>   
>>   struct rproc_hexagon_res {
>>   	const char *hexagon_mba_image;
>> +	char **proxy_clk_string;
>> +	char **active_clk_string;
> Use "name" instead of "string" in these variable names - i.e.
> proxy_clk_names and active_clk_names.
OK.
>
>>   };
>>   
>>   struct q6v5 {
>> @@ -114,6 +116,11 @@ struct q6v5 {
>>   	struct qcom_smem_state *state;
>>   	unsigned stop_bit;
>>   
>> +	struct clk *active_clks[8];
>> +	struct clk *proxy_clks[4];
>> +	int active_clk_count;
>> +	int proxy_clk_count;
>> +
>>   	struct regulator_bulk_data supply[4];
>>   
>>   	struct clk *ahb_clk;
>> @@ -706,27 +713,33 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
>>   	return 0;
>>   }
>>   
>> -static int q6v5_init_clocks(struct q6v5 *qproc)
>> +static int q6v5_init_clocks(struct device *dev, struct clk **clks,
>> +		char **clk_str)
> clk_names
OK.
>>   {
>> -	qproc->ahb_clk = devm_clk_get(qproc->dev, "iface");
>> -	if (IS_ERR(qproc->ahb_clk)) {
>> -		dev_err(qproc->dev, "failed to get iface clock\n");
>> -		return PTR_ERR(qproc->ahb_clk);
>> -	}
>> +	int count = 0;
>> +	int i;
>>   
>> -	qproc->axi_clk = devm_clk_get(qproc->dev, "bus");
>> -	if (IS_ERR(qproc->axi_clk)) {
>> -		dev_err(qproc->dev, "failed to get bus clock\n");
>> -		return PTR_ERR(qproc->axi_clk);
>> -	}
>> +	if (!clk_str)
>> +		return 0;
>> +
>> +	while (clk_str[count])
>> +		count++;
>> +
>> +	for (i = 0; i < count; i++) {
> You can squash these two loops into one, e.g. replace them with:
>
> for (i = 0; clk_str[i]; i++) {}
>
> and then return "i".
OK.
>> +		clks[i] = devm_clk_get(dev, clk_str[i]);
>> +		if (IS_ERR(clks[i])) {
>> +
>> +			int rc = PTR_ERR(clks[i]);
>> +
>> +			if (rc != -EPROBE_DEFER)
>> +				dev_err(dev, "Failed to get %s clock\n",
>> +					clk_str[i]);
>> +			return rc;
>> +		}
>>   
>> -	qproc->rom_clk = devm_clk_get(qproc->dev, "mem");
>> -	if (IS_ERR(qproc->rom_clk)) {
>> -		dev_err(qproc->dev, "failed to get mem clock\n");
>> -		return PTR_ERR(qproc->rom_clk);
>>   	}
>>   
>> -	return 0;
>> +	return count;
>>   }
>>   
>>   static int q6v5_init_reset(struct q6v5 *qproc)
>> @@ -843,9 +856,21 @@ static int q6v5_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto free_rproc;
>>   
>> -	ret = q6v5_init_clocks(qproc);
>> -	if (ret)
>> +	ret = q6v5_init_clocks(&pdev->dev, qproc->proxy_clks,
>> +					desc->proxy_clk_string);
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "Failed to setup proxy clocks.\n");
> Please replace "setup" with "acquire" or "get".
OK.
>
>> +		goto free_rproc;
>> +	}
>> +	qproc->proxy_clk_count = ret;
>> +
>> +	ret = q6v5_init_clocks(&pdev->dev, qproc->active_clks,
>> +					desc->active_clk_string);
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "Failed to setup active clocks.\n");
> Dito.
OK.
>>   		goto free_rproc;
>> +	}
>> +	qproc->active_clk_count = ret;
>>   
>>   	ret = q6v5_regulator_init(qproc);
>>   	if (ret)
>> @@ -901,10 +926,14 @@ static int q6v5_remove(struct platform_device *pdev)
>>   
>>   static const struct rproc_hexagon_res msm8916_mss = {
>>   	.hexagon_mba_image = "mba.mbn",
>> +	.proxy_clk_string = (char*[]){"xo", NULL},
>> +	.active_clk_string = (char*[]){"iface", "bus", "mem", NULL},
> Line wrap these list of clock names, like:
>
> 	.active_clk_string = (char*[]){
> 		"iface",
> 		"bus",
> 		"mem",
> 		NULL
> 	},
>
> Makes it consistent with the regulator
> patch and it's easier for me to read.
OK.
>
>>   };
>>   
>>   static const struct rproc_hexagon_res msm8974_mss = {
>>   	.hexagon_mba_image = "mba.b00",
>> +	.proxy_clk_string = (char*[]){"xo", NULL},
>> +	.active_clk_string = (char*[]){"iface", "bus", "mem", NULL},
> Dito
OK
>>   };
> If I apply this patch without patch 5 (Modify clock enable and disable
> interface) we will successfully probe with the new clocks, but we will
> not be able to boot because ahb_clk, axi_clk and rom_clk are NULL.
>
> When you're sending patches you should make sure that the code works
> (before and) after each patch that you introduce.
>
> So please squash patch 5 into this patch.
OK, will squash patches into functional units and send them.
>
>
> Other than that and these small style comments I think this patch looks
> good!
Thanks.
>
> Regards,
> Bjorn

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
