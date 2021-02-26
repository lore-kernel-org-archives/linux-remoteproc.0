Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00811C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:15:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1AC064EBA
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhBZQPe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 26 Feb 2021 11:15:34 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:34142 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229566AbhBZQPc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 26 Feb 2021 11:15:32 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11QGCg5v030124;
        Fri, 26 Feb 2021 17:14:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aex4O8nt060PJ8vWZA6MQMuIBUc5PcSwyRTowyavlVI=;
 b=BV02qu2qXdZ60BURL5fVj0YNA4BV4/U/mrH8uCjVa6ipGtxEohudGVdOqKXkZNJ83z0z
 CacUaupZe5VG5wwvTZy1J+mIjyCapR9WtPlRpbJ7m59OG02M6DLnoZ3/1oEp39isOPeK
 20013dkVkKqn7UOnYCWvNso0cEWK1vpV7HiCf6wXpmHHcSuvrRyNVkHE/RJh9eTtn5xV
 I73itI+JmDB0eFIFGVoGWDZPrSUo3M35bqcq6EjCmnf5ek1CIv7J+gBJzm8BoavNysIj
 yVOuztySgnN0BD7YyHsUYdsitPxcBVfzFB7EA6LlcQWvtmcirULG+bx3Kyc1gNCl18q1 pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36w66vxq5d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Feb 2021 17:14:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94EBE100034;
        Fri, 26 Feb 2021 17:14:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8355E2A4D98;
        Fri, 26 Feb 2021 17:14:38 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 17:14:37 +0100
Subject: Re: [PATCH v6 05/16] remoteproc: Add new get_loaded_rsc_table() to
 rproc_ops
To:     Mathieu Poirier <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>, <arnaud.pouliquen@st.com>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
 <20210223233515.3468677-6-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <d21bebd0-6cf0-bc9d-c945-5e6aa2e5271d@foss.st.com>
Date:   Fri, 26 Feb 2021 17:14:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223233515.3468677-6-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-26_05:2021-02-26,2021-02-26 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 2/24/21 12:35 AM, Mathieu Poirier wrote:
> Add a new get_loaded_rsc_table() operation in order to support
> scenarios where the remoteproc core has booted a remote processor
> and detaches from it.  When re-attaching to the remote processor,
> the core needs to know where the resource table has been placed
> in memory.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
> New for V6:
> - Don't return an error if a resource table doesn't exist.
> ---
> 
>  drivers/remoteproc/remoteproc_core.c     | 32 ++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_internal.h | 10 ++++++++
>  include/linux/remoteproc.h               |  6 ++++-
>  3 files changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 8c7e9f1d50d7..0012b7bdce24 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1537,6 +1537,32 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> +static int rproc_set_loaded_rsc_table(struct rproc *rproc)
> +{
> +	struct resource_table *table_ptr;
> +	struct device *dev = &rproc->dev;
> +	size_t table_sz;
> +	int ret;
> +
> +	table_ptr = rproc_get_loaded_rsc_table(rproc, &table_sz);
> +	if (!table_ptr) {
> +		/* Not having a resource table is acceptable */
> +		return 0;

Would it be an over protection to set rproc->table_ptr to NULL here?

else

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> +	}
> +
> +	if (IS_ERR(table_ptr)) {
> +		ret = PTR_ERR(table_ptr);
> +		dev_err(dev, "can't load resource table: %d\n", ret);
> +		return ret;
> +	}
> +
> +	rproc->cached_table = NULL;
> +	rproc->table_ptr = table_ptr;
> +	rproc->table_sz = table_sz;
> +
> +	return 0;
> +}
> +
>  /*
>   * Attach to remote processor - similar to rproc_fw_boot() but without
>   * the steps that deal with the firmware image.
> @@ -1556,6 +1582,12 @@ static int rproc_attach(struct rproc *rproc)
>  		return ret;
>  	}
>  
> +	ret = rproc_set_loaded_rsc_table(rproc);
> +	if (ret) {
> +		dev_err(dev, "can't load resource table: %d\n", ret);
> +		goto disable_iommu;
> +	}
> +
>  	/* reset max_notifyid */
>  	rproc->max_notifyid = -1;
>  
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index c34002888d2c..4f73aac7e60d 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -177,6 +177,16 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
>  	return NULL;
>  }
>  
> +static inline
> +struct resource_table *rproc_get_loaded_rsc_table(struct rproc *rproc,
> +						  size_t *size)
> +{
> +	if (rproc->ops->get_loaded_rsc_table)
> +		return rproc->ops->get_loaded_rsc_table(rproc, size);
> +
> +	return NULL;
> +}
> +
>  static inline
>  bool rproc_u64_fit_in_size_t(u64 val)
>  {
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 6b0a0ed30a03..51538a7d120d 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -368,7 +368,9 @@ enum rsc_handling_status {
>   * RSC_HANDLED if resource was handled, RSC_IGNORED if not handled and a
>   * negative value on error
>   * @load_rsc_table:	load resource table from firmware image
> - * @find_loaded_rsc_table: find the loaded resouce table
> + * @find_loaded_rsc_table: find the loaded resource table from firmware image
> + * @get_loaded_rsc_table: get resource table installed in memory
> + *			  by external entity
>   * @load:		load firmware to memory, where the remote processor
>   *			expects to find it
>   * @sanity_check:	sanity check the fw image
> @@ -390,6 +392,8 @@ struct rproc_ops {
>  			  int offset, int avail);
>  	struct resource_table *(*find_loaded_rsc_table)(
>  				struct rproc *rproc, const struct firmware *fw);
> +	struct resource_table *(*get_loaded_rsc_table)(
> +				struct rproc *rproc, size_t *size);
>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> 
