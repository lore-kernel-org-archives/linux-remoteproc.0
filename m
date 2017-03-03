Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v2 1/3] soc: qcom: Add scm call to protect modem mem in
 qcom scm driver.
References: <1485773044-31489-1-git-send-email-akdwived@codeaurora.org>
 <1485773044-31489-2-git-send-email-akdwived@codeaurora.org>
 <20170227225558.GF25384@codeaurora.org>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <7b911c98-92d4-adc3-a1a0-234c7d897841@codeaurora.org>
Date: Fri, 3 Mar 2017 23:35:26 +0530
MIME-Version: 1.0
In-Reply-To: <20170227225558.GF25384@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: bjorn.andersson@linaro.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 2/28/2017 4:25 AM, Stephen Boyd wrote:
> On 01/30, Avaneesh Kumar Dwivedi wrote:
>> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
>> index 893f953ea..f476803 100644
>> --- a/drivers/firmware/qcom_scm.c
>> +++ b/drivers/firmware/qcom_scm.c
>> @@ -292,6 +292,20 @@ int qcom_scm_pas_shutdown(u32 peripheral)
>>   }
>>   EXPORT_SYMBOL(qcom_scm_pas_shutdown);
>>   
>> +/**
>> + * qcom_scm_assign_mem() - Apply new access permission of DDR
>> + * region passed via descriptor and does second stage
>> + * translation of intermediate physical address.
>> + * @desc: descriptor to send to hypervisor
>> + *
>> + * Return 0 on success.
>> + */
>> +int qcom_scm_assign_mem(void *desc)
> Please don't pass a void pointer here. Driver authors shouldn't
> need to know about qcom_scm_desc. This should be an API that the
> driver can use without knowing intimate firmware details.
OK, so i will try to move hyp_mem_assign() to qcom_scm driver, as suggested.
this way the above issue will also get resolved.
>
>> +{
>> +	return __qcom_scm_assign_mem(__scm->dev, desc);
>> +}
>> +EXPORT_SYMBOL(qcom_scm_assign_mem);
>> +
>>   static int qcom_scm_pas_reset_assert(struct reset_controller_dev *rcdev,
>>   				     unsigned long idx)
>>   {
>> diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
>> index 3584b00..d88fd4b 100644
>> --- a/drivers/firmware/qcom_scm.h
>> +++ b/drivers/firmware/qcom_scm.h
>> @@ -47,6 +47,8 @@ extern int __qcom_scm_hdcp_req(struct device *dev,
>>   #define QCOM_SCM_PAS_SHUTDOWN_CMD	0x6
>>   #define QCOM_SCM_PAS_IS_SUPPORTED_CMD	0x7
>>   #define QCOM_SCM_PAS_MSS_RESET		0xa
>> +#define QCOM_SCM_SVC_MP				0xc
>> +#define QCOM_MEM_PROT_ASSIGN_ID		0x16
> Presumably these should go near the newly introduced functions
> like how the rest of this file is organized.
OK.
>
>>   extern bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral);

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
