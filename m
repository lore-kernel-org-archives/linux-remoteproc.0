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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46471C47087
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 16:17:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23E3D613F0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 16:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234815AbhE1QTY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 28 May 2021 12:19:24 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51434 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234443AbhE1QTY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 May 2021 12:19:24 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14SGHhSC086409;
        Fri, 28 May 2021 11:17:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622218663;
        bh=D58FdqqYgrlOaSZQ555UBixMEXaRM61PLwIyCkqZMx4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PTm974/aIC3BkvWxw4p4/fM1W6sPiY79wrR9NlTtH5J2eb8ITd2KVull9eAKOMZN/
         i0XWvNK/6P8K1wU0uHA6FGsenagShHN5KFf7TElcMGdnaXxF2T0vARRF+AyZ0okUNF
         iK2PThvJOvVsThOD84k+bYbW30k4bV2OpQ+7L5Fg=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14SGHhq6084066
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 May 2021 11:17:43 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 28
 May 2021 11:17:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 28 May 2021 11:17:43 -0500
Received: from [10.250.35.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14SGHgP2026203;
        Fri, 28 May 2021 11:17:42 -0500
Subject: Re: [PATCH 1/6] remoteproc: Introduce rproc_detach_device() wrapper
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210522000309.26134-1-s-anna@ti.com>
 <20210522000309.26134-2-s-anna@ti.com> <YLBu9Wr1vNiwsfWT@builder.lan>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <7b5556d8-e92c-f633-e58a-cdd71c25df29@ti.com>
Date:   Fri, 28 May 2021 11:17:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YLBu9Wr1vNiwsfWT@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 5/27/21 11:17 PM, Bjorn Andersson wrote:
> On Fri 21 May 19:03 CDT 2021, Suman Anna wrote:
> 
>> The .attach() rproc ops is invoked through the helper
>> rproc_attach_device(), but the .detach() ops is invoked
>> directly at present. Introduce a similar wrapper function
>> rproc_detach_device() for .detach() ops so that the code
>> is symmetric.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c     | 2 +-
>>  drivers/remoteproc/remoteproc_internal.h | 8 ++++++++
>>  2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 6348aaa42bbb..6019f46001c8 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1869,7 +1869,7 @@ static int __rproc_detach(struct rproc *rproc)
>>  	}
>>  
>>  	/* Tell the remote processor the core isn't available anymore */
>> -	ret = rproc->ops->detach(rproc);
>> +	ret = rproc_detach_device(rproc);
>>  	if (ret) {
>>  		dev_err(dev, "can't detach from rproc: %d\n", ret);
>>  		return ret;
>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>> index a328e634b1de..931d50b6a0d1 100644
>> --- a/drivers/remoteproc/remoteproc_internal.h
>> +++ b/drivers/remoteproc/remoteproc_internal.h
>> @@ -121,6 +121,14 @@ static inline int rproc_attach_device(struct rproc *rproc)
>>  	return 0;
>>  }
>>  
>> +static inline int rproc_detach_device(struct rproc *rproc)
>> +{
>> +	if (rproc->ops->detach)
>> +		return rproc->ops->detach(rproc);
>> +
>> +	return 0;
> 
> I was going to complain that this will silently succeed to detach a
> remoteproc when the driver doesn't implement detach, but then I realized
> that in the current code path we just failed if it wasn't set.
> 
> So this only becomes a problem if we're out of sync between the wish to
> detach and the implementation of detach, in the later patch.
> 
> But based on this, why do we allow rproc_attach_device() to succeed even
> though a driver doesn't implement attach? Could we achieve the symmetry
> by going the other way?

We don't, it does throw an error. See rproc_validate(). The error-checking is
somewhat asymmetric. Any remoteproc requiring attach behavior is supposed to be
setting the rproc state as RPROC_DETACHED. The remoteproc core state-machine is
dictated by that value between start and attach. rproc_validate() does check the
required ops between RPROC_OFFLINE and RPROC_DETACHED states.

Do you mean use return -EINVAL by default in both the wrappers? Atm, you will
never exercise this particular code paths in either of these wrapper functions,
because there are checks enforced even before these wrappers are invoked.

regards
Suman

> 
> Regards,
> Bjorn
> 
>> +}
>> +
>>  static inline
>>  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
>>  {
>> -- 
>> 2.30.1
>>

