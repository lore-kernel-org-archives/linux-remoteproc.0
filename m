Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: select QCOM_SMP2P for all qcom pils
References: <20170913160405.17855-1-srinivas.kandagatla@linaro.org>
 <20170914165751.GN2016@tuxbook>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3e72fa15-7c56-3b15-2532-cd3ae03b4631@linaro.org>
Date: Fri, 15 Sep 2017 10:09:41 +0100
MIME-Version: 1.0
In-Reply-To: <20170914165751.GN2016@tuxbook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 14/09/17 17:57, Bjorn Andersson wrote:
> On Wed 13 Sep 09:04 PDT 2017, srinivas.kandagatla@linaro.org wrote:
> 
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> All Qualcomm PIL drivers require SMP2P module to get a functional PIL,
>> Currently user has to explicitly select SMP2P module, after looking
>> at failure logs.
>>
>> Fix this by selecting SMP2P as part of dependency of pil kconfig itself.
>>
> 
> The Kconfig should describe dependencies needed by the code, not by the
> system.

I partially agree with this! As I did not realize that that there are 
more than one SMEM_STATE drivers.


The driver bindings clearly marks "qcom,smem-states" and 
"qcom,smem-state-names" as required properties, so it makes the driver 
dependent on SMEM_STATE.

But SMEM_STATE is only selected from SMP2P Kconfig.

Indirectly/directly the driver is dependent on the SMEM_STATE drivers.


> 
> I agree with you that this leads to wasted time trying figure out if
> we're missing drivers/modules in the kernel, but I think that needs to
> be solved in a more generic way.
> 
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/remoteproc/Kconfig | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index 8891a8e50f12..052c9e20abb6 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -87,6 +87,7 @@ config QCOM_ADSP_PIL
>>   	select QCOM_MDT_LOADER
>>   	select QCOM_RPROC_COMMON
>>   	select QCOM_SCM
>> +	select QCOM_SMP2P

I agree, instead of select, we should mark these configs with a

depends on QCOM_SMEM_STATE


so that the final pil kconfigs are only selected with right dependencies 
are in place.
Does that sound okay?


thanks,
srini

> 
> NB. QCOM_SMP2P is a user-selectable config option, so you are not
> allowed to "select" it, only "depends on" it.
> 
> Regards,
> Bjorn
> 
