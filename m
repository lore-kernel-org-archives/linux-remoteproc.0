Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85DAC4361B
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Dec 2020 08:48:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EE6A233EF
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Dec 2020 08:48:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgLIIsK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 9 Dec 2020 03:48:10 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:27454 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726307AbgLIIsK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Dec 2020 03:48:10 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B98bn9w015604;
        Wed, 9 Dec 2020 09:47:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Vekhz7BP8aZ64fy2FozdOWgbW/JERrQTWpD1WvcwR9s=;
 b=hKclmfyLJ4busro0Uh2Ztz0R1mEcllwDDDKTdiepMG7lbSj6eAC2OXD7h76kwj/K3+E7
 C3Wg1xIzBgGZpfIclowq7FG7r7hJWk1sHOhjzjAqb42xqsNCREZMMRCktySub8yRi3hu
 E3v3rMaJluhwC2iodrtq4BDCTQv/CauvTfjFMpTl3lDHVxCI25g79K/FLK/ZocXi1o4d
 5OnqzCsLRZCueTE4h/IoFqXU3XCS7YtUgYOX9Rx6OD05MUk0pSPpH+42kbVH3/DtWboQ
 87DwZlpG7m/8mi9UGToMVw32EmnaTvdt5RYKZkZO5aPL1RZpl3XH/0l5NwaGg0rjZU9J hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35ag8j35ee-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Dec 2020 09:47:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C27E100038;
        Wed,  9 Dec 2020 09:47:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A46123316E;
        Wed,  9 Dec 2020 09:47:23 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Dec
 2020 09:47:22 +0100
Subject: Re: [PATCH v3 14/15] remoteproc: Properly deal with detach request
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
 <20201126210642.897302-15-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <970f3990-8f58-c33e-1883-ea63d08c3114@st.com>
Date:   Wed, 9 Dec 2020 09:47:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201126210642.897302-15-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-09_07:2020-12-08,2020-12-09 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 11/26/20 10:06 PM, Mathieu Poirier wrote:
> This patch introduces the capability to detach a remote processor
> that has been attached to or booted by the remoteproc core.  For
> that to happen a rproc::ops::detach() operation need to be
> available.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud
> ---
>  drivers/remoteproc/remoteproc_cdev.c  | 6 ++++++
>  drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> index 61541bc7d26c..f7645f289563 100644
> --- a/drivers/remoteproc/remoteproc_cdev.c
> +++ b/drivers/remoteproc/remoteproc_cdev.c
> @@ -43,6 +43,12 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
>  			return -EINVAL;
>  
>  		ret = rproc_shutdown(rproc);
> +	} else if (!strncmp(cmd, "detach", len)) {
> +		if (rproc->state != RPROC_RUNNING &&
> +		    rproc->state != RPROC_ATTACHED)
> +			return -EINVAL;
> +
> +		ret = rproc_detach(rproc);
>  	} else {
>  		dev_err(&rproc->dev, "Unrecognized option\n");
>  		ret = -EINVAL;
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 7d281cfe3e03..5a239df5877e 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -207,6 +207,12 @@ static ssize_t state_store(struct device *dev,
>  			return -EINVAL;
>  
>  		ret = rproc_shutdown(rproc);
> +	} else if (sysfs_streq(buf, "detach")) {
> +		if (rproc->state != RPROC_RUNNING &&
> +		    rproc->state != RPROC_ATTACHED)
> +			return -EINVAL;
> +
> +		ret = rproc_detach(rproc);
>  	} else {
>  		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
>  		ret = -EINVAL;
> 
