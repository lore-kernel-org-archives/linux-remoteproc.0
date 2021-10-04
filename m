Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583D4C433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Oct 2021 17:10:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4029F61357
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Oct 2021 17:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238177AbhJDRLs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Oct 2021 13:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238201AbhJDRLo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Oct 2021 13:11:44 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A249C06174E
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Oct 2021 10:09:55 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id e66-20020a9d2ac8000000b0054da8bdf2aeso20252387otb.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Oct 2021 10:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LT/usi9lkR3sxtPUnMf6oj+ko7WPUt1cJEJz7aELEAo=;
        b=jNuv2yE4UDv7zGbLnC2X1DrfpOfR8QizEEldj8AquaCs840VPybNgrzpOcTJLOxZLL
         gev/rFYMXb3z+cFMG6ii2ghnm6O5QaqVbwHJ9llCxcDBtjFYNZQarwwXHbWXYCHN6ElC
         LTZhRUcdXejtslpouNHiBUSt7haJ+D4guB3wPz3eC+UJRz5wzpauSt6uk5f21oRdO4YA
         oLgI0rBXgfVhMNMMq7js8RUgKXxEU6X5J7FXA6mQ4Jk+3NkiK5+VXJUlW+CUeKGASXga
         rM+viVi03SyWBRKqsI5+OpK4VTNZmXAqDoZljKbJocM9KUOuzl0zuUiiFQlBzvA/VN59
         ps/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LT/usi9lkR3sxtPUnMf6oj+ko7WPUt1cJEJz7aELEAo=;
        b=fRGc6eSRMOIm8KrFQP4XU6Ju4Xasf13MQjLuome3eEF7QgWHpkrJe1sXGAGESLWncE
         D2CSSPK4aqk1xah5Hyohj2zfDBzlBkDAsu/xwpnSFdE7jkdB6xIasrxF2PZoIY+MX+u5
         7P7Ts/dROMFCoFMl1vzel+s/T3V6Iv/KRyF0YTn49Qt5HHjsy60+h2/lFp9bai/bQRnW
         uJRhSOY27JFTrUNgXKKH6TcSYpoxS8M2jV7F7wKNkLijbbXFX2kI6n1Bbx9NG/At7Mv1
         /cUmn5012dp0VfYM0YU5IbsNkRUSdjhetim66io1Pf82jHWFZ48hSL1UEIhWViRXbif2
         Zuzg==
X-Gm-Message-State: AOAM532vHdWWTBzQL7wd9WS0o3HkQss3yluGneFfOC04R+MosF3XcS7k
        4GySJtHQu7pSUxcF/x8ItWQN4Q==
X-Google-Smtp-Source: ABdhPJzEmh/NKBdy8hoxnATcd8pF8gWRDODmc1r6BgMBZmL6hXXJa1N0WCnzDsSXHlXfIOtJrhfxgQ==
X-Received: by 2002:a9d:604:: with SMTP id 4mr10538659otn.204.1633367394493;
        Mon, 04 Oct 2021 10:09:54 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id f2sm2822824oia.44.2021.10.04.10.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 10:09:53 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-amlogic@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: (subset) [PATCH] remoteproc: meson-mx-ao-arc: fix a bit test
Date:   Mon,  4 Oct 2021 12:09:53 -0500
Message-Id: <163336738469.343640.8547254698960330092.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004105257.GA27301@kili>
References: <20211004105257.GA27301@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 4 Oct 2021 13:52:57 +0300, Dan Carpenter wrote:
> The MESON_AO_RPROC_SRAM_USABLE_BITS macro is used like this:
> 
>         if (priv->sram_pa & ~MESON_AO_RPROC_SRAM_USABLE_BITS) {
>                 dev_err(dev, "SRAM address contains unusable bits\n");
> 
> The problem is that "->sram_pa" is type phys_addr_t which is potentially
> 64 bits.  That means the MESON_AO_RPROC_SRAM_USABLE_BITS macro needs to
> be a 64 bit type as well to ensure that high 32 bits are cleared.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: meson-mx-ao-arc: fix a bit test
      commit: faf88ed1c083017d1f4478f45c4f375e7a3f8bdc

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
