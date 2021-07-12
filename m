Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A66C07E9C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 18:09:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71AA161221
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 18:09:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235838AbhGLSLv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Jul 2021 14:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234382AbhGLSLv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Jul 2021 14:11:51 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA40FC0613DD
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jul 2021 11:09:02 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d1so4440419plg.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jul 2021 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FTJEjpVdc4PHVQsRq+cNYizxGkwbtgrnfirvLyvLjd0=;
        b=fI/pQ3GPQL3RM1Bbkbs9iBHeB4H4E32As27nGD5nQ43AptsNbB6rw3KbQD4NnZtJah
         nkiMw5GPqlhIh3rA4X79WhdcBURnbK0z4FhnnEOKq9OfpWCwAZOiR1CIPwe/gFeTjOAk
         11uDwt2J2vM1aQqt3prSKAvjE4gdPf0kThMrgYuJ1xN2e8btZCxIdWrMi4FNPwkOBYoz
         6jplb/TmL/tLrldG6XlVs1QKe4h4V2GmBI7ikc+KXFK/hHN4Uxu+Dbz9Bm2XoRKxyEtx
         xponA1meoFpLbhcRa8Jo31FqenWBQ1bLOpVfaEok0G1/kJPodMDCRWOmRIdHup7JisMN
         l0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FTJEjpVdc4PHVQsRq+cNYizxGkwbtgrnfirvLyvLjd0=;
        b=FTEOu3lqeDxj2177YkCqx8+EkpP73bc/J9evo/Mg2feQtTFkot4z1mJoJXthyqC6dK
         vegUtfGvyZ1kqU3mL2FLV7DGqbyF8VEnIXSdSnPWrRUh1ZI7b9FwfnTCN4TOr/+THBut
         Gvx1cblhQn2dYU5Rvcc1JqMCE3pEZSvsSPqq8VZB6tBN2IWZWQbVVBEqG0v2Hd0ZjCgm
         J/1zuwzkZHDt0clG6DXZRCc5BAdoF/UoF4nze50wyKfqpwehKknI2kZktLNVe8xVAgQv
         Zk+3bbPpuJWNQZKgeHj5xGJGL6YappCbNADtPsRFuWLpuNchsQdRartNl4OwlgsdvPjf
         mygg==
X-Gm-Message-State: AOAM530dMLsc/n/j/Kkq3kVq/G4yyWFIvLa78fKKs7FxGpv3KfF6WL6m
        lURs6CyI8vxDIiN3mAOQZ2ju9Q==
X-Google-Smtp-Source: ABdhPJxXJO2exGf5By2YAa6cCpDnTZdAYkT+CLiC5+D5YFzdcJwCLEL4LQHHNu1pulziAHYKUnzzpA==
X-Received: by 2002:a17:90a:474f:: with SMTP id y15mr280045pjg.2.1626113342370;
        Mon, 12 Jul 2021 11:09:02 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id m13sm16072923pfc.119.2021.07.12.11.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 11:09:01 -0700 (PDT)
Date:   Mon, 12 Jul 2021 12:08:59 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/4] remoteproc: imx_rproc: fix rsc-table name
Message-ID: <20210712180859.GC1779922@p14s>
References: <20210706142335.952858-1-aisheng.dong@nxp.com>
 <20210706142335.952858-4-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706142335.952858-4-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jul 06, 2021 at 10:23:35PM +0800, Dong Aisheng wrote:
> Usually the dash '-'  is preferred in node name.

... And yet the DT binding shows &m4_reserved_sysmem1 and
&m4_reserved_sysmem2.

Either change it all or leave as is.

Thanks,
Mathieu

> So far, not dts in upstream kernel, so we just update node name
> in driver.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores booted before Linux Kernel")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 12de153abb2d..26eb130f3263 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -600,7 +600,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		}
>  		priv->mem[b].sys_addr = res.start;
>  		priv->mem[b].size = resource_size(&res);
> -		if (!strcmp(node->name, "rsc_table"))
> +		if (!strcmp(node->name, "rsc-table"))
>  			priv->rsc_table = priv->mem[b].cpu_addr;
>  		b++;
>  	}
> -- 
> 2.25.1
> 
