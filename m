Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH] remoteproc: fix kernel-doc warnings
References: <20200212093211.15270-1-arnaud.pouliquen@st.com>
 <c912fe7e-601d-6d07-c368-109fecd11a7a@infradead.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <b6a7e733-f63f-431c-3b0e-9aeb3de43bb3@st.com>
Date: Wed, 12 Feb 2020 17:01:28 +0100
MIME-Version: 1.0
In-Reply-To: <c912fe7e-601d-6d07-c368-109fecd11a7a@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <rdunlap@infradead.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Randy

On 2/12/20 4:54 PM, Randy Dunlap wrote:
> Hi,
> 
> kernel-doc supports "..." as a function argument for varargs.
> See Documentation/doc-guide/kernel-doc.rst:
> 
> "If a function has a variable number of arguments, its description should
> be written in kernel-doc notation as::
> 
>       * @...: description"
I missed it, thanks for pointing it out!

Regards
Arnaud
> 
> 
> So the below could be done as:
> 
> On 2/12/20 1:32 AM, Arnaud Pouliquen wrote:
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 097f33e4f1f3..5f9a5812505c 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -224,7 +224,7 @@ EXPORT_SYMBOL(rproc_da_to_va);
>>  /**
>>   * rproc_find_carveout_by_name() - lookup the carveout region by a name
>>   * @rproc: handle of a remote processor
>> - * @name,..: carveout name to find (standard printf format)
>> + * @name: carveout name to find (standard printf format)
> 
>  * @name: carveout name to find
>  * @...: standard printf format of args to search for carveout name
> 
> although I'm not so sure about the descriptions there.
> 
>>   *
>>   * Platform driver has the capability to register some pre-allacoted carveout
>>   * (physically contiguous memory regions) before rproc firmware loading and
> 
> 
> thanks for the kernel-doc update.
> 
