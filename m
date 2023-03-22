Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F418CC76195
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Mar 2023 16:05:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjCVQFn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 22 Mar 2023 12:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbjCVQFl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Mar 2023 12:05:41 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F87865465
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Mar 2023 09:05:40 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so19641486pjz.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Mar 2023 09:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679501140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IukpbyPZH5pOnaBve9gErB6TGgeD/eDs7JQ55KZ8OhA=;
        b=P72cmwiu0JhSN+UMSIcx06wPefsM29+6j6TbTsR+V3kIrZbrHM/lTuO2yxQKZ0Y2LJ
         C5ZIyX+rWbcmamfcazPeFNH363BZXDl+4jEszgHmRPqEz7c92VbHfDVd2Ch1wIpUcMcB
         TTCLga3lpnL8O9Sac+EIP3ND5vNADDjHyI9vRolzJTUTEEHJy8gEXbux55lDQpnbIrPc
         nuqNjy+MdBB8/t37Y0HpqUdztyaf+cELCgMO31EKw/EwucGEraS3c6ASKmxkGbOFCdlk
         C1gbMlJFaUYRfLbm5g/a84r8iJKl5qXlAB/8C5X/nzmUM4pusbd4wq74Xdt1lWqt9ym9
         nqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679501140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IukpbyPZH5pOnaBve9gErB6TGgeD/eDs7JQ55KZ8OhA=;
        b=nfbmPOiWwl/QMO2JvPOvH4Ib+JIO7yzYsIdA+lwrD8RdKFKE3oHLYXJ0qrPYkyFVBm
         oD92KAuDJTlbLi2NutcbuDQriWtBGJhzuoPq0rBpq34owGc/HDH7tWN0Dw8kl0NlItBp
         /B2Wm7BwZq/fHCbkoFejptBjTpHbsXt/WPaRagZIQopnyWG0lPZNOtXFC4bJHEa+ZbQ2
         CexZHlvekZeuBiF1KJ9RKIciJB/FreJFnFbU+JU4XvDMSSJZgq2EEB9Y9AYpTyi/tjIP
         rz7fFXLdw6llYPvyAvms11VxiVSBlKYDq+V+PeWjFZ7ue9/84pS9qOMP5q6Rfesq97sI
         ViWw==
X-Gm-Message-State: AO0yUKX9FogIC2jQZRuvX/a4zRjIAkbcaAP5ExGaTFDcbfXBASPrAAqv
        TPocs4KA+UALlMSGIPrcWlqeCQ==
X-Google-Smtp-Source: AK7set96lwFZZvpRdrznRNkmv4Osn74C/Ehl8khgrbS7UE8IicN6W3Cc1JibkDzW0HFDFkGBFU6jdQ==
X-Received: by 2002:a05:6a20:4c29:b0:d6:d41e:87ee with SMTP id fm41-20020a056a204c2900b000d6d41e87eemr97694pzb.12.1679501139896;
        Wed, 22 Mar 2023 09:05:39 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2eb7:bf6c:83a2:9d2f])
        by smtp.gmail.com with ESMTPSA id t2-20020a62ea02000000b0058dbd7a5e0esm10195680pfh.89.2023.03.22.09.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 09:05:39 -0700 (PDT)
Date:   Wed, 22 Mar 2023 10:05:37 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tanmay Shah <tanmay.shah@amd.com>
Cc:     andersson@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tarak Reddy <tarak.reddy@amd.com>
Subject: Re: [PATCH v2 2/2] remoteproc: enhance rproc_put() for clusters
Message-ID: <20230322160537.GB2821487@p14s>
References: <20230322040933.924813-1-tanmay.shah@amd.com>
 <20230322040933.924813-3-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322040933.924813-3-tanmay.shah@amd.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Tanmay,

On Tue, Mar 21, 2023 at 09:09:36PM -0700, Tanmay Shah wrote:
> This patch enhances rproc_put() to support remoteproc clusters
> with multiple child nodes as in rproc_get_by_phandle().
> 
> Signed-off-by: Tarak Reddy <tarak.reddy@amd.com>
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index a3e7c8798381..e7e451012615 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2560,6 +2560,19 @@ EXPORT_SYMBOL(rproc_free);
>  void rproc_put(struct rproc *rproc)
>  {
>  	module_put(rproc->dev.parent->driver->owner);

There is something wrong here - this should have been removed.

> +	struct platform_device *cluster_pdev;
> +
> +	if (rproc->dev.parent) {

This condition is not needed, please remove.

> +		if (rproc->dev.parent->driver) {
> +			module_put(rproc->dev.parent->driver->owner);
> +		} else {
> +			cluster_pdev = of_find_device_by_node(rproc->dev.parent->of_node->parent);
> +			if (cluster_pdev) {
> +				module_put(cluster_pdev->dev.driver->owner);
> +				put_device(&cluster_pdev->dev);
> +			}
> +		}
> +	}

Some in-lined documentation, the way I did in patch 1/2 would be appreciated.
Otherwize I think the above enhancement make sense.

Thanks,
Mathieu

>  	put_device(&rproc->dev);
>  }
>  EXPORT_SYMBOL(rproc_put);
> -- 
> 2.25.1
> 
