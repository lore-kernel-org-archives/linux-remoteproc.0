Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECBBC28D13
	for <linux-remoteproc@archiver.kernel.org>; Thu, 25 Aug 2022 14:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237857AbiHYOQr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 25 Aug 2022 10:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239876AbiHYOQo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 25 Aug 2022 10:16:44 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EF4A033C
        for <linux-remoteproc@vger.kernel.org>; Thu, 25 Aug 2022 07:16:42 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-33dc345ad78so33164907b3.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 25 Aug 2022 07:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=nXCJpuwFQLX9e3CMXxgoW79me3shJiCRXKDQrH02eAs=;
        b=ZbBJolCr4DYjf6jy/nYQ5jURUIju36iSSS4HTFbcxPljqYn8F+jWTkohOfT1hElik9
         U1mzVNE9jQasBZb1AG2L8vCPD0QSflzcjMQXMHuAR57Oo7H42UTyUZiS5KutjX6WM3vT
         IJdnGOmgNFuI9Dov3dsHi2B7IzqqzLb2v+dtSdE63N/wUVb/B4bVy2bRqvZVoMKiJJ+6
         0vQSgkqxoAd/ROxTrqhXHmolQgTYyPWU/olA5dQVovGN0jViNaQdL0JtDlw1vV6XYkTl
         /hKu6gW95De2n0FDuCq7gglQJLYGoPduCUZyEIenOVfXruksbMySZIIRZiysnSzljSxJ
         8SrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=nXCJpuwFQLX9e3CMXxgoW79me3shJiCRXKDQrH02eAs=;
        b=W7VMluxViqONWbgPQbcbGxwBH3yGnMC0KEr/vYjSF0crO7RcoqvSUO4CnW7JTyoxf5
         VNJOWyAbZBv3ooi6ifCL1LKO3bU8Jp9cwthzVwHqBLP3g5WF/twTzeFywlqZSknkHtc5
         +K52CXbLJx4pDIi4pmYsIuB+ZOdR4wtW3v7gCHE2zGwujRvEmcjHlSgMcD/U7OR/SQar
         juZZjinplzqXCKz/gaFfG102ZoDqB1IGKbnvRIMUSv2BEYJ0UfnhHYtCYaBgL/l6D9NY
         /kcpEiIfK1M+8VGaLuJauWnLLnZF+8LbgBgMNctoMB6om3eCfFxl/zJTAbCwXHYSKAwo
         HdnQ==
X-Gm-Message-State: ACgBeo06g7B34pKsnQLdg1pV6S/hUxqCrbpKUosEowiFMAMrhzi+kqHt
        /vz2bZ0WXpZEOY6DgnM0Fz7Wz3mg8UvO56+Bn6ExZnJVA3E5hA==
X-Google-Smtp-Source: AA6agR4uD7YPACWiF7ZYS7u8UunbyDnT5EvMK5ZXEDkMRwOnIYPAqhha+UUPfcfoc2BpXyM4FozGYNIyspGsajI5/Jo=
X-Received: by 2002:a25:340d:0:b0:696:4dbf:614a with SMTP id
 b13-20020a25340d000000b006964dbf614amr1121218yba.470.1661437000852; Thu, 25
 Aug 2022 07:16:40 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 25 Aug 2022 08:16:29 -0600
Message-ID: <CANLsYkxDULomhi_gADsQwyKbHHrZOjZG71P2VaiuF-00jvM+bQ@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for August 25th 2022
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

As expected the list did not change since the last update.  My current
goal for this cycle is to process the MT8165 and Xilinx patchsets,
which may or may not happen due to the demands from internal projects.

[PATCH v2 0/9] Add support for MT8195 SCP 2nd core
[PATCH v9 0/6] Add Xilinx RPU subsystem support
[PATCH 0/2] remoteproc: imx: add start up delay
[PATCH V4 0/6] remoteproc: imx_rproc: support i.MX8QM/QXP
[PATCH v4 0/3] Add support for WASP SoC on AVM router boards
