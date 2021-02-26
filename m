Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBE4C433E6
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:22:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A263F64EF6
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:22:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhBZQWr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 26 Feb 2021 11:22:47 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:2876 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230146AbhBZQWc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 26 Feb 2021 11:22:32 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11QG7i3N014846;
        Fri, 26 Feb 2021 17:21:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=vKUjuCfKomRiLIaHaqmUsJrHpfHVL4Esk5IZPPw6i5s=;
 b=zRLBVxlKQPTJ2C9ZlgqkSgpGj5I/GQv4bJeXvbehhvtJzJqitjHg2XKLEvuYB5n4uknG
 5l5GRxEFF35h8l6b6pkf9FX4Zh1W88t5u1tTh7DJ2YaayrtwmLAY5Avx0GFVNBMzj9OV
 L9YNe3skHSUFIvopTkphfk7XxjzOLJ70PCObCdKCOvZFe2kU941fjLGpJKBL3Aazi92j
 fxsGpBAAYSHP1OcvE9l01T9EbjsoHKRa0AkfnAQyvivJ0lEjUAOL+jY5Uz+L7DwM7bgM
 0aRJ20HGNRTmaYTzQrhH99GWA3B9WremflLzcHhKgO5nhQZ2y0Xoso5X/f7KcW32gnzI Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36w66yeqk7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Feb 2021 17:21:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A07C10002A;
        Fri, 26 Feb 2021 17:21:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0BB0D2BA2C3;
        Fri, 26 Feb 2021 17:21:38 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 17:21:37 +0100
Subject: Re: [PATCH v6 15/16] remoteproc: Properly deal with a detach request
 when attached
To:     Mathieu Poirier <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>, <arnaud.pouliquen@st.com>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
 <20210223233515.3468677-16-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <0204b7b3-14e5-73c2-5423-db494bd4352d@foss.st.com>
Date:   Fri, 26 Feb 2021 17:21:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223233515.3468677-16-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-26_05:2021-02-26,2021-02-26 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 2/24/21 12:35 AM, Mathieu Poirier wrote:
> This patch introduces the capability to detach a remote processor
> that has been attached by the remoteproc core.  For that to happen
> a rproc::ops::detach() operation needs to be available.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> ---
> New for V6:
> - The RPROC_RUNNING -> RPROC_DETACHED transition is no longer permitted
>   to avoid dealing with complex resource table management problems.
> - Removed Peng and Arnaud's RB tags because of the above.
> ---
> 
>  drivers/remoteproc/remoteproc_cdev.c  | 5 +++++
>  drivers/remoteproc/remoteproc_sysfs.c | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> index 0249d8f6c3f8..2db494816d5f 100644
> --- a/drivers/remoteproc/remoteproc_cdev.c
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -43,6 +43,11 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
>  			return -EINVAL;
>  
>  		rproc_shutdown(rproc);
> +	} else if (!strncmp(cmd, "detach", len)) {
> +		if (rproc->state != RPROC_ATTACHED)
> +			return -EINVAL;
> +
> +		ret = rproc_detach(rproc);
>  	} else {
>  		dev_err(&rproc->dev, "Unrecognized option\n");
>  		ret = -EINVAL;
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 09eb700c5e7e..ad3dd208024c 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -207,6 +207,11 @@ static ssize_t state_store(struct device *dev,
>  			return -EINVAL;
>  
>  		rproc_shutdown(rproc);
> +	} else if (sysfs_streq(buf, "detach")) {
> +		if (rproc->state != RPROC_ATTACHED)
> +			return -EINVAL;
> +
> +		ret = rproc_detach(rproc);
>  	} else {
>  		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
>  		ret = -EINVAL;
> 
