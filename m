Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DE6C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Sep 2021 15:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36CF061164
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Sep 2021 15:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbhIQP0K (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 17 Sep 2021 11:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344351AbhIQPY1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Sep 2021 11:24:27 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469E2C0613D3
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Sep 2021 08:22:40 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id w6so6414185pll.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Sep 2021 08:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OS94uZTmA0qnszl1fwVMo+RQL+/vTVqvtH0x+p48wY0=;
        b=bRsPWtlhXzo4Tc/8or9LqnXhztTrk9NmxMapoTxWY0Ypjm1gL3iusGWCPx1hXm6hXA
         OnJWj3AfeV/AyOHx5exXC8jx9r5SrprlQOmDZ4fXNd1uKmS3VPuHRNL+hiI+Z8GF4XPi
         WK/2g61WY2v+O6shCYTiop8X+p9M/F/J96rA8m3g8Ut+moKVIOQoEjGLOImm2cOJAt7M
         f5crjbQisPGL3RZe3I/3BFsuR2bOn0bHvJN95jx9lTXBpcsUvy5TCJbdsn1eUZwqGKRR
         MXAOf8+zN8rXXGS6FxxD2Hn+G8vBOwu4E/XhZs8fEPSUn5SEgVF7Nbf60iAD89hmPRX4
         Go7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OS94uZTmA0qnszl1fwVMo+RQL+/vTVqvtH0x+p48wY0=;
        b=cmWFW3skenVJ+KgUZ2T89jlKdRobizuMy64Bw0O91cyampELlJKqQv2e5kGUfmza9W
         DsVFcgtQ18e3EvEEYo6qEJsYegtWYqlnM+mVP1PIYQUO2Fiu3zrZUJx9Ocrkr9Z4yG1+
         06focRckEgL33VhLqrH6utIfiA3Q1m5tNxOIS5vkboERA0PXel/KzRgEO8xA9D88rCPN
         EXkhvHHWFDq2hJ0btIoDgYa/VnmQQ+Mz2G8+ZMiJqJuEIvqEZYM/wEIfsV1P5Qsv3ScV
         JPx1xiStWg/dk/IWBfnCaoTruwnXEkkN03jtP68roPgJd+nx4V+VmCWKTOOJ92tBrjDQ
         ZTOA==
X-Gm-Message-State: AOAM531FM5GupSoEyoPshqNCrLkBdc0l+nUdmIUT0fNbaUA98tt70RVA
        k2W6/lTDKFbhcKaEjIxZkPEFTA==
X-Google-Smtp-Source: ABdhPJwTfxqmzpmynstN+ueD82dE7pITyL8lRsfd5Z/m6O2J/WXNuzsrz1m0cTCWJw2yZBW048Tt5g==
X-Received: by 2002:a17:902:a3ca:b0:13c:a7be:1767 with SMTP id q10-20020a170902a3ca00b0013ca7be1767mr6481323plb.88.1631892159539;
        Fri, 17 Sep 2021 08:22:39 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 23sm6472340pfp.206.2021.09.17.08.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 08:22:38 -0700 (PDT)
Date:   Fri, 17 Sep 2021 09:22:36 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Shengjiu Wang <shengjiu.wang@gmail.com>
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
Subject: Re: [PATCH v4 3/4] remoteproc: imx_dsp_rproc: Add remoteproc driver
 for DSP on i.MX
Message-ID: <20210917152236.GA1878943@p14s>
References: <1631092255-25150-1-git-send-email-shengjiu.wang@nxp.com>
 <1631092255-25150-4-git-send-email-shengjiu.wang@nxp.com>
 <20210915161624.GA1770838@p14s>
 <CAA+D8AO0c+jk_k7j=ZvNFsVvC-p_zMLPJDS3qmLjNbJ+U0E9Cg@mail.gmail.com>
 <20210916165957.GA1825273@p14s>
 <CAA+D8AN_ni_XmEFNfY0Z0qLAJX00XFSUP1RkJdNQd-MVY6pd4g@mail.gmail.com>
 <CAA+D8AMaszzT5q8oGhXOtE3W5Ue9S3r=es2sTp2uJ7RwjX8Bzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AMaszzT5q8oGhXOtE3W5Ue9S3r=es2sTp2uJ7RwjX8Bzg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Sep 17, 2021 at 05:44:44PM +0800, Shengjiu Wang wrote:
> On Fri, Sep 17, 2021 at 1:20 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> >
> > On Fri, Sep 17, 2021 at 1:00 AM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > [...]
> > >
> > > > > > +
> > > > > > +/**
> > > > > > + * imx_dsp_rproc_elf_load_segments() - load firmware segments to memory
> > > > > > + * @rproc: remote processor which will be booted using these fw segments
> > > > > > + * @fw: the ELF firmware image
> > > > > > + *
> > > > > > + * This function specially checks if memsz is zero or not, otherwise it
> > > > > > + * is mostly same as rproc_elf_load_segments().
> > > > > > + */
> > > > > > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc,
> > > > > > +                                        const struct firmware *fw)
> > > > > > +{
> > > > > > +     struct device *dev = &rproc->dev;
> > > > > > +     u8 class = fw_elf_get_class(fw);
> > > > > > +     u32 elf_phdr_get_size = elf_size_of_phdr(class);
> > > > > > +     const u8 *elf_data = fw->data;
> > > > > > +     const void *ehdr, *phdr;
> > > > > > +     int i, ret = 0;
> > > > > > +     u16 phnum;
> > > > > > +
> > > > > > +     ehdr = elf_data;
> > > > > > +     phnum = elf_hdr_get_e_phnum(class, ehdr);
> > > > > > +     phdr = elf_data + elf_hdr_get_e_phoff(class, ehdr);
> > > > > > +
> > > > > > +     /* go through the available ELF segments */
> > > > > > +     for (i = 0; i < phnum; i++, phdr += elf_phdr_get_size) {
> > > > > > +             u64 da = elf_phdr_get_p_paddr(class, phdr);
> > > > > > +             u64 memsz = elf_phdr_get_p_memsz(class, phdr);
> > > > > > +             u64 filesz = elf_phdr_get_p_filesz(class, phdr);
> > > > > > +             u64 offset = elf_phdr_get_p_offset(class, phdr);
> > > > > > +             u32 type = elf_phdr_get_p_type(class, phdr);
> > > > > > +             void *ptr;
> > > > > > +             bool is_iomem;
> > > > > > +
> > > > > > +             if (type != PT_LOAD || !memsz)
> > > > >
> > > > > You did a really good job with adding comments but this part is undocumented...
> > > > > If I read this correctly you need to check for !memsz because some part of
> > > > > the program segment may have a header but its memsz is zero, in which case it can
> > > > > be safely skipped.  So why is that segment in the image to start with, and why
> > > > > is it marked PT_LOAD if it is not needed?  This is very puzzling...
> > > >
> > > > Actually I have added comments in the header of this function.
> > >
> > > Indeed there is a mention of memsz in the function's header but it doesn't
> > > mention _why_ this is needed, and that is what I'm looking for.
> > >
> > > >
> > > > memsz= 0 with PT_LOAD issue, I have asked the toolchain's vendor,
> > > > they said that this case is allowed by elf spec...
> > > >
> > > > And in the "pru_rproc.c" and "mtk_scp.c", seems they met same problem
> > > > they also check the filesz in their internal xxx_elf_load_segments() function.
> > >
> > > In both cases they are skipping PT_LOAD sections where "filesz" is '0', which
> > > makes sense because we don't know how many bytes to copy.  But here you are
> > > skipping over a PT_LOAD section with a potentially valid filesz, and that is the
> > > part I don't understand.
> >
> > Ok, I can use filesz instead. For my case, filesz = memsz = 0,
> > it is the same result I want.

If that is the case then rproc_elf_load_segments() should work, i.e it won't
copy anything.  If rproc_elf_load_segments() doesn't work for you then there are
corner cases you haven't told me about.

> >
> > The reason why I use "memsz '' is because there is  "if (filesz > memsz) "
> > check after this,  if memsz is zero, then "filesz" should be zero too, other
> > values are not allowed.
> 
> But I still think checking "!memsz" is better than filesz,  because
> memsz > filesz is allowed (filesz = 0),  the code below can be executed.
> filesz > memsz is not allowed.
> 
> What do you think?

I don't see a need to add a custom implementation for things that _may_ happen.
If using the default rproc_elf_load_segments() works than go with that.  We can deal
with problems if/when there is a need for it.

> 
> Best regards
> Wang shengjiu
> >
> > >
> > > >
> > > > >
> > > > >
> > > > > > +                     continue;
> > > > > > +
> > > > > > +             dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
> > > > > > +                     type, da, memsz, filesz);
> > > > > > +
> > > > > > +             if (filesz > memsz) {
> > > > > > +                     dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
> > > > > > +                             filesz, memsz);
> > > > > > +                     ret = -EINVAL;
> > > > > > +                     break;
> > > > > > +             }
> > > > > > +
> > > > > > +             if (offset + filesz > fw->size) {
> > > > > > +                     dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
> > > > > > +                             offset + filesz, fw->size);
> > > > > > +                     ret = -EINVAL;
> > > > > > +                     break;
> > > > > > +             }
> > > > > > +
> > > > > > +             if (!rproc_u64_fit_in_size_t(memsz)) {
> > > > > > +                     dev_err(dev, "size (%llx) does not fit in size_t type\n",
> > > > > > +                             memsz);
> > > > > > +                     ret = -EOVERFLOW;
> > > > > > +                     break;
> > > > > > +             }
> > > > > > +
> > > > > > +             /* grab the kernel address for this device address */
> > > > > > +             ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
> > > > >
> > > > >                 rproc_da_to_va(rproc, da, memsz, NULL);
> > > >
> > > > yes, will update it.
> > > >
> > > > >
> > > > > More comments to follow later today or tomorrow.
> > > >
> > > > Thanks.
> > > >
> > > > Best regards
> > > > Wang Shengjiu
