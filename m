Return-Path: <SRS0=9bPA=DG=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC9DC4346E
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Sep 2020 08:44:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F307C206A2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Sep 2020 08:44:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="flWHTWDX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgI2Iop (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Sep 2020 04:44:45 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:55479 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725826AbgI2Iop (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Sep 2020 04:44:45 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08T8hJN1012901;
        Tue, 29 Sep 2020 10:44:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=KqUvozA/JR3y08fUfkqMtKFt3RT984BzYpCu5n3nbFw=;
 b=flWHTWDX3xXKaG8D7S5up2Ky9noBdO5mwetG9HgbDwWIuciIp2T9BAdWn1QII6ZdNpZV
 /Mo918Wx8+dKiSZpb00jcgHxAkxKm3gacW9M6/U6EJJ9vLBYBhnqbKDFOHQ4VAHUgAIU
 jIYCQIfVqPUa7TmYUj6qJEVjwMqVJOBuSRjGgH5z03HhgPoDCsgwlYkMqksoPDsIX0CK
 4+ZeiRlDljZ/WaNBDpcNi0f2W46mVnrnOwdLZma/aOMlFqSJ7hv+tycQSxnUntmh/83/
 gPqUzV/3Gd9/TcA+unNfc8j2MWQnF9LkgE6BFaRsarxYOH+yMXnVNoTHlo1va9uQqMqW 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33su3yqkkt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Sep 2020 10:44:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 224DF100034;
        Tue, 29 Sep 2020 10:44:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0711221E67E;
        Tue, 29 Sep 2020 10:44:38 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.46) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 29 Sep
 2020 10:44:20 +0200
Subject: Re: [PATCH v6 0/3] Move recovery/coredump configuration to sysfs
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "tsoni@codeaurora.org" <tsoni@codeaurora.org>,
        "psodagud@codeaurora.org" <psodagud@codeaurora.org>,
        "sidgup@codeaurora.org" <sidgup@codeaurora.org>
References: <1601331456-20432-1-git-send-email-rishabhb@codeaurora.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <8222f5fa-2acc-a765-a728-6aad9ed88068@st.com>
Date:   Tue, 29 Sep 2020 10:44:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1601331456-20432-1-git-send-email-rishabhb@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-29_01:2020-09-29,2020-09-29 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 9/29/20 12:17 AM, Rishabh Bhatnagar wrote:
> From Android R onwards Google has restricted access to debugfs in user
> and user-debug builds. This restricts access to most of the features
> exposed through debugfs. 'Coredump' and 'Recovery' are critical
> interfaces that are required for remoteproc to work on Qualcomm Chipsets. 
> Coredump configuration needs to be set to "inline" in debug/test builds
> and "disabled" in production builds. Whereas recovery needs to be
> "disabled" for debugging purposes and "enabled" on production builds.
> This patch series removes the recovery/coredump entries from debugfs
> and moves them to sysfs. Also, this disables the coredump collection
> by default as this is a requirement for production devices.
> 
> Changelog:
> 
> v6 -> v5:
> - Disable coredump collection by default
> - Rename the "default" configuration to "enabled" to avoid confusion
> 
> v5 -> v4:
> - Fix the cover-letter of tha patch series.
> 
> v4 -> v3:
> - Remove the feature flag to expose recovery/coredump
> 
> v3 -> v2:
> - Remove the coredump/recovery entries from debugfs

Sorry i missed this and some associated discussion in V2...

I have also some concerns about the ABI breaks.
In ST and I suppose in several companies we have some 
test environments that use the debugfs to generate and/or get
the core dump.

Even if the stability of the debugfs is not guaranteed it would
be nice to keep both interface.

It seems that it is possible to create symbolic link in the debugfs
thanks to the "debugfs_create_symlink" function.
This seems allowing to keep files in both place without duplicating the code.
To be honest i have never used this function so I'm not 100% sure that this
would do the job...
But if you think that this could be a good compromise, i can test it.

Regards,
Arnaud

> - Expose recovery/coredump from sysfs under a feature flag
> 
> v1 -> v2:
> - Correct the contact name in the sysfs documentation.
> - Remove the redundant write documentation for coredump/recovery sysfs
> - Add a feature flag to make this interface switch configurable.
> 
> Rishabh Bhatnagar (3):
>   remoteproc: Move coredump configuration to sysfs
>   remoteproc: Move recovery configuration to sysfs
>   remoteproc: Change default dump configuration to "disabled"
> 
>  Documentation/ABI/testing/sysfs-class-remoteproc |  46 +++++++
>  drivers/remoteproc/remoteproc_coredump.c         |   6 +-
>  drivers/remoteproc/remoteproc_debugfs.c          | 168 -----------------------
>  drivers/remoteproc/remoteproc_sysfs.c            | 120 ++++++++++++++++
>  include/linux/remoteproc.h                       |   8 +-
>  5 files changed, 173 insertions(+), 175 deletions(-)
> 
