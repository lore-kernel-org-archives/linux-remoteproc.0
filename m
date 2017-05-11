Return-Path: <Henri.Roosen@ginzinger.com>
Subject: Re: [PATCH 1/1] remoteproc: fix elf_loader da_to_va translation and
 writing beyond segment
References: <1493813529-19184-1-git-send-email-henri.roosen@ginzinger.com>
 <20170511000511.GV15143@minitux>
From: Henri Roosen <henri.roosen@ginzinger.com>
Message-ID: <ddb3c16e-e3a9-9dbd-83af-241b9c1587ec@ginzinger.com>
Date: Thu, 11 May 2017 18:12:50 +0200
MIME-Version: 1.0
In-Reply-To: <20170511000511.GV15143@minitux>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 05/11/2017 02:05 AM, Bjorn Andersson wrote:
> On Wed 03 May 05:12 PDT 2017, Henri Roosen wrote:
>
>> Consider a system with 2 memory regions:
>> 0x1fff8000 - 0x1fffffff: iram
>
> So I presume there's a hole here.
>
>> 0x21000000 - 0x21007fff: dram
>>
>> The .elf file for this system contains the following Program Headers:
>> Program Headers:
>>   Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
>>   LOAD           0x000094 0x1fff8000 0x1fff8000 0x00240 0x00240 R   0x4
>>   LOAD           0x0002e0 0x1fff8240 0x1fff8240 0x03d1c 0x03d1c RWE 0x10
>>   LOAD           0x003ffc 0x21000000 0x1fffbf5c 0x001cc 0x048a0 RW  0x4
>>
>
> Your ELF header states that there is a segment of 0x48a0 bytes starting
> at 0x1fffbf5c, but your iram ends after 0x40a3 bytes. I assume your
> MemSiz comes from some linker script, which would mean that your
> firmware expects to be able to use all 0x48a0 bytes, which should be
> invalid.

I had a closer look at the linker script. The .data section uses the 
"AT"-keyword to place the initialized .data right after the .text 
section (0x1fffbf5c/PhysAddr).

Some run-time startup-code is responsible for copying the initialized 
data to its runtime address (0x21000000/VirtAddr). The run-time 
startup-code is also responsible for zero-ing the .bss section.

The size of the initialized data is 0x1cc (FileSiz). The size of the 
whole 3rd segment at run-time is 0x048a0 (MemSiz), starting from 
0x21000000 (VirtAddr), which also includes the .bss .heap and .stack 
sections.

>
>>  Section to Segment mapping:
>>   Segment Sections...
>>    00     .interrupts
>>    01     .text .ARM .init_array .fini_array
>>    02     .data .bss .heap .stack
>>
>> The problem is with the 3rd segment: it has 0x1cc bytes of ROM .data
>> which need to be placed at PhysAddr 0x1fffbf5c. Using MemSiz as len
>> parameter for rproc_da_to_va is incorrect (goes beyond 0x1fffffff). The
>> correct len parameter to be used here is FileSiz.
>>
>
> The fact that MemSiz is larger than FileSiz makes sense because you have
> .bss, .heap and .stack there - which we conveniently clear for you.

I agree the value of MemSiz being larger than FileSiz is correct; this 
is the case when there are uninitialized data sections like .bss. In my 
opinion this reflects the run-time size of the segment, starting from 
address 0x21000000. However the remoteproc-elf-loader is clearing with 
the load-time-address (0x1fffbf5c) as base.

Note that the linker-scripts which are not using the "AT"-keyword have 
the VirtAddr and PhysAddr to be the same, so would not cause trouble; 
the remoteproc-elf-loader seems to have a problem when VirtAddr and 
PhysAddr have different values.

>
>> The actual memcpy of the segment was already correctly using the FileSiz
>> for length, however the unnecessary "Zero out remaining memory" would
>> write beyond the 0x1fffffff end of the memory region! This patch removes
>> the harmful code.
>>
>
> Perhaps I'm missing something, but I think the problem is that your
> memory map is broken. We do want to clear out the remaining part of each
> segment.

I'm not sure it's the memory map which is broken. The "AT"-keyword 
should be valid to use I guess. However, remoteproc might decide not to 
support such elf-files. A detection for equality of VirtAddr and 
PhysAddr could then be used for that.

Please find below some dummy test code (which leaves out the 
initialization code for copying .data and clearing .bss) and a linker 
script to reproduce:

test.ld
------------
SECTIONS {
   . = 0x1fff0000;
   .text : { *(.text); }
   __flash_sdata = .;

   . = 0x21000000;
   .data : AT (__flash_sdata) { *(.data); }
   .bss : { *(.bss) *(COMMON); }
}

test.s
------------
         .bss
uninit_data: .space 0x8000-8

         .data
data1:  .4byte 1
data2:  .4byte 2

         .text
_start: b _start

reproduce
------------
arm-none-eabi-as -o test.o test.s
arm-none-eabi-ld -T test.ld -o test.elf test.o
arm-none-eabi-objdump -x test.elf

>
>
>
> Note though that we don't yet have means to direct your carveout
> allocations to the two segments and get the firmware loaded at the
> physical addresses specified.

I'm currently using the .da_to_va callback and translate with offsets 
read by custom devicetree bindings.

Regards,
Henri

>
> Regards,
> Bjorn
>
