Return-Path: <SRS0=udoQ=EP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC691C4741F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:41:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B6C420719
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:41:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="g847dkSR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgKIJlc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 04:41:32 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:25868 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726999AbgKIJlc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 04:41:32 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A99Rl6J005003;
        Mon, 9 Nov 2020 10:41:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=CMU1CkPzEFtEzWYYSnNalYa1sff719ATzHoqvR6O7Po=;
 b=g847dkSRVVkkyvSAqGtFF5cXPusCYJb44HYzMcMYej/EfJTaGgf7U4wFYmMvUPJuPPCA
 5g39WVK5wA4snAW2jIBvKiCAU/JcEdX/bxbcBSMf63humSir4Xv4SucS85MKKqgsKieW
 sHbytfRRdx6yKU/FTEHcLylGOwZFWQ0/lSTYxlQ2GxjZ5Dbd8lXOS10N0xkR6tKaLbt2
 2YMB4ancH+4R/VkEFJLz9PisPl7FQiGb7u6lEbtZyBD+4ZXyk1/uopaGDtRCvzOxzN72
 /1/dOpqtdy7JaKXD9PZvIWt+TVvamqStK0tmy5MPFv8i2rcn8/S72cLIgx3iGK9DV6lA PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nhkchpdg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Nov 2020 10:41:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1448510003B;
        Mon,  9 Nov 2020 10:41:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0BAD72314F2;
        Mon,  9 Nov 2020 10:41:29 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 10:41:01 +0100
Subject: Re: [PATCH v2 03/14] remoteproc: Add new RPROC_ATTACHED state
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-4-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <867884f2-fbb5-cbb3-a032-f4b2781f7059@st.com>
Date:   Mon, 9 Nov 2020 10:41:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030195713.1366341-4-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-09_02:2020-11-05,2020-11-09 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> Add a new RPROC_ATTACHED state to take into account scenarios
> where the remoteproc core needs to attach to a remote processor
> that is booted by another entity.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>


Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> ---
>  drivers/remoteproc/remoteproc_sysfs.c | 1 +
>  include/linux/remoteproc.h            | 7 +++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index d1cf7bf277c4..1167adcf8741 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -201,6 +201,7 @@ static const char * const rproc_state_string[] = {
>  	[RPROC_RUNNING]		= "running",
>  	[RPROC_CRASHED]		= "crashed",
>  	[RPROC_DELETED]		= "deleted",
> +	[RPROC_ATTACHED]	= "attached",
>  	[RPROC_DETACHED]	= "detached",
>  	[RPROC_LAST]		= "invalid",
>  };
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 3fa3ba6498e8..4564c4665a2c 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -403,6 +403,8 @@ struct rproc_ops {
>   * @RPROC_RUNNING:	device is up and running
>   * @RPROC_CRASHED:	device has crashed; need to start recovery
>   * @RPROC_DELETED:	device is deleted
> + * @RPROC_ATTACHED:	device has been booted by another entity and the core
> + *			has attached to it
>   * @RPROC_DETACHED:	device has been booted by another entity and waiting
>   *			for the core to attach to it
>   * @RPROC_LAST:		just keep this one at the end
> @@ -419,8 +421,9 @@ enum rproc_state {
>  	RPROC_RUNNING	= 2,
>  	RPROC_CRASHED	= 3,
>  	RPROC_DELETED	= 4,
> -	RPROC_DETACHED	= 5,
> -	RPROC_LAST	= 6,
> +	RPROC_ATTACHED	= 5,
> +	RPROC_DETACHED	= 6,
> +	RPROC_LAST	= 7,
>  };
>  
>  /**
> 
