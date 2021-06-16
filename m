Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F6DC48BE6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Jun 2021 18:47:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79248611CE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Jun 2021 18:47:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbhFPStQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Jun 2021 14:49:16 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42018 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231908AbhFPStP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Jun 2021 14:49:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623869229; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=rXxMRiUQCFxWYdeEQMd1dqMz8gjZz4tfzN8B1BwOFjg=; b=pUP7fKg1zL2vTyrPMMx0EItzsJXHptVQ+qww3UYULFoNWxdozEmKinpHaOJYrLvJpdzh+Zex
 tfK6r7e2oSpj8roZKJJlE/wcN33u1dAlXnALO9dl9V0XZE+e2ZD70KEiFmcI+OdqnhNzOIFW
 TjxcABLRQE/0WcECaz34AzGraGg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60ca4728e27c0cc77f77d3da (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Jun 2021 18:47:04
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1E61C4338A; Wed, 16 Jun 2021 18:47:03 +0000 (UTC)
Received: from [192.168.1.10] (cpe-75-83-25-192.socal.res.rr.com [75.83.25.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CCE98C433D3;
        Wed, 16 Jun 2021 18:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CCE98C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
Subject: Re: [PATCH v3 1/4] remoteproc: core: Move cdev add before device add
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org,
        stable@vger.kernel.org
References: <1623723671-5517-1-git-send-email-sidgup@codeaurora.org>
 <1623723671-5517-2-git-send-email-sidgup@codeaurora.org>
 <YMgy7eg3wde0eVfe@kroah.com>
 <0a196786-f624-d9bb-8ef9-55c04ed57497@codeaurora.org>
 <YMmTGD6hAKbpGWMp@kroah.com>
From:   Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <f81acd52-fe59-a296-b221-febbf8281606@codeaurora.org>
Date:   Wed, 16 Jun 2021 11:47:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMmTGD6hAKbpGWMp@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 6/15/2021 10:58 PM, Greg KH wrote:
> On Tue, Jun 15, 2021 at 12:03:26PM -0700, Siddharth Gupta wrote:
>> On 6/14/2021 9:56 PM, Greg KH wrote:
>>> On Mon, Jun 14, 2021 at 07:21:08PM -0700, Siddharth Gupta wrote:
>>>> When cdev_add is called after device_add has been called there is no
>>>> way for the userspace to know about the addition of a cdev as cdev_add
>>>> itself doesn't trigger a uevent notification, or for the kernel to
>>>> know about the change to devt. This results in two problems:
>>>>    - mknod is never called for the cdev and hence no cdev appears on
>>>>      devtmpfs.
>>>>    - sysfs links to the new cdev are not established.
>>>>
>>>> The cdev needs to be added and devt assigned before device_add() is
>>>> called in order for the relevant sysfs and devtmpfs entries to be
>>>> created and the uevent to be properly populated.
>>> So this means no one ever ran this code on a system that used devtmpfs?
>>>
>>> How was it ever tested?
>> My testing was done with toybox + Android's ueventd ramdisk.
>> As I mentioned in the discussion, the race became evident
>> recently. I will make sure to test all such changes without
>> systemd/ueventd in the future.
> It isn't an issue of systemd/ueventd, those do not control /dev on a
> normal system, that is what devtmpfs is for.
I am not fully aware of when devtmpfs is enabled or not, but in
case it is not - systemd/ueventd will create these files with
mknod, right? I was even manually able to call mknod from the
terminal when some of the remoteproc character device entries
showed up (using major number from there, and minor number being
the remoteproc id), and that allowed me to boot up the
remoteprocs as well.
>
> And devtmpfs nodes are only created if you create a struct device
> somewhere with a proper major/minor, which you were not doing here, so
> you must have had a static /dev on your test systems, right?
I am not sure of what you mean by a static /dev? Could you
explain? In case you mean the character device would be
non-functional, that is not the case. They have been working
for us since the beginning.

Thanks,
Sid
>
> thanks,
>
> greg k-h
