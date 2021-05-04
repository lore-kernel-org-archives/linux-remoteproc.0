Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0E1C433ED
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 07:16:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB3B2611AC
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 07:16:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhEDHRL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 May 2021 03:17:11 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:17780 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229879AbhEDHRK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 May 2021 03:17:10 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1447CW2p009695;
        Tue, 4 May 2021 09:16:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=afUJ1/rQV4J1imx9Ghnfc7q+Lf/2kuHrWmKNabgOpLc=;
 b=nVaOHo3EnC0GDJ4dz7Yk7Zf1o4ABe2v755RO3PqIg1ok0rjh86+n1yJOrakIBJMOHeti
 0N+e9sS1fA+zO05mQK2oABqVCjXq33C69KQt0epK/VDs3WjXEa7eLuJ9+wvoP42xHxDY
 dguu3aAuJjz4SizwDvJsGV6G6LyfFQCQE7o8tO1V0sfafkDkMFNN4AzWG/76DQyUcpSR
 sw5VMFQxRyjRsPoH9PEKhxbaOVEkOcufj9Q1C86br/hw5hCLH/eojaA4E7pIYYpj1Bkm
 faknIItrA77RSQVs2gV9nqkdYZLwKZJ2aljbS0fxsfGdD35lTZbXGCxRjYDpvbPOyxjT Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38ar8djn9m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 May 2021 09:16:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0AF5A10002A;
        Tue,  4 May 2021 09:16:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EDF4520E5DD;
        Tue,  4 May 2021 09:16:11 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May
 2021 09:16:11 +0200
Subject: Re: [PATCH] rpmsg: char: Remove useless includes
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210429080639.6379-1-arnaud.pouliquen@foss.st.com>
 <20210503174238.GD1699665@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <b2f6b9ca-9dc2-920b-941d-175779bc1034@foss.st.com>
Date:   Tue, 4 May 2021 09:16:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210503174238.GD1699665@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-04_02:2021-05-04,2021-05-04 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Mathieu,

On 5/3/21 7:42 PM, Mathieu Poirier wrote:
> On Thu, Apr 29, 2021 at 10:06:39AM +0200, Arnaud Pouliquen wrote:
>> Remove includes that are not requested to build the module.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> applied without issue on Bjorn next branch (dc0e14fa833b)
>> ---
>>  drivers/rpmsg/rpmsg_char.c | 9 ---------
>>  1 file changed, 9 deletions(-)
>>
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>> index 2bebc9b2d163..e4e54f515af6 100644
>> --- a/drivers/rpmsg/rpmsg_char.c
>> +++ b/drivers/rpmsg/rpmsg_char.c
>> @@ -10,19 +10,10 @@
>>   * was based on TI & Google OMX rpmsg driver.
>>   */
>>  #include <linux/cdev.h>
>> -#include <linux/device.h>
> 
> This is where the declaration for struct device is along with other goodies like
> get/put_device().
> 
>> -#include <linux/fs.h>
> 
> That is where struct file is declared.
> 
>> -#include <linux/idr.h>
> 
> This is where you get ida_simple_get() and ida_simple_remove() from.
> 
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>> -#include <linux/poll.h>
> 
> This is where struct poll_table and poll_wait() comes from.
> 
>>  #include <linux/rpmsg.h>
>>  #include <linux/skbuff.h>
>> -#include <linux/slab.h>
> 
> This gives you kzalloc() and kfree().
> 
>> -#include <linux/uaccess.h>
> 
> This gives you copy_from_user().
> 
>> -#include <uapi/linux/rpmsg.h>
> 
> This gives you RPMSG_CREATE_EPT_IOCTL and RPMSG_DESTROY_EPT_IOCTL.
> 
>> -
>> -#include "rpmsg_internal.h"
> 
> That one I agree with.

I started by this one and then I got carried away tested the other include...
You are right, I just don't follow her the first rule of the "submit checklist"

"If you use a facility then #include the file that defines/declares that
facility. Don’t depend on other header files pulling in ones that you use."

That said I just have a doubt for uapi/linux/rpmsg.h that will be include
by rpmsg.h[2], as these includes are part of the rpmsg framework API, should we
keep both, considering the rule as strict?

[1] https://www.kernel.org/doc/html/latest/process/submit-checklist.html
[2]
https://patchwork.kernel.org/project/linux-remoteproc/patch/20210311140413.31725-3-arnaud.pouliquen@foss.st.com/

Thanks,
Arnaud

> 
> Thanks,
> Mathieu
> 
>>  
>>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
>>  
>> -- 
>> 2.17.1
>>
