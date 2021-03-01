Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B309C433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Mar 2021 19:01:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05C5A60231
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Mar 2021 19:01:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240863AbhCATBU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Mar 2021 14:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236440AbhCAS7A (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Mar 2021 13:59:00 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A593FC06178C
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Mar 2021 10:58:19 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id q20so12130719pfu.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Mar 2021 10:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qBU5snKCJLHXyoSXwokAuUlwfMqwwxVGB6hJj5aIsUQ=;
        b=CoBSE8ZNWM6hOqRnDJzy30UguMQSWLa0Tpibef9i/4eh7Ack4dGB7pGCJk5ClVt9jT
         diYgBT1LXEXtHVusi7b+4z3Um8b8BXD/iavFB2Wy6i8X4Nb1mVFZukCV0RGpdCjMKVIC
         L5dB2FpH0VPkZBpS4Ewoc/Bp4ki4J2kIt9tSZa/5EfBk4tKnZRjRoWA0qdcbeLT9z9v9
         lHEReRPh9gLBXxJ77myukYmUiaREA9bafDThDOD55isK4Tekxp/ELSJ5Ie2cONG57nMC
         nctipet/FJAxXlQ6sRMPh/nWoCOnDMy8vwaNjY+R3gVE7MH71g/Lisqi5tqQLwbywKkY
         u3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qBU5snKCJLHXyoSXwokAuUlwfMqwwxVGB6hJj5aIsUQ=;
        b=mpPs9aOIs6ylD6PbC3eBTyukEPJT27inQ+4w02NY3CAIcjgzLpn43SZqxwssLn2u2l
         m389SqOd1gfkVN5x1StLqtLqOvhWGp2b490E7Cf7E3YupJfPO27QbZ4QiJ6yy/Iyhrde
         YV/Hj3hOpQTKGhkXjzlXgBgQlFENXHn9NA6vsl32bD/KUWF7K63QBbEbSVYfULcaqlSb
         ONmda8m9gPxRO8uvLwT6CpC0i++Ja0xWbrLJiKA0NsomRgVhieDWLanmEttuhUOVKlOH
         XEadig+bgVkSd/3YkGY/KB4oOCAuB6AHylcrM6TL6Jf2Wj8wsatGe9aaBAzEgloMmIE0
         dcnA==
X-Gm-Message-State: AOAM533gYkhmfL/dUyUe80/o0tnmbNeHhGLHfMYVFndxSxPr9k9L9mrv
        BdBL4l0Re0+Jp/DeD8KK9EZ5PQ==
X-Google-Smtp-Source: ABdhPJyFj3wuFWAbflKxRPfUEmFqy54XBP1dXGVUQPKlMXhgxyN9M/+eNzzTOGdQd9whCOAgR5ryFQ==
X-Received: by 2002:a63:4e44:: with SMTP id o4mr15147415pgl.46.1614625099124;
        Mon, 01 Mar 2021 10:58:19 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 142sm11991253pfz.196.2021.03.01.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 10:58:18 -0800 (PST)
Date:   Mon, 1 Mar 2021 11:58:16 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 16/16] remoteproc: Refactor rproc delete and cdev
 release path
Message-ID: <20210301185816.GC3690389@xps15>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
 <20210223233515.3468677-17-mathieu.poirier@linaro.org>
 <80abdd3b-ffb0-1019-2a1f-fea4f7b51349@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80abdd3b-ffb0-1019-2a1f-fea4f7b51349@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Feb 26, 2021 at 05:23:45PM +0100, Arnaud POULIQUEN wrote:
> 
> 
> On 2/24/21 12:35 AM, Mathieu Poirier wrote:
> > Refactor function rproc_del() and rproc_cdev_release() to take
> > into account the current state of the remote processor when choosing
> > the state to transition to.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> > New for V6:
> > - The RPROC_RUNNING -> RPROC_DETACHED transition is no longer permitted.
> >   to avoid dealing with complex resource table management problems.
> > - Transition to the next state is no longer dictated by a DT binding for
> >   the same reason as above.
> > - Removed Peng and Arnaud's RB tags because of the above.
> > ---
> > 
> >  drivers/remoteproc/remoteproc_cdev.c | 10 ++++++++--
> >  drivers/remoteproc/remoteproc_core.c |  9 +++++++--
> >  2 files changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
> > index 2db494816d5f..0b8a84c04f76 100644
> > --- a/drivers/remoteproc/remoteproc_cdev.c
> > +++ b/drivers/remoteproc/remoteproc_cdev.c
> > @@ -86,11 +86,17 @@ static long rproc_device_ioctl(struct file *filp, unsigned int ioctl, unsigned l
> >  static int rproc_cdev_release(struct inode *inode, struct file *filp)
> >  {
> >  	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, cdev);
> > +	int ret = 0;
> > +
> > +	if (!rproc->cdev_put_on_release)
> > +		return 0;
> >  
> > -	if (rproc->cdev_put_on_release && rproc->state == RPROC_RUNNING)
> > +	if (rproc->state == RPROC_RUNNING)
> >  		rproc_shutdown(rproc);
> > +	else if (rproc->state == RPROC_ATTACHED)
> > +		ret = rproc_detach(rproc);
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  static const struct file_operations rproc_fops = {
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 00452da25fba..a05d5fec43b1 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2542,11 +2542,16 @@ EXPORT_SYMBOL(rproc_put);
> >   */
> >  int rproc_del(struct rproc *rproc)
> >  {
> > +	int ret = 0;
> > +
> >  	if (!rproc)
> >  		return -EINVAL;
> >  
> >  	/* TODO: make sure this works with rproc->power > 1 */
> > -	rproc_shutdown(rproc);
> > +	if (rproc->state == RPROC_RUNNING)
> > +		rproc_shutdown(rproc);
> > +	else if (rproc->state == RPROC_ATTACHED)
> > +		ret = rproc_detach(rproc);
> 
> Here i would not update the code to not change the existing behavior of an
> attached firmware.

Upon reflection your assessment is correct.  This is an unintended
consequence of separating the attach and detach funtionality in two patchset.
Fortunately it is easily fixed by calling rproc_detach() before rproc_del() in
the platform driver, or using the DT.

That being said we can't do much for rproc_cdev_release(), otherwise systems
that only support attach/detach functionality would be broken.

> The decision between a detach or a shutdown probably depends on platform.
> We could (as a next step) reintroduce the "autonomous-on-core-reboot" DT
> property for the decision.
> 
> Regards
> Arnaud
> 
> >  
> >  	mutex_lock(&rproc->lock);
> >  	rproc->state = RPROC_DELETED;
> > @@ -2565,7 +2570,7 @@ int rproc_del(struct rproc *rproc)
> >  
> >  	device_del(&rproc->dev);
> >  
> > -	return 0;
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL(rproc_del);
> >  
> > 
