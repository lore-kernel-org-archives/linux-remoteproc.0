Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4F7C43334
	for <linux-remoteproc@archiver.kernel.org>; Sun,  3 Jul 2022 04:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbiGCEAi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 3 Jul 2022 00:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232561AbiGCD7l (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 2 Jul 2022 23:59:41 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3EBDEDA
        for <linux-remoteproc@vger.kernel.org>; Sat,  2 Jul 2022 20:57:57 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-fe023ab520so8803623fac.10
        for <linux-remoteproc@vger.kernel.org>; Sat, 02 Jul 2022 20:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+cgJKCVi/2V6eyFeQPzpk+mpnAU8HPC3GWJwFDC+vfo=;
        b=a4SYQ4IUc+a//TQo+CTZWse4sF8lyrwCIrRNU2iDpmebDAM4y6KfFdCSi6y0FtPlKQ
         9TEago3b/gluuUPBw0AOeI2TRCCkR5UY4mWlsYSDq6leJy6rRGPH0KBedKTPOmB3iOg5
         Q1A1ZJpAHI8kmC/iqs6TV2vW+I2fKyunVp4Sv7pHFVtacZCWXONFZdtRBwdwdaC2qOF3
         sOSQZgqjNOPsNSASx+TON0IEIYWCoGIKHIyNHu3lL15Zw92xQKOT/h1uyRnHbWNOZ7jP
         yukvBpmuuiWf11pLv9vgO4TwbLQURx5lDunfj/hMugMVnUpL4xKZ/qxKva7ybb0XcvoB
         mIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+cgJKCVi/2V6eyFeQPzpk+mpnAU8HPC3GWJwFDC+vfo=;
        b=Zy7cwgsJOBZMlmjV31tu45ybt+4p7a69MrQexAJERLofkcwbg+zz3dMeyGQ/0FwWkU
         3VxJfVSJKa1n1aTeL8ZfkFus1HafUXC3udw/NDuCPA3+ANnndOY21xPp3TngN5T4UXGd
         47NVUSFu4B3w2lM3/8uxHU5bm+3qpCFLUWrJwwHSqNJEE4IovLLhwabaiTdC3ImlMg8q
         YvNjLxiRsgHGRwgOQzJLUK0miYslvT6Rs/J9fJfCbz2aLWbYFuw096EtPfOk2FBtetbF
         igbVLpoPMLIMTy1wfTVdEcs3rMfKbfrUzwofGkZKJgUDxDCRHzpVCPif0bu5Tk1rUx7f
         YlEQ==
X-Gm-Message-State: AJIora8iRjRNFQJZbuypMQUARoSgQlnWS76h7Y80McMTgMDTfaY177ob
        DYkrmU5AUCXBNGI3nYdtborPWqAWWfHItA==
X-Google-Smtp-Source: AGRyM1vFlk/n/OswdQIhCfHk0k7gq96bHLiamaLq7rhP6el3dczg6dSkn0/+kTjJTqCSfbsvBGktLg==
X-Received: by 2002:a05:6870:d79f:b0:f3:4962:7abc with SMTP id bd31-20020a056870d79f00b000f349627abcmr14321784oab.152.1656820677385;
        Sat, 02 Jul 2022 20:57:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:56 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/2] remoteproc: qcom: Fix handling of WCNSS IRQs
Date:   Sat,  2 Jul 2022 22:56:50 -0500
Message-Id: <165682055970.445910.10191741648290635149.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220526141740.15834-1-sireeshkodali1@gmail.com>
References: <20220526141740.15834-1-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 26 May 2022 19:47:38 +0530, Sireesh Kodali wrote:
> Due to a bug in the code that fetches the IRQs from the device tree, the
> optional "stop-ack" IRQ was never used, even if it was defined in the
> device tree. This also allowed a typo in the MSM8916 SoC device tree,
> where the "stop-ack" irq was instead labeled "stop".
> 
> The attached patches fix the handling of IRQs in the code, and fix the
> typo in the MSM8916 device tree.
> 
> [...]

Applied, thanks!

[1/2] remoteproc: qcom: wcnss: Fix handling of IRQs
      (no commit info)
[2/2] arm64: dts: qcom: msm8916: Fix typo in pronto remoteproc node
      commit: 5458d6f2827cd30218570f266b8d238417461f2f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
