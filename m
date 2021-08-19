Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EE8C4320E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Aug 2021 21:19:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5ED5610FF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Aug 2021 21:19:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233818AbhHSVTx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Aug 2021 17:19:53 -0400
Received: from mail-oo1-f50.google.com ([209.85.161.50]:34700 "EHLO
        mail-oo1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233541AbhHSVTw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Aug 2021 17:19:52 -0400
Received: by mail-oo1-f50.google.com with SMTP id w2-20020a4a9e420000b02902859adadf0fso2255454ook.1;
        Thu, 19 Aug 2021 14:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=CP+7+P6aVL+xpSBlijL9XVTFtbWM/RfGDr1X8s8YfYM=;
        b=KoE+orgNkEdxUtKv2XQ8RwWPwZwI2Hxp+hwuKs9gJrDwpFxO+0XWzKj6sr2B+/rqCF
         ZpBD+tErNOzt+Z5YqBJZNcaYRJvgHv+ONC1VH0YmNRYLG2rA8kTj49hKEr1B4blVj+Me
         zXC5cAwGps/opDcYDg3NrycSb23BGbPsGgjzdS9Q9Df13L7LQd4TehHRerayMTOVtzGd
         w7tCvRmAH7alrmyHfROCMA4Fgtm7uxxdK2riUnOLkJWpjuK99azptJwdOzmNHYPKj9gM
         lz/K3O0LjnDJXHH5Iu6YPT5l11vHfrWIIioDH/f0kvlnbSRjeykq9kcHyo6APON1Z+Bw
         0VZg==
X-Gm-Message-State: AOAM530OcdVz8Mb4UZhvyS/ktyKaAexBKDGVYxqqjL2PW/GZ5xFcqfAU
        UAHOsaztJRVBON1msUmLpA==
X-Google-Smtp-Source: ABdhPJz4l0FfU2tWp7BNTiaHu8YMFH4DoUIKNiOmtxz0Cf/z/TGEJ+AaJW7O7mgbe43vgdxkzK3Trw==
X-Received: by 2002:a4a:3944:: with SMTP id x4mr1498602oog.69.1629407955572;
        Thu, 19 Aug 2021 14:19:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j6sm884747ooj.11.2021.08.19.14.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 14:19:14 -0700 (PDT)
Received: (nullmailer pid 1418776 invoked by uid 1000);
        Thu, 19 Aug 2021 21:19:11 -0000
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Bailon <abailon@baylibre.com>
Cc:     mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, gpain@baylibre.com,
        linux-kernel@vger.kernel.org, stephane.leprovost@mediatek.com,
        robh+dt@kernel.org, khilman@baylibre.com,
        linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        devicetree@vger.kernel.org
In-Reply-To: <20210819151340.741565-2-abailon@baylibre.com>
References: <20210819151340.741565-1-abailon@baylibre.com> <20210819151340.741565-2-abailon@baylibre.com>
Subject: Re: [PATCH v3 1/4] dt bindings: remoteproc: Add bindings for MT8183 APU
Date:   Thu, 19 Aug 2021 16:19:11 -0500
Message-Id: <1629407951.460901.1418775.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 19 Aug 2021 17:13:37 +0200, Alexandre Bailon wrote:
> This adds dt bindings for the APU present in the MT8183.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../bindings/remoteproc/mtk,apu.yaml          | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dt.yaml:0:0: /example-0/reserved-memory/vdev0vring0: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dt.yaml:0:0: /example-0/reserved-memory/vdev0vring1: failed to match any schema with compatible: ['shared-dma-pool']
Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dt.yaml:0:0: /example-0/reserved-memory/vdev0buffer: failed to match any schema with compatible: ['shared-dma-pool']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dt.yaml: apu@19100000: memory-region: [[1], [2], [3]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dt.yaml: apu@19100000: Additional properties are not allowed ('memory-region-names' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1518714

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

