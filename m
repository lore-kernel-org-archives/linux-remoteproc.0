Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v4 15/17] remoteproc: da8xx: declare reserved memory
 region for vdev device
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
 <1532697292-14272-16-git-send-email-loic.pallardy@st.com>
 <d62a0299-1966-887e-05fd-96a26e0aa838@ti.com>
 <039aad0dc35d4d919bb10a9e37a860f7@SFHDAG7NODE2.st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <3da26f61-7d58-11e5-75a3-7d865f9bf21f@ti.com>
Date: Thu, 25 Oct 2018 17:11:12 -0500
MIME-Version: 1.0
In-Reply-To: <039aad0dc35d4d919bb10a9e37a860f7@SFHDAG7NODE2.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic PALLARDY <loic.pallardy@st.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 10/24/18 8:19 AM, Loic PALLARDY wrote:
> 
> 
>> -----Original Message-----
>> From: Suman Anna <s-anna@ti.com>
>> Sent: mercredi 24 octobre 2018 04:58
>> To: Loic PALLARDY <loic.pallardy@st.com>; bjorn.andersson@linaro.org;
>> ohad@wizery.com
>> Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org;
>> Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
>> benjamin.gaignard@linaro.org
>> Subject: Re: [PATCH v4 15/17] remoteproc: da8xx: declare reserved memory
>> region for vdev device
>>
>> Hi Loic,
>>
>> On 7/27/18 8:14 AM, Loic Pallardy wrote:
>>> This patch introduces da8xx_rproc_parse_fw() to declare a
>>> carveout region based on reserved memory for vdev buffer
>>> allocation.
>>>
>>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>>> ---
>>>  drivers/remoteproc/da8xx_remoteproc.c | 38
>> +++++++++++++++++++++++++++++++++++
>>>  1 file changed, 38 insertions(+)
>>>
>>> diff --git a/drivers/remoteproc/da8xx_remoteproc.c
>> b/drivers/remoteproc/da8xx_remoteproc.c
>>> index b668e32..679a076 100644
>>> --- a/drivers/remoteproc/da8xx_remoteproc.c
>>> +++ b/drivers/remoteproc/da8xx_remoteproc.c
>>> @@ -16,6 +16,7 @@
>>>  #include <linux/irq.h>
>>>  #include <linux/kernel.h>
>>>  #include <linux/module.h>
>>> +#include <linux/of_address.h>
>>>  #include <linux/of_reserved_mem.h>
>>>  #include <linux/platform_device.h>
>>>  #include <linux/remoteproc.h>
>>> @@ -179,10 +180,47 @@ static void da8xx_rproc_kick(struct rproc *rproc,
>> int vqid)
>>>  	writel(SYSCFG_CHIPSIG2, drproc->chipsig);
>>>  }
>>>
>>> +static int da8xx_rproc_parse_fw(struct rproc *rproc, const struct firmware
>> *fw)
>>> +{
>>> +	struct device *dev = rproc->dev.parent;
>>> +	struct rproc_mem_entry *mem;
>>> +	struct device_node *node;
>>> +	struct resource res;
>>> +	int err;
>>> +
>>> +	node = of_parse_phandle(dev->of_node, "memory-region", 0);
>>> +	if (!node) {
>>> +		dev_err(dev, "No memory-region specified\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	err = of_address_to_resource(node, 0, &res);
>>> +	if (err) {
>>> +		dev_err(dev, "Bad memory-region definition\n");
>>> +		return err;
>>> +	}
>>> +
>>> +	/* Register memory region for vdev buffer allocation */
>>> +	mem = rproc_of_resm_mem_entry_init(dev, 0,
>> resource_size(&res),
>>> +					   res.start, "vdev0buffer");> +
>>> +	if (!mem)
>>> +		return -ENOMEM;
>>> +
>>> +	rproc_add_carveout(rproc, mem);
>>> +
>>> +	return rproc_elf_load_rsc_table(rproc, fw);
>>> +}
>>
>> Thanks for the patch, but this creates a kernel crash for me due to
>> overlaps with manually created carveouts. I currently have a single
>> memory-region and all allocations come from the same DMA pool, but the
>> rproc_of_resm_mem_entry_init() creates an overall mem entry without the
>> va being set (no alloc function plumbed in). In general, it is permitted
>> to use the same reserved-memory node with multiple devices, so the index
>> usage should have allowed it to do DMA allocations with vdev devices,
>> but the loading is performed even before the vdev allocations and the
>> da_to_va matches the first entry with no va set causing the crash.
> 
> Hummm, I didn't fall in this case, but clearly da_to_va should not crashed. 
> Not allocated carveout should be bypassed in the loop. Thanks for pointing this. I need to fix it.

da_to_va didn't crash, it just returned a bogus va based on base address
0x0 (as you can see below) as it looks through all carveouts, and my
loading crashed. This brings us to fact that we now need to distinguish
allocated carveouts vs non-allocated carveouts.

regards
Suman

> 
> The rproc_of_resm_mem_entry_init() is simply registering the reserved memory to be attached to vdev device.
> So that normal it won't be allocated by rproc core (there is no alloc/free function specificied in this helper). 
> 
> Regards,
> Loic
>>
>> Here's my debugfs output of the carveout_memories for reference,
>>
>> Carveout memory entry:
>>         Name: vdev0buffer
>>         Virtual address: 00000000
>>         DMA address: 0x00000000
>>         Device address: 0xc3000000
>>         Length: 0x1000000 Bytes
>>
>> Carveout memory entry:
>>         Name: vdev0vring0
>>         Virtual address: c3000000
>>         DMA address: 0xc3000000
>>         Device address: 0xc3000000
>>         Length: 0x3000 Bytes
>>
>> Carveout memory entry:
>>         Name: vdev0vring1
>>         Virtual address: c3004000
>>         DMA address: 0xc3004000
>>         Device address: 0xc3004000
>>         Length: 0x3000 Bytes
>>
>> Carveout memory entry:
>>         Name: DSP_MEM_DATA
>>         Virtual address: c3100000
>>         DMA address: 0xc3100000
>>         Device address: 0xc3100000
>>         Length: 0xf00000 Bytes
>>
>> You can drop both this patch and the keystone_remoteproc patch from the
>> series. I did not run into any issues there since I did not have any
>> RSC_CARVEOUT entries there. Also, see my comments on the next patch
>> (the
>> changes in ST) in general regarding these API. Looks like this needs
>> some more time in ironing out the issues.
>>
>> regards
>> Suman
>>
>>
>>
>>> +
>>>  static const struct rproc_ops da8xx_rproc_ops = {
>>>  	.start = da8xx_rproc_start,
>>>  	.stop = da8xx_rproc_stop,
>>>  	.kick = da8xx_rproc_kick,
>>> +	.parse_fw = da8xx_rproc_parse_fw,
>>> +	.load = rproc_elf_load_segments,
>>> +	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>>> +	.sanity_check = rproc_elf_sanity_check,
>>> +	.get_boot_addr = rproc_elf_get_boot_addr,
>>>  };
>>>
>>>  static int da8xx_rproc_get_internal_memories(struct platform_device
>> *pdev,
>>>
> 
