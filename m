Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC433C388F9
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 23:46:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7454F22227
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 23:46:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aXYHBglw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgKSXqO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Nov 2020 18:46:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbgKSXqN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Nov 2020 18:46:13 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E707C0613CF
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2020 15:46:13 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id 18so3838339pli.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2020 15:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mRDpc34T4G7zb3B1b/y6ey3dHC2qXt9UTyFnHTqEoiU=;
        b=aXYHBglwiMpZfPP5o0ZyVf/W/2lbq35zUGQI4y/rT+Jej53GfmZ8eOTF9CFo0F5fZv
         DhyANUVu04TQbIewUeHmX74jnh0Hh7vU3CP0wEKrJnPtae2Jd3irK7Udd928PwtvObSE
         JNyxNs+WvWe8E2SeuKhU2NPnHVZSHPcxaBRtXFyl0L/uXkCzkh3+uSOqwpbjxd4A+Q+/
         vl5okBfa1bqEGeCwir9y4oxnSsar8ltnzuKleayUJXWOO+I5ONN11RWUduikA3hdtKtw
         7NJ8Qwocvu7GhvHWI28nO8a3ur0WUNO5jYnysgrUkzOvQPYYHIXJfj8Jr5JUINSywz+A
         Hl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mRDpc34T4G7zb3B1b/y6ey3dHC2qXt9UTyFnHTqEoiU=;
        b=L9DhMaK8WW2c2n+Bpv23/Zqy40hlJ39QfjVx3YqAbyaoA6gHVO+E6i1j7rqg6ZNaSu
         TtJichl+ZENwnllZy4M0eyk90ZbgGbw9ZFa0FOmJq5BmNSAHsyZbB7qPFfsZDoMib2l5
         XLc6+AITTuCHQbWPJkvnM5SHkyDhD/EZVjPx6k0X7w+opc0MBcvMHU1imv+oM7ISpkwq
         ttVprg1D0hiM3nu6HnP2r3wI72DD0SSfnjeja9d0eMbInUnSY6xiPz36e+nQvIxTW9Vv
         +Cq5W0Z9NmNxTzaAGFQBPHB9/qKFax4cnbABkvOGMpvj43MFUNgNPZ7FIX/8JaKZpFxA
         dwdA==
X-Gm-Message-State: AOAM533yNE/6rF4OIRUn3uOw7GoVp4ZtFQ9Z23Rvt9bdbDRkp2Bs4lm8
        Q75l2f5YhAB+Am+yQv43JEevNg==
X-Google-Smtp-Source: ABdhPJx+guOFD7noeXahqsIqv7qOMtQgW4ALj3pX2tERpypgQY+odEauH1R7S3DxazJZ7cIBEc6/sw==
X-Received: by 2002:a17:902:d216:b029:d8:db1d:24dc with SMTP id t22-20020a170902d216b02900d8db1d24dcmr11518595ply.39.1605829572902;
        Thu, 19 Nov 2020 15:46:12 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e9sm955798pgi.5.2020.11.19.15.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 15:46:12 -0800 (PST)
Date:   Thu, 19 Nov 2020 16:46:10 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH v2 10/14] remoteproc: Add return value to function
 rproc_shutdown()
Message-ID: <20201119234610.GD4137289@xps15>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
 <20201030195713.1366341-11-mathieu.poirier@linaro.org>
 <4c9b5a0d-34d4-ef65-f6d3-d02149ba09a4@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c9b5a0d-34d4-ef65-f6d3-d02149ba09a4@st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 09, 2020 at 10:14:22AM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 10/30/20 8:57 PM, Mathieu Poirier wrote:
> > Add a return value to function rproc_shutdown() in order to
> > properly deal with error conditions that may occur.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 13 +++++++++----
> >  include/linux/remoteproc.h           |  2 +-
> >  2 files changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index de5a5720d1e8..f58475f6dcab 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1869,7 +1869,7 @@ EXPORT_SYMBOL(rproc_boot);
> >   *   returns, and users can still use it with a subsequent rproc_boot(), if
> >   *   needed.
> >   */
> > -void rproc_shutdown(struct rproc *rproc)
> > +int rproc_shutdown(struct rproc *rproc)
> >  {
> >  	struct device *dev = &rproc->dev;
> >  	int ret;
> > @@ -1877,15 +1877,19 @@ void rproc_shutdown(struct rproc *rproc)
> >  	ret = mutex_lock_interruptible(&rproc->lock);
> >  	if (ret) {
> >  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
> > -		return;
> > +		return ret;
> >  	}
> >  
> > -	if (rproc->state != RPROC_RUNNING)
> > +	if (rproc->state != RPROC_RUNNING) {
> > +		ret = -EPERM;
> >  		goto out;
> > +	}
> >  
> >  	/* if the remote proc is still needed, bail out */
> > -	if (!atomic_dec_and_test(&rproc->power))
> > +	if (!atomic_dec_and_test(&rproc->power)) {
> > +		ret = -EBUSY;
> >  		goto out;
> > +	}
> >  
> >  	ret = rproc_stop(rproc, false);
> >  	if (ret) {
> 
> Few lines after in source code rproc_unprepare_device could also be tested

You are correct

> 
> Regards,
> Arnaud
> 
> > @@ -1907,6 +1911,7 @@ void rproc_shutdown(struct rproc *rproc)
> >  	rproc->table_ptr = NULL;
> >  out:
> >  	mutex_unlock(&rproc->lock);
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL(rproc_shutdown);
> >  
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 6713faab6959..71d4d4873164 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -655,7 +655,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
> >  			     u32 da, const char *name, ...);
> >  
> >  int rproc_boot(struct rproc *rproc);
> > -void rproc_shutdown(struct rproc *rproc);
> > +int rproc_shutdown(struct rproc *rproc);
> >  int rproc_detach(struct rproc *rproc);
> >  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
> >  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
> > 
