Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B24DC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Dec 2021 16:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382141AbhLCQnr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 3 Dec 2021 11:43:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382135AbhLCQnp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Dec 2021 11:43:45 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8DEC061354
        for <linux-remoteproc@vger.kernel.org>; Fri,  3 Dec 2021 08:40:21 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id o4so6835073oia.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Dec 2021 08:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vuywILYi23s5yQs0mhTLzGosTuRK+KDz7zZA682EYlA=;
        b=MMr1DTg3D6nTPenHlKo8dHUowaecrHqlv2qOySRfK9TwgzFXE72Wr9n3pR813MnIW4
         Af37m0JcHKWL9JW1Si1Gs4OBMsPbcpcsKWLrlR5pdO4c9rp/jAMFHSKSb39f4w9Ks5wX
         2CzuAdEYw4ddMP/GFUpmDukvYch9sU4FWsrJ6w2BLFuQ+T2R/4ZmN8LK/62BEcSjmk/D
         qeJszuXQXrP8OysR25h0FYXTtOmuwh5jR47LQxlg46KNjni7qFj7wZMkas6cx8kRQdOJ
         i4YLU3iyVgARp5jwODRmBN2INNuV5kr+I3r2l+WdyUlpbB4G226QadqAERpnjv1y8rur
         4yKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vuywILYi23s5yQs0mhTLzGosTuRK+KDz7zZA682EYlA=;
        b=yLN+zUl/nVRPEy9zLvEYsqDav0bgLYcheC94KI7HYXKuheD2w/ebqCWGhXrgXlTZ7k
         WkfoirajyJHNNaWNAuSSi1Bx/zcwpDupOuisQlfD79+jCEVuHIq5pAoLN7Ote+myejxe
         ezu25VUcQHb/eREn5BubdgcUqYSMEId+xsZUfqu/nJQ/2eG5aB5tMbBqfD/DQ36Os9bZ
         c8a7jueeESy1e7SRchzuhJ2mWiIv5Aw9AAftfCYlRJnzeQRp2QLMboeAKm0mpW1i1Yyl
         vavwFqw4z6P/05TsvjGTZkTt1awsoRucOXbTgSlW0idvpfJcC+dae5E2AfvBqAmET/JD
         cYxQ==
X-Gm-Message-State: AOAM531grCi3wthirGvvEXiPsnJL1Mlb9po9AQuegi3m6chddB0WKxgo
        lONg6ZpFFnSpvaJYv2hNXDIPnK4cb2c9OA==
X-Google-Smtp-Source: ABdhPJzC9FbUuXGA0p2m85UVEZDw6dqr7bvhsvUNBytymvDILyCQ+r4fp1N1e1of83LT2Ne9joYL2g==
X-Received: by 2002:aca:3643:: with SMTP id d64mr10821894oia.107.1638549620871;
        Fri, 03 Dec 2021 08:40:20 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a17sm889656oiw.43.2021.12.03.08.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 08:40:20 -0800 (PST)
Date:   Fri, 3 Dec 2021 08:41:50 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v7 01/12] rpmsg: char: Export eptdev create an destroy
 functions
Message-ID: <YapIzuCJFgMVamoI@ripper>
References: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
 <20211108141937.13016-2-arnaud.pouliquen@foss.st.com>
 <Yal+LKVqvp2v26BD@builder.lan>
 <54cc46a3-b8bd-a6ac-cd7b-9741eee5131d@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54cc46a3-b8bd-a6ac-cd7b-9741eee5131d@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 03 Dec 08:37 PST 2021, Arnaud POULIQUEN wrote:
> On 12/3/21 3:17 AM, Bjorn Andersson wrote:
> > On Mon 08 Nov 08:19 CST 2021, Arnaud Pouliquen wrote:
[..]
> >> +static inline int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> >> +					     struct rpmsg_channel_info chinfo)
> >> +{
> >> +	/* This shouldn't be possible */
> > 
> > But isn't it very much possible that userspace invokes this function
> > through the ioctl that you move to the separate rpmsg_ctrl driver?
> > 
> >> +	WARN_ON(1);
> > 
> > Which would mean that this will spam the kernel with stack dumps.
> 
> Good catch, I will suppress the WARM_ON. I propose also to return -ENXIO
> instead of -EINVAL to be aligned with other functions in rpmsg.h
> 

ENXIO sounds better than EINVAL, let's go with that.

Thanks,
Bjorn
