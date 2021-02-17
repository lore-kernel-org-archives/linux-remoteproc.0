Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A43C4332B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Feb 2021 20:26:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC13A64E6C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Feb 2021 20:25:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234997AbhBQUZz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 15:25:55 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:38307 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234892AbhBQUZn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 15:25:43 -0500
Received: by mail-oi1-f172.google.com with SMTP id h17so12461833oih.5;
        Wed, 17 Feb 2021 12:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=X84kn+m8PD2g56rNTnDBUymM8FTLFEWtGBoF8GpNpws=;
        b=kN2DUdpDDxbcRBmxh8vUFeY8XR4JxDcGOevxVvkByZDHyRMYxVU9/KDj5+KRTgflnW
         MOJVJsj7Io3FcFa8vP652Y/NsuMV0nXRcQPkLgEyPT7CB0U99n4oinbTREIR9cC3I4hf
         z/reojHEw44LvdZ8z07Tpbwa4preZigFtkqQk7XAV7xil0nnBAAMxbA8W/lITswzxnAJ
         MQ2RrkdcSxJtyLicbVBLc2amTdpWPmNdXCh6rZQMe8keTF+Ufkb8r8RhRNYFCxb/mtV5
         JU6UCpb/Kno+7cnl1VdrKYhj7yhJVJiL4LgyEriYya6DApaQUaLEf0oVNMTiiRBI5H7N
         KeCw==
X-Gm-Message-State: AOAM532qmScnuV69HGHm/IsyKhE+HsTCGraAfLMhdNGAGf62FSSgnLoa
        qwE9TDtkTU7re2tq5vz++A==
X-Google-Smtp-Source: ABdhPJwa5MKkDhdfIWEO2KRh67mm2XhCNo7bPMDnPfDKOrVmMBHafwwaDf+/p8SAE+K86gmJjNHKLA==
X-Received: by 2002:a54:4108:: with SMTP id l8mr393780oic.177.1613593502704;
        Wed, 17 Feb 2021 12:25:02 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r1sm605549otp.34.2021.02.17.12.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 12:25:01 -0800 (PST)
Received: (nullmailer pid 2681063 invoked by uid 1000);
        Wed, 17 Feb 2021 20:24:51 -0000
From:   Rob Herring <robh@kernel.org>
To:     peng.fan@oss.nxp.com
Cc:     shawnguo@kernel.org, linux-imx@nxp.com, agross@kernel.org,
        festevam@gmail.com, linux-arm-kernel@lists.infradead.org,
        s.hauer@pengutronix.de, mathieu.poirier@linaro.org,
        Peng Fan <peng.fan@nxp.com>, bjorn.andersson@linaro.org,
        kernel@pengutronix.de, paul@crapouillou.net,
        devicetree@vger.kernel.org, ohad@wizery.com,
        matthias.bgg@gmail.com, robh+dt@kernel.org, patrice.chotard@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        o.rempel@pengutronix.de
In-Reply-To: <1613392463-9676-2-git-send-email-peng.fan@oss.nxp.com>
References: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com> <1613392463-9676-2-git-send-email-peng.fan@oss.nxp.com>
Subject: Re: [PATCH V10 01/10] dt-bindings: remoteproc: convert imx rproc bindings to json-schema
Date:   Wed, 17 Feb 2021 14:24:51 -0600
Message-Id: <1613593491.473466.2681062.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 15 Feb 2021 20:34:14 +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert the imx rproc binding to DT schema format using json-schema.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 60 +++++++++++++++++++
>  .../bindings/remoteproc/imx-rproc.txt         | 33 ----------
>  2 files changed, 60 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dt.yaml: imx7d-cm4: memory-region: [[1], [2]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml

See https://patchwork.ozlabs.org/patch/1440522

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

