Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62494C4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 499C761052
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237119AbhI0U42 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 16:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237202AbhI0U4M (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 16:56:12 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D5CC06120D
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:10 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso26151798ota.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sWnZyTphdDZe5u0D1r/ElDTD3TO7HnP/sS1mclgplsM=;
        b=fIrR1pfST8fkgbklbWioDGRIIrCcLfA6m32qQgtV+7bXgkI7FM8F8PWFfNGYeufkcM
         eWEj2KutQsCq/omhkZIXGwjMyguBzuhnOe2AT2ueVxcxCAoIZ9xdwoRd4BwbC2W0x9KQ
         vcHzgnA5o73GgaU7Ssoh1F/p8jZ5QZ+0Td2SRCSLzxc4zt9qYAaaycWNfCHhPJva5Mnt
         FWVHVDCdwxMtuIxXjpjwcElXAddSl4YgUHOZjmUKBrgXGIqEVxLuU2eSo+WOrf1mqtb9
         CeOn+5gxhOlpqhbgnIVAtvtxamaIIWjEDKSZdYsEdsWY3Q6YcBvltD14DyPDs+beql9I
         +7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sWnZyTphdDZe5u0D1r/ElDTD3TO7HnP/sS1mclgplsM=;
        b=BNsbeFZg3Ma0IrGqVHLacdr82/XM1n5TkUbAHAWuwR3Bs+Neq4riymbezBRDDUxu/3
         RwjewTKyEyMCxK3wizrHFCW6H0WsXTitlsOJx3og0AsksPk1i/ahoXUf0K5vnvbQQjLx
         sb7ocnvqqaFHP0bBHqhQuAYoen/+HjignK7FEvaoj1epSIYU7EgWD4tRwiAMfWNqOQRx
         YFFJLZWifml3EhWwsvdQZnG3GfcOWOtV9Wzk9cge+QTG8koSRbjDfw7ZbQkN+xKGF5GC
         CllO2cBL2dzTwgOd0bVbJIBobNvS2tdTXhGHxCdB0pKtSYij5Vec0IWdRO+bw2cJ/u6p
         N9/w==
X-Gm-Message-State: AOAM533LWN1BJKISza2nD9BftWFsBqQeOWeGmTdWwWq0NGy5dnA9X7gp
        9Wd1kzKj60Y5MujoYl5FtocAMQ==
X-Google-Smtp-Source: ABdhPJyQy/YjQ2ajpYdAZm8ENqhdbf4HH3uUcOOX3tC3NDqP+y7F0PBDcsVw79yBZ+Y/7dOgvWzyTA==
X-Received: by 2002:a05:6830:4182:: with SMTP id r2mr1882403otu.242.1632776049751;
        Mon, 27 Sep 2021 13:54:09 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z10sm4187275otq.64.2021.09.27.13.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:54:09 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mka@chromium.org, robh+dt@kernel.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, sidgup@codeaurora.org, dianders@chromium.org,
        linux-remoteproc@vger.kernel.org, rishabhb@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rjw@rjwysocki.net, mathieu.poirier@linaro.org,
        ulf.hansson@linaro.org, devicetree@vger.kernel.org,
        agross@kernel.org
Subject: Re: (subset) [PATCH v7 13/13] dt-bindings: soc: qcom: aoss: Delete unused power-domain definitions
Date:   Mon, 27 Sep 2021 15:54:00 -0500
Message-Id: <163277593826.1470888.8272015889163734088.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631800770-371-14-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org> <1631800770-371-14-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 16 Sep 2021 19:29:30 +0530, Sibi Sankar wrote:
> Delete unused power-domain definitions exposed by AOSS QMP.
> 
> 

Applied, thanks!

[13/13] dt-bindings: soc: qcom: aoss: Delete unused power-domain definitions
        commit: e603577231d4d041eceeaf23c25935df5d008798

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
