Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v7 1/4] firmware: scm: Add new SCM call API for switching
 memory ownership
References: <1500634173-24416-1-git-send-email-akdwived@codeaurora.org>
 <1500634173-24416-2-git-send-email-akdwived@codeaurora.org>
 <20171012181151.GD1165@minitux>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <66a0dcf8-d938-78e9-e5cb-6120b1cb2f26@codeaurora.org>
Date: Mon, 16 Oct 2017 18:45:29 +0530
MIME-Version: 1.0
In-Reply-To: <20171012181151.GD1165@minitux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 10/12/2017 11:41 PM, Bjorn Andersson wrote:
> On Fri 21 Jul 03:49 PDT 2017, Avaneesh Kumar Dwivedi wrote:
>
>> Two different processors on a SOC need to switch memory ownership
>> during load/unload. To enable this, second level memory map table
>> need to be updated, which is done by secure layer.
>> This patch adds the interface for making secure monitor call for
>> memory ownership switching request.
>>
> As I reported to you a while back I finally managed to use this to get
> the modem on db820c up and running (with "all" IPCROUTER services
> showing up). So let's try to resurrect and get this merged!
>
>
> In addition I've successfully used this patch in extending the rmtfs
> shared memory driver to allow setting up the ownership of that memory.
>
> [..]
Thanks for reviving this patch series Bjorn!

Will try to take it closure this time.

>> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
>> index bb16510..009a42d 100644
>> --- a/drivers/firmware/qcom_scm.c
>> +++ b/drivers/firmware/qcom_scm.c
>> @@ -40,6 +40,18 @@ struct qcom_scm {
>>   	struct reset_controller_dev reset;
>>   };
>>   
>> +struct qcom_scm_current_perm_info {
>> +	__le32 vmid;
>> +	__le32 perm;
>> +	__le64 ctx;
>> +	__le32 ctx_size;
>> +};
> I learned the hard way that this struct is supposed to be 24 bytes, so
> please add a __le32 padding; at the end of this.
>
> [..]
OK.
>> +int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz, int srcvm,
>> +			struct qcom_scm_vmperm *newvm, int dest_cnt)
>> +{
> It turns out that the standard way of calling this (shown by the
> remoteproc and rmtfs-memory driver implementations) is:
>
> 	ret = qcom_scm_assign_mem(mem, len, curr_vm, perms, sizeof(perms));
> 	if (ret < 0)
> 		fail();
> 	curr_vm = ret;
>
> I therefor suggest that we make one more adjustment to the prototype in
> the form of taking srcvm as a pointer. And as this is now a bitmask it
> should be made an unsigned int. I.e.
>
> int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz, unsigned int srcvm,
> 			struct qcom_scm_vmperm *newvm, int dest_cnt)
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
>> +	dest_sz = dest_cnt * sizeof(*destvm);
>> +	mem_all_sz = src_sz + memory_sz + dest_sz;
> ALIGN(x + y + z, 64) <= ALIGN(x, 64) + ALIGN(y, 64) + ALIGN(z, 64)
>
> So please replace this with:
>
> 	ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(memory_sz, SZ_64) +
> 		 ALIGN(dest_sz, SZ_64);
>
> (renaming the variable to ptr_sz saves you some line wraps as well)
Ok, Will try to incorporate your idea, and if any concern will revert 
back soon.
>> +
>> +	ptr = dma_alloc_coherent(__scm->dev, ALIGN(mem_all_sz, SZ_64),
>> +				 &src_phys, GFP_KERNEL);
>> +
>> +	if (!ptr)
>> +		return -ENOMEM;
>> +
>> +	/* Fill source vmid detail */
>> +	src = ptr;
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
> For clarity it would be nice if you keep the math for virtual and
> physical addresses the same; so add another variable "ptr_phys" and
> replace this with:
> 	dest_phys = ptr_phys + ALIGN(src_sz, 64) + ALIGN(memory_sz, 64);
OK.
>
>> +	for (i = 0; i < dest_cnt; i++) {
>> +		destvm[i].vmid = cpu_to_le32(newvm[i].vmid);
>> +		destvm[i].perm = cpu_to_le32(newvm[i].perm);
>> +		destvm[i].ctx = 0;
>> +		destvm[i].ctx_size = 0;
>> +		next_vm |= BIT(newvm[i].vmid);
>> +	}
>> +
>> +	ret = __qcom_scm_assign_mem(__scm->dev, memory_phys, memory_sz,
>> +				    src_phys, src_sz, dest_phys, dest_sz);
>> +	dma_free_coherent(__scm->dev, ALIGN(mem_all_sz, SZ_64),
>> +			  ptr, src_phys);
>> +	if (ret != 0) {
>> +		dev_err(__scm->dev,
>> +			"Assign memory protection call failed %d.\n", ret);
>> +		return -EINVAL;
>> +	} else {
>> +		return next_vm;
>> +	}
> Replace this with:
>
> 	if (ret) {
> 		dev_err(__scm->dev,
> 			"Assign memory protection call failed %d.\n", ret);
> 		return -EINVAL;
> 	}
>
> 	*srcvm = next_vm;
> 	return 0;
OK.
>
>> +}
>> +EXPORT_SYMBOL(qcom_scm_assign_mem);
>> +
> Regards,
> Bjorn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remoteproc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
