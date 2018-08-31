Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-qt0-f178.google.com ([209.85.216.178]:41711 "EHLO
        mail-qt0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbeHaF0o (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 31 Aug 2018 01:26:44 -0400
Received: by mail-qt0-f178.google.com with SMTP id t39-v6so12895125qtc.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Aug 2018 18:21:48 -0700 (PDT)
MIME-Version: 1.0
Reply-To: dry@embedded-synergy.co.za
In-Reply-To: <ba736f03f42b66c0dd30e3a2e9c2fe84@agner.ch>
References: <CABViPYkb+g9GkJNVU6AUpzJRwLwZSD9PuxzDrDzgzb6Z0Ky1Gw@mail.gmail.com>
 <4941e366-f41f-9b8f-8c23-b840a01b3970@ti.com> <CABViPYmZH6dVYH7V9kOTi6KJeoFt1axOzVq6NSrASsFPJsg0eg@mail.gmail.com>
 <20180823161233.de5d0de132d42f0089eadcb8@posteo.de> <ba736f03f42b66c0dd30e3a2e9c2fe84@agner.ch>
From: Denis Ryndine <dry@embedded-synergy.co.za>
Date: Fri, 31 Aug 2018 11:21:46 +1000
Message-ID: <CABViPY=EoBtMDpEtM0QXkHaWVZ0nKXnLP95RZHygFPWAEc6E_g@mail.gmail.com>
Subject: Re: rproc_elf_load_segments: rproc_elf_load_segments elf loading problem
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Felix Siegel <felix.siegel@posteo.de>, Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org, linux-remoteproc-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Stefan,

If you thus also add this change :

--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -182,7 +182,7 @@ int rproc_elf_load_segments(struct rproc *rproc,
const struct firmware *fw)
                }

                /* grab the kernel address for this device address */
-               ptr = rproc_da_to_va(rproc, da, memsz);
+               ptr = rproc_da_to_va(rproc, da, filesz);
                if (!ptr) {
                        dev_err(dev, "bad phdr da 0x%x mem 0x%x\n", da, memsz);
                        ret = -EINVAL;


Then the loader should be more immune even when the elf was generated
with questionable configs.

Denis

On Thu, Aug 30, 2018 at 10:45 PM, Stefan Agner <stefan@agner.ch> wrote:
> Hi there,
>
> On 23.08.2018 16:12, Felix Siegel wrote:
>> Hi Denis,
>>
>> On Thu, 23 Aug 2018 11:28:08 +1000
>> Denis Ryndine <dry@embedded-synergy.co.za> wrote:
>>
>>> Hello Suman,
>>>
>>> On Thu, Aug 23, 2018 at 6:50 AM, Suman Anna <s-anna@ti.com> wrote:
>>> >
>>> > Hi Denis,
>>> >
>>> > On 08/20/2018 12:40 AM, Denis Ryndine wrote:
>>> > > Hello,
>>> > >
>>> > > The following may look like an error, could someone review.
>>> > >
>>> > > In rproc_elf_load_segments:
>>> > >
>>> > > /* grab the kernel address for this device address */
>>> > > ptr = rproc_da_to_va(rproc, da, memsz);
>>> > >
>>> > > The last parameter should be filesz. Otherwise this call may fail, as
>>> > > the case when da is an address within a segment / memory.
>>> > > (E.g.  placing a RO data after the code within text segment /memory ).
>>> >
>>> > No, it's alright, memsz >= filesz usually. The actual loadable content
>>>
>>> No issue here.
>>>
>>> > will be filesz, the rest is zero initialized. Both these are from the
>>> > program headers. Have you seen some issues around this?
>>>
>>> If the da points to the beginning of the segment or the device's
>>> memory then it's all good. But da can point somewhere with-in or at
>>> the end of the previous memory segment, where there is enough room to
>>> fit filesz.
>>> The check above may fail using memsz  (memsz >= filesz) if there isn't
>>> physical memory left to fit memsz, but for  >= filesz.
>>>
>>> Consider an OCRAM linked firmware (for iMX),  with elf :
>>>
>>> Program Headers:
>>> Type Offset VirtAddr PhysAddr FileSiz MemSiz Flg Align
>>> LOAD 0x001000 0x00000000 0x00000000 0x00240 0x00240 R 0x1000
>>> LOAD 0x002000 0x00910000 0x00910000 0x0c2e0 0x0c2e0 RWE 0x1000
>>> LOAD 0x00f000 0x20220000 0x0091c2e0 0x00210 0x072e0 RW 0x1000
>>>
>>> The grab kernel address fails trying grab too much:
>>> remoteproc remoteproc0: bad phdr da 0x91c2e0 mem 0x72e0
>>>
>>> But it shouldn't, as there is enough space in that memory for the
>>> filesz, which is what to be programmed into it, not the memsz.
>>>
>>> For iMX, for example, the device specific  rproc_da_to_va() would have
>>> resolved the needed kernel address, if filesz would have been passed.
>>> See imx_rproc.c - imx_rproc_da_to_va() ->  imx_rproc_da_to_sys(),
>>> which would return the needed address: there is enough in that memory
>>> block for filesz, but not for memsz.
>>
>> I had a similar problem with the iMX7 working with TCM.
>> Your fix would probably work however this only occurs due to strange
>> behaviour in the NXP linker and startup files.
>> The NXP linker file stores the data segment directly behind the code
>> segment in the code memory region
>> (causing the difference between VirtAddr and PhysAddr) and the startup
>> assembly then loads the data segment into the data memory region.
>
> I also worked with the i.MX 7 TCM linker file, and I agree, in the
> context of remoteproc etc the linker file does really
> unnecessary/strange section placements.
>
> I guess this comes from the microcontroller world, there memory is
> volatile and the firmware initialization code loads the .data section
> into memory from ROM.
>
> That said, the difference in VirtAddr and PhysAddr is caused by the `AT`
> keyword in the linker file:
> https://sourceware.org/binutils/docs/ld/Output-Section-LMA.html
>
> From what I can tell, because remoteproc uses paddr as base and memsz as
> length, remoteproc makes the assumption that the virtual and physical
> addressing is fully aligned... For a lot of linker files this is
> probably a reasonable assumption since we do not *need* startup code
> which relocates sections...
>
> However, if we make this assumption, maybe we should check if paddr and
> vaddr are really aligned, e.g. by using:
>
> WARN_ON(phdr->p_paddr != phdr->p_vaddr)
>
> Or, we could not zero out in case paddr/vaddr are not aligned, just to
> be on the safe side e.g.:
>
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -200,7 +200,7 @@ int rproc_elf_load_segments(struct rproc *rproc,
> const struct firmware *fw)
>                  * did this for us. albeit harmless, we may consider
> removing
>                  * this.
>                  */
> -               if (memsz > filesz)
> +               if (phdr->p_paddr == phdr->p_vaddr && memsz > filesz)
>                         memset(ptr + filesz, 0, memsz - filesz);
>         }
>
>
>>
>> This would make sense for a normal microcontroller with persistent
>> memory to boot from, but atleast on the imx7 the M4 requires the A7 to
>> start it
>> and the supported memory regions are all volatile anyway.
>>
>> After I changed the linker script and the startup routine it worked
>> for me. It also avoids needlessly copying data around.
>
> True, and that is what we ended up doing to.
>
> Still, maybe the kernel could behave a bit smarter.
>
> --
> Stefan
>
>>>
>>>
>>> > regards
>>> > Suman
>>>
>>> Regards,
>>>
>>> Denis
>>
>> Regards,
>>
>> Felix
