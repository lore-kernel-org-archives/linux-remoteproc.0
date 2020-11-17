Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FA9C64E75
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 Nov 2020 14:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F03E2083E
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 Nov 2020 14:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dmPoiDU8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387478AbgKQOCz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 Nov 2020 09:02:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387477AbgKQOCy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 Nov 2020 09:02:54 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BA5C0613CF;
        Tue, 17 Nov 2020 06:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=m0hk7B27NeOlPrLY9cJvHDlIQhUidBou/7Utsa5IK1g=; b=dmPoiDU8T3nNQ2t/waEeUgrzZI
        k5qNrx2A0lHyPcMXIWNDO0HshkfKPtpOVNdWQJYjkYcYByLttcMxJHgNzVu4a90Z78/r3OezLmBao
        FU3EuqTrqylL4pd0zDJ5wo11G8mxUPs4VesrCfSMlYHNoCE8LZ2KA5caKj2Qe+IaFAGjBLzd9eXX5
        bOQrnE7lBoJmrbAJcCv0y6TXYbj9qmzcmPHMyjfeECuKcA+1f9Yksr1Ij0vg0393q5JhoLioopfN0
        tg4wklF1HbhnUL6sdcamNXOADkGJY5O/Hh8vYDxX9NMdbEV8SIRiV2R/YnhtFWW58o2fpWe2r/FqC
        qMBg9a3w==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kf1Z0-00087I-Ri; Tue, 17 Nov 2020 14:02:30 +0000
Date:   Tue, 17 Nov 2020 14:02:30 +0000
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
Message-ID: <20201117140230.GA30567@infradead.org>
References: <AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch>
 <20201116091950.GA30524@infradead.org>
 <ca183081-5a9f-0104-bf79-5fea544c9271@st.com>
 <20201116162844.GB16619@infradead.org>
 <20201116163907.GA19209@infradead.org>
 <79d2eb78-caad-9c0d-e130-51e628cedaaa@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79d2eb78-caad-9c0d-e130-51e628cedaaa@st.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Nov 17, 2020 at 03:00:32PM +0100, Arnaud POULIQUEN wrote:
> The dma_declare_coherent_memory allows to associate vdev0buffer memory region
> to the remoteproc virtio device (vdev parent). This region is used to allocated
> the rpmsg buffers.
> The memory for the rpmsg buffer is allocated by the rpmsg_virtio device in
> rpmsg_virtio_bus[1]. The size depends on the total size needed for the rpmsg
> buffers.
> 
> The vrings are allocated directly by the remoteproc device.

Weird.  I thought virtio was pretty strict in not allowing diret DMA
API usage in drivers to support the legacy no-mapping case.

Either way, the point stands:  if you want these magic buffers handed
out to specific rpmsg instances I think not having to detour through the
DMA API is going to make everyones life easier.
