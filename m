Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8C2C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B3C3611BD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237159AbhI0Uzt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 16:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237102AbhI0Uzn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 16:55:43 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A14AC061575
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:05 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so26170943otb.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QIwgPSSQHgxcOX+HZutYjmJq8hD6ndb/lOWwpSSWBM0=;
        b=VgRlMUWb0nHEpLMeDVZEBLXeA+qq0E0n4GEyOI4U0L8nTMHSoy9kUHwkOq0UnsCkbV
         8sqNyQoRFput9KJbSwqWdW2hZqEuwZNaSKQ7rT04XPW2cdIGIK1LQYeTI3gT5pxXmBIz
         jz/yEOvF3Ba8ff4N+XTqZcflIc/swE1J2EJtHXlOg97htJD1XFT3rGYnxGNvPhLd6C67
         Lj72ByZkasMQv/jquuGRKzVr/zIB4XBbRUAr/5RhMifVxwnwdIVWsnWpBG2a2as7jNbs
         U572izc4vtDIQTCNf6jYq92TmGY7RxIKXa9smJ6MI65GoeIhwHdflujvBeQFQMOsyb7K
         aj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QIwgPSSQHgxcOX+HZutYjmJq8hD6ndb/lOWwpSSWBM0=;
        b=puWFMGn2NQj6agOx7gXF11iqdxiW3cvAJSR2FxgR0hV0X9pA9WaUkIU+mw6hA3CEn7
         gYMzcjVnnKcB1FQMeSlFPEZlCoxdGxK3bbrF4weGr0180wZeC0fGQkdmZNyCPRdhrATK
         37fta8jFKNFmirEmlxPdVuz/3+NmDjkMdqncCXZv6R4GvsykhJGlr5hMVv3pr7T2k+av
         feKig+lJlM79d0pRgK5TF7X9k8rrLvMCEOXhcgmbng3URHeKG+RUGVuaTp4Ln6vX9Irh
         rmfqYf35iY4FxILlVJ44XMWgPE7dnccfgHw6O4mWfFAiFUWcr/a9a4l76xrAr69VQ9gh
         2+bw==
X-Gm-Message-State: AOAM533D4E/xK7EE1rO+8RUQRbO3m54dEoj4TWK2XJzGCMIl9e0/rEef
        Cw0du5Etu9DHjGfxUPrq4dOGqA==
X-Google-Smtp-Source: ABdhPJwOgpjvQUCN8weej4mGl1TgFmw6x0d+nPcsr4BDtkWuYKr7ui8nz9eER9bZ8n7umclLVGI+Cg==
X-Received: by 2002:a05:6830:4d3:: with SMTP id s19mr1813026otd.246.1632776044975;
        Mon, 27 Sep 2021 13:54:04 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z10sm4187275otq.64.2021.09.27.13.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:54:04 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mka@chromium.org, robh+dt@kernel.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, sidgup@codeaurora.org,
        linux-remoteproc@vger.kernel.org, rishabhb@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rjw@rjwysocki.net, mathieu.poirier@linaro.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, agross@kernel.org
Subject: Re: (subset) [PATCH v7 08/13] arm64: dts: qcom: sm8150: Use QMP property to control load state
Date:   Mon, 27 Sep 2021 15:53:55 -0500
Message-Id: <163277593826.1470888.12011810685574573737.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631800770-371-9-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org> <1631800770-371-9-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 16 Sep 2021 19:29:25 +0530, Sibi Sankar wrote:
> Use the Qualcomm Mailbox Protocol (QMP) property to control the load
> state resources on SM8150 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
> 
> 

Applied, thanks!

[08/13] arm64: dts: qcom: sm8150: Use QMP property to control load state
        commit: d9d327f6a37f85a975cf9df9ecff60337586e7b0

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
