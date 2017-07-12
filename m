Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v6 1/4] firmware: scm: Add new SCM call API for switching
 memory ownership
References: <1498133333-21291-1-git-send-email-akdwived@codeaurora.org>
 <1498133333-21291-2-git-send-email-akdwived@codeaurora.org>
 <20170707224956.GK22780@codeaurora.org>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <13defb94-dac3-097d-f3c6-088385b909a5@codeaurora.org>
Date: Wed, 12 Jul 2017 16:33:08 +0530
MIME-Version: 1.0
In-Reply-To: <20170707224956.GK22780@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: bjorn.andersson@linaro.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 7/8/2017 4:19 AM, Stephen Boyd wrote:
> On 06/22, Avaneesh Kumar Dwivedi wrote:
>> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
>> index 6e6d561..cdfe986 100644
>> --- a/drivers/firmware/qcom_scm-64.c
>> +++ b/drivers/firmware/qcom_scm-64.c
>> @@ -292,6 +304,86 @@ int qcom_scm_pas_shutdown(u32 peripheral)
>>   }
>>   EXPORT_SYMBOL(qcom_scm_pas_shutdown);
>>   
>> +/**
>> + * qcom_scm_assign_mem() - Make a secure call to reassign memory ownership
>> + *
>> + * @mem_addr: mem region whose ownership need to be reassigned
>> + * @mem_sz:   size of the region.
>> + * @srcvm:    vmid for current set of owners, each set bit in
>> + *            flag indicate a unique owner
>> + * @newvm:    array having new owners and corrsponding permission
>> + *            flags
>> + * @dest_cnt: number of owners in next set.
>> + * Return next set of owners on success.
>> + */
>> +int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz, int srcvm,
>> +			struct qcom_scm_vmperm *newvm, int dest_cnt)
>> +{
>> +	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
> Why do we need this? Just curious if we can drop this.
The force contiguous flag is required with dma_alloc_attrs() api to 
allocate memory from physically contiguous zone.
I am not sure, are you saying that api will work without the attribute 
or you mean i shall use some api which does not take explicit attribute?
>
>> +	struct qcom_scm_current_perm_info *destvm;
>> +	struct qcom_scm_mem_map_info *mem;
>> +	phys_addr_t memory_phys;
>> +	phys_addr_t dest_phys;
>> +	phys_addr_t src_phys;
>> +	size_t mem_all_sz;
>> +	size_t memory_sz;
>> +	size_t dest_sz;
>> +	size_t src_sz;
>> +	int next_vm;
>> +	__le32 *src;
>> +	void *ptr;
>> +	int ret;
>> +	int len;
>> +	int i;
>> +
>> +	src_sz = hweight_long(srcvm) * sizeof(*src);
>> +	memory_sz = sizeof(*mem);
>> +	dest_sz = dest_cnt*sizeof(*destvm);
>> +	mem_all_sz = src_sz + memory_sz + dest_sz;
>> +
>> +	ptr = dma_alloc_attrs(__scm->dev, ALIGN(mem_all_sz, SZ_64),
>> +		&src_phys, GFP_KERNEL, dma_attrs);
>> +	if (!ptr)
>> +		return -ENOMEM;
>> +
>> +	/* Fill source vmid detail */
>> +	src = (__le32 *)ptr;
> Cast is necessary?
i removed many type casting but few still lingering, will check and 
remove whatever unnecessary.
>
>> +	len = hweight_long(srcvm);
>> +	for (i = 0; i < len; i++) {
>> +		src[i] = cpu_to_le32(ffs(srcvm) - 1);
>> +		srcvm ^= 1 << (ffs(srcvm) - 1);
>> +	}
>> +
>> +	/* Fill details of mem buff to map */
>> +	mem = ptr + ALIGN(src_sz, SZ_64);
>> +	memory_phys = src_phys + ALIGN(src_sz, SZ_64);
>> +	mem[0].mem_addr = cpu_to_le64(mem_addr);
>> +	mem[0].mem_size = cpu_to_le64(mem_sz);
>> +
>> +	next_vm = 0;
>> +	/* Fill details of next vmid detail */
>> +	destvm = ptr + ALIGN(memory_sz, SZ_64) + ALIGN(src_sz, SZ_64);
>> +	dest_phys = memory_phys + ALIGN(memory_sz, SZ_64);
>> +	for (i = 0; i < dest_cnt; i++) {
>> +		destvm[i].vmid = cpu_to_le32(newvm[i].vmid);
>> +		destvm[i].perm = cpu_to_le32(newvm[i].perm);
>> +		destvm[i].ctx = 0;
>> +		destvm[i].ctx_size = 0;
>> +		next_vm |= BIT(newvm[i].vmid);
>> +	}
>> +
>> +	ret = __qcom_scm_assign_mem(__scm->dev, memory_phys,
>> +		memory_sz, src_phys, src_sz, dest_phys, dest_sz);
>> +	dma_free_attrs(__scm->dev, ALIGN(mem_all_sz, SZ_64),
>> +		ptr, src_phys, dma_attrs);
>> +	if (ret == 0)
>> +		return next_vm;
>> +	else if (ret > 0)
>> +		return -ret;
> This still confuses me. Do we really just pass whatever the
> firmware tells us the error code is up to the caller? Shouldn't
> we be remapping the scm errors we receive to normal linux errnos?
because i do not know in advance what exactly will be the return error 
code, moreover there are number of error codes which are returned in 
case of failure
so if i have to return linux error code, i can not do one to one mapping 
of error code and will have to return single error code for all failure.
let me know your comments further on this.+ return ret;
>> +}
>> +EXPORT_SYMBOL(qcom_scm_assign_mem);
>> +
>>   static int qcom_scm_pas_reset_assert(struct reset_controller_dev *rcdev,
>>   				     unsigned long idx)
>>   {

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
