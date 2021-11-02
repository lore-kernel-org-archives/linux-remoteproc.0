Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01C4C433FE
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 10:54:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EF9A60F24
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 10:54:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhKBK53 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Nov 2021 06:57:29 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57116 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229577AbhKBK53 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Nov 2021 06:57:29 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A27KWag027459;
        Tue, 2 Nov 2021 11:54:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=F3zslvwLhHMv15l+DDp1BP8HK4d2H8Odbk6ORCpvSWM=;
 b=4+RNds1W1D6p9AXQqCyxrSLALcHZ+vLrsPJBZ6WVQvxYuznQMcqnGuUfK0jJJ4il4Rly
 xbUyNvUWI3JyFe05zy6gkdA0lmP9g7m6o83G+kCa/07678UqBsjgQSo5g3b7b5CS/NaZ
 APLE+CEwYIj3DpVyxlYJ4mWiDmx4WHjtMtW5rvXn4RCHPpYm3KxkBkJ7YrQ3D9y6quIq
 CV994KH5lLOUKVamJtmocmLDT/ialwaRUM3SY2ncGC7O1N7ivEVZ5xJ28JYfP53kwLyv
 BuHiPDQ1KUS4fnMjWadXsieARNUDGVXJKetTj91+T0Ew0zrVI8IApapnALXthhN8wEdL rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c30uvhbwa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 Nov 2021 11:54:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DC1210002A;
        Tue,  2 Nov 2021 11:54:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D729921667C;
        Tue,  2 Nov 2021 11:54:38 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 2 Nov
 2021 11:54:38 +0100
Subject: Re: [PATCH v10 0/2] Add rpmsg tty driver
To:     Jiri Slaby <jirislaby@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suman Anna <s-anna@ti.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>
References: <20211015094701.5732-1-arnaud.pouliquen@foss.st.com>
 <0b42eede-d909-1afb-f3fc-c4ee1e2fc0f4@kernel.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <dae498c3-3460-e493-564e-bc903e4aa5b8@foss.st.com>
Date:   Tue, 2 Nov 2021 11:54:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0b42eede-d909-1afb-f3fc-c4ee1e2fc0f4@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_06,2021-11-02_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Jiri,

On 11/1/21 8:27 AM, Jiri Slaby wrote:
> On 15. 10. 21, 11:46, Arnaud Pouliquen wrote:
> ...
>>   drivers/rpmsg/rpmsg_core.c       |  21 +++
>>   drivers/rpmsg/rpmsg_internal.h   |   2 +
>>   drivers/rpmsg/virtio_rpmsg_bus.c |  10 ++
>>   drivers/tty/Kconfig              |  12 ++
>>   drivers/tty/Makefile             |   1 +
>>   drivers/tty/rpmsg_tty.c          | 274 +++++++++++++++++++++++++++++++
>>   include/linux/rpmsg.h            |  10 ++
> 
> Hi,
> 
> care to add an entry to MAINTAINERS too?

That's a good point. I will send a patch to propose myself as maintainer.

Thanks,
Arnaud

> 
> thanks,
