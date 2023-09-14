Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AB7EEAA59
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Sep 2023 17:15:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238166AbjINRPf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Sep 2023 13:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237683AbjINRPe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Sep 2023 13:15:34 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4131FE8
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Sep 2023 10:15:30 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c09673b006so9491475ad.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Sep 2023 10:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694711730; x=1695316530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EFQQ1XZ43OhAT7S0nlQDANrbnjCINiXKmH5fkMBcqJs=;
        b=I4uOlO9zLrr96oNyqRDS6gDzIfBgiWh3E08GadGcVz+gAD96onMDBVXqG1p5avkkVz
         K0bQEbyvnBgxqGRPNd3+9Elr7g09v9UfFY9H9tk8qRi616LrgAOfRC3ZZ8vykotrbeuJ
         GlhBw7JHCb8mjgLLJgigam7juJCEeP0ky2lmQPLXg9+YQPRuRSEYwpsD7qVc3WEIZum3
         7ymwQEDxyZFNPj4rxEt2Xv+7mwLDzOYb8Jn9d7J0uHVKNpe6gnxTwg5c2R10HKyz1l0N
         0tHtN0wujYIUlLpYHWiwTYgycO6MOKCUrgP+ZepRgVG001AAperkftOH9doJDl5ruPYR
         ES2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694711730; x=1695316530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFQQ1XZ43OhAT7S0nlQDANrbnjCINiXKmH5fkMBcqJs=;
        b=Tb8zPFG7XKsscHQiz4VAGsFL9jt+D/lnxAOyBXjUcYsVLsomxxnIAICtOADMfNQUMu
         pHnXp16aDzQMhAV9ABLo92Qrt+HW1UrXoSMfxfr7miZaiaG17paGSwm+hCISKcchGAqy
         +F5NYfEP4M0J7S4xBaHeZQm+6iVM3N4rzofSKipzzK6hELRGc8bYX9+M5VcuE3T8F56W
         s2YrSbjmDW2S+5qcOxTsgV4IZcMQO8Sw1B71LevPhSDuXe0B3v47nUkIDqFfP/dXa6s7
         i9xwvwdMehTevxjWHG5iEnkuit8/lmMjN6GGnCwQksk66jOT90rBpcth/MLxgrHF2Cqq
         kfMQ==
X-Gm-Message-State: AOJu0YxKeWPV/xAZZZXtZMQQJwW2Fabf/WE9CmVq4ZyjWPbT6BZJCGUy
        NTZk/0q+HzUwTUZHg6PD4KLICA==
X-Google-Smtp-Source: AGHT+IFM0q6TdQSf4cAQObnio+i8U9wKIlmhJf0rw6Lar0BDXh5QnXQx72AeI/Ws7kMryJ9Si0nn5w==
X-Received: by 2002:a17:902:968e:b0:1bb:f82f:fb93 with SMTP id n14-20020a170902968e00b001bbf82ffb93mr6017875plp.2.1694711730198;
        Thu, 14 Sep 2023 10:15:30 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b2ff:5f0d:895d:4492])
        by smtp.gmail.com with ESMTPSA id jw12-20020a170903278c00b001b89891bfc4sm1836532plb.199.2023.09.14.10.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 10:15:29 -0700 (PDT)
Date:   Thu, 14 Sep 2023 11:15:27 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tanmay Shah <tanmay.shah@amd.com>
Cc:     linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Ben Levinsky <ben.levinsky@amd.com>
Subject: Re: [PATCH] remoteproc: zynqmp: fix TCM carveouts in lockstep mode
Message-ID: <ZQM/r0y1j4ATixqr@p14s>
References: <20230913024323.2768114-1-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913024323.2768114-1-tanmay.shah@amd.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good morning,

On Tue, Sep 12, 2023 at 07:43:23PM -0700, Tanmay Shah wrote:
> In lockstep mode following is TCM address map:
> 
> |      *TCM*         |   *R5 View* | *Linux view* |
> | R5_0 ATCM (128 KB) | 0x0000_0000 | 0xFFE0_0000  |
> | R5_0 BTCM (128 KB) | 0x0002_0000 | 0xFFE2_0000  |
> 
> Current driver keeps single TCM carveout in lockstep mode
> as ATCM and BTCM addresses form contiguous memory region.
> 
> Although the addresses are contiguous, it is not same type
> of memory. ATCM typically holds interrupt or exception code
> that must be accessed at high speed. BTCM typically holds
> a block of data for intensive processing, such as audio or
> video processing. As both are different types of memory,
> they should be allocated as different carveout. This patch
> is fixing TCM carveout allocation in lockstep mode.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 66 ++++++++++++++++---------
>  1 file changed, 43 insertions(+), 23 deletions(-)
> 

Applied.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index feca6de68da2..efd758c2f4ed 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -75,13 +75,21 @@ struct mbox_info {
>   * Hardcoded TCM bank values. This will be removed once TCM bindings are
>   * accepted for system-dt specifications and upstreamed in linux kernel
>   */
> -static const struct mem_bank_data zynqmp_tcm_banks[] = {
> +static const struct mem_bank_data zynqmp_tcm_banks_split[] = {
>  	{0xffe00000UL, 0x10000UL, PD_R5_0_ATCM, "atcm0"}, /* TCM 64KB each */
>  	{0xffe20000UL, 0x10000UL, PD_R5_0_BTCM, "btcm0"},
>  	{0xffe90000UL, 0x10000UL, PD_R5_1_ATCM, "atcm1"},
>  	{0xffeb0000UL, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
>  };
>  
> +/* In lockstep mode cluster combines each 64KB TCM and makes 128KB TCM */
> +static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
> +	{0xffe00000UL, 0x20000UL, PD_R5_0_ATCM, "atcm0"}, /* TCM 128KB each */
> +	{0xffe20000UL, 0x20000UL, PD_R5_0_BTCM, "btcm0"},
> +	{0, 0, PD_R5_1_ATCM, ""},
> +	{0, 0, PD_R5_1_BTCM, ""},
> +};
> +
>  /**
>   * struct zynqmp_r5_core
>   *
> @@ -650,14 +658,11 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
>  	/*
>  	 * In lockstep mode, TCM is contiguous memory block
>  	 * However, each TCM block still needs to be enabled individually.
> -	 * So, Enable each TCM block individually, but add their size
> -	 * to create contiguous memory region.
> +	 * So, Enable each TCM block individually.
> +	 * Although ATCM and BTCM is contiguous memory block, add two separate
> +	 * carveouts for both.
>  	 */
> -	bank_addr = r5_core->tcm_banks[0]->addr;
> -	bank_name = r5_core->tcm_banks[0]->bank_name;
> -
>  	for (i = 0; i < num_banks; i++) {
> -		bank_size += r5_core->tcm_banks[i]->size;
>  		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
>  
>  		/* Turn on each TCM bank individually */
> @@ -668,23 +673,31 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
>  			dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
>  			goto release_tcm_lockstep;
>  		}
> -	}
>  
> -	dev_dbg(dev, "TCM add carveout lockstep mode %s addr=0x%llx, size=0x%lx",
> -		bank_name, bank_addr, bank_size);
> -
> -	/* Register TCM address range, TCM map and unmap functions */
> -	rproc_mem = rproc_mem_entry_init(dev, NULL, bank_addr,
> -					 bank_size, bank_addr,
> -					 tcm_mem_map, tcm_mem_unmap,
> -					 bank_name);
> -	if (!rproc_mem) {
> -		ret = -ENOMEM;
> -		goto release_tcm_lockstep;
> -	}
> +		bank_size = r5_core->tcm_banks[i]->size;
> +		if (bank_size == 0)
> +			continue;
>  
> -	/* If registration is success, add carveouts */
> -	rproc_add_carveout(rproc, rproc_mem);
> +		bank_addr = r5_core->tcm_banks[i]->addr;
> +		bank_name = r5_core->tcm_banks[i]->bank_name;
> +
> +		/* Register TCM address range, TCM map and unmap functions */
> +		rproc_mem = rproc_mem_entry_init(dev, NULL, bank_addr,
> +						 bank_size, bank_addr,
> +						 tcm_mem_map, tcm_mem_unmap,
> +						 bank_name);
> +		if (!rproc_mem) {
> +			ret = -ENOMEM;
> +			zynqmp_pm_release_node(pm_domain_id);
> +			goto release_tcm_lockstep;
> +		}
> +
> +		/* If registration is success, add carveouts */
> +		rproc_add_carveout(rproc, rproc_mem);
> +
> +		dev_dbg(dev, "TCM add carveout lockstep mode %s addr=0x%llx, size=0x%lx",
> +			bank_name, bank_addr, bank_size);
> +	}
>  
>  	return 0;
>  
> @@ -895,12 +908,19 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>   */
>  static int zynqmp_r5_get_tcm_node(struct zynqmp_r5_cluster *cluster)
>  {
> +	const struct mem_bank_data *zynqmp_tcm_banks;
>  	struct device *dev = cluster->dev;
>  	struct zynqmp_r5_core *r5_core;
>  	int tcm_bank_count, tcm_node;
>  	int i, j;
>  
> -	tcm_bank_count = ARRAY_SIZE(zynqmp_tcm_banks);
> +	if (cluster->mode == SPLIT_MODE) {
> +		zynqmp_tcm_banks = zynqmp_tcm_banks_split;
> +		tcm_bank_count = ARRAY_SIZE(zynqmp_tcm_banks_split);
> +	} else {
> +		zynqmp_tcm_banks = zynqmp_tcm_banks_lockstep;
> +		tcm_bank_count = ARRAY_SIZE(zynqmp_tcm_banks_lockstep);
> +	}
>  
>  	/* count per core tcm banks */
>  	tcm_bank_count = tcm_bank_count / cluster->core_count;
> 
> base-commit: 6995e2de6891c724bfeb2db33d7b87775f913ad1
> -- 
> 2.25.1
> 
