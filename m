Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8C4C433ED
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 18:20:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74E1C613CD
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 18:20:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbhEDSV1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 May 2021 14:21:27 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:30918 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231635AbhEDSV0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 May 2021 14:21:26 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 144I76re007189;
        Tue, 4 May 2021 20:20:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yI6Ml2clRXcMJtwies2mHdCV4zB6gRnE8QVI0zDSqis=;
 b=tisRkZr/wrgdeQPj0Eo0EGJxkyeO64LlJfodSp5ujquOubFeb263JMs4Nl89NfzQqHVE
 8el9w6Xh26K1TOjEkpgXC9N2gUljUiIiQ4AQpChCbbFUb4OmkZUTSBEzAys9wofQx/oP
 48dfcItsx5QvknAiJgIT7zbgECxYweMIcuGtQ/q3Eb3+fn54jfyam3iI3UjcWiOH62hQ
 WuVjVyBhWsLu11hPO4c5gFmnVc9SZn3jGwdLPCBCBe5Lm+RiumvTXHMruUkatLj+GWlU
 ACQeHH8mUPj0/lcDbACKL6uREgoOgvgoGp5doEMi254bBGDApZXaDSVPYiM7RCFh7G5I fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38akujyuf1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 May 2021 20:20:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5947F10002A;
        Tue,  4 May 2021 20:20:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43C12226568;
        Tue,  4 May 2021 20:20:27 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May
 2021 20:20:26 +0200
Subject: Re: [PATCH] rpmsg: char: Remove useless includes
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210429080639.6379-1-arnaud.pouliquen@foss.st.com>
 <20210503174238.GD1699665@xps15>
 <b2f6b9ca-9dc2-920b-941d-175779bc1034@foss.st.com>
 <20210504170530.GD1734971@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <7170fdd0-00cd-1486-7b4c-41040ecfff6f@foss.st.com>
Date:   Tue, 4 May 2021 20:20:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210504170530.GD1734971@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-04_12:2021-05-04,2021-05-04 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 5/4/21 7:05 PM, Mathieu Poirier wrote:
> Hi Arnaud,
> 
> [...]
> 
>>
>> I started by this one and then I got carried away tested the other include...
>> You are right, I just don't follow her the first rule of the "submit checklist"
>>
>> "If you use a facility then #include the file that defines/declares that
>> facility. Don’t depend on other header files pulling in ones that you use."
>>
>> That said I just have a doubt for uapi/linux/rpmsg.h that will be include
>> by rpmsg.h[2], as these includes are part of the rpmsg framework API, should we
>> keep both, considering the rule as strict?
> 
> I red the last paragraph several times I can't understand what you are
> trying to convey.  Please rephrase, provide more context or detail exactly where
> you think we have a problem.

There is no problem, just a question before sending an update.

As you mention the #include "rpmsg_internal.h" line can be removed, I plan to
send a patch V2 for this.

That's said before sending a new version I would like to propose to also remove
the #include  <uapi/linux/rpmsg.h> line.

The rational to remove it is that include/rpmsg.h would already include
<uapi/linux/rpmsg.h> in 5.13 [2]. And looking at some frameworks (e.g I2C, TTY)
the drivers seem to include only the include/xxx.h and not the uapi/linux/xxx.h
in such case.

So my question is should I remove  #include  <uapi/linux/rpmsg.h> line? Or do
you prefer that i keep it?

Hope it is more clear... else please just forget my proposal, I wouldn't want
you to waste too much time for a point of detail.

Thanks,
Arnaud

> 
> Thanks,
> Mathieu
> 
> 
>>
>> [1] https://www.kernel.org/doc/html/latest/process/submit-checklist.html
>> [2]
>> https://patchwork.kernel.org/project/linux-remoteproc/patch/20210311140413.31725-3-arnaud.pouliquen@foss.st.com/
>>
>> Thanks,
>> Arnaud
>>
>>>
>>> Thanks,
>>> Mathieu
>>>
>>>>  
>>>>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>>>>  
>>>> -- 
>>>> 2.17.1
>>>>
