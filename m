Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE81FC4361B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Dec 2020 18:50:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 716F523118
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Dec 2020 18:50:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729287AbgLQSuA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Dec 2020 13:50:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728704AbgLQSt7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Dec 2020 13:49:59 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9DEBC0617A7
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Dec 2020 10:49:19 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id q5so6177852ilc.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Dec 2020 10:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=02u8Dsl66xAX2x9VDf8pp+9Zcn9sUu8zZbuiELaOrQI=;
        b=kGaH8z++E1wZGQJ9CCiZbeEc0HDauNPgBP49gLWN3u6pFPH9ObzqiDACq4jVDSMc3a
         Z7zlUL83yMcehtTiADp8DrEkHYk4OH8ZrvlOhusWqKD2GmrOmVGeaXZgPozedoDQhD++
         FHJ5Mmzl1KzXWcYnVviciNBwaBI5L3Mf8TSWJMc/IkaABwvvlBrdOPSElMLwNn+l5D7M
         v/BWsRE1lsIITadNCcrTY3hztPACfshPNQo2FN/gqpaSZyhtsuJUzBGgjODdLXVTjTLo
         SLApV0OOv4Br+FEx+of+NS1P85uTmYt2KGYa6Eytut0QOoLyIKrGi4q5wizcRJq5LW4q
         5u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=02u8Dsl66xAX2x9VDf8pp+9Zcn9sUu8zZbuiELaOrQI=;
        b=Y11LMr4q2+LMd/oXXRjjPzWZhYs2LK3nujkvAt3V35Xjy1hTkMJSVYz6qYLyg+ug7Y
         aOYJyhGIYv1ndMOVTvAnj0dCfVZEpYp5xB8loMwjrGnLLz4RdHFZZcIrtPNS3FowJ/mr
         BQwLLksujK6Ly2emXbvf895IEJeJKXx+zJz69oPjd42XrzrlGSEYd2IhW+2GOx1Xe0vr
         /U3XOBBEp7uDRVXCYM/dDztjI5ff9C6vXpZTJXi44zhTq6xnGv2HvdBXkOT/15mwUMnx
         RWTgsXTABRk9DaT26fBntAUHLhQJ/xAv9ICKfGgXr+njwe0TLdEJ3081OcXEGoU6zKQp
         gogw==
X-Gm-Message-State: AOAM5311nPx0OTqv/qMcSTPaWGqpQ2lZHRsiH4a7JYGUBA5lmnR+6Xie
        Dcql6ndLx73JQVctLNgCODTZ3w==
X-Google-Smtp-Source: ABdhPJypnBerzrbgejyDPVHVJFaOpXd3A78ixxGRC7wyAyxHKRMtOJ30OOGcqiHkuyGew8iKxIhmBQ==
X-Received: by 2002:a92:ba82:: with SMTP id t2mr196649ill.139.1608230959056;
        Thu, 17 Dec 2020 10:49:19 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id x17sm3601844ilj.67.2020.12.17.10.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 10:49:18 -0800 (PST)
Subject: Re: [PATCH] remoteproc: Create a separate workqueue for recovery
 tasks
To:     rishabhb@codeaurora.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org
References: <1607806087-27244-1-git-send-email-rishabhb@codeaurora.org>
 <X9k+xmg9SULEbJXe@builder.lan>
 <dc9940f0-7fe3-d1da-acb5-580ae7366c9b@linaro.org>
 <87c3f902b94bc243fc28e0ce79303dd4@codeaurora.org>
From:   Alex Elder <elder@linaro.org>
Message-ID: <35e2106f-d738-4018-50f2-17afcbc627f7@linaro.org>
Date:   Thu, 17 Dec 2020 12:49:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <87c3f902b94bc243fc28e0ce79303dd4@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/17/20 12:21 PM, rishabhb@codeaurora.org wrote:
> On 2020-12-17 08:12, Alex Elder wrote:
>> On 12/15/20 4:55 PM, Bjorn Andersson wrote:
>>> On Sat 12 Dec 14:48 CST 2020, Rishabh Bhatnagar wrote:
>>>
>>>> Create an unbound high priority workqueue for recovery tasks.
>>
>> I have been looking at a different issue that is caused by
>> crash notification.
>>
>> What happened was that the modem crashed while the AP was
>> in system suspend (or possibly even resuming) state.  And
>> there is no guarantee that the system will have called a
>> driver's ->resume callback when the crash notification is
>> delivered.
>>
>> In my case (in the IPA driver), handling a modem crash
>> cannot be done while the driver is suspended; i.e. the
>> activities in its ->resume callback must be completed
>> before we can recover from the crash.
>>
>> For this reason I might like to change the way the
>> crash notification is handled, but what I'd rather see
>> is to have the work queue not run until user space
>> is unfrozen, which would guarantee that all drivers
>> that have registered for a crash notification will
>> be resumed when the notification arrives.
>>
>> I'm not sure how that interacts with what you are
>> looking for here.  I think the workqueue could still
>> be unbound, but its work would be delayed longer before
>> any notification (and recovery) started.
>>
>>                     -Alex
>>
>>
> In that case, maybe adding a "WQ_FREEZABLE" flag might help?

Yes, exactly.  But how does that affect whatever you were
trying to do with your patch?

					-Alex

. . .
