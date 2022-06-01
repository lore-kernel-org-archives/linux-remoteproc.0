Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DE6C43334
	for <linux-remoteproc@archiver.kernel.org>; Wed,  1 Jun 2022 17:42:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355952AbiFARmF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 1 Jun 2022 13:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236698AbiFARmF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Jun 2022 13:42:05 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BC552B08
        for <linux-remoteproc@vger.kernel.org>; Wed,  1 Jun 2022 10:42:03 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id nn3-20020a17090b38c300b001e0e091cf03so4256815pjb.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Jun 2022 10:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tv+lrJqQ4Et9gRDXAG4uoZgL+FzMyJaBz4gkWA0oo5U=;
        b=CEBnpwn7U8OOk2f91B9RzYtl5plgtoA6dQd0KO6OZZqujXGWSQ0c8e3hqmG5vJKa4S
         23N7rY52Mu0KLNHSCkGA69MgZ/XrSpktd+3Hk9AeLccvgQdZiXb/JocKbvzGwaVv8c/O
         wUAAlO/432IEqXF2/0b4ZIZKaARt35imKrx4Cc9WBrE7MGVCINVDJQAq0atRb2V2ks8N
         viSSVCeuHE4vAtviTM49W9Sf/qaRiWp3o59fFCYgZyJdDN3riC0MaLRBwHh92FOzqKxC
         MkfoQ6s7N2UtBM7Fp5tDOmS/Di8e/0k2BB4Sc2XlXIdigGNchLDR22gV/bqcmZNJEd7T
         n6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tv+lrJqQ4Et9gRDXAG4uoZgL+FzMyJaBz4gkWA0oo5U=;
        b=KiCo6H3NLSZeWJMIUhDkmo1ksZG9rtSf94FVRPBWXdGeZu0AmawP8bAGzC7FrcGgGo
         BgVn7JRPguTrYuwKoSqpiY5GfMEcc429iFmEoRSjURGVTNQ0PC8BfmBfThBlTIBAVpVQ
         TIW6171glGSEgp+6wbg4/qh0TeyY3zF9tmVAsecyKZH2xijpkxLF/RCa+Jb9c/oHjEYj
         qrXK6gVVida8bGqspjYQGSihOFzGnqXrPJ1QP4ujPff0cw0sn1l3KNHwJXwVy5jjUPKW
         tUs6klFPve14ZNLJGxOVMqJ1I/6CxccBKEfVFCTN7pki+w3PUVnM8BuJkrr+O2OS+dgg
         JR/A==
X-Gm-Message-State: AOAM532Jb5MCZoI/a3lCzFCgNSh8zawGrom9fbbuk7UrD+0qWTtY33ox
        7NmFcqhMvr+WzWTiNNmRT+A6cQ==
X-Google-Smtp-Source: ABdhPJw2yoeUzjbSj9ybeuQTKhogIf8O8EKVnSQU7o4hWlgDt6lfiDzhSUwWuNKXeuDUnfNfGDALIg==
X-Received: by 2002:a17:90a:8b18:b0:1e0:b1cd:aa9a with SMTP id y24-20020a17090a8b1800b001e0b1cdaa9amr35619537pjn.103.1654105323224;
        Wed, 01 Jun 2022 10:42:03 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 193-20020a6215ca000000b0050dc76281a4sm1782788pfv.126.2022.06.01.10.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 10:42:01 -0700 (PDT)
Date:   Wed, 1 Jun 2022 11:41:59 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: Re: [RFC PATCH v5 2/4] remoteproc: core: Introduce
 rproc_register_rvdev function
Message-ID: <20220601174159.GD531268@p14s>
References: <20220406095446.1187968-1-arnaud.pouliquen@foss.st.com>
 <20220406095446.1187968-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406095446.1187968-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Apr 06, 2022 at 11:54:44AM +0200, Arnaud Pouliquen wrote:
> The rproc structure contains a list of registered rproc_vdev structure.

This should be rproc_rvdev.

> To be able to move the management of the rproc_vdev structure in
> remoteproc_virtio.c (i.e rproc_rvdev_add_device and
> rproc_rvdev_remove_device functions), introduce the rproc_register_rvdev
> and rproc_unregister_rvdev functions.

The name of those functions doesn't match the content of the patch.

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 3a469220ac73..081bea39daf4 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -484,6 +484,18 @@ static int copy_dma_range_map(struct device *to, struct device *from)
>  	return 0;
>  }
>  
> +static void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev)
> +{
> +	if (rvdev && rproc)
> +		list_add_tail(&rvdev->node, &rproc->rvdevs);
> +}
> +
> +static void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> +{
> +	if (rvdev)
> +		list_del(&rvdev->node);
> +}
> +
>  static struct rproc_vdev *
>  rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
>  {
> @@ -547,7 +559,7 @@ rproc_rvdev_add_device(struct rproc *rproc, struct rproc_vdev_data *rvdev_data)
>  			goto unwind_vring_allocations;
>  	}
>  
> -	list_add_tail(&rvdev->node, &rproc->rvdevs);
> +	rproc_add_rvdev(rproc, rvdev);
>  
>  	rvdev->subdev.start = rproc_vdev_do_start;
>  	rvdev->subdev.stop = rproc_vdev_do_stop;
> @@ -576,7 +588,7 @@ static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
>  	}
>  
>  	rproc_remove_subdev(rproc, &rvdev->subdev);
> -	list_del(&rvdev->node);
> +	rproc_remove_rvdev(rvdev);

With the above:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  	device_unregister(&rvdev->dev);
>  }
>  
> -- 
> 2.25.1
> 
