Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7567C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 24 Mar 2022 15:48:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351392AbiCXPth (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 24 Mar 2022 11:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343730AbiCXPte (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 24 Mar 2022 11:49:34 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38CB5114B
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Mar 2022 08:48:01 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id o8so4140162pgf.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Mar 2022 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KBPHNydxkVOhAgb/0ZNhj4nD6oSionADdioTArt1Vl8=;
        b=xw1s632XXfTZ+5aXkE0y1UEz+Ir37tpKZWDkoT/TcfGPX0DKhVylkGrYSnUzMbSwkS
         vzzKz/uO1E2KxTteAPN24oQAxIz46AIsneTL7AEt+T0y7aiePJu6iQ3/C5Xcw6qJT6t+
         feeV6yAW+u6RVJX8Hh6nJmi/pQ2dGRnVjeL/kdwhOS+fqOU3gSPrflinFVKbIj+vZ7IZ
         FgSBIodB6z+YLl1FcIOjVYIfSzljeYzQkgplupAm7c+3wxqXvPLF1zOQPAgdJs81O+EM
         7ALH7gKP81Rc7tW5SDc/Gamo95QS85ultjQQ/pMmBRPRnE2N1flo1XC7Jrms5aYxPo7a
         waBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KBPHNydxkVOhAgb/0ZNhj4nD6oSionADdioTArt1Vl8=;
        b=WkKeYdm0jTuTFOx+KZ7i08RmTrNWZrccRVaxPGZ4fk+GIkmH0+fk7guE20FlcfgTBr
         mKMIYb33OZRr62UcHMi4MqcolU1HdhXnbtcdSWxUzOrKawEogVTKaviAMYl4lG8TNOqs
         Im4eRH8vfyOr/CEA+ZaPN6YQ8K6WJP/4b8Rn3LHm25KPazpq0pNAQ8lG8tWCBZ1NV2a2
         vYavIiE6DdN5UKnNya8lqeeUanuwJ2j3NrkLCqKn5c91IaSJ0vsYV0pcZdEIQeVlUfU6
         7zeK9baazgQh/JiENdv2ZgpBLoVeySL4toz5rXWoOTVmylb+mTmSKgasnChu3fBaCQbc
         Fqdg==
X-Gm-Message-State: AOAM530CSk+wLM/xEA4bY/eQO/NSwGEl+eC1JmOnQ0KOFPggIVVqxQD5
        aDR8DrkXKzG/NWiPAS8sdQPq9g==
X-Google-Smtp-Source: ABdhPJxdBKbzy5qcZZECB2sC1zChNs+gKDcohpC+PFNEsG6p3/ykvZBoaVIy22uw3tFP1RXAM443rA==
X-Received: by 2002:a05:6a00:2310:b0:4fa:7eb1:e855 with SMTP id h16-20020a056a00231000b004fa7eb1e855mr5808228pfh.14.1648136880523;
        Thu, 24 Mar 2022 08:48:00 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a8b0300b001c735089cc2sm3231580pjn.54.2022.03.24.08.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 08:47:59 -0700 (PDT)
Date:   Thu, 24 Mar 2022 09:47:57 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: Re: [PATCH] remoteproc: core: check rproc->power value before
 decreasing it
Message-ID: <20220324154757.GB3514576@p14s>
References: <1647597096-5480-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647597096-5480-1-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Shengjiu,

On Fri, Mar 18, 2022 at 05:51:36PM +0800, Shengjiu Wang wrote:
> There are possibility that two 'stop' operation happen
> in parallel, then the rproc->power may be decreased to
> -1, that this reference count will be in wrong state.
> So check rproc->power to make sure it is larger than
> zero before decreasing it.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c510125769b9..84e065ad8743 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2075,6 +2075,9 @@ int rproc_shutdown(struct rproc *rproc)
>  		return ret;
>  	}
>  
> +	if (atomic_read(&rproc->power) <= 0)
> +		goto out;
> +

Although the proposed solution will likely work, I think it is best to use
rproc->state for this.  Simply do the same test as in state_store()[1] and exit
if the conditions are not satisfied.  Please do the same thing for
rproc_detach().

Thanks,
Mathieu

[1]. https://elixir.bootlin.com/linux/v5.17/source/drivers/remoteproc/remoteproc_sysfs.c#L205

>  	/* if the remote proc is still needed, bail out */
>  	if (!atomic_dec_and_test(&rproc->power))
>  		goto out;
> -- 
> 2.17.1
> 
