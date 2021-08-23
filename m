Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A03CC4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 20:14:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E22A613DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 20:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbhHWUPP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 Aug 2021 16:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbhHWUPO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Aug 2021 16:15:14 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A84C061757
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 13:14:32 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so39593781otk.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 13:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=imeFijr1ufQz/lyVbyX52fuMyimnJkFupP8Ym2EmTQo=;
        b=kIQLdC4l7hlpNTMxCAbMmy0l5zXzSOn85mn4Y1Lyvye5+7+wJ/9HAFxD7fWcE3+5B4
         5ijwMcBoO5e8PI16oP7CZ+c+KiJJm3dj51IxjfoiqxbshKwSperqs66DniUnS6ruQIDv
         sm4uUCQhJN4iiCp2GovuPFeW9UgadiAiIIvM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=imeFijr1ufQz/lyVbyX52fuMyimnJkFupP8Ym2EmTQo=;
        b=owL7zGANv8lZC05WFg3D1e8nqKymRdxRZZXxrFnTy5EEgI+R/M2W8GW4AVahhgAS8/
         fSGzil34gHUzshlZ62KLNR9kVMYVunJpCOSwcpxmDDQktaPRdzMDyjurkQS+wKjsDBMf
         eJ26FmuhbDaMVpoOEDuT+06P3530C9Ms+utf3M1JRTpxAXqNXgqJelDku0ZnCQnrCh7V
         y/Weony6K8lBqL+Q8M3VasCYOUfbtkgZflXODGgd7isRkjjUZc1c57enCvrGzE6t2GAU
         yiVRt5tXIYR+jn66GKGQo7tHb2yvtGZWvSyGqhMG59NgHYXDrkm9uUDog/pSJnhA7LYu
         mceQ==
X-Gm-Message-State: AOAM531g1NszinTp/e9E2R47vbYbEjRtzF9BwLtHJZEdy9ytNVUDmXTa
        pqU1r5ArcA7PJRQEMe4+meZvoH5L8RKy0OfxjS1MBw==
X-Google-Smtp-Source: ABdhPJw2HcWyJlmraQaLOXE+VoqCAcv4OB/hNC1N5xlm5WxZRCrdxX8xQZ/oi0DgFlhYMnxtW2ar3P94+BlSUgfx+iQ=
X-Received: by 2002:a05:6830:2b24:: with SMTP id l36mr12752645otv.25.1629749671375;
 Mon, 23 Aug 2021 13:14:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Aug 2021 15:14:30 -0500
MIME-Version: 1.0
In-Reply-To: <1629344185-27368-3-git-send-email-sibis@codeaurora.org>
References: <1629344185-27368-1-git-send-email-sibis@codeaurora.org> <1629344185-27368-3-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 23 Aug 2021 15:14:30 -0500
Message-ID: <CAE-0n52PEJnsW1bGNZcRuRJVaAPK2CHn9jepjNvRy6=BearZNg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] remoteproc: qcom: pas: Add SC7280 Modem support
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-08-18 20:36:17)
> Add support for booting the Modem DSP found on QTI SC7280 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
