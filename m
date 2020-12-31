Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D4FC433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 31 Dec 2020 15:36:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0126C22472
	for <linux-remoteproc@archiver.kernel.org>; Thu, 31 Dec 2020 15:36:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgLaPfd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 31 Dec 2020 10:35:33 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:36982 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgLaPfd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 31 Dec 2020 10:35:33 -0500
Received: by mail-ot1-f50.google.com with SMTP id o11so18275567ote.4;
        Thu, 31 Dec 2020 07:35:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=U5+TgRxBr8Fo4F24dxi/XK3rCsce2994tILTdIkxtms=;
        b=VYsOjXJADSQAuA4BKAbhJA2e89sZAZTVZdKcVFRiqM2ITm4EulVIYjXSIqk9RcRVgG
         9w34n9nxx3abDZc16ct2PAjzdtKOZxTEG097n8Dvr8sgYt+zSUASpfev4wIEsbJs9yvz
         039kQuOMNxAJyePvPzEo3LxL4FqSUML3nuiBSJ+xNU6wiqrBAtOzU7FXNIFAfdVPsTMo
         RG1bWE206DhGtJgwtVNYKwLJDluk8TKq2NiZ0cm2QeINx6EmDjVxc+1XDmMtIIi/Ndr9
         KwBqgWubnG27+ob02/6aplzsJP8/Gy+SHpDh9HUdNotwLWjDliB5m8OgsgZfhYc/laML
         IHTg==
X-Gm-Message-State: AOAM533ex3VVCMT+G1n4ezV4HRmJOp2wVxU3RKr+foA1nonui2fUpFeF
        lZg4GfxbaHhZtJEOKXWiRQ==
X-Google-Smtp-Source: ABdhPJwueo20TglGcEsIU4ebdW4CqO2h44on2UHrkgjVWDuMsGX+RxqetVDTW5S7wZkG+1Pb4x+4/w==
X-Received: by 2002:a9d:5d02:: with SMTP id b2mr41960733oti.148.1609428892020;
        Thu, 31 Dec 2020 07:34:52 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id h30sm10449278ooi.12.2020.12.31.07.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 07:34:50 -0800 (PST)
Received: (nullmailer pid 1828652 invoked by uid 1000);
        Thu, 31 Dec 2020 15:34:48 -0000
From:   Rob Herring <robh@kernel.org>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, ohad@wizery.com
In-Reply-To: <20201230012724.1326156-3-martin.blumenstingl@googlemail.com>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com> <20201230012724.1326156-3-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/5] dt-bindings: Amlogic: add the documentation for the SECBUS2 registers
Date:   Thu, 31 Dec 2020 08:34:48 -0700
Message-Id: <1609428888.809731.1828651.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 30 Dec 2020 02:27:21 +0100, Martin Blumenstingl wrote:
> The Meson8/Meson8b/Meson8m2 SoCs have a register bank called SECBUS2 which
> contains registers for various IP blocks such as pin-controller bits for
> the BSD_EN and TEST_N GPIOs as well as some AO ARC core control bits.
> The registers can be accessed directly when not running in "secure mode".
> When "secure mode" is enabled then these registers have to be accessed
> through secure monitor calls.
> 
> So far these SoCs are always known to boot in "non-secure mode".
> Add a binding documentation using syscon (as these registers are shared
> across different IPs) for the SECBUS2 registers.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../arm/amlogic/amlogic,meson-mx-secbus2.yaml | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml:35:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1421302

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

