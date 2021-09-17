Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF28EC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Sep 2021 05:20:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A11046103B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Sep 2021 05:20:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235941AbhIQFVh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 17 Sep 2021 01:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhIQFVg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Sep 2021 01:21:36 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092EDC061574;
        Thu, 16 Sep 2021 22:20:15 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id 72so2113669qkk.7;
        Thu, 16 Sep 2021 22:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6gFJYxi0zxGSRpI2PuuFPOQR7c4um15SmymyYqP7uG0=;
        b=oXU5KwH1xhSFJXKKqJ7wjuuExqCIDJJCWTT7BUFlJN126HSQ7dwqV6QFCVnhUcuZl1
         ARpXtUrqx0Y5RfFG0+gFDaTwgWzGLeMgIHTX09rwKKOeX76b3SDzA6TTzf7ziEO0lVES
         QXLw4EkyrzrpnIh4IFdiceOK1QBvrJuAjSzY7dsLuUZjtxFQyTWep4qvS55qLPt4GQtd
         MzAgdKaeizDYU8qB0xslETw8eke0kyGgjeenpUYe7w86HKk8bsMR3zsRYicW8kn0kpZj
         1DpzqdjfIcoIpgfzy55CGzu0w7dyAL2NpZMPBBCjUC4ar6px+0mxp74lLszeK0/tQj3H
         t27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6gFJYxi0zxGSRpI2PuuFPOQR7c4um15SmymyYqP7uG0=;
        b=ezloV6iDoTemoer3EKKZWAQ2eC+BRJXqPj3nHcnFYydqrN5je2+iVkwa4NCmLVBxPQ
         qTKLtmipSvMweEhTh0Jwx1PN7Vq7yLK7f5Lcn3d0lCxcBK5cOFgFFyPVXlt1fhS1XRXI
         s/WwxNg5hvyjcj79lNV1oG0rjjUAOkFydLhJewwTHoJwIGOXN+DgCP+o/9Ta+Zuaf/2E
         pqUjKzlhvJ0XenUJUMpdZ/cpQ2nWDlC+C7ACcVc4EhWUDWZoYyp4+rYLFo2eXp5PVThw
         myYBZHHM8Jf+8X9EtJRGO8MOZBhBXhiPkhrKVT2CinI5zE60KrEOylPVa9LMUJim6IwD
         EykA==
X-Gm-Message-State: AOAM533QlrAC+m2vzVGs5/L90VVwc20b2Yyen6oFxhM6r2Cvh/vZaGQY
        gneKrunBK3Jra8OBdn5YGmZn5sCo4XGe7MGaSLY=
X-Google-Smtp-Source: ABdhPJyRCwibaE95hnBBiXNW3ZuUaJcH5Mfj8Fe4Xmbtt/4mmfgiv37Oghof+paUBSL4RIfOSqkKChj5Y/2NET+S/bg=
X-Received: by 2002:a05:620a:4106:: with SMTP id j6mr8779525qko.392.1631856014127;
 Thu, 16 Sep 2021 22:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <1631092255-25150-1-git-send-email-shengjiu.wang@nxp.com>
 <1631092255-25150-4-git-send-email-shengjiu.wang@nxp.com> <20210915161624.GA1770838@p14s>
 <CAA+D8AO0c+jk_k7j=ZvNFsVvC-p_zMLPJDS3qmLjNbJ+U0E9Cg@mail.gmail.com> <20210916165957.GA1825273@p14s>
In-Reply-To: <20210916165957.GA1825273@p14s>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Fri, 17 Sep 2021 13:20:03 +0800
Message-ID: <CAA+D8AN_ni_XmEFNfY0Z0qLAJX00XFSUP1RkJdNQd-MVY6pd4g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] remoteproc: imx_dsp_rproc: Add remoteproc driver
 for DSP on i.MX
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>,
        Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Sep 17, 2021 at 1:00 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> [...]
>
> > > > +
> > > > +/**
> > > > + * imx_dsp_rproc_elf_load_segments() - load firmware segments to memory
> > > > + * @rproc: remote processor which will be booted using these fw segments
> > > > + * @fw: the ELF firmware image
> > > > + *
> > > > + * This function specially checks if memsz is zero or not, otherwise it
> > > > + * is mostly same as rproc_elf_load_segments().
> > > > + */
> > > > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc,
> > > > +                                        const struct firmware *fw)
> > > > +{
> > > > +     struct device *dev = &rproc->dev;
> > > > +     u8 class = fw_elf_get_class(fw);
> > > > +     u32 elf_phdr_get_size = elf_size_of_phdr(class);
> > > > +     const u8 *elf_data = fw->data;
> > > > +     const void *ehdr, *phdr;
> > > > +     int i, ret = 0;
> > > > +     u16 phnum;
> > > > +
> > > > +     ehdr = elf_data;
> > > > +     phnum = elf_hdr_get_e_phnum(class, ehdr);
> > > > +     phdr = elf_data + elf_hdr_get_e_phoff(class, ehdr);
> > > > +
> > > > +     /* go through the available ELF segments */
> > > > +     for (i = 0; i < phnum; i++, phdr += elf_phdr_get_size) {
> > > > +             u64 da = elf_phdr_get_p_paddr(class, phdr);
> > > > +             u64 memsz = elf_phdr_get_p_memsz(class, phdr);
> > > > +             u64 filesz = elf_phdr_get_p_filesz(class, phdr);
> > > > +             u64 offset = elf_phdr_get_p_offset(class, phdr);
> > > > +             u32 type = elf_phdr_get_p_type(class, phdr);
> > > > +             void *ptr;
> > > > +             bool is_iomem;
> > > > +
> > > > +             if (type != PT_LOAD || !memsz)
> > >
> > > You did a really good job with adding comments but this part is undocumented...
> > > If I read this correctly you need to check for !memsz because some part of
> > > the program segment may have a header but its memsz is zero, in which case it can
> > > be safely skipped.  So why is that segment in the image to start with, and why
> > > is it marked PT_LOAD if it is not needed?  This is very puzzling...
> >
> > Actually I have added comments in the header of this function.
>
> Indeed there is a mention of memsz in the function's header but it doesn't
> mention _why_ this is needed, and that is what I'm looking for.
>
> >
> > memsz= 0 with PT_LOAD issue, I have asked the toolchain's vendor,
> > they said that this case is allowed by elf spec...
> >
> > And in the "pru_rproc.c" and "mtk_scp.c", seems they met same problem
> > they also check the filesz in their internal xxx_elf_load_segments() function.
>
> In both cases they are skipping PT_LOAD sections where "filesz" is '0', which
> makes sense because we don't know how many bytes to copy.  But here you are
> skipping over a PT_LOAD section with a potentially valid filesz, and that is the
> part I don't understand.

Ok, I can use filesz instead. For my case, filesz = memsz = 0,
it is the same result I want.

The reason why I use "memsz '' is because there is  "if (filesz > memsz) "
check after this,  if memsz is zero, then "filesz" should be zero too, other
values are not allowed.

>
> >
> > >
> > >
> > > > +                     continue;
> > > > +
> > > > +             dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
> > > > +                     type, da, memsz, filesz);
> > > > +
> > > > +             if (filesz > memsz) {
> > > > +                     dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
> > > > +                             filesz, memsz);
> > > > +                     ret = -EINVAL;
> > > > +                     break;
> > > > +             }
> > > > +
> > > > +             if (offset + filesz > fw->size) {
> > > > +                     dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
> > > > +                             offset + filesz, fw->size);
> > > > +                     ret = -EINVAL;
> > > > +                     break;
> > > > +             }
> > > > +
> > > > +             if (!rproc_u64_fit_in_size_t(memsz)) {
> > > > +                     dev_err(dev, "size (%llx) does not fit in size_t type\n",
> > > > +                             memsz);
> > > > +                     ret = -EOVERFLOW;
> > > > +                     break;
> > > > +             }
> > > > +
> > > > +             /* grab the kernel address for this device address */
> > > > +             ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
> > >
> > >                 rproc_da_to_va(rproc, da, memsz, NULL);
> >
> > yes, will update it.
> >
> > >
> > > More comments to follow later today or tomorrow.
> >
> > Thanks.
> >
> > Best regards
> > Wang Shengjiu
