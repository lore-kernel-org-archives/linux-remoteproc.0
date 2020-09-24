Return-Path: <SRS0=drqN=DB=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928CDC4346E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Sep 2020 08:02:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30B3420B1F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Sep 2020 08:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="llMOrdYo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgIXIC6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:02:58 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:35518 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727013AbgIXIC6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Sep 2020 04:02:58 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08O81uVe022453;
        Thu, 24 Sep 2020 10:02:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=bCUBFmWtTPnQyN/Hu8xkI73KOtRV/y37x8FA0MEEGc0=;
 b=llMOrdYoJzW79whZF/bf6pCncPh2n5rzm25bAt0PRELvjaNQqfoSaECwKw9Fjl0jc8jl
 aviNvJI1M3n9uGOLp0vdSWEa0uhOlYyfJLWDo36N6D5GG0+CIeJ/LrHEekDZEHAw+MEP
 5xsMxLaEgDifVPQL3zvw1Llrs1riSu1QNQn4xFJNL/ckd8BdT2pE1MB0K0WcDJB/AdBI
 gZr6Mr4Wzk+dHWDFL7gt2hI8kQpkgXdXeTyswpJu0GeAJbEyI3UcAasCQkGWj6GJpRDV
 IK5zojwBI5DDHERAQbf4NKyEXE1Dsq77qmHoIkVW2EVrXaf8tF3DKk+cWp6QSjdAS7ol tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33n8vf43f4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 24 Sep 2020 10:02:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BFD510002A;
        Thu, 24 Sep 2020 10:02:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DFE8A21FEB1;
        Thu, 24 Sep 2020 10:02:44 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.48) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Sep
 2020 10:02:43 +0200
Subject: Re: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: update stm32mp151 for
 remote proc synchronisation support
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Alexandre TORGUE <alexandre.torgue@st.com>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20200827072101.26588-1-arnaud.pouliquen@st.com>
 <20200827072101.26588-4-arnaud.pouliquen@st.com>
 <be888a4b-b931-521b-42c7-fd4e60afd945@pengutronix.de>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <c8fbe2df-a648-913a-d9f9-19e2202f1687@st.com>
Date:   Thu, 24 Sep 2020 10:02:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <be888a4b-b931-521b-42c7-fd4e60afd945@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-24_05:2020-09-24,2020-09-24 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Ahmad,

On 9/24/20 7:45 AM, Ahmad Fatoum wrote:
> Hello Arnaud,
> 
> On 8/27/20 9:21 AM, Arnaud Pouliquen wrote:
>> Two backup registers are used to store the Cortex-M4 state and the resource
>> table address.
>> Declare the tamp node and add associated properties in m4_rproc node
>> to allow Linux to attach to a firmware loaded by the first boot stages.
>>
>> Associated driver implementation is available in commit 9276536f455b3
>> ("remoteproc: stm32: Parse syscon that will manage M4 synchronisation").
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>  arch/arm/boot/dts/stm32mp151.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
>> index bfe29023fbd5..842ecffae73a 100644
>> --- a/arch/arm/boot/dts/stm32mp151.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
>> @@ -1541,6 +1541,11 @@
>>  			status = "disabled";
>>  		};
>>  
>> +		tamp: tamp@5c00a000 {
>> +			compatible = "st,stm32-tamp", "syscon";
>> +			reg = <0x5c00a000 0x400>;
>> +		};
>> +
> 
> Just saw this now. I have a pending patch adding this node as well:
> https://lore.kernel.org/patchwork/patch/1306971/
> 
> For my use case, I need a "simple-mfd" compatible to allow child
> nodes to be probed.
> 
> Could you CC me when you send out your v2, so I can rebase?
> (Or if you don't mind, just add the "simple-mfd" into the compatible
> list yourself :-)

I prefer that you propose the "simple-mfd" compatibility. I do not master the
consequence of adding it...
I will add you in cc of my v2 , but as your patch could trig some discussions
I would suggest to send in advance a patchset including this patch and your patch
on top of, just add a reference to this series in the cover letter and explain
potential impact (or non impact) on the legacy.

Regards,
Arnaud
 
> 
> Cheers
> Ahmad
> 
>>  		/*
>>  		 * Break node order to solve dependency probe issue between
>>  		 * pinctrl and exti.
>> @@ -1717,6 +1722,8 @@
>>  			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
>>  			st,syscfg-tz = <&rcc 0x000 0x1>;
>>  			st,syscfg-pdds = <&pwr_mcu 0x0 0x1>;
>> +			st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>> +			st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>>  			status = "disabled";
>>  		};
>>  	};
>>
> 
