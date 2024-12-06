Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2D1819
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Dec 2024 17:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733504848; cv=none; b=RjbLPZraGiMt2XzGmYTdrOGb3W108Pd21LUXVWMHquQoaiF+PvzgFcF+zjQQqPLcXR0ZkBEk+f9DxYqInBjc1FrERiAXi/wHsMr7gGpdQK9xUTeVo4XJbvRMXkdgtsZeeWO8BzHMivHL9qytduL+94O7x+V0ZWJ6IAoFnhRmXpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733504848; c=relaxed/simple;
	bh=XM2fVk8BmpmZZgFdsT/Tztenzixcq7DzM15hBQ2FyuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUdSZENKl0GpVpQlEskwfKpAMnnxprf5FBeNoLJRPFXtMmjgeB7871k22HVIhw19OyPk42tExSzQ4hTfoT9cGS7EKv3EhpARPNjJ/Cr/XpPBZuKWIiZMzv+B22MZuhZ+u8mt3QVfLUXOYmEsn+QqsgzIwaJn3wneil71fP/AWiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xjmI5jrH; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xjmI5jrH"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3d74363cbso384832a12.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Dec 2024 09:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733504845; x=1734109645; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vLpJg/ZXtkEHeTxDyyd4m3p5oVAzlFCx8NjwJbsinb4=;
        b=xjmI5jrHn3oIuk+XHZNAV0DV7dyJ99ujN7IeZpWjjMNayTVRZTvV/ZebGzBKiZq+CT
         xjVmurBKHffWCYk6yeaGsWMgzw0/YHQRrc5IbocyGGdx/AxlRKza2UWbPHGlpgaweP1j
         zS9VUwvoRmKim5wjF1gxHnwLXP34f4ssd2BeWdgaopYMiknhuzuYpbemIdhG5KdgAGHl
         ni3n4R5MrCQvOmyNXUSHRk819PlekHQ/t17d+n7j1aWlHF2Wy6eiKvhsLRxMreE96kPk
         AfVJRPrW/Eqfh5BhiDstBnd8/u0lIUtDJWg/QNMZFh1gvK6+hftlT37B5gfpCczgheHu
         QYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733504845; x=1734109645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLpJg/ZXtkEHeTxDyyd4m3p5oVAzlFCx8NjwJbsinb4=;
        b=m8/zTxMQNpbYpp0pTtTcuW+o+SoEwmJ1F4K536kv+9Mx/d53VoJS8prRqGxZQxcZ6x
         BrjCMzR+wtZ5h4Yl8ps5r0vRkXrLDZOxAmoPdPxyklcN8PtUKvPVIzzPQ32p9bGLfToM
         neqLbR85zLhj7vsCSL5TjvLgUlmojrUfe0N+P/a0elQ2M0yynKYJDcgWBhYFjIu263I6
         GhQzeuICVfGGdXz/CMqBda6nHtclpcJed6U24OKdJj3U1tRvD/d3npoN+k7OEMZSK8zY
         kFVn87sjA8z1o/UxB5l8npjamgzB056xRU3DXjgE/72eKoDfZLZOVEorjpN0lCkkxSw4
         ADCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSp5HX2B6PhdAWSRwYSCiKuXq8G/VsIVO5y1x7IcNl0c8zeuUa+HTgMAw22ktl2YN7jf8/b3nr7fZYrelVNHOt@vger.kernel.org
X-Gm-Message-State: AOJu0YzC7M/xRTQbGYcIj46VMmkdnZomZVCMAqqdk5dABbjaTuik7gjf
	Rc0r5eTEZhBLBJpzB0tbBqGi53e3k+jOzzgAtE3SM+T0jFqmPaVZunMyFrccmOu72QI+h9LcBYT
	lbaN4bRKYlzk7wqnwoSx2P3Kcq2XF38tvt+PMVw==
X-Gm-Gg: ASbGncv6SH97c2gXAj1Xkfd+BnrvJ5F7h1oQ7LdImrEwJbwYaQooElv9+aTV3PHd4pg
	4aDzmUqnKW09eKlzmuR4OXhrDGEKnBgbeFbQmqRBBZ2oS7mQAN9n4VnykmXNJlVcSWg==
X-Google-Smtp-Source: AGHT+IHRCNLjIBg+iMQYmfbQFP6R63D3BSZpfZaZ/J9rF+1bkY9cc2oTZoFpii/ei8CrYUwt6Tj9ffu61txKALNtkXQ=
X-Received: by 2002:aa7:d1cb:0:b0:5d3:cff2:71a3 with SMTP id
 4fb4d7f45d1cf-5d3cff294f2mr2163067a12.33.1733504845038; Fri, 06 Dec 2024
 09:07:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
 <20241128084219.2159197-4-arnaud.pouliquen@foss.st.com> <Z08+UnATLQQ6kmaD@p14s>
 <1b7c8c21-37bc-4a1a-91bb-1d736d900f00@foss.st.com> <CANLsYkxk0NdKmbzOPEcVHbVpW9hPEz0gS-+9PysWMULDMxbkxw@mail.gmail.com>
In-Reply-To: <CANLsYkxk0NdKmbzOPEcVHbVpW9hPEz0gS-+9PysWMULDMxbkxw@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 6 Dec 2024 10:07:14 -0700
Message-ID: <CANLsYkxqoN+CT6f=FHVsb_POgP9X8pp6-B+kQbybAU6qGMd5=w@mail.gmail.com>
Subject: Re: [PATCH v15 3/8] remoteproc: Introduce load_fw and release_fw
 optional operation
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Dec 2024 at 10:05, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> On Thu, 5 Dec 2024 at 11:22, Arnaud POULIQUEN
> <arnaud.pouliquen@foss.st.com> wrote:
> >
> > Hello Mathieu,
> >
> > Thanks for the review!
> > I just need to clarify a point below before preparing the next revision.
> >
> > On 12/3/24 18:22, Mathieu Poirier wrote:
> > > On Thu, Nov 28, 2024 at 09:42:10AM +0100, Arnaud Pouliquen wrote:
> > >> This patch updates the rproc_ops structures to include two new optional
> > >> operations.
> > >>
> > >> - The load_fw() op is responsible for loading the remote processor
> > >> non-ELF firmware image before starting the boot sequence. This ops will
> > >> be used, for instance, to call OP-TEE to  authenticate an load the firmware
> > >> image before accessing to its resources (a.e the resource table)
> > >>
> > >> - The release_fw op is responsible for releasing the remote processor
> > >> firmware image. For instance to clean memories.
> > >> The ops is called in the following cases:
> > >>  - An error occurs between the loading of the firmware image and the
> > >>    start of the remote processor.
> > >>  - after stopping the remote processor.
> > >>
> > >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > >> ---
> > >> Update vs version V13:
> > >> - Rework the commit to introduce load_fw() op.
> > >> - remove rproc_release_fw() call from  rproc_start() as called in
> > >>   rproc_boot() and rproc_boot_recovery() in case of error.
> > >> - create rproc_load_fw() and rproc_release_fw() internal functions.
> > >> ---
> > >>  drivers/remoteproc/remoteproc_core.c     | 16 +++++++++++++++-
> > >>  drivers/remoteproc/remoteproc_internal.h | 14 ++++++++++++++
> > >>  include/linux/remoteproc.h               |  6 ++++++
> > >>  3 files changed, 35 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > >> index ace11ea17097..8df4b2c59bb6 100644
> > >> --- a/drivers/remoteproc/remoteproc_core.c
> > >> +++ b/drivers/remoteproc/remoteproc_core.c
> > >> @@ -1488,6 +1488,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> > >>      kfree(rproc->cached_table);
> > >>      rproc->cached_table = NULL;
> > >>      rproc->table_ptr = NULL;
> > >> +    rproc_release_fw(rproc);
> > >
> > > This is not needed since rproc_release_fw() is called in rproc_boot().
> > >
> > >>  unprepare_rproc:
> > >>      /* release HW resources if needed */
> > >>      rproc_unprepare_device(rproc);
> > >> @@ -1855,8 +1856,14 @@ static int rproc_boot_recovery(struct rproc *rproc)
> > >>              return ret;
> > >>      }
> > >>
> > >> +    ret = rproc_load_fw(rproc, firmware_p);
> > >> +    if (ret)
> > >> +            return ret;
> > >> +
> > >>      /* boot the remote processor up again */
> > >>      ret = rproc_start(rproc, firmware_p);
> > >> +    if (ret)
> > >> +            rproc_release_fw(rproc);
> > >>
> > >>      release_firmware(firmware_p);
> > >>
> > >> @@ -1997,7 +2004,13 @@ int rproc_boot(struct rproc *rproc)
> > >>                      goto downref_rproc;
> > >>              }
> > >>
> > >> +            ret = rproc_load_fw(rproc, firmware_p);
> > >> +            if (ret)
> > >> +                    goto downref_rproc;
> > >
> > > In case of error the firmware is not released.
> >
> > I considered that if the load fails, the firmware is not loaded
> > and therefore does not need to be released.
> > In other words, in case of a load error in OP-TEE, OP-TEE should
> > perform the cleanup to return to its initial state before the load.
> >
> > Do you see a use case where we should force the release in Linux?
> > Otherwise, I would propose to implement this behavior later if needed.
> >
>
> I'm talking about release_firmware() - it is not called if
> rproc_load_fw(), and it needs to.

Take 2: I'm talking about release_firwware() - it is not called if
rproc_load_fw() fails and it needs to.

>
> > Thanks,
> > Arnaud
> >
> > >
> > >> +
> > >>              ret = rproc_fw_boot(rproc, firmware_p);
> > >> +            if (ret)
> > >> +                    rproc_release_fw(rproc);
> > >>
> > >>              release_firmware(firmware_p);
> > >>      }
> > >> @@ -2071,6 +2084,7 @@ int rproc_shutdown(struct rproc *rproc)
> > >>      kfree(rproc->cached_table);
> > >>      rproc->cached_table = NULL;
> > >>      rproc->table_ptr = NULL;
> > >> +    rproc_release_fw(rproc);
> > >
> > > Please move this after rproc_disable_iommu().
> > >
> > >
> > >>  out:
> > >>      mutex_unlock(&rproc->lock);
> > >>      return ret;
> > >> @@ -2471,7 +2485,7 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
> > >>      if (!rproc->ops->coredump)
> > >>              rproc->ops->coredump = rproc_coredump;
> > >>
> > >> -    if (rproc->ops->load)
> > >> +    if (rproc->ops->load || rproc->ops->load_fw)
> > >>              return 0;
> > >>
> > >>      /* Default to ELF loader if no load function is specified */
> > >> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > >> index 0cd09e67ac14..2104ca449178 100644
> > >> --- a/drivers/remoteproc/remoteproc_internal.h
> > >> +++ b/drivers/remoteproc/remoteproc_internal.h
> > >> @@ -221,4 +221,18 @@ bool rproc_u64_fit_in_size_t(u64 val)
> > >>      return (val <= (size_t) -1);
> > >>  }
> > >>
> > >> +static inline void rproc_release_fw(struct rproc *rproc)
> > >> +{
> > >> +    if (rproc->ops->release_fw)
> > >> +            rproc->ops->release_fw(rproc);
> > >> +}
> > >> +
> > >> +static inline int rproc_load_fw(struct rproc *rproc, const struct firmware *fw)
> > >> +{
> > >> +    if (rproc->ops->load_fw)
> > >> +            return rproc->ops->load_fw(rproc, fw);
> > >> +
> > >> +    return 0;
> > >> +}
> > >> +
> > >>  #endif /* REMOTEPROC_INTERNAL_H */
> > >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > >> index 2e0ddcb2d792..ba6fd560f7ba 100644
> > >> --- a/include/linux/remoteproc.h
> > >> +++ b/include/linux/remoteproc.h
> > >> @@ -381,6 +381,10 @@ enum rsc_handling_status {
> > >>   * @panic:  optional callback to react to system panic, core will delay
> > >>   *          panic at least the returned number of milliseconds
> > >>   * @coredump:         collect firmware dump after the subsystem is shutdown
> > >> + * @load_fw:        optional function to load non-ELF firmware image to memory, where the remote
> > >
> > > Round this down to 80 characters please.  Here having a longer line doesn't
> > > improve readability.
> > >
> > >> + *          processor expects to find it.
> > >> + * @release_fw:     optional function to release the firmware image from memories.
> > >> + *          This function is called after stopping the remote processor or in case of error
> > >
> > > Same.
> > >
> > > More comments tomorrow or later during the week.
> > >
> > > Thanks,
> > > Mathieu
> > >
> > >>   */
> > >>  struct rproc_ops {
> > >>      int (*prepare)(struct rproc *rproc);
> > >> @@ -403,6 +407,8 @@ struct rproc_ops {
> > >>      u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> > >>      unsigned long (*panic)(struct rproc *rproc);
> > >>      void (*coredump)(struct rproc *rproc);
> > >> +    int (*load_fw)(struct rproc *rproc, const struct firmware *fw);
> > >> +    void (*release_fw)(struct rproc *rproc);
> > >>  };
> > >>
> > >>  /**
> > >> --
> > >> 2.25.1
> > >>
