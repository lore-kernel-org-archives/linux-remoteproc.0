Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E276EC433DB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:24:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95E7064EE1
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhBZQYj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 26 Feb 2021 11:24:39 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:36124 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229999AbhBZQYg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 26 Feb 2021 11:24:36 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11QGCg7t030124;
        Fri, 26 Feb 2021 17:23:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sAC/fKyohJhsaMN0N9CSZbklAqAE2gwlIAJ+apwQbQU=;
 b=vQ6wdWdsNesM9qKO5jp7d9WC6StRlgCjTyqVasc7ACGT+r4sZq124IlKziiOL1nQ8qtO
 1Mxb6d4JvLbDCNJEwJisXs/YkYeNATWsQx0DQbVMtqtlW5lwes4Bb9P493jYjZT92HOn
 CDexLUiam2mgkgbRLeHsQnv8LphRbBCZJmCX5VLqNxZ9qVqHrNa5imRoUw4X/X6RVkv8
 NsWqCezVU9zO0jOraI+fkkzNMcYdDr2u0s2SXQW8wBzjRe65G+vNxLAzLz9mM2xUrdl7
 kQiVH+iKvkdzCO15ehNWbWY2UayK4+mjVFkzB8XdGoO19hqeelV+jdUnN0LJW2UYOFTR 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36w66vxrqp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Feb 2021 17:23:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DCE3410002A;
        Fri, 26 Feb 2021 17:23:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CEA562BA2DB;
        Fri, 26 Feb 2021 17:23:46 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 17:23:45 +0100
Subject: Re: [PATCH v6 16/16] remoteproc: Refactor rproc delete and cdev
 release path
To:     Mathieu Poirier <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>, <arnaud.pouliquen@st.com>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
 <20210223233515.3468677-17-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <80abdd3b-ffb0-1019-2a1f-fea4f7b51349@foss.st.com>
Date:   Fri, 26 Feb 2021 17:23:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223233515.3468677-17-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-26_05:2021-02-26,2021-02-26 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 2/24/21 12:35 AM, Mathieu Poirier wrote:
> Refactor function rproc_del() and rproc_cdev_release() to take
> into account the current state of the remote processor when choosing
> the state to transition to.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
> New for V6:
> - The RPROC_RUNNING -> RPROC_DETACHED transition is no longer permitted.
>   to avoid dealing with complex resource table management problems.
> - Transition to the next state is no longer dictated by a DT binding for
>   the same reason as above.
> - Removed Peng and Arnaud's RB tags because of the above.
> ---
> 
>  drivers/remoteproc/remoteproc_cdev.c | 10 ++++++++--
>  drivers/remoteproc/remoteproc_core.c |  9 +++++++--
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> index 2db494816d5f..0b8a84c04f76 100644
> --- a/drivers/remoteproc/remoteproc_cdev.c
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -86,11 +86,17 @@ static long rproc_device_ioctl(struct file *filp, unsigned int ioctl, unsigned l
>  static int rproc_cdev_release(struct inode *inode, struct file *filp)
>  {
>  	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, cdev);
> +	int ret = 0;
> +
> +	if (!rproc->cdev_put_on_release)
> +		return 0;
>  
> -	if (rproc->cdev_put_on_release && rproc->state == RPROC_RUNNING)
> +	if (rproc->state == RPROC_RUNNING)
>  		rproc_shutdown(rproc);
> +	else if (rproc->state == RPROC_ATTACHED)
> +		ret = rproc_detach(rproc);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static const struct file_operations rproc_fops = {
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 00452da25fba..a05d5fec43b1 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2542,11 +2542,16 @@ EXPORT_SYMBOL(rproc_put);
>   */
>  int rproc_del(struct rproc *rproc)
>  {
> +	int ret = 0;
> +
>  	if (!rproc)
>  		return -EINVAL;
>  
>  	/* TODO: make sure this works with rproc->power > 1 */
> -	rproc_shutdown(rproc);
> +	if (rproc->state == RPROC_RUNNING)
> +		rproc_shutdown(rproc);
> +	else if (rproc->state == RPROC_ATTACHED)
> +		ret = rproc_detach(rproc);

Here i would not update the code to not change the existing behavior of an
attached firmware.
The decision between a detach or a shutdown probably depends on platform.
We could (as a next step) reintroduce the "autonomous-on-core-reboot" DT
property for the decision.

Regards
Arnaud

>  
>  	mutex_lock(&rproc->lock);
>  	rproc->state = RPROC_DELETED;
> @@ -2565,7 +2570,7 @@ int rproc_del(struct rproc *rproc)
>  
>  	device_del(&rproc->dev);
>  
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL(rproc_del);
>  
> 
