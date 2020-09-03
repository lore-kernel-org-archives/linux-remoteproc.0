Return-Path: <SRS0=MlSR=CM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0920DC433E2
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Sep 2020 00:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2D9E20773
	for <linux-remoteproc@archiver.kernel.org>; Thu,  3 Sep 2020 00:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZVPNUDXf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgICAIQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Sep 2020 20:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbgICAIO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Sep 2020 20:08:14 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55440C061245
        for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2020 17:08:14 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id y3so747528vsn.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2020 17:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vNGK0drLoWNgYFtnyo0bGiJC6OE4+o9KPc4VANTcGUU=;
        b=ZVPNUDXf6tQVcgw8kkHHQyjEAOsLqycSIz1ehYZm+uVXTd9CN/j5btk5vfe+0MxcpN
         z0MpYoLoq3SETJ9XNMrcemRwFcAyZQadJmVdpxOACzSkHQKavJzwtcVAxvf6+bGo337V
         G47Y0VYQUWmV0mr4nvMqdD/QNGIE9tI4Bw3wQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vNGK0drLoWNgYFtnyo0bGiJC6OE4+o9KPc4VANTcGUU=;
        b=KAqw2d2IbSec2SzKI6DFCDDDb3/KkbXLz+aVuqb3hAcj3HEsayolXr20ko8Py+N9yc
         SxdgvHdwr2J9IaNYcbnmG621sXmH/Pq15C9GqWOKtUUGaxqWuXB1W5uSXZFRGXjiuL3L
         4+7XtO5YKjN0ugK3dozCK8U1v5UFvdHsp8EaXjC98Tb1fsB1tpda2LA3cWBiFGzocu3z
         y9nlbUzOrA+fuqC0KJWCfF1JZcy7SdMHgXQhCqf5JR68Bj4QQ99hipZPMTezjQFt/LFe
         IBsqdnmrq7WCtN2/lx41S1irig7yDK9viwI1xmWOf6ZA4bA/CfFvVQIMUgg27dIJikp2
         cP5g==
X-Gm-Message-State: AOAM531C/bmDHrB3+V8clVZJGmrk5Yu4eOvYCm0W/bjj+mFtuRU9sLqK
        t2tHQ/Kb5d9RfpFFM9zPuuoerfNwRfyp9yqWlrdqRA==
X-Google-Smtp-Source: ABdhPJyyh8r00V5dnzC7J663uWgsb6bIr45zqffFvMVOa7JwQMs1QHsDUIoUGvYd0l5Gb33OEKfuJA9HIJBcdXdIKco=
X-Received: by 2002:a05:6102:3d7:: with SMTP id n23mr164533vsq.57.1599091690996;
 Wed, 02 Sep 2020 17:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200902190709.v2.1.I56cf27cd59f4013bd074dc622c8b8248b034a4cc@changeid>
 <20200902165505.GA280378@xps15>
In-Reply-To: <20200902165505.GA280378@xps15>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Thu, 3 Sep 2020 08:08:00 +0800
Message-ID: <CANMq1KDcYRKWxQ6+AQ=eTRcHdkiWyzH7BTahXdag5=FdnF7e1g@mail.gmail.com>
Subject: Re: [PATCH v2] rpmsg: Avoid double-free in mtk_rpmsg_register_device
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 3, 2020 at 12:55 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Sep 02, 2020 at 07:07:15PM +0800, Nicolas Boichat wrote:
> > If rpmsg_register_device fails, it will call
> > mtk_rpmsg_release_device which already frees mdev.
> >
> > Fixes: 7017996951fde84 ("rpmsg: add rpmsg support for mt8183 SCP.")
>
> The SHA should be 12 characters instead of 15.  With that:

Done in v3, thanks (and fixed my process for next time).

> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
> >
> > Changes in v2:
> >  - Drop useless if and ret variable (Markus Elfring)
> >
> >  drivers/rpmsg/mtk_rpmsg.c | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> >
> > diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
> > index 83f2b8804ee989d..96a17ec2914011d 100644
> > --- a/drivers/rpmsg/mtk_rpmsg.c
> > +++ b/drivers/rpmsg/mtk_rpmsg.c
> > @@ -200,7 +200,6 @@ static int mtk_rpmsg_register_device(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
> >       struct rpmsg_device *rpdev;
> >       struct mtk_rpmsg_device *mdev;
> >       struct platform_device *pdev = mtk_subdev->pdev;
> > -     int ret;
> >
> >       mdev = kzalloc(sizeof(*mdev), GFP_KERNEL);
> >       if (!mdev)
> > @@ -219,13 +218,7 @@ static int mtk_rpmsg_register_device(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
> >       rpdev->dev.parent = &pdev->dev;
> >       rpdev->dev.release = mtk_rpmsg_release_device;
> >
> > -     ret = rpmsg_register_device(rpdev);
> > -     if (ret) {
> > -             kfree(mdev);
> > -             return ret;
> > -     }
> > -
> > -     return 0;
> > +     return rpmsg_register_device(rpdev);
> >  }
> >
> >  static void mtk_register_device_work_function(struct work_struct *register_work)
> > --
> > 2.28.0.402.g5ffc5be6b7-goog
> >
