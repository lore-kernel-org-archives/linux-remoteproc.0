Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 03/17] remoteproc: Split firmware name allocation from
 rproc_alloc()
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-4-mathieu.poirier@linaro.org>
 <d0a399feb0f647ec98841ea8b8339449@SFHDAG7NODE2.st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <3cdc557f-61bf-fd0f-07b0-4ab5454f39f1@ti.com>
Date: Mon, 30 Mar 2020 14:47:54 -0500
MIME-Version: 1.0
In-Reply-To: <d0a399feb0f647ec98841ea8b8339449@SFHDAG7NODE2.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic PALLARDY <loic.pallardy@st.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,

On 3/27/20 6:05 AM, Loic PALLARDY wrote:
> Hi Mathieu,
> 
>> -----Original Message-----
>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Sent: mardi 24 mars 2020 22:46
>> To: bjorn.andersson@linaro.org
>> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
>> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
>> <arnaud.pouliquen@st.com>; Fabien DESSENNE
>> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
>> Subject: [PATCH v2 03/17] remoteproc: Split firmware name allocation from
>> rproc_alloc()
>>
>> Make the firmware name allocation a function on its own in order to
>> introduce more flexibility to function rproc_alloc().

I see patches 3 through 5 are generic cleanups, can you post them
separately from this series? Bjorn has commented about using the
put_device() to free the code on one of the remoteproc core patches [1]
in my R5 patch series, and I can do my patch on top of yours. I plan to
split out those 2 core patches for my next version, and can do them on
top of these.

[1] https://patchwork.kernel.org/patch/11456385/#23248321

>>
>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 62 +++++++++++++++++-----------
>>  1 file changed, 39 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c
>> b/drivers/remoteproc/remoteproc_core.c
>> index 097f33e4f1f3..c0871f69929b 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1962,6 +1962,36 @@ static const struct device_type rproc_type = {
>>  	.release	= rproc_type_release,
>>  };
>>
>> +static int rproc_alloc_firmware(struct rproc *rproc,
>> +				const char *name, const char *firmware)
>> +{
>> +	char *p, *template = "rproc-%s-fw";
>> +	int name_len;
>> +
>> +	if (!rproc || !name)
>> +		return -EINVAL;

This is an internal function, and these are already checked in
rproc_alloc(), so you can drop this.

>> +
>> +	if (!firmware) {
>> +		/*
>> +		 * If the caller didn't pass in a firmware name then
>> +		 * construct a default name.
>> +		 */
>> +		name_len = strlen(name) + strlen(template) - 2 + 1;
>> +		p = kmalloc(name_len, GFP_KERNEL);
>> +		if (!p)
>> +			return -ENOMEM;
>> +		snprintf(p, name_len, template, name);
>> +	} else {
>> +		p = kstrdup(firmware, GFP_KERNEL);
>> +		if (!p)
>> +			return -ENOMEM;
>> +	}
>> +
>> +	rproc->firmware = p;
>> +
>> +	return 0;
>> +}
>> +
>>  /**
>>   * rproc_alloc() - allocate a remote processor handle
>>   * @dev: the underlying device
>> @@ -1990,42 +2020,24 @@ struct rproc *rproc_alloc(struct device *dev,
>> const char *name,
>>  			  const char *firmware, int len)
>>  {
>>  	struct rproc *rproc;
>> -	char *p, *template = "rproc-%s-fw";
>> -	int name_len;
>>
>>  	if (!dev || !name || !ops)
>>  		return NULL;
>>
>> -	if (!firmware) {
>> -		/*
>> -		 * If the caller didn't pass in a firmware name then
>> -		 * construct a default name.
>> -		 */
>> -		name_len = strlen(name) + strlen(template) - 2 + 1;
>> -		p = kmalloc(name_len, GFP_KERNEL);
>> -		if (!p)
>> -			return NULL;
>> -		snprintf(p, name_len, template, name);
>> -	} else {
>> -		p = kstrdup(firmware, GFP_KERNEL);
>> -		if (!p)
>> -			return NULL;
>> -	}
>> -
>>  	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
>> -	if (!rproc) {
>> -		kfree(p);
>> +	if (!rproc)
>>  		return NULL;
>> -	}
>> +
>> +	if (rproc_alloc_firmware(rproc, name, firmware))
>> +		goto free_rproc;

Since you are already moving this after rproc_alloc() here in this
patch, you might as well fold the relevant patch 5 contents here?
Otherwise, retain the existing code as is, and do all the movement in
patch 5.

regards
Suman

>>
>>  	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
>>  	if (!rproc->ops) {
>> -		kfree(p);
>> +		kfree(rproc->firmware);
>>  		kfree(rproc);
> Small remark only for patch coherency, as it is modified in next patches.
> Use free_rproc label which is introduced just below here for error management.
> 
> Regards,
> Loic
>>  		return NULL;
>>  	}
>>
>> -	rproc->firmware = p;
>>  	rproc->name = name;
>>  	rproc->priv = &rproc[1];
>>  	rproc->auto_boot = true;
>> @@ -2073,6 +2085,10 @@ struct rproc *rproc_alloc(struct device *dev, const
>> char *name,
>>  	rproc->state = RPROC_OFFLINE;
>>
>>  	return rproc;
>> +
>> +free_rproc:
>> +	kfree(rproc);
>> +	return NULL;
>>  }
>>  EXPORT_SYMBOL(rproc_alloc);
>>
>> --
>> 2.20.1
> 
