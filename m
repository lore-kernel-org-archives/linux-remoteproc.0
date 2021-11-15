Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE09C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 16 Nov 2021 01:07:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F44861350
	for <linux-remoteproc@archiver.kernel.org>; Tue, 16 Nov 2021 01:07:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351455AbhKPBKK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Nov 2021 20:10:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245133AbhKOTTc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Nov 2021 14:19:32 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A91C0432FB
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Nov 2021 10:10:40 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id iq11so13543055pjb.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Nov 2021 10:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YM/BDkHk6Vn5QiPpZwxaD/d/I7TPDYs9RR7ukf+/xMs=;
        b=bkDelfYnLSqD4Yv5PZ3Oy9XmA4+IHYG+hCzcQJ+091dZmyzry8Y06ewKRMQXmVZ1fM
         o+bRzlT9cQfG7ihzd631YIIky7cX2dyFEbrDqVeu4tGv2IKgd2J2n5ojH+g253wPm5H2
         MiLGZWPrRRygy+AkWk2L4LGRXGdHc8/1fepym8C/Z6Y8gUUAQ9wuLm33Dc2/BtSTcQTD
         PUFtcqkPmal09lIdzbVSY3JtCwGqVdu5TTrDtcxxcMDic9cfNUDwcNPsiWbslRRzM2G0
         kr/zF5RFkQZ3+G+T4hzzRhXKKCyYZxeb/hbnnuscqynkmvNKT+pMDgLdAE4rFSonSI9X
         HJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YM/BDkHk6Vn5QiPpZwxaD/d/I7TPDYs9RR7ukf+/xMs=;
        b=bhiypFRIxSR7TZsZZf7Th1Wqf2NIHSAAzfirgH/WRIC5fohwe5uG20jf5ZZVkN9hs5
         WJIje9/Q74e693AhZddx/DSGhhglxi/WTxxEp/qLIdOKgIthkYMiQhNdbSigXBQ43f67
         8qEaiDGASi9bHX1Vd9smNAMOp1nkAtjgJ0lmeSNbuYJsXAspmafRSPK70MkUsyG01wQX
         ehQ3gv4fqj+c0lxHcmldMdIvNS60zCesd20sQDnJaJ58LiB88ct8PKJ+L3Vcvbje55EK
         2O7fBrinPs61Mmtj1d4Qy/UxV6pUturCDBO1TG5lfQmBcfhUxhjiwTT2AYEyPl01xN5R
         SIRQ==
X-Gm-Message-State: AOAM530H4Rq1MJvBLTakwhpSzRKq44/OUobK+CBW5lD3sjjmK4vhBjKf
        NAYVJ8lbgZATPPp8gJHA7l6PZw==
X-Google-Smtp-Source: ABdhPJyQqPiDgUfpIPWJFzXM/rmCYzhCuO9hlX8B2xMkX1lEl5guJ1XdOMoeSvRr5ILEOWHp41w4Dw==
X-Received: by 2002:a17:90b:4a50:: with SMTP id lb16mr557483pjb.147.1636999839828;
        Mon, 15 Nov 2021 10:10:39 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id co4sm46714pjb.2.2021.11.15.10.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 10:10:38 -0800 (PST)
Date:   Mon, 15 Nov 2021 11:10:36 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 0/3] Initial Renesas R-Car remoteproc support
Message-ID: <20211115181036.GA2281903@p14s>
References: <20211115135032.129227-1-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115135032.129227-1-julien.massot@iot.bzh>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good morning,

I have received your patchset but the backlog accumulated over the last little
while as become impressive.  As such I may not be able to provide a review in
a timeframe that usually expected.


Thanks,
Mathieu

On Mon, Nov 15, 2021 at 02:50:29PM +0100, Julien Massot wrote:
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
> One of the way to test this driver is to  use the zephyr upstream support
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
> Patch 1/3 adds the dt-bindings
> 
> Patch 2/3 adds entries into the dts/dtsi files for r8a77951,
> my testing platform. This driver has also been tested on E3 and M3,
> but lacks proper zephyr support at the moment.
> 
> Modifications to r8a77951-ulcb.dts are given as usage example
> and may be dropped in future patchset since it use some memory
> range that may be reserved for other usage.
> 
> Patch 3/3 is a small driver to cover basic remoteproc
> usage: loading firmware from filesystem, starting and stopping the
> Cortex-r7 processor.
> 
> Julien Massot (3):
>   dt-bindings: remoteproc: Add Renesas R-Car
>   arm64: dts: renesas: r8a77951: Add CR7 realtime processor
>   remoteproc: Add Renesas rcar driver
> 
>  .../remoteproc/renesas,rcar-rproc.yaml        |  66 +++++
>  arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts |  15 ++
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi     |   7 +
>  drivers/remoteproc/Kconfig                    |  12 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/rcar_rproc.c               | 226 ++++++++++++++++++
>  6 files changed, 327 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
>  create mode 100644 drivers/remoteproc/rcar_rproc.c
> 
> -- 
> 2.31.1
> 
> 
