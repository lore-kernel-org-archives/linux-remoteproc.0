Return-Path: <SRS0=rFSt=CY=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF003C43461
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 09:51:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7370821974
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 09:51:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="IG4pkxyK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgIOJvM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Sep 2020 05:51:12 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:26864 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726095AbgIOJvK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Sep 2020 05:51:10 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08F9kQNf018940;
        Tue, 15 Sep 2020 11:51:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ZM23mYdiljPD8Fq0s33QKRLiJBFcywHG+JuWV8thfEU=;
 b=IG4pkxyKeSQjUwC7tP8inCIz9ylYcnwe/MI45/t7fmdtcJPEVYqsAkUXpcFjx8E6M+z+
 d5n/1EyZ54ZCrbMRu0cjPXe0v+e/z5t2/HYliWut/TLQvENatXn2mNRgBONlDqn5JcmX
 0F3Cf43AC4/VIQ/4L1GRFGm3+hfWRbqnfhEF657JMDhyoQnaT6yuLu1L/xHJMcNWttm0
 X81n7mZomgPkhQ+A2IuiNoaBMNH4YxCypp1RoDTTbwFqvPiU00oatPmP6dO+jDGCpGvi
 XWit7vPuH8pzEOUngsR4XuxUN7d4Hp7b1l5Kgs2Em8tX+/h1FAVuBnudWFeVi23X/y+u Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33gkf9f8g1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Sep 2020 11:51:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9AAAB10002A;
        Tue, 15 Sep 2020 11:51:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C3132A5C0F;
        Tue, 15 Sep 2020 11:51:04 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.50) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 15 Sep
 2020 11:51:03 +0200
Subject: Re: [PATCH v2 0/3] Expose recovery/coredump configuration from sysfs
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "tsoni@codeaurora.org" <tsoni@codeaurora.org>,
        "psodagud@codeaurora.org" <psodagud@codeaurora.org>,
        "sidgup@codeaurora.org" <sidgup@codeaurora.org>
References: <1598557731-1566-1-git-send-email-rishabhb@codeaurora.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <7ad40d80-5ac4-97a5-5e05-c83dc08896a2@st.com>
Date:   Tue, 15 Sep 2020 11:51:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1598557731-1566-1-git-send-email-rishabhb@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-15_05:2020-09-15,2020-09-15 signatures=0
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rishabh,

On 8/27/20 9:48 PM, Rishabh Bhatnagar wrote:
> From Android R onwards Google has restricted access to debugfs in user
> and user-debug builds. This restricts access to most of the features
> exposed through debugfs. This patch series adds a configurable option
> to move the recovery/coredump interfaces to sysfs. If the feature
> flag is selected it would move these interfaces to sysfs and remove
> the equivalent debugfs interface. 'Coredump' and 'Recovery' are critical
> interfaces that are required for remoteproc to work on Qualcomm Chipsets.
> Coredump configuration needs to be set to "inline" in debug/test build
> and "disabled" in production builds. Whereas recovery needs to be
> "disabled" for debugging purposes and "enabled" on production builds.

The remoteproc_cdev had been created to respond to some sysfs limitations.
I wonder if this evolution should not also be implemented in the cdev.
In this case an additional event could be addedd to inform the application
that a crash occurred and that a core dump is available.

Of course it's only a suggestion... As it would be a redesign.
I let Björn and Mathieu comment.

Regards,
Arnaud

> 
> Changelog:
> 
> v1 -> v2:
> - Correct the contact name in the sysfs documentation.
> - Remove the redundant write documentation for coredump/recovery sysfs
> - Add a feature flag to make this interface switch configurable.
> 
> Rishabh Bhatnagar (3):
>   remoteproc: Expose remoteproc configuration through sysfs
>   remoteproc: Add coredump configuration to sysfs
>   remoteproc: Add recovery configuration to sysfs
> 
>  Documentation/ABI/testing/sysfs-class-remoteproc |  44 ++++++++
>  drivers/remoteproc/Kconfig                       |  12 +++
>  drivers/remoteproc/remoteproc_debugfs.c          |  10 +-
>  drivers/remoteproc/remoteproc_sysfs.c            | 126 +++++++++++++++++++++++
>  4 files changed, 190 insertions(+), 2 deletions(-)
> 
