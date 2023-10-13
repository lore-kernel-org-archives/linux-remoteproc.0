Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2F3CDB47E
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Oct 2023 21:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbjJMVMF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 13 Oct 2023 17:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232127AbjJMVME (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 Oct 2023 17:12:04 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D3D8C2
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Oct 2023 14:12:03 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9be3b66f254so48414466b.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Oct 2023 14:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697231522; x=1697836322; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UHVs5ZMbCMnK4OZxIw3w4X3jAnHxQSIJjis2sL1D3HI=;
        b=dO1GIqemepXjKGmg3lbpqPOar2nZH1kZ3q1HZ8PumN652eubsrxfpovlesXbIiWea0
         TzSK2tE9GRnVgJeuN20VbS+sZHfKhw3w+DFLwOQnJunWnKtmFzcEQYy4h7I6unhWhjTC
         DXnucm7AwN6816jyQ1rZ9l7EM9k0vKpfyUaio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697231522; x=1697836322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHVs5ZMbCMnK4OZxIw3w4X3jAnHxQSIJjis2sL1D3HI=;
        b=B/6od5+tyxXHQH80qvfUaDzukToxa0fyeh+T/7VAq1P25OygCjVZ/TVhcFTPN4RjmJ
         Fwf3UlpTgjmDT+43Fz/Xyw98fCOJu35iM04gusLlkC73LqQuyKJK0Cn43ohZ8KoRtSX8
         w1aMFTGFURgKU13IKZ8RMQLzSGC0VPUHyi104qQD/1vrk2Ou51KzCiNKGNwDWPj59d6c
         Hvq8W50YjRimrIpmChiROTo8ME4/kLS1qtKBRfzfwrdro6klWMWKWeKe41oSo2KTbjYw
         cMn14gf3L3Zv35d6n/VhUYgtsuDPhjW+gTCFNkl40Ayf3lYljPxzff/x8tfRZN9w7aRT
         34Gw==
X-Gm-Message-State: AOJu0YwkHuMnY5puKjZ1s+ARcVg+BCQCWwL2HCTWAsMENiyvSzcz3c1J
        4stP+kgJ+HGO8h42yfngQCshjrCar5U4F4HvKYPlsA==
X-Google-Smtp-Source: AGHT+IEuNA+Q2Yxxws7amOJuXWe3ey6jbnUkGbWIJda+AVzB6s8jOrXT89FhBxT8kIo26PoR154bP2xzv0Ano/B3pdA=
X-Received: by 2002:a17:907:60cb:b0:9be:7b67:1673 with SMTP id
 hv11-20020a17090760cb00b009be7b671673mr337821ejc.1.1697231521525; Fri, 13 Oct
 2023 14:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231013200851.347042-1-robh@kernel.org>
In-Reply-To: <20231013200851.347042-1-robh@kernel.org>
From:   Simon Glass <sjg@chromium.org>
Date:   Fri, 13 Oct 2023 14:11:50 -0700
Message-ID: <CAPnjgZ0Uh7RTvYfLjEL7g1NjC1pO8-xJuj9RBSVVnwviAwzF0Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop kernel copy of common reserved-memory bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Julien Massot <julien.massot@iot.bzh>,
        Trevor Wu <trevor.wu@mediatek.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 13 Oct 2023 at 13:45, Rob Herring <robh@kernel.org> wrote:
>
> The common reserved-memory bindings have recently been copied from the
> kernel tree into dtschema. The preference is to host common, stable
> bindings in dtschema. As reserved-memory is documented in the DT Spec,
> it meets the criteria.
>
> The v2023.09 version of dtschema is what contains the reserved-memory
> schemas we depend on, so bump the minimum version to that. Otherwise,
> references to these schemas will generate errors.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/Makefile    |   2 +-
>  .../remoteproc/renesas,rcar-rproc.yaml        |   2 +-
>  .../bindings/reserved-memory/framebuffer.yaml |  52 -----
>  .../reserved-memory/memory-region.yaml        |  40 ----
>  .../reserved-memory/reserved-memory.txt       |   2 +-
>  .../reserved-memory/reserved-memory.yaml      | 181 ------------------
>  .../reserved-memory/shared-dma-pool.yaml      |  97 ----------
>  .../bindings/sound/mediatek,mt8188-afe.yaml   |   2 +-
>  8 files changed, 4 insertions(+), 374 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/memory-region.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
>

Reviewed-by: Simon Glass <sjg@chromium.org>
