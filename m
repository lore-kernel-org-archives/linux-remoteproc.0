Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] rpmsg: core: add support to power domains for devices
References: <20180615095939.1331-1-srinivas.kandagatla@linaro.org>
 <a80cce14-9e57-32a2-760f-3d29de009f99@ti.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <604f52b3-1296-8443-36a3-399c69561713@linaro.org>
Date: Tue, 25 Sep 2018 09:29:51 +0100
MIME-Version: 1.0
In-Reply-To: <a80cce14-9e57-32a2-760f-3d29de009f99@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Suman Anna <s-anna@ti.com>, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Suman,

On 25/09/18 01:25, Suman Anna wrote:
> Hi Srinivas,
> 
> On 06/15/2018 04:59 AM, Srinivas Kandagatla wrote:
>> Some of the rpmsg devices need to switch on power domains to communicate
>> with remote processor. For example on Qualcomm DB820c platform LPASS
>> power domain needs to switched on for any kind of audio services.
>> This patch adds the missing power domain support in rpmsg core.
>>
>> Without this patch attempting to play audio via QDSP on DB820c would
>> reboot the system.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/rpmsg/rpmsg_core.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index b714a543a91d..8122807db380 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/module.h>
>>   #include <linux/rpmsg.h>
>>   #include <linux/of_device.h>
>> +#include <linux/pm_domain.h>
>>   #include <linux/slab.h>
>>   
>>   #include "rpmsg_internal.h"
>> @@ -449,6 +450,10 @@ static int rpmsg_dev_probe(struct device *dev)
>>   	struct rpmsg_endpoint *ept = NULL;
>>   	int err;
>>   
>> +	err = dev_pm_domain_attach(dev, true);
>> +	if (err)
>> +		goto out;
> 
> This patch has broken the virtio-rpmsg stack based rpmsg devices. These
> devices are non-DT and the rpmsg_dev_probe() is now failing with -19
> (-ENODEV) error code.
> 

There seems to be some dependency on this patch ( 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v4.19-rc5&id=919b7308fcc452cd4e282bab389c33384a9f3790 
) which seems to rework the return values from acpi_dev_pm_attach() and 
genpd_dev_pm_attach()



--srini


> Loic, Arnaud,
> Can one of you double-confirm this behavior on ST platforms as well?
> The patch came through 4.14.71 stable release and broke our downstream
> kernels.
> 
> regards
> Suman
> 
>> +
>>   	if (rpdrv->callback) {
>>   		strncpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
>>   		chinfo.src = rpdev->src;
>> @@ -490,6 +495,8 @@ static int rpmsg_dev_remove(struct device *dev)
>>   
>>   	rpdrv->remove(rpdev);
>>   
>> +	dev_pm_domain_detach(dev, true);
>> +
>>   	if (rpdev->ept)
>>   		rpmsg_destroy_ept(rpdev->ept);
>>   
>>
> 
