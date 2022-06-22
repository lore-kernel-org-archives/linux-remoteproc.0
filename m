Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDB8C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Jun 2022 16:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358676AbiFVQZq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 22 Jun 2022 12:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241588AbiFVQZp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Jun 2022 12:25:45 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C0031DF2
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jun 2022 09:25:44 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id y6so15843339plg.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jun 2022 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nhVxaWNtri1CK0PHzSlalIxtbdAU1PUSddkvaK/+5e4=;
        b=PUGiKBVAkeTgsz2FqLGI7rWQhLimJ38Xj+5Zg180pQyl0ruN+w1AjCcu6fqIZDYjAB
         xG7oN1xzGX2iFM2bnPKINZLXHu/lSyd7wtYcs6OqMcEsqPQA2ynY1LEED97pYyPuEA5B
         qtjsWDJ0vo7Vf+PB9f1yhRi+Rw4TyPhDuxJREQV6OxJ3nV4lruvuhc13IAbkfYRrajre
         naFQHrt0Xgp0jY0cOGp6yjxaC3Dv9YICKdu9t5JldYvxQvfXK3p5P16zqjzR9I19PgF3
         /sdblCFTDXUvSKaef4l5DisLWhm6bhKAkqGEKtWAtc5F2Tt7FQx53ATs58M4BElSCBe/
         zQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nhVxaWNtri1CK0PHzSlalIxtbdAU1PUSddkvaK/+5e4=;
        b=aLVmmtSzHVMp44ZZlk7TJ8CA6T1vM4Y/qE06sAcWsi/oQ2m9Wk7PEmWvEOiZynv2Cj
         DAktM7JsJ89gwnr60rcnhqIvlYYbqenXl+Z0zFgsjmziLmgUzQvTjWEVEHTwaXvxveyf
         nQaxfN9DTK5x9c6ueAbrwb8+fV99p1GzalUmRLvgRbMRpjjnQCqZfRpK5eLDjrWgVs/H
         hymDqFjbshjU4XTnnW/VWdyDWQ+TkxVbRRy9ewt4IYk6ijkuVjeaXsHBaq8M0mLuKt1T
         NFyJpmoaz0rCQZuqyKPlR5e8aOxSb5RKuKy0zIItzNiPwbHuiKBY1QbyNTgZ0jt5QbEr
         Cwgw==
X-Gm-Message-State: AJIora+NxCa+9iHMfVTv4DCv/u/DyQKVUtfifI+JDipPLdDx8Y41liLv
        n0wAghIbkA1tgg5NmREmXnuLng==
X-Google-Smtp-Source: AGRyM1ty3j96F9rBRPvE63v1BVhmw6iHaLjHVSskbjQhiqe7Ui9yA3Lv+QHsTJmdNJXt+uuOX/uoew==
X-Received: by 2002:a17:90a:9408:b0:1ec:9453:2ebc with SMTP id r8-20020a17090a940800b001ec94532ebcmr4523830pjo.150.1655915144128;
        Wed, 22 Jun 2022 09:25:44 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 74-20020a62164d000000b005254535a2cfsm2035941pfw.136.2022.06.22.09.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 09:25:43 -0700 (PDT)
Date:   Wed, 22 Jun 2022 10:25:40 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
        bjorn.andersson@linaro.org, robin.murphy@arm.com,
        m.szyprowski@samsung.com, matthias.bgg@gmail.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com
Subject: Re: [PATCH 0/2] dma-mapping, remoteproc: Fix dma_mem leak after
 rproc_shutdown
Message-ID: <20220622162540.GA1606016@p14s>
References: <20220422062436.14384-1-mark-pk.tsai@mediatek.com>
 <20220423174650.GA29219@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220423174650.GA29219@lst.de>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Apr 23, 2022 at 07:46:50PM +0200, Christoph Hellwig wrote:
> Sigh.  In theory drivers should never declare coherent memory like
> this, and there has been some work to fix remoteproc in that regard.
> 
> But I guess until that is merged we'll need somthing like this fix.

Should I take this in the remoteproc tree?  If so, can I get an RB?

Thanks,
Mathieu

