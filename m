Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87714C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 20 Oct 2021 04:23:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 683646115A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 20 Oct 2021 04:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhJTEZ4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Oct 2021 00:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhJTEZz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Oct 2021 00:25:55 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 214E7C06161C
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Oct 2021 21:23:42 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so5692451otb.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Oct 2021 21:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=yt6EiAAjEPG25gxsasjBuM4mbLF5niFnwtytBdS3uM4=;
        b=V8i9mBT4pzt31nb/yTOgV6BrKh8z8BsQDWk7s0MX2PHGJnVoK67pMRV8xfP4rpAkBN
         Es0EFPvV1x78CB+bKWoKeAOoC/wyPB+NbneN6TBel2p+y9L5wvSx2qj3CDta2t/T7/YH
         5GKQRZQH4ZP02WLwX7rBa5/z/iEeD26kDfUG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=yt6EiAAjEPG25gxsasjBuM4mbLF5niFnwtytBdS3uM4=;
        b=v+VHKy11kmFQNbor2Qr75wCdSHIELLbR7/mdefVqGCMJzlDKwNKqEOSh1/nRKcgP+s
         DWQX53KviW4Mn+/Akh1x9j7bUGubwj0DbhQO+8JdFqZr5WFSdEdzC+Zna2FM/6/LwC+A
         d0DKc43bQtAJjF/MavoV+HO54einuDV+RtIZTbvjsrP3pvyOVujUWkJYIH5VA6u68ZoC
         237Z57etVEGfCDi6Ft+/758/JANeHtx7Mu+Nhpjhcacz63wwR0+EbTSDijHhqveJSLLY
         iNq94scag+1lyb9Ae8A1spdDznquIjPr+jnRuwE0PvjhhacnDhjIXZErTgMI9O+Z52EL
         DREg==
X-Gm-Message-State: AOAM53147Cw+q1nAZOpwQVIivm/TUwOnD6uzZAAO3q6WTBokzq6ISzbF
        SgOfsfBIfI+MaO7uR8nsLQwl4EYwC/9Y61jTagcGhf3mIwc=
X-Google-Smtp-Source: ABdhPJzRCMQWM7zdErCHDQEAynoWxorVbftKDo7vaBbuguWxFCMzCOvIsdaPThCRFhI4ZZCxkXhlC+KZ+JSrUdMPVqI=
X-Received: by 2002:a05:6830:1c2e:: with SMTP id f14mr8355994ote.159.1634703821547;
 Tue, 19 Oct 2021 21:23:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Oct 2021 23:23:41 -0500
MIME-Version: 1.0
In-Reply-To: <20211019153823.477524-1-arnd@kernel.org>
References: <20211019153823.477524-1-arnd@kernel.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 19 Oct 2021 23:23:41 -0500
Message-ID: <CAE-0n53ZSkzAMkHH-VmBBHEykJnBY9njYcY0Xxnw+h9C0bWF5Q@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: fix linking against QMP
To:     Arnd Bergmann <arnd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Peng Fan <peng.fan@nxp.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Arnd Bergmann (2021-10-19 08:38:04)
> From: Arnd Bergmann <arnd@arndb.de>
>
> With QCOM_AOSS_QMP=m, the built-in q6v5 code fails to link:
>
> ld.lld: error: undefined symbol: qmp_send
> >>> referenced by qcom_q6v5.c
> >>>               remoteproc/qcom_q6v5.o:(q6v5_load_state_toggle) in archive drivers/built-in.a
>
> ld.lld: error: undefined symbol: qmp_get
> >>> referenced by qcom_q6v5.c
> >>>               remoteproc/qcom_q6v5.o:(qcom_q6v5_init) in archive drivers/built-in.a
>
> ld.lld: error: undefined symbol: qmp_put
> >>> referenced by qcom_q6v5.c
> >>>               remoteproc/qcom_q6v5.o:(qcom_q6v5_init) in archive drivers/built-in.a
> >>> referenced by qcom_q6v5.c
> >>>               remoteproc/qcom_q6v5.o:(qcom_q6v5_deinit) in archive drivers/built-in.a
>
> Apparently it is meant to work without that code, so add
> another hacky dependency to prevent the broken link, but
> explicitly allow it to be built without QCOM_AOSS_QMP.
>
> QCOM_Q6V5_COMMON is a hidden symbol, but add the dependency
> there anyway to give a hint in case another user comes up and
> misses gets this wrong again.
>
> Fixes: c1fe10d238c0 ("remoteproc: qcom: q6v5: Use qmp_send to update co-processor load state")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
