Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v4 10/17] remoteproc: add helper function to check
 carveout device address
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
 <1532697292-14272-11-git-send-email-loic.pallardy@st.com>
 <2844874b-9484-aeee-c614-411d0ff38d12@ti.com>
 <8b16461d7d99487480253cde5cdcfd2c@SFHDAG7NODE2.st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <5e86ac7e-e0db-205e-1c60-bc0be9f75859@ti.com>
Date: Thu, 25 Oct 2018 17:50:07 -0500
MIME-Version: 1.0
In-Reply-To: <8b16461d7d99487480253cde5cdcfd2c@SFHDAG7NODE2.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic PALLARDY <loic.pallardy@st.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,

On 10/24/18 10:24 AM, Loic PALLARDY wrote:
> Hi Suman,
> 
>> -----Original Message-----
>> From: Suman Anna <s-anna@ti.com>
>> Sent: mercredi 24 octobre 2018 00:14
>> To: Loic PALLARDY <loic.pallardy@st.com>; bjorn.andersson@linaro.org;
>> ohad@wizery.com
>> Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org;
>> Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
>> benjamin.gaignard@linaro.org
>> Subject: Re: [PATCH v4 10/17] remoteproc: add helper function to check
>> carveout device address
>>
>> Hi Loic,
>>
>> On 7/27/18 8:14 AM, Loic Pallardy wrote:
>>> This patch introduces a function to verify that a specified carveout
>>> is fitting request device address and associated length
>>>
>>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>>> ---
>>>  drivers/remoteproc/remoteproc_core.c | 47
>> ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 47 insertions(+)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_core.c
>> b/drivers/remoteproc/remoteproc_core.c
>>> index 1e0fe3e..5dd5edf 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -259,6 +259,53 @@ struct rproc_mem_entry *
>>>  	return mem;
>>>  }
>>>
>>> +/**
>>> + * rproc_check_carveout_da() - Check specified carveout da configuration
>>> + * @rproc: handle of a remote processor
>>> + * @mem: pointer on carveout to check
>>> + * @da: area device address
>>> + * @len: associated area size
>>> + *
>>> + * This function is a helper function to verify requested device area
>> (couple
>>> + * da, len) is part of specified carevout.
>>
>> %s/carevout/carveout/
> OK
>>
>>> + *
>>> + * Return: 0 if carveout matchs request else -ENOMEM
>>
>> %s/matchs/matches/
> OK
>>
>>> + */
>>> +int rproc_check_carveout_da(struct rproc *rproc, struct
>> rproc_mem_entry *mem,
>>
>> static int since this seems to be only a local function.
> OK
>>
>>> +			    u32 da, u32 len)
>>> +{
>>> +	struct device *dev = &rproc->dev;
>>> +	int delta = 0;
>>> +
>>> +	/* Check requested resource length */
>>> +	if (len > mem->len) {
>>> +		dev_err(dev, "Registered carveout doesn't fit len
>> request\n");
>>> +		return -ENOMEM;
>>
>> ENOMEM not typically used for these kind of errors, you were probably
>> inclined to used this since it is dealing with memory.
> 
> -EINVAL will be better
>>
>>> +	}
>>> +
>>
>> Both the below codepaths are exercised only when da is not
>> FW_RSC_ADDR_ANY, and you are returning 0 otherwise (which is the case of
>> matches as per your description above). Is that what you really want -
>> should it be an error
> 
> Yes when da is equal to FW_RSC_ADDR_ANY we should check the length too

Can you update the comments in the function description accordingly as
well, the current code silently returns 0 if da = FW_RSC_ADDR_ANY.

> 
>>
>>> +	if (da != FW_RSC_ADDR_ANY && mem->da == FW_RSC_ADDR_ANY)
>> {
>>> +		/* Update existing carveout da */
>>> +		mem->da = da;
>>
>> Where would you need to update this?

> In that case, we have 2 carveouts with the same name.
> One has some fixed requests. The other one has none.
> The goal here is to align both on the one which has the strongest requirements.
> I think length is missing.

It almost looks like there is a need for range overlap checks on all the
carveouts after all of them are registered, and error out if any overlap
irrespective of the name schema.

regards
Suman

> 
> Regards,
> Loic
> 
>>
>> regards
>> Suman
>>
>>> +	} else if (da != FW_RSC_ADDR_ANY && mem->da !=
>> FW_RSC_ADDR_ANY) {
>>> +		delta = da - mem->da;
>>> +
>>> +		/* Check requested resource belongs to registered carveout
>> */
>>> +		if (delta < 0) {
>>> +			dev_err(dev,
>>> +				"Registered carveout doesn't fit da
>> request\n");
>>> +			return -ENOMEM;
>>> +		}
>>> +
>>> +		if (delta + len > mem->len) {
>>> +			dev_err(dev,
>>> +				"Registered carveout doesn't fit len
>> request\n");
>>> +			return -ENOMEM;
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>
>>
>>> +}
>>> +
>>>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>>>  {
>>>  	struct rproc *rproc = rvdev->rproc;
>>>
> 
