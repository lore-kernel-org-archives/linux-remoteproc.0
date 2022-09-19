Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FCCECAAD3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Sep 2022 20:50:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiISUup (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Sep 2022 16:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiISUuo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Sep 2022 16:50:44 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33224B492
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Sep 2022 13:50:42 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id r18so1428142eja.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Sep 2022 13:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Wra6TfVQpUcA1pTMwMXTsetIQg9lFEyERfQZe8FkrK0=;
        b=r/DkTdq1bOBe356n+JKLU6qwnz1CE8Y1qJGo13qtdMdpGJtPXnxSoaHPEfvgAQszhr
         Yf0sAjKu1YmGAIteN3kyaRWZg+wTfSV/gYouwKlrr9hVPo9wMuU9AvksiWLmlvPkbaWd
         q0IHpBXIZ4cMRVFAvK0sdGmXAv3ml0lQzhgjV8HVwUhXiq5Yj3z+w8iSgZEasuBd2Abl
         agI/LlWqW7R63KtzrBQz6jPrXsb372Cgh2OLgNoheK8IFt3tYY+MMc+WwQN9wnuDWjU8
         UmtzxmBcL1jx2sPvPqkTO7NhQxv9oX4hCbSEVen3F7nVFKTlP7dA3mgF6eYecrK9Wrme
         1x5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Wra6TfVQpUcA1pTMwMXTsetIQg9lFEyERfQZe8FkrK0=;
        b=mzd1Zx9E9VUX1LiIYzaRhHpjx3tZmNl3G6Z2F/dxwK40YcJWfdQtVkyPKmUd/smQvK
         KNseIqZ+GhBeMIB6W4v/2pK4LtEQBrQb4T/4HQd2ZmGEtSeis1b6aSlgofdtHBddwu4a
         Lj1zp/lOtspMHOxreZ1eCwobpx0yU63aQMOg5ourBDr83rAZgvSHf74oqaIHXer1fT6l
         QYUm3sLb5U0QiCPHOXR5FmZHiReWe0An54PAUP7yJBzgkXhLB24TKgSY5eFhcx7503SA
         HHjKEZ7bL3EgsrRR8Nu8SJLj7qwXp92ponipA2OgSP0xHw2n2OGTITnUE/S6gW1WZdGE
         BKDg==
X-Gm-Message-State: ACrzQf0+feXgf9SNxN6DCQt1fZ3gJfJlanVYvkwD1OmF2jM0peLVtRpC
        RWLF5QpdfOdURjAvJh2kNNSX3kVV1L5ldeOxoMjddRPa2ac=
X-Google-Smtp-Source: AMsMyM75ZnCoIzl1gPPUjiOaiEJ4qygmv/PILjLhJUHNliLl2ZbXfidHrwme3vNs7tqBCWYwd0kA/pFAkdB2h/dOPQA=
X-Received: by 2002:a17:907:2672:b0:780:8bb5:25a3 with SMTP id
 ci18-20020a170907267200b007808bb525a3mr13785851ejc.281.1663620641520; Mon, 19
 Sep 2022 13:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <1663310366-720-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1663310366-720-1-git-send-email-shengjiu.wang@nxp.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 19 Sep 2022 14:50:30 -0600
Message-ID: <CANLsYkzj8fO0aqKM4iQVTP-=MP7+Ht0_2q41+DezDBW2=MHYfw@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: char: Avoid double destroy of default endpoint
To:     Shengjiu Wang <shengjiu.wang@nxp.com>, arnaud.pouliquen@foss.st.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 16 Sept 2022 at 00:57, Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> The rpmsg_dev_remove() in rpmsg_core is the place for releasing
> this default endpoint.
>
> So need to avoid destroying the default endpoint in
> rpmsg_chrdev_eptdev_destroy(), this should be the same as
> rpmsg_eptdev_release(). Otherwise there will be double destroy
> issue that ept->refcount report warning:
>
> refcount_t: underflow; use-after-free.
>
> Call trace:
>  refcount_warn_saturate+0xf8/0x150
>  virtio_rpmsg_destroy_ept+0xd4/0xec
>  rpmsg_dev_remove+0x60/0x70
>
> Fixes: bea9b79c2d10 ("rpmsg: char: Add possibility to use default endpoint of the rpmsg device")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 0850ae34fb88..562d545ac0d3 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -76,7 +76,8 @@ int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>
>         mutex_lock(&eptdev->ept_lock);
>         if (eptdev->ept) {
> -               rpmsg_destroy_ept(eptdev->ept);
> +               if (!eptdev->default_ept)
> +                       rpmsg_destroy_ept(eptdev->ept);
>                 eptdev->ept = NULL;

Arnaud - please look into this one.

Thanks,
Mathieu

>         }
>         mutex_unlock(&eptdev->ept_lock);
> --
> 2.34.1
>
