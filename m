Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D6AC4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Nov 2022 17:30:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbiKBRaf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Nov 2022 13:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbiKBRaL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Nov 2022 13:30:11 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CC41707E
        for <linux-remoteproc@vger.kernel.org>; Wed,  2 Nov 2022 10:30:06 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id bs21so25586982wrb.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Nov 2022 10:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g+rK1oS5b52BUstGwWG9rUx1UdvvX13i+yEKBaYvTNQ=;
        b=VD4MJW+qcwgnBm9szQ6+h6/LW+4yTBmfI3sFDOf2xthoO7MmLBx1eTeGY3MeeFuEb7
         oGNDRpU1BzApBH2MZ7e8VOXw2pp0wZ9ZsMQRbrYBFsQ2ikSt4M+RrDX9Hi6CuZNFkmKy
         tAWUw0M1kWfDgdW6vEA/N0WAdFI+Kh+s8LFASUK3kbZhooz33+bdWnMNuPkcCQL4Y++K
         pTQ1TnPNk4ModOIomsgcehbQmISc7NNLnEaBEfs8grDehp7C8gg9+Safmkl/71BkP4IR
         1mXl5xH+AfW6hfVHd1RyE13RPzYwn6/rJTE0W+Db0wRzHuqQSA3uaNExWFkBh34KGDNU
         KZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+rK1oS5b52BUstGwWG9rUx1UdvvX13i+yEKBaYvTNQ=;
        b=f4yeZQEPl2Tkd+eG+mf5sPDx4PMFy69GPWAY8C0d22H1geE4u0zk1dUGf8EuS6Wfb6
         wQASTMuuboQpwqY6TCcR3EWiBQSAAak47vOOPdsGvyuUCMB5ZoZO0qYa4dI1ub9HrrR0
         AFS2VCYt9em3gkSpTZ6Po6m46ETNvQlATR18M5zGlKtulu/v229f2Uk8E30HJSbFbL20
         JkpuNIemtVlDfqw0yDD4kkQVtQTS8IqXYo6ijYteb5rNBPXUJ2sniWnHdwFbcQe58l55
         k9xRNgJEzwy3LTVHy8GfmoJZgMth/kMCBVtVoW2e748BNjGPp7/va6gDwj/jN5zKKMGc
         jEjA==
X-Gm-Message-State: ACrzQf2gYfEu/+HgOlqicQB9cPBG66LIGedyu4RcGpOzPSaqzAB3l1gj
        27VsQTNM2BDxvObDKvJ4pZIYsd7Gx5HNTzyWQj6GTg==
X-Google-Smtp-Source: AMsMyM4+uiTjeEtL+Z6dWj5D18OHpZ4bBgrqXby9zaGCPTR2QKHUYJzfcJMmInKTZJQKz5CYR/UtzCeAgzxhi5IkKQA=
X-Received: by 2002:a5d:6743:0:b0:236:6301:918 with SMTP id
 l3-20020a5d6743000000b0023663010918mr16200534wrw.247.1667410205063; Wed, 02
 Nov 2022 10:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221102112451.128110-1-peng.fan@oss.nxp.com>
In-Reply-To: <20221102112451.128110-1-peng.fan@oss.nxp.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 2 Nov 2022 11:29:53 -0600
Message-ID: <CANLsYky1j_BMD-Dg1Lath4bftE-0qPEod7fxcaN3UkKUpjP7dw@mail.gmail.com>
Subject: Re: [PATCH V2 0/2] remoteproc: imx: add start up delay
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 2 Nov 2022 at 05:23, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> V2:
>  Rebased on linux-next
>
> V1:
>  https://lore.kernel.org/lkml/20220609123500.3492475-1-peng.fan@oss.nxp.com/
>
> There is case that after remoteproc start remote processor[M4], the M4
> runs slow and before M4 finish its own rpmsg framework initialization,
> linux sends out vring kick message, then M4 firmware drops the kick
> message. Some NXP released Cortex-M[x] images has such limitation that
> it requires linux sends out vring kick message after M4 firmware finish
> its rpmsg framework initialization.
>
> The best case is to use a method to let M4 notify Linux that M4 has
> finished initialization, but we could not patch released firmware,
> then update driver to detect notification.
>
> So add delay before linux send out vring kick message. It is not good to
> use a fixed time delay in driver, so I choose to get that from device
> tree.
>

From where I stand this is a hack to hide the lack of motivation to
enact the real solution that is outlined above.  I also wonder how
these problems were not caught during the testing phase.  Either find
a way to upgrade your firmware or keep this in your internal tree.

> Peng Fan (2):
>   dt-bindings: remoteproc: imx_rproc: add fsl,startup-delay-ms
>   remoteproc: imx_rproc: delay after kick remote processor
>
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml    | 4 ++++
>  drivers/remoteproc/imx_rproc.c                           | 9 +++++++++
>  2 files changed, 13 insertions(+)
>
> --
> 2.37.1
>
