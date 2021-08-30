Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FAFC19F35
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Aug 2021 23:02:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFC4361004
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Aug 2021 23:02:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238962AbhH3XDW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 30 Aug 2021 19:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238916AbhH3XDV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Aug 2021 19:03:21 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEFBC061575
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Aug 2021 16:02:27 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso10214172otu.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Aug 2021 16:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=eWM4/3yTwD02gfJC9rFF7KdMYiNQBXaOsLgx6akWtD8=;
        b=PM1pNMQtWGrH46anjSbXZmaMSIzKWW6VD0gew5jdrK3kFfDUleakCbx5IVbIJtpEYa
         Oh2WMagW6w4u+oKA422fnZP3Su+eKmPeqyu/nEjhX0qewMS2UGVT87y/fgLyFFBp6t0D
         cTjAAYsEkR5GZ2oMR36LIt3oLM45RquoPiOqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=eWM4/3yTwD02gfJC9rFF7KdMYiNQBXaOsLgx6akWtD8=;
        b=pO1oOLoL11pg1fi5+ux37mIYu0fGoRSR/LaTg5Fdk38MDZPS/2dxI2SYjpZOznhMIS
         f3qxpSy5ifXlf7wtOh/m9arA+HJGI0Wxx0jjhkcQYglhYPT8IKU1WdNKRX5KzhDjVV8x
         4nK3JYJ7INxDqJsYcrDZ12yKyU4gE+pjPCtrWwMEOAG3/zBg/Wv6fQZSTTVx4/q38IbH
         OBkoq/R620TFXr7BWZoaVTRCf0XTQOqWl+YK9rDuSkh+qxo38HSQe+I4nWIGcg1HYR36
         RV7PUQOk7Zdb9fTcNxdkONeggmggkQzu6UqfooiG9wylsqFYl+H1idsRQb1V9liF4FWE
         NwPg==
X-Gm-Message-State: AOAM533Su8GWDE85IALVljF7imxWXIbqjy2LdhYN4HE0TIu9WmN9UdaG
        oihwM3r9lQk7DkWHIR9dr5403/bAmBzAF2Fb82PshA==
X-Google-Smtp-Source: ABdhPJyyuZmtDRvRnkmfPxPxg0ZfrKKxpTrd0LDO62OHgk8HUhCwm2cmZKKyWMG7q9pTFPFaQCbn6/Fld+sjB6K1R4o=
X-Received: by 2002:a9d:123:: with SMTP id 32mr22341511otu.124.1630364546432;
 Mon, 30 Aug 2021 16:02:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Aug 2021 16:02:26 -0700
MIME-Version: 1.0
In-Reply-To: <1630323451-7160-3-git-send-email-deesin@codeaurora.org>
References: <1630323451-7160-1-git-send-email-deesin@codeaurora.org> <1630323451-7160-3-git-send-email-deesin@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 30 Aug 2021 16:02:26 -0700
Message-ID: <CAE-0n500=1tF2V8nTTfPH3P-wCm8xs-J+9pLK=xfeOc1p=PB5A@mail.gmail.com>
Subject: Re: [PATCH V7 2/2] soc: qcom: aoss: Add debugfs entry
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Deepak Kumar Singh (2021-08-30 04:37:31)
> Some user space clients may require to change power states of various
> parts of hardware. Add a debugfs node for qmp so messages can be sent
> to aoss from user space.
>
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---

NAK. We don't want userspace to treat debugfs as an ABI. See
https://lore.kernel.org/r/CAE-0n52YXvTzvK4B3Aggg1fcRyjy=+HzNADP315-J0iJ8bMWUQ@mail.gmail.com
