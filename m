Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97454C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Dec 2021 18:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240518AbhLMS5G (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Dec 2021 13:57:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242029AbhLMS5B (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Dec 2021 13:57:01 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5CA4C061574
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Dec 2021 10:57:00 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id y7so11878171plp.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Dec 2021 10:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SJQo48NUmZkGZt1euitJNnArwB/A5OwQryrDW1DTEUY=;
        b=mR4sP0FAduGkecIn78GO9pfQYM8sqxaO605tT2SSIoABlfHhgJEJtGLj1fKdGDYyha
         JGusEx08UFDd9brckayAl3rjS3zMN9ufR3X1jGkfyUOMa1ukqvCyminJ3i5hRLHHknzf
         Yk3sIFomgNgoq8rQ0hZA405oKbUVgSBZ/FCSZ7stLCH52jESvlh2txxomi8Ik+Gj9ivS
         EsTK8YqAGFxPPDZBpnbNAkz6/60K4ZAXqoQdtAT7Y7dItfzAn5juFFIioZQz/vyisf+n
         IZXjPKX7GOrmcrku+Z7/BwQZfyZwt8IS+BwZZmtcJ2PlvjYa1cnoDIGiGV4j4oXo+ho3
         j9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SJQo48NUmZkGZt1euitJNnArwB/A5OwQryrDW1DTEUY=;
        b=xmtyVsV0zZXBxq9WeJcYwSzj0jPZYGxHUyHWc6kPA/xdYtVqMRucq8xR+7rdbyd1FX
         u13QMylzzlPxzM5DWOE4tAgXTeRO/btQpcrnPegNRcdhmz7vkEstJo/JzOZRRpL0uHXn
         cDtOjwZnUNNP63/FFAZEoUD9kPkK2iKcXj3RiRizvm05PF26i7uRtqdH+SmgbQMKYUUU
         Ov3m+83nNotndAJ0f0uWflZdDAdXBfzp9vwP9OoDJC9dpRLEy1JgowMIK+gAkU95XDbG
         VSlyJn5m2WVAMdxC9PwTp+/SlbB8+Ip7zEXDU7NoBXV10pjKVsPKYIqebwTJSUev87Pq
         YlbA==
X-Gm-Message-State: AOAM532p0McrSlSYl8+MtGrUHAMJzUw10VhbjmGbnuzuG1AyXIl6xqbB
        YYkgxJzWLoYcuCxp6LF7xiCD6I7gcsgKpw==
X-Google-Smtp-Source: ABdhPJxNnuxdKkqPual8sYPX1MjA5j+lejydfjOREey1YjoX3NWB2OsK6FTTT64wcd8+cJTIvJ6K5A==
X-Received: by 2002:a17:90b:3850:: with SMTP id nl16mr160887pjb.10.1639421820424;
        Mon, 13 Dec 2021 10:57:00 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id t191sm5615027pgd.3.2021.12.13.10.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 10:56:59 -0800 (PST)
Date:   Mon, 13 Dec 2021 11:56:57 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Initial Renesas R-Car remoteproc support
Message-ID: <20211213185657.GB1474575@p14s>
References: <20211207165829.195537-1-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211207165829.195537-1-julien.massot@iot.bzh>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Dec 07, 2021 at 05:58:27PM +0100, Julien Massot wrote:
> Most of the SoCs in the R-Car gen3 SoC series such as
> H3,M3 and E3 have an 'Arm Realtime Core'.
> This Realtime core is an Arm Cortex-R7 clocked at 800MHz.
> This series adds initial support to load a firmware and start
> this remote processor through the remoteproc subsystem.
> 
> This series depends on
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211022122101.66998-1-julien.massot@iot.bzh/
> to be able to set the Cortex-R7 boot address.
> 
> One of the way to test this driver is to use the zephyr upstream support
> for h3ulcb board 'blinky' demo is my favorite testing firmware.
> 
> To generate a firmware with the zephyr project.
> 
> follow this starting guide
> https://docs.zephyrproject.org/2.7.0/getting_started/index.html
> 
> Then compile your zephyr demo
> west build -b rcar_h3ulcb_cr7 zephyr/samples/basic/blinky \
>     -DCONFIG_KERNEL_ENTRY=\"_vector_table\" \
>     --build-dir h3-blinky
> 
> Then you can use h3-blinky/zephyr/zephyr.elf as a testing
> firmware.
> 
> Patch 1/2 adds the dt-bindings
> 
> Patch 2/2 is a small driver to cover basic remoteproc
> usage: loading firmware from filesystem, starting and stopping the
> Cortex-r7 processor.
> 
> Julien Massot (2):
>   dt-bindings: remoteproc: Add Renesas R-Car
>   remoteproc: Add Renesas rcar driver
> 
>  .../remoteproc/renesas,rcar-rproc.yaml        |  65 +++++
>  drivers/remoteproc/Kconfig                    |  11 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/rcar_rproc.c               | 223 ++++++++++++++++++

I have applied this set.

Thanks,
Mathieu

>  4 files changed, 300 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
>  create mode 100644 drivers/remoteproc/rcar_rproc.c
> 
> -- 
> 2.33.1
> 
> 
