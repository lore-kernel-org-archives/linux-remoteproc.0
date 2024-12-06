Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FE7193071
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Dec 2024 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733504764; cv=none; b=G2DAz/PLLGpAyCiLyJnc4NEN4B61ktCAdgzp7hgBqeC5SXGuz/ileeFIHR0Fpet0qo37FXEBsCSXRy3Kez61bVDNTOs4mnIIAsyGSNSJiy8jNItp0r5Dhv8H8/CG46v5Zb6xkMGYjvDlI5GOlN1XdW7l3SQWZU6uwQROKkOtK9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733504764; c=relaxed/simple;
	bh=2MgFv+qtnSOALRCDugdUMiXcBPkZa21USzY7amFqHcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=noSgTqY6rO4kvL/tj1wtvICDz0UtHpsNc4SpVVTvsczfsdkf1Xa1hMR5OyeQvKzacFyVkWR/rBZWHGD5U1nyMVJqPEw+sJnX/SUhAwIjkQcVBumlX7ECVvasUv2SRWd/tE1riO78pCZhVHCMtnxQ/3ZH0FY0Gj1IeD+RzHl144I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o4BZKOYl; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o4BZKOYl"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so5962986a12.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Dec 2024 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733504759; x=1734109559; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CWquTFOmI0P6s56hB+3dgMjYx9mk0jjVEdr2COPOlFA=;
        b=o4BZKOYlsAwJJNK9d+xNzVQhLYOZ2HnqUMMFNQmCHcv/zVaHCalpaKHCyonFGAhTWQ
         fXRoZ5kqQoq5POcwi2zli3EA3VuL1dQEoZYp42Zq7XE4uB7SG2ysFeDDgFo33wtQMTkM
         BpRaj1hBHPXfn7RUKBW5mNSiRP0W1ACpboxADi1mdvKEa267IilN6uGtEVkGxDaSJTmw
         Ahed5V9NC7Tm0ijxzxqM5/e4lHyFtYgMiKlLaZNJaHYNqBjxcJGXARC6Nfy3qYS1pmsL
         Wb1T2+PR9WwevBubswHKLzpPT5L+MVjm4+Z+jYdqoXIgZMoFRdy26Hstqo8p2+iySpRH
         SCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733504759; x=1734109559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWquTFOmI0P6s56hB+3dgMjYx9mk0jjVEdr2COPOlFA=;
        b=YK5jtBmocvY1spUjav2JG5ik34dOL8bo/ZiGr8C9JCesQZanreZ1F7WPloKlEU0+wq
         Zhth5TmW7EX4iu9z0RAokXcxUFn2VVLTfGCupC9RwJre2uWDbwTEe1KRHL0sQAK/gN6m
         QdP7+j7bt31py79XkdahBMW2zzbrc/Qswj/ytncyMXBJmYxwlRLfADUEbkJJt4tac9tr
         h+zRPbwVGOuWrvldF/96/aVVY4D+i8nN0y2Ddn/Gmqrxs+1g/ZLwCE7pYTDyj1URS6EW
         9d4Q8E4iXYqZ1QaWzmjpI123KUikLOLQwUFbNLwOUIZJxmW8q/ohxKRckKyXbKCvY6/v
         P+hA==
X-Forwarded-Encrypted: i=1; AJvYcCX/knmYgR8UzsaEhcbGJvoI0W9DZOnt2tduI0lNzBQB6palrAu1GHI5lBr9NveBHoNgq6CeKjBW90aoUqUYoH0t@vger.kernel.org
X-Gm-Message-State: AOJu0YwoQ20sc1r6ZDW8dEbVjrT+sZcytzjtH/5uzgTuLvabr04sHyvs
	KDyrIVtFRLBxpG5EmPlr6g9GvcWifUY7LkQkAGb11YBn+aZCtlzpZ8UwRolJ0th7hB1j5YKXv8L
	dfNtoFc+5xR06L/0AWpdX521YrgAUy8OS5GrfNw==
X-Gm-Gg: ASbGnctWDhq8dwIsyB0CtSp/UbqIQh69Pz1jFlg+RsBNqkliMMe4DLlcl6fNRO32Bsg
	Qfg0jlDs1j2ltlu/SMafiYY5r60IQG9SihDDzYoZUty+dtbGJd6i1qrsN0LQbhOx/tg==
X-Google-Smtp-Source: AGHT+IEaTKoUf+RioNK67ik2oZs8z243/d90sVj5s67qxBCcNJEIpVKWaYz8mONvy4kcq5o5oTSuOFoKCgPzmDJFh5Y=
X-Received: by 2002:a17:907:31c3:b0:aa5:b8dd:fec4 with SMTP id
 a640c23a62f3a-aa6202e01efmr811718166b.4.1733504758667; Fri, 06 Dec 2024
 09:05:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
 <20241128084219.2159197-4-arnaud.pouliquen@foss.st.com> <Z08+UnATLQQ6kmaD@p14s>
 <1b7c8c21-37bc-4a1a-91bb-1d736d900f00@foss.st.com>
In-Reply-To: <1b7c8c21-37bc-4a1a-91bb-1d736d900f00@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 6 Dec 2024 10:05:47 -0700
Message-ID: <CANLsYkxk0NdKmbzOPEcVHbVpW9hPEz0gS-+9PysWMULDMxbkxw@mail.gmail.com>
Subject: Re: [PATCH v15 3/8] remoteproc: Introduce load_fw and release_fw
 optional operation
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Dec 2024 at 11:22, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Mathieu,
>
> Thanks for the review!
> I just need to clarify a point below before preparing the next revision.
>
> On 12/3/24 18:22, Mathieu Poirier wrote:
> > On Thu, Nov 28, 2024 at 09:42:10AM +0100, Arnaud Pouliquen wrote:
> >> This patch updates the rproc_ops structures to include two new optional
> >> operations.
> >>
> >> - The load_fw() op is responsible for loading the remote processor
> >> non-ELF firmware image before starting the boot sequence. This ops will
> >> be used, for instance, to call OP-TEE to  authenticate an load the firmware
> >> image before accessing to its resources (a.e the resource table)
> >>
> >> - The release_fw op is responsible for releasing the remote processor
> >> firmware image. For instance to clean memories.
> >> The ops is called in the following cases:
> >>  - An error occurs between the loading of the firmware image and the
> >>    start of the remote processor.
> >>  - after stopping the remote processor.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >> Update vs version V13:
> >> - Rework the commit to introduce load_fw() op.
> >> - remove rproc_release_fw() call from  rproc_start() as called in
> >>   rproc_boot() and rproc_boot_recovery() in case of error.
> >> - create rproc_load_fw() and rproc_release_fw() internal functions.
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c     | 16 +++++++++++++++-
> >>  drivers/remoteproc/remoteproc_internal.h | 14 ++++++++++++++
> >>  include/linux/remoteproc.h               |  6 ++++++
> >>  3 files changed, 35 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index ace11ea17097..8df4b2c59bb6 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -1488,6 +1488,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> >>      kfree(rproc->cached_table);
> >>      rproc->cached_table = NULL;
> >>      rproc->table_ptr = NULL;
> >> +    rproc_release_fw(rproc);
> >
> > This is not needed since rproc_release_fw() is called in rproc_boot().
> >
> >>  unprepare_rproc:
> >>      /* release HW resources if needed */
> >>      rproc_unprepare_device(rproc);
> >> @@ -1855,8 +1856,14 @@ static int rproc_boot_recovery(struct rproc *rproc)
> >>              return ret;
> >>      }
> >>
> >> +    ret = rproc_load_fw(rproc, firmware_p);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >>      /* boot the remote processor up again */
> >>      ret = rproc_start(rproc, firmware_p);
> >> +    if (ret)
> >> +            rproc_release_fw(rproc);
> >>
> >>      release_firmware(firmware_p);
> >>
> >> @@ -1997,7 +2004,13 @@ int rproc_boot(struct rproc *rproc)
> >>                      goto downref_rproc;
> >>              }
> >>
> >> +            ret = rproc_load_fw(rproc, firmware_p);
> >> +            if (ret)
> >> +                    goto downref_rproc;
> >
> > In case of error the firmware is not released.
>
> I considered that if the load fails, the firmware is not loaded
> and therefore does not need to be released.
> In other words, in case of a load error in OP-TEE, OP-TEE should
> perform the cleanup to return to its initial state before the load.
>
> Do you see a use case where we should force the release in Linux?
> Otherwise, I would propose to implement this behavior later if needed.
>

I'm talking about release_firmware() - it is not called if
rproc_load_fw(), and it needs to.

> Thanks,
> Arnaud
>
> >
> >> +
> >>              ret = rproc_fw_boot(rproc, firmware_p);
> >> +            if (ret)
> >> +                    rproc_release_fw(rproc);
> >>
> >>              release_firmware(firmware_p);
> >>      }
> >> @@ -2071,6 +2084,7 @@ int rproc_shutdown(struct rproc *rproc)
> >>      kfree(rproc->cached_table);
> >>      rproc->cached_table = NULL;
> >>      rproc->table_ptr = NULL;
> >> +    rproc_release_fw(rproc);
> >
> > Please move this after rproc_disable_iommu().
> >
> >
> >>  out:
> >>      mutex_unlock(&rproc->lock);
> >>      return ret;
> >> @@ -2471,7 +2485,7 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
> >>      if (!rproc->ops->coredump)
> >>              rproc->ops->coredump = rproc_coredump;
> >>
> >> -    if (rproc->ops->load)
> >> +    if (rproc->ops->load || rproc->ops->load_fw)
> >>              return 0;
> >>
> >>      /* Default to ELF loader if no load function is specified */
> >> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> >> index 0cd09e67ac14..2104ca449178 100644
> >> --- a/drivers/remoteproc/remoteproc_internal.h
> >> +++ b/drivers/remoteproc/remoteproc_internal.h
> >> @@ -221,4 +221,18 @@ bool rproc_u64_fit_in_size_t(u64 val)
> >>      return (val <= (size_t) -1);
> >>  }
> >>
> >> +static inline void rproc_release_fw(struct rproc *rproc)
> >> +{
> >> +    if (rproc->ops->release_fw)
> >> +            rproc->ops->release_fw(rproc);
> >> +}
> >> +
> >> +static inline int rproc_load_fw(struct rproc *rproc, const struct firmware *fw)
> >> +{
> >> +    if (rproc->ops->load_fw)
> >> +            return rproc->ops->load_fw(rproc, fw);
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>  #endif /* REMOTEPROC_INTERNAL_H */
> >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >> index 2e0ddcb2d792..ba6fd560f7ba 100644
> >> --- a/include/linux/remoteproc.h
> >> +++ b/include/linux/remoteproc.h
> >> @@ -381,6 +381,10 @@ enum rsc_handling_status {
> >>   * @panic:  optional callback to react to system panic, core will delay
> >>   *          panic at least the returned number of milliseconds
> >>   * @coredump:         collect firmware dump after the subsystem is shutdown
> >> + * @load_fw:        optional function to load non-ELF firmware image to memory, where the remote
> >
> > Round this down to 80 characters please.  Here having a longer line doesn't
> > improve readability.
> >
> >> + *          processor expects to find it.
> >> + * @release_fw:     optional function to release the firmware image from memories.
> >> + *          This function is called after stopping the remote processor or in case of error
> >
> > Same.
> >
> > More comments tomorrow or later during the week.
> >
> > Thanks,
> > Mathieu
> >
> >>   */
> >>  struct rproc_ops {
> >>      int (*prepare)(struct rproc *rproc);
> >> @@ -403,6 +407,8 @@ struct rproc_ops {
> >>      u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> >>      unsigned long (*panic)(struct rproc *rproc);
> >>      void (*coredump)(struct rproc *rproc);
> >> +    int (*load_fw)(struct rproc *rproc, const struct firmware *fw);
> >> +    void (*release_fw)(struct rproc *rproc);
> >>  };
> >>
> >>  /**
> >> --
> >> 2.25.1
> >>
