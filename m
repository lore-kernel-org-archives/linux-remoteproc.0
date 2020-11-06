Return-Path: <SRS0=mBHI=EM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81EFC2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Nov 2020 17:43:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79D4D2151B
	for <linux-remoteproc@archiver.kernel.org>; Fri,  6 Nov 2020 17:43:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="wkxVjlK6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgKFRnK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 6 Nov 2020 12:43:10 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:65266 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727346AbgKFRnK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 6 Nov 2020 12:43:10 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A6HWF28009649;
        Fri, 6 Nov 2020 18:43:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=N2cs/IoK11soJ0LOqDdOy5t8b6nhJwW4mu0xJQ8r8fM=;
 b=wkxVjlK63uMJm5KcPEPTvGsRpHXWmdttoPPVd/WWpRklHzOIMaEaeZipIa6rn5/VRvLv
 U3LOF5hRkDIkZ8wN+N5iWO50huR3PVSic3dOvm704LgvHHPy7pnKCLvH0AiJqlTmGf9k
 5uvYEZPVmw8dD/0emLqYRHxCJLIOXUXpukjOoqNlzTRtGbfHyW8rJnJeYWNS+FV7AkI9
 Hlh5Tn7C/GacV1XwUEhRoh1zA84BT1Fxw2mwkTSOE6/0u8cd4yCzGcrkvDPbCPVw8ymr
 t7sq9Gl6qqNYWDTMC9TVOfXJfTaSb6DaXalDaRcIxt0AXZSlsohuSDQYhB5Ynissdt4J 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34h00ews3n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Nov 2020 18:43:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 375BE10002A;
        Fri,  6 Nov 2020 18:43:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D24824FD43;
        Fri,  6 Nov 2020 18:43:06 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 18:43:05 +0100
Subject: Re: [PATCH v2 07/14] remoteproc: Introduce function __rproc_detach()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-8-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <f9d421b6-ffb3-20f2-c0b1-fa4976a3a29e@st.com>
Date:   Fri, 6 Nov 2020 18:43:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030195713.1366341-8-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-06_06:2020-11-05,2020-11-06 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/30/20 8:57 PM, Mathieu Poirier wrote:
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
>  drivers/remoteproc/remoteproc_core.c | 31 ++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index ed1f9ca4248b..62e88ff65009 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1664,6 +1664,37 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
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
> +
> +	/* Stop any subdevices for the remote processor */
> +	rproc_stop_subdevices(rproc, false);

How to determine whether a subdevice should be stopped or detached? 
For instance, in ST, we have a resource manager subdev which maintains clocks and regulators
for peripherals used by the remote processor.
In case of detachment we would need to maintain clock and regulators.

> +
> +	/* Tell the remote processor the core isn't available anymore */
> +	ret = rproc->ops->detach(rproc);
> +	if (ret) {
> +		dev_err(dev, "can't detach from rproc: %d\n", ret);
> +		rproc_start_subdevices(rproc);
> +		return ret;
> +	}
> +
> +	rproc_unprepare_subdevices(rproc);

Same here, is prepare/unprepare can depend on the operation?

Seems that adding rproc_attach_subdevices/rproc_detach_subdevices could be not sufficient
to address prepare/unprepare.
Alternative could be:
- extra parameter for the subdev ops to indicate attach/detach action...?
- intermediate rproc state : ATTACHING, DETACHING
- other?

That's said, I don't think that it is blocking for the ST resource manager.
In this particular case, regulators and clocks can be permanently activated
as a back-up solution (always-on).

So, if no other company has a problem with that, we can keep this implementation for now.

Regards,
Arnaud

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
