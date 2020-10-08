Return-Path: <SRS0=dp89=DP=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17AEC4363A
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Oct 2020 14:40:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 545D021924
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Oct 2020 14:40:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O9lHoaLr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730643AbgJHOke (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 8 Oct 2020 10:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730630AbgJHOkd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Oct 2020 10:40:33 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F52C061755
        for <linux-remoteproc@vger.kernel.org>; Thu,  8 Oct 2020 07:40:33 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id d197so6449898iof.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Oct 2020 07:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OrarTPaiL7rQzQ6WaV9Vzo7o6PowYGEC+IvlSkhfyxw=;
        b=O9lHoaLrMAK3vOFNIsTiAx6cZ90MKULCkFhsAnj2eqrPqmFz4WJty/1Xkx9zNqIb1i
         NWcc+FHknFMRr2cOBpQOIiMeJm+AOVRv7zmN63BhpmJFxqksfdN62IVLnX2xzhOVPj1A
         GZ1bEFwovvV+DgsINyrATjQ2aSUgx2N4KNh+7AX9Kp9/eSplQeB1pDMrkXJ/Qna/CIaE
         k5/lgSQoMpBk3OSltWIMa6k3een1c6EVUg/WfSYHbjEzEBZYiEXsZ8NU37FoDcDsmfae
         F1YQ+qoiN5XYv+SAyLhfT5TvJ80eCQuiVTxXNqwMXBtOCEZW5yOyxT27Qr8kt12GJUpT
         tMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OrarTPaiL7rQzQ6WaV9Vzo7o6PowYGEC+IvlSkhfyxw=;
        b=H79LICpNzrQ+fn5T+JJx9NtNGRYZYscvsc/HLwADkhk+mLRQ9tBDRXBI5sukk48n0A
         b0BShgRqMnomMP56Fn5AcVHL55p/KqMdYawktWpeQqT8/ddkPloF2bcp+M9uMyOJcGrI
         LJhL6bWxeVAWtjI157OBARn5CLllfS2V36pLgZuxoT9+m1XE0y6xtCmkLj0fHofxAORt
         fZQ5TBEXGasKRN32DiGcdCG7PJ6nc2Y30Cha5woZ0Lem0/x0Yz0mzFFBRiK855dNIyYi
         4ZhPpwg+892G6b4MDOiOmozziqDBttt6gihQrER9pNA0Loe9U/1H0PMg3lcEOq1sVAr1
         iP2g==
X-Gm-Message-State: AOAM533187egL1cvgRG7TsWi1u3UadBDlRW7qNI5ndZ8TwkiuPpCsxKn
        0OUG9IG+SUXANOEaARpO1g5vzwnLkXs+6wTImj0drg==
X-Google-Smtp-Source: ABdhPJxNOOckiO18DkXVMnX9YaryLbjZZ/gNbT8isUPNLeELzwXey5GFv8x/+B1pxgGdacdCVveNP4BEwkpzAaLulqY=
X-Received: by 2002:a5d:80cc:: with SMTP id h12mr965908ior.73.1602168033069;
 Thu, 08 Oct 2020 07:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200927064131.24101-1-peng.fan@nxp.com> <DB6PR0402MB2760EA531095AADAA1B967D9880B0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2760EA531095AADAA1B967D9880B0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 8 Oct 2020 08:40:22 -0600
Message-ID: <CANLsYkxXZdFdLYRY6kEj4Fa_LsR4TVfCxqtX=2_N7OEsgjgEXg@mail.gmail.com>
Subject: Re: [PATCH V2 0/7] remoteproc: imx_rproc: support iMX8MQ/M
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 7 Oct 2020 at 18:52, Peng Fan <peng.fan@nxp.com> wrote:
>
> Mathieu, Oleksij
>
> > Subject: [PATCH V2 0/7] remoteproc: imx_rproc: support iMX8MQ/M
>
> Do you have time to give a look at this patchset?

I will review your patchset after you have reviewed mine[1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=339079

>
> Thanks,
> Peng.
>
> >
> > V2:
> >  Rebased on linux-next
> >  Dropped early boot feature to make patchset simple.
> >  Drop rsc-da
> >
> > V1:
> >  https://patchwork.kernel.org/cover/11682461/
> >
> > This patchset is to support i.MX8MQ/M coproc.
> > The early boot feature was dropped to make the patchset small in V2.
> >
> > Since i.MX specific TCM memory requirement, add elf platform hook.
> > Several patches have got reviewed by Oleksij and Mathieu in v1.
> >
> > Peng Fan (7):
> >   remoteproc: elf: support platform specific memory hook
> >   remoteproc: imx_rproc: add elf memory hooks
> >   remoteproc: imx_rproc: correct err message
> >   remoteproc: imx_rproc: use devm_ioremap
> >   remoteproc: imx_rproc: add i.MX specific parse fw hook
> >   remoteproc: imx_rproc: support i.MX8MQ/M
> >   remoteproc: imx_proc: enable virtio/mailbox
> >
> >  drivers/remoteproc/imx_rproc.c             | 273
> > ++++++++++++++++++++-
> >  drivers/remoteproc/remoteproc_elf_loader.c |  20 +-
> >  include/linux/remoteproc.h                 |   2 +
> >  3 files changed, 287 insertions(+), 8 deletions(-)
> >
> > --
> > 2.28.0
>
