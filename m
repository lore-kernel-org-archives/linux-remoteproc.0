Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31567C53210
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Jan 2023 00:22:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234415AbjAEAWr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Jan 2023 19:22:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235015AbjAEAWp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Jan 2023 19:22:45 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1595E43A3C
        for <linux-remoteproc@vger.kernel.org>; Wed,  4 Jan 2023 16:22:44 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id c2-20020a17090a020200b00226c762ed23so401921pjc.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Jan 2023 16:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3c8RG9ethTAlzypVak+6wGrVNQqJ7cf9gqZQVweD01g=;
        b=aNrnNQVzQ5PTmpvCFejqhQvblS1+kHYmgrqGQWdfeMHg0dZcTRtVXdpTbJ8yOwalk1
         ftOuie+k0s++f7kBswj7xbDMopy5jeN03dXlnMpMYq6oveUPOr8kTe6/Fl1XodMqjDme
         XzVmIY/g7DMfSWGFg7c7DcjUI4dNAcEa359lzRklSAGF0cnLGA8gRR6PNFlnjL62K0LB
         /KOreZefwyiAH4jI9Stl6Oa8tqlPVG9pwMYYeztAKhjrqCBqxmtt+pgKYm8fX16SSiQM
         vqYCVWgR6F9pYByawFQB3IUNLxHgGEyqTN91fi621FmCqLeiwvZo0tixHv5Skk+Vhy4T
         Q+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c8RG9ethTAlzypVak+6wGrVNQqJ7cf9gqZQVweD01g=;
        b=VOv5aHMcc5N0rcJ/KFJrO7vgxey7Cs/u61yMqp5y9niXnjwbrtCW1RLxAS1jgrEDP2
         /g8WbaOk2+TDEO6IExXTifOIuoXMYQGoOsOBMvT6HrqFNlDIj2KYmh9VkPfwBzTjyjTL
         l//2NrQLFBAVr0GroDqnGIsj5MdP7bfoiZC0LL7RoAkeDC2zGedjSiXxTsWSrbpfuRCS
         av7dAQRWCHp5WWXjHbmZnTKaSZVUIhWxQSKffPA6nOI7ZR0A7smSDBggSJ/yh8V4YmBY
         BQfPNXpcE9pu558v51jAnyE4VbsQr0okx2xJBorpxtFwZAGtpYgrczSSwZ0QkPVqWGCp
         wHjg==
X-Gm-Message-State: AFqh2koss66B4yW8p2XXTdu5I/pqyS8GtcRXI9Pg03NmwBFUpbzy/UGf
        Fvhze2+aPlsiD8551Wq9iYngFw==
X-Google-Smtp-Source: AMrXdXs0y5+HF3RRYVT+Wm6ldNHIW8HJptsLBJHGReFTQDlrLQMB5hqXUUPZkYOPOAWIykMs5fA8fA==
X-Received: by 2002:a05:6a20:5487:b0:ad:b4a5:8d2f with SMTP id i7-20020a056a20548700b000adb4a58d2fmr77215137pzk.42.1672878163547;
        Wed, 04 Jan 2023 16:22:43 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:1328:ca09:d4c2:fcbc])
        by smtp.gmail.com with ESMTPSA id y4-20020a655b44000000b0047899d0d62csm20920486pgr.52.2023.01.04.16.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 16:22:43 -0800 (PST)
Date:   Wed, 4 Jan 2023 17:22:40 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     MD Danish Anwar <danishanwar@ti.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Suman Anna <s-anna@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        "Andrew F . Davis" <afd@ti.com>, nm@ti.com, vigneshr@ti.com,
        srk@ti.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v12 2/6] remoteproc: pru: Add enum for PRU Core
 Identifiers.
Message-ID: <20230105002240.GE2112402@p14s>
References: <20221216053313.2974826-1-danishanwar@ti.com>
 <20221216053313.2974826-3-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216053313.2974826-3-danishanwar@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Dec 16, 2022 at 11:03:09AM +0530, MD Danish Anwar wrote:
> Introducing enum pruss_pru_id for PRU Core Identifiers.
> PRUSS_PRU0 indicates PRU Core 0.
> PRUSS_PRU1 indicates PRU Core 1.
> PRUSS_NUM_PRUS indicates the total number of PRU Cores.
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> ---
>  drivers/remoteproc/pru_rproc.c |  7 ++++---
>  include/linux/pruss.h          | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 3 deletions(-)
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
> index 000000000000..fbe4fbb45807
> --- /dev/null
> +++ b/include/linux/pruss.h
> @@ -0,0 +1,32 @@
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
> +
> +#endif /* __LINUX_PRUSS_H */
> \ No newline at end of file

I fixed the checkpatch warning associated with this patch but it has a cascading
effect on the other patches.  Please address and send a new revision.  Aside
from this I am good with this patchset.

Thanks,
Mathieu

> -- 
> 2.25.1
> 
