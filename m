Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C05AC433ED
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Apr 2021 23:28:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D917261205
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Apr 2021 23:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236273AbhDFX2u (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Apr 2021 19:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhDFX2u (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Apr 2021 19:28:50 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF69C06174A
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Apr 2021 16:28:41 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id w10so6101234pgh.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Apr 2021 16:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RGNhW1SeCdXrMq4z6mrbdFRDIylhAsC1seorfL6HTAM=;
        b=rpNRun9/6wtnfL2CPb/ElToTlTr/MBgUJSi1HaaTdIjFLJ7NW6EesGp29IN/KMoscW
         m+uRBzeLMM5hqXsUG3zTVi0PyJgeraCxz6BaOPjV8pxQeAZG1xGRWNB3aJbCRYnV7czB
         ZyhF02592EHIhj3tSaET9sXEyyi/ChMhraptbYj57PuyV9gV/ZRRmALEl8ocMuhzf4P4
         +WJl23P2ObKObCZDRg1lKGYrwZ+dF0q3RhXWA+xwTcRJsuy9IzAi2sujuMr0jPxA9AtP
         16TYdP4orK+eF9R/pTH9+ST9Vd6RV3oGdCxfBTEa/UBITVVLSiaHInF9X4BQxgMxqtNs
         pWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RGNhW1SeCdXrMq4z6mrbdFRDIylhAsC1seorfL6HTAM=;
        b=tI+WswAIMzjOqmtD/hQv2F9hvBGZ7xd9jOpvKS9oCS+tVEVA7aHgI2sX7XL8Bfoamj
         rR5k/4X1Ou0avEL5SQqlV7E9yXaIJMmTp6KPzwgR9+Ut4Orqxy+ovgeUr/PeEWu/mb2Y
         Ei4glzJ1uA2SmOhazNtbuzlPPau6YN41ir3Kln75MoIRwVsztL4ZKBZfvcK9wFjupNDn
         aKaS6jej1T1Jh/WYd5tcvaYWsCRJzmYCkoTIWadJs0fHthKaFiIh/rcoe1YQt/iySVSZ
         QPoGgMwDOY+EZtSu+JsqSDZSJhiUhlRDhtQWrdG18dZdSebC56nr+FtTI9wOnGuCoTZh
         PaMQ==
X-Gm-Message-State: AOAM532gKon0vuVogwm9HrscofTmoKazJ6xegXR2VUwInIBv8xUzqn0b
        kWV1YnyJ8K2EghNK7YoRhrMV7nrtM3g/yw==
X-Google-Smtp-Source: ABdhPJwBU6hVyjyLMzyH1bXdT1/Ghkt/24x5WKhTlDwW92zY37reeKFNWQzZR6scrzDv0JVqW74bSw==
X-Received: by 2002:a65:68d3:: with SMTP id k19mr580276pgt.44.1617751721163;
        Tue, 06 Apr 2021 16:28:41 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j16sm19188529pfa.213.2021.04.06.16.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 16:28:40 -0700 (PDT)
Date:   Tue, 6 Apr 2021 17:28:37 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] remoteproc: pru: Fixup interrupt-parent logic for fw
 events
Message-ID: <20210406232837.GA330882@xps15>
References: <20210323223839.17464-1-s-anna@ti.com>
 <20210323223839.17464-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323223839.17464-2-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 23, 2021 at 05:38:37PM -0500, Suman Anna wrote:
> The PRU firmware interrupt mapping logic in pru_handle_intrmap() uses
> of_irq_find_parent() with PRU device node to get a handle to the PRUSS
> Interrupt Controller at present. This logic however requires that the
> PRU nodes always define a interrupt-parent property. This property is
> neither a required/defined property as per the PRU remoteproc binding,
> nor is relevant from a DT node point of view without any associated
> interrupts. The curret logic finds a wrong interrupt controller and
> fails to perform proper mapping without any interrupt-parent property
> in the PRU nodes.
> 
> Fix this logic to always find and use the sibling interrupt controller.
> Also, while at this, fix the acquired interrupt controller device node
> reference properly.
> 
> Fixes: c75c9fdac66e ("remoteproc: pru: Add support for PRU specific interrupt configuration")
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/pru_rproc.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 16979c1cd2f4..a9d07c0751be 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -284,7 +284,7 @@ static int pru_handle_intrmap(struct rproc *rproc)
>  	struct pru_rproc *pru = rproc->priv;
>  	struct pru_irq_rsc *rsc = pru->pru_interrupt_map;
>  	struct irq_fwspec fwspec;
> -	struct device_node *irq_parent;
> +	struct device_node *parent, *irq_parent;
>  	int i, ret = 0;
>  
>  	/* not having pru_interrupt_map is not an error */
> @@ -312,9 +312,16 @@ static int pru_handle_intrmap(struct rproc *rproc)
>  
>  	/*
>  	 * parse and fill in system event to interrupt channel and
> -	 * channel-to-host mapping
> +	 * channel-to-host mapping. The interrupt controller to be used
> +	 * for these mappings for a given PRU remoteproc is always its
> +	 * corresponding sibling PRUSS INTC node.
>  	 */
> -	irq_parent = of_irq_find_parent(pru->dev->of_node);

If I understand correctly when an interrupt controller node wasn't speficied in
the parent this was unwinding until it found one...

> +	parent = of_get_parent(dev_of_node(pru->dev));
> +	if (!parent)
> +		return -ENODEV;
> +
> +	irq_parent = of_get_child_by_name(parent, "interrupt-controller");
> +	of_node_put(parent);
>  	if (!irq_parent) {
>  		kfree(pru->mapped_irq);
>  		return -ENODEV;
> @@ -337,11 +344,13 @@ static int pru_handle_intrmap(struct rproc *rproc)
>  			goto map_fail;
>  		}
>  	}
> +	of_node_put(irq_parent);
>  
>  	return ret;
>  
>  map_fail:
>  	pru_dispose_irq_mapping(pru);
> +	of_node_put(irq_parent);

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  
>  	return ret;
>  }
> -- 
> 2.30.1
> 
