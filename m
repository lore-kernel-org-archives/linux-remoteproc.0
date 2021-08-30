Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37AEC432BE
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Aug 2021 23:01:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C467760F6C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Aug 2021 23:01:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238987AbhH3XCL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 30 Aug 2021 19:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbhH3XCH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Aug 2021 19:02:07 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE015C061575
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Aug 2021 16:01:13 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id x10-20020a056830408a00b004f26cead745so20470380ott.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Aug 2021 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=SBvWEFE7ZHRV6dF93YeVztgkppDJ5iGt+SWnxMoR3Zo=;
        b=K2aL61yrvUo2pFacIrBVkLxIAHZ0ijDkNx0/BdyNj2ChxOpGGi2qY7C9FxzMzGGMOu
         I20sjcqzzPEaxBrwdCj351IE5YaIWm0Wx/E/ou/QxI9ebJ6K/zg86A+ujSPHIphzLG9K
         RA8odMrTuEgsYD1dRHXJAjSU2vAdSrFMTRgIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=SBvWEFE7ZHRV6dF93YeVztgkppDJ5iGt+SWnxMoR3Zo=;
        b=hcYnsB/cbfRQlAGQlgZjoTY+OZtXBTHQC5EykrFOwi8M+CTyrihx/XK5mLB/dH6AAJ
         /DsCIPyT3vAq8h77PZdIiIccJu5HieLXAWxZUtdbAgQxm1U6XP1qSj292XrrKmPfJIex
         kHY8gX4MG+7fDbnB0W7Jo+uBjVATmSHWFhIFiRmnusVzJ40sOBQ68vcdLy8EBM0ADxWk
         J0HkuBx9NcwTX5QkWqrJNQlxcL5pQBsAEbWgkgptF8OdpLT1L59QE77bMa2g2h/mMpLX
         +CqWCfFbrCYb0rHMgplWfl6zPw1N80ZUz6DVEDJ/P0t0btXXaNhYHF+q/pKTyf06J9Bo
         vErA==
X-Gm-Message-State: AOAM531m7XDvOivkwK1VCeSc1BspfC7T7cRCObMH1Kz5SeJrPiS6fsbm
        k8VmMVNVFmzQPIG+xvDBd+D1ysbhFwW7jF0DTFfMzQ==
X-Google-Smtp-Source: ABdhPJzSgj0nb7XkGDvk91kYGxUZ0WsaC4P3ErcshYBpH3DFM0ygLAqpUPjQZwKpE4ssB9Qo4tK9MMB77S1hsManWOI=
X-Received: by 2002:a9d:123:: with SMTP id 32mr22337333otu.124.1630364473117;
 Mon, 30 Aug 2021 16:01:13 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Aug 2021 16:01:12 -0700
MIME-Version: 1.0
In-Reply-To: <ff8ede00-008e-4dfb-7a39-19242d421462@codeaurora.org>
References: <1628161974-7182-1-git-send-email-deesin@codeaurora.org>
 <1628161974-7182-3-git-send-email-deesin@codeaurora.org> <CAE-0n50CM=DpXx7fzrcnWox+ZSfqvWuEb-R_rTP8ghR+bd54eA@mail.gmail.com>
 <ff8ede00-008e-4dfb-7a39-19242d421462@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 30 Aug 2021 16:01:12 -0700
Message-ID: <CAE-0n52YXvTzvK4B3Aggg1fcRyjy=+HzNADP315-J0iJ8bMWUQ@mail.gmail.com>
Subject: Re: [PATCH V5 2/2] soc: qcom: aoss: Add debugfs entry
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Deepak Kumar Singh (2021-08-30 04:46:53)
>
> On 8/5/2021 11:58 PM, Stephen Boyd wrote:
> > Quoting Deepak Kumar Singh (2021-08-05 04:12:54)
> >> It can be useful to control the different power states of various
> >> parts of hardware for device testing. Add a debugfs node for qmp so
> >> messages can be sent to aoss for debugging and testing purposes.
> > Is it ever useful after device testing? I'd prefer we not apply this
> > patch as it looks like testing code that won't ever be used after
> > developing this driver.
>
> This is not only for testing. Some user space clients can also use this
> to send messages to aoss.
>
> One such example is setting higher ddr frequency during boot and
> reducing it post boot from user space.
>

The debugfs file system should not be used by userspace to do things
like that. It's a debugging file system, not a configuration file
system. If you want to expose userspace control for this it needs to be
done in a different way.
