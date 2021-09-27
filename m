Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B724EC43219
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9ABC761247
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237074AbhI0Uzm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 16:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237028AbhI0Uzl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 16:55:41 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F54C061765
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:02 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so26178571otq.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TFKvhiE+AB9qfToF8fjgV3vn5rkI1BwN2aBTOC7rP0g=;
        b=ZSNfa6iCbS4fzBxZmRTJqRn7ELViMB2f7l093dSIzr5qW9IPMmJZ+6FesWA95Gqr47
         fkcqPIExWFr2TE8NWl/MtOmb82GvAq1YHEXkODsI3hJXBq3C5t2BMcN4VMogyu3punS1
         Meo6/faO57BEkUygnKR9BPs4kLfQ6DqQzQkImtfYUd3i876shrsNhhsAXA9SfetuYkjt
         ztSTY4+HL5bpvD9UQLpUroAz1Dm9DQW7ukJBc0zkoHW8Y1EekOu6X9dY5OSXcax2dFmM
         psBu43QCe2gcim026abWyBc0xrNC+AKly619lNf7gc175swozSkPWKmfvjzEgiPr+ZTJ
         RbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TFKvhiE+AB9qfToF8fjgV3vn5rkI1BwN2aBTOC7rP0g=;
        b=Tm4y3kNn7hXrZPCABM0ySMmZn+M/n29xruFxJDzJaonzdIak+RPmVTQLbCemwXWz1T
         25tdvSr2gV8coUJjwU+l5zlVtXJS2MIpv6pCbx3rA2A8q7ePbnVJESqIiQ9rawtWNPx3
         J0qPyUSWWCOrfVDkt/jtAXE5+M6yZkl5QzCeYdYYRG0rZbOkHCNR8TpfPdZHw19pIJQT
         2ORmF41fP39xYHq+40zLS4zektrsNvpAw7BKMznKVjaKEMTyIrsHKYLJuyOgvSrOsfIZ
         3sb6dMmfLHt3CgC+Zj6yYZmvuN1jYJK/5Z7Mk4no0QB6S8ZyC+GI05rg6onUj8Hfu8mv
         v8ig==
X-Gm-Message-State: AOAM531jJzT3OvOszXH/w5pSelmNLyDVw4tTlzgDUXEo4mR8+H4JZgbH
        AmgMkCqfU4SntyBCp5o92w/dYA==
X-Google-Smtp-Source: ABdhPJzxVVW2nyxXj5hHBv9ombPY38ONZfSAFxh8yCgUCbhNlGgLS7RKZX1IoM789Tn3NahfduZuxw==
X-Received: by 2002:a05:6830:25d6:: with SMTP id d22mr1869247otu.50.1632776042306;
        Mon, 27 Sep 2021 13:54:02 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z10sm4187275otq.64.2021.09.27.13.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:54:01 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mka@chromium.org, robh+dt@kernel.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, sidgup@codeaurora.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rishabhb@codeaurora.org, linux-arm-msm@vger.kernel.org,
        rjw@rjwysocki.net, mathieu.poirier@linaro.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, agross@kernel.org
Subject: Re: (subset) [PATCH v7 05/13] arm64: dts: qcom: sc7180: Use QMP property to control load state
Date:   Mon, 27 Sep 2021 15:53:52 -0500
Message-Id: <163277593825.1470888.4619664022427752254.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631800770-371-6-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org> <1631800770-371-6-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 16 Sep 2021 19:29:22 +0530, Sibi Sankar wrote:
> Use the Qualcomm Mailbox Protocol (QMP) property to control the load
> state resources on SC7180 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
> 
> 

Applied, thanks!

[05/13] arm64: dts: qcom: sc7180: Use QMP property to control load state
        commit: 135780456218e98172f3bca1e1af4ae6646d4bbe

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
