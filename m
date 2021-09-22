Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD9EC433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Sep 2021 01:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E794611C6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Sep 2021 01:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhIVBhf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 21 Sep 2021 21:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbhIVBhf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Sep 2021 21:37:35 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7C5C061574;
        Tue, 21 Sep 2021 18:36:06 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id a10so3844044qka.12;
        Tue, 21 Sep 2021 18:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9N+YGvmC9XLzyG583SVgriY67QgemQh34kzr2BHhIaw=;
        b=Tpw+VvBE+TPzFfm1GtD8oIQTUBl0BJ2kZKHz/OD/e965vSWpMYMCT965jwhIv20NVR
         XaXCaWsFWYHVxLWvAL23/+saK+vTZQLGADWgNOEnhNM5sxqX5rf2Y4Q6xf9F/o1BI+re
         LvbMR9Lh8Miwu5moXwUk0DRbeJewOI4bR+lOVUAGpEk8Cr0pCmJe9iLMrjRRjFHGk5iN
         dAUHvsrMuIBh6sk9OfWisCUbwwQEcefB8ymejvI1EV8+10ntN9cpoOsXMYigBHKMbS8o
         V/bmcMbkoS7A/SIOz4c+kksc5fNyPcqMMRhxQTh8tj+JS4dri1CbPyxKSIsscFRvC1rR
         v/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9N+YGvmC9XLzyG583SVgriY67QgemQh34kzr2BHhIaw=;
        b=w+G880tdCdlkq1YzNi3hu5T5QT2IoVFCzBMuifIMQxHQlp/4NDuIvk9FqLQM89ooPA
         8kY0OQ1mXuOyL5Fq4LAJace9y5Zt+lmLeEyDEP81oFCJduvr3DSwKBrsLk7vW2yvskX9
         t8rqGSjihRMHaGH/dkLEFnW6MJl9HCWy0baAVbsZ9/1VGe67tOAArCtzXLM5UoZ3uS8k
         WMMmxX2B8w3gH0l6T94wsZEUPQjfwWjY7Qb8JEJJiaXmKA1qi+9qPs9FXRwIgbT/a6cF
         JjK4N8A8IKG7KisOh3ydzvXHfIGAdCZX2so70jS9OUze5WleCL9YrBeR3DX4aU0EuHrC
         IXNQ==
X-Gm-Message-State: AOAM530oBVujP67hErZABX6VlttGRW4awhyeJ0fcNYQ+6PdnNKr0TKTW
        FtIoTnm4KZKCM9mE0DSjF+rZgGQP/r3muMAhFTg2NQF4Q2k=
X-Google-Smtp-Source: ABdhPJzh5CJPBvnF0n9NovcY1NHUlN1wgYzsaa9spFdGyqq5jDfHQck75/2slkDA8EI8y/8C9v6//WA+3WIVMDlIDIg=
X-Received: by 2002:a37:9d54:: with SMTP id g81mr15465696qke.124.1632274565367;
 Tue, 21 Sep 2021 18:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <1631092255-25150-1-git-send-email-shengjiu.wang@nxp.com>
 <1631092255-25150-4-git-send-email-shengjiu.wang@nxp.com> <20210915161624.GA1770838@p14s>
 <CAA+D8AO0c+jk_k7j=ZvNFsVvC-p_zMLPJDS3qmLjNbJ+U0E9Cg@mail.gmail.com>
 <20210916165957.GA1825273@p14s> <CAA+D8AN_ni_XmEFNfY0Z0qLAJX00XFSUP1RkJdNQd-MVY6pd4g@mail.gmail.com>
 <CAA+D8AMaszzT5q8oGhXOtE3W5Ue9S3r=es2sTp2uJ7RwjX8Bzg@mail.gmail.com> <20210917152236.GA1878943@p14s>
In-Reply-To: <20210917152236.GA1878943@p14s>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Wed, 22 Sep 2021 09:35:54 +0800
Message-ID: <CAA+D8ANwXZdXheMkV8VHJ90JT8o+9YXFuE-EjTejijGUa4YALw@mail.gmail.com>
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

Hi Mathieu

On Fri, Sep 17, 2021 at 11:22 PM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Fri, Sep 17, 2021 at 05:44:44PM +0800, Shengjiu Wang wrote:
> > On Fri, Sep 17, 2021 at 1:20 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> > >
> > > On Fri, Sep 17, 2021 at 1:00 AM Mathieu Poirier
> > > <mathieu.poirier@linaro.org> wrote:
> > > >
> > > > [...]
> > > >
> > > > > > > +
> > > > > > > +/**
> > > > > > > + * imx_dsp_rproc_elf_load_segments() - load firmware segments to memory
> > > > > > > + * @rproc: remote processor which will be booted using these fw segments
> > > > > > > + * @fw: the ELF firmware image
> > > > > > > + *
> > > > > > > + * This function specially checks if memsz is zero or not, otherwise it
> > > > > > > + * is mostly same as rproc_elf_load_segments().
> > > > > > > + */
> > > > > > > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc,
> > > > > > > +                                        const struct firmware *fw)
> > > > > > > +{
> > > > > > > +     struct device *dev = &rproc->dev;
> > > > > > > +     u8 class = fw_elf_get_class(fw);
> > > > > > > +     u32 elf_phdr_get_size = elf_size_of_phdr(class);
> > > > > > > +     const u8 *elf_data = fw->data;
> > > > > > > +     const void *ehdr, *phdr;
> > > > > > > +     int i, ret = 0;
> > > > > > > +     u16 phnum;
> > > > > > > +
> > > > > > > +     ehdr = elf_data;
> > > > > > > +     phnum = elf_hdr_get_e_phnum(class, ehdr);
> > > > > > > +     phdr = elf_data + elf_hdr_get_e_phoff(class, ehdr);
> > > > > > > +
> > > > > > > +     /* go through the available ELF segments */
> > > > > > > +     for (i = 0; i < phnum; i++, phdr += elf_phdr_get_size) {
> > > > > > > +             u64 da = elf_phdr_get_p_paddr(class, phdr);
> > > > > > > +             u64 memsz = elf_phdr_get_p_memsz(class, phdr);
> > > > > > > +             u64 filesz = elf_phdr_get_p_filesz(class, phdr);
> > > > > > > +             u64 offset = elf_phdr_get_p_offset(class, phdr);
> > > > > > > +             u32 type = elf_phdr_get_p_type(class, phdr);
> > > > > > > +             void *ptr;
> > > > > > > +             bool is_iomem;
> > > > > > > +
> > > > > > > +             if (type != PT_LOAD || !memsz)
> > > > > >
> > > > > > You did a really good job with adding comments but this part is undocumented...
> > > > > > If I read this correctly you need to check for !memsz because some part of
> > > > > > the program segment may have a header but its memsz is zero, in which case it can
> > > > > > be safely skipped.  So why is that segment in the image to start with, and why
> > > > > > is it marked PT_LOAD if it is not needed?  This is very puzzling...
> > > > >
> > > > > Actually I have added comments in the header of this function.
> > > >
> > > > Indeed there is a mention of memsz in the function's header but it doesn't
> > > > mention _why_ this is needed, and that is what I'm looking for.
> > > >
> > > > >
> > > > > memsz= 0 with PT_LOAD issue, I have asked the toolchain's vendor,
> > > > > they said that this case is allowed by elf spec...
> > > > >
> > > > > And in the "pru_rproc.c" and "mtk_scp.c", seems they met same problem
> > > > > they also check the filesz in their internal xxx_elf_load_segments() function.
> > > >
> > > > In both cases they are skipping PT_LOAD sections where "filesz" is '0', which
> > > > makes sense because we don't know how many bytes to copy.  But here you are
> > > > skipping over a PT_LOAD section with a potentially valid filesz, and that is the
> > > > part I don't understand.
> > >
> > > Ok, I can use filesz instead. For my case, filesz = memsz = 0,
> > > it is the same result I want.
>
> If that is the case then rproc_elf_load_segments() should work, i.e it won't
> copy anything.  If rproc_elf_load_segments() doesn't work for you then there are
> corner cases you haven't told me about.
>
> > >
> > > The reason why I use "memsz '' is because there is  "if (filesz > memsz) "
> > > check after this,  if memsz is zero, then "filesz" should be zero too, other
> > > values are not allowed.
> >
> > But I still think checking "!memsz" is better than filesz,  because
> > memsz > filesz is allowed (filesz = 0),  the code below can be executed.
> > filesz > memsz is not allowed.
> >
> > What do you think?
>
> I don't see a need to add a custom implementation for things that _may_ happen.
> If using the default rproc_elf_load_segments() works than go with that.  We can deal
> with problems if/when there is a need for it.
>

The default rproc_elf_load_segments() with filesz = memsz = 0, then the
rproc_da_to_va() return ptr=NULL, then rproc_elf_load_segments() will return
with error.  So this is the reason to add a custom implementation.

best regards
wang shengjiu
