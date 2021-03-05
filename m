Return-Path: <SRS0=E3rE=ID=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A939C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 Mar 2021 22:39:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 252456509E
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 Mar 2021 22:39:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhCEWjQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 5 Mar 2021 17:39:16 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:41464 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhCEWjG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 5 Mar 2021 17:39:06 -0500
Received: by mail-ot1-f50.google.com with SMTP id w3so3345064oti.8;
        Fri, 05 Mar 2021 14:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0DQGnKEeYikHg3sEmIT2jOgE9H8/5ye18Kh/5SFhQQo=;
        b=WVcW2+YF0sz7xfsryd7IibwmtsZoufoyVLsFClZCOi5Sht1xVqGzI3HjVLZaTX+JLD
         hp3qnJL5dYGkxl1N7DBGtAVPzOQsHWHBFNTHtcHW3nMyzQyKUiteO/VJz8l0KsHO+/ni
         wOLeKzDS5VTbI6qDoSkKrXLkJ7zVzIIt3VgSQ+EWvqttjzCHo7lGpahqdTjlbMXBTUEi
         8ngdotph0Cgb8pU3eCxI4JhFsj03Kr38rpvZ7s6CeVAXC65kwQHyLbKxrxqXhrrUco9+
         suOlwfKmZngq8Z/jhiOOKlDaif7CF0/eUPs2JjCwqXz61Gbr805mBG3EQ7/ArSKbRatO
         nOwQ==
X-Gm-Message-State: AOAM5321Ivqy+0Le1Z+TYJNqiwJJuD+yIg0uDcN22/m1JRWqCwOQZHAy
        fUBhLzkrRdECHlEnmZ2uKXpZqCeWSQ==
X-Google-Smtp-Source: ABdhPJz8HnPbascpSMFIXJ7NJb8pA8YOLOJSoRsOHpjv7cekvS1uWgAniW9p3zvV+NjG0alXEr0XYA==
X-Received: by 2002:a9d:340b:: with SMTP id v11mr9889048otb.284.1614983946316;
        Fri, 05 Mar 2021 14:39:06 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a7sm875815oon.8.2021.03.05.14.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 14:39:04 -0800 (PST)
Received: (nullmailer pid 772358 invoked by uid 1000);
        Fri, 05 Mar 2021 22:39:03 -0000
Date:   Fri, 5 Mar 2021 16:39:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     peng.fan@oss.nxp.com
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V12 02/10] dt-bindings: remoteproc: imx_rproc: add
 i.MX8MQ/M support
Message-ID: <20210305223903.GA769908@robh.at.kernel.org>
References: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
 <1613611500-12414-3-git-send-email-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613611500-12414-3-git-send-email-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Feb 18, 2021 at 09:24:52AM +0800, peng.fan@oss.nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX8MQ/M support, also include mailbox for rpmsg/virtio usage.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 51 ++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 54d2456530a6..52c8e523506d 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -4,7 +4,7 @@
>  $id: "http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#"
>  $schema: "http://devicetree.org/meta-schemas/core.yaml#"
>  
> -title: NXP iMX6SX/iMX7D Co-Processor Bindings
> +title: NXP i.MX Co-Processor Bindings
>  
>  description:
>    This binding provides support for ARM Cortex M4 Co-processor found on some NXP iMX SoCs.
> @@ -15,6 +15,8 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - fsl,imx8mq-cm4
> +      - fsl,imx8mm-cm4
>        - fsl,imx7d-cm4
>        - fsl,imx6sx-cm4
>  
> @@ -26,6 +28,20 @@ properties:
>      description:
>        Phandle to syscon block which provide access to System Reset Controller
>  
> +  mbox-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +      - const: rxdb
> +
> +  mboxes:
> +    description:
> +      This property is required only if the rpmsg/virtio functionality is used.
> +      List of <&phandle type channel> - 1 channel for TX, 1 channel for RX, 1 channel for RXDB.
> +      (see mailbox/fsl,mu.yaml)
> +    minItems: 1
> +    maxItems: 3
> +
>    memory-region:
>      description:
>        If present, a phandle for a reserved memory area that used for vdev buffer,
> @@ -58,4 +74,37 @@ examples:
>        clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
>      };
>  
> +  - |
> +    #include <dt-bindings/clock/imx8mm-clock.h>
> +    rsc_table: rsc_table@550ff000 {
> +      no-map;
> +      reg = <0x550ff000 0x1000>;
> +    };
> +
> +    vdev0vring0: vdev0vring0@55000000 {
> +      no-map;
> +      reg = <0x55000000 0x8000>;
> +    };
> +
> +    vdev0vring1: vdev0vring1@55008000 {
> +      reg = <0x55008000 0x8000>;
> +      no-map;
> +    };
> +
> +    vdev0buffer: vdev0buffer@55400000 {
> +      compatible = "shared-dma-pool";
> +      reg = <0x55400000 0x100000>;
> +      no-map;
> +    };

These all go in /reserved-memory, right? Best to omit them from the 
example.

> +
> +    imx8mm-cm4 {
> +      compatible = "fsl,imx8mm-cm4";
> +      clocks = <&clk IMX8MM_CLK_M4_DIV>;
> +      mbox-names = "tx", "rx", "rxdb";
> +      mboxes = <&mu 0 1
> +                &mu 1 1
> +                &mu 3 1>;
> +      memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
> +      syscon = <&src>;
> +    };
>  ...
> -- 
> 2.30.0
> 
