Return-Path: <SRS0=KI6G=7A=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540A9C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 May 2020 16:29:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C13B207ED
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 May 2020 16:29:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bSPZNJ/+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgERQ3Q (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 May 2020 12:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728045AbgERQ3P (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 May 2020 12:29:15 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E97C061A0C
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 May 2020 09:29:15 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id f3so11282505ioj.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 May 2020 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wsQWTsWX2nHX19luhaDiip7r8CGCfrYXEJqyS+xYi/4=;
        b=bSPZNJ/+RFq4gD7fvba2WfPjrN7uJ1zq1w02BSYWZKYEPt/dPqB4b+WVzCZJrIi4nk
         zF1iLf6Y30e9ZEjEoza+2119f0YSs3e7TccHKRPO+w95GXhahxL2m7k7eAx+jgFrHePp
         zSWxnBkWAPtAWHQ4W6AnAXC4JdK1paRaYXaTRqUKzE8PZS+UXgo1B/CVjmCs0fYb6ZvI
         1MvnuXwousaFRSF0P4r/Wut/FQ3OsKp7KuHJeGko4uaTqBhhAUBDapIQ+hicvzLuYnZr
         wyDqQrhO+jWo4AWF23p9rxYcrwBwU3tx9d9tjkhvqeIHgz0mhNcW+kNFWRsqgC7JVJRR
         U+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wsQWTsWX2nHX19luhaDiip7r8CGCfrYXEJqyS+xYi/4=;
        b=SnYoRpI2UIdE58fcBhx8RAV2oD7g5kJCHlDKXfKs6p+q6kpq1Of5yu/v+m8V/IpF6r
         eA7Zk30xc//4SLXi2zamm/U4oOGbqV+ukeJ60G2aKEGuWYYbtFaJNlh8L6GocReBS5c9
         cbkPAWYg6vF3CaXBUJsg8D4OApR1ynv+d1oOGyfvv1lqjuldd6yyYcUQsdg0G1drRR7D
         bC1NobX1eMqdizGzM5bDwuLpjn9A+QGhdizXjOEBG94z5onPOO/6L9KmtyaSqSgddPFV
         Nx6AWLBY8HVwCUaAVLh2J+DsaOtUy2CRWlc99h7iK5yK0KM63u4uw4ctPbUbqavUtT2p
         OtTQ==
X-Gm-Message-State: AOAM530jYTSZ8RAryHXvYRQ/SpB5zp6OopqW4rLGZgrLtYdyGrP4GI45
        ozYXb8I+zh8iOC0N0BzrauK1a5QEhOAOtqH5ZwqMHg==
X-Google-Smtp-Source: ABdhPJwTWrU223OxJ1S7Jka4xPxM5BduJ3BBeoknX5KQJj3Em1XW1bG2YaoM6S0FyuZtIXVzvDeiVOju1MNmBizB8LA=
X-Received: by 2002:a5d:8257:: with SMTP id n23mr14198274ioo.165.1589819354158;
 Mon, 18 May 2020 09:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200424200135.28825-1-mathieu.poirier@linaro.org> <DB6PR0402MB2760B52EDFD1DB20AE0BDE3588B80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2760B52EDFD1DB20AE0BDE3588B80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 18 May 2020 10:29:03 -0600
Message-ID: <CANLsYkyMOxmM_4c-v1iiHfrrQ3HmbS2Yyr5PVWPRJcSULxrmxg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] remoteproc: Add support for synchronisaton with rproc
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "loic.pallardy@st.com" <loic.pallardy@st.com>,
        "arnaud.pouliquen@st.com" <arnaud.pouliquen@st.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 18 May 2020 at 07:28, Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: [PATCH v3 00/14] remoteproc: Add support for synchronisaton with
> > rproc
>
> What's the status of this thread? Will this be applied or requires a new v4?

It will not be applied as more work needs to be done.  As one of the
people this feature will benefit, it would be really nice if you could
take the time to comment on the solution that is brought forward.

>
> Thanks,
> Peng.
>
> >
> > This is the third revision of this series that tries to address the problem of
> > synchronising with a remote processor with as much flexibility as possible.
> >
> > Two things to pay attention to:
> >
> > 1) Function rproc_actuate() has been abandoned to avoid creating another
> >    way to start a remote processor from a kernel driver.  Arnaud expressed
> >    the opinion that it is semantically questionnable to synchronise with a
> >    remote processor when calling rproc_boot().  We could rename
> >    rproc_boot() to rproc_actuate() but I'll wait to see what other people
> >    think before doing so.
> >
> > 2) The allocation of the synchronisation states has been split from the
> >    remote processor allocation.  A new function rproc_set_state_machine()
> >    does all the work now.  Proceeding this way has made the patchset a
> >    lot more simple.
> >
> > Other than the above I have tried to address all the comments made on the
> > second revision.  If a comment was not addressed it simply fell through the
> > cracks rather than ignored.  In such a case please reiterate your point
> > of view and I'll be sure to address it.
> >
> > Applies cleanly on rproc-next (305ac5a766b1).
> >
> > Best regards,
> > Mathieu
> >
> > Mathieu Poirier (14):
> >   remoteproc: Make core operations optional
> >   remoteproc: Introduce function rproc_alloc_internals()
> >   remoteproc: Add new operation and flags for synchronistation
> >   remoteproc: Refactor function rproc_boot()
> >   remoteproc: Refactor function rproc_fw_boot()
> >   remoteproc: Refactor function rproc_trigger_auto_boot()
> >   remoteproc: Introducting new start and stop functions
> >   remoteproc: Call core functions based on synchronisation flag
> >   remoteproc: Deal with synchronisation when crashing
> >   remoteproc: Deal with synchronisation when shutting down
> >   remoteproc: Deal with synchronisation when changing FW image
> >   remoteproc: Introducing function rproc_set_state_machine()
> >   remoteproc: Document function rproc_set_state_machine()
> >   remoteproc: Expose synchronisation flags via debugfs
> >
> >  Documentation/remoteproc.txt             |  17 ++
> >  drivers/remoteproc/remoteproc_core.c     | 197
> > +++++++++++++++++++----
> >  drivers/remoteproc/remoteproc_debugfs.c  |  21 +++
> > drivers/remoteproc/remoteproc_internal.h | 123 +++++++++++++-
> >  drivers/remoteproc/remoteproc_sysfs.c    |  24 ++-
> >  include/linux/remoteproc.h               |  27 ++++
> >  6 files changed, 372 insertions(+), 37 deletions(-)
> >
> > --
> > 2.20.1
>
