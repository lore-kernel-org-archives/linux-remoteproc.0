Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35472C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 12:51:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F92F611C0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 12:51:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbhIJMxJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Sep 2021 08:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233095AbhIJMxI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Sep 2021 08:53:08 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF27C061574;
        Fri, 10 Sep 2021 05:51:57 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id n14-20020a05600c3b8e00b002f8bd2f8ab6so1372923wms.5;
        Fri, 10 Sep 2021 05:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T0Kza21M5RkTzf291TUHaFKlBPBGzvLm8pO18XxAdkU=;
        b=okHmHXfqY/Jx9vlmHAH+Mn9jwD9yT/V72hOa0fulm+VjLjVTTpDTOWGMo1DXPaeMAz
         Kdy+uc5wFIhNt5LK8YQDMcdAG7yw0NEsSYnp6W/b7Qf7lL4ZmMjdYa7LE66nO8LODBOJ
         n6yRU8O0DpDEX8tNLzpBPsDZYZcMQFFzAuVe+yuxjCynZEUy1KyC8IYrUhev53EYyqME
         ps3c7BNBqkW3sZauO29gIfRopLRGNnBmvaS674DKYajnGfoPZDXiXg5Ckzo87rjxmMrd
         /DtWKCQ/K73IC6ewIZL4ttKF8stRP4T+JWfC+Yw+e3Av7CtRKXhFxtOpUVpVg8RPc0ta
         Mfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T0Kza21M5RkTzf291TUHaFKlBPBGzvLm8pO18XxAdkU=;
        b=GWhMxlxZDMz2YBht8HPsDTqKDIoP2inwHU4URiQlabtoC9crMZQWyn7pP89U7EBDKd
         wt2skdOmLAqUiHdvLQEonG21R5716Hek+n7asHpgsOVUrOtxuapHz49LV7bTG8yePq37
         0g97aKr2oMcxd+CuRwSZWqIrfWbMAu4VlrvPUVTEC24Sh7zFGMo5ZUGk2qp5pyOTVLRc
         4QicUxtnLP2KC2eCU+gbaP/zKhyHzcIQvKilvy4YNKCMB5xm91+Du72GSwllmQ1RvwVJ
         vsq8NQPANoRl3RM0TRYvIT2Z8/vCP4O24CV4YMLpWvpVZvEHK2Y+t6KjeuJ7rCTZEWMo
         ZKvA==
X-Gm-Message-State: AOAM5327A50cE1nD1tq2Rv7LdXLvIg8acgW0J1OcdFO8I1wMZeGyzMHZ
        jCJrd3skpfyhkU/2RI59TyUE5KXDyIUbEkZqr3o=
X-Google-Smtp-Source: ABdhPJwFbByDUlrrsQ6dQpRSGNqUcCD/KStLeVUDLPXetuY5wqSXTm+TQjY8RRqdkVfmvdTqDfZmaXjT3968OYGAPO4=
X-Received: by 2002:a1c:4e02:: with SMTP id g2mr8342202wmh.91.1631278316328;
 Fri, 10 Sep 2021 05:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <1631092255-25150-1-git-send-email-shengjiu.wang@nxp.com> <1631092255-25150-5-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1631092255-25150-5-git-send-email-shengjiu.wang@nxp.com>
From:   Daniel Baluta <daniel.baluta@gmail.com>
Date:   Fri, 10 Sep 2021 15:51:44 +0300
Message-ID: <CAEnQRZBi6pMbuHTJF4yNzX_Lh-pYZc3LTNuKVs5pk-hNS-OWMQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] dt-bindings: dsp: fsl: update binding document for
 remote proc driver
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        linux-remoteproc@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shengjiu Wang <shengjiu.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 8, 2021 at 12:39 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> As there are two drivers for DSP on i.MX, one is for sound open
> firmware, another is for remote processor framework. In order to
> distinguish two kinds of driver, defining different compatible strings.
>
> For remote proc driver, the properties firmware-name and fsl,dsp-ctrl
> are needed and the mailbox channel is different with SOF.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 81 +++++++++++++++++--
>  1 file changed, 75 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> index 7afc9f2be13a..51ea657f6d42 100644
> --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> @@ -8,6 +8,7 @@ title: NXP i.MX8 DSP core
>
>  maintainers:
>    - Daniel Baluta <daniel.baluta@nxp.com>
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
>
>  description: |
>    Some boards from i.MX8 family contain a DSP core used for
> @@ -19,6 +20,10 @@ properties:
>        - fsl,imx8qxp-dsp
>        - fsl,imx8qm-dsp
>        - fsl,imx8mp-dsp
> +      - fsl,imx8qxp-hifi4
> +      - fsl,imx8qm-hifi4
> +      - fsl,imx8mp-hifi4
> +      - fsl,imx8ulp-hifi4
>
>    reg:
>      maxItems: 1
> @@ -28,37 +33,63 @@ properties:
>        - description: ipg clock
>        - description: ocram clock
>        - description: core clock
> +      - description: debug interface clock
> +      - description: message unit clock
> +    minItems: 3
> +    maxItems: 5
>
>    clock-names:
>      items:
>        - const: ipg
>        - const: ocram
>        - const: core
> +      - const: debug
> +      - const: mu
> +    minItems: 3
> +    maxItems: 5
>
>    power-domains:
>      description:
>        List of phandle and PM domain specifier as documented in
>        Documentation/devicetree/bindings/power/power_domain.txt
> +    minItems: 1
>      maxItems: 4
>
>    mboxes:
>      description:
>        List of <&phandle type channel> - 2 channels for TXDB, 2 channels for RXDB
> +      or - 1 channel for TX, 1 channel for RX, 1 channel for RXDB
>        (see mailbox/fsl,mu.txt)
> +    minItems: 3
>      maxItems: 4
>
>    mbox-names:
> -    items:
> -      - const: txdb0
> -      - const: txdb1
> -      - const: rxdb0
> -      - const: rxdb1
> +    oneOf:
> +      - items:
> +          - const: txdb0
> +          - const: txdb1
> +          - const: rxdb0
> +          - const: rxdb1
> +      - items:
> +          - const: tx
> +          - const: rx
> +          - const: rxdb
>
>    memory-region:
>      description:
>        phandle to a node describing reserved memory (System RAM memory)
>        used by DSP (see bindings/reserved-memory/reserved-memory.txt)
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 4
> +
> +  firmware-name:
> +    description: |
> +      Default name of the firmware to load to the remote processor.
> +
> +  fsl,dsp-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to syscon block which provide access for processor enablement
>
>  required:
>    - compatible
> @@ -91,3 +122,41 @@ examples:
>          mboxes = <&lsio_mu13 2 0>, <&lsio_mu13 2 1>, <&lsio_mu13 3 0>, <&lsio_mu13 3 1>;
>          memory-region = <&dsp_reserved>;
>      };
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    dsp_reserved: dsp@92400000 {
> +      reg = <0x92400000 0x1000000>;
> +      no-map;
> +    };
> +    dsp_vdev0vring0: vdev0vring0@942f0000 {
> +      reg = <0x942f0000 0x8000>;
> +      no-map;
> +    };
> +    dsp_vdev0vring1: vdev0vring1@942f8000 {
> +      reg = <0x942f8000 0x8000>;
> +      no-map;
> +    };
> +    dsp_vdev0buffer: vdev0buffer@94300000 {
> +      compatible = "shared-dma-pool";
> +      reg = <0x94300000 0x100000>;
> +      no-map;
> +    };
> +
> +    dsp: dsp@3b6e8000 {
> +      compatible = "fsl,imx8mp-hifi4";
> +      reg = <0x3B6E8000 0x88000>;
> +      clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSP_ROOT>,
> +               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_OCRAMA_IPG>,
> +               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSP_ROOT>,
> +               <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSPDBG_ROOT>;
> +      clock-names = "ipg", "ocram", "core", "debug";
> +      firmware-name = "imx/dsp/hifi4.bin";
> +      power-domains = <&audiomix_pd>;
> +      mbox-names = "tx", "rx", "rxdb";
> +      mboxes = <&mu2 0 0>,
> +               <&mu2 1 0>,
> +               <&mu2 3 0>;
> +      memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
> +                      <&dsp_vdev0vring1>, <&dsp_reserved>;
> +      fsl,dsp-ctrl = <&audio_blk_ctrl>;
> +    };
> --
> 2.17.1
>
