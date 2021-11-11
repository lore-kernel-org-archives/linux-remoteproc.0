Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9479BC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Nov 2021 18:20:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 728C461390
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Nov 2021 18:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234132AbhKKSXY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Nov 2021 13:23:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233942AbhKKSXY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Nov 2021 13:23:24 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE73C061766
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Nov 2021 10:20:34 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id x15so27604409edv.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Nov 2021 10:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OaaeBy7wNy2KZuuz+/U1uJcihHu87eaQLFgJ6Qj43Nk=;
        b=TgF9McPm81VWaEO14gKhL35xliRtxTHkllFsIgGdPPTI+D+44/jC8xBQSV+4b1YULT
         Kxw2rQ/e7ewgw7wogKYiMngBhurOzeohOkz3WgxXfp3riIXuACsGHfaCUoh7xMJHVqMw
         PyihjQ3/GJfeYHi6fMSxpHpMVbFAUEGGTwKpOvm+MDL2OfQz+cnElRZyjpMyBhq0NrX9
         j0DMDg/JkZucgO8yY8F/uH0HhaNJ4zRYKhmrRiAGMYrqMSVWb+doRk+/4V9pdOtoH8bz
         O7ZldzaV0gwYyPy2Tor8dGSSx317OfT6t7UD5BnjmllxejvQxsDF458HxTVdZl2mmAOi
         8QdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OaaeBy7wNy2KZuuz+/U1uJcihHu87eaQLFgJ6Qj43Nk=;
        b=UUQB0Qr7/D4c61eObOwn9Njgr7SJHaBLA/HT0TS1BLYdhKnkHZ8BKxI3oMGaPJrHIP
         yVX669AGY0wKICrwC2mvzXUeYbURjYMBDcjFPwU61jmRyI1vBfWdSmVy9sDMa/Z2EcgE
         A05aRLQnw0MVbVTPLjMS1tmaVBboR3cg2da0nOlTZiLQAJVr2HLgEJC2JAHZvxgCz71f
         8f1+kBYtDtHuoG/0HACuEr0X5PBdGLFfXMBbihI8HdvB6cQwLUrvJQnAibPZo5Gn1PFU
         FycvL3kz8QmHLMtRT7KgDhwYjG64mJ810NTTDIAwk6oRELgUJcjpaFFij1uxqEbaEE6W
         VW+g==
X-Gm-Message-State: AOAM533EwVzJB4i80MRPSsZl4ZXL54A7prfXfKz/7KagjE+Vbgp0criH
        cAKifQSYJCQeD++59tfNmQznvW0nxha2ZLs5lgriiw==
X-Google-Smtp-Source: ABdhPJxqySLvBigiVcFrvQfU7wP2KHHvyyK6s+YUBDQL3NsNNLfiIYqjyMmFduBZMNTTt31eHG5doB3Q6BJPyBpjkqE=
X-Received: by 2002:a17:906:4f05:: with SMTP id t5mr12362768eju.68.1636654833112;
 Thu, 11 Nov 2021 10:20:33 -0800 (PST)
MIME-Version: 1.0
References: <d28ca94a4031bd7297d47c2164e18885a5a6ec19.1634366546.git.christophe.jaillet@wanadoo.fr>
 <DU0PR04MB94173DCAA87A0B24E1C7073388939@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94173DCAA87A0B24E1C7073388939@DU0PR04MB9417.eurprd04.prod.outlook.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 11 Nov 2021 11:20:21 -0700
Message-ID: <CANLsYkwGN7LbWwu5JmcoH-zWQe8MMZYirLbU+EAFcTbFr=C+xQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: Fix a resource leak in the remove function
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Hongxing Zhu <hongxing.zhu@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 10 Nov 2021 at 01:54, Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: [PATCH] remoteproc: imx_rproc: Fix a resource leak in the remove
> > function
> >
> > 'priv->workqueue' is destroyed in the error handling path of the probe but not
> > in the remove function.
> >
> > Add the missing call to release some resources.
> >
> > Fixes: 2df7062002d0 ("remoteproc: imx_proc: enable virtio/mailbox")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
> Reviewed-and-Tested-by: Peng Fan <peng.fan@nxp.com>
>

Thank you for that - I will pick up this patch when -rc1 or -rc2 gets released.

Thanks,
Mathieu

> > ---
> > This patch is speculative. I'm not sure if the added function call is at the right
> > place in the remove function.
> > Review with care.
> > ---
> >  drivers/remoteproc/imx_rproc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index ff8170dbbc3c..0a45bc0d3f73
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -804,6 +804,7 @@ static int imx_rproc_remove(struct platform_device
> > *pdev)
> >       clk_disable_unprepare(priv->clk);
> >       rproc_del(rproc);
> >       imx_rproc_free_mbox(rproc);
> > +     destroy_workqueue(priv->workqueue);
> >       rproc_free(rproc);
> >
> >       return 0;
> > --
> > 2.30.2
>
