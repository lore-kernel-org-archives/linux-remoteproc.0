Return-Path: <SRS0=udoQ=EP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C27C4741F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:05:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 309C420702
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 09:05:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="abRH3hkr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729684AbgKIJFk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 04:05:40 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:61750 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726127AbgKIJFk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 04:05:40 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A992er5032426;
        Mon, 9 Nov 2020 10:05:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=qh+JTQ1Z7O3ot2lyRf/auZhCE/MVrsrMAAuXvE7QiNA=;
 b=abRH3hkrVp7v9DwD9QZHkh2IU2DVWVgZ+qsWpjWUkD9N0WwzEP6bwpmOBa+SFc6HNfpt
 v7dmQcuOB4SO55QYu3vnPnWlAaznkrTaVn066ekmY4wqxE0FEv58sFNeAvh4N7E8s0bk
 se/298x/tggwIC9DxcnXwq6qA1m7nsD6BkMLtH6Q2LfH1fF3UmNXrD6E8+3oy47YjvPW
 ZGPA6IOEQXoC9lkM6lhP6k0gLzE9+LG/E6uw3ZQOEXif6FhANbGMuSLaO73bO9D5THfB
 ioA4RgfvlFAQpknFxgRXvExxKomZf7YBtaKSNcul/GmTp6Gie6WCgZ6My34VBr1r5Yxv lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nj80gxhq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Nov 2020 10:05:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 344AB10002A;
        Mon,  9 Nov 2020 10:05:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 263C1230468;
        Mon,  9 Nov 2020 10:05:37 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 10:05:36 +0100
Subject: Re: [PATCH v2 08/14] remoteproc: Introduce function rproc_detach()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-9-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <807cebaa-2d64-401a-d673-8f40b919924e@st.com>
Date:   Mon, 9 Nov 2020 10:05:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030195713.1366341-9-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-09_02:2020-11-05,2020-11-09 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> Introduce function rproc_detach() to enable the remoteproc
> core to release the resources associated with a remote processor
> without stopping its operation.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 65 +++++++++++++++++++++++++++-
>  include/linux/remoteproc.h           |  1 +
>  2 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 62e88ff65009..6b33a83960d2 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1667,7 +1667,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  /*
>   * __rproc_detach(): Does the opposite of rproc_attach()
>   */
> -static int __maybe_unused __rproc_detach(struct rproc *rproc)
> +static int __rproc_detach(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
>  	int ret;
> @@ -1910,6 +1910,69 @@ void rproc_shutdown(struct rproc *rproc)
>  }
>  EXPORT_SYMBOL(rproc_shutdown);
>  
> +/**
> + * rproc_detach() - Detach the remote processor from the
> + * remoteproc core
> + *
> + * @rproc: the remote processor
> + *
> + * Detach a remote processor (previously attached to with rproc_actuate()).
> + *
> + * In case @rproc is still being used by an additional user(s), then
> + * this function will just decrement the power refcount and exit,
> + * without disconnecting the device.
> + *
> + * Function rproc_detach() calls __rproc_detach() in order to let a remote
> + * processor know that services provided by the application processor are
> + * no longer available.  From there it should be possible to remove the
> + * platform driver and even power cycle the application processor (if the HW
> + * supports it) without needing to switch off the remote processor.
> + */
> +int rproc_detach(struct rproc *rproc)
> +{
> +	struct device *dev = &rproc->dev;
> +	int ret;
> +
> +	ret = mutex_lock_interruptible(&rproc->lock);
> +	if (ret) {
> +		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
> +		return ret;
> +	}
> +
> +	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED) {
> +		ret = -EPERM;
> +		goto out;
> +	}
> +
> +	/* if the remote proc is still needed, bail out */
> +	if (!atomic_dec_and_test(&rproc->power)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	ret = __rproc_detach(rproc);
> +	if (ret) {
> +		atomic_inc(&rproc->power);
> +		goto out;
> +	}
> +
> +	/* clean up all acquired resources */
> +	rproc_resource_cleanup(rproc);
> +
> +	rproc_disable_iommu(rproc);

I'm not an IOMMU expert,so maybe this remark is not relevant...
As IOMMU manage the access of the remote device to its memory,
could this lead to a remote device crash?

Regards,
Arnaud

> +
> +	/*
> +	 * Set the remote processor's table pointer to NULL.  Since mapping
> +	 * of the resource table to a virtual address is done in the platform
> +	 * driver, unmapping should also be done there.
> +	 */
> +	rproc->table_ptr = NULL;
> +out:
> +	mutex_unlock(&rproc->lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL(rproc_detach);
> +
>  /**
>   * rproc_get_by_phandle() - find a remote processor by phandle
>   * @phandle: phandle to the rproc
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 3faff9bb4fb8..6713faab6959 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -656,6 +656,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
>  
>  int rproc_boot(struct rproc *rproc);
>  void rproc_shutdown(struct rproc *rproc);
> +int rproc_detach(struct rproc *rproc);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
>  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
>  int rproc_coredump_add_custom_segment(struct rproc *rproc,
> 
