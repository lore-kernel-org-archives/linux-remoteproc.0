Return-Path: <SRS0=9bPA=DG=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9C8C4727C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Sep 2020 17:18:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42B0A20757
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Sep 2020 17:18:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="dxsnGq8K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbgI2RSl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Sep 2020 13:18:41 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:55004 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725554AbgI2RSk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Sep 2020 13:18:40 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08THHOmW010687;
        Tue, 29 Sep 2020 19:18:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=KLsmjKeGsfFqyL6scwWy2f2Tm9641An3TKilO0TJJY0=;
 b=dxsnGq8Kfk9KZqvg/n54r74Rp4v8YZUIVsXRk2pV1FgEeHXL/YJVgG13jRo8RzZLBv1h
 SEM4zHrUpgCTFvPZBGCQHUSWTBu263EFkDG19w3lm8+7UbZ3HQ0QOaQIa2iU5yU06oVT
 /YnWvzdHiJKsMyN6RQ7hBWQp+mD6iBmNtF/GqTVB6RmCy5Ik2iRI4kqTlWDERLp+SlVJ
 q53d+cSPufDcs5Z2L5Aaw/2Ag6cvDS81c82h+1BnkP3+4mthgL+dtcMaSwd3lj8ixR04
 ft7L8RaCheurd7zjy5p02WvVBdUxO2JFLeF201ROsbw3QGZzPAqtWHu+i35IhwnYYTFj lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33v0dgu1n8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Sep 2020 19:18:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41BB510002A;
        Tue, 29 Sep 2020 19:18:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2EA752BE253;
        Tue, 29 Sep 2020 19:18:34 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 29 Sep
 2020 19:18:32 +0200
Subject: Re: [PATCH v6 0/3] Move recovery/coredump configuration to sysfs
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "tsoni@codeaurora.org" <tsoni@codeaurora.org>,
        "psodagud@codeaurora.org" <psodagud@codeaurora.org>,
        "sidgup@codeaurora.org" <sidgup@codeaurora.org>
References: <1601331456-20432-1-git-send-email-rishabhb@codeaurora.org>
 <8222f5fa-2acc-a765-a728-6aad9ed88068@st.com>
 <20200929143357.GE10036@builder.lan>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <69aecefd-b8c9-ff99-ab91-f0dde5fcf3d5@st.com>
Date:   Tue, 29 Sep 2020 19:18:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929143357.GE10036@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-29_11:2020-09-29,2020-09-29 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 9/29/20 4:33 PM, Bjorn Andersson wrote:
> On Tue 29 Sep 03:44 CDT 2020, Arnaud POULIQUEN wrote:
> 
>>
>>
>> On 9/29/20 12:17 AM, Rishabh Bhatnagar wrote:
>>> From Android R onwards Google has restricted access to debugfs in user
>>> and user-debug builds. This restricts access to most of the features
>>> exposed through debugfs. 'Coredump' and 'Recovery' are critical
>>> interfaces that are required for remoteproc to work on Qualcomm Chipsets. 
>>> Coredump configuration needs to be set to "inline" in debug/test builds
>>> and "disabled" in production builds. Whereas recovery needs to be
>>> "disabled" for debugging purposes and "enabled" on production builds.
>>> This patch series removes the recovery/coredump entries from debugfs
>>> and moves them to sysfs. Also, this disables the coredump collection
>>> by default as this is a requirement for production devices.
>>>
>>> Changelog:
>>>
>>> v6 -> v5:
>>> - Disable coredump collection by default
>>> - Rename the "default" configuration to "enabled" to avoid confusion
>>>
>>> v5 -> v4:
>>> - Fix the cover-letter of tha patch series.
>>>
>>> v4 -> v3:
>>> - Remove the feature flag to expose recovery/coredump
>>>
>>> v3 -> v2:
>>> - Remove the coredump/recovery entries from debugfs
>>
>> Sorry i missed this and some associated discussion in V2...
>>
>> I have also some concerns about the ABI breaks.
> 
> Debugfs is not an ABI...
> 
>> In ST and I suppose in several companies we have some 
>> test environments that use the debugfs to generate and/or get
>> the core dump.
>>
> 
> I do however acknowledge the inconvenience you're facing...
> 
>> Even if the stability of the debugfs is not guaranteed it would
>> be nice to keep both interface.
>>
> 
> ...and I wouldn't mind keeping the debugfs interface around, at least
> for some time to allow people to transition their tools/muscle memory.
> 
>> It seems that it is possible to create symbolic link in the debugfs
>> thanks to the "debugfs_create_symlink" function.
>> This seems allowing to keep files in both place without duplicating the code.
>> To be honest i have never used this function so I'm not 100% sure that this
>> would do the job...
>> But if you think that this could be a good compromise, i can test it.
>>
> 
> The duplicated code is rather simple, so I don't mind the duplication -
> for now.
> 
> 
> So, how about we add the sysfs pieces of Rishabh's patches, leave out
> the debugfs and then in a while (e.g. one LTS) we remove the debugfs
> code?

This smooth transition seems to me a very good compromise.

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
>> Regards,
>> Arnaud
>>
>>> - Expose recovery/coredump from sysfs under a feature flag
>>>
>>> v1 -> v2:
>>> - Correct the contact name in the sysfs documentation.
>>> - Remove the redundant write documentation for coredump/recovery sysfs
>>> - Add a feature flag to make this interface switch configurable.
>>>
>>> Rishabh Bhatnagar (3):
>>>   remoteproc: Move coredump configuration to sysfs
>>>   remoteproc: Move recovery configuration to sysfs
>>>   remoteproc: Change default dump configuration to "disabled"
>>>
>>>  Documentation/ABI/testing/sysfs-class-remoteproc |  46 +++++++
>>>  drivers/remoteproc/remoteproc_coredump.c         |   6 +-
>>>  drivers/remoteproc/remoteproc_debugfs.c          | 168 -----------------------
>>>  drivers/remoteproc/remoteproc_sysfs.c            | 120 ++++++++++++++++
>>>  include/linux/remoteproc.h                       |   8 +-
>>>  5 files changed, 173 insertions(+), 175 deletions(-)
>>>
