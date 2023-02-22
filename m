Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E347FC61DA4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Feb 2023 20:35:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbjBVUfE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 22 Feb 2023 15:35:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjBVUfE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Feb 2023 15:35:04 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE013800A
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Feb 2023 12:35:02 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso858345wmp.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Feb 2023 12:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qIgOqlAZTlluNKtzuSE3Yzf2NRovR/vxvhVAfwdPuMU=;
        b=FocXXwSzOfEWEKg28PNTu/I0W7hclTPrvS8aeD43MN8tMWcPGO+4Mc8HYoagFEVC9/
         wdWoBlMhW9dk9WPyC0xiD/v74+Azh8klBAEatlhQ+6KsJsG/P0AAlt8PwQUlXU2vHWQa
         uH1gK2OJ3IhMYZLzLZbX+cCwcV9+N/ckg/DjItrwdqLjoRrtkUWaX1Cs/0g/IA4l0DHe
         rQrKWdh0aePMuDspr9bIxhaUFuraM+YAtZRkqBhsMQNm56xM4IGcgONDVY1oWewMx7TI
         kg1TgIF2j5bsicxfgINzyZqVmFNEe+BuFmuSVBhRFE3b7JGEKvu2c9IGsxDNSb6N3xI6
         pehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qIgOqlAZTlluNKtzuSE3Yzf2NRovR/vxvhVAfwdPuMU=;
        b=ifLezNe68n/Ig27FtpAlSP9jkEItbAjS3q1mV4wKFKGZW+X8dcnvBj2CTRmaogQNUM
         mP1D24Api1hF5QobUwQ+Vp4e8Gdyl9OGxElo/rBYKmUDJrEQnlmS/iVigDD4/GVHNZR4
         vmJZzGNKtA8YJcQljgg64QY6lUFAlqCsYjWYa8h2C29mJtyFjFE7X5cCvdhBxcP8aZWH
         EzMWXAiXvlZ+Z7pMoWhuhnbv/88Y85sZfsSCl9gu22Oa/XYuol8xgnUrbfgETNjWpuFk
         JtN4l4/qLqmm/Vses/LCc5TfDsjv66XRNgPV8i4fCkKP7sDRiKELumOgaKjgjiTVLieF
         XHAw==
X-Gm-Message-State: AO0yUKXWoTSjk7sWuNl0BlGSzdCejNxTpCxfKnfLZ4dqWdoaRD0O3eUH
        mRlU2z1ZojnebebNdEbSQc4nPDtPqk7XQ89RSsDxZEqP44yOR4Ld
X-Google-Smtp-Source: AK7set++ZKUPJxBQsrIHPwfRyL4eJIJSWglW09aUvozvG+3ENyVWtcGqTKWcHkT9vB1PeG1syw0zqgQkcuyYLIko4jk=
X-Received: by 2002:a05:600c:1c17:b0:3e2:19f1:b3e6 with SMTP id
 j23-20020a05600c1c1700b003e219f1b3e6mr959419wms.33.1677098100521; Wed, 22 Feb
 2023 12:35:00 -0800 (PST)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 22 Feb 2023 13:34:49 -0700
Message-ID: <CANLsYkzx-DAXxuBK=yau6Xqf93RODTCPJBpuHOc4D=TzAJ5ZpA@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for February 22nd 2023
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH v5] remoteproc: imx_dsp_rproc: add custom memory copy
implementation for i.MX DSP Cores

NB: I will not be reviewing patches between now and the middle of next
week, normal cadence resuming on March 6th.
