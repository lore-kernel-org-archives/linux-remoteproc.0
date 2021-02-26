Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7CEC433DB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:16:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 089A764EF3
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhBZQQK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 26 Feb 2021 11:16:10 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:34298 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230125AbhBZQQE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 26 Feb 2021 11:16:04 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11QGChnZ030208;
        Fri, 26 Feb 2021 17:15:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jeH2fzs0UUU6+N/fryeeMotYwOw3EhVbSZwPbaZ4X0M=;
 b=WavW9Ane2eBxu8E0WfUhrfDbIMr6zvBCW2+BqFbZ17j7xcmh1Ez6kHnw6Mn81YKeBzUp
 7N1kwWUgMkQaGnuoM7qIzEMqna+P6HEB85rq3w3LEzCAdYTNNDKYlMel6qFEAP1W7IoF
 8n1QX+1KPnVwqATRRnWw+T55UScyLlIEgToT1Bo/pEEL/VdP5NovHoQPwEZu5C09Ge3j
 bDmOSSxZlyI7B85DEDoCZx23+WSzo93i7C2NmyPIfyhILOdMJ2HvT1ks0EUZhQLGsfVR
 9ej5Jwk4HtV2iIyq4nLn5hJHcM2248ab/1XJNc5UBla8aRL7oiWuP/Survp0r6mfDKI/ xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36w66vxq9c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Feb 2021 17:15:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8267410002A;
        Fri, 26 Feb 2021 17:15:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7083F2A4D9B;
        Fri, 26 Feb 2021 17:15:14 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 17:15:13 +0100
Subject: Re: [PATCH v6 09/16] remoteproc: Introduce function __rproc_detach()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>, <arnaud.pouliquen@st.com>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
 <20210223233515.3468677-10-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <8a947829-7eed-d60d-3198-874b90472c1d@foss.st.com>
Date:   Fri, 26 Feb 2021 17:15:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223233515.3468677-10-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-26_05:2021-02-26,2021-02-26 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 2/24/21 12:35 AM, Mathieu Poirier wrote:
> Introduce function __rproc_detach() to perform the same kind of
> operation as rproc_stop(), but instead of switching off the
> remote processor using rproc->ops->stop(), it uses
> rproc->ops->detach().  That way it is possible for the core
> to release the resources associated with a remote processor while
> the latter is kept operating.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud
> ---
>  drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 86572880c726..0f680b7ff8f1 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1706,6 +1706,36 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  	return 0;
>  }
>  
> +/*
> + * __rproc_detach(): Does the opposite of __rproc_attach()
> + */
> +static int __maybe_unused __rproc_detach(struct rproc *rproc)
> +{
> +	struct device *dev = &rproc->dev;
> +	int ret;
> +
> +	/* No need to continue if a detach() operation has not been provided */
> +	if (!rproc->ops->detach)
> +		return -EINVAL;
> +
> +	/* Stop any subdevices for the remote processor */
> +	rproc_stop_subdevices(rproc, false);
> +
> +	/* Tell the remote processor the core isn't available anymore */
> +	ret = rproc->ops->detach(rproc);
> +	if (ret) {
> +		dev_err(dev, "can't detach from rproc: %d\n", ret);
> +		return ret;
> +	}
> +
> +	rproc_unprepare_subdevices(rproc);
> +
> +	rproc->state = RPROC_DETACHED;
> +
> +	dev_info(dev, "detached remote processor %s\n", rproc->name);
> +
> +	return 0;
> +}
>  
>  /**
>   * rproc_trigger_recovery() - recover a remoteproc
> 
