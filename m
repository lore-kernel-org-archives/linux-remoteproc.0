Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] rpmsg: core: add support to power domains for devices
References: <20180615095939.1331-1-srinivas.kandagatla@linaro.org>
 <a80cce14-9e57-32a2-760f-3d29de009f99@ti.com>
 <91dda9df-8074-925d-dcd3-d7c01e6f2363@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <9afb010d-397f-2103-6692-bb4ca55b8236@ti.com>
Date: Tue, 25 Sep 2018 14:02:19 -0500
MIME-Version: 1.0
In-Reply-To: <91dda9df-8074-925d-dcd3-d7c01e6f2363@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Arnaud,

> On 09/25/2018 02:25 AM, Suman Anna wrote:
>> Hi Srinivas,
>>
>> On 06/15/2018 04:59 AM, Srinivas Kandagatla wrote:
>>> Some of the rpmsg devices need to switch on power domains to communicate
>>> with remote processor. For example on Qualcomm DB820c platform LPASS
>>> power domain needs to switched on for any kind of audio services.
>>> This patch adds the missing power domain support in rpmsg core.
>>>
>>> Without this patch attempting to play audio via QDSP on DB820c would
>>> reboot the system.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> ---
>>>  drivers/rpmsg/rpmsg_core.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>>> index b714a543a91d..8122807db380 100644
>>> --- a/drivers/rpmsg/rpmsg_core.c
>>> +++ b/drivers/rpmsg/rpmsg_core.c
>>> @@ -15,6 +15,7 @@
>>>  #include <linux/module.h>
>>>  #include <linux/rpmsg.h>
>>>  #include <linux/of_device.h>
>>> +#include <linux/pm_domain.h>
>>>  #include <linux/slab.h>
>>>  
>>>  #include "rpmsg_internal.h"
>>> @@ -449,6 +450,10 @@ static int rpmsg_dev_probe(struct device *dev)
>>>  	struct rpmsg_endpoint *ept = NULL;
>>>  	int err;
>>>  
>>> +	err = dev_pm_domain_attach(dev, true);
>>> +	if (err)
>>> +		goto out;
>>
>> This patch has broken the virtio-rpmsg stack based rpmsg devices. These
>> devices are non-DT and the rpmsg_dev_probe() is now failing with -19
>> (-ENODEV) error code.
>>
>> Loic, Arnaud,
>> Can one of you double-confirm this behavior on ST platforms as well?
>> The patch came through 4.14.71 stable release and broke our downstream
>> kernels.

> I do not reproduce issue on 4.14.0 + your patch,  on my ST platform (not
> able to test on the LTS branch).
> By looking the source code, seems that your issue is related to
> genpd_dev_pm_attach that returns -ENODEV because you have
> no remoteproc device node...
> Do you have a rproc node defined in your DT? we have one.

The dev here is not the remoteproc dev but the rpmsg device which does
not have an OF node, and so I get the ENODEV due to the check on
dev->of_node in genpd_dev_pm_attach. I do have DT remoteproc nodes.

Are you publishing an rpmsg device from the remote side and are they
being probed? Issue is seen only during the probe phase, you will not
see any errors if the rpmsg devices are just being published and created.

regards
Suman

> 
> Regards
> Arnaud
> 
>>
>> regards
>> Suman
>>
>>> +
>>>  	if (rpdrv->callback) {
>>>  		strncpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
>>>  		chinfo.src = rpdev->src;
>>> @@ -490,6 +495,8 @@ static int rpmsg_dev_remove(struct device *dev)
>>>  
>>>  	rpdrv->remove(rpdev);
>>>  
>>> +	dev_pm_domain_detach(dev, true);
>>> +
>>>  	if (rpdev->ept)
>>>  		rpmsg_destroy_ept(rpdev->ept);
>>>  
>>>
>>
