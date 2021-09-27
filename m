Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A30C4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16AB261052
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237325AbhI0U4S (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 16:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237231AbhI0U4A (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 16:56:00 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701ECC061254
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:08 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so26178940otq.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jYTXXROp3aX1NMBycc9RzQt/DwugfKW9fQbKK8RPVXU=;
        b=Elq1ONDomvbqwYGRiMNWKFo38sox/+9fBdHYiS0MKytSylE2boKfeZOJIXu5SaEwV/
         vWgTl/MFejIwPfrRqBlfdNVZsrBglnvZ6jji4WnM7AglBsN+1IibLzLxdmmgg195yvUJ
         1aTdvQk+h+TnApActDXM1TspO1nxdLdW13+ve8K8wWcE9NNbLec7zyIP0cTrCPwt17Gr
         o5o85ESLYOsIbxBj5i0uSXwxsuqzZB74onnk3XKvE41zrLX6iUhYpHXHhk/zJH6y6mAD
         YQy31x0rMUo3T83ANnS8WxgR1NC6g6dXt2sRHT5fw08OF0evj9sFPzn1TCX14+Lc2GlX
         nZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jYTXXROp3aX1NMBycc9RzQt/DwugfKW9fQbKK8RPVXU=;
        b=xp1fak08fgsb/A+nW1dL3aOKjF1KWxORUVrJhSxIL5SVmV0dLuBZy95mnFmLfyAq6k
         zqiwAt1FXbCM0NYg665MfJcFFQdmIdiXUwNuT+hOauAKXsgCPcR2GpfsgbbHdiYnpFgO
         jZl29ic7nvv2pnfn3W0WXjy39h8QH9Y3ZdzY0TYuxuyKyDLDN6SvM/yQepLl3n04l4Ft
         a3olCnUxo/ijuPZXybR1huM1u3Z67ATLKGmUNVbHhUJ6edVVov0cuHqYAIK8Rd5zy2x1
         vudzQDuGJ3gdnEGwxVZolr/ChLsCCVq63/IsOCEAVHLpE33XkYtH9DnnQzWoWHbFICoz
         VQSw==
X-Gm-Message-State: AOAM530j7fB94zF7tPFqnz/bwlDURGCwafv89KQrbFfpQYI+2lfW2i3d
        pyh4xdpGNjoVoN1UbMYLA8Jycg==
X-Google-Smtp-Source: ABdhPJylw1hG+IliHWudtH3y6ImeBsXzTXmvhAFWa0/Y4yn708jVIqpWevArbxf+btQkP8T++8nnaw==
X-Received: by 2002:a9d:7284:: with SMTP id t4mr1760104otj.285.1632776047761;
        Mon, 27 Sep 2021 13:54:07 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z10sm4187275otq.64.2021.09.27.13.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:54:07 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mka@chromium.org, robh+dt@kernel.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, sidgup@codeaurora.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rishabhb@codeaurora.org, linux-arm-msm@vger.kernel.org,
        rjw@rjwysocki.net, mathieu.poirier@linaro.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, agross@kernel.org
Subject: Re: (subset) [PATCH v7 11/13] soc: qcom: aoss: Drop power domain support
Date:   Mon, 27 Sep 2021 15:53:58 -0500
Message-Id: <163277593826.1470888.2234978122972156070.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631800770-371-12-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org> <1631800770-371-12-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 16 Sep 2021 19:29:28 +0530, Sibi Sankar wrote:
> Strip out the load state power-domain support from the driver since the
> low power mode signalling for the co-processors is now accessible through
> the direct qmp message send interface.
> 
> 

Applied, thanks!

[11/13] soc: qcom: aoss: Drop power domain support
        commit: 99512191f4f1dd4e0ad92e6f61ffe4d8a22aa3ba

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
