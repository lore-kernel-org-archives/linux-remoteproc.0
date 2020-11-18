Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6D3C5519F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 10:16:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 479D322227
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 10:16:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hMbsrJHn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbgKRKQZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 05:16:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45773 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725772AbgKRKQZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 05:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605694585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Yed5/d7vK7YdqC5lhdZVNcPCr3eQRtrjIPPe/s03Tno=;
        b=hMbsrJHnaxDO+CNXu3IbasSaJL08s4tqsIaqyuLP62IHwV5maJY3XNxpcdqsu//XkHX8pR
        OKzsLiwzrAEaxl2g5+NGvF9kedH311vNs8muptBqtnp5GP5CtWHH2ReZYn0h0eE8yPxYB+
        bPSPp6N9gD2+XA/XdiJBIJnpc9inOn8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-bxcfXml2OuaJ2Dnzt9oAQQ-1; Wed, 18 Nov 2020 05:16:23 -0500
X-MC-Unique: bxcfXml2OuaJ2Dnzt9oAQQ-1
Received: by mail-wm1-f70.google.com with SMTP id z62so2457571wmb.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 02:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yed5/d7vK7YdqC5lhdZVNcPCr3eQRtrjIPPe/s03Tno=;
        b=mnHaiDXpIjxC1AAU2r+WcnMvtN7AXjbY8YG1+/8lYCpEKPKOqfXdVwM9oEo9uH/EZj
         fRfkAu2Zc6Bn62XRLolWReSqAJ+NSI2hnEmtkPjIGl0kpf1/JSXv2EpwFZ0xHQwSLOHe
         yapPknIdC2cnylHnAbV3x6prC1dEdcBC0omCOkgHM4XPeEszuxp6T+52lLT5ddX3ilrK
         8B4dNzL5rI0lzR34Mn6KIJFM+jU5wI58JhB1UAtNFaKNPEBOAfxu1V9sp/Gt1ZPy/C3U
         VlqxDTfrNtAzI/KDdHKkZ8klnaqsJ97sDmKHCrBJxAnZaquQUCLWN94LTkZKnyV5UiWC
         +Omg==
X-Gm-Message-State: AOAM5309Ef0ZBfpH67/NwPVf24ZtvaaRkHyjOS+OBKOsJmtZ5ohyYUWR
        HbfiULQeLqddKoCZxbEf2kVDlKleR5dQOOJs0z4bbCCoi3etkf2fmUsIBCUydHDOyPHB0kl30W8
        VyNjpJNx20qe7lLymAO58IwCos/Kmnw==
X-Received: by 2002:a1c:3c04:: with SMTP id j4mr3793819wma.105.1605694581816;
        Wed, 18 Nov 2020 02:16:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8gTvwJsFF5o43oH2YetHhRlLDl2RZsi15AIAqwyAVp6G3xTEHw8/0j0DSSSEDTs/utrvImA==
X-Received: by 2002:a1c:3c04:: with SMTP id j4mr3793798wma.105.1605694581613;
        Wed, 18 Nov 2020 02:16:21 -0800 (PST)
Received: from redhat.com (bzq-109-67-54-78.red.bezeqint.net. [109.67.54.78])
        by smtp.gmail.com with ESMTPSA id b4sm2360517wmc.1.2020.11.18.02.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 02:16:20 -0800 (PST)
Date:   Wed, 18 Nov 2020 05:16:15 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
        Alexander Lobakin <alobakin@pm.me>,
        Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suman Anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Jason Wang <jasowang@redhat.com>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH virtio] virtio: virtio_console: fix DMA memory allocation
 for rproc serial
Message-ID: <20201118042039-mutt-send-email-mst@kernel.org>
References: <AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch>
 <20201116091950.GA30524@infradead.org>
 <ca183081-5a9f-0104-bf79-5fea544c9271@st.com>
 <20201116162844.GB16619@infradead.org>
 <20201116163907.GA19209@infradead.org>
 <79d2eb78-caad-9c0d-e130-51e628cedaaa@st.com>
 <20201117140230.GA30567@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117140230.GA30567@infradead.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Nov 17, 2020 at 02:02:30PM +0000, Christoph Hellwig wrote:
> On Tue, Nov 17, 2020 at 03:00:32PM +0100, Arnaud POULIQUEN wrote:
> > The dma_declare_coherent_memory allows to associate vdev0buffer memory region
> > to the remoteproc virtio device (vdev parent). This region is used to allocated
> > the rpmsg buffers.
> > The memory for the rpmsg buffer is allocated by the rpmsg_virtio device in
> > rpmsg_virtio_bus[1]. The size depends on the total size needed for the rpmsg
> > buffers.
> > 
> > The vrings are allocated directly by the remoteproc device.
> 
> Weird.  I thought virtio was pretty strict in not allowing diret DMA
> API usage in drivers to support the legacy no-mapping case.

Well remoteproc is weird in that it's use of DMA API precedes
standartization efforts, and it was never standardized in the virtio
spec ..

> Either way, the point stands:  if you want these magic buffers handed
> out to specific rpmsg instances I think not having to detour through the
> DMA API is going to make everyones life easier.

