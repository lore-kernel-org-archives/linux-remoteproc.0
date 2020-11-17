Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF8BC2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 Nov 2020 11:19:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 910FB2222E
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 Nov 2020 11:19:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="k8TUEXKX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727214AbgKQLTU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 Nov 2020 06:19:20 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:30834 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725355AbgKQLTU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 Nov 2020 06:19:20 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AHBHXoJ001043;
        Tue, 17 Nov 2020 12:19:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=GZWSuUJqGwDbLaWZmRkl5XGWfwsCO0u3h+HK1eIJif4=;
 b=k8TUEXKXAHLSoO1ZZDKDh+kfSQER+eqV084jJlEjAl2oZlAyIYH4iWxPyz7shFzcrU3a
 mwXSmKf35Rme1Ye7CtlhNPEfJhMU7FBmZz5prvBg/YJyzY/cAWv3hnUfJACUqpqHe4EN
 pwIMBVC3MWGc0lMLke5rzF6KDGtflHS93mqrbf31c13dV+zqFKi6ZQAoRTRCM46pCjzI
 fCka4G2M6bN4IYKrGNC8RdWP48TOKag0PYcl61h1ukg0KeV53A/Q+QRhyMIYR0WY0QRb
 Doyj6dvJKK1lTXOYWywdlUQDOFZqT1pSG2ahbdTxKllHY960alcSxNba+KBZynfb+TCj Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34t5k50t73-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Nov 2020 12:19:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3538D10002A;
        Tue, 17 Nov 2020 12:19:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18695241A52;
        Tue, 17 Nov 2020 12:19:05 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Nov
 2020 12:19:04 +0100
Subject: Re: [PATCH v2 0/4] ARM: stm32: add DT properties for remote proc
 synchronisation
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Rob Herring <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20201014125441.2457-1-arnaud.pouliquen@st.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <78fc5bed-d541-e095-e9c8-bf3b29bc173b@st.com>
Date:   Tue, 17 Nov 2020 12:18:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201014125441.2457-1-arnaud.pouliquen@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-17_03:2020-11-17,2020-11-17 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud

On 10/14/20 2:54 PM, Arnaud Pouliquen wrote:
> This series implements the DT part associated to the commit 9276536f455b3
> ("remoteproc: stm32: Parse syscon that will manage M4 synchronisation")
> 
> Delta vs V1 [1]
> - add Rob acked-by on patch 1/4
> - simplify yaml descriptions and align other syscon descriptions
> 
> [1]https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=339339
> 
> Arnaud Pouliquen (4):
>    dt-bindings: arm: stm32: Add compatible for syscon tamp node
>    dt-bindings: remoteproc: stm32_rproc: update for firmware
>      synchronization
>    dt-bindings: remoteproc: stm32_rproc: update syscon descriptions
>    ARM: dts: stm32: update stm32mp151 for remote proc synchronization
>      support
> 
>   .../bindings/arm/stm32/st,stm32-syscon.yaml   |  1 +
>   .../bindings/remoteproc/st,stm32-rproc.yaml   | 21 +++++++++++++------
>   arch/arm/boot/dts/stm32mp151.dtsi             |  7 +++++++
>   3 files changed, 23 insertions(+), 6 deletions(-)
> 

DT patch applied on stm32-next.

regards
Alex
