Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C32C433B4
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Apr 2021 02:13:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76ADA6145D
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Apr 2021 02:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236126AbhDWCNv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Apr 2021 22:13:51 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:18670 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbhDWCNv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Apr 2021 22:13:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619143995; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=e/r9mZL0sPfUmZ0A5IWDgR8IR2/UTIIc97fh88Z8P3M=; b=NZjRDhVaRSilphhQuZZL2lnlWqWM0OcoJ3G6ztppNaQl4q4hIWIYqLR17C9h9KAiRmHL4pnd
 AC1V2q+97hG6lPYfUAjJf1D8zljdwV8nW7f5EGoq4OSvkQUxkfeivgTcCDFirW1r9Hww4k/c
 60yw+uAXF7I5+qVDm5Z0nzaxHC4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60822d13215b831afb41360e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Apr 2021 02:12:35
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 13423C433D3; Fri, 23 Apr 2021 02:12:35 +0000 (UTC)
Received: from [192.168.1.10] (cpe-75-83-25-192.socal.res.rr.com [75.83.25.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3079C433F1;
        Fri, 23 Apr 2021 02:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A3079C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
Subject: Re: [PATCH] remoteproc: core: Move cdev add before device add
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, eberman@codeaurora.org
References: <1618946805-26970-1-git-send-email-sidgup@codeaurora.org>
 <20210422180455.GE1256950@xps15>
From:   Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <e1fa4482-4fc9-e67d-d6b1-3168188f3d18@codeaurora.org>
Date:   Thu, 22 Apr 2021 19:12:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210422180455.GE1256950@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 4/22/2021 11:04 AM, Mathieu Poirier wrote:
> Hi Siddharth,
>
> On Tue, Apr 20, 2021 at 12:26:45PM -0700, Siddharth Gupta wrote:
>> When cdev_add is called after device_add has been called there is no
>> way for the userspace to know about the addition of a cdev as cdev_add
>> itself doesn't trigger a uevent notification, or for the kernel to
>> know about the change to devt. This results in two problems:
>>   - mknod is never called for the cdev and hence no cdev appears on
>>     devtmpfs.
>>   - sysfs links to the new cdev are not established.
>>
>> Based on how cdev_device_add[1] is written, it appears that the correct
> Please don't add this kind of reference to the change log as it will become
> invalid with time.
Okay sure, I will remove it.
>
>> way to use these APIs is to call cdev_add before device_add is called.
>> Since the cdev is an optional feature for remoteproc we cannot directly
>> use the existing API.
> Please explain why the existing API can't be used directly.
Not sure what you mean here Mathieu? The reason why we can't use
it is because cdev is an optional feature. We would either have to move
device_add inside rproc_char_dev_add or the other way around and
make cdev a regular feature. Since device_add can't be called on the
same device struct twice[1], we have to do things this way. Also this
way we don't have to rely on the userspace to call mknod as it will
be called[2] as a part of the device_add call in devtmpfs_create_node.

Now that I think about it, is the above what you want me to put in the
commit text? :)

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/core.c#n3105
[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/devtmpfs.c#n215
>
>> Hence moving rproc_char_device_add() before
>> device_add() in rproc_add().
>>
>> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/char_dev.c#n537
>>
>> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 626a6b90f..562355a 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -2316,6 +2316,11 @@ int rproc_add(struct rproc *rproc)
>>   	struct device *dev = &rproc->dev;
>>   	int ret;
>>   
>> +	/* add char device for this remoteproc */
>> +	ret = rproc_char_device_add(rproc);
>> +	if (ret < 0)
>> +		return ret;
>> +
> I have tested this change and it works.  So how did it work before?
It is a sporadic issue due to a race between the userspace uevent handler
and cdev_add. If the uevent for the device is received/processed after
cdev_add the cdev is created.

If "add" is written to the uevent file or mknod is manually called for devt
the cdev works as expected, just that the sysfs links won't be created.
>
>>   	ret = device_add(dev);
>>   	if (ret < 0)
>>   		return ret;
>> @@ -2329,11 +2334,6 @@ int rproc_add(struct rproc *rproc)
>>   	/* create debugfs entries */
>>   	rproc_create_debug_dir(rproc);
>>   
>> -	/* add char device for this remoteproc */
>> -	ret = rproc_char_device_add(rproc);
>> -	if (ret < 0)
>> -		return ret;
>> -
> While reviewing this patch I had another look at rproc_add() and noticed it
> doesn't clean up after itself in case of failure.  If any of the conditions
> aren't met the function returns but rproc_delete_debug_dir(),
> rproc_char_device_remove() and device_del() aren't called.  Please fix that as
> part of your next revision.
Sure. I'll make those changes.

Thanks,
Sid
>
> Thanks,
> Mathieu
>
>
>>   	/* if rproc is marked always-on, request it to boot */
>>   	if (rproc->auto_boot) {
>>   		ret = rproc_trigger_auto_boot(rproc);
>> -- 
>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
