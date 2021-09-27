Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB987C433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D90EF61156
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237155AbhI0U4B (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 16:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237154AbhI0Uzs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 16:55:48 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6C2C06177E
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:07 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so20484275otb.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CLIOcl1IgIP70HIyjnGDKwVdgfyDscgyVef7MoZJEAg=;
        b=PTNwR8PVNSrv7YQZx3p7yHkC/5e92tKupOR7mFOStUqya2ZogXxRRxbPKUGTj/6v4q
         XwQMk9x4PF9OhbU9figWuxy1cpj3/Qvq340fn0+x9BOatmYraEEEXbTC4cDwZrBhAa1f
         eOGE0AcsRZ+t+bhU18ayNbQCa7+u12l2A6J1oXI6EWN0/8CVjuneG1uF4VadsG+shzGf
         tC/9gFiw9Et1G9VglaIeJ355u8rlrJ86i7/mGKkixnDA4GuJOCO0sdrYvoLwRL4fJAXV
         fGuhqewzBHKN1MoyMkCLJv2T4GsDsA/H8R6Q1jCnrdFifH5oxZYiPNmAm6i/9eFdlx3c
         5FWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CLIOcl1IgIP70HIyjnGDKwVdgfyDscgyVef7MoZJEAg=;
        b=P9WRknO8PeSmKkld/8h3ii0cq5EdPEm+GeCVQlgCpqSL1op7CMFnDXAPLqxTwdr397
         sDRdwaKPcLe4UNYNw8wnUs98rS0RkwforOz4/FVpdeem/5dOlD6Pq1sKOvfOsLNQuV3M
         gFRTkfRO3iAg4JErfGADvgFSgFiUT8g2jAwTI8LFosKvqqeIiHXbG0izrtIvssnsMDEx
         2xgwd95VTcBFxBJUlIxrDBtowtc8tZujYNftTyAsv7g1G4JNTJAYB4p3sh1ndqJioW+X
         bhueGtciw1y8OiZrslhdjwLpSXF2efJV47v0e4FLTzzvnt9nHewFnfk4pzC27E15tAQV
         dg2A==
X-Gm-Message-State: AOAM531S74Cb/297Wtlj/NaXvnw/GI6ooq+l1BqmRdXSRyhdkKqB5ue1
        oR5S3qoaTbtzwXlryfhTH2FPPw==
X-Google-Smtp-Source: ABdhPJygKHIx5BBvE+/1JC6pSLOGif6kUTB0UJuQRpTi5uGkZgguAklmSqlKx2/99dTdeECkIQqqEg==
X-Received: by 2002:a05:6830:17da:: with SMTP id p26mr1860425ota.116.1632776046449;
        Mon, 27 Sep 2021 13:54:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l2sm455543otl.61.2021.09.27.13.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:54:06 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     swboyd@chromium.org, Sibi Sankar <sibis@codeaurora.org>,
        robh+dt@kernel.org, mka@chromium.org
Cc:     rjw@rjwysocki.net, ulf.hansson@linaro.org,
        mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ohad@wizery.com,
        rishabhb@codeaurora.org, sidgup@codeaurora.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        linux-remoteproc@vger.kernel.org, agross@kernel.org
Subject: Re: (subset) [PATCH v7 03/13] dt-bindings: remoteproc: qcom: Add QMP property
Date:   Mon, 27 Sep 2021 15:54:03 -0500
Message-Id: <163277598156.1471158.7182621010710936455.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631800770-371-4-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org> <1631800770-371-4-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 16 Sep 2021 19:29:20 +0530, Sibi Sankar wrote:
> Add Qualcomm Mailbox Protocol (QMP) property to replace the power domain
> exposed by the AOSS QMP node.
> 
> 

Applied, thanks!

[03/13] dt-bindings: remoteproc: qcom: Add QMP property
        commit: 8443ef7b5771830bc86c9e2c1622b55ddf33f0f5

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
