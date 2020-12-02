Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FB1C71155
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Dec 2020 18:16:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10651205F4
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Dec 2020 18:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgLBSPe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Dec 2020 13:15:34 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:6168 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727193AbgLBSPd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Dec 2020 13:15:33 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B2I6wh6029053;
        Wed, 2 Dec 2020 19:14:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=IHMm0cjK3eOhtNxeby0JUJ/xysp13KMNTZpGx5FB/i4=;
 b=MOIjqtIojG1qXzPtXeep1E4QAsRYcVURS4/JTKn8wpEb7izKb8yvgq3HGGEK3bToJkrJ
 DLPy0u8noBFuBIp37ZY9omsCnC/hZdTUAl3EIeHbXKkZ8hInsGqtXA//atdDlPWw3nNh
 s9YhlVaFhqxsKg66/FM20cFfJEYpJWNk+w6dGtxvrG6+SmltXL3tLVGjjzJNEDHExw81
 DnURP9LoQzP44OCvfqdqFa2Fb5CPheSO8L57CbuFvGdkJuuc8pGDNa5Sfded7hjzWU1C
 zTkRXB6LcNXiy+WzFc7i+vBdPLBGW+g/7WZOIuQpl4IlOKyDi73amJoZColMkS4VwAYj uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 355w3cd384-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Dec 2020 19:14:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B34110002A;
        Wed,  2 Dec 2020 19:14:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3CFD0225F18;
        Wed,  2 Dec 2020 19:14:47 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec
 2020 19:14:46 +0100
Subject: Re: [PATCH v3 13/15] remoteproc: Properly deal with a start request
 when attached
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
 <20201126210642.897302-14-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <24a902d1-f2e5-2318-16bc-202955fcfe28@st.com>
Date:   Wed, 2 Dec 2020 19:14:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201126210642.897302-14-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-02_10:2020-11-30,2020-12-02 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 11/26/20 10:06 PM, Mathieu Poirier wrote:
> This patch takes into account scenarios where a remote processor
> has been attached to when receiving a "start" command from sysfs.
> 
> As with the "running" case, the command can't be carried out if the
> remote processor is already in operation.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>


Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> ---
>  drivers/remoteproc/remoteproc_cdev.c  | 3 ++-
>  drivers/remoteproc/remoteproc_sysfs.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> index d06f8d4919c7..61541bc7d26c 100644
> --- a/drivers/remoteproc/remoteproc_cdev.c
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -32,7 +32,8 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
>  		return -EFAULT;
>  
>  	if (!strncmp(cmd, "start", len)) {
> -		if (rproc->state == RPROC_RUNNING)
> +		if (rproc->state == RPROC_RUNNING ||
> +		    rproc->state == RPROC_ATTACHED)
>  			return -EBUSY;
>  
>  		ret = rproc_boot(rproc);
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 3696f2ccc785..7d281cfe3e03 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -194,7 +194,8 @@ static ssize_t state_store(struct device *dev,
>  	int ret = 0;
>  
>  	if (sysfs_streq(buf, "start")) {
> -		if (rproc->state == RPROC_RUNNING)
> +		if (rproc->state == RPROC_RUNNING ||
> +		    rproc->state == RPROC_ATTACHED)
>  			return -EBUSY;
>  
>  		ret = rproc_boot(rproc);
> 
