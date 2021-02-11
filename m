Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690B8C433E6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 07:59:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F62864E25
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 07:59:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhBKH6B (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 02:58:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhBKH4e (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 02:56:34 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A135C06174A
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Feb 2021 23:48:10 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id c44so1447818uad.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Feb 2021 23:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=eeioiNmHB4pmranN/p3Jvq/Ww7f0Yd78hVhQlsgFIRw=;
        b=XDzvXd6pFts2NXT9PlbmKKGVbYo2gU0aCvaviyqU16t6mLH9mr0/XK0VbkwWmiJ09r
         Ux3V2RezqkkSMKNRZpE0CHQF1k3FcYA7tah8XukWCJO3LE/j1Wm3Wo49AykQjp0dnuqa
         rwtXvTs2Vpumh2ai5NXgj6BTtAVf2NWQTc0c8jiP6xRZO9/cF5ZPddZn+YQKcGkK14DT
         hF3Eh/V6d1q0s2hLEAyuTB/BnyxgNuLC1IwZ3j4zYvdreimUSQOznRcMwd5nlmRf/xq6
         4JmcxOnp3cNOUQog63nmemzWCSA1rqKweLjjm+G2TlsNFEp6BuauCBFmGevDyxF/uKmQ
         VE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=eeioiNmHB4pmranN/p3Jvq/Ww7f0Yd78hVhQlsgFIRw=;
        b=I/T8+B2wDDhyFiVONdKvD308TOwekI/3Qys5uLYhZEtnTFdmuUMX+9ifiOL4ZvpR3Q
         wmAFHXIlOuql8M9OAaowRyr543FJV3V0IzA9jgc+Ao15dzeOqMMtlZutRwqb1yF93my5
         pR8zJlw2Oshim3AdXpTnMRYqMrk4+BrJfuoVZO7xbWCxOeixQcvP92ZAV/mvaflissj/
         1QxWZ6+2BImXR9RnmlKWTiXpPNtX90fX6WfgBswNv9zyFvAJ8yA2ftIJBP7YFEpGRUFZ
         utpIZVtwZgyzbOduDho0L04ft3UaBFgjMvdd1BDw087bfbAhMq/xw4qodeYOike1bcAA
         mLTA==
X-Gm-Message-State: AOAM532dqBVc4jZa4rAdsRROC1eZXsYlGywcTKCx5JUa8DMg3TI47Yny
        euA1zMR7uobc/dxokQdg4tOYMPcmdEVWk9tjETU0PdzuF3L3SQ==
X-Google-Smtp-Source: ABdhPJyuc2Bi6thxe+2F46TUOdJeiMaHpySB4wTdAACvusBFmZKFjmbkZ8tcZvC9QC3l2CWA1wmKuZ2htLCV9uPpN9I=
X-Received: by 2002:ab0:4d66:: with SMTP id k38mr4248175uag.101.1613029689460;
 Wed, 10 Feb 2021 23:48:09 -0800 (PST)
MIME-Version: 1.0
References: <CAD4Xxq8nmGENmWb5drWCmvDjpr5H8_+j9dSGq=NH8j6E9bvzHw@mail.gmail.com>
In-Reply-To: <CAD4Xxq8nmGENmWb5drWCmvDjpr5H8_+j9dSGq=NH8j6E9bvzHw@mail.gmail.com>
From:   Fisher Grubb <fisher.grubb@gmail.com>
Date:   Thu, 11 Feb 2021 17:48:08 +1000
Message-ID: <CAD4Xxq9po=OP8YdBVOgXtmJnR_UyJSsdRghuhAB_DGESx4jfnQ@mail.gmail.com>
Subject: Re: Troubleshooting steps for remoteproc modules
To:     linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi all,

I have general Linux and programming experience and so haven't delved
into the module code.
I'm running code/firmware on the PRU cores of the BeagleBone AI
(similar to the BeagleBone Black).

Yes, the pru_rproc kernel module is Texas Instruments specific, but it
should be based on the general remoteproc framework, and have a
standardised way of troubleshooting it to give me visibility of what
it is doing.

I've only found the following page for documentation:
https://www.kernel.org/doc/html/latest/staging/remoteproc.html

I can't see how to troubleshoot the module, such as command line
options, or through the sysfs if that's possible.

I know how to load firmware into the PRU cores using basic commands to
write words to files in sysfs, but a larger more complicated firmware
file crashes the module with a stack trace, or if it doesn't crash,
the firmware doesn't run on the PRU.

Where are the debug options and methods documented?

Thanks,
Fisher
