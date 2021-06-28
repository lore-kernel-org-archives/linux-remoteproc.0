Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA1FC2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Jun 2021 13:37:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4224A6145F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Jun 2021 13:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhF1NkB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Jun 2021 09:40:01 -0400
Received: from verein.lst.de ([213.95.11.211]:36487 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232124AbhF1NjT (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Jun 2021 09:39:19 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 40E216736F; Mon, 28 Jun 2021 15:36:51 +0200 (CEST)
Date:   Mon, 28 Jun 2021 15:36:51 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Christoph Hellwig <hch@lst.de>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: remoteproc DMA API abuse status
Message-ID: <20210628133651.GA21504@lst.de>
References: <20210623134307.GA29505@lst.de> <20210624193514.GA1090275@p14s> <011dac94-cfe0-d276-980a-b8ffe1447521@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <011dac94-cfe0-d276-980a-b8ffe1447521@foss.st.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 25, 2021 at 09:27:09AM +0200, Arnaud POULIQUEN wrote:
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
> 2) My patchset related to the refactoring of remoteproc virtio which tries to
> address the point by creating a remoteproc platform driver and declaring a
> virtio subnode in the device tree remoteproc node.
> 
> https://lkml.org/lkml/2020/4/16/1817
> 
> No time yet on my side to come back on the patchset :(

I was hoping you'd make some progress on that.  Any way I could help
without having access to the relevant hardware myself?
