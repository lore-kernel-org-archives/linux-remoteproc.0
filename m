Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9FDC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Oct 2021 17:23:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C564F60E8B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Oct 2021 17:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242245AbhJORZ2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 Oct 2021 13:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242221AbhJORZF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 Oct 2021 13:25:05 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039B3C0617A4
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 Oct 2021 10:22:27 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id s2-20020a4ac102000000b002b722c09046so3209580oop.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 Oct 2021 10:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NOr8pzngnOoluN8IhzRaL7unu/DMCmI7YndPBtKqBTM=;
        b=D7R/4vjLFk1GBToGO5KeCXyoAMsv2IBOINkrPoKX8f8kNamVnhmzlxSfv553uYgVAE
         L7CrBrHeZhIgJVj0Mc9QX1bZuZZDcWaLjMcBjuv9azRFJUu6MNU9j0W1Kzx2gLSzvmkU
         mWdp560Q1hT1+wjutMRJodCUGF+vJTmTfhMxN3WK6wT4I9t9aj1SWUxJRLclbUajPSfA
         YFU5JhkEnk37zKkytIWpK8sy7bWP0ceUm4fzPktEAvIiskzGypNViFa8z/9NQTlYxu0y
         wkzTUrgUHmqRLnjG5aRHaoa231ZIeQUVFPIj0mBdxZao2aeAvUVSTQPdPTy/KDthH86X
         MZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NOr8pzngnOoluN8IhzRaL7unu/DMCmI7YndPBtKqBTM=;
        b=lYTJS9nZ7gg9Yq5CVxNI5grWZtwqa+8Ais+mMVHY2KE2/XvlcVzqUs+7ed882v59Wh
         w8Zq0nZn8KMuLu7uVWY50lUXJU29W8Pt+OR5NxzfhN2rZ9hMycQ9DcncHNffAYmKOtvT
         ZOIBQTXF+ZWNuVxgvpTBW2UdmOYnb2FJTqpypccEQd5IchF+gnmKtgHXDTSdzoYPk2MD
         xNoECbSh+vq4wRcB6eT9m4SN3q2wfUkJ/qklfJCmp9mexh4tsYq9YlNYqBGeAebVADMY
         M8FXdFdV2CEUp+3AHjO2pmPA17zWQCFaZ/LXpumSAtbhna68e9KL5K9Dt1ah2Fb/DAgi
         7fPg==
X-Gm-Message-State: AOAM532sDLONeqtqaQGkaeoW119CpmVdZ2Pyr9k1QUTI3XnX1C+Icz0S
        O+69bxNliWc+aoN3Y1gJSJIEVhO9P7NgwA==
X-Google-Smtp-Source: ABdhPJwcx7VJeNUGF9c9OCtjA5yIDqNjQsjb5nUor4DYv0rMjxyybnDOOhFlxlxPCi/XIY+jzr8U/A==
X-Received: by 2002:a4a:395c:: with SMTP id x28mr9871171oog.98.1634318546333;
        Fri, 15 Oct 2021 10:22:26 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s206sm1289635oia.33.2021.10.15.10.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 10:22:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     clew@codeaurora.org, Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH V1 4/6] rpmsg: glink: Remove the rpmsg dev in close_ack
Date:   Fri, 15 Oct 2021 12:22:16 -0500
Message-Id: <163431847250.251657.12795071740054090512.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1596086296-28529-5-git-send-email-deesin@codeaurora.org>
References: <1596086296-28529-1-git-send-email-deesin@codeaurora.org> <1596086296-28529-5-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 30 Jul 2020 10:48:14 +0530, Deepak Kumar Singh wrote:
> From: Arun Kumar Neelakantam <aneela@codeaurora.org>
> 
> Un-register and register of rpmsg driver is sending invalid open_ack
> on closed channel.
> 
> To avoid sending invalid open_ack case unregister the rpmsg device
> after receiving the local_close_ack from remote side.
> 
> [...]

Applied, thanks!

[4/6] rpmsg: glink: Remove the rpmsg dev in close_ack
      commit: c7c182d4447e172f87e37d6c04879b94b8635b37

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
