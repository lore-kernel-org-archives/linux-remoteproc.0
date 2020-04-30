Return-Path: <SRS0=rgFL=6O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262FBC47247
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Apr 2020 19:39:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0069A2073E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Apr 2020 19:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PuudrkrE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgD3TjM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Apr 2020 15:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgD3TjM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Apr 2020 15:39:12 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207FDC035495
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2020 12:39:12 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x77so377158pfc.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2020 12:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3YLsTSYA6OSi+kRwOxjOI3a33Lzrleyq/JqLdZYYEEY=;
        b=PuudrkrEebO698UEwqbhJcjVlOSLNqbTGKWJafVVy3jLZjgD6+MeUM19ZUHvjdPu97
         XVkWfxw6VvhugQp6IVrYY0Jle4OB9fcTxDZKVK/nWpV4vBLdHtraq0Fu/nDp4LgUhLvm
         fC1jsKTTDezGHv3tV/9hgkxL61Z3MFhpYKt4GyS01JWCjLvXQ5s92GHkEoIefqEq4zwo
         6pcpPCE1Flpb404LLaQEziKAI60fNLLFq/UmrxK7C655YqKAahr7H8Nxdo+JzPGLloXS
         5XFgIB14PqeKT86/9+5RoUmUAOcIuv5rqqQiSwnms7o8AO7McnMXJqQ9A6SfPky0G7RA
         KM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3YLsTSYA6OSi+kRwOxjOI3a33Lzrleyq/JqLdZYYEEY=;
        b=gUnSV8xhPojOpksse65vzp8ThzrVZxTNqGV25tcVYksXEZxmPSryZ4eisBQQElZeA+
         lztvR8GChgapg6LPRyC7Xo+x1uVQwx3kEHI9BrHDEz5U+9R5poIJhXFcBBV7PXhCl4C3
         EtY34ypQco1s9IHQevAdWaOZssJ16v/saVsSHFggQwo+p7N7+WtN56wtLcdLfndmRPAI
         9eb1UCEMjU4ikyX+dzKPrlvzGUn37aEo3yv0RG3WvTB61sOeUPTQVCsGpf2am+2eS1d0
         SJKXnpM5I+rRWQTZb3m1ug01C9D5CyrX67vf70maGAlJDyhXPimXxXLlmjt8B8UnE8yd
         RcGQ==
X-Gm-Message-State: AGi0PuYcx7+k6/RdoS2FHpJhbmuxsTu9A/l1DxjReYcW3CduMDZ6VSgu
        zjanjBJLXCtSrUsQsoicX82FoQ==
X-Google-Smtp-Source: APiQypKqWpBlOjc6tnvCdHsQ6SCnI6l6TB8NREpKGzQ0tqm96lzJj35vyscvJfvDauY+spFdLOMpQQ==
X-Received: by 2002:aa7:9ae5:: with SMTP id y5mr340425pfp.294.1588275551540;
        Thu, 30 Apr 2020 12:39:11 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q15sm443545pgj.52.2020.04.30.12.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 12:39:10 -0700 (PDT)
Date:   Thu, 30 Apr 2020 13:39:09 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com, loic.pallardy@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/14] remoteproc: Make core operations optional
Message-ID: <20200430193909.GA17031@xps15>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-2-mathieu.poirier@linaro.org>
 <ff9254d9-6a17-cae5-9f41-2c60303a38ec@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff9254d9-6a17-cae5-9f41-2c60303a38ec@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Apr 28, 2020 at 06:18:59PM +0200, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 4/24/20 10:01 PM, Mathieu Poirier wrote:
> > When synchronizing with a remote processor, it is entirely possible that
> > the remoteproc core is not the life cycle manager.  In such a case core
> > operations don't exist and should not be called.
> 
> What about ops in remote_core.c?
> Applying the series, seems that at least rproc->ops->panic rproc->ops->da_to_va 
> can be called tested with undefined ops structure.

Very true - good catch!

> 
> Regards, 
> 
> Arnaud
> 
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_internal.h | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > index b389dc79da81..59fc871743c7 100644
> > --- a/drivers/remoteproc/remoteproc_internal.h
> > +++ b/drivers/remoteproc/remoteproc_internal.h
> > @@ -67,7 +67,7 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
> >  static inline
> >  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->sanity_check)
> > +	if (rproc->ops && rproc->ops->sanity_check)
> >  		return rproc->ops->sanity_check(rproc, fw);
> >  
> >  	return 0;
> > @@ -76,7 +76,7 @@ int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
> >  static inline
> >  u64 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->get_boot_addr)
> > +	if (rproc->ops && rproc->ops->get_boot_addr)
> >  		return rproc->ops->get_boot_addr(rproc, fw);
> >  
> >  	return 0;
> > @@ -85,7 +85,7 @@ u64 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> >  static inline
> >  int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->load)
> > +	if (rproc->ops && rproc->ops->load)
> >  		return rproc->ops->load(rproc, fw);
> >  
> >  	return -EINVAL;
> > @@ -93,7 +93,7 @@ int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
> >  
> >  static inline int rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->parse_fw)
> > +	if (rproc->ops && rproc->ops->parse_fw)
> >  		return rproc->ops->parse_fw(rproc, fw);
> >  
> >  	return 0;
> > @@ -103,7 +103,7 @@ static inline
> >  int rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc, int offset,
> >  		     int avail)
> >  {
> > -	if (rproc->ops->handle_rsc)
> > +	if (rproc->ops && rproc->ops->handle_rsc)
> >  		return rproc->ops->handle_rsc(rproc, rsc_type, rsc, offset,
> >  					      avail);
> >  
> > @@ -114,7 +114,7 @@ static inline
> >  struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
> >  						   const struct firmware *fw)
> >  {
> > -	if (rproc->ops->find_loaded_rsc_table)
> > +	if (rproc->ops && rproc->ops->find_loaded_rsc_table)
> >  		return rproc->ops->find_loaded_rsc_table(rproc, fw);
> >  
> >  	return NULL;
> > 
