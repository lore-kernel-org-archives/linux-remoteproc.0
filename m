Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7552AC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Sep 2021 18:39:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FEEC611CA
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Sep 2021 18:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348010AbhIPSks (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 16 Sep 2021 14:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347471AbhIPSkn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Sep 2021 14:40:43 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64CB9C061787
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Sep 2021 10:00:01 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id dw14so5005810pjb.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Sep 2021 10:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DnCi064unWOqrg6AqoEPCgOiFEifTwoQ1hTWjh2ahNc=;
        b=fjvR7zuO7Qwrh4Tjuo3II0Dper4eSgVuDNHmEHzB39NI5Rx3I3rEo2ydF8No6BWlLP
         NZseveCXuZJN6lJRAfYdYtXEIeQ9ARiIH0O6jWequicz709VCf0A2djxnCxKaJs2Nksz
         aLvtfCO5Am1ts1K11SDheSJGatjTcUUQqe8ZGRRbVTk0xEqZeZkOyTdx3Xa4/UtkAT+N
         SMDOy7kKhnOc6RWpOGRXwKZLlXgE9O3ruEqJS/Ky55HEj5Tc+0aLIswCEWFBtH5gKAuq
         BCvoNMuv8aMCt9cPEzW6zbpUgj/ZjxkppEL+kkauC/i2vnpv9bkJ8qkF0rmiyCadSmf3
         Oc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DnCi064unWOqrg6AqoEPCgOiFEifTwoQ1hTWjh2ahNc=;
        b=qYH+E7BNbxGLPLjXH/NStcWU50z3oCjbaufU7B58ITuv1Lj3BIaZRot3BIYANv5wXX
         t/KYfgkmxjTJyBjwlUbmWuK63NqhrbaQV+ut75Bq/uubk/bpP48yIwh0CIKyQdj+zsnO
         VjhEpER2HMcBL+5o/vdo9GlKKBJNn7O8SAO+OZoTMhKkZtQ/Pg2aGAsS+MK5us9q2q9J
         plubgv7fTLQz7wL7S30YCkE7Af3bXxaoVrlzqTapDypyhggRmyCPOziQXQgV2Y74bsfK
         7o3APZPN4Yl9PZFMG3NlGUXSy6RyfLDTQayNZ/7giXudzu4lDJfUxWDsMpn1cEdIjfVM
         1Q9Q==
X-Gm-Message-State: AOAM532tZoo19MW5wak1J7Oi490hfABa7dRMooEkGicx6JIxS+6CPfsP
        rvHl9U/7qlLb/dEVk8ehe4qKKQ==
X-Google-Smtp-Source: ABdhPJygVESxOg1NzhOIxcgODu9z0ujnuZx5AxebTB90pJz/tL2iARjKAPvPkE8tUXGK7uvcly8awQ==
X-Received: by 2002:a17:902:c443:b0:13c:a5e1:caf5 with SMTP id m3-20020a170902c44300b0013ca5e1caf5mr2693674plm.11.1631811600672;
        Thu, 16 Sep 2021 10:00:00 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id g13sm3790185pfi.176.2021.09.16.09.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 09:59:59 -0700 (PDT)
Date:   Thu, 16 Sep 2021 10:59:57 -0600
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
Message-ID: <20210916165957.GA1825273@p14s>
References: <1631092255-25150-1-git-send-email-shengjiu.wang@nxp.com>
 <1631092255-25150-4-git-send-email-shengjiu.wang@nxp.com>
 <20210915161624.GA1770838@p14s>
 <CAA+D8AO0c+jk_k7j=ZvNFsVvC-p_zMLPJDS3qmLjNbJ+U0E9Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AO0c+jk_k7j=ZvNFsVvC-p_zMLPJDS3qmLjNbJ+U0E9Cg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[...]

> > > +
> > > +/**
> > > + * imx_dsp_rproc_elf_load_segments() - load firmware segments to memory
> > > + * @rproc: remote processor which will be booted using these fw segments
> > > + * @fw: the ELF firmware image
> > > + *
> > > + * This function specially checks if memsz is zero or not, otherwise it
> > > + * is mostly same as rproc_elf_load_segments().
> > > + */
> > > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc,
> > > +                                        const struct firmware *fw)
> > > +{
> > > +     struct device *dev = &rproc->dev;
> > > +     u8 class = fw_elf_get_class(fw);
> > > +     u32 elf_phdr_get_size = elf_size_of_phdr(class);
> > > +     const u8 *elf_data = fw->data;
> > > +     const void *ehdr, *phdr;
> > > +     int i, ret = 0;
> > > +     u16 phnum;
> > > +
> > > +     ehdr = elf_data;
> > > +     phnum = elf_hdr_get_e_phnum(class, ehdr);
> > > +     phdr = elf_data + elf_hdr_get_e_phoff(class, ehdr);
> > > +
> > > +     /* go through the available ELF segments */
> > > +     for (i = 0; i < phnum; i++, phdr += elf_phdr_get_size) {
> > > +             u64 da = elf_phdr_get_p_paddr(class, phdr);
> > > +             u64 memsz = elf_phdr_get_p_memsz(class, phdr);
> > > +             u64 filesz = elf_phdr_get_p_filesz(class, phdr);
> > > +             u64 offset = elf_phdr_get_p_offset(class, phdr);
> > > +             u32 type = elf_phdr_get_p_type(class, phdr);
> > > +             void *ptr;
> > > +             bool is_iomem;
> > > +
> > > +             if (type != PT_LOAD || !memsz)
> >
> > You did a really good job with adding comments but this part is undocumented...
> > If I read this correctly you need to check for !memsz because some part of
> > the program segment may have a header but its memsz is zero, in which case it can
> > be safely skipped.  So why is that segment in the image to start with, and why
> > is it marked PT_LOAD if it is not needed?  This is very puzzling...
> 
> Actually I have added comments in the header of this function.

Indeed there is a mention of memsz in the function's header but it doesn't
mention _why_ this is needed, and that is what I'm looking for.

> 
> memsz= 0 with PT_LOAD issue, I have asked the toolchain's vendor,
> they said that this case is allowed by elf spec...
> 
> And in the "pru_rproc.c" and "mtk_scp.c", seems they met same problem
> they also check the filesz in their internal xxx_elf_load_segments() function.

In both cases they are skipping PT_LOAD sections where "filesz" is '0', which
makes sense because we don't know how many bytes to copy.  But here you are
skipping over a PT_LOAD section with a potentially valid filesz, and that is the
part I don't understand.

> 
> >
> >
> > > +                     continue;
> > > +
> > > +             dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
> > > +                     type, da, memsz, filesz);
> > > +
> > > +             if (filesz > memsz) {
> > > +                     dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
> > > +                             filesz, memsz);
> > > +                     ret = -EINVAL;
> > > +                     break;
> > > +             }
> > > +
> > > +             if (offset + filesz > fw->size) {
> > > +                     dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
> > > +                             offset + filesz, fw->size);
> > > +                     ret = -EINVAL;
> > > +                     break;
> > > +             }
> > > +
> > > +             if (!rproc_u64_fit_in_size_t(memsz)) {
> > > +                     dev_err(dev, "size (%llx) does not fit in size_t type\n",
> > > +                             memsz);
> > > +                     ret = -EOVERFLOW;
> > > +                     break;
> > > +             }
> > > +
> > > +             /* grab the kernel address for this device address */
> > > +             ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
> >
> >                 rproc_da_to_va(rproc, da, memsz, NULL);
> 
> yes, will update it.
> 
> >
> > More comments to follow later today or tomorrow.
> 
> Thanks.
> 
> Best regards
> Wang Shengjiu
