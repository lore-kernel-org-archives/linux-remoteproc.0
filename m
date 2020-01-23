Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v2 7/8] remoteproc: qcom: q6v5: Add common panic handler
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-8-bjorn.andersson@linaro.org>
 <20200110212806.GD11555@xps15> <20200122193936.GB3261042@ripper>
 <CANLsYkx-C9U4W3R3Xo6t3BJBM4UK_i3zuwzhnXMMEQ0-ur+8Kg@mail.gmail.com>
 <20200123171524.GV1511@yoga>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <8d92c4b5-4238-23d2-50fc-1a5bdfc2c67b@st.com>
Date: Thu, 23 Jan 2020 18:49:44 +0100
MIME-Version: 1.0
In-Reply-To: <20200123171524.GV1511@yoga>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, Sibi Sankar <sibis@codeaurora.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn, Mathieu

On 1/23/20 6:15 PM, Bjorn Andersson wrote:
> On Thu 23 Jan 09:01 PST 2020, Mathieu Poirier wrote:
> 
>> On Wed, 22 Jan 2020 at 12:40, Bjorn Andersson
>> <bjorn.andersson@linaro.org> wrote:
>>>
>>> On Fri 10 Jan 13:28 PST 2020, Mathieu Poirier wrote:
>>>
>>>> On Thu, Dec 26, 2019 at 09:32:14PM -0800, Bjorn Andersson wrote:
>>>>> Add a common panic handler that invokes a stop request and sleep enough
>>>>> to let the remoteproc flush it's caches etc in order to aid post mortem
>>>>> debugging.
>>>>>
>>>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>>> ---
>>>>>
>>>>> Changes since v1:
>>>>> - None
>>>>>
>>>>>  drivers/remoteproc/qcom_q6v5.c | 19 +++++++++++++++++++
>>>>>  drivers/remoteproc/qcom_q6v5.h |  1 +
>>>>>  2 files changed, 20 insertions(+)
>>>>>
>>>>> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
>>>>> index cb0f4a0be032..17167c980e02 100644
>>>>> --- a/drivers/remoteproc/qcom_q6v5.c
>>>>> +++ b/drivers/remoteproc/qcom_q6v5.c
>>>>> @@ -6,6 +6,7 @@
>>>>>   * Copyright (C) 2014 Sony Mobile Communications AB
>>>>>   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
>>>>>   */
>>>>> +#include <linux/delay.h>
>>>>>  #include <linux/kernel.h>
>>>>>  #include <linux/platform_device.h>
>>>>>  #include <linux/interrupt.h>
>>>>> @@ -15,6 +16,8 @@
>>>>>  #include <linux/remoteproc.h>
>>>>>  #include "qcom_q6v5.h"
>>>>>
>>>>> +#define Q6V5_PANIC_DELAY_MS        200
>>>>> +
>>>>>  /**
>>>>>   * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
>>>>>   * @q6v5:  reference to qcom_q6v5 context to be reinitialized
>>>>> @@ -162,6 +165,22 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
>>>>>  }
>>>>>  EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
>>>>>
>>>>> +/**
>>>>> + * qcom_q6v5_panic() - panic handler to invoke a stop on the remote
>>>>> + * @q6v5:  reference to qcom_q6v5 context
>>>>> + *
>>>>> + * Set the stop bit and sleep in order to allow the remote processor to flush
>>>>> + * its caches etc for post mortem debugging.
>>>>> + */
>>>>> +void qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
>>>>> +{
>>>>> +   qcom_smem_state_update_bits(q6v5->state,
>>>>> +                               BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
>>>>> +
>>>>> +   mdelay(Q6V5_PANIC_DELAY_MS);
>>>>
>>>> I really wonder if the delay should be part of the remoteproc core and
>>>> configurable via device tree.  Wanting the remote processor to flush its caches
>>>> is likely something other vendors will want when dealing with a kernel panic.
>>>> It would be nice to see if other people have an opinion on this topic.  If not
>>>> then we can keep the delay here and move it to the core if need be.
>>>>
>>>
>>> I gave this some more thought and what we're trying to achieve is to
>>> signal the remote processors about the panic and then give them time to
>>> react, but per the proposal (and Qualcomm downstream iirc) we will do
>>> this for each remote processor, one by one.
>>>
>>> So in the typical case of a Qualcomm platform with 4-5 remoteprocs we'll
>>> end up giving the first one a whole second to react and the last one
>>> "only" 200ms.
>>>
>>> Moving the delay to the core by iterating over rproc_list calling
>>> panic() and then delaying would be cleaner imo.
>>
>> I agree.
>>
>>>
>>> It might be nice to make this configurable in DT, but I agree that it
>>> would be nice to hear from others if this would be useful.
>>
>> I think the delay has to be configurable via DT if we move this to the
>> core.  The binding can be optional and default to 200ms if not
>> present.
>>
> 
> How about I make the panic() return the required delay and then we let
> the core sleep for MAX() of the returned durations? That way the default
> is still a property of the remoteproc drivers - and 200ms seems rather
> arbitrary to put in the core, even as a default.

I agree with Bjorn, the delay should be provided by the platform.
But in this case i wonder if it is simpler to just let the platform take care it?
For instance for stm32mp1 the stop corresponds to the reset on the remote processor core. To inform the coprocessor about an imminent shutdown we use a signal relying on a mailbox (cf. stm32_rproc_stop).  
In this case we would need a delay between the signal and the reset, but not after (no cache management).

Regards,
Arnaud
> 
> Regards,
> Bjorn
> 
