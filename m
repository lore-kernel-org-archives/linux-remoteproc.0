Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1DEC433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Sep 2021 19:42:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02A2260698
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Sep 2021 19:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242269AbhIMTnr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Sep 2021 15:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236893AbhIMTnr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Sep 2021 15:43:47 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73FF0C061574
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Sep 2021 12:42:31 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so14927302otq.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Sep 2021 12:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=BqyiYC70ZQUHHw9//0XYXSrAX8+tnM8/YgezErnlDrU=;
        b=e/ksqZ8nK4LM8K7qBzx6ztRoNrqG6PH8PC4yEvjbNVYCxAkYDmbjw+IMZbNNQPvF7R
         fAfXBrgXMcKl+IMNADZbsi5JOMxER5obm4NoKcY/o71HCmbu9xY+Fnt3rDf/PnxozAoe
         WlqJnz4bjYXgBaQmmKDkmPlCT/C9EH8dwVNhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=BqyiYC70ZQUHHw9//0XYXSrAX8+tnM8/YgezErnlDrU=;
        b=eRFZ8pvHDFB5cSZbs64c3EyDb9vgxi9RHMDNye4xQdUFDMGc1ZzPlW4RmelSY2FCo3
         ZfrgVP7RCSy9mBQ89wQktQvRI+n1jR/fxDASkgDy6/MtrAUQ/49O21CFXWf9bxH0HZCY
         agdLlaXqPjKzWBUsmMec5poxyy7tRcw2qv56S9TgrZyX7IPN/XM6MpGtV04x04Wcb3be
         RzXxW9m9URutygsYHjCySIk9979p5+4wwolBwjMtFB1Liybg4uyaSq3vceOeMevyya1A
         kMpokBC3CD34wtXVt5dofZtAOEpWFACQXBlbZ7osbobXsvoEHN+gxHbwakjQJtlnCZ1M
         zrbQ==
X-Gm-Message-State: AOAM532PoKYU+plQxNVOmYH/Gtk1ZRLySK02/CYRpHE3q3uXdcDubMdE
        IxCwdYRJzWq5NxQRB0ESDqEtIYojAQ2rn5dC7jw4jQ==
X-Google-Smtp-Source: ABdhPJwZ8mXUoFC7htDszmiW3cET2FEd1QCjxSbxY2/mXROYf8yoBexV2QICbOCDGNL/7hR7V6ReQxz2sOFr7dvaHZ8=
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr10734921otp.159.1631562150764;
 Mon, 13 Sep 2021 12:42:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Sep 2021 12:42:30 -0700
MIME-Version: 1.0
In-Reply-To: <4697bec1-af58-53e4-9fd1-293bfd8754be@codeaurora.org>
References: <1629108335-23463-1-git-send-email-deesin@codeaurora.org>
 <CAE-0n528DuP4MiAOhYY+Du+L=OZaGM5YJm=NwWia3JF7hp7sAA@mail.gmail.com> <4697bec1-af58-53e4-9fd1-293bfd8754be@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 13 Sep 2021 12:42:30 -0700
Message-ID: <CAE-0n51XcRbY7UeU6bhrrnkvD7rboq3QZFw9Tu0xQZ6e1VyjRw@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Deepak Kumar Singh (2021-09-13 10:45:19)
>
> On 8/17/2021 1:53 AM, Stephen Boyd wrote:
> >> +       ret = device_init_wakeup(&pdev->dev, true);
> > I still wonder if it's better to leave this off by default and only
> > enable it if the kernel is using autosuspend (PM_AUTOSLEEP). Then
> > userspace is responsible to decide if it can handle the wakeup with the
> > screen off, reload the remoteproc, and go back to suspend if it isn't
> > using autosuspend.
>
> Seems like not all targets use PM_AUTOSLEEP feature, even those targets
> may require wakeup to handle
>
> modem crash so that important modem events are not missed. I think we
> can keep wake up as default behavior
>
> and let the user space disable it through sysfs if it doesn't want it as
> wake up source.

I don't understand. What if userspace is simple and doesn't use
autosleep and will turn the screen on when the kernel resumes? Why do we
expect the modem crashing and causing the screen to turn on to be a good
user experience?
