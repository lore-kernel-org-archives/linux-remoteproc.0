Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 06/17] remoteproc: Introduce function
 rproc_alloc_internals()
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-7-mathieu.poirier@linaro.org>
 <064cda96467f4ab39b494d543198fa7e@SFHDAG7NODE2.st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <88f56a4e-dccb-0d50-4656-82380a2e57aa@ti.com>
Date: Mon, 30 Mar 2020 15:38:14 -0500
MIME-Version: 1.0
In-Reply-To: <064cda96467f4ab39b494d543198fa7e@SFHDAG7NODE2.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic PALLARDY <loic.pallardy@st.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,

On 3/27/20 6:10 AM, Loic PALLARDY wrote:
> Hi Mathieu,
> 
>>
>> In preparation to allocate the synchronisation operation and state
>> machine, spin off a new function in order to keep rproc_alloc() as
>> clean as possible.
>>
>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 26 ++++++++++++++++++++++---
>> -
>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c
>> b/drivers/remoteproc/remoteproc_core.c
>> index ee277bc5556c..9da245734db6 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -2018,6 +2018,26 @@ static int rproc_alloc_ops(struct rproc *rproc,
>> const struct rproc_ops *ops)
>>  	return 0;
>>  }
>>
>> +static int rproc_alloc_internals(struct rproc *rproc, const char *name,
>> +				 const struct rproc_ops *boot_ops,
>> +				 const char *firmware, int len)
> 
> len argument is not used in the patch nor in the following, maybe removed from my pov.

Indeed.

> 
> Regards,
> Loic

>> +{
>> +	int ret;
>> +
>> +	/* We have a boot_ops so allocate firmware name and operations */
>> +	if (boot_ops) {
>> +		ret = rproc_alloc_firmware(rproc, name, firmware);
>> +		if (ret)
>> +			return ret;

So, can you explain why firmware allocation now becomes conditional on
this boot_ops?

Perhaps, continue to call this as ops following the field name in struct
rproc.

regards
Suman

>> +
>> +		ret = rproc_alloc_ops(rproc, boot_ops);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  /**
>>   * rproc_alloc() - allocate a remote processor handle
>>   * @dev: the underlying device
>> @@ -2064,10 +2084,8 @@ struct rproc *rproc_alloc(struct device *dev, const
>> char *name,
>>  	rproc->dev.class = &rproc_class;
>>  	rproc->dev.driver_data = rproc;
>>
>> -	if (rproc_alloc_firmware(rproc, name, firmware))
>> -		goto out;
>> -
>> -	if (rproc_alloc_ops(rproc, ops))
>> +	if (rproc_alloc_internals(rproc, name, ops,
>> +				  firmware, len))
>>  		goto out;
>>
>>  	/* Assign a unique device index and name */
>> --
>> 2.20.1
> 
