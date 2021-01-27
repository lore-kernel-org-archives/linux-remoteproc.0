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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FA6C433E9
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:58:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 713422075A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:58:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233145AbhA0I5z (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Jan 2021 03:57:55 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:49762 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232692AbhA0IvW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jan 2021 03:51:22 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10R8jmFG010090;
        Wed, 27 Jan 2021 09:50:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=QPWdxWs7PH5WYouKWIG0geCQvYD0fgNKQ2Hujvn8Yuc=;
 b=wVnAyBPt3/9P7Rxjc3FBtmv10sdqLp+A8sZ+euIApTqPlALrFTd1/yvdobP2Xc7kTood
 WLX+GYcJkDOjH30HXz4ZfN6fn738MjaC3hDAkAK2imDUuTFjcw2PxbBtjnwj1nJ2KChn
 aAW5NIqwqq0llV+YtQ85tc7ilCbZYJDfEaKsFRLQA9g88k8fmWBM8ad+zhNqCEm3+uPZ
 wXC2j+4cN17IqcyOrsh7vcFpoBYeQxeZZgjYlbl3GnaTEWdUqJPMRzdZY2v3ugYgJDMG
 FXozUUsRUsm45zp+L+w1SLzdTzS41lPdNzlGPTKxTSMBZuD7dj7VU7HJReNY35sXHbAG BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 368c15xb04-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 09:50:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0019310002A;
        Wed, 27 Jan 2021 09:50:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E628D2288C0;
        Wed, 27 Jan 2021 09:50:32 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 09:50:32 +0100
Subject: Re: [PATCH v4 12/17] remoteproc: Introduce function rproc_detach()
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
 <20201218173228.2277032-13-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <406cd7ad-060e-a611-be20-5c1869f17e73@st.com>
Date:   Wed, 27 Jan 2021 09:50:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218173228.2277032-13-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-27_03:2021-01-26,2021-01-27 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 12/18/20 6:32 PM, Mathieu Poirier wrote:
> Introduce function rproc_detach() to enable the remoteproc
> core to release the resources associated with a remote processor
> without stopping its operation.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 71 +++++++++++++++++++++++++++-
>  include/linux/remoteproc.h           |  2 +
>  2 files changed, 72 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e665ed4776c3..ece3f15070b9 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1673,7 +1673,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  /*
>   * __rproc_detach(): Does the opposite of rproc_attach()
>   */
> -static int __maybe_unused __rproc_detach(struct rproc *rproc)
> +static int __rproc_detach(struct rproc *rproc)
>  {
>  	struct device *dev = &rproc->dev;
>  	int ret;
> @@ -1927,6 +1927,75 @@ void rproc_shutdown(struct rproc *rproc)
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

You rename the function to rproc_attach in you patch 04/17.

Then Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

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
> +
> +	/*
> +	 * If the remote processor was booted by the core the cached table needs
> +	 * to be freed and ->table_ptr set to NULL because it will be
> +	 * invalidated by rproc_resource_cleanup().  If the remote processor was
> +	 * attached to ->cached_table is NULL and kfree() returns right away.
> +	 *
> +	 * In either case ->table_ptr has to be set to NULL.  It will be set
> +	 * again when the remote processor is re-attached to.
> +	 */
> +	kfree(rproc->cached_table);
> +	rproc->cached_table = NULL;
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
> index 9bb34c3eb847..65ece6f177b7 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -659,6 +659,8 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
>  
>  int rproc_boot(struct rproc *rproc);
>  void rproc_shutdown(struct rproc *rproc);
> +int rproc_detach(struct rproc *rproc);
> +int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
>  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
>  int rproc_coredump_add_custom_segment(struct rproc *rproc,
> 
