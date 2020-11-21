Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911B6C388F9
	for <linux-remoteproc@archiver.kernel.org>; Sat, 21 Nov 2020 18:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BC3D20BED
	for <linux-remoteproc@archiver.kernel.org>; Sat, 21 Nov 2020 18:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgKUSsF convert rfc822-to-8bit (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 21 Nov 2020 13:48:05 -0500
Received: from aposti.net ([89.234.176.197]:50982 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbgKUSsE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 21 Nov 2020 13:48:04 -0500
Date:   Sat, 21 Nov 2020 18:47:48 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] remoteproc: Add module parameter 'auto_boot'
To:     Suman Anna <s-anna@ti.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, od@zcrc.me,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <OJT5KQ.QDDSGNHAM2LN1@crapouillou.net>
In-Reply-To: <65e4ed08-9709-533f-57bb-cb570165a461@ti.com>
References: <20201115115056.83225-1-paul@crapouillou.net>
        <20201120223701.GF4137289@xps15>
        <65e4ed08-9709-533f-57bb-cb570165a461@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Suman,

Le ven. 20 nov. 2020 à 17:06, Suman Anna <s-anna@ti.com> a écrit :
> Hi Paul,
> 
> On 11/20/20 4:37 PM, Mathieu Poirier wrote:
>>  Hi Paul,
>> 
>>  On Sun, Nov 15, 2020 at 11:50:56AM +0000, Paul Cercueil wrote:
>>>  Until now the remoteproc core would always default to trying to 
>>> boot the
>>>  remote processor at startup. The various remoteproc drivers could
>>>  however override that setting.
>>> 
>>>  Whether or not we want the remote processor to boot, really 
>>> depends on
>>>  the nature of the processor itself - a processor built into a WiFi 
>>> chip
>>>  will need to be booted for the WiFi hardware to be usable, for 
>>> instance,
>>>  but a general-purpose co-processor does not have any 
>>> predeterminated
>>>  function, and as such we cannot assume that the OS will want the
>>>  processor to be booted - yet alone that we have a single do-it-all
>>>  firmware to load.
>>> 
>> 
>>  If I understand correctly you have various remote processors that 
>> use the same firmware
>>  but are serving different purposes - is this correct?
>> 
>>>  Add a 'auto_boot' module parameter that instructs the remoteproc 
>>> whether
>>>  or not it should auto-boot the remote processor, which will 
>>> default to
>>>  "true" to respect the previous behaviour.
>>> 
>> 
>>  Given that the core can't be a module I wonder if this isn't 
>> something that
>>  would be better off in the specific platform driver or the device 
>> tree...  Other
>>  people might have an opinion as well.
> 
> I agree. Even it is a module, all it is setting up is default 
> behavior, and
> doesn't buy you much. If you have one or more remoteproc drivers 
> supporting
> different instances, and each one wants different behavior, you would 
> have to
> customize it in the drivers anyway. ST drivers are customizing this 
> using a DT flag.

Devicetree is supposed to describe the hardware, not how you're 
supposed to use the hardware...

> Given that the individual platform drivers have to be modules, is 
> there any
> issue in customizing this in your platform driver?

No, I can patch the platform driver instead, but to me it clearly is a 
core issue.

Cheers,
-Paul

> regards
> Suman
> 
>> 
>>  Thanks,
>>  Mathieu
>> 
>>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>  ---
>>>   drivers/remoteproc/remoteproc_core.c | 7 ++++++-
>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>> 
>>>  diff --git a/drivers/remoteproc/remoteproc_core.c 
>>> b/drivers/remoteproc/remoteproc_core.c
>>>  index dab2c0f5caf0..687b1bfd49db 100644
>>>  --- a/drivers/remoteproc/remoteproc_core.c
>>>  +++ b/drivers/remoteproc/remoteproc_core.c
>>>  @@ -44,6 +44,11 @@
>>> 
>>>   #define HIGH_BITS_MASK 0xFFFFFFFF00000000ULL
>>> 
>>>  +static bool auto_boot = true;
>>>  +module_param(auto_boot, bool, 0400);
>>>  +MODULE_PARM_DESC(auto_boot,
>>>  +		 "Auto-boot the remote processor [default=true]");
>>>  +
>>>   static DEFINE_MUTEX(rproc_list_mutex);
>>>   static LIST_HEAD(rproc_list);
>>>   static struct notifier_block rproc_panic_nb;
>>>  @@ -2176,7 +2181,7 @@ struct rproc *rproc_alloc(struct device 
>>> *dev, const char *name,
>>>   		return NULL;
>>> 
>>>   	rproc->priv = &rproc[1];
>>>  -	rproc->auto_boot = true;
>>>  +	rproc->auto_boot = auto_boot;
>>>   	rproc->elf_class = ELFCLASSNONE;
>>>   	rproc->elf_machine = EM_NONE;
>>> 
>>>  --
>>>  2.29.2
>>> 
> 


