Return-Path: <SRS0=fU6i=7P=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6C6C433DF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Jun 2020 17:44:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C4E820734
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Jun 2020 17:44:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TNRHxycB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgFBRoq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Jun 2020 13:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgFBRoq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Jun 2020 13:44:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE236C08C5C1
        for <linux-remoteproc@vger.kernel.org>; Tue,  2 Jun 2020 10:44:45 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 9so12169389ljc.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Jun 2020 10:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xDOkvD58QA3f73cYIc7o2aDM+rMQU8YmPi5IxgN7Hho=;
        b=TNRHxycBot0rD0InqvB135mTIELgu7+AfcZ01cygEWLmi46edoYtx+NiaAEqrd9UeM
         4Impt+STyojDEymNK4t8rvxknB3iG/Afk9VeA8WjfZA931hRWXa5d9ZO854oNzazPVdE
         aNQxQ6CYes2q3MOZUIiiMJgnYPyJtydYwIXqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xDOkvD58QA3f73cYIc7o2aDM+rMQU8YmPi5IxgN7Hho=;
        b=Iz+crrrksmnZ3w5xR9JarSfg2tSKAZAfR5t9osmz7ztB0yEcLC5QaQIuwFe8JVKJQp
         3xSAbziOZr0JZjmwb4Xb9h9Y+m6Bp/AU+qTHkejMi+aRUky3cec9AzGtBkwmDzgC/nR7
         PervNGPD8yKIXyJQxVwQRNIjei1pfnqO+9htti34AVAm2fk/7FbMSmwCH1x/iR28mBU2
         BPDR9qHE4NaO6QTgqmXpqnrtkAjGH2rJWhwZczbqYXABN4BfRPGWCRF7lEa7yi78Mjyf
         +H60oLS9uU2AxzIjnnLcxaXpnQN0y3pMT5uCTR35TQ9zjeqAOux0yYmfbcFcnvhH3wS3
         N3/A==
X-Gm-Message-State: AOAM532+Xa3gqpt+XKf1i1sqPU2mT9FK/QSexrqfI40u5WS4cPdZJdGI
        Zz+OxM3Rak8ivU+tbLxAvVw/HMY7mT8=
X-Google-Smtp-Source: ABdhPJyfPgtKyYikJy1bwoAjmCKzVBOu145NM+rVo7qxQjPYOHWjT/RVcbXS1YXKxojL3O+cyojx/A==
X-Received: by 2002:a05:651c:82:: with SMTP id 2mr105277ljq.341.1591119883649;
        Tue, 02 Jun 2020 10:44:43 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id t22sm559337lji.90.2020.06.02.10.44.42
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 10:44:42 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id c11so13666317ljn.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Jun 2020 10:44:42 -0700 (PDT)
X-Received: by 2002:a2e:a211:: with SMTP id h17mr113665ljm.289.1591119881856;
 Tue, 02 Jun 2020 10:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200602163257.26978-1-sibis@codeaurora.org>
In-Reply-To: <20200602163257.26978-1-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 2 Jun 2020 10:44:05 -0700
X-Gmail-Original-Message-ID: <CAE=gft7sbh_S_GiRohtMmdMN9JzQhG0m3bUerwrmzhjmXucGKw@mail.gmail.com>
Message-ID: <CAE=gft7sbh_S_GiRohtMmdMN9JzQhG0m3bUerwrmzhjmXucGKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: qcom: q6v5: Update running state before
 requesting stop
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Ohad Ben Cohen <ohad@wizery.com>, rohitkr@codeaurora.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jun 2, 2020 at 9:33 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Sometimes the stop triggers a watchdog rather than a stop-ack. Update
> the running state to false on requesting stop to skip the watchdog
> instead.
>
> Error Logs:
> $ echo stop > /sys/class/remoteproc/remoteproc0/state
> ipa 1e40000.ipa: received modem stopping event
> remoteproc-modem: watchdog received: sys_m_smsm_mpss.c:291:APPS force stop
> qcom-q6v5-mss 4080000.remoteproc-modem: port failed halt
> ipa 1e40000.ipa: received modem offline event
> remoteproc0: stopped remote processor 4080000.remoteproc-modem
>
> Fixes: 3b415c8fb263 ("remoteproc: q6v5: Extract common resource handling")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Are you sure you want to tolerate this behavior from MSS? This is a
graceful shutdown, modem shouldn't have a problem completing the
proper handshake. If they do, isn't that a bug on the modem side?

I just worry this will mask real issues that happen during graceful shutdown.
-Evan
