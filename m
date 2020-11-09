Return-Path: <SRS0=udoQ=EP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B1AC2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 08:49:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CDDC206ED
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 08:49:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="HSrBj9bP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgKIItA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 03:49:00 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:60114 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726127AbgKIItA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 03:49:00 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A98mXkK005109;
        Mon, 9 Nov 2020 09:48:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=gswr127pV79PDGvq3mOE0Nu5v+9AQ5VJ4ll6tXITl8E=;
 b=HSrBj9bPeqqEv1ps/7Nv3wVCcFbHr6JohgyxmLLqbyu3bzBwnWPPadhRhtKi/u6iwkuu
 Np0ECpmiBcla+VhI3Tm7aC4rQldSWaHM0xtL6mhoBUwAe9vng4kBou0rCjpa4eWzU3uC
 p58H1Pxyg48XBGjBQnFxRG3Mp2M5qQrx4qPL/W/ghqWJ6AJYSlC8B45DDtak3tm5KDjW
 wHtIMaw2AH5LedvFtDAy8VlrXtdrgIsLev0Qwv2Nk9N2QSfKBueeEYKmwAG7cmTfr/K1
 lQVr2BRMJY89Mwy8pkZG/oCr2y0CQzWOb2QU7kyOGcmxCSWBsa0nD/dFydZCkr686WXd 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nj80gucj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Nov 2020 09:48:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 893CB100034;
        Mon,  9 Nov 2020 09:48:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 702A6230D43;
        Mon,  9 Nov 2020 09:48:53 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 09:48:37 +0100
Subject: Re: [PATCH v5 8/8] rpmsg: Turn name service into a stand alone driver
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201105225028.3058818-1-mathieu.poirier@linaro.org>
 <20201105225028.3058818-9-mathieu.poirier@linaro.org>
 <20201106131545.GA10889@ubuntu> <20201106140028.GB10889@ubuntu>
 <20201106175332.GB3203364@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <e7dedfb6-1e9c-4246-9db1-e14a2e16c68c@st.com>
Date:   Mon, 9 Nov 2020 09:48:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201106175332.GB3203364@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-09_02:2020-11-05,2020-11-09 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Guennadi, Mathieu,

On 11/6/20 6:53 PM, Mathieu Poirier wrote:
> On Fri, Nov 06, 2020 at 03:00:28PM +0100, Guennadi Liakhovetski wrote:
>> On Fri, Nov 06, 2020 at 02:15:45PM +0100, Guennadi Liakhovetski wrote:
>>> Hi Mathieu, Arnaud,
>>>
>>> On Thu, Nov 05, 2020 at 03:50:28PM -0700, Mathieu Poirier wrote:
>>>> From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>>>>
>>>> Make the RPMSG name service announcement a stand alone driver so that it
>>>> can be reused by other subsystems.  It is also the first step in making the
>>>> functionatlity transport independent, i.e that is not tied to virtIO.
>>>
>>> Sorry, I just realised that my testing was incomplete. I haven't tested 
>>> automatic module loading and indeed it doesn't work. If rpmsg_ns is loaded 
>>> it probes and it's working, but if it isn't loaded and instead the rpmsg 
>>> bus driver is probed (e.g. virtio_rpmsg_bus), calling 
>>> rpmsg_ns_register_device() to create a new rpmsg_ns device doesn't cause 
>>> rpmsg_ns to be loaded.
>>
>> A simple fix for that is using MODULE_ALIAS("rpmsg:rpmsg_ns"); in rpmsg_ns.c 
>> but that alone doesn't fix the problem completely - the module does load then 
>> but not quickly enough, the NS announcement from the host / remote arrives 
>> before rpmsg_ns has properly registered. I think the best solution would be 
>> to link rpmsg_ns.c together with rpmsg_core.c. You'll probably want to keep 
>> the module name, so you could rename them to just core.c and ns.c.
> 
> I'm pretty sure it is because virtio_device_ready() in rpmsg_probe() is called
> before the kernel has finished loading the name space driver.  There has to be
> a way to prevent that from happening - I will investigate further.

Right, no dependency is set so the rpmsg_ns driver is never probed...
And  name service announcement messages are dropped if the service is not present.

if rpmsg_virtio_bus is built-in
-> using "select RPMSG_NS" in RPMSG_VIRTIO kconfig should ensure that rpmsg_ns is also built-in 
if rpmsg_virtio_bus is build as module rpmsg_ns.ko should be loaded first.
-> MODULE_SOFTDEP could be used in virtio_rpmsg_bus.c

Thanks,
Arnaud

> 
> Thanks for reporting this,
> Mathieu
> 
>>
>> Thanks
>> Guennadi
