Return-Path: <SRS0=EX6n=C4=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC0CC43464
	for <linux-remoteproc@archiver.kernel.org>; Sat, 19 Sep 2020 01:53:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5CCE21707
	for <linux-remoteproc@archiver.kernel.org>; Sat, 19 Sep 2020 01:53:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElXRHU20"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgISBxV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Sep 2020 21:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgISBxV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Sep 2020 21:53:21 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0F0C0613CE;
        Fri, 18 Sep 2020 18:53:21 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id g4so7299361wrs.5;
        Fri, 18 Sep 2020 18:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BxV6YGRn23jRpo6op9QJZovwE6L/PxsHN1kxycYIod4=;
        b=ElXRHU20aWE1PWPA/D+5qpVStqagYgvtf1FxaVCo6JH1Wj/H3+MZLB/f9fWAXXTDt/
         2evWkfNea/Dp91Nx84SV6fWcinqRzj46XSQoB7gsJoClyixCjrZh6MM/9M+hKrWiXj92
         BJ5zccx8L8KkjpzHUBJEpMABmiYweQS3qVKnq7pxETOhj5mY0285xV94E+wADGScOtfc
         iYxofYQFOkXj8rFaYe1TT1FTbM60KzN6+Ei0nKHaWT5i+uLsHwPX8+Rc25tvr70iEnQr
         leJmv/IiosoD8NZi/006e4Gsz0Ojqaov4FxIXGLYhzbNRV/R9sQLxvG0PBkuF/hS+oBO
         VSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BxV6YGRn23jRpo6op9QJZovwE6L/PxsHN1kxycYIod4=;
        b=UZ+FUTZIKcDCXf3lnyWqor5k2RUlWkQCAbkxIRR/nIVn/iOT5bp1bNqO7Qeqx/KhJ1
         rz8GYQ+e1EHBbnBye7V9+r0+ZRSlhbPOOCZ8szDV3aCExS9VlwtjTL6SesZrE6Ob4eQl
         08Xq3umHY/Ki418X6bgyBcufHE1ZLQmqI+GJ+Kzm4G8SaytMpP9zncc1Uek9hhFRp+Wp
         lUhE5cLtTck1/Hf8f0YXqKdgzuq2ciGRBeXtg11qPjAHfTfefvRZxT4pmcRVVIRp0lii
         BYdHQTHf2IM/v1ZkcuTyZsTG07/FtcSpEgOoNP8JknnP67MSY1fmyuzbFf1i7JZXnSle
         D6/A==
X-Gm-Message-State: AOAM532dQuh+70vmtkkMulKhGanRHm8abKd1ZywWeX55OLlx00L5rgcN
        q+Jmyi0sf8nPyKA1ItUIHZljsVVS5kDjag9yzIo=
X-Google-Smtp-Source: ABdhPJyCFcqoSk2NBgKEAJSgMUY7AkkpPKgmjJGmNPK7HZGvl7zbyjnfZgchpSMfxiQU3eBKEimZ7Ko2gR5TQPxaFZ4=
X-Received: by 2002:a5d:4a0e:: with SMTP id m14mr42994703wrq.313.1600480399563;
 Fri, 18 Sep 2020 18:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200917194341.16272-1-ben.levinsky@xilinx.com>
 <20200917194341.16272-6-ben.levinsky@xilinx.com> <20200917221120.GA15530@xaphan>
 <BYAPR02MB44073E7A3BEA401FF4684E95B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <BYAPR02MB4407A552ECBA907DFC3CEC91B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <20200918160721.GD15530@xaphan> <BYAPR02MB44073FBEF86F4AA2379D8A11B53F0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <20200918190643.GA172254@xaphan>
In-Reply-To: <20200918190643.GA172254@xaphan>
From:   Wendy Liang <sunnyliangjy@gmail.com>
Date:   Fri, 18 Sep 2020 18:53:08 -0700
Message-ID: <CAA07jV9WfTTLRwh3kmy1985p4C1m37wQJQAHzLdK2cn4f8HENw@mail.gmail.com>
Subject: Re: RE: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5
 remoteproc driver
To:     Michael Auchter <michael.auchter@ni.com>
Cc:     Ben Levinsky <BLEVINSK@xilinx.com>,
        "punit1.agrawal@toshiba.co.jp" <punit1.agrawal@toshiba.co.jp>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

HI Michael, Ben, Punit,

On Fri, Sep 18, 2020 at 12:08 PM Michael Auchter <michael.auchter@ni.com> wrote:
>
> Hey Ben,
>
> On Fri, Sep 18, 2020 at 06:01:19PM +0000, Ben Levinsky wrote:
> > Hi Michael, Punit,
> >
> > > -----Original Message-----
> > > From: Michael Auchter <michael.auchter@ni.com>
> > > Sent: Friday, September 18, 2020 9:07 AM
> > > To: Ben Levinsky <BLEVINSK@xilinx.com>
> > > Cc: devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
> > > kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > > Subject: Re: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5
> > > remoteproc driver
> > >
> > > On Thu, Sep 17, 2020 at 10:50:42PM +0000, Ben Levinsky wrote:
> > > > In addition to device tree, is there particular linker script you use
> > > > for your R5 application? For example with OCM? As presently this
> > > > driver only has DDR and TCM as supported regions to load into
> > >
> > > The firmware is being loaded to TCM.
> > >
> > > I'm able to use this driver to load and run my firmware on both R5
> > > cores, but only after I change the incorrect:
> > >
> > >     rpu_mode = lockstep_mode
> > >
> > > assignment to:
> > >
> > >     rpu_mode = lockstep_mode ? PM_RPU_MODE_LOCKSTEP
> > >                              : PM_RPU_MODE_SPLIT;
> > There was a point raised by Punit that as "it is possible to set R5 to
> > operatore in split or lock-step mode dynamically" which is true and
> > can be done via sysfs and the Xilinx firmware kernel code.
>
> I'm not familiar with this, and don't see an obvious way to do this
> (from looking at drivers/firmware/xilinx/). Can you point me to this
> code?
>
> > A suggestion that might clean up the driver so that the whole
> > rpu_mode, tcm_mode configuration can be simplified and pulled out of
> > the driver:
> > - as Punit suggested, remove the lockstep-mode property
> > - the zynqmp_remoteproc_r5 driver ONLY loads firmware and does start/stop.
> > - the zynqmp_remoteproc_r5 driver does not configure and memory regions or the RPU. Let the Xilinx firmware sysfs interface handle this.
>
> I don't think this is a good approach.
[Wendy] The TCMs are presented differently in the system depending on
if RPU is in
lockstep or split mode.

Not sure if it is allowed to list TCMs registers properties for both
split mode and lockstep
mode in the same device node.

Even though, driver can have this information in the code, but I feel
the device tree is a
better place for this information.
And also for predefined shared memories, you will need to know the RPU
op mode ahead,
so that you can specify which shared memories belong to which RPU.

To dynamic setup the RPU mode, besides sysfs, setup, if remoteproc can support
device tree overlay, the RPUs can be described with dtbo and loaded at runtime.

Just want to understand the case which needs to set  RPU mode at runtime?
I think testing can be one case.

Best Regards,
Wendy

> - How will someone know to configure the RPU mode and TCM mode via sysfs?
> - What happens when someone changes the RPU mode after remoteproc has
>   already booted some firmware on it?
> - What if the kernel is the one booting the R5, not the user?
>
> Split vs. lockstep, IMO, needs to be specified as part of the device
> tree, and this driver needs to handle configuring the RPU mode and TCM
> modes appropriately.
>
> Split vs. lockstep already necessitates different entries in the device
> tree:
> - In the binding, each core references its TCMs via the
>   meta-memory-regions phandles, and the referenced nodes necessarily
>   encode this size. In split mode, each core has access to 64K of
>   TCMA/TCMB, while in lockstep R5 0 has access to 128K of TCMA/TCMB. So,
>   the "xlnx,tcm" nodes' reg entries need to differ between lockstep and
>   split.
> - In lockstep mode, it does not make sense to have both r5@0 and r5@1
>   child nodes: only r5@0 makes sense. Though, I just realized that I
>   think this driver will currently permit that, and register two
>   remoteprocs even in lockstep mode... What happens if someone tries to
>   load firmware on to r5_1 when they're in lockstep mode? This should
>   probably be prevented.
>
> Thanks,
>  Michael
