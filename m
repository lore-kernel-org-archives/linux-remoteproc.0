Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF6BC4332D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 31 Dec 2020 15:35:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D75E220798
	for <linux-remoteproc@archiver.kernel.org>; Thu, 31 Dec 2020 15:35:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgLaPfp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 31 Dec 2020 10:35:45 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:34899 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgLaPfp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 31 Dec 2020 10:35:45 -0500
Received: by mail-ot1-f49.google.com with SMTP id i6so18279352otr.2;
        Thu, 31 Dec 2020 07:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=MXM5wnzSSoRxNoAr4MlvHobyUhxKc2TuluVu9Oqp3J8=;
        b=TSl2X333Mf9ACABZOZ0E8+LlV8Qa2E5IxSu29v3vaXBstOYuueUZbwfBxufpLvZH2q
         iM53EedpDBTLc59vQqCIaDccK1JMI4o+JH/7HH3ciaPK2xL3c2Kod7k/WOlJBRR03U4h
         VKtw20uOWiAX0IJ3cgpXb2ktT3aJ6tiGXUIJWVRaW5LZdcjyeouqK4ISKzLmC1baiSMR
         pHCCDkp4ey9CLwEkjn/vnQBiHl3EOsuSkYIV0qKaocEJ0/y40ePW8IG3OL0Gs6ey18qo
         FBjfj1mLXpZO63XDBYz/M5/KamU9/uou/9gxf0+zGNVFr774ZVMh8hDY8+E83BTxONIJ
         S7sw==
X-Gm-Message-State: AOAM532IjMIYCN4M/S2KkBPBRbnWUe3kpj8QnggJ9NmOK4tbMAEtFOfH
        ksXrliSDmoOsermQeSebfQ==
X-Google-Smtp-Source: ABdhPJw9nMyGpYq1U6APb1OBYayfFcOMpbeJiuknRQSDU+f84jr6ltJvYGsCBL1BLVLandI7LxcYNg==
X-Received: by 2002:a05:6830:1551:: with SMTP id l17mr43541058otp.309.1609428903438;
        Thu, 31 Dec 2020 07:35:03 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id e10sm11215889otl.38.2020.12.31.07.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 07:35:02 -0800 (PST)
Received: (nullmailer pid 1828655 invoked by uid 1000);
        Thu, 31 Dec 2020 15:34:48 -0000
From:   Rob Herring <robh@kernel.org>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        ohad@wizery.com, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20201230012724.1326156-4-martin.blumenstingl@googlemail.com>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com> <20201230012724.1326156-4-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 3/5] dt-bindings: remoteproc: Add the documentation for Meson AO ARC rproc
Date:   Thu, 31 Dec 2020 08:34:48 -0700
Message-Id: <1609428888.822121.1828654.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 30 Dec 2020 02:27:22 +0100, Martin Blumenstingl wrote:
> Amlogic Meson6, Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4
> controller for always-on operations, typically used for managing system
> suspend.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml   | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml:23:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml:45:6: [warning] wrong indentation: expected 4 but found 5 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1421301

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

