Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3218C636CA
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:35:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1B586120D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:35:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbhGUEys (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Jul 2021 00:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbhGUEyl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Jul 2021 00:54:41 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0855C061766
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:35:17 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id w188so1696374oif.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rQpCAkgrAskAus16qnKYoxQHVyMQBHW5oXvWVZnigD4=;
        b=AY48ZR0/TP2vWf9WOMHDdN0p8oa2/Q8ICxChYJZGaTTHtOyYx73/TDu6lmIJAOh1yV
         HwKcVqeOiqD+qmGcnydqp+Lo3izxP/Ec7rwn3tLVIEv1m7w17kiqx9J9UQCv63tPiloo
         U+YR10BceD8lfOzuCo7KaqKcwK59ahOKFux8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rQpCAkgrAskAus16qnKYoxQHVyMQBHW5oXvWVZnigD4=;
        b=QtH4po7K9y7+8FYHd0H/jtVpM1JXpxcR+YjlABlWLQDukTwqUlzNVugmQinpE6fqvu
         Z++4NDcwPckyuL8H+vevtTSnjY93FSZcX15qIUlZ+PKcIMekqSqNxHOJ5M10fqasZv4q
         Ghf2jHh0liUpCjKq6Gdda7hJ3ldOLrj1uwaxJDarnBqdM0UV3mKD0giou+WBeyND+5eO
         e3fJHc7usHwJjDxPg8xBVH42XXC+rfUv5GuI2qSeM4tPcW/7beYqECIIWfzJsnkB2AiU
         iYj5o+uQFMw9HkDFZVgkr49D61NgGmPjUXADgUQu62VKf/rfZKx8bdShD/lsB3unUkmi
         8iWg==
X-Gm-Message-State: AOAM531knMmwbFdR7wKPM7bBGOnR/xoqeYHMbNfYYxv/dyfKlO6FvAMr
        iyoDG4ewujkEXqPrnW1DoGnZsXZ809g3JYx2RqDZYQ==
X-Google-Smtp-Source: ABdhPJx+cEJmFIdjfVR6nkBubyn3UQ/HrY8tcpXWVQvhLG6AVVRisZBXAz1jWEpyGvSMCjScfmQngQhkvOasB5s06xA=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr4788233oiu.19.1626845717063;
 Tue, 20 Jul 2021 22:35:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:35:16 +0000
MIME-Version: 1.0
In-Reply-To: <1626755807-11865-12-git-send-email-sibis@codeaurora.org>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org> <1626755807-11865-12-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:35:16 +0000
Message-ID: <CAE-0n53WE+s_Xzpih-k2-7+T2zktvAGx9+gz8oV0pTerZZ4sYQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] soc: qcom: aoss: Drop power domain support
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

Quoting Sibi Sankar (2021-07-19 21:36:45)
> Strip out the load state power-domain support from the driver since the
> low power mode signalling for the co-processors is now accessible through
> the direct qmp message send interface.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
