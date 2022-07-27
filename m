Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D069C04A68
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jul 2022 18:53:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbiG0SxF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Jul 2022 14:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233397AbiG0Swu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jul 2022 14:52:50 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 689B812B3AD
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jul 2022 10:47:49 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id r3so31399952ybr.6
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jul 2022 10:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Kr3wJxW1BOXBhf9Lb1IPBwZDi9EE/NaLwegEySi4Vbw=;
        b=AaDFKzu7z4v2BeTWIQbqgrfMkBbeCZBGtHpE4bMaEARwlaTevY0BAUC5g55vivaI03
         cju/Uu2B7Jc/oicwO+Tb75HCTSD08POH48NhgKPnvJUYbgSnDmlLE5hVfo4zp4++36yV
         D1biJu6lopABmvjhRxfy20ht1k5efr2MgHlBCf39+2S4ywJpShjBunVFfgFwhVyxeZfU
         jp/OuILz064i8nBEtyWqj+Op7jxE4nFUlsaiuDQJ5vdTBFCfSNAsLpqOlIoC3ekYaWLd
         BzV90S6Tofh5mqGcwrO9mghwuV36KTuujw+HMx6aftg8z++8Zui9d4lQqo64ZeuzgDYy
         nxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Kr3wJxW1BOXBhf9Lb1IPBwZDi9EE/NaLwegEySi4Vbw=;
        b=Fx+VlbQxM7c4LwwgJYjDNuWONgUMCtuPrbcp5yboW/87c4E3ySDEsNm42TuE0tq6ZV
         Wcba3cNBI61OIHclVIh7XLTGP470dFuF6Wy/Ho7h4cUCq8gVqrI1vavUjg0slITmeMkB
         zYrtW/bns2/7ymAmrqGmAIFbFrT5Mc/iy86sU8tiV5bvIayEsRrb5S1w164iPpZD4oxx
         B314FvIfm3Tbq72ov0yGBKH32V2swSqDzxU1iY+5yQ9Q1N/x5JuI00FvEHUxx8WpGriw
         TadKYkgUYiSyeC1GeW04r0ly+fuWYgEd2DOk2ahzB6DH4pyXNNl8RAGymqJdKj01k/5j
         QQUg==
X-Gm-Message-State: AJIora/AsyK00aloogSoKsHQKxs4cTjlXlputkkdlRtyDvxfPvVPOKQv
        lJOo6tzKTut6VA9e63XCSwCPRewqZSpuQTnNji7+Zp8+gSuTTg==
X-Google-Smtp-Source: AGRyM1syJQ3yrevyCdJGMNtk4hs8cCGpduO+4Vqjnk+690Rp2PG9uNTPfi6ijyRmr8fwjKHsOZFv5wBI/tk5MFSF7jk=
X-Received: by 2002:a05:6902:4aa:b0:671:83dc:62f7 with SMTP id
 r10-20020a05690204aa00b0067183dc62f7mr2723349ybs.212.1658944067175; Wed, 27
 Jul 2022 10:47:47 -0700 (PDT)
MIME-Version: 1.0
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 27 Jul 2022 11:47:36 -0600
Message-ID: <CANLsYkydASa+Ry4ixmECL+SczcqGBK=1GjREZzvsR90v-PTTgg@mail.gmail.com>
Subject: [INFO] Remoteproc/RPMSG patchset review order for July 27th 2022
To:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

[PATCH v2 0/9] Add support for MT8195 SCP 2nd core
[PATCH v9 0/6] Add Xilinx RPU subsystem support
[PATCH 0/2] remoteproc: imx: add start up delay
[PATCH V4 0/6] remoteproc: imx_rproc: support i.MX8QM/QXP
[PATCH v4 0/3] Add support for WASP SoC on AVM router boards

* This list is unlikely to change between today and August 15th.
