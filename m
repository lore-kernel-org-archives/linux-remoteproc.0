Return-Path: <SRS0=up26=CN=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D1BC433E2
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Sep 2020 22:07:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F22D2083B
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Sep 2020 22:07:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pBXj5dIP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgIDWHR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Sep 2020 18:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727949AbgIDWHR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Sep 2020 18:07:17 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052AEC061244
        for <linux-remoteproc@vger.kernel.org>; Fri,  4 Sep 2020 15:07:15 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id v196so5350207pfc.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Sep 2020 15:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rIzoHfPgxd+3E/DnNS9bx5RxUwh7cFyQWpb2ORZV+Iw=;
        b=pBXj5dIPqoIuLqV8ZfCAnIMNXzJz75fcVCuvJ4Xxo8wUSAhtNWkliCO2LU9wBAq1t/
         JFKl82sjWryUGnKvmJO3cGTPUULA/XD6CxEYxhPoho0I/q/ZLEpFlgDd75KxZv2IaCkk
         n8oQPyZnsxNpKO5PQSZusjUeUdHEIe8f9WXbI8SKFIkk7giplpPKPkcrWL+8E4In56Ry
         4R/eLoqFalD93Z7lxsCvLAVs4LAYm07dF/aH8nMsf7ZzwFjZFHQ8SpQxEPfl2JPRea6o
         rkBxprfXAL1vdo52d4zAQlcVFCgeREZ1Pd4/i/TfDiR7EDA5PVbsVUcGO1G/zShF0p/O
         6syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rIzoHfPgxd+3E/DnNS9bx5RxUwh7cFyQWpb2ORZV+Iw=;
        b=LzOGArdknwzXAhEJKu9dt5mG4zwgKoFJps8SI39Hr8qK//6o63BnP9XS2GoQKp/Imn
         UekLcT1eKoIWrIvDVdj19UTr7XTh5sv0yNcnVDB/bq2qwk3nk32EKQdWCd4qfWOTOLo4
         7LSJJbDmp8uAWwNy1Yryqp5Ulkw+kclpmOuxnUrLcPpLdJjdZs/Y4RpwagB+88R0f4Ac
         DujOidrtxwWGfvS6xD4+ZUD+F+txHzMJ459yOXVwwJOmmPxTXr5yb7KwKiC2haTnRVHP
         fWUqaIc+HZP6Z0uYX3sUEpsolc0ns6aRVPiiRhxtBO2DE38OLUmspqFx4BW79YXDYckE
         7nsg==
X-Gm-Message-State: AOAM531+3emT16nBwyqP0VZLM0y1AwSiNv6TjvJpVS3/3DWHr6+1MFTS
        ncOEOz5ONPRmvJJu8WMJH7qtMeeTncJdQg==
X-Google-Smtp-Source: ABdhPJzQW6QZjh3PAJh1kfGFsBu+aUQhZ7m+Fx2JVo9u4LHuSUPmXUZpmcBqdsco0MD61PR8KKegLg==
X-Received: by 2002:a62:e40a:0:b029:138:8fd6:7fd5 with SMTP id r10-20020a62e40a0000b02901388fd67fd5mr8899132pfh.1.1599257235357;
        Fri, 04 Sep 2020 15:07:15 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id x4sm7653757pfm.86.2020.09.04.15.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 15:07:14 -0700 (PDT)
Date:   Fri, 4 Sep 2020 16:07:12 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v3 1/3] remoteproc: Expose remoteproc configuration
 through sysfs
Message-ID: <20200904220712.GB404035@xps15>
References: <1599174226-2307-1-git-send-email-rishabhb@codeaurora.org>
 <1599174226-2307-2-git-send-email-rishabhb@codeaurora.org>
 <20200904000454.GD3715@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904000454.GD3715@yoga>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 03, 2020 at 07:04:54PM -0500, Bjorn Andersson wrote:
> On Thu 03 Sep 18:03 CDT 2020, Rishabh Bhatnagar wrote:
> 
> > Add a feature flag to expose some of the remoteproc configuration
> > through sysfs. This feature is helpful in systems where debugfs is
> > not available/mounted. Currently the recovery and coredump
> > configuration is exposed through sysfs rather than debugfs when
> > this feature is selected.
> > 
> 
> This commit message gives me the feeling that it's about making a
> selection between debugfs vs sysfs. But the patches moves the code from
> debugfs to sysfs and then hide it behind this config option.

Yeah, that description is broken.  Probably a copy/paste from V2.

> 
> That said, I just commented on v2 questioning that this should be a
> compile time option at all - might be useful for some drivers to
> dynamically "hide" these sysfs attributes though.

Dynamically hinding those would require intelligence from platform drivers, the
same kind that could have use the API to manipulate the coredump mode.  That
would have been very easy without the need to move anything from debufs.  But
from what Rishab said his problem is at compile time.

Thanks,
Mathieu

> 
> Regards,
> Bjorn
> 
> > Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> > ---
> >  drivers/remoteproc/Kconfig | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index c6659dfe..98d52cbe 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -275,6 +275,17 @@ config TI_K3_DSP_REMOTEPROC
> >  	  It's safe to say N here if you're not interested in utilizing
> >  	  the DSP slave processors.
> >  
> > +config RPROC_SYSFS_CONFIGURATION_SUPPORT
> > +	bool "Expose remoteproc configuration sysfs entries"
> > +	default y
> > +	help
> > +	  Say y here to expose recovery and coredump configuration sysfs
> > +	  entries. This is helpful in operating systems where debugfs is
> > +	  not available/mounted.
> > +
> > +	  It's safe to say N here if you are not interested in accessing
> > +	  recovery and coredump configuration through sysfs.
> > +
> >  endif # REMOTEPROC
> >  
> >  endmenu
> > -- 
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> > 
