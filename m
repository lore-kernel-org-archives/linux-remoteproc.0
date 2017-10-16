Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v7 3/4] remoteproc: qcom: Make secure world call for mem
 ownership switch
References: <1500634173-24416-1-git-send-email-akdwived@codeaurora.org>
 <1500634173-24416-4-git-send-email-akdwived@codeaurora.org>
 <20171012181805.GF1165@minitux>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <614163ca-3c51-3381-a3cc-62f19176b23e@codeaurora.org>
Date: Mon, 16 Oct 2017 18:48:30 +0530
MIME-Version: 1.0
In-Reply-To: <20171012181805.GF1165@minitux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 10/12/2017 11:48 PM, Bjorn Andersson wrote:
> On Fri 21 Jul 03:49 PDT 2017, Avaneesh Kumar Dwivedi wrote:
>
>> MSS proc on msm8996 can not access fw loaded region without stage
>> second translation of memory pages where mpss image are loaded.
>> This patch in order to enable mss boot on msm8996 invoke scm call
>> to switch or share ownership between apps and modem.
>>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> ---
>>   drivers/remoteproc/qcom_q6v5_pil.c | 90 ++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 87 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> [..]
>> +static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
>> +				   bool remote_owner, phys_addr_t addr,
>> +				   size_t size)
>> +{
>> +	struct qcom_scm_vmperm next;
>> +	int ret;
>> +
>> +	if (!qproc->need_mem_protection)
>> +		return 0;
>> +	if (remote_owner && *current_perm == BIT(QCOM_SCM_VMID_MSS_MSA))
>> +		return 0;
>> +	if (!remote_owner && *current_perm == BIT(QCOM_SCM_VMID_HLOS))
>> +		return 0;
>> +
>> +	next.vmid = remote_owner ? QCOM_SCM_VMID_MSS_MSA : QCOM_SCM_VMID_HLOS;
>> +	next.perm = remote_owner ? QCOM_SCM_PERM_RW : QCOM_SCM_PERM_RWX;
>> +
>> +	ret = qcom_scm_assign_mem(addr, ALIGN(size, SZ_4K),
>> +				  *current_perm, &next, 1);
>> +	if (ret < 0) {
>> +		pr_err("Failed to assign memory access in range %p to %p to %s ret = %d\n",
>> +		       (void *)addr, (void *)(addr + size),
>> +		       remote_owner ? "mss" : "hlos", ret);
> qcom_scm_assign_mem() also prints an error when this happens, there's no
> need for that. I'm happy with you dropping the print from
> qcom_scm_assign_mem() and keeping this one.
>
>> +		return ret;
>> +	}
>> +
>> +	*current_perm = ret;
>> +	return 0;
>> +}
>> +
>>   static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>>   {
>>   	struct q6v5 *qproc = rproc->priv;
>> @@ -450,6 +484,8 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>>   {
>>   	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
>>   	dma_addr_t phys;
>> +	int mdata_perm;
>> +	int xferop_ret;
>>   	void *ptr;
>>   	int ret;
>>   
>> @@ -461,6 +497,12 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>>   
>>   	memcpy(ptr, fw->data, fw->size);
>>   
>> +	/* Hypervisor mapping to access metadata by modem */
>> +	mdata_perm = BIT(QCOM_SCM_VMID_HLOS);
>> +	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm,
>> +				      1, phys, fw->size);
> Please use "true" instead of "1".
OK Sure, will do it.
>> +	if (ret)
>> +		return -EAGAIN;
> Please keep a empty line here, to keep the "paragraphs" or "chunks" of
> code split up.
OK.
>
>>   	writel(phys, qproc->rmb_base + RMB_PMI_META_DATA_REG);
>>   	writel(RMB_CMD_META_DATA_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
>>   
> Regards,
> Bjorn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remoteproc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
