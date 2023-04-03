Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F3DC76196
	for <linux-remoteproc@archiver.kernel.org>; Mon,  3 Apr 2023 17:25:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbjDCRZW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 3 Apr 2023 13:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232744AbjDCRZV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 3 Apr 2023 13:25:21 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CCC8E
        for <linux-remoteproc@vger.kernel.org>; Mon,  3 Apr 2023 10:25:19 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso18586065wmo.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Apr 2023 10:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680542718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uJI+R7Z2OIlFqVuwYWesbGzyliYONi9PcdnjVEKDM1o=;
        b=n1quY7QqUla1CplzUDYkiQ/27vTXjJRjzVQEvjeb+uaNXP/M7Phaim99ZCXxkMShMp
         YqRhsALQleSLEIbfBWl/lOOhFUJI7S6j73gamrYhmjuYBJ9Sr/ORnl+h4hJ4kpbzue2r
         tsENu+oE1gOY4u1+Gn2gigXmGtZoH4zbri/qRhjXykYLaVXx9rEhKTL4ng/LaIGwCzbI
         awQczryb4NoalCjVLGre6jrV0N5fWV9PH84TuulLReYJXlL0xo1QBumUlI2Z2k2fN2k7
         takPOyr9GQFYMLIbcoHybFP/YvG44IXLlmxPcuzja0I+FCOuHdZSn1BVdaJlhrlUnNG6
         oybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680542718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJI+R7Z2OIlFqVuwYWesbGzyliYONi9PcdnjVEKDM1o=;
        b=m/sXywJyRsAcIKg+mNXpkz3IqjJhRbUl0SE/5+s0P2LVsqAue8LbG5JRvnlEkNYe03
         h4NMLt8064eSAFy6fDs0B43Yiioq8c7hAaISrJIgtAKT2WlyLBFEeLwkGjZ/D095OfY+
         G+PdPRD8qbcawtUuICvZ3K/9b2Dg+ZJ6yiErheiRZPtdHWleSHIPtixbzqu04oEfbata
         BmQj0MIXB2+jRgjQy63M4sReFbVDgmmxF/mvp0zmsjIY+xGDcmNnqluoSyk36Wr4ozis
         l8Gi2pTWlaAYTRFC07akMT/ModT3wgvU63wOoUbg9zFTSloG2C1/a2t+jh59BrM4fqVz
         SQ8g==
X-Gm-Message-State: AAQBX9dog5vBnaqheeutW6lJzz+lIbXMnjWRJ2CTLl9svW2T5MtkR1Kq
        vZDufdbO3hu1hhRbG9uYzIPkEA719WzzX56fGwnbrA==
X-Google-Smtp-Source: AKy350arJwJZmf6GVJKgYAqtK3M80H/h0YB5IchzMw/j7dNdVnxhUoZAx0FpTRuSfsdgq1F0LivXm+9/d34VX5Qsqhg=
X-Received: by 2002:a05:600c:291:b0:3f0:4429:2eb5 with SMTP id
 17-20020a05600c029100b003f044292eb5mr59662wmk.5.1680542718041; Mon, 03 Apr
 2023 10:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230328022733.29910-1-tinghan.shen@mediatek.com>
 <20230328022733.29910-12-tinghan.shen@mediatek.com> <848971ea-b142-d088-df6f-74ee2d807950@gmail.com>
In-Reply-To: <848971ea-b142-d088-df6f-74ee2d807950@gmail.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 3 Apr 2023 11:25:07 -0600
Message-ID: <CANLsYkw1viJTWzFZ3gCjFoEwm-TjF0QCLLqqwYGvLjW0fE+6rg@mail.gmail.com>
Subject: Re: [PATCH v9 11/11] arm64: dts: mediatek: mt8195: Add SCP 2nd core
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Tinghan Shen <tinghan.shen@mediatek.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 31 Mar 2023 at 05:00, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 28/03/2023 04:27, Tinghan Shen wrote:
> > Rewrite the MT8195 SCP device node as a cluster and
> > add the SCP 2nd core in it.
> >
> > Since the SCP device node is changed to multi-core structure,
> > enable SCP cluster to enable probing SCP core 0.
> >
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> As this is a bigger change I'd prefer to take it through my tree once the driver
> and dt-bindings changes are merged. Given the fact, maybe it would make sense to
> take 2/11 through my tree as well.
>

Might as well take the whole thing through your tree, which I'm
totally fine with.  But when that happens, you will also have to pick
up other potential patches that touch these files.  We'll sort it out.

> Regards,
> Matthias
>
> > ---
> >   .../boot/dts/mediatek/mt8195-cherry.dtsi      |  6 +++-
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 32 ++++++++++++++-----
> >   2 files changed, 29 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> > index 56749cfe7c33..31415d71b6a4 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> > @@ -933,7 +933,11 @@
> >       interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
> >   };
> >
> > -&scp {
> > +&scp_cluster {
> > +     status = "okay";
> > +};
> > +
> > +&scp_c0 {
> >       status = "okay";
> >
> >       firmware-name = "mediatek/mt8195/scp.img";
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 8fc527570791..5fe5fb32261e 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -826,14 +826,30 @@
> >                       clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
> >               };
> >
> > -             scp: scp@10500000 {
> > -                     compatible = "mediatek,mt8195-scp";
> > -                     reg = <0 0x10500000 0 0x100000>,
> > -                           <0 0x10720000 0 0xe0000>,
> > -                           <0 0x10700000 0 0x8000>;
> > -                     reg-names = "sram", "cfg", "l1tcm";
> > -                     interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
> > +             scp_cluster: scp@10500000 {
> > +                     compatible = "mediatek,mt8195-scp-dual";
> > +                     reg = <0 0x10720000 0 0xe0000>, <0 0x10700000 0 0x8000>;
> > +                     reg-names = "cfg", "l1tcm";
> > +                     #address-cells = <1>;
> > +                     #size-cells = <1>;
> > +                     ranges = <0 0 0x10500000 0x100000>;
> >                       status = "disabled";
> > +
> > +                     scp_c0: scp@0 {
> > +                             compatible = "mediatek,scp-core";
> > +                             reg = <0x0 0xa0000>;
> > +                             reg-names = "sram";
> > +                             interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     scp_c1: scp@a0000 {
> > +                             compatible = "mediatek,scp-core";
> > +                             reg = <0xa0000 0x20000>;
> > +                             reg-names = "sram";
> > +                             interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
> > +                             status = "disabled";
> > +                     };
> >               };
> >
> >               scp_adsp: clock-controller@10720000 {
> > @@ -2309,7 +2325,7 @@
> >                                <&iommu_vdo M4U_PORT_L19_VENC_REF_LUMA>,
> >                                <&iommu_vdo M4U_PORT_L19_VENC_REF_CHROMA>;
> >                       interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
> > -                     mediatek,scp = <&scp>;
> > +                     mediatek,scp = <&scp_c0>;
> >                       clocks = <&vencsys CLK_VENC_VENC>;
> >                       clock-names = "venc_sel";
> >                       assigned-clocks = <&topckgen CLK_TOP_VENC>;
