Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF363C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 May 2022 18:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386913AbiEBSjO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 May 2022 14:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386973AbiEBSi7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 May 2022 14:38:59 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A1765F3;
        Mon,  2 May 2022 11:35:29 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nfraprado)
        with ESMTPSA id B8F721F42914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1651516528;
        bh=LNAKoERXNkxOChEkjc56ibMMeMeZRDZq9ArNo0Yf64k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SE1XcgI7Tnd9jrUCWIe+kKGkeveMBSkqfnpzeAxST784bFE4NvXBGVyKtmVTzFQKr
         mpDOuBivzwO3rCkE+y73S6y4rOFyfFJcopT3rZD+7KKBew/QrHsYvAA63H6swWp+iA
         yvm0b7qr6NCBM+H2arXbXISocgeMcw8XvDbH9LeiZbYIPsH0alUlCCKuw21bW3+etY
         gApJ0l9e0G42MnJ4bN1QykoDF04L2CJT45frtB/qiEWKxx6stsS0KFkkd5LX7QTyPL
         2U/yOkW78IG3fL0m/O7SLSgjUtBCMB6k2mBHuBqHJ2Ja89f7pF7B0JBG+POMq0q4qC
         9vw5h2ft9f1Yw==
Date:   Mon, 2 May 2022 14:35:23 -0400
From:   =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado 
        <nfraprado@collabora.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: remoteproc: mediatek: Add optional
 memory-region to mtk,scp
Message-ID: <20220502183523.tfrai4wndzhlvjq5@notapiano>
References: <20220429211111.2214119-1-nfraprado@collabora.com>
 <20220429211111.2214119-3-nfraprado@collabora.com>
 <YnAA+7eqP/WzGrhQ@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnAA+7eqP/WzGrhQ@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, May 02, 2022 at 11:04:11AM -0500, Rob Herring wrote:
> On Fri, Apr 29, 2022 at 05:11:10PM -0400, Nícolas F. R. A. Prado wrote:
> > The SCP co-processor can optionally be passed a reserved memory region
> > to use. Add this property in the dt-binding.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > 
> >  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > index ec9ddeb6ca2c..64a9d2c7ed0d 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> > @@ -51,6 +51,10 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >  
> > +  memory-region:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> 
> memory-region has a type already, so drop. What's needed is how many 
> entries and what they are if more than 1.

Hi Rob,

OK, didn't notice this common property was already documented elsewhere. In that
case I'll also drop the description since it's only 1.

Thanks,
Nícolas

> 
> > +    description: phandle to reserved memory region.
> > +
> >  required:
> >    - compatible
> >    - reg
> > -- 
> > 2.36.0
> > 
> > 
