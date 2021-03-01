Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711ADC433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Mar 2021 19:02:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32D6060231
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Mar 2021 19:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240601AbhCATB4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Mar 2021 14:01:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235993AbhCAS7i (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Mar 2021 13:59:38 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B3BC06178A
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Mar 2021 10:58:57 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id o188so5474994pfg.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Mar 2021 10:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dehH1srb5wSCPruG5pLg/y+gFzUjxYT/97pbvVhtQ+s=;
        b=g3raq5ssPuzA1FpBLkGMU/18l9aA0Skg7LNPeqhbhybLfEtc1pez9y1E4hpdxIj6vg
         VTtPogVFHdmNGHgXE/dcoqA91O9vP4huZzkfJz6iXTnC1xIcRfx+VfwWH4GRWl5anWqs
         IjbnTAU41YC5fPJYZ6jhEZqNfOdrjs4mgaBEdOjOjki6DImVSzZy/XXca5nqk4bCzTle
         DF+Y+Kblk26ejRZlLGQwOPZUh2lT16QvwyiyAAsIv/KRGR/GCmbj8hEKKR+EuQiGRoDL
         VS2+nvUbNVr5WBLoRzJ4EEshQpc/iCE4ZSJXIGY2svdmfUR6L0sVkTUCKejV9dD2HTfi
         3Jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dehH1srb5wSCPruG5pLg/y+gFzUjxYT/97pbvVhtQ+s=;
        b=j2vtm13UBVZpXTWps8ovvAl43x0b01eU2QjkJP1Ib8GAH/6d2dCxMF/Qz9aODtCB3W
         dbVWY2CbJvT9P6DgaMIcCtjG+RzV1Pz3RKPgT2MR3d+W9RsyqEyRp/w0FWtBiztPEWs2
         bFx3Skv5UBZw4gf1UEkO7KEBd736dbbpD+PZBa6O4kWF0JLex8QsVUnKPT/VBEjyW8b6
         fmFbgnSPdgUm0xBsomWMvKrIZQZyd9SsUYvxu8AcgQ0ZOpPtWhdKJGnjjjyrz0DfaAPL
         b9rDl5/v2bUaQs1R7Y85qB+cDYHmE8jne3o77fbFzXiqju4e4zXMwcNf/KYu6D/GcX/B
         m/PQ==
X-Gm-Message-State: AOAM531GM5OY50WaIvHlyqaN7w+cLKRvFfeRK4UPOiqv/5V19Ad9VFOk
        59X7FuU9U5JoypBlupoImTX6ig==
X-Google-Smtp-Source: ABdhPJwwTm+u781GASjPu1pnPgIKPgjBt/7cKp9kBiSMZqrPMimTSqcojwFli98kEyvrUICgHaY53Q==
X-Received: by 2002:a63:4c55:: with SMTP id m21mr15119963pgl.29.1614625136714;
        Mon, 01 Mar 2021 10:58:56 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 9sm16806400pgw.61.2021.03.01.10.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 10:58:56 -0800 (PST)
Date:   Mon, 1 Mar 2021 11:58:54 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 00/16] remoteproc: Add support for detaching a remote
 processor
Message-ID: <20210301185854.GD3690389@xps15>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
 <af614b83-de31-f8fe-8b7d-181a71886aa0@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af614b83-de31-f8fe-8b7d-181a71886aa0@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Feb 26, 2021 at 05:40:49PM +0100, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 2/24/21 12:34 AM, Mathieu Poirier wrote:
> > Following the work done here [1], this set provides support for the
> > remoteproc core to release resources associated with a remote processor
> > without having to switch it off. That way a platform driver can be removed
> > or the application processor power cycled while the remote processor is
> > still operating.
> > 
> > Modifications for this revision are detailed in the changelog of each patch
> > but the main difference is that going from RPROC_RUNNING -> RPROC_DETACHED
> > is no longer supported to avoid dealing tricky resource table issues.
> 
> This seems reasonable to me. If necessary, this could be part of a separate series.
> 
> From test point of view, it is working pretty well on my side.

Thanks for taking a look a this.
Mathieu

> 
> Thanks,
> Arnaud
> 
> > 
> > Applies cleanly on rproc-next (e8b4e9a21af7).  I will rebase on 5.12-rc1 when it
> > comes out next week.
> > 
> > Thanks,
> > Mathieu
> > 
> > Arnaud POULIQUEN (1):
> >   remoteproc: stm32: Move memory parsing to rproc_ops
> > 
> > Mathieu Poirier (15):
> >   remoteproc: Remove useless check in rproc_del()
> >   remoteproc: Rename function rproc_actuate()
> >   remoteproc: Add new RPROC_ATTACHED state
> >   remoteproc: Properly represent the attached state
> >   remoteproc: Add new get_loaded_rsc_table() to rproc_ops
> >   remoteproc: stm32: Move resource table setup to rproc_ops
> >   remoteproc: Add new detach() remoteproc operation
> >   remoteproc: Introduce function __rproc_detach()
> >   remoteproc: Introduce function rproc_detach()
> >   remoteproc: Properly deal with the resource table when attached
> >   remoteproc: Properly deal with a kernel panic when attached
> >   remoteproc: Properly deal with a start request when attached
> >   remoteproc: Properly deal with a stop request when attached
> >   remoteproc: Properly deal with a detach request when attached
> >   remoteproc: Refactor rproc delete and cdev release path
> > 
> >  drivers/remoteproc/remoteproc_cdev.c     |  21 +-
> >  drivers/remoteproc/remoteproc_core.c     | 263 ++++++++++++++++++++---
> >  drivers/remoteproc/remoteproc_internal.h |  10 +
> >  drivers/remoteproc/remoteproc_sysfs.c    |  17 +-
> >  drivers/remoteproc/stm32_rproc.c         | 168 +++++++--------
> >  include/linux/remoteproc.h               |  21 +-
> >  6 files changed, 362 insertions(+), 138 deletions(-)
> > 
