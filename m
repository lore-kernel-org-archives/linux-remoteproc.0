Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EDCC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Dec 2021 08:16:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbhLGITq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Dec 2021 03:19:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232008AbhLGITp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Dec 2021 03:19:45 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D169DC061748
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Dec 2021 00:16:15 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so1591157wme.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Dec 2021 00:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wV05YmqytZZ4i77GlP1Brthyva63mRUa2qE0+W2OXv4=;
        b=cC1Hbczjdh2dzt9ciK2qiKC3ZkYz1fGNc8p1h3oLUa2PWAkb2rVdSC0aavqJ+hIEzx
         pcvAhgPMbMkSHKM2in+pdz8ejZ2PqF/iimPZYtPQuW4YbhrLGril86javjmtKtUImtuH
         ZbQ9sVHkJZyetxai1yhoAKKC9qIRnccfGo4bqqCYFOUoJ0nMsc4ZaNR4ohPMMBMLYeq7
         5uSC9mLsvmQineh9UG21iURMUPJPQuwv8iGgoi/PBa323WyfEWbcdE7FWPdyC/L6aDau
         PXbmlej1r2JWIDKbmZZVVFWUIEidbsWHPyibno6dYOAKDAvZ/QWNTpn80CUMKZO2uJqe
         Q38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wV05YmqytZZ4i77GlP1Brthyva63mRUa2qE0+W2OXv4=;
        b=eS4iFFzjDShygC+jrPoVoTe1MJBB+Vf2MZ3st80D9AH0GcGKiMN02OlFEe6zfmvZIZ
         yyMa3U7b1KFg0tRtpBYPDopZYArYBCQMSwNqU12ghx05g3+PyNkEKrKZUCkj8cHpqV7T
         9iNCGCXFOVfEvL6VlZyD36PURTKz8MfbrVaZLG8MPni7OM/9pcuCmJ0KERzFBO4WYqCe
         KTNjCv/lCnZTXOr2OsM1aF/bsJ1N2oBegJkaPK0pcew/HgWPIj6Xp+Jn0eHqmgm1nftx
         DGs0FWBJfZRU7teJh9q0zokFNGn+ycuOAbU+ilfoChHPQVxNxI+mf65gN/MPQg3cWImd
         s/Rw==
X-Gm-Message-State: AOAM530t/BDJUhJzYkxbh94Zht8N6aa32An4eCJk9H0EMpxz5/zl69Sn
        vZoa2V0UTEeQea9rlxOEZdmpZkl3poDRLVH1W08TbhyswW4=
X-Google-Smtp-Source: ABdhPJy/5bX081hEllcHF+ciiU1wOWxT4YMmlv0lSO4Mp0uNC6xawLDFYKeG14mC3/pJJ+ZqaKc0D9h7/Cwk8IFQCsM=
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr5087144wmk.59.1638864974238;
 Tue, 07 Dec 2021 00:16:14 -0800 (PST)
MIME-Version: 1.0
References: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com> <20211207080843.21222-6-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20211207080843.21222-6-arnaud.pouliquen@foss.st.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Tue, 7 Dec 2021 13:46:03 +0530
Message-ID: <CAAhSdy3GDArfbQgusdDg-mi1bdTfDhFMaF4qa5-KFv1regwJ-Q@mail.gmail.com>
Subject: Re: [PATCH v8 05/13] RISC-V: configs: Configs that had RPMSG_CHAR now
 get RPMSG_CTRL
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Dec 7, 2021 at 1:39 PM Arnaud Pouliquen
<arnaud.pouliquen@foss.st.com> wrote:
>
> In the patch "rpmsg: Move the rpmsg control device from rpmsg_char
> to rpmsg_ctrl", we split the rpmsg_char driver in two.
> By default give everyone who had the old driver enabled the rpmsg_ctrl
> driver too.
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> cc: linux-riscv@lists.infradead.org

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index c252fd5706d2..c0439d3ffb8c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -97,6 +97,7 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_RPMSG_CHAR=y
> +CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 434ef5b64599..99eabad7ca0f 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -89,6 +89,7 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_RPMSG_CHAR=y
> +CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> --
> 2.17.1
>
