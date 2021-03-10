Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AC7C433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 23:54:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B72C164FC6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 23:54:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234050AbhCJXxi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Mar 2021 18:53:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234108AbhCJXxH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Mar 2021 18:53:07 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A70C5C061760
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 15:53:07 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id 75so14994661otn.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 15:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=STePm3/TxG9rAAgXd9N5KIEzWISsuLXYEPo87xY5kA8=;
        b=K7x/QefjkK5M0ZBXz9muoTBQl6/x5KpifwW1HfEsL/fgWLCpzyMOlHgg4uHWsCTikj
         Qq1+yp+MSlFkciO3zIbTKdDURv6eR/feyA+0C2jBIJG8VDOSSwF4+ASZXhJHB/IBLCno
         WDBa5/u+w4YXDwjjzJGM6Us/+zxPVDZihlbw9YErJm94fjl0SMqKeVs8qb1kyVDFW0BW
         +8qbR7IwgMxiuxzKme10zDiJqq4G/JOrcEjrMiXahzIC5LER9NM90/EBAqzKaFbUAYnv
         Fg+xG2ZaRgZrKbEoW+ZZijK88+yhI1U1OKHhJo6A61XuTiiJkW7X3dgNZtIDFRrbTchz
         5tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=STePm3/TxG9rAAgXd9N5KIEzWISsuLXYEPo87xY5kA8=;
        b=Y+4ruty9AV7MvuuvFkK6JMYEdWp9ZzJI79xI7ak9xHh+hRTWR512+eKrX5Dk9IcjrL
         3gEeGFiLexoI9XpoQf8n+HNTSkljtspFmNQyoK2vEIxc8RlKzf3JU92zvwA/ePZN3+FT
         +GQWnUisTdRa6VJPlWUn74poFcf+YCXDyVjpxMAFTVfHqIRomuXfzsPl3dbZzGTomtPv
         nn+D0ujDOXMJ+nOq40t939exOcOx1slLb6jrr5PwnnAwW0evFbGxc/oSuxrRbVuTcOZh
         o65+0K5slv8sylWj3CNAPWPgAbp7iGdL0mpd+yFLqUEzCheEpm2y1lpk2M3HSVxnZF+V
         c7Rg==
X-Gm-Message-State: AOAM532TfDpbh/Kag8m3e2W1SjZ3teAQ4p8lofC5oulyto29ScHa57Hn
        hYAeSOSvsVzbef/Z2AQCx+ps6wPp6NzQOA==
X-Google-Smtp-Source: ABdhPJxTDt9P62t6CFkPQ9ENCy5L2mqY+b6cxAaC2zvOpINZKvWtdC/J4HI6UYDj059cdp23t9zj+Q==
X-Received: by 2002:a05:6830:225b:: with SMTP id t27mr4523378otd.73.1615420387047;
        Wed, 10 Mar 2021 15:53:07 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g34sm278385otg.51.2021.03.10.15.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 15:53:06 -0800 (PST)
Date:   Wed, 10 Mar 2021 17:53:04 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, arnaud.pouliquen@st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 12/17] remoteproc: Properly deal with the resource
 table when stopping
Message-ID: <YElb4PITwZtMhpAw@builder.lan>
References: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
 <20210310211025.1084636-13-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310211025.1084636-13-mathieu.poirier@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 10 Mar 15:10 CST 2021, Mathieu Poirier wrote:

> When a remote processor that was attached to is stopped, special care
> must be taken to make sure the shutdown process is similar to what
> it would be had it been started by the remoteproc core.
> 
> This patch takes care of that by making a copy of the resource
> table currently used by the remote processor.  From that point on
> the copy is used, as if the remote processor had been started by
> the remoteproc core.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
> New for V7:
>   New Patch, used to be part of 11/16 in V6.
> ---
>  drivers/remoteproc/remoteproc_core.c | 53 +++++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e9ea2558432d..c488b1aa6119 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1634,6 +1634,52 @@ static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
> +{
> +	struct resource_table *table_ptr;
> +
> +	/* A resource table was never retrieved, nothing to do here */
> +	if (!rproc->table_ptr)
> +		return 0;
> +
> +	/*
> +	 * If a cache table exists the remote processor was started by
> +	 * the remoteproc core.  That cache table should be used for
> +	 * the rest of the shutdown process.
> +	 */
> +	if (rproc->cached_table)
> +		goto out;
> +
> +	/* Remember where the external entity installed the resource table */
> +	table_ptr = rproc->table_ptr;
> +

Afaict this is just a remnant from the detach case.

I think the series looks really good now, please let me know and I can
drop the local "table_ptr" as I apply the patches.

Regards,
Bjorn

> +	/*
> +	 * If we made it here the remote processor was started by another
> +	 * entity and a cache table doesn't exist.  As such make a copy of
> +	 * the resource table currently used by the remote processor and
> +	 * use that for the rest of the shutdown process.  The memory
> +	 * allocated here is free'd in rproc_shutdown().
> +	 */
> +	rproc->cached_table = kmemdup(rproc->table_ptr,
> +				      rproc->table_sz, GFP_KERNEL);
> +	if (!rproc->cached_table)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Since the remote processor is being switched off the clean table
> +	 * won't be needed.  Allocated in rproc_set_rsc_table().
> +	 */
> +	kfree(rproc->clean_table);
> +
> +out:
> +	/*
> +	 * Use a copy of the resource table for the remainder of the
> +	 * shutdown process.
> +	 */
> +	rproc->table_ptr = rproc->cached_table;
> +	return 0;
> +}
> +
>  /*
>   * Attach to remote processor - similar to rproc_fw_boot() but without
>   * the steps that deal with the firmware image.
> @@ -1759,7 +1805,12 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  	rproc_stop_subdevices(rproc, crashed);
>  
>  	/* the installed resource table is no longer accessible */
> -	rproc->table_ptr = rproc->cached_table;
> +	ret = rproc_reset_rsc_table_on_stop(rproc);
> +	if (ret) {
> +		dev_err(dev, "can't reset resource table: %d\n", ret);
> +		return ret;
> +	}
> +
>  
>  	/* power off the remote processor */
>  	ret = rproc->ops->stop(rproc);
> -- 
> 2.25.1
> 
