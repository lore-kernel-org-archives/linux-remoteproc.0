Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v1 0/6] rtio_rpmsg: make rpmsg channel configurable
References: <1481142941-15616-1-git-send-email-loic.pallardy@st.com>
 <3b1b4f00-c4a4-e7f5-f46f-10b0dcde591f@st.com>
 <a1722e0e-ff48-df98-8107-53ce769d6a89@ti.com>
 <538e9ca6c6ca468d93b619e4df890c2e@SFHDAG7NODE2.st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <3948b470-605d-fbe4-dbff-ac56cfedcc1d@ti.com>
Date: Mon, 16 Jan 2017 10:02:59 -0600
MIME-Version: 1.0
In-Reply-To: <538e9ca6c6ca468d93b619e4df890c2e@SFHDAG7NODE2.st.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Loic PALLARDY <loic.pallardy@st.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 01/14/2017 01:20 PM, Loic PALLARDY wrote:
> 
> 
>> -----Original Message-----
>> From: Suman Anna [mailto:s-anna@ti.com]
>> Sent: Saturday, January 14, 2017 2:36 AM
>> To: Loic PALLARDY <loic.pallardy@st.com>; bjorn.andersson@linaro.org;
>> ohad@wizery.com; lee.jones@linaro.org; Patrice CHOTARD
>> <patrice.chotard@st.com>
>> Cc: linux-remoteproc@vger.kernel.org; kernel@stlinux.com
>> Subject: Re: [PATCH v1 0/6] rtio_rpmsg: make rpmsg channel configurable
>>
>> Hi Loic,
>>
>>>
>>> On 12/07/2016 09:35 PM, Loic Pallardy wrote:
>>>> This goal of this series is to offer more flexibility for
>>>> virtio_rpmsg communication link configuration.
>>>>
>>>> It should be possible to tune rpmsg buffer size per Rpmsg link, to
>>>> provide selected configuration to coprocessor, to take into account
>>>> coprocessor specificities like memory region.
>>>>
>>>> This series introduces an optional virtio rpmsg configuration
>>>> structure, which will be managed as an extension of struct
>>>> fw_rsc_vdev present in coprocessor firmware resource table.
>>>> Structure access is possible thanks to virtio get and set API.
>>>> This structure contains the different information to tune the link
>>>> between the host and the coprocessor.
>>>>
>>>> Patch "rpmsg: virtio_rpmsg_bus: fix sg_set_buf() when addr is not a
>>>> valid kernel address" has the same goal as Wendy's RFC [1]. I don't
>>>> have tested Wendy's series with level driver buffer allocation.
>>>>
>>>> Last patch "rpmsg: virtio_rpmsg: set buffer configuration to virtio"
>>>> has a
>>>> dependency with remoteproc subdevice boot sequence as coprocessor
>>>> resource table must be updated before coprocessor start. See [2]
>>>>
>>>> [1] http://www.spinics.net/lists/linux-remoteproc/msg00852.html
>>>> [2] http://www.spinics.net/lists/linux-remoteproc/msg00826.html
>>>>
>>>
>>> Hi Bjorn,
>>>
>>> Gentle reminder. This series is present on ML since one month without
>>> update or objection. I hope to see it in your next pull request for v4.11.
>>
>> I like the overall objective of this series. I will need some time to test the
>> series, but have some preliminary comments. You would mostly need to
>> send a v2.
>>
> Hi Suman,
> 
> It will be with pleasure. Thanks for your comments. I'll update the series and send a v2.
> Regards,
> Loic

Hi Loic,

I have given this series a test spin, and so far it works fine on TI
platforms which do not have have this config (so backward compatible). I
am interested in seeing where the plumbing is done for updating the va
for this, is there any patch on the ST remoteproc that I can look at for
this.

regards
Suman

> 
>> regards
>> Suman
>>
>>>
>>> Best regards,
>>> Loic
>>>
>>>> Loic Pallardy (6):
>>>>   rpmsg: virtio_rpmsg: set rpmsg_buf_size customizable
>>>>   rpmsg: virtio_rpmsg_bus: fix sg_set_buf() when addr is not a valid
>>>>     kernel address
>>>>   include: virtio_rpmsg: add virtio rpmsg configuration structure
>>>>   rpmsg: virtio_rpmsg: get buffer configuration from virtio
>>>>   rpmsg: virtio_rpmsg: don't allocate buffer if provided by low level
>>>>     driver
>>>>   rpmsg: virtio_rpmsg: set buffer configuration to virtio
>>>>
>>>>  drivers/rpmsg/virtio_rpmsg_bus.c   | 176
>>>> ++++++++++++++++++++++++++++++-------
>>>>  include/linux/rpmsg/virtio_rpmsg.h |  32 +++++++
>>>>  2 files changed, 177 insertions(+), 31 deletions(-)  create mode
>>>> 100644 include/linux/rpmsg/virtio_rpmsg.h
>>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe
>>> linux-remoteproc" in the body of a message to
>>> majordomo@vger.kernel.org More majordomo info at
>>> http://vger.kernel.org/majordomo-info.html
> 
