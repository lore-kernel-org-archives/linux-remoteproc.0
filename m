Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A09FC47097
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 04:55:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0617A61411
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 04:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhFDE5e (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Jun 2021 00:57:34 -0400
Received: from mout01.posteo.de ([185.67.36.65]:53491 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229452AbhFDE5e (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Jun 2021 00:57:34 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 7244C24002A
        for <linux-remoteproc@vger.kernel.org>; Fri,  4 Jun 2021 06:55:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1622782547; bh=TTyTROyQXjsSXo74wJBHn6lqKWQ3+EbGHja6XTO7Rds=;
        h=Date:From:To:Cc:Subject:From;
        b=b4kfkQdftGPZQAMXH5LvwkFcZ3zhObfnY0zCw1HWa3vz1OjKz0xIDlQZfAUqaYm8n
         LEzDIeuIPtgW+cna1vw2q7i1wnM3oFCyxkSEA+W10Mt7I3CRYrP+A9ukIObzFVybPW
         pMClWvFX+BOQV2lPrTodITHK5rXrTxjmGbUTwKcFW1rUQUb1/w0DWPByV2HRJQMX/A
         2icvC+zVgqIzhPQSq2W2c6YEOu0PV+VnOzM+DGMS+tgOEnXNRHlASnZ7hzPZRlQDME
         9LASZa1tebUvbv6Ie5EVrYQPsgmQlntWn/Ef8HlLZU61ngXarVx6ERq9Tfp56/pUbZ
         gKf2dD0fGmqfg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4Fx9Sc48Wdz6tm9;
        Fri,  4 Jun 2021 06:55:44 +0200 (CEST)
Date:   Fri,  4 Jun 2021 04:55:43 +0000
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, <devicetree@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] dt-bindings: hwlock: sun6i: Fix various warnings in
 binding
Message-ID: <20210604065543.3d71ca53@monster.powergraphx.local>
In-Reply-To: <20210603144216.10327-1-s-anna@ti.com>
References: <20210603144216.10327-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 3 Jun 2021 09:42:16 -0500
Suman Anna <s-anna@ti.com> wrote:

> The allwinner,sun6i-a31-hwspinlock.yaml binding has a mismatched
> $id and fails to compile the example due to undefined args specifier
> values for clocks and resets. Fix both of these issues.
> 
> Fixes: f9e784dcb63f ("dt-bindings: hwlock: add sun6i_hwspinlock")
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi Wilken,
> 
> This fixes the warnings for now on linux-next, but I think the example
> should be including sun6i-a31-ccu.h files instead to be accurate, and
> those files are missing the definitions for CLK_BUS_SPINLOCK and
> RST_BUS_SPINLOCK. Feel free to send a newer version or do an incremental
> patch on top.
> 
> regards
> Suman

Hi Suman,

thank you for fixing this. I would have fix it the same way for now, so it is
fine for me. But I will keep an eye on it.

greetings,
Will

>  .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
> b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml index
> 733c3d01e56c..10e5a53e447b 100644 ---
> a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml +++
> b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/hwlock/allwinner,sun6i-hwspinlock.yaml#
> +$id: http://devicetree.org/schemas/hwlock/allwinner,sun6i-a31-hwspinlock.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: SUN6I hardware spinlock driver for Allwinner sun6i compatible SoCs
> @@ -36,6 +36,9 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/clock/sun8i-a23-a33-ccu.h>
> +    #include <dt-bindings/reset/sun8i-a23-a33-ccu.h>
> +
>      hwlock@1c18000 {
>          compatible = "allwinner,sun6i-a31-hwspinlock";
>          reg = <0x01c18000 0x1000>;

