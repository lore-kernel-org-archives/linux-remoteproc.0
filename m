Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D08BC2BBCF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Dec 2020 18:22:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EB6B2396F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Dec 2020 18:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730133AbgLQSWR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Dec 2020 13:22:17 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:27223 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730093AbgLQSWR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Dec 2020 13:22:17 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608229313; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uDlTTR0Cfma4aSUzb8Egeut+U21yuCwXAadjUdyUhZA=;
 b=eoIN2OvSeG12tsewGxQiuhKPVlnBpO2IIZ4JqQky8N1uvhGxwG+a2OPYXc++HHOsA2dvUMwW
 NlhbS8pI1/SLS60F2qca0zp+PgMuNYDzQSE7h0uma4LXBfswwdr7pXnV5tOxWvrf6VSzrRiJ
 q8Dsh/z7FNBCiDqYDk6UoGlhpMs=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fdba1a2ca81d9e625eab5e7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 18:21:22
 GMT
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B0F90C433ED; Thu, 17 Dec 2020 18:21:21 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 19D7BC433CA;
        Thu, 17 Dec 2020 18:21:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 17 Dec 2020 10:21:20 -0800
From:   rishabhb@codeaurora.org
To:     Alex Elder <elder@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH] remoteproc: Create a separate workqueue for recovery
 tasks
In-Reply-To: <dc9940f0-7fe3-d1da-acb5-580ae7366c9b@linaro.org>
References: <1607806087-27244-1-git-send-email-rishabhb@codeaurora.org>
 <X9k+xmg9SULEbJXe@builder.lan>
 <dc9940f0-7fe3-d1da-acb5-580ae7366c9b@linaro.org>
Message-ID: <87c3f902b94bc243fc28e0ce79303dd4@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2020-12-17 08:12, Alex Elder wrote:
> On 12/15/20 4:55 PM, Bjorn Andersson wrote:
>> On Sat 12 Dec 14:48 CST 2020, Rishabh Bhatnagar wrote:
>> 
>>> Create an unbound high priority workqueue for recovery tasks.
> 
> I have been looking at a different issue that is caused by
> crash notification.
> 
> What happened was that the modem crashed while the AP was
> in system suspend (or possibly even resuming) state.  And
> there is no guarantee that the system will have called a
> driver's ->resume callback when the crash notification is
> delivered.
> 
> In my case (in the IPA driver), handling a modem crash
> cannot be done while the driver is suspended; i.e. the
> activities in its ->resume callback must be completed
> before we can recover from the crash.
> 
> For this reason I might like to change the way the
> crash notification is handled, but what I'd rather see
> is to have the work queue not run until user space
> is unfrozen, which would guarantee that all drivers
> that have registered for a crash notification will
> be resumed when the notification arrives.
> 
> I'm not sure how that interacts with what you are
> looking for here.  I think the workqueue could still
> be unbound, but its work would be delayed longer before
> any notification (and recovery) started.
> 
> 					-Alex
> 
> 
In that case, maybe adding a "WQ_FREEZABLE" flag might help?
> 
>> This simply repeats $subject
>> 
>>> Recovery time is an important parameter for a subsystem and there
>>> might be situations where multiple subsystems crash around the same
>>> time.  Scheduling into an unbound workqueue increases parallelization
>>> and avoids time impact.
>> 
>> You should be able to write this more succinctly. The important part 
>> is
>> that you want an unbound work queue to allow recovery to happen in
>> parallel - which naturally implies that you care about recovery 
>> latency.
>> 
>>> Also creating a high priority workqueue
>>> will utilize separate worker threads with higher nice values than
>>> normal ones.
>>> 
>> 
>> This doesn't describe why you need the higher priority.
>> 
>> 
>> I believe, and certainly with the in-line coredump, that we're running
>> our recovery work for way too long to be queued on the system_wq. As
>> such the content of the patch looks good!
>> 
>> Regards,
>> Bjorn
>> 
>>> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
>>> ---
>>>   drivers/remoteproc/remoteproc_core.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/drivers/remoteproc/remoteproc_core.c 
>>> b/drivers/remoteproc/remoteproc_core.c
>>> index 46c2937..8fd8166 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -48,6 +48,8 @@ static DEFINE_MUTEX(rproc_list_mutex);
>>>   static LIST_HEAD(rproc_list);
>>>   static struct notifier_block rproc_panic_nb;
>>>   +static struct workqueue_struct *rproc_wq;
>>> +
>>>   typedef int (*rproc_handle_resource_t)(struct rproc *rproc,
>>>   				 void *, int offset, int avail);
>>>   @@ -2475,7 +2477,7 @@ void rproc_report_crash(struct rproc *rproc, 
>>> enum rproc_crash_type type)
>>>   		rproc->name, rproc_crash_to_string(type));
>>>     	/* create a new task to handle the error */
>>> -	schedule_work(&rproc->crash_handler);
>>> +	queue_work(rproc_wq, &rproc->crash_handler);
>>>   }
>>>   EXPORT_SYMBOL(rproc_report_crash);
>>>   @@ -2520,6 +2522,10 @@ static void __exit rproc_exit_panic(void)
>>>     static int __init remoteproc_init(void)
>>>   {
>>> +	rproc_wq = alloc_workqueue("rproc_wq", WQ_UNBOUND | WQ_HIGHPRI, 0);
>>> +	if (!rproc_wq)
>>> +		return -ENOMEM;
>>> +
>>>   	rproc_init_sysfs();
>>>   	rproc_init_debugfs();
>>>   	rproc_init_cdev();
>>> @@ -2536,6 +2542,7 @@ static void __exit remoteproc_exit(void)
>>>   	rproc_exit_panic();
>>>   	rproc_exit_debugfs();
>>>   	rproc_exit_sysfs();
>>> +	destroy_workqueue(rproc_wq);
>>>   }
>>>   module_exit(remoteproc_exit);
>>>   -- The Qualcomm Innovation Center, Inc. is a member of the Code 
>>> Aurora Forum,
>>> a Linux Foundation Collaborative Project
>>> 
