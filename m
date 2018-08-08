Return-Path: <sibis@codeaurora.org>
Subject: Re: [PATCH v3 1/6] remoteproc: Introduce custom dump function for
 each remoteproc segment
References: <20180727152003.11663-1-sibis@codeaurora.org>
 <20180727152003.11663-2-sibis@codeaurora.org>
 <20180807061539.GG2395@vkoul-mobl>
From: Sibi Sankar <sibis@codeaurora.org>
Message-ID: <362fcf75-6fb6-5423-7b9f-915324df6317@codeaurora.org>
Date: Wed, 8 Aug 2018 19:40:02 +0530
MIME-Version: 1.0
In-Reply-To: <20180807061539.GG2395@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Vinod <vkoul@kernel.org>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, ohad@wizery.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Vinod,
Thanks for the review,

On 08/07/2018 11:45 AM, Vinod wrote:
> Hi Sibi,
> 
> On 27-07-18, 20:49, Sibi Sankar wrote:
>> Introduce custom dump function per remoteproc segment. It is responsible
>> for filling the device memory segment associated with coredump
>>
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 15 ++++++++++-----
>>   include/linux/remoteproc.h           |  3 +++
>>   2 files changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 283b258f5e0f..ec56cd822b26 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1183,13 +1183,18 @@ static void rproc_coredump(struct rproc *rproc)
>>   		phdr->p_align = 0;
>>   
>>   		ptr = rproc_da_to_va(rproc, segment->da, segment->size);
>> -		if (!ptr) {
>> -			dev_err(&rproc->dev,
>> +
>> +		if (segment->dump) {
>> +			segment->dump(rproc, ptr, segment->size, data + offset);
> 
> Am not sure I follow, you are calling this w/o checking if ptr is valid,
> so you maybe passing null to segment->dump() ?
> 

the rationale behind passing ptr directly to dump_fn is that it will
help in tracking the segments being core dumped (q6v5_pil in particular
requires to unlock mba before dumping and cleanup after all the segments
are dumped which is currently decided based on a mask that is
maintained). It also allows the remoteproc driver to fill the memory as
needed (instead of the default 0xff). This is applicable to drivers that
implement dump_fn, for others the default behavior is maintained.

>> +		} else {
>> +			if (!ptr) {
>> +				dev_err(&rproc->dev,
>>   				"invalid coredump segment (%pad, %zu)\n",
>>   				&segment->da, segment->size);
>> -			memset(data + offset, 0xff, segment->size);
>> -		} else {
>> -			memcpy(data + offset, ptr, segment->size);
>> +				memset(data + offset, 0xff, segment->size);
>> +			} else {
>> +				memcpy(data + offset, ptr, segment->size);
>> +			}
> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
