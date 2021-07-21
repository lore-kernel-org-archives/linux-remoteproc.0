Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 234B6C636C9
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:16:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 080226101B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232948AbhGUEfc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Jul 2021 00:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232930AbhGUEfa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Jul 2021 00:35:30 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCA2C061762
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:16:07 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id s11-20020a4ae48b0000b02902667598672bso299483oov.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=V2Y9FK8B3XEt2CBNMnOBB1fSQfFtt/UMwPYA85/KD5s=;
        b=CKOk08I09kVqDyHTWl5Jm7LtpyXb0tS8INMXUBNAXqEuQVASWYEkI6ceQIVAd6KUU8
         VgOdlEmqvEWIHiSGa+JdsJioQNcICJ5QYAuX5Ouqgri/KnpBnYQkwjO6AC8P9Vn1h9SY
         2wonFd9Q6YFZIfn3RE51prrouC+J188ZTEPOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=V2Y9FK8B3XEt2CBNMnOBB1fSQfFtt/UMwPYA85/KD5s=;
        b=pkqtSXtHOem9NCVm68mUZKmvSXnVm6feKbKPGvfIaddCkVvo6UkOZH3BU2ZJmTxuwz
         SnkuZCRHMogDln9kMLI0p69hcZoVoe61quoFvTXR7fRP9UAddidjUkS1D04wz3mCP3/0
         Sh6E2xOl1d8KJuOAgsLcg5Yu8Uy7jyzTlGOlAsPQ0qLAwa8BatSd1h1jo0ZISXs4RZgu
         hm7+8JezW7QVaiz5yR/y5jQiRUm2SPPwI9IpKRFwFVpXRuId1aRZaOnFtC4yqoQRsjJM
         Sx5XPAYhVXTAjScoW2QWBM+d3JxUikP6Rk1jqjmLMjKKBSoH5qkqWl+lp701eQd2gRiA
         yyoA==
X-Gm-Message-State: AOAM532lV9n1Il9JENLqCqzB7OW5pqZCBS5cEHZuEA3KXjPSs124S7P/
        iw2aLKbztMZ9Db0v5NtXv/a1+r2B6UHszLMTP4KiKw==
X-Google-Smtp-Source: ABdhPJxCJYRZlniT0E2L1KJRisYCloErmXTq0V6N+52uVLiOm2L3iNt58JcJnkGTkkaUDS8usl2FRAroypRGXiSiFxs=
X-Received: by 2002:a4a:e206:: with SMTP id b6mr23323098oot.16.1626844566901;
 Tue, 20 Jul 2021 22:16:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:16:06 +0000
MIME-Version: 1.0
In-Reply-To: <1626755807-11865-13-git-send-email-sibis@codeaurora.org>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org> <1626755807-11865-13-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:16:06 +0000
Message-ID: <CAE-0n51BCqrbRx7g8vPHp-C_5L3owD-c720aiKqxoOVM9UyqkA@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] dt-bindings: msm/dp: Remove aoss-qmp header
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-07-19 21:36:46)
> Remove the unused aoss-qmp header from the list of includes.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
