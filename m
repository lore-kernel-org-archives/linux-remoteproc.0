Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A47C433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74BA820754
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbhA0Iup (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Jan 2021 03:50:45 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:38690 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232554AbhA0IsM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jan 2021 03:48:12 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10R8g0Cn016192;
        Wed, 27 Jan 2021 09:47:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=EJrDVDhMiwCtkLqAD61LGV8ruUi4Cea0wgqr66As5hg=;
 b=Z252hjhbkzJGkZLuOcHKUGYMehGbL2rT+LE8cYKIq//lan2LUikYGVXhM2nPNAT5v8jx
 a2t29pw/iP9sKe04gjaF7LR2BrBTsP/p36gCCOTR3O6az/qvXgfa+ZSIu+EWxu4aE5pp
 CXATFA3tTjNP9PDgxamBKUdJY93OyPgUgv1Ac2SnEOxJfpO+/ZbYR+brMtTIwZy9yp1P
 0l5bZdVILu983Msjh9O4wDEi6E8te7kKQo7EEEcTl4VQtOyKYUfIu8gQyw7DUWKCKcQ2
 EPVE8Kl5zz2lP4p5gmuMdr0XpyxjE2PBWK2f6mEWWrhiR3dNNFQtW2Uri/dQbC7oMco5 Xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 368bjnegfv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 09:47:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B209E10002A;
        Wed, 27 Jan 2021 09:46:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A0C052280FF;
        Wed, 27 Jan 2021 09:46:59 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 09:46:59 +0100
Subject: Re: [PATCH v4 11/17] remoteproc: Introduce function __rproc_detach()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
 <20201218173228.2277032-12-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <5419749d-5e81-8b0c-616f-e0d5e237ac9a@st.com>
Date:   Wed, 27 Jan 2021 09:46:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218173228.2277032-12-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-27_03:2021-01-26,2021-01-27 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 12/18/20 6:32 PM, Mathieu Poirier wrote:
> Introduce function __rproc_detach() to perform the same kind of
> operation as rproc_stop(), but instead of switching off the
> remote processor using rproc->ops->stop(), it uses
> rproc->ops->detach().  That way it is possible for the core
> to release the resources associated with a remote processor while
> the latter is kept operating.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 42 ++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index fc28053c7f89..e665ed4776c3 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1670,6 +1670,48 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  	return 0;
>  }
>  
> +/*
> + * __rproc_detach(): Does the opposite of rproc_attach()
> + */
> +static int __maybe_unused __rproc_detach(struct rproc *rproc)
> +{
> +	struct device *dev = &rproc->dev;
> +	int ret;
> +
> +	/* No need to continue if a detach() operation has not been provided */
> +	if (!rproc->ops->detach)
> +		return -EINVAL;

I wonder if this ops should be optional.

> +
> +	/* Stop any subdevices for the remote processor */
> +	rproc_stop_subdevices(rproc, false);
> +
> +	/*
> +	 * If the remote processors was started by the core then a cached_table
> +	 * is present and we must follow the same cleanup sequence as we would
> +	 * for a shutdown().  As it is in rproc_stop(), use the cached resource
> +	 * table for the rest of the detach process since ->table_ptr will
> +	 * become invalid as soon as carveouts are released in
> +	 * rproc_resource_cleanup().
> +	 */
> +	if (rproc->cached_table)
> +		rproc->table_ptr = rproc->cached_table;
> +
> +	/* Tell the remote processor the core isn't available anymore */
> +	ret = rproc->ops->detach(rproc);
> +	if (ret) {
> +		dev_err(dev, "can't detach from rproc: %d\n", ret);
> +		rproc_start_subdevices(rproc);

Not sure that this would be possible in all cases, without a unprepare and
prepare. What about having the same behavior as the rproc_stop failure?

Thanks
Arnaud.

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
