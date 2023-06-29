Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EE1EB64DC
	for <linux-remoteproc@archiver.kernel.org>; Thu, 29 Jun 2023 16:34:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbjF2QeM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 29 Jun 2023 12:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232194AbjF2QeF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 29 Jun 2023 12:34:05 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 857A230E4
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jun 2023 09:34:03 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3112f5ab0b1so890325f8f.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jun 2023 09:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688056442; x=1690648442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LqHUnlso1hdG3VJ+pTodHLUrLXzUMRTfH8n86mBkWGM=;
        b=saB8+ZA/oTbFO22dlhNSOJr/pdy2C0eJ7wQf/+uf2obs9efHuHzrvZpqTi3DGfHlXl
         VQ//6jSxIUjflGsQ0rUwQwp9cLVWKhU7QC4C7eRaMPUiCY9zWAgAoAdLTLF2vEG5kFIt
         TAbyonrAC/vbfB2cICF3ivWy89e/CnJzt2Xy2VOwbPYDVqk7lzLOWcJbUtwdtZdtqAvU
         Y2grNnXuaH1qlKeRMIq3SfTl4whEaENe0k71GLGfVgxoEDk0W59mBfN6ckeY281FZgRz
         t3bdJ0o0T+ZcVKTZoGLlzGTrwhTK1mKX6jOMNuIEpmkQDCOSprERyKEnmAcTzpi8lt4E
         Mwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688056442; x=1690648442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqHUnlso1hdG3VJ+pTodHLUrLXzUMRTfH8n86mBkWGM=;
        b=ISiC6ba8RBl38li2069MVpPRilZvasG8rxpiwdO2P0nKaFr7/lPk6nXrU6pERkHYtg
         niqAdHav2eKB/tBUbndI8v9mTRFmCAApYeBiCmYtIqe6acXm7adW2TWrX5uKm9uhCvfv
         3C4qT/8QyhPZuB5Qs7qJ5i6M3wywvhlVOVT1/O1rG3R3UGAxGtYPHqME46TbfQ5o5ZW8
         wNUq1NQ+8wio5kEquqxcJbv3mSgFisg/29Cgmgs6WuoXyKpQEek1y6nIZ1NTOBJnuoSK
         DqKeJdqccEc+n6pn0yQTcHCcMgncg86yFiiSvkvHA+ORAbTIfFfFWelKbSFjBh4yyNEc
         6zQg==
X-Gm-Message-State: ABy/qLbMSzJiE4sCoN/fw59c9ioGLUD1viFa3bjwtQ1dw25vbJnQjSRW
        Sur+hmdzM9VFBtqLq+Y/nSRatCCQc625798Gc+rCQw==
X-Google-Smtp-Source: APBJJlH/H/FYY6FeQt1Oek53lXyD6oByP8yaDCmrg1kMkO65pcFhmlQTa2fqTCAXe9fMg23H4mNeE7N6tPZ6UxLbdbk=
X-Received: by 2002:adf:ef0c:0:b0:314:1de3:f9e0 with SMTP id
 e12-20020adfef0c000000b003141de3f9e0mr122057wro.12.1688056441962; Thu, 29 Jun
 2023 09:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230629093327.3376308-1-peng.fan@oss.nxp.com>
In-Reply-To: <20230629093327.3376308-1-peng.fan@oss.nxp.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 29 Jun 2023 10:33:51 -0600
Message-ID: <CANLsYkzek+hb6_eRb-wN3qQfV+WCDqVHd3q_H03VR+k7NRkF1Q@mail.gmail.com>
Subject: Re: [PATCH V3] remoteproc: imx_rproc: iterate all notifiyids in rx callback
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        daniel.baluta@nxp.com, iuliana.prodan@nxp.com,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 29 Jun 2023 at 03:28, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> The current code only supports one vdev and a single callback,
> but there are cases need more vdevs. So iterate all notifyids to
> support more vdevs with the single callback.
>

Much better - I'll pick this up when rc2 comes out.

Thanks,
Mathieu

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>
> V3:
>  Drop debug message in callback
>
> V2:
>  Update commit log
>
>  drivers/remoteproc/imx_rproc.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f9874fc5a80f..986d3db81596 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -725,13 +725,22 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>         return 0;
>  }
>
> +static int imx_rproc_notified_idr_cb(int id, void *ptr, void *data)
> +{
> +       struct rproc *rproc = data;
> +
> +       rproc_vq_interrupt(rproc, id);
> +
> +       return 0;
> +}
> +
>  static void imx_rproc_vq_work(struct work_struct *work)
>  {
>         struct imx_rproc *priv = container_of(work, struct imx_rproc,
>                                               rproc_work);
> +       struct rproc *rproc = priv->rproc;
>
> -       rproc_vq_interrupt(priv->rproc, 0);
> -       rproc_vq_interrupt(priv->rproc, 1);
> +       idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
>  }
>
>  static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
> --
> 2.37.1
>
