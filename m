Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB51EB64D8
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Jun 2023 17:17:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjFVRRa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Jun 2023 13:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjFVRR3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Jun 2023 13:17:29 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E7DE1995
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Jun 2023 10:17:27 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-666ecf9a081so5532260b3a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Jun 2023 10:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687454246; x=1690046246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+caNylAFJnS4RfDuuqPQ5kEyaoWMVveGgJSagPXpK3E=;
        b=eWwIE86gJ1vNE6oGTJapOZQFT46TllCzUn6zfU2GJowNtlE4ccaAhmjBf1y6GkqZMQ
         Jav+kIow91KofjqIfAO67sRRofF5Lc3/t38LsiHYAXUYTAxQLN7SFoAttjh96+DhY+FA
         TxusneS92lYEmaAbHSGHOV5jRmE2njvUR81kooDRK6RS2zHGqhaTZJL5L/TJB3gWpNYs
         ZRYJ1C/Z1HtyufIbMTq6CSXbOkYWLaSfZEDR1aMWR7EcQKcxtXegPTtDIWhI86ZZ3PEG
         iaRxBCeSN3cuCMYJsP7PBCYE5qfoQ0qHuUeuhpYPaUmvk9TVOMXrp2Ps+OKItL5slb+c
         UA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687454246; x=1690046246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+caNylAFJnS4RfDuuqPQ5kEyaoWMVveGgJSagPXpK3E=;
        b=Q7EwknLorg0HRTgfRfeWBduYHlbd20kZuENwMi8rgBd+ZEe3TIiiCncESju9ozP0MP
         XD64ad1YXbKvo++FLaI/S2yKS8Dh6KKBBW8o9QLyzhCTqkPf5MY0Wg4Nfu2tyfXW7aT2
         QZmfkryrH3sS1MZjjYd5Qll+WljQVG8ioxftPTvlFASOsAk4sNfKRjPYSa+5NzIqgpPo
         9V/rFWu9oqoiilwjMxg5Cyz6JnQldbQVL0bxVLLoSeQFjUgZAXAF6aqhyOm5HUDRqwfL
         xAITlU0xITtMXThRfTQ114utlUPDvto8xfXSDmt0bJX8YaryvZam/BosULnCj5W4oBFq
         WlGg==
X-Gm-Message-State: AC+VfDyTZ8YQVfzV/RqmnghdGXB/ULuxDxAWpTZaLUSoe1GS8d/s7o1X
        GtljSRm5fqL6tBMLTTnON+dBEA==
X-Google-Smtp-Source: ACHHUZ7q4CWIXONGO3DtA6c8gq+2V5G73vpjcuVPbpvkFAZ173Ft2Wc6ltykzzv7Oo0mrdOFGu+tYA==
X-Received: by 2002:a05:6a20:7d8b:b0:122:7e50:f71b with SMTP id v11-20020a056a207d8b00b001227e50f71bmr11414744pzj.34.1687454246493;
        Thu, 22 Jun 2023 10:17:26 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2d81:4abe:75da:eae])
        by smtp.gmail.com with ESMTPSA id c11-20020a62e80b000000b00649ac17779csm4780000pfi.160.2023.06.22.10.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:17:25 -0700 (PDT)
Date:   Thu, 22 Jun 2023 11:17:22 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Tinghan Shen <tinghan.shen@mediatek.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v13 00/11] Add support for MT8195 SCP 2nd core
Message-ID: <ZJSCIhhLTv/pP/HA@p14s>
References: <20230607072222.8628-1-tinghan.shen@mediatek.com>
 <5a9beeec-5762-c469-6e03-b71babb5f7ed@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a9beeec-5762-c469-6e03-b71babb5f7ed@collabora.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jun 22, 2023 at 12:00:08PM +0200, AngeloGioacchino Del Regno wrote:
> Il 07/06/23 09:22, Tinghan Shen ha scritto:
> > The mediatek remoteproc driver currently only allows bringing up a
> > single core SCP, e.g. MT8183. It also only bringing up the 1st
> > core in SoCs with a dual-core SCP, e.g. MT8195. This series support
> > to bring-up the 2nd core of the dual-core SCP.
> > 
> 
> Hello TingHan,
> 
> Can you please address the comments on patch [05/11] and send a new version ASAP?
> That's the only remaining issue, so after that the series should be ready.
> 

There is also the refactoring work in patch 07, and I expect that to take a
while.

> Thanks,
> Angelo
> 
> > v12 -> v13:
> > 1. replace subdevice with new mediatek scp operations in patchset 7
> > 2. add review tag to patchset 3
> > 3. modify mediatek,scp phandle name of video-codec@18000000 at patchset 11
> > 
> > v11 -> v12:
> > 1. add scp_add_single/multi_core() to patchset 6
> > 2. remove unused comment in patchset 6
> > 3. rename list name from mtk_scp_cluster to mtk_scp_list
> > 4. rewrite the multi-core probe flow
> > 5. disable rproc->autoboot and boot rproc by request_firmware_nowait at patchset 7
> > 6. remove patchset 7 review tag
> > 
> > v10 -> v11:
> > 1. rewrite patchset 5 to probe single-core SCP with the cluster list
> > 2. Also in patchset 5, move the pointer of mtk_scp object from the
> >     platform data property to the driver data property
> > 3. move the appearance of mtk_scp cluster property to patcheset 7
> > 
> > v9 -> v10:
> > 1. move the global mtk_scp list into the platform device driver data structure
> > 2. remove an unnecessary if() condition
> > 
> > v8 -> v9:
> > 1. initialize l1tcm_size/l1tcm_phys at patchset 05/11
> > 2. rewrite patchset 06/11 to unify the flow and remove hacks
> > 
> > v7 -> v8:
> > 1. update the node name of mt8192 asurada SCP rpmsg subnode
> > 2. squash register definitions into driver patches
> > 3. initialize local variables on the declaration at patch v8 06/11
> > 
> > v6 -> v7:
> > 1. merge the mtk_scp_cluster struct into the mtk_scp structure
> >     at the "Probe multi-core SCP" patch
> > 
> > v5 -> v6:
> > 1. move the mtk_scp_of_regs structure from mtk_common.h to mtk_scp.c
> > 2. rename the SCP core 0 label from 'scp' to 'scp_c0'
> > 
> > v4 -> v5:
> > 1. move resource release actions to the platform driver remove operation
> > 2. fix dual-core watchdog handling
> > 
> > v3 -> v4:
> > 1. change the representation of dual-core SCP in dts file and update SCP yaml
> > 2. rewrite SCP driver to reflect the change of dts node
> > 3. drop 'remove redundant call of rproc_boot for SCP' in v3 for further investigation
> > 
> > v2 -> v3:
> > 1. change the representation of dual-core SCP in dts file and update SCP yaml
> > 2. rewrite SCP driver to reflect the change of dts node
> > 3. add SCP core 1 node to mt8195.dtsi
> > 4. remove redundant call of rproc_boot for SCP
> > 5. refine IPI error message
> > 
> > v1 -> v2:
> > 1. update dt-binding property description
> > 2. remove kconfig for scp dual driver
> > 3. merge mtk_scp_dual.c and mtk_scp_subdev.c to mtk_scp.c
> > 
> > 
> > Tinghan Shen (11):
> >    dt-bindings: remoteproc: mediatek: Improve the rpmsg subnode
> >      definition
> >    arm64: dts: mediatek: Update the node name of SCP rpmsg subnode
> >    dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP
> >    remoteproc: mediatek: Add MT8195 SCP core 1 operations
> >    remoteproc: mediatek: Introduce cluster on single-core SCP
> >    remoteproc: mediatek: Probe multi-core SCP
> >    remoteproc: mediatek: Add scp_boot_peers and scp_shutdown_peers
> >      operations
> >    remoteproc: mediatek: Setup MT8195 SCP core 1 SRAM offset
> >    remoteproc: mediatek: Handle MT8195 SCP core 1 watchdog timeout
> >    remoteproc: mediatek: Refine ipi handler error message
> >    arm64: dts: mediatek: mt8195: Add SCP 2nd core
> > 
> >   .../bindings/remoteproc/mtk,scp.yaml          | 176 +++++++-
> >   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   2 +-
> >   .../boot/dts/mediatek/mt8192-asurada.dtsi     |   2 +-
> >   .../boot/dts/mediatek/mt8195-cherry.dtsi      |   6 +-
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  32 +-
> >   drivers/remoteproc/mtk_common.h               |  26 ++
> >   drivers/remoteproc/mtk_scp.c                  | 425 ++++++++++++++++--
> >   7 files changed, 594 insertions(+), 75 deletions(-)
> > 
> 
