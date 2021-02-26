Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC834C43381
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:22:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF2EB64EE1
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:22:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbhBZQWT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 26 Feb 2021 11:22:19 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:35668 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230105AbhBZQWS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 26 Feb 2021 11:22:18 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11QGCho4030208;
        Fri, 26 Feb 2021 17:21:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ePjV5R+1g3F63Wal86Ui2moKGmsZl084jDtMkGfMFL4=;
 b=rTrSt2O/R1F/NNCTWxQIihBH1MFSmfyLBhmh3ENY7tsNg+VY5RxTExDTVcR7OvKBe8e6
 uw+8kkSSAYez0lXrfn3vjo/xHFUsEF7VJcK50L9gEJzggUoP6x856Pe0K3apnzfRTDWM
 jCRGeW5bV6tltjazEvMVrMCmnqBGBIhpkfD6T19hnuYnHU81qL3uZA3QjFPSD4Yx/KXr
 LSlVZl26peYBASO4ftVKCG7KAcromGAY/QKzrUYz9NiHYFk61t6GAgKPey19qx6GddNe
 WT9l8mFHOHiMOhhvtjf73NtJWX3DdyMnEwFSomVGL1/5ilhHf/GwGv1d2MKaaSv2GxBL Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36w66vxr8q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Feb 2021 17:21:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 281D310002A;
        Fri, 26 Feb 2021 17:21:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B16F2BA2C0;
        Fri, 26 Feb 2021 17:21:28 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 17:21:27 +0100
Subject: Re: [PATCH v6 14/16] remoteproc: Properly deal with a stop request
 when attached
To:     Mathieu Poirier <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>, <arnaud.pouliquen@st.com>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
 <20210223233515.3468677-15-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <cbda3758-0542-91b8-7b53-ef8b77075a99@foss.st.com>
Date:   Fri, 26 Feb 2021 17:21:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223233515.3468677-15-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-26_05:2021-02-26,2021-02-26 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 2/24/21 12:35 AM, Mathieu Poirier wrote:
> Allow a remote processor that was started by another entity to be
> switched off by the remoteproc core.  For that to happen a
> rproc::ops::stop() operation needs to be available.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> ---
> New for V6:
> - Removed state check in rproc_shutdown() as it is already done in
>   in calling functions.
> - rproc_shutdown() doesn't return an error code to keep legacy behevior.
> - Removed Peng and Arnaud's RB tags because of the above.
> ---
> 
>  drivers/remoteproc/remoteproc_cdev.c  | 3 ++-
>  drivers/remoteproc/remoteproc_core.c  | 4 ++++
>  drivers/remoteproc/remoteproc_sysfs.c | 3 ++-
>  3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> index b2cee9afb41b..0249d8f6c3f8 100644
> --- a/drivers/remoteproc/remoteproc_cdev.c
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -38,7 +38,8 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
>  
>  		ret = rproc_boot(rproc);
>  	} else if (!strncmp(cmd, "stop", len)) {
> -		if (rproc->state != RPROC_RUNNING)
> +		if (rproc->state != RPROC_RUNNING &&
> +		    rproc->state != RPROC_ATTACHED)
>  			return -EINVAL;
>  
>  		rproc_shutdown(rproc);
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 0dc518a24104..00452da25fba 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1758,6 +1758,10 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> +	/* No need to continue if a stop() operation has not been provided */
> +	if (!rproc->ops->stop)
> +		return -EINVAL;
> +
>  	/* Stop any subdevices for the remote processor */
>  	rproc_stop_subdevices(rproc, crashed);
>  
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 66801e6fe5cd..09eb700c5e7e 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -202,7 +202,8 @@ static ssize_t state_store(struct device *dev,
>  		if (ret)
>  			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
>  	} else if (sysfs_streq(buf, "stop")) {
> -		if (rproc->state != RPROC_RUNNING)
> +		if (rproc->state != RPROC_RUNNING &&
> +		    rproc->state != RPROC_ATTACHED)
>  			return -EINVAL;
>  
>  		rproc_shutdown(rproc);
> 
