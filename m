Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CC7C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 May 2022 09:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244038AbiEQJE4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 May 2022 05:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244122AbiEQJEv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 May 2022 05:04:51 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D508D49918
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 02:04:17 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r30so6071800wra.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 May 2022 02:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BD63j2HpRLVuVqfGZEYfIBf5UOk2z74/MiITtatEVYY=;
        b=qAorOprbtPfV1b3pNa2UAWKB8p3iJPpS6OPxnRet+P/pISt0J0679h5riWvP3JknqC
         KNgJIai5H2dqh5GQEfo3KtKmjv5XcRdmbnVWVGRSeZv9QWuKDIbs4BP/+FbdA7A+Kwo1
         ciguiYqws762Zc6SVDXDa39jID2pE/SPaC0+8Jr1RJmriexFZ04MlAou0f+YbSjrTfFj
         PEPucdyzzd5s0tQKiZE/XjkNSdKSi3fNQ5tTP48utatjP/bnilJyzE6jMqGJVq6cboTr
         A8D7ILm6yS5KXRAo8J4xXjQoI0WaCsxCli5KJE5zzebFaXU5x1ozr5S/+mTvO6FDVb/e
         0HDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BD63j2HpRLVuVqfGZEYfIBf5UOk2z74/MiITtatEVYY=;
        b=U1MT6PmssHYBQ9UXQ9Q3xuEICAgaw370VBKxGzFTPmb5asC9slzmfv9enDy/UlnAbt
         Y0Nny5TK92kAe5+sW9lb8WBLBVUtHr6Xjj1U0CH6sStl6p5LhTykBQbVvNdUQDvRlieM
         Dkh0C17G59E2VrJiL1f2bvvdvPILxK/TrbxdOIlcNVPAiwlPMh2kz5jLqeoOYOuSW7BD
         9ZfDVZqvykXL49qssPXf+wMmc+pWcxN/FQ/9r8cDvZrINFW0Qrni9f13KHiz0CIe6eD6
         KwQ+d5ywT90tS6ruunr7KPi5vPUIpifXsaFO5uMZMEBPV0/QlO/qN+T9TWawxSouB7Mv
         i8rA==
X-Gm-Message-State: AOAM53260M7bIHwPZGhtQ5E7uyhjGR02G/uU92u8uUw629aUdWHPx71J
        dMTvP0mZiUPHgdR2r+nyHEW3Mg==
X-Google-Smtp-Source: ABdhPJzUela18pWzJFpYz/kj0jG1AUrEkLuAYkMqxMW/Vpo/UasSs3xIMnmYVMQ+OQrGfUJyatolOg==
X-Received: by 2002:adf:9d89:0:b0:20d:e97:1640 with SMTP id p9-20020adf9d89000000b0020d0e971640mr5337204wre.441.1652778256340;
        Tue, 17 May 2022 02:04:16 -0700 (PDT)
Received: from p14s ([193.117.214.243])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c26d300b003942a244f35sm1283224wmv.14.2022.05.17.02.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 02:04:15 -0700 (PDT)
Date:   Tue, 17 May 2022 10:04:12 +0100
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado 
        <nfraprado@collabora.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Tzung-Bi Shih <tzungbi@google.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Mediatek SCP dt-binding tweaks
Message-ID: <20220517090412.GA34828@p14s>
References: <20220511195452.871897-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220511195452.871897-1-nfraprado@collabora.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

I have applied this set.

Thanks,
Mathieu

On Wed, May 11, 2022 at 03:54:50PM -0400, Nícolas F. R. A. Prado wrote:
> 
> Two simple patches for the Mediatek SCP dt-binding. The first fixes the
> reg/reg-names property while the second adds a new optional
> memory-region property.
> 
> v4: https://lore.kernel.org/all/20220506213226.257859-1-nfraprado@collabora.com
> v3: https://lore.kernel.org/all/20220503211114.2656099-1-nfraprado@collabora.com
> v2: https://lore.kernel.org/all/20220502192420.2548512-1-nfraprado@collabora.com
> v1: https://lore.kernel.org/all/20220429211111.2214119-1-nfraprado@collabora.com
> 
> Changes in v5:
> - Made l1tcm optional for mt8192/mt8195
> - Greatly simplified the constraints override in the if:then:
> 
> Changes in v4:
> - Reworked presence of l1tcm reg to be if:then: based and present only
>   on mt8192/mt8195
> 
> Changes in v3:
> - Made the cfg reg required again. After looking again into the mtk-scp
>   driver, only l1tcm is optional.
> 
> Changes in v2:
> - Dropped type and description from memory-region since it's a
>   well-known property
> - Set memory-region maxItems to 1
> 
> Nícolas F. R. A. Prado (2):
>   dt-bindings: remoteproc: mediatek: Make l1tcm reg exclusive to mt819x
>   dt-bindings: remoteproc: mediatek: Add optional memory-region to
>     mtk,scp
> 
>  .../bindings/remoteproc/mtk,scp.yaml          | 47 +++++++++++++------
>  1 file changed, 33 insertions(+), 14 deletions(-)
> 
> -- 
> 2.36.1
> 
