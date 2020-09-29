Return-Path: <SRS0=9bPA=DG=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B0DC4727F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Sep 2020 07:43:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8F842076B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Sep 2020 07:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="Kf9hAEqo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgI2HnZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Sep 2020 03:43:25 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:53480 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725535AbgI2HnZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Sep 2020 03:43:25 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08T7gdGG015378;
        Tue, 29 Sep 2020 09:43:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=3ZTyTad/LPENqeBpYwoZJvryhUoT8AVWQSPJR6PaLm4=;
 b=Kf9hAEqoVtujC55STGbhL+MpTLiw14FxZdXpfigtD+K0Z0qenZGaWU3FxpgyZP6e9g3+
 Yc26BAsMXBBVlBVQew+HldhmNuSXOPupSb4IHO/CqiBepbHVUm3O1hZ7LMr7bCtcQetJ
 MzzfIoabu/26+u4WrYLWWzaPJ5qGVbYqjePhyoJQlohi7quzYOHIPUNeShgt2CbfIRV1
 /AuLUup6HvrC4Q2SO/SOkrDS/e1espk6YbiIT/YDUH+hDVtdp3b9XmI1pyc4Xa3lAUmU
 iGuQI3e/HYOmWknc02vz6JR70l6chWX/TKWti+J0LnR7zAGLHmcBq7jKkM3ZBaij2Tk7 UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33svhefd0v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Sep 2020 09:43:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A64810002A;
        Tue, 29 Sep 2020 09:43:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C75321BE20;
        Tue, 29 Sep 2020 09:43:18 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 29 Sep
 2020 09:43:16 +0200
Subject: Re: [PATCH v2 0/3] Expose recovery/coredump configuration from sysfs
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "tsoni@codeaurora.org" <tsoni@codeaurora.org>,
        "psodagud@codeaurora.org" <psodagud@codeaurora.org>,
        "sidgup@codeaurora.org" <sidgup@codeaurora.org>
References: <1598557731-1566-1-git-send-email-rishabhb@codeaurora.org>
 <7ad40d80-5ac4-97a5-5e05-c83dc08896a2@st.com>
 <20200926033109.GA10036@builder.lan>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <41909da5-bc64-e81c-9a1d-99ab413461ec@st.com>
Date:   Tue, 29 Sep 2020 09:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200926033109.GA10036@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-29_01:2020-09-29,2020-09-29 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,

On 9/26/20 5:31 AM, Bjorn Andersson wrote:
> On Tue 15 Sep 02:51 PDT 2020, Arnaud POULIQUEN wrote:
> 
>> Hi Rishabh,
>>
>> On 8/27/20 9:48 PM, Rishabh Bhatnagar wrote:
>>> From Android R onwards Google has restricted access to debugfs in user
>>> and user-debug builds. This restricts access to most of the features
>>> exposed through debugfs. This patch series adds a configurable option
>>> to move the recovery/coredump interfaces to sysfs. If the feature
>>> flag is selected it would move these interfaces to sysfs and remove
>>> the equivalent debugfs interface. 'Coredump' and 'Recovery' are critical
>>> interfaces that are required for remoteproc to work on Qualcomm Chipsets.
>>> Coredump configuration needs to be set to "inline" in debug/test build
>>> and "disabled" in production builds. Whereas recovery needs to be
>>> "disabled" for debugging purposes and "enabled" on production builds.
>>
>> The remoteproc_cdev had been created to respond to some sysfs limitations.
> 
> The limitation here is in debugfs not being available on all systems,
> sysfs is present and I really do like the idea of being able to change
> these things without having to compile a tool to invoke the ioctl...

Right,

> 
>> I wonder if this evolution should not also be implemented in the cdev.
>> In this case an additional event could be addedd to inform the application
>> that a crash occurred and that a core dump is available.
>>
> 
> Specifically for userspace to know when a coredump is present there's
> already uevents being sent when the devcoredump is ready. That said,
> having some means to getting notified about remoteproc state changes
> does sounds reasonable. If there is a use case we should discuss that.

The main use case i have in mind is to inform the userspace that the remote
processor has crashed. This would allow applications to perform specific action
to avoid getting stuck and/or resetting it's environement befor restarting the
remote processor and associated IPC.
If i well remember QCOM has this kind of mechanism for its modem but this is
implemented in a platform driver.
We would be interested to have something more generic relying on the remoteproc
framework.

Thanks,
Arnaud

> 
>> Of course it's only a suggestion... As it would be a redesign.
> 
> A very valid suggestion. I don't think it's a redesign, but more of an
> extension of what we have today.
> 
> Regards,
> Bjorn
> 
>> I let Björn and Mathieu comment.
>>
>> Regards,
>> Arnaud
>>
>>>
>>> Changelog:
>>>
>>> v1 -> v2:
>>> - Correct the contact name in the sysfs documentation.
>>> - Remove the redundant write documentation for coredump/recovery sysfs
>>> - Add a feature flag to make this interface switch configurable.
>>>
>>> Rishabh Bhatnagar (3):
>>>   remoteproc: Expose remoteproc configuration through sysfs
>>>   remoteproc: Add coredump configuration to sysfs
>>>   remoteproc: Add recovery configuration to sysfs
>>>
>>>  Documentation/ABI/testing/sysfs-class-remoteproc |  44 ++++++++
>>>  drivers/remoteproc/Kconfig                       |  12 +++
>>>  drivers/remoteproc/remoteproc_debugfs.c          |  10 +-
>>>  drivers/remoteproc/remoteproc_sysfs.c            | 126 +++++++++++++++++++++++
>>>  4 files changed, 190 insertions(+), 2 deletions(-)
>>>
