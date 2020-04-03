Return-Path: <SRS0=9kKd=5T=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3C3C2BA15
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Apr 2020 17:48:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24738206F6
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Apr 2020 17:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585936109;
	bh=18GHNOBVkEj7vvORr2+RoP8PDn87EfmttlpKTzZy46Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=sqiTofrWdO2o2NF+JQBEGoP5fwa9DNA29lwznGs6im8O9Z1QDC1gtCPdHRg4Kmxdu
	 eP90W98xT16OmuvWwape24R8kGfV3XeVNq9jN85eRqINEpfdsKs7jXmcGsN65NuiYb
	 aSLDpdo9vdHV/wMA9Hgq8qBrKEaUT4GbvkjXGWDg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgDCRs2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 3 Apr 2020 13:48:28 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37375 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727882AbgDCRs1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Apr 2020 13:48:27 -0400
Received: by mail-lj1-f196.google.com with SMTP id r24so7836973ljd.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Apr 2020 10:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3THBIeg1DeeQfa1qWYP5fMgyz8PG9WZarWEKIAjybzc=;
        b=N9neCI5Qjc956nHzpT6Wv66wmcCPHy18i498AuxWNSpHcXpezXTuTKm2OG1vKqL42o
         JtGfih0oxhGl0Bq1LQLwJPruvqzhW2QlyHd3ffmbTf6kYcGwiNvs1B3JlPdeCUi9ce4q
         vhAhfkqRxPVn0NCUVrvl0tZmhQSEnzqjCiCsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3THBIeg1DeeQfa1qWYP5fMgyz8PG9WZarWEKIAjybzc=;
        b=UiGv8ceqIXOn1hNQAgGbr7MZ3JfejrFHelZll+JoSa3uufcbLY3+NUlZmImi679v5m
         gRmhThYtUgoV9tdw6GyApxnjmAUzrWIbzuwz+Xsul/HIn6mnfQPkTfU7NaMKoHxpLxrf
         c0r5N/h7/B8oclsIiWGgAWiJj7UVmp0c8daw5UiUI22ITPc44N4i4CBNttm/r+m/xX4U
         S/nClyLktf7MHFwNbz+I7+L2dzTii8mdH0foUOop6s2GdIl+D66XJkEt1V9gGaa9zYZ+
         /fa+Wlt2/kc+0bLyZepP5ScL1MnRHYljXOltYhVfDofZC0fV4kyBwQhW2NpTZpo5ZN8a
         Oo9A==
X-Gm-Message-State: AGi0PuYWVHoRqgbpRksnWmNfXUZ+MdJH3TKVt5K4lQebgdhvb8kT4qF4
        D0aWPAETGtxyM3FEoeRN+0nkSZb5wEc=
X-Google-Smtp-Source: APiQypJ4sntj5ONjhMBpOEdafTIshBrShw6Y0hOkjEm4gjEUMBmhvmJJ74Q3BGQC0Hq9XfZbcdjYig==
X-Received: by 2002:a2e:9d85:: with SMTP id c5mr5442445ljj.168.1585936104240;
        Fri, 03 Apr 2020 10:48:24 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id a22sm5287808ljm.28.2020.04.03.10.48.23
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 10:48:23 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id c5so6529464lfp.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Apr 2020 10:48:23 -0700 (PDT)
X-Received: by 2002:ac2:46d3:: with SMTP id p19mr6173851lfo.125.1585936102736;
 Fri, 03 Apr 2020 10:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200402010812.GA751391@yoga> <20200403013134.11407-1-natechancellor@gmail.com>
In-Reply-To: <20200403013134.11407-1-natechancellor@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 3 Apr 2020 10:48:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=whG84d5bGHU5HLOMgR59BqUcuawPTxGgVDm3JWiWJHi6A@mail.gmail.com>
Message-ID:
 <CAHk-=whG84d5bGHU5HLOMgR59BqUcuawPTxGgVDm3JWiWJHi6A@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/omap: Fix set_load call in omap_rproc_request_timer
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200403174806.Jx-L-WgKebv2e-4BukeFPd7fxT2WmQuAWLbnvNHxGpg@z>

On Thu, Apr 2, 2020 at 6:32 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> This is due to commit 02e6d546e3bd ("clocksource/drivers/timer-ti-dm:
> Enable autoreload in set_pwm") in the clockevents tree interacting with
> commit e28edc571925 ("remoteproc/omap: Request a timer(s) for remoteproc
> usage") from the rpmsg tree.
>
> This should have been fixed during the merge of the remoteproc tree
> since it happened after the clockevents tree merge; however, it does not
> look like my email was noticed by either maintainer and I did not pay
> attention when the pull was sent since I was on CC.

Thanks, I've taken this patch directly into my tree since it was my
merge that screwed up.

                   Linus
