Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0904C77B62
	for <linux-remoteproc@archiver.kernel.org>; Wed,  5 Apr 2023 17:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjDERFe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 5 Apr 2023 13:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234581AbjDERF2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 Apr 2023 13:05:28 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DAA01BEA
        for <linux-remoteproc@vger.kernel.org>; Wed,  5 Apr 2023 10:05:25 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id y2so24116206pfw.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 05 Apr 2023 10:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680714325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0J8BjN3v3zbxtn9Ff5pgyzXShUCpXpsxAXyIsMTyb8Y=;
        b=dSzQwxz/6d293u1whcOfGyDSj4AjNaIWfhA9/jIoXyfnoPgPjpUPkZ205+XxFN7bTl
         kDSO6T+zB9Z/iOcafUQ1EC1GaZJm+M2/XcaDRR+21rmCH9ueVQp0+gIOHC2Qz+QJT9T2
         p+ne9Juq/vR7tJS5muRlJs+wzTiTp5lbgnY7OjIhwtQTWKyIeLiXT08yDkMvKikMWM5I
         atv/1pj1CSO6kxr/nyx3XgNbfbLJ1RkLokTfTIOkhkuxAuqYRQ1SQjsC8801rn2Oiwpp
         NcY/mCiYFxeRSZUcYm0Ur3WaJk/XNUDH38FHS3Mlzy6DqAkurhYWBJZ/GuQoZNFiYM7y
         vV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680714325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0J8BjN3v3zbxtn9Ff5pgyzXShUCpXpsxAXyIsMTyb8Y=;
        b=AJApi1cx5n61yQaXmVPpAhv5msn9Pq4dg+9PujqrQTHztb+1tgso8lAY1jQotHP08d
         mrSIVBsvMxV0UwWlYeMRBDdQZDQZr01Q5h/L0YiM77iDy0OzLCjMU9841FMCGclKLB7D
         rNQkIX0u+3lL73M25uBTKjfpmb8VIQ15/bLI0RzrGDTxpjMD0pP/uxxZRAfNRSX/TUyK
         qEbr1nAwoPAx8qbPV+bH0uX7Oq1NdyTcx7DSFHCAt1WzHwHM2viHV34O1fKBtbmdfVaW
         X2BgjNDBbR22vAScZPUcIADAnlmdQtzc/NrmjUFDOGslBnWPHOXWIT7BbXk4ItKx5D6w
         PFwg==
X-Gm-Message-State: AAQBX9dJJ5+XHciwLe+ooifHL82W3+MSKg/gKWZ1oSFifOsYkXU1K4tj
        zlj1sIm/6l5eq5csqkHl0JQhGg==
X-Google-Smtp-Source: AKy350bSv7SP2W/HmJsUQFAOmeQBv/BRCMSDf3erD7SPH10bbiAi7s+W6emdyhqEG+1Eb1kaR2EYFw==
X-Received: by 2002:aa7:978f:0:b0:625:4b46:e019 with SMTP id o15-20020aa7978f000000b006254b46e019mr3264493pfp.9.1680714324848;
        Wed, 05 Apr 2023 10:05:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c807:a26a:a179:b5ec])
        by smtp.gmail.com with ESMTPSA id x24-20020a63db58000000b0050fb618800dsm9535377pgi.67.2023.04.05.10.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 10:05:24 -0700 (PDT)
Date:   Wed, 5 Apr 2023 11:05:22 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tanmay Shah <tanmay.shah@amd.com>
Cc:     andersson@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Tarak Reddy <tarak.reddy@amd.com>
Subject: Re: [PATCH v3 2/2] remoteproc: enhance rproc_put() for clusters
Message-ID: <20230405170522.GB3812912@p14s>
References: <20230328164921.1895937-1-tanmay.shah@amd.com>
 <20230328164921.1895937-3-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328164921.1895937-3-tanmay.shah@amd.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 28, 2023 at 09:49:24AM -0700, Tanmay Shah wrote:
> This patch enhances rproc_put() to support remoteproc clusters
> with multiple child nodes as in rproc_get_by_phandle().
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303221441.cuBnpvye-lkp@intel.com/
> Signed-off-by: Tarak Reddy <tarak.reddy@amd.com>
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v3:
>   - remove module_put call that was introduced in the patch by mistake
>   - remove redundant check in rproc_put
>   - Add inline comments in rproc_put that explains functionality
> 
> Changes in v2:
>   - Introduce this patch to fix rproc_put as per modified rproc_get_by_phandle
> 
>  drivers/remoteproc/remoteproc_core.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index a3e7c8798381..d8f28c6fe3a3 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2559,7 +2559,22 @@ EXPORT_SYMBOL(rproc_free);
>   */
>  void rproc_put(struct rproc *rproc)
>  {
> -	module_put(rproc->dev.parent->driver->owner);
> +	struct platform_device *cluster_pdev;
> +
> +	if (rproc->dev.parent->driver) {
> +		module_put(rproc->dev.parent->driver->owner);
> +	} else {
> +		/*
> +		 * If the remoteproc's parent does not have a driver,
> +		 * driver is associated with the cluster.
> +		 */
> +		cluster_pdev = of_find_device_by_node(rproc->dev.parent->of_node->parent);
> +		if (cluster_pdev) {
> +			module_put(cluster_pdev->dev.driver->owner);
> +			put_device(&cluster_pdev->dev);
> +		}
> +	}
> +

This looks good to me now.

Bjorn, please have a look at this set when you have a minute.

Thanks,
Mathieu

>  	put_device(&rproc->dev);
>  }
>  EXPORT_SYMBOL(rproc_put);
> -- 
> 2.25.1
> 
