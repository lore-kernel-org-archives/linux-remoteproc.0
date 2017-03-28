Return-Path: <s-anna@ti.com>
Subject: Re: [RFC LINUX PATCH 0/3] Allow remote to specify shared memory
References: <1490383336-23117-1-git-send-email-jliang@xilinx.com>
 <df420852-6b5a-a2fc-4c4c-8556b9985e29@ti.com>
 <CAA07jV-Neu5r2-CFFsnuN9pT_g9kV=zSSbzhbxCFODHe4v9b=g@mail.gmail.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <3aaedbd9-168f-9dd0-62de-3e4209ee09a8@ti.com>
Date: Tue, 28 Mar 2017 18:24:09 -0500
MIME-Version: 1.0
In-Reply-To: <CAA07jV-Neu5r2-CFFsnuN9pT_g9kV=zSSbzhbxCFODHe4v9b=g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Wendy Liang <sunnyliangjy@gmail.com>
Cc: Wendy Liang <wendy.liang@xilinx.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Wendy Liang <jliang@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Wendy,

On 03/28/2017 01:52 PM, Wendy Liang wrote:
> Thanks Suman for your comments.
> 
> On Mon, Mar 27, 2017 at 8:54 AM, Suman Anna <s-anna@ti.com> wrote:
>> Hi Wendy,
>>
>> On 03/24/2017 02:22 PM, Wendy Liang wrote:
>>> This patch enables the remoteproc to specify the shared memory.
>>> Remoteproc declared this memory as DMA memory.
>>> It can be used for virtio, or shared buffers.
>>
>> You should be able to achieve this without any remoteproc core changes.
>> You can do this by defining a reserved-memory node in your DTS file (can
>> be a CMA pool or a DMA pool), assigning the node using memory-region in
>> your remoteproc DT node and using the function,
>> of_reserved_mem_device_init() in your remoteproc driver.
> 
> The idea to introduce the rproc_mem is to let the remote to specify
> the shared memory.
> I am trying to see if there is a way to specify this software attribute without
> touching the device tree as it doesn't look like it is hardware related.
> And try to see if there is a way that when I change the firmware, i
> don't need to change the device tree.

So is this shared memory going to be accessed through an MMU by the
remote processor? If not, don't you need a specific carveout, which
would then in turn mean boot-time memory reservation?

regards
Suman

> 
> Thanks,
> Wendy
> 
>>
>> regards
>> Suman
>>
>>>
>>> Wendy Liang (3):
>>>   remoteproc: add rproc mem resource entry
>>>   remoteproc: add rproc_mem resource entry handler
>>>   remoteproc: Release DMA declare mem when cleanup rsc
>>>
>>>  drivers/remoteproc/remoteproc_core.c | 40 ++++++++++++++++++++++++++++++++++++
>>>  include/linux/remoteproc.h           | 23 ++++++++++++++++++++-
>>>  2 files changed, 62 insertions(+), 1 deletion(-)
>>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-remoteproc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
