Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE23C433F5
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 Oct 2021 00:30:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13A1760F70
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 Oct 2021 00:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244034AbhJIAcl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Oct 2021 20:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244025AbhJIAci (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Oct 2021 20:32:38 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BC5C061570
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Oct 2021 17:30:42 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id a3so15867234oid.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Oct 2021 17:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xavW1IJSPpG92dcmrs0mIel7JJLLlrZ32qaSmt56bpg=;
        b=VyLGY2RNQc+NYwjpMbg/3K54LnzhJ95Eo81UtMUqgOiMGzIo4GLU3eqD1FazIpib1V
         uiLg4dyYwGyCknCi5727OInWRw5SQTdTVVSXLL62NZw9V9d6SeaXv+55xP/nRR4oMwg/
         7pSoYYaNF4zPgW3rGtJDVVxSGogxMMmqael0zTefTazYUxiv+sTNcoVzkEJFXmZSHTIb
         G4ppRuXKZHbj5g0aj7TvfNbEXFHhvC+cSnr6xeMGLmUQEqHOljcF6iiGDXLx4tsuLoGW
         GULoLoT54fE6llF4+Sb2XuEZev2CfepYD6jkah2ZUFUxs1dIPXj3cy1VHHDAs6r4qDRX
         goLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xavW1IJSPpG92dcmrs0mIel7JJLLlrZ32qaSmt56bpg=;
        b=0xvanReEMRy9Mxn9LYh3WXw8wkLJIeqm245x13+FcvRikfk3aj3jMp7nWU+8+LUqFW
         ao0gAMfTi/h4aHbOBuU20xssUInig+roudDYNTfiF4zQqSEE3ZlzsEfObGsvHjaeVC89
         M9VU6tWW8dok16GTrxz3TWqt+1/hAqet4QsUlIULV9wYEbChfRuxbnwkACD7fceVhxV3
         nY4hNKb1f3aYbOKgcQr/NQ7unYyMsAwm6WYWN1KAAqyY+jRiYrjuUNwu6Wcyq2UR9vcr
         mcSZQIHyjQ2DYx/1p/gSc+5BGXozWIc1GhSFlnMn0v8zsFuwOp4L7jSfyuDtSjP24ABi
         CR3w==
X-Gm-Message-State: AOAM532hYgVDdVt32Quecq0nnjjWlMXPuwdSloV/d10f4pM5PN0S1ojJ
        Z94XnCg1D7n5FnC46/4nAU0TJw==
X-Google-Smtp-Source: ABdhPJzdewWNzDKPqqax9QLzvC1XQcc2v1dj9tqtwm1tL94Xv2JThYmzsiIUP4wjcbguhtmPCfZDzw==
X-Received: by 2002:aca:c60e:: with SMTP id w14mr9715359oif.156.1633739442388;
        Fri, 08 Oct 2021 17:30:42 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id bh39sm267605oib.37.2021.10.08.17.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 17:30:42 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mathieu.poirier@linaro.org, ohad@wizery.com,
        Cai Huoqing <caihuoqing@baidu.com>
Cc:     linux-remoteproc@vger.kernel.org
Subject: Re: (subset) [PATCH] rpmsg: virtio: Remove unused including <linux/of_device.h>
Date:   Fri,  8 Oct 2021 19:30:40 -0500
Message-Id: <163373942992.719534.3424106062185623232.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811123125.143-1-caihuoqing@baidu.com>
References: <20210811123125.143-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 11 Aug 2021 20:31:25 +0800, Cai Huoqing wrote:
> Remove including <linux/of_device.h> that don't need it.
> 
> 

Applied, thanks!

[1/1] rpmsg: virtio: Remove unused including <linux/of_device.h>
      commit: f0d1be1482aaab1aaadf68aa959f6d4c098a8e8f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
