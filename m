Return-Path: <SRS0=ybdg=6B=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B43EC38A2B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Apr 2020 21:56:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05EC420B1F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Apr 2020 21:56:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dsyr3kKr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgDQV4H (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 17 Apr 2020 17:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728202AbgDQV4G (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Apr 2020 17:56:06 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8465C061A0F
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Apr 2020 14:56:04 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id m21so1657074pff.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Apr 2020 14:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nLgG12h+Hd8FfhWM5JiJ1zf0MmQKC2nKZFGu1YaMACg=;
        b=Dsyr3kKrV0PfJ1qcmqcNeX9UgxdgHiru9nsKVgCNTbTgEJ1+N72uTmuStZjcDl/S5I
         AlIAAONyjWpmxYEijAckgq3gx+6XDpTCnjGRcEldLISlOqf4AQ2kDoH54vvpLGNZCmUy
         cW9X/ePqAaWJaH//whkfE4+K3Vo66dQchL3jQ12NRynQE7ZUKfJsnjRiTr7gP7bJhqbn
         ggoKnPvkQ0UMFP/kMtrE+pb4jveAF+cdjJKJ6qVRU/sVDQ10pFUTIkANYc9VSTgMgys7
         TkfFJVadxHYWzw5KwZmHtha7WBFjHolmZliQRAEc+/OxEQNBKJ0+cx2tk5ibP1zG3rxg
         vJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nLgG12h+Hd8FfhWM5JiJ1zf0MmQKC2nKZFGu1YaMACg=;
        b=a5JakMrMKVS0GrlrNgYlDZMecRK/7eqx6xTX/qQ+rxLKMpac6w7PecMGgaS7h6Hkh1
         1jgOMkiyDtHNHingI4XL7X4WhI+0+M3RqgBtQE00ge1uOuCicUequqgxFwyyK3sMbfrn
         awdxmhGHUVW4lK7ifcdnJF23gFlLyJPJ1eruOivo+MqZFktqUet7T1Jrl5EfKWqm7Utu
         r7n7LKe56Bh2/BkOQQEICz+XUgDaGcLSRuTytBcMG1z0K7zF0QnV0aqQhtgEgDtFRHxV
         JPlATJhbUrXS7Dgfs7VQwrN1vdbbI6w4woWB0vERaOF9IunkCbx3gfwi1CXoES5E9kHg
         Rquw==
X-Gm-Message-State: AGi0Pubu2gmV42I05VNBUx0dZ5pB1qLWLTVIYXb7dHghkiGEMSao778U
        CzzWjgqNtjettLT1DXwrT2kK7zqls/8=
X-Google-Smtp-Source: APiQypL1mJ0kzNVN8tv3e95dUXsKDU2lpJTsogyv+peErq+lFxL9T8mBIJNuNe7BG0Wsx5BNk/F1ig==
X-Received: by 2002:a63:1b4d:: with SMTP id b13mr5107324pgm.311.1587160564244;
        Fri, 17 Apr 2020 14:56:04 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id p68sm17741589pfb.89.2020.04.17.14.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 14:56:03 -0700 (PDT)
Date:   Fri, 17 Apr 2020 15:56:01 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com, elder@linaro.org,
        Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] remoteproc: Split rproc_ops allocation from
 rproc_alloc()
Message-ID: <20200417215601.GC10372@xps15>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-7-mathieu.poirier@linaro.org>
 <61497230-40ec-ffc6-3cc0-e5cb754ac859@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61497230-40ec-ffc6-3cc0-e5cb754ac859@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200417215601.O_uu6TZ8O2MUWYBxIQgYrYDdA_RjmBSVLEyrlilnfhg@z>

On Fri, Apr 17, 2020 at 08:49:25AM -0500, Suman Anna wrote:
> On 4/15/20 3:48 PM, Mathieu Poirier wrote:
> > Make the rproc_ops allocation a function on its own in an effort
> > to clean up function rproc_alloc().
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Reviewed-by: Alex Elder <elder@linaro.org>
> > ---
> >   drivers/remoteproc/remoteproc_core.c | 32 +++++++++++++++++-----------
> >   1 file changed, 20 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 0bfa6998705d..a5a0ceb86b3f 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2001,6 +2001,25 @@ static int rproc_alloc_firmware(struct rproc *rproc,
> >   	return 0;
> >   }
> > +static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
> > +{
> > +	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> > +	if (!rproc->ops)
> > +		return -ENOMEM;
> > +
> > +	/* Default to ELF loader if no load function is specified */
> > +	if (!rproc->ops->load) {
> > +		rproc->ops->load = rproc_elf_load_segments;
> > +		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
> > +		rproc->ops->find_loaded_rsc_table =
> > +						rproc_elf_find_loaded_rsc_table;
> > +		rproc->ops->sanity_check = rproc_elf_sanity_check;
> 
> So, the conditional check on sanity check is dropped and the callback
> switched here without the changelog reflecting anything why. You should just
> rebase this patch on top of Clement's patch [1] that removes the conditional
> flag, and also usage from the remoteproc platform drivers.

That's a rebase that went very wrong...

Thanks for pointing it out,
Mathieu

> 
> regards
> Suman
> 
> [1] https://patchwork.kernel.org/patch/11462013/
> 
> 
> > +		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   /**
> >    * rproc_alloc() - allocate a remote processor handle
> >    * @dev: the underlying device
> > @@ -2040,8 +2059,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >   	if (rproc_alloc_firmware(rproc, name, firmware))
> >   		goto free_rproc;
> > -	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> > -	if (!rproc->ops)
> > +	if (rproc_alloc_ops(rproc, ops))
> >   		goto free_firmware;
> >   	rproc->name = name;
> > @@ -2068,16 +2086,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >   	atomic_set(&rproc->power, 0);
> > -	/* Default to ELF loader if no load function is specified */
> > -	if (!rproc->ops->load) {
> > -		rproc->ops->load = rproc_elf_load_segments;
> > -		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
> > -		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
> > -		if (!rproc->ops->sanity_check)
> > -			rproc->ops->sanity_check = rproc_elf32_sanity_check;
> > -		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
> > -	}
> > -
> >   	mutex_init(&rproc->lock);
> >   	INIT_LIST_HEAD(&rproc->carveouts);
> > 
> 
