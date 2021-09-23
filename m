Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0CCC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 23 Sep 2021 01:48:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9CDE6115A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 23 Sep 2021 01:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238838AbhIWBtn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 22 Sep 2021 21:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238177AbhIWBtm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Sep 2021 21:49:42 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE017C061574;
        Wed, 22 Sep 2021 18:48:11 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id f2so3295850qvx.2;
        Wed, 22 Sep 2021 18:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vHchXl8mrU0hcMLr2GF0n33FKRG61T38fqwkdg1AY/Q=;
        b=iObpCcVfEXOR1qFpSmNg/dL3bBP7IDkI30qoSfwYqrmjrAOA/S7zkogrnLZMUN2kgG
         KEspLpaVXS8WFLxOjMwPwM3VF+S1fKUMgO7FsnihdnY8yr4VkevWYFFjdR04eICgk7jB
         PZLTv42hrFGGc2irzQ/LRbtwtbdCyoGAMufnl6nUdmlbe/MAvl5OzKUwCQTt1kWMOA6F
         /5g1HWDpM7IaNC196Sg6TvEys43fDTdEbMTWjVSosB/anzCMhZYsL7bD2uDdpkFOQwin
         xZQqTPI4u82z8pfdGDgeyjd8FJ25JNijINchot8wru0ULxm5RlbSDY8zMp6EsshlEMEI
         3PDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vHchXl8mrU0hcMLr2GF0n33FKRG61T38fqwkdg1AY/Q=;
        b=aRVsqvgBYqrtp9G4OOcMWTJFYjbP1FM+EwgqNpBpXO0bPZWPrgi6oDpnueTX0eRBjx
         itdkYjub1nIV8yrLiippeSqzjZcNr4Z7QewWqFZim3O78v53gJcgigPvuAY0RuqJHoUU
         Gn3v47EmWoftaIZaE7/oGGbJguz49XofwVhVd9gH4vscm1JK2f2z/RYLfsMajeaGZKCm
         WitA6WbGDuJ1Eg1WW0qjGney27PPykzCX+nVW42CWqhrty+xSMhlfq41aL3bcEbAI29g
         WB/CXlV9VQzjOvYK0s5sVsyXF087Dwb4OanP65yp98JFAE7+1mH55X4+OFzCgmlTiWSF
         7nsA==
X-Gm-Message-State: AOAM530qMlM8MSmpSNvh3nmYrQI27tx6rvycdx3tXEAt0gTqQt/AuWdb
        teyL01f1Wqm89OZSADOmBhzQS19LrYGLOhTSO8g=
X-Google-Smtp-Source: ABdhPJxXcDiICkp9V2vpdhBV3Rs+efwY7tasjR5Y6NoCT15J86mqXDDAPpkCgJ8PW42HNo54E8b27JVnfg4ntU5zyuc=
X-Received: by 2002:a05:6214:584:: with SMTP id bx4mr2261885qvb.40.1632361691038;
 Wed, 22 Sep 2021 18:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <1631092255-25150-1-git-send-email-shengjiu.wang@nxp.com>
 <1631092255-25150-4-git-send-email-shengjiu.wang@nxp.com> <20210915161624.GA1770838@p14s>
 <CAA+D8AO0c+jk_k7j=ZvNFsVvC-p_zMLPJDS3qmLjNbJ+U0E9Cg@mail.gmail.com>
 <20210916165957.GA1825273@p14s> <CAA+D8AN_ni_XmEFNfY0Z0qLAJX00XFSUP1RkJdNQd-MVY6pd4g@mail.gmail.com>
 <CAA+D8AMaszzT5q8oGhXOtE3W5Ue9S3r=es2sTp2uJ7RwjX8Bzg@mail.gmail.com>
 <20210917152236.GA1878943@p14s> <CAA+D8ANwXZdXheMkV8VHJ90JT8o+9YXFuE-EjTejijGUa4YALw@mail.gmail.com>
 <20210922175521.GA2157824@p14s>
In-Reply-To: <20210922175521.GA2157824@p14s>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Thu, 23 Sep 2021 09:48:00 +0800
Message-ID: <CAA+D8AOXF_0qeg0H8zeSkz5bj8VQT95B1yMo98jSxxHUooYViw@mail.gmail.com>
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

On Thu, Sep 23, 2021 at 1:55 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Sep 22, 2021 at 09:35:54AM +0800, Shengjiu Wang wrote:
> > Hi Mathieu
> >
> > On Fri, Sep 17, 2021 at 11:22 PM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Fri, Sep 17, 2021 at 05:44:44PM +0800, Shengjiu Wang wrote:
> > > > On Fri, Sep 17, 2021 at 1:20 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> > > > >
> > > > > On Fri, Sep 17, 2021 at 1:00 AM Mathieu Poirier
> > > > > <mathieu.poirier@linaro.org> wrote:
> > > > > >
> > > > > > [...]
> > > > > >
> > > > > > > > > +
> > > > > > > > > +/**
> > > > > > > > > + * imx_dsp_rproc_elf_load_segments() - load firmware segments to memory
> > > > > > > > > + * @rproc: remote processor which will be booted using these fw segments
> > > > > > > > > + * @fw: the ELF firmware image
> > > > > > > > > + *
> > > > > > > > > + * This function specially checks if memsz is zero or not, otherwise it
> > > > > > > > > + * is mostly same as rproc_elf_load_segments().
> > > > > > > > > + */
> > > > > > > > > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc,
> > > > > > > > > +                                        const struct firmware *fw)
> > > > > > > > > +{
> > > > > > > > > +     struct device *dev = &rproc->dev;
> > > > > > > > > +     u8 class = fw_elf_get_class(fw);
> > > > > > > > > +     u32 elf_phdr_get_size = elf_size_of_phdr(class);
> > > > > > > > > +     const u8 *elf_data = fw->data;
> > > > > > > > > +     const void *ehdr, *phdr;
> > > > > > > > > +     int i, ret = 0;
> > > > > > > > > +     u16 phnum;
> > > > > > > > > +
> > > > > > > > > +     ehdr = elf_data;
> > > > > > > > > +     phnum = elf_hdr_get_e_phnum(class, ehdr);
> > > > > > > > > +     phdr = elf_data + elf_hdr_get_e_phoff(class, ehdr);
> > > > > > > > > +
> > > > > > > > > +     /* go through the available ELF segments */
> > > > > > > > > +     for (i = 0; i < phnum; i++, phdr += elf_phdr_get_size) {
> > > > > > > > > +             u64 da = elf_phdr_get_p_paddr(class, phdr);
> > > > > > > > > +             u64 memsz = elf_phdr_get_p_memsz(class, phdr);
> > > > > > > > > +             u64 filesz = elf_phdr_get_p_filesz(class, phdr);
> > > > > > > > > +             u64 offset = elf_phdr_get_p_offset(class, phdr);
> > > > > > > > > +             u32 type = elf_phdr_get_p_type(class, phdr);
> > > > > > > > > +             void *ptr;
> > > > > > > > > +             bool is_iomem;
> > > > > > > > > +
> > > > > > > > > +             if (type != PT_LOAD || !memsz)
> > > > > > > >
> > > > > > > > You did a really good job with adding comments but this part is undocumented...
> > > > > > > > If I read this correctly you need to check for !memsz because some part of
> > > > > > > > the program segment may have a header but its memsz is zero, in which case it can
> > > > > > > > be safely skipped.  So why is that segment in the image to start with, and why
> > > > > > > > is it marked PT_LOAD if it is not needed?  This is very puzzling...
> > > > > > >
> > > > > > > Actually I have added comments in the header of this function.
> > > > > >
> > > > > > Indeed there is a mention of memsz in the function's header but it doesn't
> > > > > > mention _why_ this is needed, and that is what I'm looking for.
> > > > > >
> > > > > > >
> > > > > > > memsz= 0 with PT_LOAD issue, I have asked the toolchain's vendor,
> > > > > > > they said that this case is allowed by elf spec...
> > > > > > >
> > > > > > > And in the "pru_rproc.c" and "mtk_scp.c", seems they met same problem
> > > > > > > they also check the filesz in their internal xxx_elf_load_segments() function.
> > > > > >
> > > > > > In both cases they are skipping PT_LOAD sections where "filesz" is '0', which
> > > > > > makes sense because we don't know how many bytes to copy.  But here you are
> > > > > > skipping over a PT_LOAD section with a potentially valid filesz, and that is the
> > > > > > part I don't understand.
> > > > >
> > > > > Ok, I can use filesz instead. For my case, filesz = memsz = 0,
> > > > > it is the same result I want.
> > >
> > > If that is the case then rproc_elf_load_segments() should work, i.e it won't
> > > copy anything.  If rproc_elf_load_segments() doesn't work for you then there are
> > > corner cases you haven't told me about.
> > >
> > > > >
> > > > > The reason why I use "memsz '' is because there is  "if (filesz > memsz) "
> > > > > check after this,  if memsz is zero, then "filesz" should be zero too, other
> > > > > values are not allowed.
> > > >
> > > > But I still think checking "!memsz" is better than filesz,  because
> > > > memsz > filesz is allowed (filesz = 0),  the code below can be executed.
> > > > filesz > memsz is not allowed.
>
> The question remains the same - have you seen instances where memsz > filesz?
> Also, can you point me to the reference where it is said that memsz is allowed?
> And if it is allowed than how do we know that this program section has valid
> data, because after all, filesz is 0?

https://refspecs.linuxbase.org/elf/elf.pdf

This is the specification. page 40,  p_filesz and p_memsz can be zero.

p_filesz This member gives the number of bytes in the file image of
the segment; it may be
zero.
p_memsz This member gives the number of bytes in the memory image of
the segment; it
may be zero.

And page 41,  p_memsz can > p_filesz.

PT_LOAD The array element specifies a loadable segment, described by
p_filesz and
p_memsz. The bytes from the file are mapped to the beginning of the memory
segment. If the segment's memory size (p_memsz) is larger than the file size
(p_filesz), the "extra'' bytes are defined to hold the value 0 and to follow the
segment's initialized area. The file size may not be larger than the
memory size.
Loadable segment entries in the program header table appear in ascending order,
sorted on the p_vaddr member


best regards
wang shengjiu

>
> > > >
> > > > What do you think?
> > >
> > > I don't see a need to add a custom implementation for things that _may_ happen.
> > > If using the default rproc_elf_load_segments() works than go with that.  We can deal
> > > with problems if/when there is a need for it.
> > >
> >
> > The default rproc_elf_load_segments() with filesz = memsz = 0, then the
> > rproc_da_to_va() return ptr=NULL, then rproc_elf_load_segments() will return
> > with error.  So this is the reason to add a custom implementation.
>
> Ok, I see about rproc_da_to_va() returning NULL and failing everything from
> there one.
>
> >
> > best regards
> > wang shengjiu
