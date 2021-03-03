Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9FEC433E6
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Mar 2021 00:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 796EE64F76
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Mar 2021 00:50:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbhCDAuJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:50:09 -0500
Received: from z11.mailgun.us ([104.130.96.11]:22460 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1389552AbhCCVjX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 3 Mar 2021 16:39:23 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614807542; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=sUcaPALdpy8y+tRs8z2ZURmdWTUCYzuiU0fvzzRaw30=; b=WuDwRmK9Rr6FNfH2e038PMr06DD3Mv0FYscASwjfJQoj8TFmk+lxjMIVmDyCoCYz2oLIpXVo
 CVPzgwxp2qVKh1v7H3FGyU4S7UtuxrmAGvnQVvr74vngn4WyEk/uF+ACvApkrGBdECU0+zx2
 RmRuR5CT4uBGYXOSKjVgaO3Tq7s=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 604001d8c862e1b9fdb102d8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Mar 2021 21:38:32
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 26D94C433ED; Wed,  3 Mar 2021 21:38:32 +0000 (UTC)
Received: from [192.168.1.10] (cpe-75-83-25-192.socal.res.rr.com [75.83.25.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4787EC433C6;
        Wed,  3 Mar 2021 21:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4787EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
Subject: Re: [PATCH] remoteproc: sysfs: Use scnprintf instead of sprintf
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raghavendra Rao Ananta <rananta@codeaurora.org>
References: <1614801698-25987-1-git-send-email-sidgup@codeaurora.org>
 <YD/4AnjM6XCBivul@builder.lan>
From:   Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <b8132211-09b1-52c5-61a0-7f8ac058ed96@codeaurora.org>
Date:   Wed, 3 Mar 2021 13:38:30 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YD/4AnjM6XCBivul@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 3/3/2021 12:56 PM, Bjorn Andersson wrote:
> On Wed 03 Mar 14:01 CST 2021, Siddharth Gupta wrote:
>
>> From: Raghavendra Rao Ananta <rananta@codeaurora.org>
>>
>> For security reasons scnprintf() is preferred over sprintf().
>> Hence, convert the remoteproc's sysfs show functions accordingly.
>>
> Thanks for the patch Siddharth.
>
> There's no possibility for these calls to generate more than PAGE_SIZE
> amount of data, so this isn't really necessary. But if you insist,
> please let's use sysfs_emit() instead.
>
> Regards,
> Bjorn
Sure Bjorn, I'll push the new patch immediately.

Thanks,
Siddharth
>
>> Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>
>> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
>> ---
>>   drivers/remoteproc/remoteproc_sysfs.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
>> index 1dbef89..853f569 100644
>> --- a/drivers/remoteproc/remoteproc_sysfs.c
>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
>> @@ -15,7 +15,8 @@ static ssize_t recovery_show(struct device *dev,
>>   {
>>   	struct rproc *rproc = to_rproc(dev);
>>   
>> -	return sprintf(buf, "%s", rproc->recovery_disabled ? "disabled\n" : "enabled\n");
>> +	return scnprintf(buf, PAGE_SIZE, "%s",
>> +			 rproc->recovery_disabled ? "disabled\n" : "enabled\n");
>>   }
>>   
>>   /*
>> @@ -82,7 +83,7 @@ static ssize_t coredump_show(struct device *dev,
>>   {
>>   	struct rproc *rproc = to_rproc(dev);
>>   
>> -	return sprintf(buf, "%s\n", rproc_coredump_str[rproc->dump_conf]);
>> +	return scnprintf(buf, PAGE_SIZE, "%s\n", rproc_coredump_str[rproc->dump_conf]);
>>   }
>>   
>>   /*
>> -- 
>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
