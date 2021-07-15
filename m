Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFD2C47E48
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Jul 2021 15:17:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B2EB613D1
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Jul 2021 15:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238643AbhGOPUF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Jul 2021 11:20:05 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:51766 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232994AbhGOPUF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Jul 2021 11:20:05 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16FFCAr2025316;
        Thu, 15 Jul 2021 17:17:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6AuPIvPC0e4Jj6MaY2nbVdaznRVtBzyFnECY1u8Uo40=;
 b=i4vi2MHt7MEUOlYT/yLTfYf8/eNpnqujEbk7OIShASyW3UPqBWFFlkq4KeOBDFc01Jy7
 4+983uBaf+L1wRnReOouKw4OnAnoyFPim+CC0AmMh88u597HstRGQIp6FZpHfqxtZJ8D
 9mcaBmBok4Y8tZXMy4dqP0RxI2NU5QJ76SKubMTo45dG3VMap4qSoL/xJlATye64z+of
 iz6rT3er60l9tdSvcT6YlGAZFnh+d7NIn+XD4k+RkJqRzhfJFOqmRLDPZz8O8SpAlhtr
 nB2JDgVHtQ2LXHkovynHo5A2yt1lGspmcUvRTEUMMUNMMoo+9yCgY9P6qRA0mlf2EI74 DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39tac3v6au-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Jul 2021 17:17:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8023A10002A;
        Thu, 15 Jul 2021 17:17:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C2A02291D7;
        Thu, 15 Jul 2021 17:17:01 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Jul
 2021 17:16:35 +0200
Subject: Re: [PATCH 0/2] Add new IPCC mailbox to support the coprocessor
 detach on some stm32mp15x boards
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210614164940.27153-1-arnaud.pouliquen@foss.st.com>
From:   Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <40d3f649-f56e-15bd-f7ef-59c62028c317@foss.st.com>
Date:   Thu, 15 Jul 2021 17:16:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210614164940.27153-1-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-15_10:2021-07-14,2021-07-15 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud

On 6/14/21 6:49 PM, Arnaud Pouliquen wrote:
> Purpose:
>    Add the IPCC channel 4 as "detach" mailbox to support the remoteproc the feature added in [1].
> 
>    The enable of this feature is a design choice. As consequence, the new mbox is declared
>    only for stm32mp157c-ed1 & stm32mp15x-dkx boards maintained by ST Microelectronics.
> 
> Aim:
>    Allow to send to the remote processor a HW signal on IPCC channel 4 when user space requests
>    to detach the main processor from the remote processor (e.g. a reboot of the  Linux processor
>    on a crash).
> 
> [1] https://patchwork.ozlabs.org/project/devicetree-bindings/cover/20210331073347.8293-1-arnaud.pouliquen@foss.st.com/
> 
> Arnaud Pouliquen (2):
>    ARM: dts: stm32: Add coprocessor detach mbox on stm32mp157c-ed1 board
>    ARM: dts: stm32: Add coprocessor detach mbox on stm32mp15x-dkx boards
> 
>   arch/arm/boot/dts/stm32mp157c-ed1.dts  | 4 ++--
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 

Series Applied on stm32-next;

thanks
Alex
