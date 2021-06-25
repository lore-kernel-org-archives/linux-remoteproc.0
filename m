Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0A4C2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 07:27:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02686613EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 07:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbhFYH3f (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 25 Jun 2021 03:29:35 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:16656 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229616AbhFYH3e (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Jun 2021 03:29:34 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15P7IPas013167;
        Fri, 25 Jun 2021 09:27:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=BTGKsvUSUhdoLzovWKZXPnQ+NIY4Pr0YS4UnDtP45Qc=;
 b=27dvD5Pvxn0AstuEmfukPmWZnGdIGCNCl8F/JGOGCoquXrLtfU9s+SK0eDkff6R7MX1m
 nBJb8MglXkKiKlNO1KzIySJcY71abu//Rs6WemUceNWII+8znJcjl6URIx95Z1+saoXF
 LpK2/xNgu13EFeBBK15fjAi6y2IKE5ne3TZ90nkWsKYip+ObX+0I9RvdFptLRPuPnbWg
 rLaT3tMvwkqAg9wEGSM3oKx5ak5NV1by3ppBDTsSsJhZ791pRhpaXOiQHrZmUE3hbVhD
 C3UiyLOgHe9wc4SHrVAlPkrI/Ktw1YnLMlwSnIw6agSrPTlD+rVsw5lQ5V1mTh1vEZwL tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39d22m2esw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 25 Jun 2021 09:27:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6626E10002A;
        Fri, 25 Jun 2021 09:27:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 507D2214D0B;
        Fri, 25 Jun 2021 09:27:10 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 25 Jun
 2021 09:27:09 +0200
Subject: Re: remoteproc DMA API abuse status
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Christoph Hellwig <hch@lst.de>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210623134307.GA29505@lst.de> <20210624193514.GA1090275@p14s>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <011dac94-cfe0-d276-980a-b8ffe1447521@foss.st.com>
Date:   Fri, 25 Jun 2021 09:27:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624193514.GA1090275@p14s>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-25_02:2021-06-24,2021-06-25 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Mathieu,

On 6/24/21 9:35 PM, Mathieu Poirier wrote:
> Good day Christoph,
> 
> On Wed, Jun 23, 2021 at 03:43:07PM +0200, Christoph Hellwig wrote:
>> Hi remoteproc maintainers,
>>
>> did you make any progress to get remoteproc out of creating fake
>> devices that fake their dma ops status and the abuse of
>> dma_declare_coherent_memory in removeproc_virtio?  I remember we had
>> a discussion on this a long time ago, and there was an unfinished
>> patchset to change the memory pool handling.  What happened to all that?
> 
> I believe the conversation and patchset you are referring to are pre-dating my
> time in this subsystem.  To make sure I am looking at the right thing, can you
> (or anyone else) point me to that discussion and related patches?

2 references:

1)Previous discussion thread on the topic:

https://patchwork.kernel.org/project/linux-remoteproc/patch/AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch/

2) My patchset related to the refactoring of remoteproc virtio which tries to
address the point by creating a remoteproc platform driver and declaring a
virtio subnode in the device tree remoteproc node.

https://lkml.org/lkml/2020/4/16/1817

No time yet on my side to come back on the patchset :(

Regards,
Arnaud

> 
> Thanks,
> Mathieu
> 
