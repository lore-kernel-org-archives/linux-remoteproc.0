Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CCAC54EBC
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Jan 2023 20:24:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235248AbjAEUYU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Jan 2023 15:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235666AbjAEUYB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Jan 2023 15:24:01 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D729463395
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Jan 2023 12:24:00 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so3140837pjj.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Jan 2023 12:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BdPQnZPsNbU7v8vdnBDPJX4Ei7uk+/hU47MzzdZv4JY=;
        b=ZJHtyhEbEExG2mK0lt1w8Q95zOYeqLbYfa2RGWpffEkSjaoUfhTWukEDeXUBn1RHCM
         fpt/aRXL7SJietjXBvp3Qdpm7J8Xd3BeZdDX7EKMJEhuic0nFlOveIf+X7mLwyIi5ep2
         B60IIcWgy33ab0hKe1nIEGIRLXP/Zqq7i0auZB0hKMF0wCXyYupOmr0GorHRDLETpQcR
         HqnLX9VK100Ft4wEykjD/Pp8UrkpsaRHRSKc74MRDpr+YZQyvGJOlQt9zyrUyALJsT8P
         1Ik0zpFAlUB6sV0TG3P5zFVUMPUKeMGHniNV98i4EHVRhgZ/dARSooUlS5xbCYRFzaIx
         dkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdPQnZPsNbU7v8vdnBDPJX4Ei7uk+/hU47MzzdZv4JY=;
        b=ldxZOWyb1Q+jfMlO0ID8ZB6ojNy4xZ7lzIgviwskijtRKl3G7osecepyPXCLySnafs
         yR8CgQfNbZDGFUNBtUr0jRiaMxPe+NKVj9UVWQlvj/W/EvHYA/KmgIwrphDwVRkbJbln
         fHVtCHGQZ4MAzngxsaNMhelpO97qbn7j27oN8Mh2q+YI2pI2Lcm2XbIdEoEFIChIj/03
         MC3KJwYSocaQyjVTQ0xsHpaFnT/lSKEmtTVuLxpgaIxcHJ/wb2XzEpOfbYHc9REB7SPA
         8bUVnKYmnSRDApLZaD4fWyj3Z9kSyVwEBOLWmxup0/sBobga8HfjtVMj+e2hkRRTXoEY
         v7uQ==
X-Gm-Message-State: AFqh2kqR6qLuPFrO5LX1dm66mHnW9qluu7cTCIWJ8U07kdLm6Gn1hmtS
        PSJ6DsKEk+LBrEZsk0lDRl6LaQ==
X-Google-Smtp-Source: AMrXdXsSdNJpdEDK6HJVJgTdEB6KWYZUS7shO4sAk0iXvj/JheXjC6QWpmD7mmCU+NMPyL2hCoJzYg==
X-Received: by 2002:a17:902:c102:b0:192:8e05:1505 with SMTP id 2-20020a170902c10200b001928e051505mr36182840pli.31.1672950240412;
        Thu, 05 Jan 2023 12:24:00 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:1328:ca09:d4c2:fcbc])
        by smtp.gmail.com with ESMTPSA id d12-20020a170903230c00b00187033cac81sm19030920plh.145.2023.01.05.12.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 12:23:59 -0800 (PST)
Date:   Thu, 5 Jan 2023 13:23:56 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     MD Danish Anwar <danishanwar@ti.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Suman Anna <s-anna@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        "Andrew F . Davis" <afd@ti.com>, nm@ti.com, vigneshr@ti.com,
        srk@ti.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v13 2/6] remoteproc: pru: Add enum for PRU Core
 Identifiers.
Message-ID: <20230105202356.GA2281956@p14s>
References: <20230105092149.686201-1-danishanwar@ti.com>
 <20230105092149.686201-3-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105092149.686201-3-danishanwar@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jan 05, 2023 at 02:51:45PM +0530, MD Danish Anwar wrote:
> Introducing enum pruss_pru_id for PRU Core Identifiers.
> PRUSS_PRU0 indicates PRU Core 0.
> PRUSS_PRU1 indicates PRU Core 1.
> PRUSS_NUM_PRUS indicates the total number of PRU Cores.
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> ---
>  drivers/remoteproc/pru_rproc.c |  7 ++++---
>  include/linux/pruss.h          | 31 +++++++++++++++++++++++++++++++

Please add this under include/linux/remoteproc/ to avoid adding an orphan file
under include/linux/.

Thanks,
Mathieu

>  2 files changed, 35 insertions(+), 3 deletions(-)
>  create mode 100644 include/linux/pruss.h
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 128bf9912f2c..a1a208b31846 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -16,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
> +#include <linux/pruss.h>
>  #include <linux/pruss_driver.h>
>  #include <linux/remoteproc.h>
>  
> @@ -438,7 +439,7 @@ static void *pru_d_da_to_va(struct pru_rproc *pru, u32 da, size_t len)
>  	dram0 = pruss->mem_regions[PRUSS_MEM_DRAM0];
>  	dram1 = pruss->mem_regions[PRUSS_MEM_DRAM1];
>  	/* PRU1 has its local RAM addresses reversed */
> -	if (pru->id == 1)
> +	if (pru->id == PRUSS_PRU1)
>  		swap(dram0, dram1);
>  	shrd_ram = pruss->mem_regions[PRUSS_MEM_SHRD_RAM2];
>  
> @@ -747,14 +748,14 @@ static int pru_rproc_set_id(struct pru_rproc *pru)
>  	case RTU0_IRAM_ADDR_MASK:
>  		fallthrough;
>  	case PRU0_IRAM_ADDR_MASK:
> -		pru->id = 0;
> +		pru->id = PRUSS_PRU0;
>  		break;
>  	case TX_PRU1_IRAM_ADDR_MASK:
>  		fallthrough;
>  	case RTU1_IRAM_ADDR_MASK:
>  		fallthrough;
>  	case PRU1_IRAM_ADDR_MASK:
> -		pru->id = 1;
> +		pru->id = PRUSS_PRU1;
>  		break;
>  	default:
>  		ret = -EINVAL;
> diff --git a/include/linux/pruss.h b/include/linux/pruss.h
> new file mode 100644
> index 000000000000..e94a81e97a4c
> --- /dev/null
> +++ b/include/linux/pruss.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/**
> + * PRU-ICSS Subsystem user interfaces
> + *
> + * Copyright (C) 2015-2022 Texas Instruments Incorporated - http://www.ti.com
> + *	Suman Anna <s-anna@ti.com>
> + */
> +
> +#ifndef __LINUX_PRUSS_H
> +#define __LINUX_PRUSS_H
> +
> +#include <linux/device.h>
> +#include <linux/types.h>
> +
> +#define PRU_RPROC_DRVNAME "pru-rproc"
> +
> +/**
> + * enum pruss_pru_id - PRU core identifiers
> + * @PRUSS_PRU0: PRU Core 0.
> + * @PRUSS_PRU1: PRU Core 1.
> + * @PRUSS_NUM_PRUS: Total number of PRU Cores available.
> + *
> + */
> +
> +enum pruss_pru_id {
> +	PRUSS_PRU0 = 0,
> +	PRUSS_PRU1,
> +	PRUSS_NUM_PRUS,
> +};
> +
> +#endif /* __LINUX_PRUSS_H */
> -- 
> 2.25.1
> 
