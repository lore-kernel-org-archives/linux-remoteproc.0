Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888B3C433F5
	for <linux-remoteproc@archiver.kernel.org>; Sat, 23 Apr 2022 17:46:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236655AbiDWRtx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 23 Apr 2022 13:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236673AbiDWRtw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 23 Apr 2022 13:49:52 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642703336F;
        Sat, 23 Apr 2022 10:46:55 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 0A68C68B05; Sat, 23 Apr 2022 19:46:50 +0200 (CEST)
Date:   Sat, 23 Apr 2022 19:46:50 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, hch@lst.de, m.szyprowski@samsung.com,
        matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com
Subject: Re: [PATCH 0/2] dma-mapping, remoteproc: Fix dma_mem leak after
 rproc_shutdown
Message-ID: <20220423174650.GA29219@lst.de>
References: <20220422062436.14384-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422062436.14384-1-mark-pk.tsai@mediatek.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Sigh.  In theory drivers should never declare coherent memory like
this, and there has been some work to fix remoteproc in that regard.

But I guess until that is merged we'll need somthing like this fix.
