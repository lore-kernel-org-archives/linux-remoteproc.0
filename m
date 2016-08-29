Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH 2/2] remoteproc: core: Add fixed memory region support
References: <1472242795-23970-1-git-send-email-loic.pallardy@st.com>
 <1472242795-23970-3-git-send-email-loic.pallardy@st.com>
 <20160827003244.GL15161@tuxbot>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <a56a6ff2-79c5-81d8-0891-a55bae2af184@st.com>
Date: Mon, 29 Aug 2016 10:09:48 +0200
MIME-Version: 1.0
In-Reply-To: <20160827003244.GL15161@tuxbot>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, s-anna@ti.com
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 08/27/2016 02:32 AM, Bjorn Andersson wrote:
> On Fri 26 Aug 13:19 PDT 2016, Loic Pallardy wrote:
>
>> Some coprocessors request fixed memory mapping for firmware execution
>> and associated communication linked.
>> Memory resources are defined in firmware resource table.
>> Resource address different from 0x0 and 0xFFFFFFFF is considered as predefined
>
> Do you think we're required to support both 0 and -1 for this?
Hi Bjorn,
You're right, only -1 is needed. SoC can have internal RAM in 0x0 for 
example.
I'll update in a V2.
>
>> and already reserved at system level.
>> In that case, remoteproc core doesn't need to perform any allocation.
>> Memory region access can be managed using memremap/memunmap functions
>>
>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 61 ++++++++++++++++++++++++++----------
>>  include/linux/remoteproc.h           |  4 +++
>>  2 files changed, 49 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 18f4286..0ddbb92 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -213,13 +213,25 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>>  	/* actual size of vring (in bytes) */
>>  	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
>>
>> -	/*
>> -	 * Allocate non-cacheable memory for the vring. In the future
>> -	 * this call will also configure the IOMMU for us
>> -	 */
>> -	va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
>> +	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
>> +
>> +	/* check if specific memory region requested by firmware */
>> +	if (rsc->vring[i].da != 0 && rsc->vring[i].da != FW_RSC_ADDR_ANY) {
>
> I think we should convert that reserved field in the vring to a "pa";
> allowing this resource to not be 1:1 mapped into the remote. And if
> nothing else just to be consistent with the carveouts and devmem.
In fact vring doesn't have pa because coprocessor diretly access it 
without help of hardware accelerator. On both carveout and devmem, 
hardware accelerators may be used.
That's true having pa field will be more consistent from host pov.

Regards,
Loic

>
>
> @Suman, do you have any input on this?
>
> Regards,
> Bjorn
>
