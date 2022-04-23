Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF20C433EF
	for <linux-remoteproc@archiver.kernel.org>; Sat, 23 Apr 2022 02:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbiDWCo2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Apr 2022 22:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232165AbiDWCo1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Apr 2022 22:44:27 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350091F624B
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Apr 2022 19:41:32 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id n18so14733411plg.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Apr 2022 19:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=REmfpzw1xMslNBXNKTYCRBYBhCFLFRCkqr4sRav5rgY=;
        b=4WeFBWPm+HwABfSRIIkgJWStFSAErKQ/PmL1rmQcC8lm1M4HPRnhWaTMlxULv/SJGz
         ZgQ+tx/5aektTp0kYDf9FspiE/y5Zv7s8DUB6Esf1qL39NDJqj3bXDRhACiW3YnolmTB
         P+qGJIIMZ8W9gNEo+ngQg63rzScAPaKDmbLMZ2pcxKUvkNQR1PB0iuJc+ZmFhJqek+Jt
         TJYj3VMtSZFbSsbpRAu9X7+MqLSBKd5OKX8QYOQQIWMVV4CSO2spuqMfg2Nsi0wCxfpT
         dRfP1s9+4hfKrzJYg+TxTWs1NHV8mfHUa9Uv5mFJKQ94O/WpZ44cF+dHvqMg9aYA3Um/
         MTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=REmfpzw1xMslNBXNKTYCRBYBhCFLFRCkqr4sRav5rgY=;
        b=qm5ocBt58/+BF2NhZBQauFjWHrQXy46ZdwmRD7FfTqkcsG3aMl9pUzqnyc9n/mBIKl
         bY8hoaZxc19ZS9mbomxM/8SK2U4uhD5RO9wjqP4VSbXWoS0B83QX57IRzN67VkNNr7yL
         uWPLo/GePbmwl3oQRnqZmFvpf4P/bYUH3jWmMTSuYudJkzbFuCYd/yFV20mGgsLWy8mF
         GL904hj2aIr9TC6jI8NwzM78lPAqP3dqJikHvTm/HSyLMjM0maNiq0gq+HRO9SgmpCrI
         qp4Eq+SNZptOM13vmCXoS49V72QnEW3IMl0eVi1+ur07OY0ALjRko+QiRb5ZM8AkSfLk
         pHYQ==
X-Gm-Message-State: AOAM5313vWgpGedh3kg2+GW8gJS5o7xwJ5Ht+YvlUX/r+SSqeRe89qTP
        q2H3QQ8OAIWCyk+2rfwwb+vMsg==
X-Google-Smtp-Source: ABdhPJzTDUsXmUPRCkNu/YoxmSMlqJ3ANNR0+ezB3YEc/HXUrEK20xXuSZtgCWqoud9K1+OVziq2Cg==
X-Received: by 2002:a17:903:18f:b0:15a:1cc6:48f5 with SMTP id z15-20020a170903018f00b0015a1cc648f5mr7521584plg.161.1650681691627;
        Fri, 22 Apr 2022 19:41:31 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id ch10-20020a056a00288a00b0050a51a95e91sm3614749pfb.201.2022.04.22.19.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 19:41:30 -0700 (PDT)
Date:   Fri, 22 Apr 2022 19:41:30 -0700 (PDT)
X-Google-Original-Date: Fri, 22 Apr 2022 19:26:44 PDT (-0700)
Subject:     Re: [PATCH] RISC-V: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL
In-Reply-To: <20220404090527.582217-1-arnaud.pouliquen@foss.st.com>
CC:     Paul Walmsley <paul.walmsley@sifive.com>,
        linux-riscv@lists.infradead.org, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, arnaud.pouliquen@foss.st.com,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        anup@brainfault.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     arnaud.pouliquen@foss.st.com
Message-ID: <mhng-540193db-7721-4cd3-935a-be485b4af058@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 04 Apr 2022 02:05:27 PDT (-0700), arnaud.pouliquen@foss.st.com wrote:
> In the patch 617d32938d1b: "rpmsg: Move the rpmsg control device
> from rpmsg_char to rpmsg_ctrl", we split the rpmsg_char driver in two.
> By default give everyone who had the old driver enabled the rpmsg_ctrl
> driver too.
>
> Fixes: 617d32938d1b ("rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl", 2022-01-24)
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
> this patch is extracted from the series [1] that has been partially
> integrated in the Linux Kernel 5.18-rc1.
>
> [1]https://lore.kernel.org/lkml/15be2f08-ba03-2b80-6f53-2056359d5c41@gmail.com/T/
> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 30e3017f22bc..0cc17db8aaba 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -101,6 +101,7 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_RPMSG_CHAR=y
> +CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 7e5efdc3829d..6cd9d84d3e13 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -93,6 +93,7 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_RPMSG_CHAR=y
> +CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y

Thanks, this is on fixes.
