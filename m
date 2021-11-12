Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EFCC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Nov 2021 02:13:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97A0560E98
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Nov 2021 02:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbhKLCQE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Nov 2021 21:16:04 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:48332 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229908AbhKLCQE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Nov 2021 21:16:04 -0500
X-UUID: cf7cd25a14364a8eb474d0fd2a428fe5-20211112
X-UUID: cf7cd25a14364a8eb474d0fd2a428fe5-20211112
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <mark-pk.tsai@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1034424440; Fri, 12 Nov 2021 10:13:10 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 12 Nov 2021 10:13:10 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Nov
 2021 10:13:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Nov 2021 10:13:10 +0800
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
Date:   Fri, 12 Nov 2021 10:13:10 +0800
Message-ID: <20211112021310.19493-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CANLsYkyLgvMDx-CMLZPEdJ8rUuGX-=QgB++5fz_h_ordm_q1aA@mail.gmail.com>
References: <CANLsYkyLgvMDx-CMLZPEdJ8rUuGX-=QgB++5fz_h_ordm_q1aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Hi Mark,
>
>
> >
> > Use %pe format string to print return error code which
> > make the error message easier to understand.
> >
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 502b6604b757..2242da320368 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -575,8 +575,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >                                            dma_get_mask(rproc->dev.parent));
> >         if (ret) {
> >                 dev_warn(dev,
> > -                        "Failed to set DMA mask %llx. Trying to continue... %x\n",
> > -                        dma_get_mask(rproc->dev.parent), ret);
> > +                        "Failed to set DMA mask %llx. Trying to continue... (%pe)\n",
> > +                        dma_get_mask(rproc->dev.parent), ERR_PTR(ret));
>
> Macro ERR_PTR() is used to convert error codes to pointer type when
> returning from a function - I fail to see how doing so in a dev_warn()
> context can make the message easier to understand.  Can you provide an
> example?

Hi,

When dma_coerce_mask_and_coherent() fail, the output log will be as following.

format		log
%x		Trying to continue... fffffffb
%d		Trying to continue... -5
%pe		Trying to continue... -5	(if CONFIG_SYMBOLIC_ERRNAME is not set)
%pe		Trying to continue... -EIO	(if CONFIG_SYMBOLIC_ERRNAME=y)
