Return-Path: <SRS0=93g6=7Q=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A434C433DF
	for <linux-remoteproc@archiver.kernel.org>; Wed,  3 Jun 2020 22:34:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17BC32067B
	for <linux-remoteproc@archiver.kernel.org>; Wed,  3 Jun 2020 22:34:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NI9BNZsZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgFCWei (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 3 Jun 2020 18:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgFCWei (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 3 Jun 2020 18:34:38 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06775C08C5C2
        for <linux-remoteproc@vger.kernel.org>; Wed,  3 Jun 2020 15:34:38 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c11so4844197ljn.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2020 15:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gh37isHiEa0VDwLfX8KuGahT8mC736+W9oMftFOpgb8=;
        b=NI9BNZsZdQDK5mmCBfvcf4CZuksZNkq/F+BU0OYIGjn/GXd8AdBMnwywGKwiM14KiN
         GWVeyJoC99OT1ioTuXeoMUNgTP79Fxp2VHsXm7dQjmmSbo+4nLiuCnHHp1TQP/yZuzdq
         NFblHC6HRzkHEyA/LHmf9UxTwF9isjRLAry8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gh37isHiEa0VDwLfX8KuGahT8mC736+W9oMftFOpgb8=;
        b=XKjrvtDzcgdUATrQWbUkzh2bH6FYovofAU0SA8cSvCKulP5Pi0alu/LZuiZN8vgUJ5
         0q+9RccMKtGZe/6TKoQPLyCwnX5vpxqz5rIdurrSEv46sICq3AFhA0BAO4MvZSE6vcq3
         oBnmX8CwAgWPp+fnDkkHN4N03pg4ciM7K0PKdU5rSUXVwdVz5Wb7SpFjnTIX6utBGdgf
         g18pfQ2eCysJjMqCf36/D6GsjMIBZgIPnx82mgYyx7V63zPHYmARuRx+eG0jUKOae7R1
         NXQkfd/nO8H/YEA90JtJs8tZXV2aPmRZ++cNKLiVkd4JyvJn/gZeSEzP8OykbbNyF8Bt
         lGHw==
X-Gm-Message-State: AOAM533n/WzUxyeXmCsNGPx9xPN7WPZWajFbE7vrF+YXHjPcnifYo7Qc
        mZI8LW4PGfZxAk+tzTbY9qUzQkJcGBE=
X-Google-Smtp-Source: ABdhPJxWro248eDsNfYGl+6MibnowTHDQf8FfCGIILQa2I39nsQPHftHb5r160A3kSIIDv4kzmf8bg==
X-Received: by 2002:a05:651c:112e:: with SMTP id e14mr624405ljo.338.1591223674231;
        Wed, 03 Jun 2020 15:34:34 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id v23sm171492ljg.122.2020.06.03.15.34.32
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2020 15:34:33 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id r125so2321084lff.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2020 15:34:32 -0700 (PDT)
X-Received: by 2002:a19:103:: with SMTP id 3mr827227lfb.196.1591223672262;
 Wed, 03 Jun 2020 15:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200602163257.26978-1-sibis@codeaurora.org> <CAE=gft7sbh_S_GiRohtMmdMN9JzQhG0m3bUerwrmzhjmXucGKw@mail.gmail.com>
 <6392c800b0be1cbabb8a241cf518ab4b@codeaurora.org>
In-Reply-To: <6392c800b0be1cbabb8a241cf518ab4b@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 3 Jun 2020 15:33:55 -0700
X-Gmail-Original-Message-ID: <CAE=gft4v1iHAPJS13fLBXgjt8ZRhD7q894zF_7JvK9QbiTbwhA@mail.gmail.com>
Message-ID: <CAE=gft4v1iHAPJS13fLBXgjt8ZRhD7q894zF_7JvK9QbiTbwhA@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: qcom: q6v5: Update running state before
 requesting stop
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Ohad Ben Cohen <ohad@wizery.com>, rohitkr@codeaurora.org,
        stable@vger.kernel.org, linux-kernel-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jun 2, 2020 at 10:29 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Evan,
> Thanks for taking time to review
> the series.
>
> On 2020-06-02 23:14, Evan Green wrote:
> > On Tue, Jun 2, 2020 at 9:33 AM Sibi Sankar <sibis@codeaurora.org>
> > wrote:
> >>
> >> Sometimes the stop triggers a watchdog rather than a stop-ack. Update
> >> the running state to false on requesting stop to skip the watchdog
> >> instead.
> >>
> >> Error Logs:
> >> $ echo stop > /sys/class/remoteproc/remoteproc0/state
> >> ipa 1e40000.ipa: received modem stopping event
> >> remoteproc-modem: watchdog received: sys_m_smsm_mpss.c:291:APPS force
> >> stop
> >> qcom-q6v5-mss 4080000.remoteproc-modem: port failed halt
> >> ipa 1e40000.ipa: received modem offline event
> >> remoteproc0: stopped remote processor 4080000.remoteproc-modem
> >>
> >> Fixes: 3b415c8fb263 ("remoteproc: q6v5: Extract common resource
> >> handling")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> >> ---
> >
> > Are you sure you want to tolerate this behavior from MSS? This is a
> > graceful shutdown, modem shouldn't have a problem completing the
> > proper handshake. If they do, isn't that a bug on the modem side?
>
> The graceful shutdown is achieved
> though sysmon (enabled using
> CONFIG_QCOM_SYSMON). When sysmon is
> enabled we get a shutdown-ack when we
> try to stop the modem, post which
> request stop is a basically a nop.
> Request stop is done to force stop
> the modem during failure cases (like
> rmtfs is not running and so on) and
> we do want to mask the wdog that we get
> during this scenario ( The locking
> already prevents the servicing of the
> wdog during shutdown, the check just
> prevents the scheduling of crash handler
> and err messages associated with it).
> Also this check was always present and
> was missed during common q6v5 resource
> helper migration, hence the unused
> running state in mss driver.

So you're saying that the intention of the ->running check already in
q6v5_wdog_interrupt() was to allow either the stop-ack or wdog
interrupt to complete the stop. This patch just fixes a regression
introduced during the refactor.
This patch seems ok to me then. It still sort of seems like a bug that
the modem responds arbitrarily in one of two ways, even to a "harsh"
shutdown request.

I wasn't aware of QCOM_SYSMON. Reading it now, It seems like kind of a
lot... do I really need all this? Can I get by with just remoteproc
stops?
Anyway, for this patch:

Reviewed-by: Evan Green <evgreen@chromium.org>
