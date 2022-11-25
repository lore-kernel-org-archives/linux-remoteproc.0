Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3582BC4332F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Nov 2022 18:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiKYSFP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 25 Nov 2022 13:05:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbiKYSFO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Nov 2022 13:05:14 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC592CCAD
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Nov 2022 10:05:12 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id b29so4749117pfp.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Nov 2022 10:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s2IFtudoZU2nVE+GIEWUVRnTSLQ/3FbS3sFS+J+oVhE=;
        b=Swgf8l+PLm5MGb9+zvxQc1Gxu8bLWEzjoh8Amd0aZjN2AwMyTeiZc64ODopNjA16eF
         GeMhgNdUNQnUoKU3UFh7xK2thLvQQwyuNR4S2ZOGUxSUYz8Em0XmBjxHJc/07YLC9U9m
         wFBt53MqVfCKCLyzMlSXQvo22sJxzTruagVYLI/Qa70YFnMAU0J0jq5Q3jorSexq78cy
         cpkLbAo8iTyppljBjLw8CzdLYEq67GvBRAhMpUeizuQ8Tb6/UkprSFTWGm/jmoV2fqZ0
         bHcjw59qY3gIvTT2eHYCLWZkG+loaHQ3wKHF3wYoDl7KtwtFVOnorluXvSqWOJXwTVUG
         Hw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2IFtudoZU2nVE+GIEWUVRnTSLQ/3FbS3sFS+J+oVhE=;
        b=H6ElEDiLkXeLIvFrBMIpvEpsLuLBfU0VGPH1i1jU2403DRKAcG805NToeRqmU/Xwx+
         T3ELI9UxE11Us7V1zYgLqq6vgI5mUEbftjIu5elP5RggThk28IKF7YVqpFjjrPbdBztM
         pknfr0edcb1QoplUGGyWVlPW1cCnkxpG3NTrn1CWPdoC+6SO4U69lcEx1b7GygfupJSx
         y7BkvMy9nGltjXSikfuzDXZOKEhLjEHo0oY9JeVtJJPP+YQfwilqcIOOX3hYe4I+uY6Q
         47sKtSgOTK8LBeXgeNEiiNRV/22YCRouGdvHnWcpKio6kL9ye9rJl1e7jWhQgXXucOz9
         rZzA==
X-Gm-Message-State: ANoB5pl9vDVaOA5TlWUObtzNPPplTLMDBHhQG0RgsoogZ3b3TZfY1pbj
        A+n5JolYXPI8hDHPlqWUDS7Vtg==
X-Google-Smtp-Source: AA0mqf4f9kZ1Y0bhlp+0bKHq+mLu+/c4Yslxhmx5ZN8P7uafiwvispOMGAlJoZJj6yx7mez60NBHDw==
X-Received: by 2002:a63:120c:0:b0:477:6ccd:9f4 with SMTP id h12-20020a63120c000000b004776ccd09f4mr21584024pgl.534.1669399512364;
        Fri, 25 Nov 2022 10:05:12 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:fd14:ad8b:6b7b:c61])
        by smtp.gmail.com with ESMTPSA id y7-20020a1709027c8700b00186b86ed450sm3666275pll.156.2022.11.25.10.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 10:05:11 -0800 (PST)
Date:   Fri, 25 Nov 2022 11:05:09 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     arnaud.pouliquen@foss.st.com, bill.mills@linaro.com,
        tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] remoteproc: Introduce rproc_get_by_id API
Message-ID: <20221125180509.GA622847@p14s>
References: <20221115153753.2065803-1-ben.levinsky@xilinx.com>
 <20221115153753.2065803-2-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115153753.2065803-2-ben.levinsky@xilinx.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Ben,

On Tue, Nov 15, 2022 at 07:37:53AM -0800, Ben Levinsky wrote:
> Allow users of remoteproc the ability to get a handle to an rproc by
> passing in node that has parent rproc device and an ID that matches
> an expected rproc struct's index field.
> 
> This enables to get rproc structure for remoteproc drivers that manage
> more than 1 remote processor (e.g. TI and Xilinx R5 drivers).
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 64 +++++++++++++++++++++++++++-
>  include/linux/remoteproc.h           |  1 +
>  2 files changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 775df165eb45..6f7058bcc80c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -40,6 +40,7 @@
>  #include <linux/virtio_ring.h>
>  #include <asm/byteorder.h>
>  #include <linux/platform_device.h>
> +#include <linux/of_platform.h>
>  
>  #include "remoteproc_internal.h"
>  
> @@ -2203,13 +2204,74 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
>  
>  	return rproc;
>  }
> +
> +/**
> + * rproc_get_by_id() - find a remote processor by ID
> + * @phandle: phandle to the rproc
> + * @id: Index into rproc list that uniquely identifies the rproc struct
> + *
> + * Finds an rproc handle using the remote processor's index, and then
> + * return a handle to the rproc. Before returning, ensure that the
> + * parent node's driver is still loaded.
> + *
> + * This function increments the remote processor's refcount, so always
> + * use rproc_put() to decrement it back once rproc isn't needed anymore.
> + *
> + * Return: rproc handle on success, and NULL on failure
> + */
> +
> +struct rproc *rproc_get_by_id(phandle phandle, unsigned int id)
> +{
> +	struct rproc *rproc = NULL, *r;
> +	struct platform_device *parent_pdev;
> +	struct device_node *np;
> +
> +	np = of_find_node_by_phandle(phandle);
> +	if (!np)
> +		return NULL;
> +
> +	parent_pdev = of_find_device_by_node(np->parent);
> +	if (!parent_pdev) {
> +		dev_err(&parent_pdev->dev,
> +			"no platform device for node %pOF\n", np);
> +		of_node_put(np);
> +		return NULL;
> +	}
> +
> +	/* prevent underlying implementation from being removed */
> +	if (!try_module_get(parent_pdev->dev.driver->owner)) {
> +		dev_err(&parent_pdev->dev, "can't get owner\n");
> +		of_node_put(np);
> +		return NULL;
> +	}
> +
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(r, &rproc_list, node) {
> +		if (r->index == id) {
> +			rproc = r;
> +			get_device(&rproc->dev);
> +			break;
> +		}
> +	}

This won't work because several remote processors can be on the list.  If
another remote processor was discovered before the one @phandle is associated
with, the remote processor pertaining to that previous one will returned.

There is also an issue with rproc_put().  

I think your description of the problem is mostly correct.  The intermediate
devices created by the cascading entries for individual remote processors in the
device tree are causing an issue.  The "compatible" string for each remote
processor can't be handled by any platform drivers (as it should be), which
makes try_module_get() fail because r->dev.parent->driver is not bound to
anything.

Looking at the code for Xilinx's R5F support that I just queued[1], the simplest
solution may be to pass @dev, which is in fact @cluster->dev, to
zynqmp_r5_add_rproc_core() rather than the device associated with the
intermediate platform device.

That _should_ work.  It is hard for me to know for sure since I don't have a
platform that has dual core remote processor to test with.

Get back to me with how that turned out and we'll go from there.

Thanks,
Mathieu

[1]. https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/remoteproc/xlnx_r5_remoteproc.c?h=rproc-next#n923

> +	rcu_read_unlock();
> +
> +	of_node_put(np);
> +
> +	return rproc;
> +}
> +EXPORT_SYMBOL(rproc_get_by_id);
>  #else
>  struct rproc *rproc_get_by_phandle(phandle phandle)
>  {
>  	return NULL;
>  }
> -#endif
>  EXPORT_SYMBOL(rproc_get_by_phandle);
> +struct rproc *rproc_get_by_id(phandle phandle, unsigned int id)
> +{
> +	return NULL;
> +}
> +EXPORT_SYMBOL(rproc_get_by_id);
> +#endif
>  
>  /**
>   * rproc_set_firmware() - assign a new firmware
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 3cde845ba26e..10961fae0f77 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -645,6 +645,7 @@ struct rproc_vdev {
>  };
>  
>  struct rproc *rproc_get_by_phandle(phandle phandle);
> +struct rproc *rproc_get_by_id(phandle phandle, unsigned int id);
>  struct rproc *rproc_get_by_child(struct device *dev);
>  
>  struct rproc *rproc_alloc(struct device *dev, const char *name,
> -- 
> 2.25.1
> 
