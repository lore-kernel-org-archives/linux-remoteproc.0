Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365A8C56202
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 23:07:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C52342240C
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 23:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eUghBQ4r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbgKTXHH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 18:07:07 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37068 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729167AbgKTXHH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 18:07:07 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AKN70DW013143;
        Fri, 20 Nov 2020 17:07:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1605913620;
        bh=EQon3TV6Gauwq+W2DSo6yNA9fDhy0x/NxFUV6A1hoSI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eUghBQ4rjrxeqUAHgp1CXhjbjlEMHAmeN4AI9efvMo8T1fvejqu2fu/r+a0PidKwe
         oIeZ9HAZ4u3c8vLMSVTxN5qYvSmbC/9r2QSKJlNRp0/wsFVP5y3A+seR6u3klH77OX
         fpBsEETfJMO0M84UVbcfL8x3Wap347H7KTEGC5KI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AKN6xdw057498
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Nov 2020 17:07:00 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 20
 Nov 2020 17:06:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 17:06:59 -0600
Received: from [10.250.68.46] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AKN6xEO101180;
        Fri, 20 Nov 2020 17:06:59 -0600
Subject: Re: [PATCH] remoteproc: Add module parameter 'auto_boot'
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, <od@zcrc.me>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20201115115056.83225-1-paul@crapouillou.net>
 <20201120223701.GF4137289@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <65e4ed08-9709-533f-57bb-cb570165a461@ti.com>
Date:   Fri, 20 Nov 2020 17:06:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120223701.GF4137289@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Paul,

On 11/20/20 4:37 PM, Mathieu Poirier wrote:
> Hi Paul,
> 
> On Sun, Nov 15, 2020 at 11:50:56AM +0000, Paul Cercueil wrote:
>> Until now the remoteproc core would always default to trying to boot the
>> remote processor at startup. The various remoteproc drivers could
>> however override that setting.
>>
>> Whether or not we want the remote processor to boot, really depends on
>> the nature of the processor itself - a processor built into a WiFi chip
>> will need to be booted for the WiFi hardware to be usable, for instance,
>> but a general-purpose co-processor does not have any predeterminated
>> function, and as such we cannot assume that the OS will want the
>> processor to be booted - yet alone that we have a single do-it-all
>> firmware to load.
>>
> 
> If I understand correctly you have various remote processors that use the same firmware
> but are serving different purposes - is this correct?
>  
>> Add a 'auto_boot' module parameter that instructs the remoteproc whether
>> or not it should auto-boot the remote processor, which will default to
>> "true" to respect the previous behaviour.
>>
> 
> Given that the core can't be a module I wonder if this isn't something that
> would be better off in the specific platform driver or the device tree...  Other
> people might have an opinion as well.

I agree. Even it is a module, all it is setting up is default behavior, and
doesn't buy you much. If you have one or more remoteproc drivers supporting
different instances, and each one wants different behavior, you would have to
customize it in the drivers anyway. ST drivers are customizing this using a DT flag.

Given that the individual platform drivers have to be modules, is there any
issue in customizing this in your platform driver?

regards
Suman

> 
> Thanks,
> Mathieu
> 
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index dab2c0f5caf0..687b1bfd49db 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -44,6 +44,11 @@
>>  
>>  #define HIGH_BITS_MASK 0xFFFFFFFF00000000ULL
>>  
>> +static bool auto_boot = true;
>> +module_param(auto_boot, bool, 0400);
>> +MODULE_PARM_DESC(auto_boot,
>> +		 "Auto-boot the remote processor [default=true]");
>> +
>>  static DEFINE_MUTEX(rproc_list_mutex);
>>  static LIST_HEAD(rproc_list);
>>  static struct notifier_block rproc_panic_nb;
>> @@ -2176,7 +2181,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>>  		return NULL;
>>  
>>  	rproc->priv = &rproc[1];
>> -	rproc->auto_boot = true;
>> +	rproc->auto_boot = auto_boot;
>>  	rproc->elf_class = ELFCLASSNONE;
>>  	rproc->elf_machine = EM_NONE;
>>  
>> -- 
>> 2.29.2
>>

