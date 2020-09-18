Return-Path: <SRS0=3tFr=C3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D067C43464
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 17:20:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB191206A2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 17:20:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="lKJ5wS7/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgIRRUo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Sep 2020 13:20:44 -0400
Received: from so254-54.mailgun.net ([198.61.254.54]:59567 "EHLO
        so254-54.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgIRRUo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Sep 2020 13:20:44 -0400
X-Greylist: delayed 306 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 13:20:43 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600449644; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yngYLv7On5M/Qyep/oUahIHqAnGroMVXpza1BfJKjZs=;
 b=lKJ5wS7/Ameg1RhvTDqBDXK2h2lAFZ96V7dym4btRftNj9BlhAQhefjzluRyxuKiMfU3lIql
 ikLXC89BFjORjkxAg+b5CEwGsGUUqMj8Hvsj9WHxF81CqddxMCDeQtX0a3LkQ8RaI5M8XFcq
 bL/UKD1O98WJ/Tc9T5Ag98Reauw=
X-Mailgun-Sending-Ip: 198.61.254.54
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f64eb380049ea581630da9d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 17:15:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A2EA6C433CB; Fri, 18 Sep 2020 17:15:36 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 42793C433CA;
        Fri, 18 Sep 2020 17:15:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Sep 2020 10:15:36 -0700
From:   rishabhb@codeaurora.org
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v4 0/3] Move recovery/coredump configuration to sysfs
In-Reply-To: <55d2c397-fad3-9dea-289b-6c10d31565ba@infradead.org>
References: <1600368999-9461-1-git-send-email-rishabhb@codeaurora.org>
 <55d2c397-fad3-9dea-289b-6c10d31565ba@infradead.org>
Message-ID: <500895ac9667a82f0ca65696145858f2@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2020-09-17 16:40, Randy Dunlap wrote:
> On 9/17/20 11:56 AM, Rishabh Bhatnagar wrote:
>> From Android R onwards Google has restricted access to debugfs in user
>> and user-debug builds. This restricts access to most of the features
>> exposed through debugfs. This patch series removes the 
>> recovery/coredump
>> entries from debugfs and moves them to sysfs.
>> 'Coredump' and 'Recovery' are critical interfaces that are required
>> for remoteproc to work on Qualcomm Chipsets. Coredump configuration
>> needs to be set to "inline" in debug/test build and "disabled" in
>> production builds. Whereas recovery needs to be "disabled" for
>> debugging purposes and "enabled" on production builds.
>> 
>> Changelog:
>> 
>> v4 -> v3:
>> - Remove the feature flag to expose recovery/coredump
>> 
>> v3 -> v2:
>> - Remove the coredump/recovery entries from debugfs
>> - Expose recovery/coredump from sysfs under a feature flag
>> 
>> v1 -> v2:
>> - Correct the contact name in the sysfs documentation.
>> - Remove the redundant write documentation for coredump/recovery sysfs
>> - Add a feature flag to make this interface switch configurable.
>> 
>> Rishabh Bhatnagar (3):
>>   remoteproc: Expose remoteproc configuration through sysfs
>>   remoteproc: Add coredump configuration to sysfs
>>   remoteproc: Add recovery configuration to sysfs
>> 
>>  Documentation/ABI/testing/sysfs-class-remoteproc |  44 ++++++++
>>  drivers/remoteproc/Kconfig                       |  12 +++
>>  drivers/remoteproc/remoteproc_debugfs.c          |  10 +-
>>  drivers/remoteproc/remoteproc_sysfs.c            | 126 
>> +++++++++++++++++++++++
>>  4 files changed, 190 insertions(+), 2 deletions(-)
>> 
> 
> Hi,
> 
> Is there a patch 3/3?
> This email (reply) is patch 0/3, then I see
>                       patch 1/2
>                       patch 2/2
> so I'm confused.  However, the diffstat above references a Kconfig file
> and neither patch 1/2 nor patch 2/2 contains any Kconfig changes.
> 
> thanks.
Hi Randy,
The cover letter got messed up. There are only 2 patches now whereas in 
the
earlier versions there were 3 patches. I'll be sending out v5 soon.
Please review that.
