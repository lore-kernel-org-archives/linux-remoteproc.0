Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAB3C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed,  1 Dec 2021 16:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbhLAQtl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 1 Dec 2021 11:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbhLAQtl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Dec 2021 11:49:41 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451A1C061574
        for <linux-remoteproc@vger.kernel.org>; Wed,  1 Dec 2021 08:46:20 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id iq11so18442984pjb.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Dec 2021 08:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wBDlagZhzaCKQPO8KQRJcEbdw+pTfLmf8ix5585yKYE=;
        b=cDYR9mbfas8zcxichBHZJo10Gp7Lm7XyQANLAtsQdZcrQRWtsvQ9FmsS+3cUbSpPei
         D737Mj5iSi/mzkaeVQ0sIkhYtWBZdDmIU02oe2nxMmeabpZXGApjZi7328TCTK11/ldP
         HN2CEvwmXQrmDpsY8J+4V6MZ3YpBAW1oHnICnBwWN1WmCi3amn+rjlllvSN6MkcYjzl3
         7mefC7ANsTXu8FB8CjCJl3p/8+JyyC+O58GQd7J11Mdi7OGdMVE/J1LTLNWzxMWZ1Pf+
         IucYaTl63tPyBVHs4EhijQ2nIWDeyYyunawoZeOGKssOdWyLnFP2C4M1BDKzpMO4wwM9
         BYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wBDlagZhzaCKQPO8KQRJcEbdw+pTfLmf8ix5585yKYE=;
        b=r2KRVX5u6PvQOHcHP/ypNNxQBBAHr8PslDK+Wl8Sz2j6kPaQEu7/URCe/X04ygz7en
         NcaCK8yXnA8osFiVkiLuQHLhsTlqbVuUl/Nhx3/GrvS4+NQULj4oKNqo7SS7Dr4odSog
         BOLmphrJKNGaSPFhV85bdxTMv5k/yVCd15s8KsSJ6S7eAmwWF6nr2DvZR3c3TEhCGW3L
         SBUacSoIUnEesl/PWY4ntNTs2PQpQqk8UnBL+fP9RWHwPsnVCqba5wLGSIL6gS8Js//i
         qVfXvnUpdXOd8mpMrtRJi7889ffSzJKAzlMadYt7q4+MZ9j9QLPOQU24yY6E+UfgnpNU
         WNHg==
X-Gm-Message-State: AOAM530RH3BFYm6IMebf//0SYr0xeeoLu3KcY1F9YM/YPIt/RyBfFmed
        MEzPj8ke2ECvS8NYbCU768tXWA==
X-Google-Smtp-Source: ABdhPJw1KJ3akbkNHnkpRR0aVBwuKap2U8kx/wsFNADR5HXFaJmmqShB3r0PApZxx+T3Mq2LN8muGg==
X-Received: by 2002:a17:903:22cc:b0:142:d31:bd9 with SMTP id y12-20020a17090322cc00b001420d310bd9mr8743022plg.64.1638377179767;
        Wed, 01 Dec 2021 08:46:19 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id v63sm196215pgv.71.2021.12.01.08.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:46:18 -0800 (PST)
Date:   Wed, 1 Dec 2021 09:46:16 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Initial Renesas R-Car remoteproc support
Message-ID: <20211201164616.GA834591@p14s>
References: <20211130100049.129418-1-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130100049.129418-1-julien.massot@iot.bzh>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good morning,

On Tue, Nov 30, 2021 at 11:00:47AM +0100, Julien Massot wrote:
> Most of the SoCs in the R-Car gen3 SoC series such as
> H3,M3 and E3 have an 'Arm Realtime Core'.
> This Realtime core is an Arm Cortex-R7 clocked at 800MHz.
> This series adds initial support to load a firmware and start
> this remote processor through the remoteproc subsystem.
> 
> This series depends on
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211022122101.66998-1-julien.massot@iot.bzh/
> to be able to set the Cortex-R7 boot address.

The above depencency is needed for this patchset to compile properly.  Since
Geert has already applied it to his renesas-devel tree we can do two things:

1) Make this set go through Geert's tree.
2) Geert publishes an immutable branch I can pull the dependency from.

I'm good either way, just let me know what you want to do.

Thanks,
Mathieu

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
> Device tree modifications have been dropped in this patchset version.
> Reason is that memory range used by the Cortex-R7 depends on
> design choice.
> One thing we could do in the future is to add CR7 node
> in the different Gen3 SoCs dtsi files such as r8a77951.dtsi, r8a77990.dtsi,
> r8a77961.dtsi.. 
> 
> Julien Massot (2):
>   dt-bindings: remoteproc: Add Renesas R-Car
>   remoteproc: Add Renesas rcar driver
> 
>  .../remoteproc/renesas,rcar-rproc.yaml        |  65 +++++
>  drivers/remoteproc/Kconfig                    |  11 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/rcar_rproc.c               | 226 ++++++++++++++++++
>  4 files changed, 303 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
>  create mode 100644 drivers/remoteproc/rcar_rproc.c
> 
> -- 
> 2.33.1
> 
> 
