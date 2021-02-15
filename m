Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B73C433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 13:11:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DDEA64DB1
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 13:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhBONLI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Feb 2021 08:11:08 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:23912 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229805AbhBONLI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Feb 2021 08:11:08 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11FD2Ib6019723;
        Mon, 15 Feb 2021 14:10:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aYFRvMrdMt1ZaYlXCk5Tz6cg8oMcKf8udTCLiaG1yiA=;
 b=MKgu30FjIr88luDrwqJ6LhkjBRJCVpdhItiojRYEiwGKiNgQMYLD62dn2zMuoKhkXjha
 eHPQCW9mHidUDSbzbf3Y6JCV0+QkTxEmUfjuZF5JKbDfXzUrdzQDL9Owj14BkJpgvx1+
 yLK3G/sU+P7FM1MW/b6Zk6lhWVXkTHp7krP8OfApK+3KcClFeANUEE4dUcqebMHTwzI7
 SU3xEqd8OH7um17ikwog0ier+T59oDQ+8toVrUeLb2sbB2tcxs6hqv3JvhVmQK8YKToi
 c4gJHzqgrYuzmN3yygBsF8xQ8BV9PzdvW8asKaIUN3peFaNDK+F4Sbt4PGJiy9NPEnCs ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36p4sf2x60-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 Feb 2021 14:10:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 22FFB10002A;
        Mon, 15 Feb 2021 14:10:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D2E42394DE;
        Mon, 15 Feb 2021 14:10:12 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 15 Feb
 2021 14:10:11 +0100
Subject: Re: [PATCH v5 07/19] remoteproc: Add new get_loaded_rsc_table() to
 rproc_ops
To:     Mathieu Poirier <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>, <arnaud.pouliquen@st.com>
CC:     <robh+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
 <20210211234627.2669674-8-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <406fe414-f454-c91d-8bbd-ce323a9612e7@foss.st.com>
Date:   Mon, 15 Feb 2021 14:10:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210211234627.2669674-8-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-15_08:2021-02-12,2021-02-15 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 2/12/21 12:46 AM, Mathieu Poirier wrote:
> Add a new get_loaded_rsc_table() operation in order to support
> scenarios where the remoteproc core has booted a remote processor
> and detaches from it.  When re-attaching to the remote processor,
> the core needs to know where the resource table has been placed
> in memory.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
> New for V5:
> - Added function rproc_set_loaded_rsc_table() to keep rproc_attach() clean.
> - Setting ->cached_table, ->table_ptr and ->table_sz in the remoteproc core
>   rather than the platform drivers.
> ---
>  drivers/remoteproc/remoteproc_core.c     | 35 ++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_internal.h | 10 +++++++
>  include/linux/remoteproc.h               |  6 +++-
>  3 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e6606d10a4c8..741bc20de437 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1537,6 +1537,35 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
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
> +	if (IS_ERR_OR_NULL(table_ptr)) {
> +		if (!table_ptr)
> +			ret = -EINVAL;

I did few tests on this showing that this approach does not cover all use cases.

The first one is a firmware without resource table. In this case table_ptr
should be null, or we have to consider the -ENOENT error as a non error usecase.

The second one, more tricky, is a firmware started by the remoteproc framework.
In this case the resource table address is retrieved from the ELF file by the
core part.
So if we detach and reattach rproc_get_loaded_rsc_table cannot return the
address. Look to me that we should have also an alocation of the clean_table in
rproc_start and then to keep the memory allocated until a shutdown.

That said regarding the complexity to re-attach, I wonder if it would not be
better to focus first on a simple detach, and address the reattachment in a
separate series, to move forward in stages.

Regards,
Arnaud

> +		else
> +			ret = PTR_ERR(table_ptr);
> +
> +		dev_err(dev, "can't load resource table: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * The resource table is already loaded in device memory, no need
> +	 * to work with a cached table.
> +	 */
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
> @@ -1556,6 +1585,12 @@ static int rproc_attach(struct rproc *rproc)
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
