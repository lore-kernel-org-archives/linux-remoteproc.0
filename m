Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD30C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 16 Nov 2021 13:57:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E5AB61BA1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 16 Nov 2021 13:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236882AbhKPOAD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 16 Nov 2021 09:00:03 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:38266 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236145AbhKPOAD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 16 Nov 2021 09:00:03 -0500
X-UUID: 0b77ccc204e74dbcb983fceb93d2deb4-20211116
X-UUID: 0b77ccc204e74dbcb983fceb93d2deb4-20211116
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <mark-pk.tsai@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 3687600; Tue, 16 Nov 2021 21:57:04 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 16 Nov 2021 21:57:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Nov 2021 21:57:03 +0800
From:   Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To:     <mathieu.poirier@linaro.org>
CC:     <bjorn.andersson@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <mark-pk.tsai@mediatek.com>,
        <matthias.bgg@gmail.com>, <ohad@wizery.com>,
        <yj.chiang@mediatek.com>
Subject: Re: [PATCH v2] remoteproc: use %pe format string to print return error code
Date:   Tue, 16 Nov 2021 21:57:03 +0800
Message-ID: <20211116135703.19432-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CANLsYkzsoXw8vCC-OBqHyQv216Rbjf9ZR7FuFK-zxC7gMzt9Kg@mail.gmail.com>
References: <CANLsYkzsoXw8vCC-OBqHyQv216Rbjf9ZR7FuFK-zxC7gMzt9Kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> > > > Use %pe format string to print return error code which
> > > > make the error message easier to understand.
> > > >
> > > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > > ---
> > > >  drivers/remoteproc/remoteproc_core.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > > index 502b6604b757..2242da320368 100644
> > > > --- a/drivers/remoteproc/remoteproc_core.c
> > > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > > @@ -575,8 +575,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > > >                                            dma_get_mask(rproc->dev.parent));
> > > >         if (ret) {
> > > >                 dev_warn(dev,
> > > > -                        "Failed to set DMA mask %llx. Trying to continue... %x\n",
> > > > -                        dma_get_mask(rproc->dev.parent), ret);
> > > > +                        "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> > > > +                        dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
> > >
> > > Macro ERR_PTR() is used to convert error codes to pointer type when
> > > returning from a function - I fail to see how doing so in a dev_warn()
> > > context can make the message easier to understand.  Can you provide an
> > > example?
> >
> > Hi,
> >
> > When dma_coerce_mask_and_coherent() fail, the output log will be as following.
> >
> > format          log
> > %x              Trying to continue... fffffffb
> > %d              Trying to continue... -5
> > %pe             Trying to continue... -5        (if CONFIG_SYMBOLIC_ERRNAME is not set)
> > %pe             Trying to continue... -EIO      (if CONFIG_SYMBOLIC_ERRNAME=y)
>
> When failing, functions dma_coerce_mask_and_coherent() returns -EIO.
> Casting that to a (void *) with ERR_PTR() does not change that value.
> Since variable @ret is already declared as "int" the real fix is to
> change "%x" to "%d".

There're some other drivers do the same thing in the recent kernel, so I think
it's fine to casting the `ret` to a (void *) for more user friendly.
But I suppose it would depend on the maintainer's opinion.

So how about previous patch I sent, which also fix this issue by using %d.

https://lore.kernel.org/lkml/20211102120805.27137-1-mark-pk.tsai@mediatek.com/

