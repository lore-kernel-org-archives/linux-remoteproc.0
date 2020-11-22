Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D419BC63798
	for <linux-remoteproc@archiver.kernel.org>; Sun, 22 Nov 2020 17:43:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FE192137B
	for <linux-remoteproc@archiver.kernel.org>; Sun, 22 Nov 2020 17:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="W//HRR50"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgKVRm6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 22 Nov 2020 12:42:58 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41810 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbgKVRm6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 22 Nov 2020 12:42:58 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AMHgqJl071373;
        Sun, 22 Nov 2020 11:42:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606066972;
        bh=Vs7K0liplB0YMIyj5LAc8+c1AJgx/p9mg5YBTryXfy4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=W//HRR50R4MINWIoySDeSKkxvPj9Hf5Hq+YnObKREpQNhYi+HEAUmr2Nzt6bHAJtx
         M2nhc4ULs6nv66B6VJFKdSnrG/DJ6B+AR/FZgML1lW7WzdxkPQZDoSew1PLjuy5TGp
         oTQKu5jC89o7DTlOqq0JSGGWeiHecgbMJJeWXb4I=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AMHgqog048381
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 22 Nov 2020 11:42:52 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 22
 Nov 2020 11:42:52 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 22 Nov 2020 11:42:52 -0600
Received: from [10.250.68.46] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AMHgpwF090283;
        Sun, 22 Nov 2020 11:42:52 -0600
Subject: Re: [PATCH] remoteproc: Add module parameter 'auto_boot'
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, <od@zcrc.me>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20201115115056.83225-1-paul@crapouillou.net>
 <20201120223701.GF4137289@xps15>
 <65e4ed08-9709-533f-57bb-cb570165a461@ti.com>
 <OJT5KQ.QDDSGNHAM2LN1@crapouillou.net>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <a07f0c50-392c-e677-bfd8-ed924127f5a8@ti.com>
Date:   Sun, 22 Nov 2020 11:42:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <OJT5KQ.QDDSGNHAM2LN1@crapouillou.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Paul,

On 11/21/20 12:47 PM, Paul Cercueil wrote:
> Hi Suman,
> 
> Le ven. 20 nov. 2020 à 17:06, Suman Anna <s-anna@ti.com> a écrit :
>> Hi Paul,
>>
>> On 11/20/20 4:37 PM, Mathieu Poirier wrote:
>>>  Hi Paul,
>>>
>>>  On Sun, Nov 15, 2020 at 11:50:56AM +0000, Paul Cercueil wrote:
>>>>  Until now the remoteproc core would always default to trying to boot the
>>>>  remote processor at startup. The various remoteproc drivers could
>>>>  however override that setting.
>>>>
>>>>  Whether or not we want the remote processor to boot, really depends on
>>>>  the nature of the processor itself - a processor built into a WiFi chip
>>>>  will need to be booted for the WiFi hardware to be usable, for instance,
>>>>  but a general-purpose co-processor does not have any predeterminated
>>>>  function, and as such we cannot assume that the OS will want the
>>>>  processor to be booted - yet alone that we have a single do-it-all
>>>>  firmware to load.
>>>>
>>>
>>>  If I understand correctly you have various remote processors that use the
>>> same firmware
>>>  but are serving different purposes - is this correct?
>>>
>>>>  Add a 'auto_boot' module parameter that instructs the remoteproc whether
>>>>  or not it should auto-boot the remote processor, which will default to
>>>>  "true" to respect the previous behaviour.
>>>>
>>>
>>>  Given that the core can't be a module I wonder if this isn't something that
>>>  would be better off in the specific platform driver or the device tree... 
>>> Other
>>>  people might have an opinion as well.
>>
>> I agree. Even it is a module, all it is setting up is default behavior, and
>> doesn't buy you much. If you have one or more remoteproc drivers supporting
>> different instances, and each one wants different behavior, you would have to
>> customize it in the drivers anyway. ST drivers are customizing this using a DT
>> flag.
> 
> Devicetree is supposed to describe the hardware, not how you're supposed to use
> the hardware...

I agree, but it sneaked in somehow. Anyway, I am not proposing that you repeat
the same approach.

> 
>> Given that the individual platform drivers have to be modules, is there any
>> issue in customizing this in your platform driver?
> 
> No, I can patch the platform driver instead, but to me it clearly is a core issue.

So, remoteproc core is just setting up a default, and it is upto the individual
drivers to override it. I actually have two different rproc drivers on the same
SoC wanting different behavior for example.

I do like the runtime config in general compared to a build-time Kconfig option,
but let's say we do add this option, then you would also need every rproc driver
to actually set this field specifically to ensure their expected behavior
doesn't change if it is installed as false.

regards
Suman

> 
> Cheers,
> -Paul
> 
>> regards
>> Suman
>>
>>>
>>>  Thanks,
>>>  Mathieu
>>>
>>>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>>  ---
>>>>   drivers/remoteproc/remoteproc_core.c | 7 ++++++-
>>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>>  diff --git a/drivers/remoteproc/remoteproc_core.c
>>>> b/drivers/remoteproc/remoteproc_core.c
>>>>  index dab2c0f5caf0..687b1bfd49db 100644
>>>>  --- a/drivers/remoteproc/remoteproc_core.c
>>>>  +++ b/drivers/remoteproc/remoteproc_core.c
>>>>  @@ -44,6 +44,11 @@
>>>>
>>>>   #define HIGH_BITS_MASK 0xFFFFFFFF00000000ULL
>>>>
>>>>  +static bool auto_boot = true;
>>>>  +module_param(auto_boot, bool, 0400);
>>>>  +MODULE_PARM_DESC(auto_boot,
>>>>  +         "Auto-boot the remote processor [default=true]");
>>>>  +
>>>>   static DEFINE_MUTEX(rproc_list_mutex);
>>>>   static LIST_HEAD(rproc_list);
>>>>   static struct notifier_block rproc_panic_nb;
>>>>  @@ -2176,7 +2181,7 @@ struct rproc *rproc_alloc(struct device *dev, const
>>>> char *name,
>>>>           return NULL;
>>>>
>>>>       rproc->priv = &rproc[1];
>>>>  -    rproc->auto_boot = true;
>>>>  +    rproc->auto_boot = auto_boot;
>>>>       rproc->elf_class = ELFCLASSNONE;
>>>>       rproc->elf_machine = EM_NONE;
>>>>
>>>>  --
>>>>  2.29.2
>>>>
>>
> 
> 

