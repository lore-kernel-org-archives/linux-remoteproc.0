Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F71C4332F
	for <linux-remoteproc@archiver.kernel.org>; Sat, 23 Apr 2022 03:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbiDWDtm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Apr 2022 23:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbiDWDtk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Apr 2022 23:49:40 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C882613977B
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Apr 2022 20:46:44 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id s21-20020a0568301e1500b006054da8e72dso6840925otr.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Apr 2022 20:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BnZnnoT6u17cMBvx4fLrAZ3WsP2xWB5sk2X09H1CnDM=;
        b=hdTEjnuZv9XtGnNhGZKUquL17GQijJsYQqWg99mOafGfcpkcY7UFB7rvtA9sJicnJC
         ZM74JKgQ7x5wYNJDeOUNh/oQeSQi1sSfeDTYs0OvgcIp0DlR/BgXYsuEqPRdabYHUxd7
         6o6HSTvwC/+uNc0cymZp2rTHZK+t7Q1JDda3I8CP16wR7cV8zd6r4eIpCBacshtd5nHw
         25DW6p5aCAyX0DjDvFgRqYyqmeN++2xUikOEIOuefdSSlzsx8DYVg2l+G3Rl5IN6YoZG
         Q5mO4tErVF0BtNV4i7zkbNbvtvLmONq7ZDPs+M+O5524WPG3cYDxgCwwsyJ2zrqSygF4
         DM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BnZnnoT6u17cMBvx4fLrAZ3WsP2xWB5sk2X09H1CnDM=;
        b=kmaO+oFTng4bq0fUgoxpBvE04Kmjfrf8MlbpWaE9xcsBZFyXlB//CWmnZNl7HMoUsR
         tQrYOwRE7pTop8S+zxkrh6y3nfEE2etok/eHllFyChcH65ZCt/AT0vzSRWymaPdK68ra
         VGi20VvsCWD/ifAx/1PXjmk59oJgF+zeUyOpdIqc1Z2CDSvXMzGgLcy9P/ugqCNqR+Ay
         kZ4nKvWS/j8bCRlsOyobEtTnxuyRb1UntvoGGVvdqubxFv/Itjj/WOVviGFDOldOF4AT
         SVo1RF+J4P5M8D5l9g3ApttF2k0EcyTus+vJ0F2g5inr/MDIk75X8wFT0n7m4YdqyODD
         VipA==
X-Gm-Message-State: AOAM532UznUncJvoGfsIE0syfX75OnxXbWw2WFAdzRmjU7OvKD4PPrmm
        utRyOC+u95+VtDHSQ4OVk9hBcQ==
X-Google-Smtp-Source: ABdhPJwNVlkRU9XfjQyZohjuLbvkF4wXDGfF5G/QoCISRFssL20unlfXkit1hpSKB2GRWTcmCn0aLQ==
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id 5-20020a9d0b85000000b005cb3eebd188mr2999911oth.77.1650685604127;
        Fri, 22 Apr 2022 20:46:44 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id b188-20020aca34c5000000b002da579c994dsm1440218oia.31.2022.04.22.20.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 20:46:43 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     cgel.zte@gmail.com, ohad@wizery.com
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
        Minghao Chi <chi.minghao@zte.com.cn>
Subject: Re: (subset) [PATCH] hwspinlock: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
Date:   Fri, 22 Apr 2022 22:46:40 -0500
Message-Id: <165068558593.2759280.12864119040707530948.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220418105508.2558696-1-chi.minghao@zte.com.cn>
References: <20220418105508.2558696-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 18 Apr 2022 10:55:08 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
> 
> 

Applied, thanks!

[1/1] hwspinlock: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
      commit: 0e01d176d5788f66dc64a7e61119edb56eb08339

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
