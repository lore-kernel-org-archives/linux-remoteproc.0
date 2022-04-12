Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8818C433FE
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Apr 2022 17:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357991AbiDLRGs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Apr 2022 13:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357961AbiDLRGd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Apr 2022 13:06:33 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E8B13E8D
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Apr 2022 10:04:14 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id o5-20020a17090ad20500b001ca8a1dc47aso3585114pju.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Apr 2022 10:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=svCJiNYCVSTSADFJuSISCpOI75wKzQz4JEvN3pdJrsM=;
        b=I0pM3O+HVyaN+WR40sxZKPBujfPiS3TYbtroP2cR9D3EyonmrVjWLo+lFmCjjMF/C9
         cKC95ZxJ5Wrj7D8YYDHGFUDvGV5CqSfJIeyJZp4xia9AH0fNss/9hGUjx3Dc5k/kk+NI
         SK55KI1P+NrSthu6nAnBYzB/AAGQORsGEG9JNxBoBlmcVXq8WOOypF/3nfo1RTjKbfAK
         3wkiCRIRYK/PBpuqmNWFGd3fnVzQpOgfZYmS3EiJjdqvm+ZOuX4X+FXha0FXLcH2RAYv
         wEPfq51y/pCgvHdYlIvMzU1RG15mFEFWbDIbpcC1v792nKvKq9up0JlbsebYKLsxNu3N
         N77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=svCJiNYCVSTSADFJuSISCpOI75wKzQz4JEvN3pdJrsM=;
        b=cG23ObhcjsLW82E6uuts5q9Owwc/r6YZUl2OpvHypS6m/l1wwGe5otiY9EIH2fXV2s
         uP+WHlCknwndLGHW+K+pOLHhxSzsPc6sLr+EJZCJ5/vIl/XfGlwNqYD3sxfjxFAtPLFb
         691tTQ8aGuj2Rwa18+XaXWCDWj6oR1qilnpY/ik8fGwjQHWm9si3VKoEks0p2ljCHGtQ
         I67wke3OezxOsFEM7XvYbp/2S47FcKMGoTKVV7BGxwccMNpNG5EJEnt53YcGt+R/zj2K
         92dd5+xKq0j2IouvOunb7Vs8YDD7vEB2pk/u8QPb0TSqDFk3ppCIAXFn3/MVk6Z2DxZs
         w3Ug==
X-Gm-Message-State: AOAM5313JRwiFa3k5BwJK8RM1EauLUqW6+QV8hbAlQsenQo/3LcBI/5m
        kImEjctyz+i+i8cURhIx91zY8Q==
X-Google-Smtp-Source: ABdhPJxED4y9fHEAFYCWz2UyU0Yj+9pcsOz0knbV4/SXxH9hKezQCW0Zl7/FRRX8+OwqcltokcmuJw==
X-Received: by 2002:a17:90b:19d0:b0:1cb:7ef1:d915 with SMTP id nm16-20020a17090b19d000b001cb7ef1d915mr6130873pjb.16.1649783053717;
        Tue, 12 Apr 2022 10:04:13 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id k92-20020a17090a4ce500b001ca69b5c034sm49060pjh.46.2022.04.12.10.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 10:04:12 -0700 (PDT)
Date:   Tue, 12 Apr 2022 11:04:10 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Fix a potential double free
Message-ID: <20220412170410.GA465495@p14s>
References: <1d15023b4afb94591435c48482fe1276411b9a07.1648981531.git.christophe.jaillet@wanadoo.fr>
 <34c30f7c-70e2-dc95-a664-9379f91f5aed@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34c30f7c-70e2-dc95-a664-9379f91f5aed@collabora.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Apr 11, 2022 at 10:55:52AM +0200, AngeloGioacchino Del Regno wrote:
> Il 09/04/22 08:27, Christophe JAILLET ha scritto:
> > 'scp->rproc' is allocated using devm_rproc_alloc(), so there is no need
> > to free it explicitly in the remove function.
> > 
> > Fixes: c1407ac1099a ("remoteproc: mtk_scp: Use devm variant of rproc_alloc()")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied.

Thanks,
Mathieu

> 
> 
