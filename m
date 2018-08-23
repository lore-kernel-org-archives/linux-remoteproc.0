Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:39959 "EHLO
        mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbeHXDYe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Aug 2018 23:24:34 -0400
Received: by mail-qk0-f181.google.com with SMTP id c126-v6so4802312qkd.7
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Aug 2018 16:52:32 -0700 (PDT)
MIME-Version: 1.0
Reply-To: dry@embedded-synergy.co.za
In-Reply-To: <20180823161233.de5d0de132d42f0089eadcb8@posteo.de>
References: <CABViPYkb+g9GkJNVU6AUpzJRwLwZSD9PuxzDrDzgzb6Z0Ky1Gw@mail.gmail.com>
 <4941e366-f41f-9b8f-8c23-b840a01b3970@ti.com> <CABViPYmZH6dVYH7V9kOTi6KJeoFt1axOzVq6NSrASsFPJsg0eg@mail.gmail.com>
 <20180823161233.de5d0de132d42f0089eadcb8@posteo.de>
From: Denis Ryndine <dry@embedded-synergy.co.za>
Date: Fri, 24 Aug 2018 09:52:31 +1000
Message-ID: <CABViPY=r+hBf7V4DfVavLjxmnSEynFxcugq19fUBtQL8QxEi-g@mail.gmail.com>
Subject: Re: rproc_elf_load_segments: rproc_elf_load_segments elf loading problem
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
To: Felix Siegel <felix.siegel@posteo.de>
Cc: Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello Felix,

On Fri, Aug 24, 2018 at 12:12 AM, Felix Siegel <felix.siegel@posteo.de> wrote:
> Hi Denis,
>
> On Thu, 23 Aug 2018 11:28:08 +1000
> Denis Ryndine <dry@embedded-synergy.co.za> wrote:
>
>> Hello Suman,
>>
>> On Thu, Aug 23, 2018 at 6:50 AM, Suman Anna <s-anna@ti.com> wrote:
>> >
>> > Hi Denis,
>> >
>> > On 08/20/2018 12:40 AM, Denis Ryndine wrote:
>> > > Hello,
>> > >
>> > > The following may look like an error, could someone review.
>> > >
>> > > In rproc_elf_load_segments:
>> > >
>> > > /* grab the kernel address for this device address */
>> > > ptr = rproc_da_to_va(rproc, da, memsz);
>> > >
>> > > The last parameter should be filesz. Otherwise this call may fail, as
>> > > the case when da is an address within a segment / memory.
>> > > (E.g.  placing a RO data after the code within text segment /memory ).
>> >
>> > No, it's alright, memsz >= filesz usually. The actual loadable content
>>
>> No issue here.
>>
>> > will be filesz, the rest is zero initialized. Both these are from the
>> > program headers. Have you seen some issues around this?
>>
>> If the da points to the beginning of the segment or the device's
>> memory then it's all good. But da can point somewhere with-in or at
>> the end of the previous memory segment, where there is enough room to
>> fit filesz.
>> The check above may fail using memsz  (memsz >= filesz) if there isn't
>> physical memory left to fit memsz, but for  >= filesz.
>>
>> Consider an OCRAM linked firmware (for iMX),  with elf :
>>
>> Program Headers:
>> Type Offset VirtAddr PhysAddr FileSiz MemSiz Flg Align
>> LOAD 0x001000 0x00000000 0x00000000 0x00240 0x00240 R 0x1000
>> LOAD 0x002000 0x00910000 0x00910000 0x0c2e0 0x0c2e0 RWE 0x1000
>> LOAD 0x00f000 0x20220000 0x0091c2e0 0x00210 0x072e0 RW 0x1000
>>
>> The grab kernel address fails trying grab too much:
>> remoteproc remoteproc0: bad phdr da 0x91c2e0 mem 0x72e0
>>
>> But it shouldn't, as there is enough space in that memory for the
>> filesz, which is what to be programmed into it, not the memsz.
>>
>> For iMX, for example, the device specific  rproc_da_to_va() would have
>> resolved the needed kernel address, if filesz would have been passed.
>> See imx_rproc.c - imx_rproc_da_to_va() ->  imx_rproc_da_to_sys(),
>> which would return the needed address: there is enough in that memory
>> block for filesz, but not for memsz.
>
> I had a similar problem with the iMX7 working with TCM.
> Your fix would probably work however this only occurs due to strange behaviour in the NXP linker and startup files.

I understand, changing the layout of sections in linker script will
make this go away. It may seem though it shouldn't hurt, as it's
filesz bytes that gets programmed.

> The NXP linker file stores the data segment directly behind the code segment in the code memory region

I read it (script) that they only put initialization and RO/read-only
data directly behind text, within text segment. Organization wise this
looks nice, put text & other RO data together (at least for those apps
which don't modify it runtime)

> (causing the difference between VirtAddr and PhysAddr) and the startup assembly then loads the data segment into the data memory region.
>
> This would make sense for a normal microcontroller with persistent memory to boot from, but atleast on the imx7 the M4 requires the A7 to start it
> and the supported memory regions are all volatile anyway.
>
> After I changed the linker script and the startup routine it worked for me. It also avoids needlessly copying data around.

Oops, didn't think about the unnecessary copying of data by on the app start up.
However, may be because on iMXx you can lock / secure the text & RO
data memory from further modifications after it's been programmed, so
that could be advantageous?

Apologies with this iMX stuff discussion here, on the question about
general elf proc load.

Going back to rproc_elf_load_segments however, it's been pointed out
to me on another forum that there will be another problem with my
strange linker script & the elf it produces:


* Zero out remaining memory for this segment.
*
* This isn't strictly required since dma_alloc_coherent already
* did this for us. albeit harmless, we may consider removing
* this.
*/
if (memsz > filesz)
   memset(ptr + filesz, 0, memsz - filesz);

This ain't going to be harmless for my case, as it will go cross
segments and may go cross physical memories.

>>
>> > regards
>> > Suman
>>
>> Regards,
>>
>> Denis
>
> Regards,
>
> Felix
>
