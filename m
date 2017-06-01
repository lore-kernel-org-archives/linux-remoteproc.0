Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v5 3/4] remoteproc: qcom: Make secure world call for mem
 ownership switch
References: <1496344641-6291-1-git-send-email-akdwived@codeaurora.org>
 <1496344641-6291-4-git-send-email-akdwived@codeaurora.org>
 <20170601204224.GB12920@tuxbook>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <613203ac-a1a1-05b1-db5c-a48003003b53@codeaurora.org>
Date: Fri, 2 Jun 2017 03:12:49 +0530
MIME-Version: 1.0
In-Reply-To: <20170601204224.GB12920@tuxbook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

Thanks lot many for such a blazing fast response :)

regarding your points.

a- Do you mean caller's of q6v5_xfer_mem_ownership() should pass two 
additional inputs i.e. *next_perm and *next_vmid

     and that based on successful return of qcom_scm_assign () they 
should be treated as *current_perm and *current_vmid

    by caller? if so caller will have to do flipping between MSS and 
HLOS, isn't it?

    Also code churning will increase this way, and also logging the way 
is being handled now may require to change again.

    or am i misunderstanding your proposal?

    Sorry for inconvenience, but if you could through little more light, 
that will help.


-Avaneesh


On 6/2/2017 2:12 AM, Bjorn Andersson wrote:
> On Thu 01 Jun 12:17 PDT 2017, Avaneesh Kumar Dwivedi wrote:
>
>> MSS proc on msm8996 can not access fw loaded region without stage
>> second translation of memory pages where mpss image are loaded.
>> This patch in order to enable mss boot on msm8996 invoke scm call
>> to switch or share ownership between apps and modem.
>>
> Overall this looks good now, I have two minor notes that I want you to
> fix up though.
>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
>> @@ -288,6 +290,40 @@ static struct resource_table *q6v5_find_rsc_table(struct rproc *rproc,
>>   	return &table;
>>   }
>>   
>> +static int q6v5_xfer_mem_ownership(struct q6v5 *qproc,
>> +				   int image, phys_addr_t addr,
> Rather than relying on a static int to keep track of current permissions
> pass a "int *current_perms", that you update on success.
>
> Add int mba_perm and int mpss_perm to the struct q6v5 and initialize
> them in probe and just keep the metadata_perm on the stack in
> q6v5_mpss_init_image.
>
>> +				   size_t size)
>> +{
>> +	static int current_owner[3][1] = {{BIT(QCOM_SCM_VMID_HLOS)},
>> +			{BIT(QCOM_SCM_VMID_HLOS)},
>> +			{BIT(QCOM_SCM_VMID_HLOS)} };
>> +	struct qcom_scm_vmperm next[] = {{0} };
> You don't need to initialize this, and if you just keep it "struct
> qcom_scm_vmperm next" you can pass it as &next in the
> qcom_scm_assign_mem() call.
>
>> +	int ret;
>> +
>> +	if (!qproc->need_mem_protection)
>> +		return 0;
>> +
>> +	if (current_owner[image][0] == BIT(QCOM_SCM_VMID_HLOS)) {
> And rather than making this flip back and forth with every call, I think
> it's more robust if you pass the new expected owner as a parameter to
> the function. Simplest way I can think of it to add a "bool
> remote_owner" as a parameter; it makes the changes minimal and works
> with the naming of the function.
>
>> +		next->vmid = QCOM_SCM_VMID_MSS_MSA;
>> +		next->perm = QCOM_SCM_PERM_RW;
>> +	} else {
>> +		next->vmid = QCOM_SCM_VMID_HLOS;
>> +		next->perm = QCOM_SCM_PERM_RWX;
>> +	}
>> +
>> +	ret = qcom_scm_assign_mem(addr, ALIGN(size, SZ_4K),
>> +		current_owner[image][0], next, 1);
>> +	if (ret < 0) {
>> +		pr_err("Failed to assign %s memory access in range %p to %p ret = %d\n",
>> +			(image == 0 ? "MDT" : image == 1 ? "MBA" : "MPSS"),
>> +			(void *)addr, (void *)(addr + size), ret);
>> +		return ret;
>> +	}
>> +
>> +	current_owner[image][0] = ret;
>> +	return 0;
>> +}
>> +
> Regards,
> Bjorn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
