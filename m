Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AE5C433DB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:16:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3868C64F03
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Feb 2021 16:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhBZQPq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 26 Feb 2021 11:15:46 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:34202 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229566AbhBZQPm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 26 Feb 2021 11:15:42 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11QGCff1030026;
        Fri, 26 Feb 2021 17:14:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ltG/OX6c6RPU8ASiBmXqyjD3MmtqWH96U4xplSNeJ5Y=;
 b=xNMzTGH98JDl7nbX7xUAvN896X1d2efACXYDF7D9Llcrt8ZkJcDIytvm9liz07xykQj8
 KXFKghZ/aVjq/m4anDj9gvw/V6t6SBA3kzrluEEuAAaUhKaLS5D8Ak1Uf/FEvPx+ARjz
 aFo+sbBZfiKv2U1V11OjyV4QKFG8uR1BroyP85VIPfMEpwXhg3SnqzsI7yhJPR3lAMC7
 TOVOgnShEmRXE4NsQB/DWhNHNJCRqLyBTsszxwo2xPzznSkBzGoMWCoXJqADboGTch37
 5iWmkbGabUOqfprq707myFxGc46t+hdp2u4CXB1w1nexc4FFUtyGih8Uir0Z3BFE8rkK Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36w66vxq6q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Feb 2021 17:14:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 52B2410002A;
        Fri, 26 Feb 2021 17:14:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 40A382A4D99;
        Fri, 26 Feb 2021 17:14:54 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 17:14:53 +0100
Subject: Re: [PATCH v6 06/16] remoteproc: stm32: Move resource table setup to
 rproc_ops
To:     Mathieu Poirier <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>, <arnaud.pouliquen@st.com>
CC:     <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
 <20210223233515.3468677-7-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <3fe71628-d37a-94f5-3d08-132b0b0cf0f6@foss.st.com>
Date:   Fri, 26 Feb 2021 17:14:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223233515.3468677-7-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-26_05:2021-02-26,2021-02-26 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 2/24/21 12:35 AM, Mathieu Poirier wrote:
> Move the setting of the resource table installed by an external
> entity to rproc_ops::get_loaded_rsc_table().  This is to support
> scenarios where a remote processor has been started by the core
> but is detached at a later stage.  To re-attach the remote
> processor, the address of the resource table needs to be available
> at a later time than the platform driver's probe() function.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> ---
>  drivers/remoteproc/stm32_rproc.c | 141 +++++++++++++++----------------
>  1 file changed, 68 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index ccb3c14a0023..f647e565014b 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -546,6 +546,73 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
>  	}
>  }
>  
> +static int stm32_rproc_da_to_pa(struct rproc *rproc,
> +				u64 da, phys_addr_t *pa)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +	struct device *dev = rproc->dev.parent;
> +	struct stm32_rproc_mem *p_mem;
> +	unsigned int i;
> +
> +	for (i = 0; i < ddata->nb_rmems; i++) {
> +		p_mem = &ddata->rmems[i];
> +
> +		if (da < p_mem->dev_addr ||
> +		    da >= p_mem->dev_addr + p_mem->size)
> +			continue;
> +
> +		*pa = da - p_mem->dev_addr + p_mem->bus_addr;
> +		dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
> +
> +		return 0;
> +	}
> +
> +	dev_err(dev, "can't translate da %llx\n", da);
> +
> +	return -EINVAL;
> +}
> +
> +static struct resource_table *
> +stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
> +{
> +	struct stm32_rproc *ddata = rproc->priv;
> +	struct device *dev = rproc->dev.parent;
> +	phys_addr_t rsc_pa;
> +	u32 rsc_da;
> +	int err;
> +
> +	/* The resource table has already been mapped, nothing to do */
> +	if (ddata->rsc_va)
> +		goto done;
> +
> +	err = regmap_read(ddata->rsctbl.map, ddata->rsctbl.reg, &rsc_da);
> +	if (err) {
> +		dev_err(dev, "failed to read rsc tbl addr\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (!rsc_da)
> +		/* no rsc table */
> +		return ERR_PTR(-ENOENT);
> +
> +	err = stm32_rproc_da_to_pa(rproc, rsc_da, &rsc_pa);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	ddata->rsc_va = devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
> +	if (IS_ERR_OR_NULL(ddata->rsc_va)) {
> +		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> +			&rsc_pa, RSC_TBL_SIZE);
> +		ddata->rsc_va = NULL;
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +done:
> +	/* Assuming the resource table fits in 1kB is fair */
> +	*table_sz = RSC_TBL_SIZE;
> +	return (struct resource_table *)ddata->rsc_va;
> +}
> +
>  static const struct rproc_ops st_rproc_ops = {
>  	.start		= stm32_rproc_start,
>  	.stop		= stm32_rproc_stop,
> @@ -554,6 +621,7 @@ static const struct rproc_ops st_rproc_ops = {
>  	.load		= rproc_elf_load_segments,
>  	.parse_fw	= stm32_rproc_parse_fw,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> +	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
> @@ -695,75 +763,6 @@ static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
>  	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg, state);
>  }
>  
> -static int stm32_rproc_da_to_pa(struct platform_device *pdev,
> -				struct stm32_rproc *ddata,
> -				u64 da, phys_addr_t *pa)
> -{
> -	struct device *dev = &pdev->dev;
> -	struct stm32_rproc_mem *p_mem;
> -	unsigned int i;
> -
> -	for (i = 0; i < ddata->nb_rmems; i++) {
> -		p_mem = &ddata->rmems[i];
> -
> -		if (da < p_mem->dev_addr ||
> -		    da >= p_mem->dev_addr + p_mem->size)
> -			continue;
> -
> -		*pa = da - p_mem->dev_addr + p_mem->bus_addr;
> -		dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
> -
> -		return 0;
> -	}
> -
> -	dev_err(dev, "can't translate da %llx\n", da);
> -
> -	return -EINVAL;
> -}
> -
> -static int stm32_rproc_get_loaded_rsc_table(struct platform_device *pdev,
> -					    struct rproc *rproc,
> -					    struct stm32_rproc *ddata)
> -{
> -	struct device *dev = &pdev->dev;
> -	phys_addr_t rsc_pa;
> -	u32 rsc_da;
> -	int err;
> -
> -	err = regmap_read(ddata->rsctbl.map, ddata->rsctbl.reg, &rsc_da);
> -	if (err) {
> -		dev_err(dev, "failed to read rsc tbl addr\n");
> -		return err;
> -	}
> -
> -	if (!rsc_da)
> -		/* no rsc table */
> -		return 0;
> -
> -	err = stm32_rproc_da_to_pa(pdev, ddata, rsc_da, &rsc_pa);
> -	if (err)
> -		return err;
> -
> -	ddata->rsc_va = devm_ioremap_wc(dev, rsc_pa, RSC_TBL_SIZE);
> -	if (IS_ERR_OR_NULL(ddata->rsc_va)) {
> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> -			&rsc_pa, RSC_TBL_SIZE);
> -		ddata->rsc_va = NULL;
> -		return -ENOMEM;
> -	}
> -
> -	/*
> -	 * The resource table is already loaded in device memory, no need
> -	 * to work with a cached table.
> -	 */
> -	rproc->cached_table = NULL;
> -	/* Assuming the resource table fits in 1kB is fair */
> -	rproc->table_sz = RSC_TBL_SIZE;
> -	rproc->table_ptr = (struct resource_table *)ddata->rsc_va;
> -
> -	return 0;
> -}
> -
>  static int stm32_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -803,10 +802,6 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  		ret = stm32_rproc_parse_memory_regions(rproc);
>  		if (ret)
>  			goto free_resources;
> -
> -		ret = stm32_rproc_get_loaded_rsc_table(pdev, rproc, ddata);
> -		if (ret)
> -			goto free_resources;
>  	}
>  
>  	rproc->has_iommu = false;
> 
