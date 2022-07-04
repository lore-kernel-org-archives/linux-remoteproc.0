Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5811DC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Jul 2022 17:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234288AbiGDRsx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Jul 2022 13:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234285AbiGDRsw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Jul 2022 13:48:52 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E9064CF
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Jul 2022 10:48:51 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 145so9425699pga.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Jul 2022 10:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Udd4R3ZrMYiNGLqIpE7ggk+XAAQ35MqvZZnbwebCtH0=;
        b=ywwgPuQETUb0XKgmY6N8kbYzlczDZlOgpvxcJbu5idjcakvBApLm8foq6ddCSFC0Ge
         Wk3scbhyna/+OwEM2m4e9YLbB9Ycc8Q3MjydiudyvccO+YCwADgPkHsn+kN1igv4inHs
         yqJxtUSgRPZcj3VbKRbdFj6wON/mjKxXVgdDpvkliicFFhqDTd8tX/NcKr0jQPNLVDmz
         f1s1HzI0LQb9rYKssLkBZmMLo2mMC25UB99OHAsi35DXkCUTAMj7vRZ0t3Zmz/3BAioK
         FKMYL129R2wm1paNi/n/ElkJe1rXisYE/XVGHSgsE3C4DhiyQOsSttc5gkM41X94i0LO
         KpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Udd4R3ZrMYiNGLqIpE7ggk+XAAQ35MqvZZnbwebCtH0=;
        b=rE0+dLHvplkBbZ93eV1FRtF5cVdp+2F6eowz4Nh11S0U2nIpFAFOtswYJZphEXvnfo
         f1fFaymRFQNBED3tdEmw4/h6g8Kkk0GLZcEHlQ9gU5W4Zdg58HU/dtLMrxiICZ+is7ko
         SJUoFAzttVj9OB7o+knDbvQ43XNLzlEoq5r36nfKH7Y2R3I4x0bCPrO96HAekNy4M0ul
         BYlt5XVQ229D402TDvqbcaVO7QDb8F3PLyrc1vMLXXM6bhoIu7u+D34AR6ZgGecyZ5wP
         nIbrdmu6Z3QfzlHacaaBTjSx39Ol3IdgCPYW26IheuKEKi5wyKHdF5+QAAqBXe6W7LXi
         /iag==
X-Gm-Message-State: AJIora+93DCr26hUwDbZtswJY9I8Iabq4t56yxdWDVH78uY5FDRGXZkl
        5Jf7uA882uhh6LuDpuuZ/J4dAWZqS3YHww==
X-Google-Smtp-Source: AGRyM1uf4yCHruMaBFnncT3Rtuctls7yZWm6tVxELQFCsmBfuHdLgzQ/6Y8Qu5Zfe803boexULTN9w==
X-Received: by 2002:a63:8741:0:b0:411:6ef8:18ec with SMTP id i62-20020a638741000000b004116ef818ecmr26917433pge.258.1656956931272;
        Mon, 04 Jul 2022 10:48:51 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id z13-20020a17090a8b8d00b001ec798b0dc4sm12986101pjn.38.2022.07.04.10.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 10:48:49 -0700 (PDT)
Date:   Mon, 4 Jul 2022 11:48:47 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: Re: [PATCH v6 0/4] remoteproc: restructure the remoteproc VirtIO
 device
Message-ID: <20220704174847.GC2375750@p14s>
References: <20220603163158.612513-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603163158.612513-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

I have started reviewing this set.

Thanks,
Mathieu

On Fri, Jun 03, 2022 at 06:31:54PM +0200, Arnaud Pouliquen wrote:
> 1) Update from V5 [1]:
> 
> Updates based on Mathieu's comments.
> Updates are listed in the commit message of each patch.
> 
> [1] https://lkml.org/lkml/2022/4/6/597
> 
> 2) Patchset description:
> 
> This series is a part of the work initiated a long time ago in 
> the series "remoteproc: Decorelate virtio from core"[2]
> 
> Objective of the work:
> - Update the remoteproc VirtIO device creation (use platform device)
> - Allow to declare remoteproc VirtIO device in DT
>     - declare resources associated to a remote proc VirtIO
>     - declare a list of VirtIO supported by the platform.
> - Prepare the enhancement to more VirtIO devices (e.g I2C, audio, video, ...).
>   For instance be able to declare a I2C device in a virtio-i2C node.
> - Keep the legacy working!
> - Try to improve the picture about concerns reported by Christoph Hellwing [3][4]
> 
> [2] https://lkml.org/lkml/2020/4/16/1817
> [3] https://lkml.org/lkml/2021/6/23/607
> [4] https://patchwork.kernel.org/project/linux-remoteproc/patch/AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch/
> 
> In term of device tree this would result in such hierarchy (stm32mp1 example with 2 virtio RPMSG):
> 
> 	m4_rproc: m4@10000000 {
> 		compatible = "st,stm32mp1-m4";
> 		reg = <0x10000000 0x40000>,
> 		      <0x30000000 0x40000>,
> 		      <0x38000000 0x10000>;
>         memory-region = <&retram>, <&mcuram>,<&mcuram2>;
>         mboxes = <&ipcc 2>, <&ipcc 3>;
>         mbox-names = "shutdown", "detach";
>         status = "okay";
> 
>         #address-cells = <1>;
>         #size-cells = <0>;
>         
>         vdev@0 {
> 		compatible = "rproc-virtio";
> 		reg = <0>;
> 		virtio,id = <7>;  /* RPMSG */
> 		memory-region = <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>;
> 		mboxes = <&ipcc 0>, <&ipcc 1>;
> 		mbox-names = "vq0", "vq1";
> 		status = "okay";
>         };
> 
>         vdev@1 {
> 		compatible = "rproc-virtio";
> 		reg = <1>;
> 		virtio,id = <7>;  /*RPMSG */
> 		memory-region = <&vdev1vring0>, <&vdev1vring1>, <&vdev1buffer>;
> 		mboxes = <&ipcc 4>, <&ipcc 5>;
> 		mbox-names = "vq0", "vq1";
> 		status = "okay";
>         };
> };
> 
> I have divided the work in 4 steps to simplify the review, This series implements only
> the step 1:
> step 1:  redefine the remoteproc VirtIO device as a platform device
>   - migrate rvdev management in remoteproc virtio.c,
>   - create a remotproc virtio config ( can be disabled for platform that not use VirtIO IPC.
> step 2: add possibility to declare and probe a VirtIO sub node
>   - VirtIO bindings declaration,
>   - multi DT VirtIO devices support,
>   - introduction of a remote proc virtio bind device mechanism ,
> => https://github.com/arnopo/linux/commits/step2-virtio-in-DT
> step 3: Add memory declaration in VirtIO subnode
> => https://github.com/arnopo/linux/commits/step3-virtio-memories
> step 4: Add mailbox declaration in VirtIO subnode
> => https://github.com/arnopo/linux/commits/step4-virtio-mailboxes
> 
> Arnaud Pouliquen (4):
>   remoteproc: core: Introduce rproc_rvdev_add_device function
>   remoteproc: core: Introduce rproc_add_rvdev function
>   remoteproc: Move rproc_vdev management to remoteproc_virtio.c
>   remoteproc: virtio: Create platform device for the remoteproc_virtio
> 
>  drivers/remoteproc/remoteproc_core.c     | 153 +++---------------
>  drivers/remoteproc/remoteproc_internal.h |  23 ++-
>  drivers/remoteproc/remoteproc_virtio.c   | 188 ++++++++++++++++++++---
>  include/linux/remoteproc.h               |   6 +-
>  4 files changed, 209 insertions(+), 161 deletions(-)
> 
> -- 
> 2.24.3
> 
