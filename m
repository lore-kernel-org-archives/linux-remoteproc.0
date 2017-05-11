Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 10 May 2017 17:05:11 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/1] remoteproc: fix elf_loader da_to_va translation and
 writing beyond segment
Message-ID: <20170511000511.GV15143@minitux>
References: <1493813529-19184-1-git-send-email-henri.roosen@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493813529-19184-1-git-send-email-henri.roosen@ginzinger.com>
To: Henri Roosen <henri.roosen@ginzinger.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 03 May 05:12 PDT 2017, Henri Roosen wrote:

> Consider a system with 2 memory regions:
> 0x1fff8000 - 0x1fffffff: iram

So I presume there's a hole here.

> 0x21000000 - 0x21007fff: dram
> 
> The .elf file for this system contains the following Program Headers:
> Program Headers:
>   Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
>   LOAD           0x000094 0x1fff8000 0x1fff8000 0x00240 0x00240 R   0x4
>   LOAD           0x0002e0 0x1fff8240 0x1fff8240 0x03d1c 0x03d1c RWE 0x10
>   LOAD           0x003ffc 0x21000000 0x1fffbf5c 0x001cc 0x048a0 RW  0x4
> 

Your ELF header states that there is a segment of 0x48a0 bytes starting
at 0x1fffbf5c, but your iram ends after 0x40a3 bytes. I assume your
MemSiz comes from some linker script, which would mean that your
firmware expects to be able to use all 0x48a0 bytes, which should be
invalid.

>  Section to Segment mapping:
>   Segment Sections...
>    00     .interrupts
>    01     .text .ARM .init_array .fini_array
>    02     .data .bss .heap .stack
> 
> The problem is with the 3rd segment: it has 0x1cc bytes of ROM .data
> which need to be placed at PhysAddr 0x1fffbf5c. Using MemSiz as len
> parameter for rproc_da_to_va is incorrect (goes beyond 0x1fffffff). The
> correct len parameter to be used here is FileSiz.
> 

The fact that MemSiz is larger than FileSiz makes sense because you have
.bss, .heap and .stack there - which we conveniently clear for you.

> The actual memcpy of the segment was already correctly using the FileSiz
> for length, however the unnecessary "Zero out remaining memory" would
> write beyond the 0x1fffffff end of the memory region! This patch removes
> the harmful code.
> 

Perhaps I'm missing something, but I think the problem is that your
memory map is broken. We do want to clear out the remaining part of each
segment.



Note though that we don't yet have means to direct your carveout
allocations to the two segments and get the firmware loaded at the
physical addresses specified.

Regards,
Bjorn
