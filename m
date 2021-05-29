Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7A5C47087
	for <linux-remoteproc@archiver.kernel.org>; Sat, 29 May 2021 00:12:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4007961059
	for <linux-remoteproc@archiver.kernel.org>; Sat, 29 May 2021 00:12:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhE2ANr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 28 May 2021 20:13:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55463 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229541AbhE2ANq (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 May 2021 20:13:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622247131; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=uA1faYC+OFMBrwWX6UJIZ7G7z3bJUu+EjVNftvOSgcA=; b=VVMYEM5uZL9xdgfM8bfKN2hH/4B1OA1L5AHfQL0+oOhw4sDFFCB0WjWmNOcxQblX3TSdVDLi
 X+MS1zyo5SEP/bAUqIN+FO1FfCSZyMBiF/Xnm1c9ZRspGcwzBr1CGOkBOG6NZjmdGoME9mJN
 oXAiBcXyFPsD+jDdo3KxpnJ8hIM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60b186daea2aacd7297cc953 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 29 May 2021 00:12:10
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DD13DC4338A; Sat, 29 May 2021 00:12:09 +0000 (UTC)
Received: from [192.168.1.10] (cpe-75-83-25-192.socal.res.rr.com [75.83.25.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 051A1C433D3;
        Sat, 29 May 2021 00:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 051A1C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
Subject: Re: [PATCH 1/1] remoteproc: use freezable workqueue for crash
 notifications
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alex Elder <elder@linaro.org>
Cc:     ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210519234418.1196387-1-elder@linaro.org>
 <20210519234418.1196387-2-elder@linaro.org> <YLBpmdZoGDXNz64y@builder.lan>
From:   Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <be4ea351-7144-8b53-6fd7-6a2204e0040d@codeaurora.org>
Date:   Fri, 28 May 2021 17:12:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLBpmdZoGDXNz64y@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 5/27/2021 8:55 PM, Bjorn Andersson wrote:
> On Wed 19 May 18:44 CDT 2021, Alex Elder wrote:
>
>> When a remoteproc has crashed, rproc_report_crash() is called to
>> handle whatever recovery is desired.  This can happen at almost any
>> time, often triggered by an interrupt, though it can also be
>> initiated by a write to debugfs file remoteproc/remoteproc*/crash.
>>
>> When a crash is reported, the crash handler worker is scheduled to
>> run (rproc_crash_handler_work()).  One thing that worker does is
>> call rproc_trigger_recovery(), which calls rproc_stop().  That calls
>> the ->stop method for any remoteproc subdevices before making the
>> remote processor go offline.
>>
>> The Q6V5 modem remoteproc driver implements an SSR subdevice that
>> notifies registered drivers when the modem changes operational state
>> (prepare, started, stop/crash, unprepared).  The IPA driver
>> registers to receive these notifications.
>>
>> With that as context, I'll now describe the problem.
>>
>> There was a situation in which buggy modem firmware led to a modem
>> crash very soon after system (AP) resume had begun.  The crash caused
>> a remoteproc SSR crash notification to be sent to the IPA driver.
>> The problem was that, although system resume had begun, it had not
>> yet completed, and the IPA driver was still in a suspended state.
>>
>> This scenario could happen to any driver that registers for these
>> SSR notifications, because they are delivered without knowledge of
>> the (suspend) state of registered recipient drivers.
>>
>> This patch offers a simple fix for this, by having the crash
>> handling worker function run on the system freezable workqueue.
>> This workqueue does not operate if user space is frozen (for
>> suspend).  As a result, the SSR subdevice only delivers its
>> crash notification when the system is fully operational (i.e.,
>> neither suspended nor in suspend/resume transition).
>>
> This makes sense to me; both that it ensures that we spend our resources
> on the actual system resume and that it avoids surprises from this
> happening while the system still is in a funky state...
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> But it would be nice to get some input from other users of the
> framework.
This patch sounds like a good idea for cases where the
request_firmware() APIs fallback to userspace firmware loading.

Will test out this patch and report back.

Thanks,
Sid
>
> Regards,
> Bjorn
>
>> Signed-off-by: Alex Elder <elder@linaro.org>
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 39cf44cb08035..6bedf2d2af239 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -2724,8 +2724,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>>   	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>>   		rproc->name, rproc_crash_to_string(type));
>>   
>> -	/* create a new task to handle the error */
>> -	schedule_work(&rproc->crash_handler);
>> +	/* Have a worker handle the error; ensure system is not suspended */
>> +	queue_work(system_freezable_wq, &rproc->crash_handler);
>>   }
>>   EXPORT_SYMBOL(rproc_report_crash);
>>   
>> -- 
>> 2.27.0
>>
