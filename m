Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH v4 01/17] remoteproc: configure IOMMU only if device
 address requested
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
 <1532697292-14272-2-git-send-email-loic.pallardy@st.com>
 <f6af2ded-dfcd-7cb9-6557-a17c40166836@ti.com>
 <c23ecc9e33fd477c9afa03066b245644@SFHDAG7NODE2.st.com>
Message-ID: <42092363-d9ff-9a98-680d-9c8fbeaed2be@ti.com>
Date: Tue, 23 Oct 2018 22:46:35 -0500
MIME-Version: 1.0
In-Reply-To: <c23ecc9e33fd477c9afa03066b245644@SFHDAG7NODE2.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic PALLARDY <loic.pallardy@st.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 10/23/18 2:40 PM, Loic PALLARDY wrote:
> Hi Suman,
> 
>> -----Original Message-----
>> From: Suman Anna <s-anna@ti.com>
>> Sent: mardi 23 octobre 2018 19:26
>> To: Loic PALLARDY <loic.pallardy@st.com>; bjorn.andersson@linaro.org;
>> ohad@wizery.com
>> Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org;
>> Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
>> benjamin.gaignard@linaro.org
>> Subject: Re: [PATCH v4 01/17] remoteproc: configure IOMMU only if device
>> address requested
>>
>> Hi Loic,
>>
>> On 7/27/18 8:14 AM, Loic Pallardy wrote:
>>> If there is no IOMMU associate to remote processor device,
>>> remoteproc_core won't be able to satisfy device address requested
>>> in firmware resource table.
>>> Return an error as configuration won't be coherent.
>>>
>>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>>
>> This patch is breaking my Davinci platforms. It is not really required
>> that you _should_ have IOMMUs when a valid DA is mentioned. Please see
>> the existing description (paras 4 and 5) on the fw_rsc_carveout
>> kerneldoc in remoteproc.h file.
> 
> Thanks for pointing this comment. Indeed sMMU is not mandatory, and at first sight I agree we should remove the restriction introduced by the patch.
> Driver porting on the series should be done before adding this.
>>
>> We do have platforms where we have some internal sub-modules within the
>> remote processor sub-system that provides some linear
>> address-translation (most common case with 32-bit processors supporting
>> 64-bit addresses). Also, we have some upcoming SoCs where we have an
>> MMU
>> but is not programmable by Linux.
>>
>> There is one comment there, but I don't think this is actually handled
>> in the current remoteproc core.
>> "If @da is set to
>>  * FW_RSC_ADDR_ANY, then the host will dynamically allocate it, and then
>>  * overwrite @da with the dynamically allocated address."
>>
> I don't remember it was implemented like described.

Yes, it was missing, and one of your patches seem to add this behavior
now. That said, I really don't think the remoteproc core can dictate the
 da. Even if the individual remoteproc driver were to furnish this, how
would you get such data without forcing a fixed behavior for all
possible firmwares (not desirable). We should get rid of this comment,
and any code that seems to do this.

> 
> I have remarks about the comment:
> "* We will always use @da to negotiate the device addresses, even if it
>  * isn't using an iommu. In that case, though, it will obviously contain
>  * physical addresses."
> 
> When there is no sMMU, we can't consider that da contains a physical address because coprocessor can have its own memory map just because it is a 32bit processor accessing only a part of the memory and the main is 64bit one. The 2 processors won't see the internal memory at the same base address for example.

Agreed, believe it was valid when it was written (32-bit platforms
supporting 32-bit addresses). I think this is akin to an IPA
(Intermediate Physical Address).

> So what should we do when carveout allocated by host is not fitting with resource table request?
> - put a warning and overwrite da address in the resource table?

Hmm, why da? This goes to my earlier comment about how you are able to
decide the da. Atleast your current ST driver seems to be assigning the
same value as the physical bus address for da, which would prompt why
you would still need a carveout entry in the resource table if it is
truly one-to-one.

Eg, I have an upcoming usecase with R5Fs on newer TI SoCs where we
actually have a sub-module called Region Address Translator (RAT) which
can only be programmed by the R5F for translating the 32-bit CPU
addresses to larger physical address space, and yet I need the da and pa
to be able to do loading. I cannot dictate the da since that is what the
firmware images are linked against. So, have to rely on the firmware
providing this data for me.

> - stop rproc probe as no match detected?

I think that is the safest approach.

> 
> Later in the series, carveout allocation is changed. Resource table carveout are either linked with an existing carveout registered by driver or added to carveout list for allocations.
> In the case you described, TI driver should first register the specific carveout regions thank to the helper.

The current series should still continue to work without having to
enforce new name assignments (unless needed and being defined to use the
new features being added).

> 
> Regards,
> Loic
> 
>> regards
>> Suman
>>
>>> ---
>>>  drivers/remoteproc/remoteproc_core.c | 10 +++++++++-
>>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_core.c
>> b/drivers/remoteproc/remoteproc_core.c
>>> index 4cd1a8e..437fabf 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -657,7 +657,15 @@ static int rproc_handle_carveout(struct rproc
>> *rproc,
>>>  	 * to use the iommu-based DMA API: we expect 'dma' to contain the
>>>  	 * physical address in this case.
>>>  	 */
>>> -	if (rproc->domain) {
>>> +
>>> +	if (rsc->da != FW_RSC_ADDR_ANY && !rproc->domain) {

Maybe this should really be a reverse check when you have MMUs,
if (rproc->domain && rsc->da == FW_RSC_ADDR_ANY)

regards
Suman

>>> +		dev_err(dev->parent,
>>> +			"Bad carveout rsc configuration\n");
>>> +		ret = -ENOMEM;
>>> +		goto dma_free;
>>> +	}
>>> +
>>> +	if (rsc->da != FW_RSC_ADDR_ANY && rproc->domain) {
>>>  		mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
>>>  		if (!mapping) {
>>>  			ret = -ENOMEM;
>>>
> 
