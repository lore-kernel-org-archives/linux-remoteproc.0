Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BBFC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Oct 2021 15:56:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5514961074
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Oct 2021 15:56:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234892AbhJLP6a (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Oct 2021 11:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237250AbhJLP63 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Oct 2021 11:58:29 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DAEC061749
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Oct 2021 08:56:28 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id g9so3390208plo.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Oct 2021 08:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mePc1vd/EHkCrzmAohlwat8GzWH/E7cD+W9nQvLLIu4=;
        b=kVgy/+a6lh3I0ZXvFbqdwy4cdixEQ48qJ26ZMs6smSIwYFRMHnCYmK74ep66Sx3NOp
         5DZI2jgV+ULNul+LewUNEth7jaeoPygVEtuP9gnEsicoqXqHN549VAJManTku0D5jOZh
         /4aNCfAUh2JFPJN3uU8zI7/CYX+exCFxt+5NJTzB18HiDlKzLS7jZYywMt1OQNIEiGxN
         xEEx2frxHKz7CMP4DJnzXoKGzi7Eo/4yd4/T/Ru0VxqVdIKOzVQ0f03R0stfXqKLZXFZ
         zjyxI4X1ikLAAOU48ftSRGNlddJUAgPYuVygYJgHeqI+QI0JbR6wKnd2eJMndpbs23QA
         +Tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mePc1vd/EHkCrzmAohlwat8GzWH/E7cD+W9nQvLLIu4=;
        b=vf0I/hTPTT3/RlZQ+NQ9e+h9HEYEyGcsPpaQvpDTVeQ56qzwozb9YbGWJClQ/EJgPY
         23tMWI+5eGnKl9eCRJ5Xh04RVmhOnHUNrhkTkFR0AInKUkyExAHdE0NRfTDXVH6d/0HL
         A/T2txgRFZoPN6JsWScdLZTU7bJcj2GbMlH5Ic8GVCFk04UBx82wmYH3gEyMebxtZXXO
         fp/tc+p2eEZDlkxd10WHpWlOvsEdt5kur4ih+uJSkpr0w632blIclow+1tn9yTWVAmtL
         Hlur6oZSeE/i0POiRg3h4PvJZHfz9JO3ciNO41efp3aisvrddvkZhsJHXL3eqVkLU3tc
         WSNw==
X-Gm-Message-State: AOAM533pr9YdskpzFEPSmKzk7iMWtYsZHEZ1C4v/qGYGLoRZp/fmj3eM
        Q+MwFWLhXEbvEVAs4UWzgwypZA==
X-Google-Smtp-Source: ABdhPJwyh5YfT0iKf7U16WPgkQZB6l1HXD7/F4XBZ7M7e/LoOYhdxvJgdgxKr+XWtz9DN2Y1ysYK4g==
X-Received: by 2002:a17:90b:388f:: with SMTP id mu15mr6915883pjb.28.1634054187510;
        Tue, 12 Oct 2021 08:56:27 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id jz10sm3246547pjb.39.2021.10.12.08.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 08:56:25 -0700 (PDT)
Date:   Tue, 12 Oct 2021 09:56:23 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@nxp.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Subject: Re: [PATCH v6 0/4] Add remoteproc driver for DSP on i.MX
Message-ID: <20211012155623.GA4010675@p14s>
References: <1633944015-789-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633944015-789-1-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Oct 11, 2021 at 05:20:11PM +0800, Shengjiu Wang wrote:
> Provide a basic driver to control DSP processor found on NXP i.MX8QM,
> i.MX8QXP, i.MX8MP and i.MX8ULP.
> 
> Currently it is able to resolve addresses between DSP and main CPU,
> start and stop the processor, suspend and resume.
> 
> The communication between DSP and main CPU is based on mailbox, there
> are three mailbox channels (tx, rx, rxdb).
> 
> This driver was tested on NXP i.MX8QM, i.MX8QXP, i.MX8MP and i.MX8ULP.
> 
> changes in v6:
> - fix the apply issue for linux-next
> - add if/then schema according to Rob's comments
> 
> changes in v5:
> - refine driver according to Mathieu's comments
> 
> changes in v4:
> - merge binding doc to fsl,dsp.yaml for Rob's comments
> 
> changes in v3:
> - Add this cover letter
> - refine clock-names according to Rob's comments
> - move common struct from imx_rproc.c to header file
> - add IMX_RPROC_SCU_API enum item
> - refine driver according to Mathieu's comments
> 
> changes in v2:
> - change syscon to fsl,dsp-ctrl
> - add items for clock-names
> 
> Shengjiu Wang (4):
>   remoteproc: imx_rproc: Move common structure to header file
>   remoteproc: imx_rproc: Add IMX_RPROC_SCU_API method
>   remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX
>   dt-bindings: dsp: fsl: update binding document for remote proc driver
> 
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      |  123 +-
>  drivers/remoteproc/Kconfig                    |   11 +
>  drivers/remoteproc/Makefile                   |    1 +
>  drivers/remoteproc/imx_dsp_rproc.c            | 1206 +++++++++++++++++
>  drivers/remoteproc/imx_rproc.c                |   28 +-
>  drivers/remoteproc/imx_rproc.h                |   39 +
>  6 files changed, 1375 insertions(+), 33 deletions(-)
>  create mode 100644 drivers/remoteproc/imx_dsp_rproc.c
>  create mode 100644 drivers/remoteproc/imx_rproc.h

I have applied this set.

Thanks,
Mathieu

> 
> -- 
> 2.17.1
> 
