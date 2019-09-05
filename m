Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH 1/3] rpmsg: core: add API to get message length
References: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com>
 <1567693630-27544-2-git-send-email-arnaud.pouliquen@st.com>
 <CAOCk7Nrja=31soMB+MhcrxhGHMT+bj9U+3_h6cTLo3+AAsFKqQ@mail.gmail.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <8e87ccff-1bdb-255c-0be4-db34869f0d13@st.com>
Date: Thu, 5 Sep 2019 18:02:00 +0200
MIME-Version: 1.0
In-Reply-To: <CAOCk7Nrja=31soMB+MhcrxhGHMT+bj9U+3_h6cTLo3+AAsFKqQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, lkml <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org, MSM <linux-arm-msm@vger.kernel.org>, Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Jeffrey,


On 9/5/19 4:42 PM, Jeffrey Hugo wrote:
> On Thu, Sep 5, 2019 at 8:35 AM Arnaud Pouliquen <arnaud.pouliquen@st.com> wrote:
>>
>> Return the rpmsg buffer size for sending message, so rpmsg users
>> can split a long message in several sub rpmsg buffers.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>   drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>>   drivers/rpmsg/rpmsg_internal.h   |  2 ++
>>   drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>>   include/linux/rpmsg.h            | 10 ++++++++++
>>   4 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index e330ec4dfc33..a6ef54c4779a 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>   }
>>   EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>>
>> +/**
>> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
>> + * @ept: the rpmsg endpoint
>> + *
>> + * This function returns maximum buffer size available for a single message.
>> + *
>> + * Return: the maximum transmission size on success and an appropriate error
>> + * value on failure.
>> + */
> 
> What is the intent of this?
> 
> The term "mtu" is "maximum transfer unit" - ie the largest payload of
> data that could possibly be sent, however at any one point in time,
> that might not be able to be accommodated.
I was not aware that the MTU has to be static in time. And I'm not 
enough expert to be able challenge this.
The use of the MTU initially came from a Bjorn request and IMHO makes 
sense in RPMSG protocol as other protocols. The aim here is not to 
guaranty the available size but to provide to rpmsg client a packet size 
information that is not available today at rpmsg client level.
For instance for the virtio rpmsg bus we provide the size of a vring 
buffer, not the total size available in the vring.

> 
> I don't think this is implemented correctly.  In GLINK and SMD, you've
> not implemented MTU, you've implemented "how much can I send at this
> point in time".  To me, this is not mtu.
If MTU has to be static i agree with you.
> 
> In the case of SMD, you could get the fifo size and return that as the
> mtu, but since you seem to be wanting to use this from the TTY layer
> to determine how much can be sent at a particular point in time, I
> don't think you actually want mtu.
Please forget the TTY for the moment, The mtu is used to help the tty 
framework to split the buffer to write. The size is then adjusted on write.
For SMD i can provide the fifo_size,or a division of this size to 
"limit" congestion.
would this make sense for you?
> 
> For GLINK, I don't actually think you can get a mtu based on the
> design, but I'm trying to remember from 5-6 years ago when we designed
> it.  It would be possible that a larger intent would be made available
> later.
Is it possible to have the largest intent? or it's not deterministic.
> 
> I think you need to first determine if you are actually looking for
> mtu, or "how much data can I send right now", because right now, it
> isn't clear.
> 
In my view it is the MTU. "how much data can I send right now" is an 
information that is very volatile as buffers can be shared between 
several clients, therefore unusable.

An alternative would be to make this ops optional, but that would mean
that some generic clients would not be compatible with SMD and/or Glink 
drivers.

Thanks,
Arnaud
