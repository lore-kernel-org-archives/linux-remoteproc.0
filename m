Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D236EC11F64
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Jun 2021 20:14:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1FB261CB5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Jun 2021 20:14:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237327AbhF1UQu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Jun 2021 16:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237326AbhF1UQt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Jun 2021 16:16:49 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303B1C061760
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Jun 2021 13:14:23 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id m2so16430331pgk.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Jun 2021 13:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7ZnGDtl1tfzZOtqDAq6jjVvtwOuBD0ilGwgxqjlrpl0=;
        b=xOia3izt7iY8wngK+5KXACBIu+zIQfxgrqgjif9gw0nfalcOoMkpoR/Msi2WhM5y7E
         PIAFQwe8w3irXL6E3icdJ7MiVz4VF9QLtnAOv6TOKAAEtYfRGlgYQdscBfs6ZIwtetQg
         kouiyKS1lMZG/MBGFK7O/rDaqnGma1YHo/eZHD1BnrReneRvxl4Dqpn91gQLFVp5B1yD
         K95hcyXUpG4/7nwJP1/1IrBLILyeaCXxinCBe2RUNG6KxZmH8blXX63qYH7xmh7g+pEd
         XDj58YxTgt2D9cDSEpxurD4ESpE+H744cYpJKgApC30N6gCHeKx32u951Kv5AmnvejO1
         y34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7ZnGDtl1tfzZOtqDAq6jjVvtwOuBD0ilGwgxqjlrpl0=;
        b=qpA91eTkxcuswp4iTvG5BrS/W3w+PLiPMmb0wHgTn4uDOZ13z/1sACDTC38Gy1md1H
         H/dobNTvA3SfKKw+qxrrR/s3E7VEPz0lLvCt/cbZZgYWe2nfIDr48QGtcvoP3Gx9dnxj
         YUgcJe+LbMVknxUA/Y+QUPF29dVjv/60p8BkxYmblCyjmXBMjTqsf4pqTZPWuNeJeCk0
         JYK7s7Sui2H5PS4ArqCM8F1pICaY4/6XPcpHNgUCkAOwTUjusMBbKwSo7jrHrL1OGg0g
         RtEpjO3MMIAwI3rCQSTxqzcdDkLG8f9Xf+bT4K0mLcDlerOmj3e1PzjmoTOkTlx/TWVl
         akUQ==
X-Gm-Message-State: AOAM533az7y8/M7YzfEhMPiFVL+v4Ah5lggzBZ3itUZ8DkmErnUnFqGj
        nJJi5GvyaxlXgYBGNlF4aUp+6Q==
X-Google-Smtp-Source: ABdhPJxVVN3NPc4d9nLhD1Dfr/CZoIM2R8nyecogy9yQcGx2BveE4Qsh5qPv1sZ5R4fRCSu0WHx3Yw==
X-Received: by 2002:a63:445b:: with SMTP id t27mr24798686pgk.413.1624911262721;
        Mon, 28 Jun 2021 13:14:22 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id y6sm15293195pjr.48.2021.06.28.13.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 13:14:21 -0700 (PDT)
Date:   Mon, 28 Jun 2021 14:14:19 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Christoph Hellwig <hch@lst.de>, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: remoteproc DMA API abuse status
Message-ID: <20210628201419.GC1200359@p14s>
References: <20210623134307.GA29505@lst.de>
 <20210624193514.GA1090275@p14s>
 <011dac94-cfe0-d276-980a-b8ffe1447521@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <011dac94-cfe0-d276-980a-b8ffe1447521@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 25, 2021 at 09:27:09AM +0200, Arnaud POULIQUEN wrote:
> Hello Mathieu,
> 
> On 6/24/21 9:35 PM, Mathieu Poirier wrote:
> > Good day Christoph,
> > 
> > On Wed, Jun 23, 2021 at 03:43:07PM +0200, Christoph Hellwig wrote:
> >> Hi remoteproc maintainers,
> >>
> >> did you make any progress to get remoteproc out of creating fake
> >> devices that fake their dma ops status and the abuse of
> >> dma_declare_coherent_memory in removeproc_virtio?  I remember we had
> >> a discussion on this a long time ago, and there was an unfinished
> >> patchset to change the memory pool handling.  What happened to all that?
> > 
> > I believe the conversation and patchset you are referring to are pre-dating my
> > time in this subsystem.  To make sure I am looking at the right thing, can you
> > (or anyone else) point me to that discussion and related patches?
> 
> 2 references:
> 
> 1)Previous discussion thread on the topic:
> 
> https://patchwork.kernel.org/project/linux-remoteproc/patch/AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch/
>

I remember that one.  Glad to see there wasn't anything else before that.

> 2) My patchset related to the refactoring of remoteproc virtio which tries to
> address the point by creating a remoteproc platform driver and declaring a
> virtio subnode in the device tree remoteproc node.
> 
> https://lkml.org/lkml/2020/4/16/1817
> 

I thought your current work on refactoring the rpmsg_char driver was part of the
early steps on the way to splitting that patchset up...

> No time yet on my side to come back on the patchset :(
> 

I know the feeling.

Thanks for the info,
Mathieu

