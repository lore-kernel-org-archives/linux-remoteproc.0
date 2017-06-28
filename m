Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH 4/4] remoteproc/keystone: Fix circular dependencies for
 ARM configs
References: <20170627224610.15321-1-s-anna@ti.com>
 <20170627224610.15321-5-s-anna@ti.com> <20170627234047.GN18666@tuxbook>
From: Suman Anna <s-anna@ti.com>
Message-ID: <44a4b1bd-5faa-3b0e-1144-9bec0e3ad5cb@ti.com>
Date: Wed, 28 Jun 2017 11:20:55 -0500
MIME-Version: 1.0
In-Reply-To: <20170627234047.GN18666@tuxbook>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 06/27/2017 06:40 PM, Bjorn Andersson wrote:
> On Tue 27 Jun 15:46 PDT 2017, Suman Anna wrote:
> 
>> Drop the dependency on RESET_CONTROLLER for the Keystone remoteproc
>> driver to resolve some circular dependencies around different choices
>> for RESET_CONTROLLER on common ARM configs. This dependency is
>> inherent as the RESET_CONTROLLER will be enabled due to the enabled
>> ARCH_HAS_RESET_CONTROLLER for ARCH_KEYSTONE.
>>
> 
> As my approach requires synchronized changes to rproc-next and
> rpmsg-next and we're close to the merge window I'll pick this
> "workaround" for now, thanks!
> 
> I do think it's appropriate for the Keystone remoteproc driver to
> express its dependency on reset-controller, so I intend to revert this
> as I look into this issue after -rc1 again.
> 
> Merged all 4 patches.

Great, thanks.

regards
Suman

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  drivers/remoteproc/Kconfig | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index 945c1574f896..8891a8e50f12 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -70,7 +70,6 @@ config DA8XX_REMOTEPROC
>>  config KEYSTONE_REMOTEPROC
>>  	tristate "Keystone Remoteproc support"
>>  	depends on ARCH_KEYSTONE
>> -	depends on RESET_CONTROLLER
>>  	select RPMSG_VIRTIO
>>  	help
>>  	  Say Y here here to support Keystone remote processors (DSP)
>> -- 
>> 2.13.1
>>
