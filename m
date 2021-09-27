Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F110CC4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5132961074
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237215AbhI0Uz5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 16:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237121AbhI0Uzq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 16:55:46 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DAEC061772
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:06 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id d12-20020a05683025cc00b0054d8486c6b8so4160752otu.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MGYW2K0iuLK8RkBAXf2F5PgItucjdLFQiH7EkOY3vGw=;
        b=cBFf9BO83URzKYyMTmgPq43hBPhyJkeo8LtgtCbhO9EVCY6L10n/pMfWRdiVlKBkdd
         6w+VEL9jFqKoUKYNMvHzNF3sxsJ+oVX7LBcD89sr/REhe2heiK4yqHhroxcQNmKgZ6Ff
         spI9/s7iNlN2uXQ3cfkESDZDb1PukerJF/3mM3Zc+wZW+XGU/nUL+X9k0f4wGj3IKF0+
         dkHz5ORUqhubXWJSlKkeCMj9/FSAOs6W5Sy7h9+7hvuGlk2iz6/2+tRFauLMEMIC9Dyr
         PI7GxkCqoCO1mVwlOaIdFrTCMhHbi6eyysFnI6moIUPjHUIG97MOASHwh8aEDYfFpbF+
         ZGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MGYW2K0iuLK8RkBAXf2F5PgItucjdLFQiH7EkOY3vGw=;
        b=bAQc3Vmi/8iX/JdWbdBIHiYxjIyKoe37LIEA4C4LHDQqd/Zay/r+QLia78lKid3VXC
         BOcr9HuNeuJRUnJyGm+ycncDtPGfULYq/kbG4n9WnYqHqbxPnp+RCmQesnWgwGvDlPUA
         cNjc2ke309dv7CR+FKDG79IQolfgM1L5/ex/KiI5SyBcPfdjnqFVpo8uv678cNc4T4Ux
         Mp4S8Qm+QnR2flNdayzSI4VDeLg3UMeYemyHtg4MzCw9rDao/P3Baf9e4e2xgEExBqFi
         x9F0u55jJxEbioA0ZyN5rvIEM+dHICN5FBgnyAajoVUds+/vw/Gkl7FCEIkv6BD/Hi5q
         bDyw==
X-Gm-Message-State: AOAM532Bee9QXM7HiIUD+Xs8TpadbtMeQqmYcsVlt0YF12a3hnn0+5Yp
        fOKavKwKtja3CZ5lSiGIQLEMRg==
X-Google-Smtp-Source: ABdhPJx/pQIOSrHgQjJiLg69yRsvaUhSv8d5bYzxxsuy6moK/+MVgcvqHbjUTe8Mk3IlEJQ3gRMlRQ==
X-Received: by 2002:a05:6830:200d:: with SMTP id e13mr1849537otp.341.1632776045599;
        Mon, 27 Sep 2021 13:54:05 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l2sm455543otl.61.2021.09.27.13.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:54:05 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     robh+dt@kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        mka@chromium.org, swboyd@chromium.org
Cc:     rjw@rjwysocki.net, mathieu.poirier@linaro.org,
        ulf.hansson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ohad@wizery.com,
        rishabhb@codeaurora.org, sidgup@codeaurora.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        linux-remoteproc@vger.kernel.org, agross@kernel.org
Subject: Re: (subset) [PATCH v7 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP property
Date:   Mon, 27 Sep 2021 15:54:02 -0500
Message-Id: <163277598156.1471158.10663016354664633920.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631800770-371-3-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org> <1631800770-371-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 16 Sep 2021 19:29:19 +0530, Sibi Sankar wrote:
> The load state power-domain, used by the co-processors to notify the
> Always on Subsystem (AOSS) that a particular co-processor is up/down,
> suffers from the side-effect of changing states during suspend/resume.
> However the co-processors enter low-power modes independent to that of
> the application processor and their states are expected to remain
> unaltered across system suspend/resume cycles. To achieve this behavior
> let's drop the load state power-domain and replace them with the qmp
> property for all SoCs supporting low power mode signalling.
> 
> [...]

Applied, thanks!

[02/13] dt-bindings: remoteproc: qcom: pas: Add QMP property
        commit: e73c632b18a936b5489068d2418a58ea95b49469

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
