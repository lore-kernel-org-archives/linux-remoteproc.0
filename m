Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v3 2/4] remoteproc: qcom: Add additional agree2_clk and px
 regulator resource.
References: <1485788589-21968-1-git-send-email-akdwived@codeaurora.org>
 <1485788589-21968-3-git-send-email-akdwived@codeaurora.org>
 <20170130214657.GB31134@builder>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <8e0d5e13-3d91-0f00-ee1d-dae70370b30d@codeaurora.org>
Date: Tue, 31 Jan 2017 11:28:59 +0530
MIME-Version: 1.0
In-Reply-To: <20170130214657.GB31134@builder>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 1/31/2017 3:16 AM, Bjorn Andersson wrote:
> On Mon 30 Jan 07:03 PST 2017, Avaneesh Kumar Dwivedi wrote:
>
>> This patch add additional clock and regulator resource which are
>> initialized based on compatible and has no impact on existing driver
>> working. This resourse addition enable the existing driver to handle.
>> low pass sensor processor device also.
>>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> Applied, with below modification.
Thanks Bjorn, but please look below inline comment.
>> ---
>>   drivers/remoteproc/qcom_adsp_pil.c | 43 +++++++++++++++++++++++++++++++-------
>>   1 file changed, 36 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
> [..]
>>   static int adsp_init_regulator(struct qcom_adsp *adsp)
>>   {
>> -	adsp->cx_supply = devm_regulator_get(adsp->dev, "cx");
>> +	adsp->cx_supply = devm_regulator_get(adsp->dev, "vdd_cx");
> We should not change the name of devicetree properties, so I dropped
> "vdd_" on both of these.
I observed that giving "cx" or "px" string to devm_regulator_get() was 
returning with dummy regulator, and if i gave "vdd_cx" and "vdd_px" it 
did not print dummy regulator warning.
in device tree these regulators node were defined as "vdd_cx-supply" and 
"vdd_px-supply"
>
>>   	if (IS_ERR(adsp->cx_supply))
>>   		return PTR_ERR(adsp->cx_supply);
>>   
>>   	regulator_set_load(adsp->cx_supply, 100000);
>>   
>> +	adsp->px_supply = devm_regulator_get(adsp->dev, "vdd_px");
>> +	if (IS_ERR(adsp->px_supply))
>> +		return PTR_ERR(adsp->px_supply);
> Regards,
> Bjorn

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
