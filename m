Return-Path: <SRS0=3tFr=C3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F49C43464
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 01:34:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 177B32075B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 01:34:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ExnwxyuO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgIRBeb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Sep 2020 21:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbgIRBeb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Sep 2020 21:34:31 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F12C06174A
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2020 18:34:31 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id y74so4891879iof.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2020 18:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wMfYmzq61BMVuIay6MAmJ92sX7yw34AC1En4dJC49nM=;
        b=ExnwxyuOZ5QMOqFjrHje1iqNp6G4EN6OIn/hhbVXhERcc2Hj8jQQiDqUgfcjXqbKJR
         nJC6Iap4LGotN7XE+YqDuuwkJusdLs1MoPK67eMhwgsxsxdb9iVWcyUiJxWREwjcA3BQ
         2D7GL9kz6Uw4uAtVWDLsPTZO6/5Vei+rvdiA8Fmit419cA8HElorA4GgkoWcfxv5knOe
         c8JqlY1WTGcOHnr0Fa8ouqQd0wNtZEgRFFMHM80XqZ3sgimqtx20knjoAmd9Fj16mckd
         5hhZoUa1rs/NlRAVfzkDmNM+D8g9FPIcEXYyGYmM6NzLkl13Xkt5M99Ds5lDAe9gS99E
         xHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wMfYmzq61BMVuIay6MAmJ92sX7yw34AC1En4dJC49nM=;
        b=AIeH5aEXxD5L6Og/QuJyggLKENIoWy5suknC9USKLQbKv3l+koOuToo5X1VTquu83A
         N8RKhgcHn9Ny7WEs+ZBWSNVOx4soPVbrhGHJBTdDSkKm/FwmiHYp6Jt1ZvGOV2Stqwpf
         meJTXEofhOW9l3lBrhAWvDcbAlxBCDKgDfMQqkVMZr9ktXXd+ytBdLjLogyUZMEjuZqW
         F+wWuaS8rI+Eo96U8WTMWC7g8/XqBmyNNk1fj6Xw783Tryk9/xmj+x8b3RPV6EuNjNzt
         tLdKCMfi0f3loNbrKRmzq5C4zH/0e1PWZl1AjDvpGVb0algnJXykYBgasU9n3URDFBHo
         C5pQ==
X-Gm-Message-State: AOAM53142cJlyZf6JQeJsr0I1NEakXfajREcXd+aaMJbukixqdVIQH5x
        5JzxlFH4273mmNe9CUIzjFxTLTYquLbML4eu7Ysz1g==
X-Google-Smtp-Source: ABdhPJw66SDlFRYI+47lgkH0zEhjVFqIUONt1+UdZYGerOhsCrn5ST22s+desHXe8eF/5qzEZsphVeuuWKzN1TY5lIg=
X-Received: by 2002:a02:605c:: with SMTP id d28mr28107291jaf.12.1600392870588;
 Thu, 17 Sep 2020 18:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200917063047.2875693-1-pihsun@chromium.org>
In-Reply-To: <20200917063047.2875693-1-pihsun@chromium.org>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 18 Sep 2020 09:34:19 +0800
Message-ID: <CA+Px+wVLBgzXm7FucaPpHRZ4+XeH629fPZYBZ33RtPSkaN9Fsg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/mediatek: Add support for mt8192 SCP
To:     Pi-Hsun Shih <pihsun@chromium.org>
Cc:     Tzung-Bi Shih <tzungbi@chromium.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 17, 2020 at 2:31 PM Pi-Hsun Shih <pihsun@chromium.org> wrote:
>
> Add support for mt8192 SCP.
>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>

Has done 1 round review on: https://crrev.com/c/2297082

> +#define MT8192_CORE0_R_GPR1            0x30044
> +#define MT8192_CORE0_R_GPR2            0x30048

Remove them because these 2 macros are unused now.

With that,
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
