Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B171C4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3147D61178
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237108AbhI0Uzo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 16:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237085AbhI0Uzn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 16:55:43 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6767C061765
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:04 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so26205694otx.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BZVkpJLV/XXLQZJ50Xj3XzrOPPL7HHcijFCV0a29YkA=;
        b=wfBzAtd4jvP3IYOdPHHbpiH8y7dmv90x6BNVvsYvvQ1HILu4RvklIjvTABcs7ezeES
         hXeYdQOZKhs/wvV3Mmj1EaDF0Hsad4esQynCxfnkEPqXz0BIEvNDowOYXY7303dBNFZj
         YvCfrJkNjnLXQM87HENjvxTJI7Fd+6JTSLylpR8aTaJzAMBMLYiEM2x1+wVXaE+t/1WT
         A7+cu8V1KGvXgm/4xpzYXiA/D0L5NldSPpn8/zQNzqlFhSHJeXaOQexDOhPztr3uHOKG
         ow9j00ZYmXftVsIwy0WF86m3hWo83GdImzHOV/PLXcyfywdTGJ6uAFwjKXY5j6cqLRMC
         v7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BZVkpJLV/XXLQZJ50Xj3XzrOPPL7HHcijFCV0a29YkA=;
        b=vPar267e9qMhhhj8PUoyJ+GxR/HioGzQHp3ZXb02JOnYocn259syOxxmGD0GNGjDY9
         YaVpakb4kLGyw9ppyq2XbljQxp6fYeYU4U8VKXa514pdO/jqc7rb+nq4paC2lWXQ+Aiz
         GKq5F+woSr2zcLT09dC2NFgJy88ZxTEO1ZqZr7St+bqDfLKt1Idk8gMVgR0wBzGI77Od
         SZue8GDPyqKcqnTAogxDdbSaLvCmsXyC+/WCRZeEvJ5sv4+fo6Pit/zgA23Iv0DA2lir
         2F6/1E1AhckLdgqL/y8mQ01YQFaExFsx6NbQW3WXlF7tG1yoIw0kmyTDGPJuon3Vyuph
         4WxQ==
X-Gm-Message-State: AOAM532KbyksRrj4R3+KCpxFnJDiuhH8egjYWFMGUc0IA+a1pg9hZyK3
        a9bngRI9SFit/JP3lqU9azgjkQ==
X-Google-Smtp-Source: ABdhPJxdD8Kc4tIfKdPn5+Qyh6JUaOYyNyy5wWrhgIVLoYotaXVW8F4cm8bZ7nFg+KK8xPt71eDiDA==
X-Received: by 2002:a05:6830:2b27:: with SMTP id l39mr1856386otv.25.1632776044093;
        Mon, 27 Sep 2021 13:54:04 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z10sm4187275otq.64.2021.09.27.13.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:54:03 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mka@chromium.org, robh+dt@kernel.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, sidgup@codeaurora.org,
        linux-remoteproc@vger.kernel.org, rishabhb@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rjw@rjwysocki.net, mathieu.poirier@linaro.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, agross@kernel.org
Subject: Re: (subset) [PATCH v7 07/13] arm64: dts: qcom: sdm845: Use QMP property to control load state
Date:   Mon, 27 Sep 2021 15:53:54 -0500
Message-Id: <163277593825.1470888.17202064628738423573.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631800770-371-8-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org> <1631800770-371-8-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 16 Sep 2021 19:29:24 +0530, Sibi Sankar wrote:
> Use the Qualcomm Mailbox Protocol (QMP) property to control the load
> state resources on SDM845 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
> 
> 

Applied, thanks!

[07/13] arm64: dts: qcom: sdm845: Use QMP property to control load state
        commit: db8e45a81bdc5246f55c4000033bbdc886cde70f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
