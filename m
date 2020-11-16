Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD1AC4742C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 16:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2FE120776
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 16:39:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="c3SQUeMi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732139AbgKPQjT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 11:39:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730490AbgKPQjT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 11:39:19 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15258C0613CF;
        Mon, 16 Nov 2020 08:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=/M9t61KOqi1MYTJyagjw+b8PgJisejej65ZgJ6XoswQ=; b=c3SQUeMiZ9CED8cEqQQLM9KkUB
        6i+1ST71hFHKpE43MqROlgG6q/v+fN1xdBwUbfi7kGuSWOnKW7HquppFhlrUpXMC+x8MSeYgi37UR
        9LBBGdeyY/8nwkhxPmFbQLe3jkmev9R6j1sWhUHZEyU9UaV1S+L6ALECNoE2Wm/h8QGJB/o+BgGiE
        Xjx+vMS2QqGgXaI/0peIaY40ntlEgZDAxRq4lKfHUwtxzXj/E4/DyQiLGhY8bOZmuPqssbbDTEQWH
        r9/u+8JGT/mB/b6VS7gAiB4jrKn9T34MMvHs6orCNCV+UONq4274s0z2zudslnnUolT2zBOWTklf2
        1erZnp/Q==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kehX1-0005Cd-9h; Mon, 16 Nov 2020 16:39:07 +0000
Date:   Mon, 16 Nov 2020 16:39:07 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Alexander Lobakin <alobakin@pm.me>,
        Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suman Anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH virtio] virtio: virtio_console: fix DMA memory allocation
 for rproc serial
Message-ID: <20201116163907.GA19209@infradead.org>
References: <AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch>
 <20201116091950.GA30524@infradead.org>
 <ca183081-5a9f-0104-bf79-5fea544c9271@st.com>
 <20201116162844.GB16619@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116162844.GB16619@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Btw, I also still don't understand why remoteproc is using
dma_declare_coherent_memory to start with.  The virtio code has exactly
one call to dma_alloc_coherent vring_alloc_queue, a function that
already switches between two different allocators.  Why can't we just
add a third allocator specifically for these remoteproc memory carveouts
and bypass dma_declare_coherent_memory entirely?
