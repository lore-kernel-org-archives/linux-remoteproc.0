Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 18 May 2017 11:00:01 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/1] remoteproc: fix elf_loader da_to_va translation and
 writing beyond segment
Message-ID: <20170518180001.GO12920@tuxbook>
References: <1493813529-19184-1-git-send-email-henri.roosen@ginzinger.com>
 <20170511000511.GV15143@minitux>
 <ddb3c16e-e3a9-9dbd-83af-241b9c1587ec@ginzinger.com>
 <20170514041403.GD69278@Bjorns-MacBook-Pro-2.local>
 <07ff6a91-95f0-3671-7464-c9d2dde7e8f4@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07ff6a91-95f0-3671-7464-c9d2dde7e8f4@ginzinger.com>
To: Henri Roosen <henri.roosen@ginzinger.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 15 May 07:37 PDT 2017, Henri Roosen wrote:

> On 05/14/2017 06:14 AM, Bjorn Andersson wrote:
> > On Thu 11 May 09:12 PDT 2017, Henri Roosen wrote:
> > 
> > > On 05/11/2017 02:05 AM, Bjorn Andersson wrote:
> > > > On Wed 03 May 05:12 PDT 2017, Henri Roosen wrote:
> > > > 
> > > > > Consider a system with 2 memory regions:
> > > > > 0x1fff8000 - 0x1fffffff: iram
> > > > 
> > > > So I presume there's a hole here.
> > > > 
> > > > > 0x21000000 - 0x21007fff: dram
> > > > > 
> > > > > The .elf file for this system contains the following Program Headers:
> > > > > Program Headers:
> > > > >   Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
> > > > >   LOAD           0x000094 0x1fff8000 0x1fff8000 0x00240 0x00240 R   0x4
> > > > >   LOAD           0x0002e0 0x1fff8240 0x1fff8240 0x03d1c 0x03d1c RWE 0x10
> > > > >   LOAD           0x003ffc 0x21000000 0x1fffbf5c 0x001cc 0x048a0 RW  0x4
> > > > > 
> > > > 
> > > > Your ELF header states that there is a segment of 0x48a0 bytes starting
> > > > at 0x1fffbf5c, but your iram ends after 0x40a3 bytes. I assume your
> > > > MemSiz comes from some linker script, which would mean that your
> > > > firmware expects to be able to use all 0x48a0 bytes, which should be
> > > > invalid.
> > > 
> > > I had a closer look at the linker script. The .data section uses the
> > > "AT"-keyword to place the initialized .data right after the .text section
> > > (0x1fffbf5c/PhysAddr).
> > > 
> > > Some run-time startup-code is responsible for copying the initialized data
> > > to its runtime address (0x21000000/VirtAddr). The run-time startup-code is
> > > also responsible for zero-ing the .bss section.
> > > 
> > > The size of the initialized data is 0x1cc (FileSiz). The size of the whole
> > > 3rd segment at run-time is 0x048a0 (MemSiz), starting from 0x21000000
> > > (VirtAddr), which also includes the .bss .heap and .stack sections.
> > > 
> > 
> > [1] specifies that p_memsz is the size of the memory segment and
> > that the difference between p_filesz and p_memsz are defined to hold the
> > value 0.
> 
> I think the main problem is that there is no specification how to deal with
> ELF files which are linked with an AT-attribute in a segment. In that case
> VirtAddr and PhysAddr differ. Then it's unclear whether to use VirtAddr or
> PhysAddr for zeroing (or even whether zeroing should be done at all).
> 
> IMHO, the way I interpret the specification, zeroing (and loading in
> general) should be done using VirtAddr. However, the spec [1] is not very
> clear on this. Zeroing using PhysAddr might not cause problems on ELF files
> without AT-keyword using GNU-linkers which have PhysAddr and VirtAddr to be
> equal, but I'm not sure if all linkers generate PhysAddr and VirtAddr equal.
> 

I believe that the cases where VirtAddr != PhysAddr you're supposed to
have some sort of 1:1 mapping between them - e.g. using an MMU. I would
like to stick with this belief, but am not sure if this is the defined
behavior... Sorry about that.

> My patch is clearly not the correct fix for "AT-linked-ELF's", so please
> ignore it. The AT-keyword is actually mainly used when linking for
> micro-controllers with FLASH/ROM and I can remove it from my linker-file for
> the remoteproc-firmware generation. Remoteproc might think of detecting and
> reject loading such ELF's.
> 

We load the ELF files in three steps, first we do a sanity check of the
header, then we parse and act on the resource table and finally we
iterate over the segments loading things into ram.

The second step will currently "define" all the memory regions, so we
can't verify their sanity in the first step. So what you're seeing is
the ELF loader failing due to insufficient space.

Regards,
Bjorn
