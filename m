Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A036C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 557456103B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237335AbhI0U4T (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 16:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237232AbhI0U4A (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 16:56:00 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B2BC06176C
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:09 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id r43-20020a05683044ab00b0054716b40005so19289648otv.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tDdeGJOBBJPnUr7VImnSEIcCMtCi0Ce10ZXN5bmYag8=;
        b=atM9FD1vLwjuKqF62GySXevVlnqo9c+vQYnDxHviTkENroRpn+dr/wBJ6XMioj2r/h
         y2BYQ+N28ivFUzbibJbideDg2LAzovo8LBQXxUsvJs6a43cDTNOrj1E/DlXL4LbWwz9Y
         oVeLXr6SKEkLZhi3XnVHgsTCw0XYDQhy2fHo6zpN1IVt9td6sUKk6vOE6IN5CT82q5H+
         mC0x58QEWBpj4sNIY7HD0xLBHJje11R3jyl7XJoKMspASXvMUx+ia/a3nVfDeMnl/j0i
         EvfJce0uu3osOam1x6Pb+KPlTfpPbFkzxl8vSUcM3/gjLw2LjuzF8QWuAYI3XW2dsl/Y
         iiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tDdeGJOBBJPnUr7VImnSEIcCMtCi0Ce10ZXN5bmYag8=;
        b=Tp1S6cHD4BeNuyhQS2THLigeeCPRtaxD6WNvMdFIoOVWPH1p3FkadiCWVbaosnJKoq
         aN1YGLGlnlU8XAD5GRBEr5a/QtqFLUdj0Z/DCfI+8MasscMCY1X4OmT7pZ+x0lh0xoSx
         gQu8H58r+Q5+mHkbPPBEaY2Ym3xvPNfPmVSnM+g3UBJSZiXyZm53qXkpTqHmAdyRsnHw
         3jVNkNLiGmSAFyY+yNC396FafZEgPDGymk1LWyv/jApE+2YXaZ+/C9DBpD6mOw29oRwd
         ++dt0eYW3NTHTafnIYKX9CYLYLE+Gfan895f6Gr6uOPBNVnLTBAOLVknqwsai+dn1Vy2
         lqbw==
X-Gm-Message-State: AOAM531Jb4zkPdEzjDV6J0pNlk0E32Q9l47Bo0kkznbNoZLji+Ss/99b
        CGiP2Ypmb2YI7t+AcfHYpnNoAQ==
X-Google-Smtp-Source: ABdhPJx9/naDlVpyGLpe7FwzuSBOEDI0VynLTTxXxV9kV7yuqsfIfcaBlRc8XBGMhyFgcBE4DmSAcg==
X-Received: by 2002:a9d:6089:: with SMTP id m9mr1880131otj.64.1632776048758;
        Mon, 27 Sep 2021 13:54:08 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z10sm4187275otq.64.2021.09.27.13.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:54:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mka@chromium.org, robh+dt@kernel.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, sidgup@codeaurora.org,
        linux-remoteproc@vger.kernel.org, rishabhb@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rjw@rjwysocki.net, mathieu.poirier@linaro.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, agross@kernel.org
Subject: Re: (subset) [PATCH v7 12/13] dt-bindings: msm/dp: Remove aoss-qmp header
Date:   Mon, 27 Sep 2021 15:53:59 -0500
Message-Id: <163277593826.1470888.9821309633445465547.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631800770-371-13-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org> <1631800770-371-13-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 16 Sep 2021 19:29:29 +0530, Sibi Sankar wrote:
> Remove the unused aoss-qmp header from the list of includes.
> 
> 

Applied, thanks!

[12/13] dt-bindings: msm/dp: Remove aoss-qmp header
        commit: ec908595825ce84fb40e94a68b378f13c65076af

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
