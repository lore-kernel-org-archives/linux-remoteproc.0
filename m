Return-Path: <bjorn.andersson@linaro.org>
Date: Sat, 13 May 2017 21:14:03 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/1] remoteproc: fix elf_loader da_to_va translation and
 writing beyond segment
Message-ID: <20170514041403.GD69278@Bjorns-MacBook-Pro-2.local>
References: <1493813529-19184-1-git-send-email-henri.roosen@ginzinger.com>
 <20170511000511.GV15143@minitux>
 <ddb3c16e-e3a9-9dbd-83af-241b9c1587ec@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddb3c16e-e3a9-9dbd-83af-241b9c1587ec@ginzinger.com>
To: Henri Roosen <henri.roosen@ginzinger.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 11 May 09:12 PDT 2017, Henri Roosen wrote:

> On 05/11/2017 02:05 AM, Bjorn Andersson wrote:
> > On Wed 03 May 05:12 PDT 2017, Henri Roosen wrote:
> > 
> > > Consider a system with 2 memory regions:
> > > 0x1fff8000 - 0x1fffffff: iram
> > 
> > So I presume there's a hole here.
> > 
> > > 0x21000000 - 0x21007fff: dram
> > > 
> > > The .elf file for this system contains the following Program Headers:
> > > Program Headers:
> > >   Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
> > >   LOAD           0x000094 0x1fff8000 0x1fff8000 0x00240 0x00240 R   0x4
> > >   LOAD           0x0002e0 0x1fff8240 0x1fff8240 0x03d1c 0x03d1c RWE 0x10
> > >   LOAD           0x003ffc 0x21000000 0x1fffbf5c 0x001cc 0x048a0 RW  0x4
> > > 
> > 
> > Your ELF header states that there is a segment of 0x48a0 bytes starting
> > at 0x1fffbf5c, but your iram ends after 0x40a3 bytes. I assume your
> > MemSiz comes from some linker script, which would mean that your
> > firmware expects to be able to use all 0x48a0 bytes, which should be
> > invalid.
> 
> I had a closer look at the linker script. The .data section uses the
> "AT"-keyword to place the initialized .data right after the .text section
> (0x1fffbf5c/PhysAddr).
> 
> Some run-time startup-code is responsible for copying the initialized data
> to its runtime address (0x21000000/VirtAddr). The run-time startup-code is
> also responsible for zero-ing the .bss section.
> 
> The size of the initialized data is 0x1cc (FileSiz). The size of the whole
> 3rd segment at run-time is 0x048a0 (MemSiz), starting from 0x21000000
> (VirtAddr), which also includes the .bss .heap and .stack sections.
> 

[1] specifies that p_memsz is the size of the memory segment and
that the difference between p_filesz and p_memsz are defined to hold the
value 0.

So I believe that your segment list states that the physical range
0x1fffbf5c through 0x200007fc is valid and should be populated.

[1] https://refspecs.linuxfoundation.org/elf/elf.pdf

Regards,
Bjorn
