Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A669DC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Apr 2022 22:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbiDEWMG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Apr 2022 18:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457063AbiDEQCm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Apr 2022 12:02:42 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70E7EEA4B
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Apr 2022 08:26:53 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id z16so12421508pfh.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Apr 2022 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kdycBsuX0g++/RcAqO3Nh9RpbFLdm52QoSaW2fF8jpA=;
        b=vWElyWYs5POabdNlTJG/H3Z8Mcd7e7W1xxw4ojO5DcfZmeJmBi4zgZ4udZCL5YkkJC
         gcfavDDrTarEbQoPO4Sdio+h9k3N6ADyEMGUi2aHg7GXp2palwloLsHgGZNrDlCbcL2x
         ar4hVSaUpOdRz3ORNcruxOquOe7N6t2NeatyyU3qjlHvvq9TbTKXi+s+9icEwa4BgjH9
         5FLHspkniaM0KwAJhgpa6Du4DK5nYVmJaiJmRAazUcC+uPIvQ5xOHHuogY1cNOTeyxSw
         vwjjpLCs1Q0xNLcF7g4oMhTJZaF7Drg3jNvA6UtPNtKESTPExorYtxrIBGkXbYKmJIcb
         WNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kdycBsuX0g++/RcAqO3Nh9RpbFLdm52QoSaW2fF8jpA=;
        b=OXMiqUwfGU0zLNzQegosyEk6flgV4tb/WDmcC9TL+Pait/77ZlXi82Gxp0x4Js+/7l
         XzaQV8oKAqkZEjj1gt8UFEiCvfbpSmbY085pwzK4+tcJP4xV15KtmYQa+cfLkGVxYOvT
         ToO+ztuRw9xkv8nI9MsEgzbXJr3+kh+y/OoIWFlGFctMngrfDtuRn7Tewit73iOThLZG
         OYW0ak8p7uXStjN/zxma+RbLu1jqkXzmd4jD5wSLLpGH4Fk+UZOBFq/CUe6KHYyMKqwW
         dyXP2nh7J2Cshc++VC6mUwFjBn7aHIIyrvXlQKaduBYbZVN60PZw0U39eTp1EBfVObPa
         WPBg==
X-Gm-Message-State: AOAM532N1sKhCUrWLGaQ+BACcLL383rLYWNiYMbWzfijnr+jIH0Q/krJ
        z6l1XFVD+MiV4x02gjKOFD/poQ==
X-Google-Smtp-Source: ABdhPJzrbX/Sddjrknw9Kh/d2WHnv7CItd5Pk7DXrwOfNDQD+F5B4NYZiMWJySrhddyqzsAOE88YMg==
X-Received: by 2002:a65:6813:0:b0:384:b288:8702 with SMTP id l19-20020a656813000000b00384b2888702mr3339475pgt.275.1649172413085;
        Tue, 05 Apr 2022 08:26:53 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id m21-20020a17090ab79500b001ca3c46ba2fsm2737681pjr.24.2022.04.05.08.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 08:26:52 -0700 (PDT)
Date:   Tue, 5 Apr 2022 09:26:49 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2] RISC-V: configs: Configs that had RPMSG_CHAR now get
 RPMSG_CTRL
Message-ID: <20220405152649.GC4147585@p14s>
References: <20220405115729.1020889-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405115729.1020889-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Apr 05, 2022 at 01:57:29PM +0200, Arnaud Pouliquen wrote:
> In the commit 617d32938d1b ("rpmsg: Move the rpmsg control device
> from rpmsg_char to rpmsg_ctrl"), we split the rpmsg_char driver in two.
> By default give everyone who had the old driver enabled the rpmsg_ctrl
> driver too.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
> 
> This patch is extracted from the series [1] that has been partially
> integrated in the Linux Kernel 5.18-rc1.
> 
> Update vs previous version:
> - remove "Fixes:" tag in commit, requested by Mathieu Poirier in [2]
> 
> [1]https://lore.kernel.org/lkml/15be2f08-ba03-2b80-6f53-2056359d5c41@gmail.com/T/
> [2]https://lore.kernel.org/linux-arm-kernel/CANLsYky1_b80qPbgOaLGVYD-GEr21V6C653iGEB7VCU=GbGvAQ@mail.gmail.com/T/
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

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> -- 
> 2.25.1
> 
