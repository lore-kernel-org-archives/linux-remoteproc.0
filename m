Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DB2ECAAD3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Sep 2022 20:05:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiISUFh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Sep 2022 16:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiISUFf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Sep 2022 16:05:35 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ADA648EAE
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Sep 2022 13:05:35 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id c24so254469plo.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Sep 2022 13:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=3mao7f5jVNZX08MqEeIxZymewe1+TVg9pBkmGQi0xQw=;
        b=soZB+RBfbYVEGaRKSti7J1OPW3wrlO4Z4NW2SsM/poVoe7jskG8ZFGH0UnDDgqNcNF
         6zUXqgznefT96aJXduVmFcYFEPr+CpAZe9LYyy0NcN1NEj9i3lN/ZAMO4QgmZMEd9j0g
         kQE5xndEzclgySkEI+QI+SNd6xNSNLwpUljMO2qdLesqS8nlyrceSjZa/XwKkMCeSShI
         7Xy12xMy3CkUH24qEYLyPW2fsmlkz7hNPXhjqOTtXV8snOqoIk6BBMG/kxPnLcqPgPDG
         ZHKzRLhUaZi9FRQBI6Tm1/S88StgpWL3myzSz5ZYpk1vgNyktWKEjIksm9B8vCIAvawD
         Xotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=3mao7f5jVNZX08MqEeIxZymewe1+TVg9pBkmGQi0xQw=;
        b=mByqyUR2y4jMxDth+wyuY0EFB2xyku3qRMlnnVlop0PElcU3PE7oQSJBESYCRi8CPM
         7UgqeaUakbSvivwNAcsUNojsrUix5ieq27UOtz2zq1r2JiEaPSB03xtVFZ/pbl5W6bJQ
         VunMcoR138gDix/SuGDANA4UkWPFLAkcthQ3PyJsx8VfOiF3BWflPTIG4/IeZys5g6M4
         ZLOu8uE88VuqV6DNF4Ve5ETfMtKTlbGBskfR8y5NbmRVQO9KmdFRmzgPpywH1CB7Lpcu
         lg4GlvPdRFAniaGYvipPjwFfnjXeGn2IzPhwOiFc34kBLCCZMWiBwtUkPVFRv/67bV85
         FwZg==
X-Gm-Message-State: ACrzQf24k1ygahqYEkAyYJbOJyhpiPsxzM0zPyPpa5JRWYVTrm5P0dAx
        CoZJSfcsTDfOFHMV9GUb15XFWQ==
X-Google-Smtp-Source: AMsMyM49MbzERWuQOKEJLX3qmH2Yoajb931/+ouuCz6bP+3bYe6yq6xy2sF4RdMWhib32J87H8gQSA==
X-Received: by 2002:a17:902:eb90:b0:176:b24a:e69b with SMTP id q16-20020a170902eb9000b00176b24ae69bmr1387246plg.86.1663617934546;
        Mon, 19 Sep 2022 13:05:34 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id w63-20020a626242000000b0053dec787698sm21564482pfb.175.2022.09.19.13.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 13:05:33 -0700 (PDT)
Date:   Mon, 19 Sep 2022 14:05:31 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     wangjianli <wangjianli@cdjrlc.com>
Cc:     andersson@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/remoteproc: fix repeated words in comments
Message-ID: <20220919200531.GB759648@p14s>
References: <20220908123237.16911-1-wangjianli@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908123237.16911-1-wangjianli@cdjrlc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 08, 2022 at 08:32:37PM +0800, wangjianli wrote:
> Delete the redundant word 'in'.
> 
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Applied.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e5279ed9a8d7..6e8849f0df18 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -346,7 +346,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  		if (rproc_check_carveout_da(rproc, mem, rsc->vring[i].da, size))
>  			return -ENOMEM;
>  	} else {
> -		/* Register carveout in in list */
> +		/* Register carveout in list */
>  		mem = rproc_mem_entry_init(dev, NULL, 0,
>  					   size, rsc->vring[i].da,
>  					   rproc_alloc_carveout,
> -- 
> 2.36.1
> 
