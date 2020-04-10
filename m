Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH] remoteproc: core: Add a memory efficient coredump
 function
References: <1585353412-19644-1-git-send-email-rishabhb@codeaurora.org>
 <20200401195114.GD267644@minitux> <20200402172435.GA2785@xps15>
 <20200403051611.GJ663905@yoga>
 <CANLsYkzqg=ksv46ZO7=2Vd1Li8sbSwD2uzSjSPfxFj0BQgPNvA@mail.gmail.com>
 <20200409202714.GT20625@builder.lan>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <bb11115e-ce13-eeda-9b29-a75a030f4c98@st.com>
Date: Fri, 10 Apr 2020 12:31:49 +0200
MIME-Version: 1.0
In-Reply-To: <20200409202714.GT20625@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rishabh Bhatnagar <rishabhb@codeaurora.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, psodagud@codeaurora.org, tsoni@codeaurora.org, Siddharth Gupta <sidgup@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>



On 4/9/20 10:27 PM, Bjorn Andersson wrote:
> On Fri 03 Apr 13:53 PDT 2020, Mathieu Poirier wrote:
> 
>> On Thu, 2 Apr 2020 at 23:16, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>>>
>>> On Thu 02 Apr 10:24 PDT 2020, Mathieu Poirier wrote:
>>>
>>>> On Wed, Apr 01, 2020 at 12:51:14PM -0700, Bjorn Andersson wrote:
>>>>> On Fri 27 Mar 16:56 PDT 2020, Rishabh Bhatnagar wrote:
>>>>>
>>>>>> The current coredump implementation uses vmalloc area to copy
>>>>>> all the segments. But this might put a lot of strain on low memory
>>>>>> targets as the firmware size sometimes is in ten's of MBs.
>>>>>> The situation becomes worse if there are multiple remote processors
>>>>>> undergoing recovery at the same time.
>>>>>> This patch directly copies the device memory to userspace buffer
>>>>>> and avoids extra memory usage. This requires recovery to be halted
>>>>>> until data is read by userspace and free function is called.
>>>>>>
>>>>>> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
>>>>>> ---
>>>>>>  drivers/remoteproc/remoteproc_core.c | 107 +++++++++++++++++++++++++++++------
>>>>>>  include/linux/remoteproc.h           |   4 ++
>>>>>>  2 files changed, 94 insertions(+), 17 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>>>> index 097f33e..2d881e5 100644
>>>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>>>> @@ -1516,6 +1516,86 @@ int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size)
>>>>>>  }
>>>>>>  EXPORT_SYMBOL(rproc_coredump_add_segment);
>>>>>>
>>>>>> +
>>>>>> +void rproc_free_dump(void *data)
>>>>>
>>>>> static
>>>>>
>>>>>> +{
>>>>>> + struct rproc *rproc = data;
>>>>>> +
>>>>>> + dev_info(&rproc->dev, "Userspace done reading rproc dump\n");
>>>>>
>>>>> Please drop the info prints throughout.
>>>>>
>>>>>> + complete(&rproc->dump_done);
>>>>>> +}
>>>>>> +
>>>>>> +static unsigned long get_offset(loff_t user_offset, struct list_head *segments,
>>>>>> +                         unsigned long *data_left)
>>>>>
>>>>> Please rename this rproc_coredump_resolve_segment(), or something along
>>>>> those lines.
>>>>>
>>>>>> +{
>>>>>> + struct rproc_dump_segment *segment;
>>>>>> +
>>>>>> + list_for_each_entry(segment, segments, node) {
>>>>>> +         if (user_offset >= segment->size)
>>>>>> +                 user_offset -= segment->size;
>>>>>> +         else
>>>>>> +                 break;
>>>>>> + }
>>>>>> +
>>>>>> + if (&segment->node == segments) {
>>>>>> +         *data_left = 0;
>>>>>> +         return 0;
>>>>>> + }
>>>>>> +
>>>>>> + *data_left = segment->size - user_offset;
>>>>>> +
>>>>>> + return segment->da + user_offset;
>>>>>> +}
>>>>>> +
>>>>>> +static ssize_t rproc_read_dump(char *buffer, loff_t offset, size_t count,
>>>>>> +                         void *data, size_t elfcorelen)
>>>>>> +{
>>>>>> + void *device_mem = NULL;
>>>>>> + unsigned long data_left = 0;
>>>>>> + unsigned long bytes_left = count;
>>>>>> + unsigned long addr = 0;
>>>>>> + size_t copy_size = 0;
>>>>>> + struct rproc *rproc = data;
>>>>>> +
>>>>>> + if (offset < elfcorelen) {
>>>>>> +         copy_size = elfcorelen - offset;
>>>>>> +         copy_size = min(copy_size, bytes_left);
>>>>>> +
>>>>>> +         memcpy(buffer, rproc->elfcore + offset, copy_size);
>>>>>> +         offset += copy_size;
>>>>>> +         bytes_left -= copy_size;
>>>>>> +         buffer += copy_size;
>>>>>> + }
>>>>>> +
>>>>>> + while (bytes_left) {
>>>>>> +         addr = get_offset(offset - elfcorelen, &rproc->dump_segments,
>>>>>> +                         &data_left);
>>>>>> + /* EOF check */
>>>>>
>>>>> Indentation, and "if no data left" does indicate that this is the end of
>>>>> the loop already.
>>>>>
>>>>>> +         if (data_left == 0) {
>>>>>> +                 pr_info("Ramdump complete. %lld bytes read.", offset);
>>>>>> +                 return 0;
>>>>>
>>>>> You might have copied data to the buffer, so returning 0 here doesn't
>>>>> seem right. Presumably instead you should break and return offset -
>>>>> original offset or something like that.
>>>>>
>>>>>> +         }
>>>>>> +
>>>>>> +         copy_size = min_t(size_t, bytes_left, data_left);
>>>>>> +
>>>>>> +         device_mem = rproc->ops->da_to_va(rproc, addr, copy_size);
>>>>>> +         if (!device_mem) {
>>>>>> +                 pr_err("Unable to ioremap: addr %lx, size %zd\n",
>>>>>> +                          addr, copy_size);
>>>>>> +                 return -ENOMEM;
>>>>>> +         }
>>>>>> +         memcpy(buffer, device_mem, copy_size);
>>>>>> +
>>>>>> +         offset += copy_size;
>>>>>> +         buffer += copy_size;
>>>>>> +         bytes_left -= copy_size;
>>>>>> +         dev_dbg(&rproc->dev, "Copied %d bytes to userspace\n",
>>>>>> +                 copy_size);
>>>>>> + }
>>>>>> +
>>>>>> + return count;
>>>>>
>>>>> This should be the number of bytes actually returned, so if count is
>>>>> larger than the sum of the segment sizes this will be wrong.
>>>>>
>>>>>> +}
>>>>>> +
>>>>>>  /**
>>>>>>   * rproc_coredump_add_custom_segment() - add custom coredump segment
>>>>>>   * @rproc:       handle of a remote processor
>>>>>> @@ -1566,27 +1646,27 @@ static void rproc_coredump(struct rproc *rproc)
>>>>>>   struct rproc_dump_segment *segment;
>>>>>>   struct elf32_phdr *phdr;
>>>>>>   struct elf32_hdr *ehdr;
>>>>>> - size_t data_size;
>>>>>> + size_t header_size;
>>>>>>   size_t offset;
>>>>>>   void *data;
>>>>>> - void *ptr;
>>>>>>   int phnum = 0;
>>>>>>
>>>>>>   if (list_empty(&rproc->dump_segments))
>>>>>>           return;
>>>>>>
>>>>>> - data_size = sizeof(*ehdr);
>>>>>> + header_size = sizeof(*ehdr);
>>>>>>   list_for_each_entry(segment, &rproc->dump_segments, node) {
>>>>>> -         data_size += sizeof(*phdr) + segment->size;
>>>>>> +         header_size += sizeof(*phdr);
>>>>>>
>>>>>>           phnum++;
>>>>>>   }
>>>>>>
>>>>>> - data = vmalloc(data_size);
>>>>>> + data = vmalloc(header_size);
>>>>>>   if (!data)
>>>>>>           return;
>>>>>>
>>>>>>   ehdr = data;
>>>>>> + rproc->elfcore = data;
>>>>>
>>>>> Rather than using a rproc-global variable I would prefer that you create
>>>>> a new rproc_coredump_state struct that carries the header pointer and
>>>>> the information needed by the read & free functions.
>>>>>
>>>>>>
>>>>>>   memset(ehdr, 0, sizeof(*ehdr));
>>>>>>   memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
>>>>>> @@ -1618,23 +1698,14 @@ static void rproc_coredump(struct rproc *rproc)
>>>>>>
>>>>>>           if (segment->dump) {
>>>>>>                   segment->dump(rproc, segment, data + offset);
>>>>
>>>> I'm not exactly sure why custom segments can be copied to the elf image but not
>>>> generic ones... And as far as I can tell accessing "data + offset" will blow up
>>>> because only the memory for the program headers has been allocated, not for the
>>>> program segments.
>>>>
>>>
>>> Thanks, I missed that, but you're correct.
>>>
>>>>
>>>>>> -         } else {
>>>>>> -                 ptr = rproc_da_to_va(rproc, segment->da, segment->size);
>>>>>> -                 if (!ptr) {
>>>>>> -                         dev_err(&rproc->dev,
>>>>>> -                                 "invalid coredump segment (%pad, %zu)\n",
>>>>>> -                                 &segment->da, segment->size);
>>>>>> -                         memset(data + offset, 0xff, segment->size);
>>>>>> -                 } else {
>>>>>> -                         memcpy(data + offset, ptr, segment->size);
>>>>>> -                 }
>>>>>> -         }
>>>>>>
>>>>>>           offset += phdr->p_filesz;
>>>>>>           phdr++;
>>>>>>   }
>>>>>> + dev_coredumpm(&rproc->dev, NULL, rproc, header_size, GFP_KERNEL,
>>>>>> +                 rproc_read_dump, rproc_free_dump);
>>>>>>
>>>>>> - dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
>>>>>> + wait_for_completion(&rproc->dump_done);
>>>>>
>>>>> This will mean that recovery handling will break on installations that
>>>>> doesn't have your ramdump collector - as it will just sit here forever
>>>>> (5 minutes) waiting for userspace to do its job.
>>>>
>>>> Right, that problem also came to mind.
>>>>
>>>>>
>>>>> I think we need to device a new sysfs attribute, through which you can
>>>>> enable the "inline" coredump mechanism. That way recovery would work for
>>>>> all systems and in your specific case you could reconfigure it - perhaps
>>>>> once the ramdump collector starts.
>>>>
>>>> Another option is to make rproc_coredump() customizable, as with all the other
>>>> functions in remoteproc_internal.h.  That way the current rproc_coredump() is
>>>> kept intact and we don't need a new sysfs entry.
>>>>
>>>
>>> Rishabh suggested this in a discussion we had earlier this week as well,
>>> but we still have the problem that the same platform driver will need to
>>> support both modes, depending on which user space is running. So even if
>>> we push this out to the platform driver we still need some mechanism
>>> for userspace to enable the "inline" mode.
>>
>> So is this something that needs to be done on the fly in response to
>> some system event?  Any possibility to use the DT?
>>
> 
> Designing this as a dynamic property would mean that the kernel doesn't
> have to be recompiled between different variants of the same software
> solution for a piece of hardware.
> 
> Putting a flag in DT would mean that you need to flash different DT
> depending on what apps your running in userspace.
> 
>> We are currently discussing the addition of a character driver [1]...
>> The file_operations could be platform specific so any scenario can be
>> implemented, whether it is switching on/off a remote processor in the
>> open/release() callback or setting the behavior of the coredump
>> functionality in an ioctl().
> 
> The main benefit of tying this to the character device would be that the
> behavior could be reverted on release(). But this would imply that the
> application starting and stopping the remoteproc is also the one
> collecting ramdumps and it would also imply that there exists such an
> application (e.g. this functionality is still desirable for auto_booted
> remoteprocs).

What about to have a dedicated sub device for the coredump, with its own
interface (sysfs or char dev)?
Then kernel configs could enable/disable the driver and set the mode.
This could help to decorrelate the coredump and the recovery and manage
different behaviors for debug, production and final product.

> 
> Finally I think it's likely that the existing tools for collecting
> devcoredump artifacts are expected to just continue to work after this
> change - in both modes.
agree
> 
> 
> 
> On the functionality Rishabh proposes, it would be very interesting to
> hear from others on their usage and need for coredumps.
Concerning the stm32 platform the usage will depend on customer choice,
as they implement their own remote firmware. So i suppose that the needs would be:
- to enable /disable the coredump depending onproject phases(dev, production,
  final product)
- to perform a post-mortem analysis:
   - remote proc trace
   - code and associated data section analysis
 
> 
> E.g. are Qualcomm really the only ones that has issues with
> vmalloc(sizeof(firmware)) failing and preventing post mortem debugging
> in low-memory scenarios? Or does others simply not care to debug
> remoteproc firmware in these cases? Is debugging only done using JTAG?
> 
>> I think there is value in exploring different opportunities so that we
>> keep the core as clean and simple as possible.
>>
> 
> I agree, but hadn't considered this fully. In particular with the
> changes I'm asking Rishabh to make we have a few screen fulls of code
> involved in the coredump handling. So I think it would be beneficial to
> move this into a remoteproc_coredump.c.

Agree, i would also consider a separate device (but perhaps in a second step). 

One challenge of having a separate device is that we need to ensure that
everything is ready(probed) before starting the firmware especially for the
autoboot mode.
Component bind/unbind mechanism could help to synchronize sub device with
rproc device on start and stop.
FYI, I plan to sent a RFC soon (internal review on going) about the 
de-correlation of the rproc virtio that also introduces the component
bind/unbind mechanism in rproc core.

Regards,
Arnaud

> 
> Thanks,
> Bjorn
> 
>> Thanks,
>> Mathieu
>>
>> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=264603
>>
>>>
>>> Regards,
>>> Bjorn
