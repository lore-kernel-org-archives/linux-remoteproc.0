Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F9CC2B9F7
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 16:40:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A615611CA
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 16:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236075AbhE1Qlo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 28 May 2021 12:41:44 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54810 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235570AbhE1Qlm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 May 2021 12:41:42 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14SGe3TH016682;
        Fri, 28 May 2021 11:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622220003;
        bh=8+ulhTM+gzJOOYMrxR6OJCETO3scGYEm/Q7ZRZMWEXE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=rh+u7S6nbxD3S+XkNjBnIHRcsT26C5ZGmIZ66fNkAszR9Y9+s/jL6mJ6huEBBztY0
         5/M91bDFg3okvNkavx62dVBZCLWXVllpcixTbJTUVQrRbZEqXKUWPdMN0UIN7keXev
         KZw75FHH/LOVO7PnIxXvZgssSINqrwWC6XU1chW4=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14SGe2iK013662
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 May 2021 11:40:02 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 28
 May 2021 11:40:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 28 May 2021 11:40:02 -0500
Received: from [10.250.35.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14SGe2S7051725;
        Fri, 28 May 2021 11:40:02 -0500
Subject: Re: [PATCH 2/6] remoteproc: Add support for detach-only during
 shutdown
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210522000309.26134-1-s-anna@ti.com>
 <20210522000309.26134-3-s-anna@ti.com> <YLBtbHevzyxT4RTK@builder.lan>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <da468002-580c-de1a-dcf4-275d57bb7ac7@ti.com>
Date:   Fri, 28 May 2021 11:40:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YLBtbHevzyxT4RTK@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,

On 5/27/21 11:11 PM, Bjorn Andersson wrote:
> On Fri 21 May 19:03 CDT 2021, Suman Anna wrote:
> 
>> The remoteproc core has support for both stopping and detaching a
>> remote processor that was attached to previously, through both the
>> remoteproc sysfs and cdev interfaces. The rproc_shutdown() though
>> unconditionally only uses the stop functionality at present. This
>> may not be the default desired functionality for all the remoteproc
>> platform drivers.
>>
>> Introduce a new rproc state flag 'detach_on_shutdown' that individual
>> remoteproc drivers can set to only allow detach in rproc_shutdown()
>> that would have been invoked when the driver is uninstalled, so that
>> remote processor continues to run undisturbed even after the driver
>> removal.
>>
> 
> I dislike the introduction of knobs for everything and would much rather
> see that we define some sound defaults. Can we make shutdown just do
> detach() if that's supported otherwise stop().
> 

I maybe missing your point, but the change in remoteproc_core below exactly does
that, right? Are you saying drop the checks in remoteproc_cdev and remoteproc_sysfs?

The asymmetry did bug me as well, but it is already existing even before this
patch. I personally would have preferred a cleaner and symmetrical attach,
start, stop, detach, but existing code has overloaded attach into start (keys
off by RPROC_OFFLINE/RPROC_DETACHED) while introducing a separate detach from
stop. I have retained the meaning of stop as shutdown from userspace interface
perspective, but enforcing the checks for detach only remoteprocs.

The logic in rproc_shutdown is for driver paths.

> This still allows userspace to explicitly stop the detachable remoteproc
> before shutdown, if for some reason that's what you want...

This is the existing behavior and the difference between stop and detach. That
behavior is maintained for remoteprocs not setting the detach_on_shutdown flag.
I am only restricting the behavior for those that set it.

Mathieu,
Your thoughts on this?

regards
Suman



> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  drivers/remoteproc/remoteproc_cdev.c  | 7 +++++++
>>  drivers/remoteproc/remoteproc_core.c  | 5 ++++-
>>  drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
>>  include/linux/remoteproc.h            | 3 +++
>>  4 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
>> index 0b8a84c04f76..473467711a09 100644
>> --- a/drivers/remoteproc/remoteproc_cdev.c
>> +++ b/drivers/remoteproc/remoteproc_cdev.c
>> @@ -42,6 +42,13 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
>>  		    rproc->state != RPROC_ATTACHED)
>>  			return -EINVAL;
>>  
>> +		if (rproc->state == RPROC_ATTACHED &&
>> +		    rproc->detach_on_shutdown) {
>> +			dev_err(&rproc->dev,
>> +				"stop not supported for this rproc, use detach\n");
>> +			return -EINVAL;
>> +		}
>> +
>>  		rproc_shutdown(rproc);
>>  	} else if (!strncmp(cmd, "detach", len)) {
>>  		if (rproc->state != RPROC_ATTACHED)
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 6019f46001c8..e8ab3eb41f00 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -2074,7 +2074,10 @@ void rproc_shutdown(struct rproc *rproc)
>>  	if (!atomic_dec_and_test(&rproc->power))
>>  		goto out;
>>  
>> -	ret = rproc_stop(rproc, false);
>> +	if (rproc->detach_on_shutdown && rproc->state == RPROC_ATTACHED)
>> +		ret = __rproc_detach(rproc);
>> +	else
>> +		ret = rproc_stop(rproc, false);
>>  	if (ret) {
>>  		atomic_inc(&rproc->power);
>>  		goto out;
>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
>> index ea8b89f97d7b..1785fbcb1075 100644
>> --- a/drivers/remoteproc/remoteproc_sysfs.c
>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
>> @@ -206,6 +206,12 @@ static ssize_t state_store(struct device *dev,
>>  		    rproc->state != RPROC_ATTACHED)
>>  			return -EINVAL;
>>  
>> +		if (rproc->state == RPROC_ATTACHED &&
>> +		    rproc->detach_on_shutdown) {
>> +			dev_err(&rproc->dev, "stop not supported for this rproc, use detach\n");
>> +			return -EINVAL;
>> +		}
>> +
>>  		rproc_shutdown(rproc);
>>  	} else if (sysfs_streq(buf, "detach")) {
>>  		if (rproc->state != RPROC_ATTACHED)
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 42a1f30e33a7..35ef921676a1 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -530,6 +530,8 @@ struct rproc_dump_segment {
>>   * @elf_machine: firmware ELF machine
>>   * @cdev: character device of the rproc
>>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
>> + * @detach_on_shutdown: flag to indicate if remoteproc cannot be shutdown in
>> + *			attached state and _only_ support detach
>>   */
>>  struct rproc {
>>  	struct list_head node;
>> @@ -569,6 +571,7 @@ struct rproc {
>>  	u16 elf_machine;
>>  	struct cdev cdev;
>>  	bool cdev_put_on_release;
>> +	bool detach_on_shutdown;
>>  };
>>  
>>  /**
>> -- 
>> 2.30.1
>>

