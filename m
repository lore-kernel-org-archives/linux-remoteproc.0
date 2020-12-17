Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EDFC4361B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Dec 2020 16:14:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0909A2311F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Dec 2020 16:14:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbgLQQNj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Dec 2020 11:13:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgLQQNj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Dec 2020 11:13:39 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761F7C0617A7
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Dec 2020 08:12:58 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id w12so2040852ilm.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Dec 2020 08:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w52xAyUk2YHyHvKrzIF/7PAvKUFWBeTs9L3pldfVYi4=;
        b=khGtcJdI1pu91hjwmwYU6dXHXhL2Sn3ycmLuGsIi7+3JRuYjkPujk3064Lpizzaisi
         NZZdSCpvm3/Rq+41zMqRlmoE9M2GD2gYXGlw7FbIP+VlwdB884TB8+tzM9WxSlo/hTvy
         kRJQvgDDPws64wlHDMRFQ6RR0yjus7pF8O/ERHJsmOi1PcISaZkIt13SDS7cOSFMqTZz
         QzRSr0aqZn568/y9iLL69+0bsF7l3hURZbDIEMxeWT13N+Sq8UCdE0gMQiuWsxFccBME
         PfsP36ThSw/9rL5aR48FhXUjBWWOzfNVNQWzDlFRU1Bi5w54LKrbHo0XJoIPlXjnyHaP
         Rosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w52xAyUk2YHyHvKrzIF/7PAvKUFWBeTs9L3pldfVYi4=;
        b=ckpiG4A2mrkX7Or7lbaeK0sYd+ggQzRzkRPeCgAEL1zu+WzEPBwnh+RNpufC6kzBSW
         8Ce42Rz36maU2lh/JptcWq08RqV0VlMsNC2Nh6hpwE7eYvz4nxhkJ2tLHwyHyGiBdLDr
         unCxg08lkz+xRArggD8d1daR89CPp9cWnWfAnzsOLoVvaxllS3tv7Lmai/UUbUxRYgMI
         p55mksRuRpNEJxanqPs/KlsHB2Ku3RQBwKdlgX4zJm1yNxwFCWSdNzNaBz+kKvKwa23a
         FB3N/qhnItT5Ot9iU5PFKop97jwnsvevyDNIcYX8VgapzUsbfimevx2S2+xAnZgW+I1i
         bYTg==
X-Gm-Message-State: AOAM531LcyxGl+/RBtYeADQj5YTxInfayrnT6ivsFCf5++1BTkvKFbCG
        wQiEc8OIUOIispuW6ovLAvQ/8w==
X-Google-Smtp-Source: ABdhPJwlqp6BXP81F9gzX2YwoxtDJP3LY6Ch+P+pg5OIAGJHA915louUg5qOwvxdSRzdvXCO/9dLlw==
X-Received: by 2002:a92:4a12:: with SMTP id m18mr50974098ilf.98.1608221577695;
        Thu, 17 Dec 2020 08:12:57 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id m18sm14419664ioy.44.2020.12.17.08.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 08:12:57 -0800 (PST)
Subject: Re: [PATCH] remoteproc: Create a separate workqueue for recovery
 tasks
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org
References: <1607806087-27244-1-git-send-email-rishabhb@codeaurora.org>
 <X9k+xmg9SULEbJXe@builder.lan>
From:   Alex Elder <elder@linaro.org>
Message-ID: <dc9940f0-7fe3-d1da-acb5-580ae7366c9b@linaro.org>
Date:   Thu, 17 Dec 2020 10:12:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X9k+xmg9SULEbJXe@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/15/20 4:55 PM, Bjorn Andersson wrote:
> On Sat 12 Dec 14:48 CST 2020, Rishabh Bhatnagar wrote:
> 
>> Create an unbound high priority workqueue for recovery tasks.

I have been looking at a different issue that is caused by
crash notification.

What happened was that the modem crashed while the AP was
in system suspend (or possibly even resuming) state.  And
there is no guarantee that the system will have called a
driver's ->resume callback when the crash notification is
delivered.

In my case (in the IPA driver), handling a modem crash
cannot be done while the driver is suspended; i.e. the
activities in its ->resume callback must be completed
before we can recover from the crash.

For this reason I might like to change the way the
crash notification is handled, but what I'd rather see
is to have the work queue not run until user space
is unfrozen, which would guarantee that all drivers
that have registered for a crash notification will
be resumed when the notification arrives.

I'm not sure how that interacts with what you are
looking for here.  I think the workqueue could still
be unbound, but its work would be delayed longer before
any notification (and recovery) started.

					-Alex



> This simply repeats $subject
> 
>> Recovery time is an important parameter for a subsystem and there
>> might be situations where multiple subsystems crash around the same
>> time.  Scheduling into an unbound workqueue increases parallelization
>> and avoids time impact.
> 
> You should be able to write this more succinctly. The important part is
> that you want an unbound work queue to allow recovery to happen in
> parallel - which naturally implies that you care about recovery latency.
> 
>> Also creating a high priority workqueue
>> will utilize separate worker threads with higher nice values than
>> normal ones.
>>
> 
> This doesn't describe why you need the higher priority.
> 
> 
> I believe, and certainly with the in-line coredump, that we're running
> our recovery work for way too long to be queued on the system_wq. As
> such the content of the patch looks good!
> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 46c2937..8fd8166 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -48,6 +48,8 @@ static DEFINE_MUTEX(rproc_list_mutex);
>>   static LIST_HEAD(rproc_list);
>>   static struct notifier_block rproc_panic_nb;
>>   
>> +static struct workqueue_struct *rproc_wq;
>> +
>>   typedef int (*rproc_handle_resource_t)(struct rproc *rproc,
>>   				 void *, int offset, int avail);
>>   
>> @@ -2475,7 +2477,7 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>>   		rproc->name, rproc_crash_to_string(type));
>>   
>>   	/* create a new task to handle the error */
>> -	schedule_work(&rproc->crash_handler);
>> +	queue_work(rproc_wq, &rproc->crash_handler);
>>   }
>>   EXPORT_SYMBOL(rproc_report_crash);
>>   
>> @@ -2520,6 +2522,10 @@ static void __exit rproc_exit_panic(void)
>>   
>>   static int __init remoteproc_init(void)
>>   {
>> +	rproc_wq = alloc_workqueue("rproc_wq", WQ_UNBOUND | WQ_HIGHPRI, 0);
>> +	if (!rproc_wq)
>> +		return -ENOMEM;
>> +
>>   	rproc_init_sysfs();
>>   	rproc_init_debugfs();
>>   	rproc_init_cdev();
>> @@ -2536,6 +2542,7 @@ static void __exit remoteproc_exit(void)
>>   	rproc_exit_panic();
>>   	rproc_exit_debugfs();
>>   	rproc_exit_sysfs();
>> +	destroy_workqueue(rproc_wq);
>>   }
>>   module_exit(remoteproc_exit);
>>   
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>

