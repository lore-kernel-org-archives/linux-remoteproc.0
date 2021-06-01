Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7E2C47096
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Jun 2021 14:12:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B9B6613AE
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Jun 2021 14:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234187AbhFAOOW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 1 Jun 2021 10:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234137AbhFAOOV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 1 Jun 2021 10:14:21 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C3BC061574
        for <linux-remoteproc@vger.kernel.org>; Tue,  1 Jun 2021 07:12:39 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id h7so1354486iok.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Jun 2021 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OUIJD/fmYAlR+wqYWbhMwLjHThhSbr6I4Y+gE7MD5qM=;
        b=TpLYm2SUozQQMMUBgo8b7nAU1WGe1TaAWmPtyLZBONc7XD16vrLDHEz7X96X9EkXL9
         pbN6/gJ6bBwg/AEGyt5EKGHNNc52exGocny+48sN22iR3K0TDaDjwRzkgI7gN//fSlMI
         kgAzttL1HRNG45PovRFtHChklbNlnn6h5TSFCn/jzIhNVk/NV5HPWG6M5DQW8BZg+wEY
         2oREVTc4h8F4sF1tVVNnoVnM+ylT6L874risva6TFwnZdonPBVXpk43BXylUnARPBT2M
         lTeSOHm5lppOcQH4Gy0rZ8qGkdbo8XCqYMzrmoVVpcQzPQ8+BHmiqudy6PrpjwQCPOUI
         mddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OUIJD/fmYAlR+wqYWbhMwLjHThhSbr6I4Y+gE7MD5qM=;
        b=NV1O7ply69JNBQ/RfDwLpDFKJ5U8qelL2fbkzcULhSGfMWH117x2QQTOfMc1q5anlg
         M8AUNT93P8SdnE3JRXhis0spThJ0/Y1arkdHqIUQhKGZqnh6Vsl2Lwm9aaKMTw0TnIAr
         BwL3wgVjt3RIphxZCqojRes3LVCmLiwWW6fQ6c2XQ809PDI9L6VvyGb1NQZSkGMpaa3c
         S9Yrs6zV4454jqzEcBlb6zlNjcbhzEhUjrYSMm448EDJOf0q6DSUhwtPZLjTLxoxyxyk
         3NtRjSqAoYzW0/pZs7r9akMiKu34IN8hgcBCXv2aO5vVrSbr9nZFPHV1kOfSxfxTfOxo
         O3gQ==
X-Gm-Message-State: AOAM533gmpOBUPuLUP6jJDmtpBkXExzxN8An7RMsYIdiYzVuYQTheHTo
        kCnCV2m0uIjqT40NGdm2nExQkA==
X-Google-Smtp-Source: ABdhPJyaG0jU/YUXrPCuctAIH/L6dIsWbsTus66LP2CUN2gN7cNH1qItSQ/jAbzBR3fBT122DVnigA==
X-Received: by 2002:a6b:6a0c:: with SMTP id x12mr11331174iog.81.1622556758618;
        Tue, 01 Jun 2021 07:12:38 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id f26sm5113582ioo.17.2021.06.01.07.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 07:12:37 -0700 (PDT)
Subject: Re: [PATCH 1/1] remoteproc: use freezable workqueue for crash
 notifications
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210519234418.1196387-1-elder@linaro.org>
 <20210519234418.1196387-2-elder@linaro.org> <YLBpmdZoGDXNz64y@builder.lan>
 <20210531172153.GA1718330@xps15>
From:   Alex Elder <elder@linaro.org>
Message-ID: <c52a7df2-10d9-e1c9-f9bd-7fd205ec003a@linaro.org>
Date:   Tue, 1 Jun 2021 09:12:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210531172153.GA1718330@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 5/31/21 12:21 PM, Mathieu Poirier wrote:
> On Thu, May 27, 2021 at 10:55:05PM -0500, Bjorn Andersson wrote:
>> On Wed 19 May 18:44 CDT 2021, Alex Elder wrote:
>>
>>> When a remoteproc has crashed, rproc_report_crash() is called to
>>> handle whatever recovery is desired.  This can happen at almost any
>>> time, often triggered by an interrupt, though it can also be
>>> initiated by a write to debugfs file remoteproc/remoteproc*/crash.
>>>
>>> When a crash is reported, the crash handler worker is scheduled to
>>> run (rproc_crash_handler_work()).  One thing that worker does is
>>> call rproc_trigger_recovery(), which calls rproc_stop().  That calls
>>> the ->stop method for any remoteproc subdevices before making the
>>> remote processor go offline.
>>>
>>> The Q6V5 modem remoteproc driver implements an SSR subdevice that
>>> notifies registered drivers when the modem changes operational state
>>> (prepare, started, stop/crash, unprepared).  The IPA driver
>>> registers to receive these notifications.
>>>
>>> With that as context, I'll now describe the problem.
>>>
>>> There was a situation in which buggy modem firmware led to a modem
>>> crash very soon after system (AP) resume had begun.  The crash caused
>>> a remoteproc SSR crash notification to be sent to the IPA driver.
>>> The problem was that, although system resume had begun, it had not
>>> yet completed, and the IPA driver was still in a suspended state.
> 
> This is a very tight race condition - I agree with you that it is next to
> impossible to test.
> 
>>>
>>> This scenario could happen to any driver that registers for these
>>> SSR notifications, because they are delivered without knowledge of
>>> the (suspend) state of registered recipient drivers.
>>>
>>> This patch offers a simple fix for this, by having the crash
>>> handling worker function run on the system freezable workqueue.
>>> This workqueue does not operate if user space is frozen (for
>>> suspend).  As a result, the SSR subdevice only delivers its
>>> crash notification when the system is fully operational (i.e.,
>>> neither suspended nor in suspend/resume transition).
>>>
> 
> I think the real fix for this problem should be in the platform driver where
> the remoteproc interrupt would be masked while suspending and re-enabled again
> when resuming.  The runtime PM API would work just fine for that...  But doing

I considered that (and sent a private e-mail to Bjorn with that
as a suggestion), but as he pointed out, there's a chance this
would include disabling an interrupt that is needed to trigger a
system resume.

> so wouldn't guarantee that other drivers, i.e IPA, would be operational.  Unless
> of one is a child of the other or using a bus like mechanic, and getting
> to that point will introduce a lot more churn than what this patch does.

Agreed.  I think either the remoteproc driver should handle it
centrally, or all drivers that could be affected by this scenario
should be updated to handle it.  To my knowledge only IPA is
affected, but if it's possible for remoteproc to handle it, it's
simpler overall.

Thanks for the review.

					-Alex

> The proposed solution will work since user space is expected to resume when
> the kernel and drivers are fully operational.  As you pointed out the only
> concern is with other users, which may not be noticeable given the very small
> delay that is introduced.  As such:
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro>
> 
> But be mindful the patch will have to be reverted if someone complains, whether
> that happens in two weeks or 10 months.
> 
> Thanks,
> Mathieu
> 
>>
>> This makes sense to me; both that it ensures that we spend our resources
>> on the actual system resume and that it avoids surprises from this
>> happening while the system still is in a funky state...
>>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>
>> But it would be nice to get some input from other users of the
>> framework.
>>
>> Regards,
>> Bjorn
>>
>>> Signed-off-by: Alex Elder <elder@linaro.org>
>>> ---
>>>   drivers/remoteproc/remoteproc_core.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>> index 39cf44cb08035..6bedf2d2af239 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -2724,8 +2724,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>>>   	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>>>   		rproc->name, rproc_crash_to_string(type));
>>>   
>>> -	/* create a new task to handle the error */
>>> -	schedule_work(&rproc->crash_handler);
>>> +	/* Have a worker handle the error; ensure system is not suspended */
>>> +	queue_work(system_freezable_wq, &rproc->crash_handler);
>>>   }
>>>   EXPORT_SYMBOL(rproc_report_crash);
>>>   
>>> -- 
>>> 2.27.0
>>>

