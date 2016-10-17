Return-Path: <Matt.Redfearn@imgtec.com>
Subject: Re: [PATCH v3 4/4] MIPS: Deprecate VPE Loader
References: <1476193356-1350-1-git-send-email-matt.redfearn@imgtec.com>
 <1476193356-1350-5-git-send-email-matt.redfearn@imgtec.com>
 <c4d01a54-7a68-c9ee-bc5c-ac01743f7269@hauke-m.de>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <18cd1cf2-761e-82f1-5225-26328f1aba7e@imgtec.com>
Date: Mon, 17 Oct 2016 12:01:25 +0100
MIME-Version: 1.0
In-Reply-To: <c4d01a54-7a68-c9ee-bc5c-ac01743f7269@hauke-m.de>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Hauke Mehrtens <hauke@hauke-m.de>, Ralf Baechle <ralf@linux-mips.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@linux-mips.org, linux-remoteproc@vger.kernel.org, lisa.parratt@imgtec.com, linux-kernel@vger.kernel.org, olaf.wachendorf@intel.com, hauke.mehrtens@intel.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Hauke,


On 12/10/16 12:09, Hauke Mehrtens wrote:
> This interface is currently used by the Intel / Lantiq voice Firmware.
> This firmware is used by all Intel / Lantiq MIPS SoCs when they should
> support analog voice.
>
> What is the proposed timeline for the removal of this interface?

Ultimately I guess that's Ralf's call, but when I've discussed this with 
him previously, he wasn't aware of any users of this feature. But if 
there are indeed active users then that will slow down it's removal to 
give them sufficient time to migrate or otherwise stop using it.

Thanks,
Matt

>
> Hauke
>
> On 10/11/2016 03:42 PM, Matt Redfearn wrote:
>> The MIPS remote processor driver (CONFIG_MIPS_RPROC) provides a more
>> standard mechanism for using one or more VPs as coprocessors running
>> separate firmware.
>>
>> Here we deprecate this mechanism before it is removed.
>>
>> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
>> ---
>>
>> Changes in v3: None
>> Changes in v2: None
>>
>>   arch/mips/Kconfig | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index fd2468e71e63..3e767c373c7b 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -2264,7 +2264,7 @@ comment "MIPS R2-to-R6 emulator is only available for UP kernels"
>>   	depends on SMP && CPU_MIPSR6
>>   
>>   config MIPS_VPE_LOADER
>> -	bool "VPE loader support."
>> +	bool "VPE loader support (DEPRECATED)"
>>   	depends on SYS_SUPPORTS_MULTITHREADING && MODULES
>>   	select CPU_MIPSR2_IRQ_VI
>>   	select CPU_MIPSR2_IRQ_EI
>> @@ -2273,6 +2273,9 @@ config MIPS_VPE_LOADER
>>   	  Includes a loader for loading an elf relocatable object
>>   	  onto another VPE and running it.
>>   
>> +	  Unless you have a specific need, you should use CONFIG_MIPS_RPROC
>> +          instead of this.
>> +
>>   config MIPS_VPE_LOADER_CMP
>>   	bool
>>   	default "y"
>>
