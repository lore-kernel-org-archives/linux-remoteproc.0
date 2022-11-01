Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7069DC4332F
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Nov 2022 20:40:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiKAUkm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 1 Nov 2022 16:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiKAUkl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 1 Nov 2022 16:40:41 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22FADF07
        for <linux-remoteproc@vger.kernel.org>; Tue,  1 Nov 2022 13:40:40 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id v17so11641034plo.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Nov 2022 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mOdWYdGW3s/P7m5FZD4/WdL1KbYLkJOJKiY+fmsgK1Y=;
        b=de8L7i8dhThB5jPU0QJ+wNCGKLfERSiRy+Nbh6pG252kQcQxnKnQdrC/dzwc2hsMlr
         aXSqguw0WCWoiHLlL8FFhFYXq5any+pt0sbBNK/Z6RyfW/Q96G2LiLAVl79je4VnNTZc
         rx7+QW6x2/TMYXuBQq6Crli0IYNQMfIW0re3/mURukLaYSLsG+CEd0VMlMAyPCD7M4C9
         9GGqwlrOuFinXjL1GQ/xEE6TwHb2EZbofdPaFWrE2pP5qCy4pczRGQwKJ17LIBJtMrYw
         lyxeDfIa0ZOR5vN8EbK8VDmf6DZ5plNsAi7rnapRAvQL37amHSUoIZZVL9z71/lBWZ0o
         pHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOdWYdGW3s/P7m5FZD4/WdL1KbYLkJOJKiY+fmsgK1Y=;
        b=wG1a9GoIXYrp1SXRwOm5aCvtcu7i/x5VSp6eQ78CcIQxciJWdgkDSqRT4kLuQ2lUKg
         35RiR3OxpbIJLgTM92dxt5jXdxqlGe1SkKDRtG7Bgv31c/VvvzLoLoan/F9BiCr2blpZ
         V/7Vl272Xs8yMv1lY1iWKyrcqQrFIeZGMyk5MmxfCRNik4v9y6GunRSme1Ov7TWS7b6K
         2ztt+Ms4KQdNEwAWgFPFII3EJbaWOdw69l9Wzk61l8Bvw7AWDWXbQveVrVuIhqWw82NM
         ina0HwgxhMpvZ0mzmzNYKpdEpj6k6ulhPVSiMe9wTrzSR/+WQbKe/1dcRlshn7KQ/w9u
         pnAA==
X-Gm-Message-State: ACrzQf2Y4DJuhMOh0RaGYIUYNyuxrk37NBUVA85My+XuPQ9s6oV9LfNg
        bp6ol+gZ5DwwVJb6oGJxkq1sbQ==
X-Google-Smtp-Source: AMsMyM6VfVb9FYoLCNZggIxd4jHQV9YIO5CmtN8F82LNyD+04hIVSj/1BCmis1ty+4F5c9ub9uHCgA==
X-Received: by 2002:a17:902:d2c4:b0:187:a4e:f9c1 with SMTP id n4-20020a170902d2c400b001870a4ef9c1mr18314924plc.168.1667335240174;
        Tue, 01 Nov 2022 13:40:40 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id o10-20020a62f90a000000b005625d5ae760sm7103069pfh.11.2022.11.01.13.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 13:40:39 -0700 (PDT)
Date:   Tue, 1 Nov 2022 14:40:37 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tinghan Shen <tinghan.shen@mediatek.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 00/11] Add support for MT8195 SCP 2nd core
Message-ID: <20221101204037.GA1656603@p14s>
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927025606.26673-1-tinghan.shen@mediatek.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day,

A lot of comments related to the handling of SCP 0 and 1 have already been made
on this patchset, along with my own advice from the previous patchset on how to
move forward.  As such I will wait for a new revision.

Thanks,
Mathieu

On Tue, Sep 27, 2022 at 10:55:55AM +0800, Tinghan Shen wrote:
> The mediatek remoteproc driver currently only allows bringing up a 
> single core SCP, e.g. MT8183. It also only bringing up the 1st 
> core in SoCs with a dual-core SCP, e.g. MT8195. This series support 
> to bring-up the 2nd core of the dual-core SCP.
> 
> v2 -> v3:
> 1. change the representation of dual-core SCP in dts file and update SCP yaml
> 2. rewrite SCP driver to reflect the change of dts node
> 3. add SCP core 1 node to mt8195.dtsi
> 4. remove redundant call of rproc_boot for SCP
> 5. refine IPI error message
> 
> v1 -> v2:
> 1. update dt-binding property description
> 2. remove kconfig for scp dual driver
> 3. merge mtk_scp_dual.c and mtk_scp_subdev.c to mtk_scp.c
> 
> Tinghan Shen (11):
>   dt-bindings: remoteproc: mediatek: Give the subnode a persistent name
>   dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP
>   arm64: dts: mt8195: Add SCP core 1 node
>   remoteproc: mediatek: Remove redundant rproc_boot
>   remoteproc: mediatek: Add SCP core 1 register definitions
>   remoteproc: mediatek: Add MT8195 SCP core 1 operations
>   remoteproc: mediatek: Probe MT8195 SCP core 1
>   remoteproc: mediatek: Control SCP core 1 boot by rproc subdevice
>   remoteproc: mediatek: Setup MT8195 SCP core 1 SRAM offset
>   remoteproc: mediatek: Handle MT8195 SCP core 1 watchdog timeout
>   remoteproc: mediatek: Refine ipi handler error message
> 
>  .../bindings/remoteproc/mtk,scp.yaml          | 132 ++++++++--
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   2 +-
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  14 +-
>  .../mediatek/vcodec/mtk_vcodec_fw_scp.c       |   2 +-
>  drivers/remoteproc/mtk_common.h               |  35 +++
>  drivers/remoteproc/mtk_scp.c                  | 241 +++++++++++++++++-
>  include/linux/remoteproc/mtk_scp.h            |   1 +
>  7 files changed, 397 insertions(+), 30 deletions(-)
> 
> -- 
> 2.18.0
> 
