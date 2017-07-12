Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v6 1/4] firmware: scm: Add new SCM call API for switching
 memory ownership
References: <1498133333-21291-1-git-send-email-akdwived@codeaurora.org>
 <1498133333-21291-2-git-send-email-akdwived@codeaurora.org>
 <20170710234335.GF1618@tuxbook>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <e7cb9047-1bf2-e178-3501-59deae207427@codeaurora.org>
Date: Wed, 12 Jul 2017 16:34:53 +0530
MIME-Version: 1.0
In-Reply-To: <20170710234335.GF1618@tuxbook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 7/11/2017 5:13 AM, Bjorn Andersson wrote:
> On Thu 22 Jun 05:08 PDT 2017, Avaneesh Kumar Dwivedi wrote:
>
>> Two different processors on a SOC need to switch memory ownership
>> during load/unload. To enable this, second level memory map table
>> need to be updated, which is done by secure layer.
>> This patch adds the interface for making secure monitor call for
>> memory ownership switching request.
>>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> ---
>>   drivers/firmware/qcom_scm-32.c |  6 +++
>>   drivers/firmware/qcom_scm-64.c | 27 +++++++++++++
>>   drivers/firmware/qcom_scm.c    | 92 ++++++++++++++++++++++++++++++++++++++++++
>>   drivers/firmware/qcom_scm.h    |  5 +++
>>   include/linux/qcom_scm.h       | 16 ++++++++
>>   5 files changed, 146 insertions(+)
>>
>> diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
>> index 93e3b96..a5e038d 100644
>> --- a/drivers/firmware/qcom_scm-32.c
>> +++ b/drivers/firmware/qcom_scm-32.c
>> @@ -596,3 +596,9 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
>>   {
>>   	return -ENODEV;
>>   }
>> +int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
>> +			  size_t mem_sz, phys_addr_t src, size_t src_sz,
>> +			  phys_addr_t dest, size_t dest_sz)
>> +{
>> +	return -ENODEV;
>> +}
>> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
>> index 6e6d561..cdfe986 100644
>> --- a/drivers/firmware/qcom_scm-64.c
>> +++ b/drivers/firmware/qcom_scm-64.c
>> @@ -439,3 +439,30 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
>>   
>>   	return ret;
>>   }
>> +
>> +int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
>> +			  size_t mem_sz, phys_addr_t src, size_t src_sz,
>> +			  phys_addr_t dest, size_t dest_sz)
>> +{
>> +	int ret;
>> +	struct qcom_scm_desc desc = {0};
>> +	struct arm_smccc_res res;
>> +
>> +	desc.args[0] = mem_region;
>> +	desc.args[1] = mem_sz;
>> +	desc.args[2] = src;
>> +	desc.args[3] = src_sz;
>> +	desc.args[4] = dest;
>> +	desc.args[5] = dest_sz;
>> +	desc.args[6] = 0;
>> +
>> +	desc.arginfo = QCOM_SCM_ARGS(7, QCOM_SCM_RO, QCOM_SCM_VAL,
>> +				QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_RO,
>> +				QCOM_SCM_VAL, QCOM_SCM_VAL);
>> +
>> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
>> +				QCOM_MEM_PROT_ASSIGN_ID,
>> +				&desc, &res);
> Please indent broken lines by the start parenthesis, throughout the
> patch, this makes the code easier to read.  You can run checkpatch.pl
> with the --strict flag to show a few other places below that has the
> same issue.
>
>
> Please clean these up together with the dma allocation and the return
> value as pointed out by Stephen and I'm happy to pick the series up.

Sure, thank you, will do and send out by eod tomorrow.
>
> Regards,
> Bjorn

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
