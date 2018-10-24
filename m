Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v4 02/17] remoteproc: add rproc_va_to_pa function
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
 <1532697292-14272-3-git-send-email-loic.pallardy@st.com>
 <91e489e7-86c3-6ee3-918d-151ef1697429@ti.com>
 <68acbbf905384f6c80b646330a3d1344@SFHDAG7NODE2.st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <8f19b68f-10f5-b21f-9143-eadb0103999b@ti.com>
Date: Tue, 23 Oct 2018 22:19:24 -0500
MIME-Version: 1.0
In-Reply-To: <68acbbf905384f6c80b646330a3d1344@SFHDAG7NODE2.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic PALLARDY <loic.pallardy@st.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 10/23/18 2:51 PM, Loic PALLARDY wrote:
> Hi Suman,
> 
>> -----Original Message-----
>> From: Suman Anna <s-anna@ti.com>
>> Sent: mardi 23 octobre 2018 18:51
>> To: Loic PALLARDY <loic.pallardy@st.com>; bjorn.andersson@linaro.org;
>> ohad@wizery.com
>> Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org;
>> Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
>> benjamin.gaignard@linaro.org
>> Subject: Re: [PATCH v4 02/17] remoteproc: add rproc_va_to_pa function
>>
>> Hi Loic, Bjorn,
>>
>> On 7/27/18 8:14 AM, Loic Pallardy wrote:
>>> This new function translates CPU virtual address in
>>> CPU physical one according to virtual address location.
>>>
>>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>>> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> ---
>>>  drivers/remoteproc/remoteproc_core.c | 18 +++++++++++++++++-
>>>  1 file changed, 17 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_core.c
>> b/drivers/remoteproc/remoteproc_core.c
>>> index 437fabf..8e5fe1e 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -140,6 +140,22 @@ static void rproc_disable_iommu(struct rproc
>> *rproc)
>>>  	iommu_domain_free(domain);
>>>  }
>>>
>>> +static phys_addr_t rproc_va_to_pa(void *cpu_addr)
>>> +{
>>> +	/*
>>> +	 * Return physical address according to virtual address location
>>> +	 * - in vmalloc: if region ioremapped or defined as
>> dma_alloc_coherent
>>> +	 * - in kernel: if region allocated in generic dma memory pool
>>> +	 */
>>> +	if (is_vmalloc_addr(cpu_addr)) {
>>> +		return page_to_phys(vmalloc_to_page(cpu_addr)) +
>>> +				    offset_in_page(cpu_addr);
>>> +	}
>>> +
>>> +	WARN_ON(!virt_addr_valid(cpu_addr));
>>> +	return virt_to_phys(cpu_addr);
>>> +}
>>> +
>>>  /**
>>>   * rproc_da_to_va() - lookup the kernel virtual address for a remoteproc
>> address
>>>   * @rproc: handle of a remote processor
>>> @@ -711,7 +727,7 @@ static int rproc_handle_carveout(struct rproc
>> *rproc,
>>>  	 * In this case, the device address and the physical address
>>>  	 * are the same.
>>>  	 */
>>> -	rsc->pa = dma;
>>> +	rsc->pa = (u32)rproc_va_to_pa(va);
>>
>> While I agree with the direction here, we ought to add a check here
>> warning users if some address bits are getting lost as a result of the
>> typecast. Granted the issue may have been present previously with
>> dma_addr_t as well, but most platforms were using 32-bit dma addresses,
>> so this was kinda masked. There are ARMv7 platforms with LPAE enabled
>> allowing physical addresses > 32-bits.
>>
>> In anycase, we definitely have a need for a v2 for the fw_rsc_carveout
>> structure to deal with 64-bit addresses.
>>
> 
> Agree with you.
> Assumption for this series was to keep resource table as it is. Resource table improvement is planned in a second step.

Perhaps, we should add a WARN_ON for the time being until we enhance the
resource table for 64-bit platforms/addresses.

regards
Suman

> Regards,
> Loic
> 
>> regards
>> Suman
>>
>>>
>>>  	carveout->va = va;
>>>  	carveout->len = rsc->len;
>>>
> 
