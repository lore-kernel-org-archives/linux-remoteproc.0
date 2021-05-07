Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA605C433B4
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 May 2021 05:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0BEC613EA
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 May 2021 05:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234443AbhEGF7l (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 May 2021 01:59:41 -0400
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:50901 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233394AbhEGF7l (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 May 2021 01:59:41 -0400
Received: from [192.168.1.18] ([86.243.172.93])
        by mwinf5d87 with ME
        id 1hyf2500C21Fzsu03hyfC9; Fri, 07 May 2021 07:58:40 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 07 May 2021 07:58:40 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH] remoteproc: k3-r5: Fix an error message
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <d6e29d903b48957bf59c67229d54b0fc215e31ae.1620333870.git.christophe.jaillet@wanadoo.fr>
 <20210507052647.GF1955@kadam>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <5cdff9cf-945a-fe47-b117-3c9d9f11e987@wanadoo.fr>
Date:   Fri, 7 May 2021 07:58:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210507052647.GF1955@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Le 07/05/2021 à 07:26, Dan Carpenter a écrit :
> On Thu, May 06, 2021 at 10:46:01PM +0200, Christophe JAILLET wrote:
>> 'ret' is known to be 0 here.
>> Reorder the code so that the expected error code is printed.
>>
>> Fixes: 6dedbd1d5443 ("remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/remoteproc/ti_k3_r5_remoteproc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index 5cf8d030a1f0..4104e4846dbf 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -1272,9 +1272,9 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
>>   
>>   	core->tsp = k3_r5_core_of_get_tsp(dev, core->ti_sci);
>>   	if (IS_ERR(core->tsp)) {
>> +		ret = PTR_ERR(core->tsp);
>>   		dev_err(dev, "failed to construct ti-sci proc control, ret = %d\n",
>>   			ret);
> 
> I recently learned about the %pe format specifier, which prints "-ENOMEM"
> instead of -12.

Hi Dan,

I see that we are reading the same ML  :)


Well, I'm a bit puzzled by it.
On one hand, it is more user-friendly. On the other hand it is not 
widely used up to now.

So is it better to keep the legacy way of reporting error code?

Do you know if there is preferred way?

Using it after a IS_ERR is straightforward, but should we also do things 
like (kmalloc usually don't need error message, just given as an example):
     x = kmalloc(...);
     if (!x)
         dev_err(dev, "Memory allocation failure (%pe)\n",
                 ERR_PTR(-ENOMEM));

When changing a message and make use of %pe, should all the messages in 
the neighborhood be changed as well to keep some kind of consistancy?

CJ

> 
> 		dev_err(dev, "failed to construct ti-sci proc control, ret = %pe\n",
> 			core->tsp);
> regards,
> dan carpenter
> 
> 
> 

