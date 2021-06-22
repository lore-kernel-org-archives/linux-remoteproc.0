Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F8BC2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 03:43:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8908C61164
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 03:43:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhFVDpP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Jun 2021 23:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhFVDpP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Jun 2021 23:45:15 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF605C061574;
        Mon, 21 Jun 2021 20:42:58 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i1so6618480lfe.6;
        Mon, 21 Jun 2021 20:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gOJ2XOwgzJaAX7+MzbRKuet1BGzeJOpemDowi0aJYVk=;
        b=Y7wi6lmvHQpbJ7EK6nvbdgGT7ZZZ9ntJh/8i58YRNY+ghJTPVRBjVbnHyg7ZMvYVvz
         VV9geBnpzZibZb9HXbUnjL1d2dh0n7tq9cYohruTCEQj8mWXG7essiSRQ0pVVWJV2Yox
         4NcGXTglSFe0wovTxsZGWSUbPkPSmDh7oS/6oiPKexfY9naEFZuDFKCsVpOWvDTKKDaj
         F3tKOwkwD7ICxgz/L0AjG7HyEYaWEFGC9ZPDsRh2YRKPw0CQMudXanLTawYW44//Ftu0
         Cf8fh5BAZRXYupjdmauRylodpdbCgvt5EtUvL6WlJzEkbJjfvsdjU5/t0zPIOaS895h/
         gA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gOJ2XOwgzJaAX7+MzbRKuet1BGzeJOpemDowi0aJYVk=;
        b=bZjNqX45ars/kjmb/N4X/u4/qQ22bp777GgXBARGfyn3coa1jY9yTiv0dZnPF67Bhx
         FLguRvoO/vuhFJUdINQVqxNSCse1K3daLos2hss4Zyb7lAZ/mbOdeX3u5clcmakHw43h
         j1rFc+e4L0PTkLA9FF6xrwDibZYmkT3O78fM/aYK0DrIq23dCiWvJjxjUZ0rnkTOnbbC
         lUujq1VFI1vR9UuMSf5p58lQqZv9gZLUk92EjZmqJtn+Aj91oDQwL87DlKjGiJu/1FEx
         /97VZvQTj54lDGTMDda18CNxJZTqW/rzjEVIzrkQqEXYQ3cCVZEjXE8lHjvt2aSnzsUD
         I3xQ==
X-Gm-Message-State: AOAM5333GYCQakivEFilnJynvkop6NpY5p8hlCWiAnJA9fUYzuKnGAkn
        Ir2KlHwsEES9GhCoPUuuRJzhaaye8tawGFzQarE=
X-Google-Smtp-Source: ABdhPJzIbryMsmYkjd9L2BdMlA/D3pcFpJV/SJ93tJJyjfEfOHMWCvl9svIm2JLcUO6tXqw8kwsE+Txv4D9szW8bla8=
X-Received: by 2002:a05:6512:219:: with SMTP id a25mr1224607lfo.295.1624333377086;
 Mon, 21 Jun 2021 20:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210622041413.16992-1-peng.fan@oss.nxp.com> <20210622041413.16992-2-peng.fan@oss.nxp.com>
In-Reply-To: <20210622041413.16992-2-peng.fan@oss.nxp.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 22 Jun 2021 00:42:45 -0300
Message-ID: <CAOMZO5AkBd1M69G_bjjS_um=BUVTGxj7-o1eU6dAmV7JbukADg@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: remoteproc: imx_rproc: support i.MX8ULP
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-remoteproc@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Peng,

On Tue, Jun 22, 2021 at 12:40 AM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Add i.MX8ULP remote processor(Cortex-M33) compatible string
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 1dc34cf5a4ea..c28b767d246f 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -15,6 +15,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - fsl,imx8ulp-cm33
>        - fsl,imx8mq-cm4

Please keep the entries in alphabetical order.
