Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A764C433DB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:16:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40FAA64EF6
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:16:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbhBZQQ3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 26 Feb 2021 11:16:29 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:36582 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230140AbhBZQQX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 26 Feb 2021 11:16:23 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11QGBWK8031296;
        Fri, 26 Feb 2021 17:15:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GzT++FleawSPxMaXqNQZ47UtL97XZ984DHZh2Qfpzbc=;
 b=Of8dXlZFPZTrRSRTMnU11tiGI9ArsMPee30k/yL7XP/IHPDeTxAOhnm3EksNkKCInkJu
 W2sM5+CWAJaknTZ2YVUQFzXwp5a5fodwcdqpeZso51+VWwwAhJae6EXiZRhLb7toiagf
 IncqRVX6WA0VHGEem0YAdVi+NPmQs4HMLcpeo8lWNYi9wTekBwRUJofvVmbSJLuBOjPT
 9B9HIBH7gvaUHS3FnUUaCC/p2/8b8VTrFcpvPS2DSeB23lo7+YoHZ4egxmPE0xe9V02n
 V+XM5j9HoRzt8TLcwy6CUw+knmP2Vs7kFoHMg1K5X/7lNPttlN+W8QIeiabDarbfvDga Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36w66cxrac-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Feb 2021 17:15:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 11C8C10002A;
        Fri, 26 Feb 2021 17:15:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 051742BA2AE;
        Fri, 26 Feb 2021 17:15:34 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 17:15:33 +0100
Subject: Re: [PATCH v6 10/16] remoteproc: Introduce function rproc_detach()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>, <arnaud.pouliquen@st.com>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
 <20210223233515.3468677-11-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <2d49ff33-ac0b-c609-9845-0b03c9e11586@foss.st.com>
Date:   Fri, 26 Feb 2021 17:15:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223233515.3468677-11-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-26_05:2021-02-26,2021-02-26 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 2/24/21 12:35 AM, Mathieu Poirier wrote:
> Introduce function rproc_detach() to enable the remoteproc
> core to release the resources associated with a remote processor
> without stopping its operation.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,

> ---
> New for V6:
> - Checking for rproc->state has been removed.  They have been moved to
>   calling functions.
> - Freeing the cache table has been moved to the next patch, i.e 11/16.
> ---
> 
>  drivers/remoteproc/remoteproc_core.c | 58 +++++++++++++++++++++++++++-
>  include/linux/remoteproc.h           |  1 +
>  2 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 0f680b7ff8f1..fc01b29290a6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1709,7 +1709,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  /*
>   * __rproc_detach(): Does the opposite of __rproc_attach()
>   */
> -static int __maybe_unused __rproc_detach(struct rproc *rproc)
> +static int __rproc_detach(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
>  	int ret;
> @@ -1948,6 +1948,62 @@ void rproc_shutdown(struct rproc *rproc)
>  }
>  EXPORT_SYMBOL(rproc_shutdown);
>  
> +/**
> + * rproc_detach() - Detach the remote processor from the
> + * remoteproc core
> + *
> + * @rproc: the remote processor
> + *
> + * Detach a remote processor (previously attached to with rproc_attach()).
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
> +	/* if the remote proc is still needed, bail out */
> +	if (!atomic_dec_and_test(&rproc->power)) {
> +		ret = 0;
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
> +	/* release HW resources if needed */
> +	rproc_unprepare_device(rproc);
> +
> +	rproc_disable_iommu(rproc);
> +
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
> index eff55ec72e80..e1c843c19cc6 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -662,6 +662,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
>  
>  int rproc_boot(struct rproc *rproc);
>  void rproc_shutdown(struct rproc *rproc);
> +int rproc_detach(struct rproc *rproc);
>  int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
>  void rproc_coredump_using_sections(struct rproc *rproc);
> 
