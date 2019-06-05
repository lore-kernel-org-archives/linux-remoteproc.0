Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH 0/3] Enhance virtio rpmsg bus driver buffer allocation
References: <1548949280-31794-1-git-send-email-xiaoxiang@xiaomi.com>
 <20190605043452.GI22737@tuxbook-pro>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <2d60dd1e-f7a0-ea63-9fda-0ea97aab0406@st.com>
Date: Wed, 5 Jun 2019 09:33:15 +0200
MIME-Version: 1.0
In-Reply-To: <20190605043452.GI22737@tuxbook-pro>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Xiang Xiao <xiaoxiang781216@gmail.com>
Cc: ohad@wizery.com, wendy.liang@xilinx.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 6/5/19 6:34 AM, Bjorn Andersson wrote:
> On Thu 31 Jan 07:41 PST 2019, Xiang Xiao wrote:
> 
>> Hi,
>> This series enhance the buffer allocation by:
>> 1.Support the different buffer number in rx/tx direction
>> 2.Get the individual rx/tx buffer size from config space
>>
>> Here is the related OpenAMP change:
>> https://github.com/OpenAMP/open-amp/pull/155
>>
> 
> This looks pretty reasonable, but can you confirm that it's possible to
> use new firmware with an old Linux kernel when introducing this?
> 
> 
> But ever since we discussed Loic's similar proposal earlier I've been
> questioning if the fixed buffer size isn't just an artifact of how we
> preallocate our buffers. The virtqueue seems to support arbitrary sizes
> of buffers and I see that the receive function in OpenAMP has been fixed
> to put back the buffer of the size that was received, rather than 512
> bytes. So it seems like Linux would be able to send whatever size
> messages to OpenAMP it would handle it.
> 
> The question is if we could do the same in the other direction, perhaps
> by letting the OpenAMP side do it's message allocation when it's
> sending, rather than Linux pushing inbufs to be filled by the remote.

IMHO, both could be useful and could be not correlated.
On-the fly buffer allocation seems more efficient but needs an
allocator.This can be a generic allocator (with a va to da) for system
where large amount of memories are accessible from both side.

Now what about system with small shared memory? In this case you have to
deal with a limited/optimized memory chunk. To avoid memory
fragmentation the allocator should have a pre-reserved buffers pool(so
similar to existing implementation). This serie seems useful to optimize
the size of the pre-reserved pool.

> 
> This would remove the problem of always having suboptimal buffer sizes.
> 
> Regards,
> Bjorn
> 
>> Xiang Xiao (3):
>>   rpmsg: virtio_rpmsg_bus: allow the different vring size for send/recv
>>   rpmsg: virtio_rpmsg_bus: allocate rx/tx buffer separately
>>   rpmsg: virtio_rpmsg_bus: get buffer size from config space
>>
>>  drivers/rpmsg/virtio_rpmsg_bus.c  | 127 +++++++++++++++++++++++---------------
>>  include/uapi/linux/virtio_rpmsg.h |  24 +++++++
>>  2 files changed, 100 insertions(+), 51 deletions(-)
>>  create mode 100644 include/uapi/linux/virtio_rpmsg.h
>>
>> -- 
>> 2.7.4
>>

--

Regards,
Arnaud
