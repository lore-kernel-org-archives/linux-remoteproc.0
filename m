Return-Path: <afd@ti.com>
Subject: Re: [PATCH 3/4] rpmsg: add helper macro module_rpmsg_driver
References: <1462386855-17381-1-git-send-email-afd@ti.com>
 <1462386855-17381-3-git-send-email-afd@ti.com> <572A455F.7040306@ti.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <572A4664.4010101@ti.com>
Date: Wed, 4 May 2016 13:58:44 -0500
MIME-Version: 1.0
In-Reply-To: <572A455F.7040306@ti.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Suman Anna <s-anna@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 05/04/2016 01:54 PM, Suman Anna wrote:
> Hi Andrew,
> 
> On 05/04/2016 01:34 PM, Andrew F. Davis wrote:
>> This patch introduces the module_rpmsg_driver macro which is a
>> convenience macro for rpmsg driver modules similar to
>> module_platform_driver. It is intended to be used by drivers which
>> init/exit section does nothing but register/unregister the rpmsg driver.
>> By using this macro it is possible to eliminate a few lines of
>> boilerplate code per rpmsg driver.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>  include/linux/rpmsg.h | 16 +++++++++++++---
>>  1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
>> index 78e45ce..ada50ff 100644
>> --- a/include/linux/rpmsg.h
>> +++ b/include/linux/rpmsg.h
>> @@ -177,13 +177,23 @@ struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_channel *,
>>  int
>>  rpmsg_send_offchannel_raw(struct rpmsg_channel *, u32, u32, void *, int, bool);
>>  
>> -/*
>> - * use a macro to avoid include chaining to get THIS_MODULE
>> - */
>> +/* use a macro to avoid include chaining to get THIS_MODULE */
> 
> This change does not belong to this patch, the modified lines were
> introduced in patch 1, so please correct it in that patch.
> 

Ahh, that's what I get for last minute rebasing before submission, will fix.

Thanks,
Andrew

> regards
> Suman
> 
>>  #define register_rpmsg_driver(drv) \
>>  	__register_rpmsg_driver(drv, THIS_MODULE)
>>  
>>  /**
>> + * module_rpmsg_driver() - Helper macro for registering an rpmsg driver
>> + * @__rpmsg_driver: rpmsg_driver struct
>> + *
>> + * Helper macro for rpmsg drivers which do not do anything special in module
>> + * init/exit. This eliminates a lot of boilerplate.  Each module may only
>> + * use this macro once, and calling it replaces module_init() and module_exit()
>> + */
>> +#define module_rpmsg_driver(__rpmsg_driver) \
>> +	module_driver(__rpmsg_driver, register_rpmsg_driver, \
>> +			unregister_rpmsg_driver)
>> +
>> +/**
>>   * rpmsg_send() - send a message across to the remote processor
>>   * @rpdev: the rpmsg channel
>>   * @data: payload of message
>>
> 
