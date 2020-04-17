Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 5/7] remoteproc: Restructure firmware name allocation
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-6-mathieu.poirier@linaro.org>
 <aa565fea-b1c4-9b5c-73ed-591244afee19@web.de>
From: Suman Anna <s-anna@ti.com>
Message-ID: <e887c990-8cba-62b0-0f47-3ea0c166d603@ti.com>
Date: Fri, 17 Apr 2020 08:39:39 -0500
MIME-Version: 1.0
In-Reply-To: <aa565fea-b1c4-9b5c-73ed-591244afee19@web.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Markus,

On 4/16/20 1:26 AM, Markus Elfring wrote:
> …
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1984,14 +1984,14 @@ static int rproc_alloc_firmware(struct rproc *rproc,
>>   {
>>   	const char *p;
>>
>> -	if (!firmware)
>> +	if (firmware)
>> +		p = kstrdup_const(firmware, GFP_KERNEL);
>> +	else
>>   		/*
>>   		 * If the caller didn't pass in a firmware name then
>>   		 * construct a default name.
>>   		 */
>>   		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
>> -	else
>> -		p = kstrdup_const(firmware, GFP_KERNEL);
> 
> Can the use of the conditional operator make sense at such source code places?
> 
> 	p = firmware ? kstrdup_const(…) : kasprintf(…);

For simple assignments, I too prefer the ternary operator, but in this 
case, I think it is better to leave the current code as is.

regards
Suman
