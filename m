Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2] rpmsg: core: add API to get MTU
References: <20191113172249.32412-1-arnaud.pouliquen@st.com>
 <20200113172453.GQ738324@yoga> <c6ecd3b6-2a3b-11d8-6d1c-a531c73bc388@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <c199d1ba-53c4-b79c-1dd0-b01ef12dbb48@ti.com>
Date: Tue, 14 Jan 2020 17:52:36 -0600
MIME-Version: 1.0
In-Reply-To: <c6ecd3b6-2a3b-11d8-6d1c-a531c73bc388@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, Fabien DESSENNE <fabien.dessenne@st.com>, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

On 1/14/20 3:06 AM, Arnaud POULIQUEN wrote:
> Hi Bjorn
> 
> On 1/13/20 6:24 PM, Bjorn Andersson wrote:
>> On Wed 13 Nov 09:22 PST 2019, Arnaud Pouliquen wrote:
>>
>>> Return the rpmsg buffer MTU for sending message, so rpmsg users
>>> can split a long message in several sub rpmsg buffers.
>>>
>>
>> I won't merge this new api without a client, and I'm still concerned
>> about the details.
> The client exists: it is the rpmsg tty that i 've been rying to upstream since for a while.
> https://patchwork.kernel.org/cover/11130213/
> This patch is the result of some comments you did on rpmsg tty thread. 
> Suman was also interested in and request to merge it independently
> (https://lkml.org/lkml/2019/9/3/774).
> That's why i'm trying to do it in 2 steps.
> 
>>
>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>>> ---
>>>  V1 to V2
>>>
>>>   V1 patch:https://lore.kernel.org/patchwork/patch/1124684/
>>>   - Change patch title,
>>>   - as not solution today to support MTU on GLINK make ops optional,
>>>     RPMsg client API returns -ENOTSUPP in this case,
>>>   - suppress smd and glink patches.
>>
>> That's ok.
>>
>>> ---
>>>  drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>>>  drivers/rpmsg/rpmsg_internal.h   |  2 ++
>>>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>>>  include/linux/rpmsg.h            | 10 ++++++++++
>>>  4 files changed, 43 insertions(+)
>>>
>>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>>> index e330ec4dfc33..a6ef54c4779a 100644
>>> --- a/drivers/rpmsg/rpmsg_core.c
>>> +++ b/drivers/rpmsg/rpmsg_core.c
>>> @@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>>  }
>>>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>>>  
>>> +/**
>>> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
>>> + * @ept: the rpmsg endpoint
>>> + *
>>> + * This function returns maximum buffer size available for a single message.
>>> + *
>>> + * Return: the maximum transmission size on success and an appropriate error
>>> + * value on failure.
>>
>> Is the expectation that a call to rpmsg_send() with this size will
>> eventually succeed?
> yes, this should be the role of the transport layer
> (e.g. RPMsg VirtIO bus) to ensure this.
> 
>>
>>> + */
>> [..]
>>> +static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>>> +{
>>> +	struct rpmsg_device *rpdev = ept->rpdev;
>>> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>>> +
>>> +	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>>
>> I'm still under the impression that the rpmsg protocol doesn't have to
>> operate on fixed size messages. Would this then return vrp->num_bufs *
>> vrp->buf_size / 2 - sizeof(rpmsg_hdr)?

There was some discussion in the past to remove the 512 bytes
hard-coding and replace it with a configurable value, but that is not
yet done. There was some code restructuring towards the same, but it it
still fixed atm in virtio_rpmsg transport.

> it depends on the transport layer. For RPMsg over virtio, this is the size
> of the payload of a buffer so vrp->buf_size  - sizeof(rpmsg_hdr)

The vrp->num_bufs is the number of buffers available in the vring
transport, vrp->buf_size is the size for each transport buffer, and
every message includes the rpmsg_hdr structure, so the amount available
for rpmsg clients is less by that much.

regards
Suman
