Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13739C433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Apr 2022 15:38:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378626AbiDDPkh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Apr 2022 11:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235560AbiDDPkd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Apr 2022 11:40:33 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BA95F58
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Apr 2022 08:38:35 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id bh17so20783295ejb.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Apr 2022 08:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DtedD6FM09IE5LoSxarN6jcAT2s5M/K/DaVAu90VEgY=;
        b=TgjWxw2Tu2SNr1XQhx6UNYoyLIPR7tEDNZMnMuejypmnlzQS0brHnvULAnzuYnuKdk
         SUcnC2kLH/U+5QdXxknWTEMfSMTrTE+8iFovtpKTFyMqAposqZoFoyoStZ112CbIO8aT
         OJC7nQk0t5jXiwAiqELcaMygw1cSF5nP5vPX8EdX1zK7P7wIZ7DA+j3Uf+oGsvykFr8A
         +eYgBJHPYAnih7TwzjK/jlyE0XgHdPvA+8KbSRO/0dXFG1tcNodnjL49zy6fsWdFL5tL
         l+zEv+P7E+ZQiUCb2LKK38cVVLz3RIMnvI5s1gdA6R7zTK10DdJfVgoGh8L7zOvEwOk3
         N7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DtedD6FM09IE5LoSxarN6jcAT2s5M/K/DaVAu90VEgY=;
        b=Sm7TkGQ+7Czdkl1bULv4BXQ7aGXX7tIHmIDrXqVdVaz8e1LNhn4vnbS1ycGRBoqN1y
         gOBNc8YCn5uhdV/vJSGSkxXf/YTmV4ByIYsQVOjYmqFfKzskMO6TFlDswVBRIN8W7ZyS
         g9kSuxqA03Ihv9Qmi+XphYkV1LuT1HA6gsbPWV3kjcxgNf2qSWjTu7kX+WABM4WKl2eE
         F4pAeM0+uWtF/mt7eQZHoG16FoR5Up0jW48+6k0yRKXDUhkND+JOZi+Up8TjWkPDGrKf
         b1zV9SX55nD33tVDvtxr9gi8yAZbcT/zqzth5RDsFepbv9WUdjjALnjC6vrWTkYQbpHY
         yeUQ==
X-Gm-Message-State: AOAM533d4/hcsEh48PTRWoXbARecuHICLv5jRC7j8vMQTdScCfbH3KzQ
        vb2FonNcAbA/OJj3ZcwrFuDdFGKnvBruVCJNsmotjg==
X-Google-Smtp-Source: ABdhPJxjxfAWOjP0Rg4CpsTHWBMkYr4sFaAA4HVxbRip7CKBJKVdsKQZcRxwN7VR09drWMM/O/TxBzQ5ja7Lg5ChdEs=
X-Received: by 2002:a17:907:9506:b0:6da:b4cd:515b with SMTP id
 ew6-20020a170907950600b006dab4cd515bmr676585ejc.602.1649086713585; Mon, 04
 Apr 2022 08:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220404090047.581523-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20220404090047.581523-1-arnaud.pouliquen@foss.st.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 4 Apr 2022 09:38:22 -0600
Message-ID: <CANLsYky1_b80qPbgOaLGVYD-GEr21V6C653iGEB7VCU=GbGvAQ@mail.gmail.com>
Subject: Re: [PATCH] arm: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day,

On Mon, 4 Apr 2022 at 03:01, Arnaud Pouliquen
<arnaud.pouliquen@foss.st.com> wrote:
>
> In the patch 617d32938d1b: "rpmsg: Move the rpmsg control device
> from rpmsg_char to rpmsg_ctrl", we split the rpmsg_char driver in two.
> By default give everyone who had the old driver enabled the rpmsg_ctrl
> driver too.
>
> Fixes: 617d32938d1b ("rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl", 2022-01-24)

A date should not appear in a Fixes tag - please remove.  I would also
remove the entire tag since there was nothing wrong with commit
617d32938d1b.  Re-organising and splitting things up is part of normal
kernel development, and that process often implies modifications to
the kernel config files.

Same comment for the other 2 patches.

Thanks,
Mathieu


> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>
> This patch is extracted from the series [1] that has been partially
> integrated in the Linux Kernel 5.18-rc1.
>
> [1]https://lore.kernel.org/lkml/15be2f08-ba03-2b80-6f53-2056359d5c41@gmail.com/T/
> ---
>  arch/arm/configs/qcom_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
> index 9981566f2096..2e7e9a4f31f6 100644
> --- a/arch/arm/configs/qcom_defconfig
> +++ b/arch/arm/configs/qcom_defconfig
> @@ -241,6 +241,7 @@ CONFIG_QCOM_Q6V5_PAS=y
>  CONFIG_QCOM_Q6V5_PIL=y
>  CONFIG_QCOM_WCNSS_PIL=y
>  CONFIG_RPMSG_CHAR=y
> +CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_QCOM_GLINK_SMEM=y
>  CONFIG_RPMSG_QCOM_SMD=y
>  CONFIG_QCOM_COMMAND_DB=y
> --
> 2.25.1
>
