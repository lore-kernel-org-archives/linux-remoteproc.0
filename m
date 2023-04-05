Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3190FC7619A
	for <linux-remoteproc@archiver.kernel.org>; Wed,  5 Apr 2023 17:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233903AbjDERCh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 5 Apr 2023 13:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233758AbjDERCU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 Apr 2023 13:02:20 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D2D65AC
        for <linux-remoteproc@vger.kernel.org>; Wed,  5 Apr 2023 10:00:40 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so37914264pjl.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Apr 2023 10:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680713989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pwKkt8UZiD6fRvOx9rvYnVXlwR4u+FrQ9QF6T/cZZ2g=;
        b=K0VXt7uzMbgeVdLQlGWjVFdFVdL2wVsoMEWVeT63P3jknf0qvrRohz3eZ2D96Vkso5
         bjvvI5yDDjeoJx5vzt0xpQZk59equg1a0ShTWy/kQofIjMboQL4aTDSYUYVmZ32bZLH2
         R0JpLjorAL2vKr2EHj0m2F2GYS70yeh3yhoRGidaG6PG8VS6KEsTpmbVFHHT5r5EGjuE
         uXkAkhKHcMYTjAkkzhxaFdyllF/8L5teR8f1+yuKF654OHlN1Eitguh4YOE4x0wKHHtU
         jsiYKFCykDbQG9qKckPJSDchmm8/000DTTaJxA8CqmlxZdtljmSCKJCXP2HF6BBTBasy
         0mFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680713989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwKkt8UZiD6fRvOx9rvYnVXlwR4u+FrQ9QF6T/cZZ2g=;
        b=wATsurIAGFcKSBJboNt5mSXZkWl8pjYlvU1Mc/mMBvIurO4SEoHr0Q2HM9Bi1smdwa
         ssYrRJ4L4MrLhiExb4141gBaUp0WJAe3pEa75xXQj05MJKo/X4hv2j1UF7ArMiMxnTab
         e6tcIlcNF3N97OupnzbAG5hKrE/dp6BjKOV+vWyCfxVcZiyawVwBOFvyC9y2EKFo92rx
         jObcpYbQHsa992Xf5VoT6+UwY8F6ydrZIbwS6VBg3k17gQJeC60MHYAWP/TxTZn33iTW
         I1bVBo7QwXrrIZs3BkSFN9QSY3iToyTB0yvRAf5ztp7A1tfjdchW9sCG0MrrOB12B+iA
         co0g==
X-Gm-Message-State: AAQBX9cbrZO0DchhU/HMv/q7oMkTtwXXm2DdI7bnEuGSX5F6Gg0TE2of
        PuPLRoc1b6rmAm+GzPGSioec3g==
X-Google-Smtp-Source: AKy350bGw9ye0QyyHuauw+aT8RcP5GbRWyMs9bq4TNM0KhIyUtjWQiDxlmKbWulcAimscfqzgrrhBQ==
X-Received: by 2002:a17:90b:3511:b0:22c:afd6:e597 with SMTP id ls17-20020a17090b351100b0022cafd6e597mr7288067pjb.17.1680713989285;
        Wed, 05 Apr 2023 09:59:49 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c807:a26a:a179:b5ec])
        by smtp.gmail.com with ESMTPSA id a17-20020a170902ee9100b001a24cded097sm10339946pld.236.2023.04.05.09.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 09:59:48 -0700 (PDT)
Date:   Wed, 5 Apr 2023 10:59:46 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Simon Horman <horms@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Dan Carpenter <error27@gmail.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] remoteproc: pru: remove always true check positive
 unsigned value
Message-ID: <20230405165946.GA3812912@p14s>
References: <20230404-pru-always-true-v1-1-b1b55eeff188@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404-pru-always-true-v1-1-b1b55eeff188@kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Apr 04, 2023 at 02:44:53PM +0200, Simon Horman wrote:
> In both cases they type of da is u32. And PRU_PDRAM_DA is 0.
> So the check da >= PRU_PDRAM_DA is always true and can be removed.
> 
> Flagged by Smatch:
> 
>  drivers/remoteproc/pru_rproc.c:660 pru_d_da_to_va() warn: always true condition '(da >= 0) => (0-u32max >= 0)'
>  drivers/remoteproc/pru_rproc.c:709 pru_i_da_to_va() warn: always true condition '(da >= 0) => (0-u32max >= 0)'
> 
> No functional changes intended.
> Compile tested only.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://www.spinics.net/lists/kernel/msg4025983.html
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/remoteproc/pru_rproc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>

Applied

Thanks,
Mathieu


> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index b76db7fa693d..095f66130f48 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -657,7 +657,7 @@ static void *pru_d_da_to_va(struct pru_rproc *pru, u32 da, size_t len)
>  		swap(dram0, dram1);
>  	shrd_ram = pruss->mem_regions[PRUSS_MEM_SHRD_RAM2];
>  
> -	if (da >= PRU_PDRAM_DA && da + len <= PRU_PDRAM_DA + dram0.size) {
> +	if (da + len <= PRU_PDRAM_DA + dram0.size) {
>  		offset = da - PRU_PDRAM_DA;
>  		va = (__force void *)(dram0.va + offset);
>  	} else if (da >= PRU_SDRAM_DA &&
> @@ -706,8 +706,7 @@ static void *pru_i_da_to_va(struct pru_rproc *pru, u32 da, size_t len)
>  	 */
>  	da &= 0xfffff;
>  
> -	if (da >= PRU_IRAM_DA &&
> -	    da + len <= PRU_IRAM_DA + pru->mem_regions[PRU_IOMEM_IRAM].size) {
> +	if (da + len <= PRU_IRAM_DA + pru->mem_regions[PRU_IOMEM_IRAM].size) {
>  		offset = da - PRU_IRAM_DA;
>  		va = (__force void *)(pru->mem_regions[PRU_IOMEM_IRAM].va +
>  				      offset);
> 
