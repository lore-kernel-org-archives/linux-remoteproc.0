Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636D6C83F17
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Aug 2023 20:54:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbjH2UyI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Aug 2023 16:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235503AbjH2UyC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Aug 2023 16:54:02 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 952051BB
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Aug 2023 13:53:59 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-79a10807b4fso1844936241.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Aug 2023 13:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693342438; x=1693947238; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=svGG2wDB13uzDpJWe1CVUXYNJtH8VDQ471kzgce2wjI=;
        b=mWP1nOSP3T9RR90fek1HecNdnSYKDLx5bgLp1/ppk/xUMtO3/W7Df2NqNaEHvFWT+t
         CYjyL3cHa8LtQfdksQ/vBMIBRHktHFHZ77AeuyozHsqyXqClB7t+FLpacuUliefFTS9M
         mOnN1xKLVDAugcmWuN4RgwLmwl3HLbqCNSY6YYkfD1DcjafB4oGziitx5r0CqUOWmhSX
         OFegtkxEswFEJigg0OU19mno/6rQrvPTdtmSsxREs0bNfhN2bYDf6yFfqB70LLKgQ1wN
         OHzsFj8GN16xE+9gaLHJhx7VJXGlmk1UxbFGrbHgj4WZVAS9oynTbzWwe0SVmF11Hu9q
         9j9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693342438; x=1693947238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svGG2wDB13uzDpJWe1CVUXYNJtH8VDQ471kzgce2wjI=;
        b=KIU66ldylGwmPUt0pfedSLa+3chENTaYPI2vQ5z3jqJcPdWi/LkNxJVjRi3ofJdVTG
         Q5R1Uig0fkIYaepq89qr7IP0R4NvSZsp++JigauSgVkISBTgDnJT4OD7ZX+SIYFk26M3
         jRG03zAUqvtDuSZCKcMEr5T8n6zN4vcUyNMQdr/TI3Bqc6S5T0NGneNZuQ79kn/h+SX9
         /0gqiy5JxkFwqdsnskaknZwUYZZszgAWNp9KdUHzWZWUTxAWqljBRyGHMxBSvOQqBlPP
         fjMxTIKyvTbhAn/gvHiADvJ+S5ZSNF1i7v0H4OGdRd3WQM3+tPPtZXYrsUrBk6ZbHlQO
         KzEw==
X-Gm-Message-State: AOJu0YwLQ5/gKUFllDNHZ40NLe60EKRE7DoRlfT4xS4Lj6t9xEfztiH9
        2WuQh85x1fP1yesT4zCUoXZ5izFh0SNBgS3D4w4Qsw==
X-Google-Smtp-Source: AGHT+IHJ1fFSnp2bLxtzdjcguBGoW+n9sRJTKhN/7CGgIE3TJOEWwPaEM5HHfLDkf0ms64pN4JqoBQ8Kli0mV/LqTOc=
X-Received: by 2002:a67:f3c7:0:b0:44a:a4ea:3f90 with SMTP id
 j7-20020a67f3c7000000b0044aa4ea3f90mr371283vsn.26.1693342438657; Tue, 29 Aug
 2023 13:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230508153524.2371795-1-dmitry.baryshkov@linaro.org> <o7wou4ob4vo2rzyhvzxl35cj52frok6jt3qjhdhwszvtsipewz@776l7jgunfqa>
In-Reply-To: <o7wou4ob4vo2rzyhvzxl35cj52frok6jt3qjhdhwszvtsipewz@776l7jgunfqa>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 29 Aug 2023 23:53:47 +0300
Message-ID: <CAA8EJpqc8zoW9nNm84F8kW2FzAb4jLd6TmNYEN_UWAh7PtGm3A@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: qcom_q6v5_mss: support loading MBN file on msm8974
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, 15 Jul 2023 at 23:35, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Mon, May 08, 2023 at 06:35:24PM +0300, Dmitry Baryshkov wrote:
> > On MSM8974 and APQ8074 the MSS requires loading raw MBA image instead of
> > the ELF file. Skip the ELF headers if mba.mbn was specified as the
> > firmware image.
> >
> > Fixes: 051fb70fd4ea ("remoteproc: qcom: Driver for the self-authenticating Hexagon v5")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Rather than complicating the driver further, can't we just extract that
> first segment? Or specify the first split segment file?

Missed your response.

Of course, we can. But this makes this particular case really stand
off. In all other cases we use the .mbn file and only msm8974/apq8084
only mba requires .b00 file. I think from the point of uniformity we'd
better use mba.mbn here too.

If the q6v5_mba_get_offset() design seems too complicated, I can
replace that with the fixed offset of 0x1000. WDYT?

>
> Regards,
> Bjorn
>
> > ---
> >
> > Changes since v1:
> > - Replace fixed offset 0x1000 with the value obtained from ELF headers
> > - Implement ELF validity checks
> >
> > ---
> >  drivers/remoteproc/qcom_q6v5_mss.c | 47 +++++++++++++++++++++++++++++-
> >  1 file changed, 46 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> > index ab053084f7a2..b4ff900f0304 100644
> > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/devcoredump.h>
> >  #include <linux/dma-mapping.h>
> > +#include <linux/firmware.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/kernel.h>
> >  #include <linux/mfd/syscon.h>
> > @@ -29,6 +30,7 @@
> >  #include <linux/iopoll.h>
> >  #include <linux/slab.h>
> >
> > +#include "remoteproc_elf_helpers.h"
> >  #include "remoteproc_internal.h"
> >  #include "qcom_common.h"
> >  #include "qcom_pil_info.h"
> > @@ -459,6 +461,35 @@ static void q6v5_debug_policy_load(struct q6v5 *qproc, void *mba_region)
> >       release_firmware(dp_fw);
> >  }
> >
> > +/* Get the offset of the segment 0 for mba.mbn */
> > +static int q6v5_mba_get_offset(struct rproc *rproc, const struct firmware *fw)
> > +{
> > +     const struct elf32_hdr *ehdr;
> > +     const void *phdr;
> > +     char class;
> > +     u64 phoffset, poffset;
> > +     u16 phentsize;
> > +     int ret;
> > +
> > +     ret = rproc_elf_sanity_check(rproc, fw);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ehdr = (const struct elf32_hdr *)fw->data;
> > +     class = ehdr->e_ident[EI_CLASS];
> > +     phoffset = elf_hdr_get_e_phoff(class, ehdr);
> > +     phentsize = elf_hdr_get_e_phentsize(class, ehdr);
> > +     if (phoffset + phentsize > fw->size)
> > +             return -EINVAL;
> > +
> > +     phdr = fw->data + elf_hdr_get_e_phoff(class, ehdr);
> > +     poffset = elf_phdr_get_p_offset(class, phdr);
> > +     if (poffset > fw->size)
> > +             return -EINVAL;
> > +
> > +     return poffset;
> > +}
> > +
> >  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
> >  {
> >       struct q6v5 *qproc = rproc->priv;
> > @@ -477,7 +508,21 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
> >               return -EBUSY;
> >       }
> >
> > -     memcpy(mba_region, fw->data, fw->size);
> > +     if (qproc->version == MSS_MSM8974 &&
> > +         !memcmp(fw->data, ELFMAG, SELFMAG)) {
> > +             int poffset;
> > +
> > +             poffset = q6v5_mba_get_offset(rproc, fw);
> > +             if (poffset < 0) {
> > +                     memunmap(mba_region);
> > +                     return poffset;
> > +             }
> > +
> > +             memcpy(mba_region, fw->data + poffset, fw->size - poffset);
> > +     } else {
> > +             memcpy(mba_region, fw->data, fw->size);
> > +     }
> > +
> >       q6v5_debug_policy_load(qproc, mba_region);
> >       memunmap(mba_region);
> >
> > --
> > 2.39.2
> >



--
With best wishes
Dmitry
