Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2302C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:41:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C3B364F0D
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:41:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbhBZQlk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 26 Feb 2021 11:41:40 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:40826 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229769AbhBZQlj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 26 Feb 2021 11:41:39 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11QGR2fZ025164;
        Fri, 26 Feb 2021 17:40:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=o+3X4BLuP5e42GOpScJQqAr//WbdMHgL/Zpk/eGJKqA=;
 b=ynektlSvURU73KKGUMj/mpyXAaO0ThH4BZC0kKl1+WOcgoUYaNJ42V+1uVjAHX6yOf7L
 WOZhDeUDi2PCWG4CVzTeNQze+Rb/IuIL6LQyDXhowIYCjGVgfyhTauPdZ8laxvZEmtsf
 BFGmK3t/cIDat9P5TZ+vKU5HbIQo3XcUBdlFEIr6SXchGNhM51wn80srGoO2u2A7Qs+z
 kpAY04eOdQHp7zDlofSDAQjQs+YT8OG3ZnKx4V2o1uqyTcSCRrswyCeIJxW34fU/8LOM
 0Euaq3nLx2dFlLIYCOtQMWY7G5KSLB8O/5xe+csl9kbZ5DBM8hIjQhaoqa13urv6zAZ2 Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36w66vxuud-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Feb 2021 17:40:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 694B5100038;
        Fri, 26 Feb 2021 17:40:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5693B24163A;
        Fri, 26 Feb 2021 17:40:51 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 17:40:50 +0100
Subject: Re: [PATCH v6 00/16] remoteproc: Add support for detaching a remote
 processor
To:     Mathieu Poirier <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>, <arnaud.pouliquen@st.com>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <af614b83-de31-f8fe-8b7d-181a71886aa0@foss.st.com>
Date:   Fri, 26 Feb 2021 17:40:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-26_05:2021-02-26,2021-02-26 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 2/24/21 12:34 AM, Mathieu Poirier wrote:
> Following the work done here [1], this set provides support for the
> remoteproc core to release resources associated with a remote processor
> without having to switch it off. That way a platform driver can be removed
> or the application processor power cycled while the remote processor is
> still operating.
> 
> Modifications for this revision are detailed in the changelog of each patch
> but the main difference is that going from RPROC_RUNNING -> RPROC_DETACHED
> is no longer supported to avoid dealing tricky resource table issues.

This seems reasonable to me. If necessary, this could be part of a separate series.

From test point of view, it is working pretty well on my side.

Thanks,
Arnaud

> 
> Applies cleanly on rproc-next (e8b4e9a21af7).  I will rebase on 5.12-rc1 when it
> comes out next week.
> 
> Thanks,
> Mathieu
> 
> Arnaud POULIQUEN (1):
>   remoteproc: stm32: Move memory parsing to rproc_ops
> 
> Mathieu Poirier (15):
>   remoteproc: Remove useless check in rproc_del()
>   remoteproc: Rename function rproc_actuate()
>   remoteproc: Add new RPROC_ATTACHED state
>   remoteproc: Properly represent the attached state
>   remoteproc: Add new get_loaded_rsc_table() to rproc_ops
>   remoteproc: stm32: Move resource table setup to rproc_ops
>   remoteproc: Add new detach() remoteproc operation
>   remoteproc: Introduce function __rproc_detach()
>   remoteproc: Introduce function rproc_detach()
>   remoteproc: Properly deal with the resource table when attached
>   remoteproc: Properly deal with a kernel panic when attached
>   remoteproc: Properly deal with a start request when attached
>   remoteproc: Properly deal with a stop request when attached
>   remoteproc: Properly deal with a detach request when attached
>   remoteproc: Refactor rproc delete and cdev release path
> 
>  drivers/remoteproc/remoteproc_cdev.c     |  21 +-
>  drivers/remoteproc/remoteproc_core.c     | 263 ++++++++++++++++++++---
>  drivers/remoteproc/remoteproc_internal.h |  10 +
>  drivers/remoteproc/remoteproc_sysfs.c    |  17 +-
>  drivers/remoteproc/stm32_rproc.c         | 168 +++++++--------
>  include/linux/remoteproc.h               |  21 +-
>  6 files changed, 362 insertions(+), 138 deletions(-)
> 
