Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98442C433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:47:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B3E420727
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:47:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbhA0Ire (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Jan 2021 03:47:34 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:49519 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232016AbhA0Ip2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jan 2021 03:45:28 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10R8hH9e004369;
        Wed, 27 Jan 2021 09:44:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=4IEIopuOEfQJiYhnjKN0EjyncVxzU70XFQFpS6nSA7U=;
 b=fmHCYGSazGXpW3x3YUc2OTQVj+i183eHNiBZ6QEzIdz0l8inbX+ntRgQh8FzrpF3HFaj
 /FAysAhU5UkfQaczcYfniC5SaywPfQr4EIKG09XswSJjb89eHhYeEB/BE1sMHZmLJ+aC
 rmZ/f+yZck5GDwVja9yoeHEJ4iZ+OUZUlEzqWw/tW/+DtXfpDK8w+i11rWuVDOs5WrWx
 QHnE8848bUftUO9zUv83AYm5SLHw2pa0dx6T6seJEXRXl0PHfrV1UBzMAiquo8YUA6BM
 trt3LEsypwBUFtapF76lQ+brYbGL0Dcx0kB7BgcvMVh/mTSg1jDRgqqBsCTA+sGvTj+v 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 368a56pnv0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 09:44:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A830810002A;
        Wed, 27 Jan 2021 09:44:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92710226269;
        Wed, 27 Jan 2021 09:44:29 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 09:44:29 +0100
Subject: Re: [PATCH v4 05/17] remoteproc: Add new get_loaded_rsc_table()
 remoteproc operation
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
 <20201218173228.2277032-6-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <47edac31-2f5f-efa9-2699-9fbec7f0d263@st.com>
Date:   Wed, 27 Jan 2021 09:44:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218173228.2277032-6-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-27_03:2021-01-26,2021-01-27 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

Come back on you series...

On 12/18/20 6:32 PM, Mathieu Poirier wrote:
> Add an new get_loaded_rsc_table() operation in order to support
> scenarios where the remoteproc core has booted a remote processor
> and detaches from it.  When re-attaching to the remote processor,
> the core needs to know where the resource table has been placed
> in memory.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c     | 6 ++++++
>  drivers/remoteproc/remoteproc_internal.h | 8 ++++++++
>  include/linux/remoteproc.h               | 5 ++++-
>  3 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index d0f6b39b56f9..3d87c910aca7 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1556,6 +1556,12 @@ static int rproc_attach(struct rproc *rproc)
>  		return ret;
>  	}
>  
> +	ret = rproc_get_loaded_rsc_table(rproc);
> +	if (ret) {
> +		dev_err(dev, "can't load resource table: %d\n", ret);
> +		goto disable_iommu;
> +	}
> +

This function is rather ambiguous. Without the example of stm32, it is not
obvious what the platform driver has to do in this ops. And the update of rproc
in the in the core instead of in platform driver seems to me more reliable.

Here is a suggestion considering that ->cached_table is always NULL:


struct resource_table *rproc_get_loaded_rsc_table(struct rproc *rproc,
                                                  size_t* size)
{

	if (rproc->ops->get_loaded_rsc_table) {
		return rproc->ops->get_loaded_rsc_table(rproc, size);

	*size = 0;
	return NULL;
}

then in rproc_attach:

	table_ptr = rproc_get_loaded_rsc_table(rproc, &tab_size);
	if (PTR_ERR(table_ptr) {
		dev_err(dev, "can't load resource table: %d\n", ret);
		goto disable_iommu;
	}
 	rproc->cached_table = NULL;
 	rproc->table_ptr = table_ptr;
 	rproc->table_sz = table_sz;


Thanks,
Arnaud

>  	/* reset max_notifyid */
>  	rproc->max_notifyid = -1;
>  
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index c34002888d2c..c48b301d6ad1 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -177,6 +177,14 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
>  	return NULL;
>  }
>  
> +static inline int rproc_get_loaded_rsc_table(struct rproc *rproc)
> +{
> +	if (rproc->ops->get_loaded_rsc_table)
> +		return rproc->ops->get_loaded_rsc_table(rproc);
> +
> +	return 0;
> +}
> +
>  static inline
>  bool rproc_u64_fit_in_size_t(u64 val)
>  {
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 3fa3ba6498e8..571615e77e6f 100644
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
> @@ -389,6 +391,7 @@ struct rproc_ops {
>  			  int offset, int avail);
>  	struct resource_table *(*find_loaded_rsc_table)(
>  				struct rproc *rproc, const struct firmware *fw);
> +	int (*get_loaded_rsc_table)(struct rproc *rproc);
>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> 
