Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF0DC433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:35:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43CDA2074B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 08:35:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbhA0Ifi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Jan 2021 03:35:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbhA0IdH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jan 2021 03:33:07 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A7FC061573
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jan 2021 00:32:25 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id t18so1621305ybb.22
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jan 2021 00:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=aKDeH71Tli9XQuLs5CYh8sW8w8ao2Xs2kCULImvJNK0=;
        b=t436uXBjJDL+yAOtaCIiKZx7xqFzhPjLrwAyt2lrxpY6ZeOSNRyktTvNjLFl24cMCq
         KxQCE6AnzrMEWkPgOKB2AB56npuFWUkiWZTJq9Z51GTIHlo2MPHhmx1RXK4r7ImMO95e
         uc7O7Z3acdjR8VnOtkAXney7xBK4KCd89aTR/S+i4FA689wAo/GF+lqMh7d2rWXuIp4a
         F2QF2nXOPUYQ0w1/UxIOJU2VhbS4ZYx4Bqzyzhj7DIfVxaHYqFzsL2S1UnNX9RIvBIFX
         ESecTmgJeJvVeIAgPWooU2VUCWpF78AicfLhkFw7VKz/+7PyrzjLC5NOXVv4xuCWsStX
         UnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=aKDeH71Tli9XQuLs5CYh8sW8w8ao2Xs2kCULImvJNK0=;
        b=hOga/siz0/vuLCRCSWy+CVFG5eb4lk0A7GQFoBwKpQjLssQRSxtBL/3ONNr08clhD4
         hvAgWIfU8htoOUvAQKXDBMPynDEWlOo8Kc9bxx8+Gb1pYsL5z2RF2LjMqR5lWFUbPThf
         KIAQMo50am+bMToRO+7166VEq9T5SCkNEm0g1JuDT2+IUBpzmSmogJjRMzeK6FkesSyI
         cUVQ9QGqkygot9Ggqj9xs0PYLseP40UZCLUZL0C7woW8vNkj1l7KLI/KIvYjjizh/bG0
         afYpZ/e/Ye6GPOiLKiHBfq8wSWlUgOxVu9mm+XqapNXEAKiOTkUT7Oz68m7fd+lqLFmP
         qDSw==
X-Gm-Message-State: AOAM530YejTOqgug8XxfTiuLT2dP8F94AohubE2ezcbqsb8zmO+LOWIF
        wpGYN5TK0ZhDtKXP895G4/zkwzKzougS
X-Google-Smtp-Source: ABdhPJwHk8ASW2v639pnmwmCI7M4JqSqFGoRe11lllt8D4Z21ok2zLpv3pYTVNGlFca6bOW/98GJg4yPQ7fI
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:d17d:c7bb:69a2:7e2f])
 (user=tzungbi job=sendgmr) by 2002:a25:b7d1:: with SMTP id
 u17mr15271518ybj.227.1611736345240; Wed, 27 Jan 2021 00:32:25 -0800 (PST)
Date:   Wed, 27 Jan 2021 16:31:32 +0800
Message-Id: <20210127083136.3745652-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v3 0/4] remoteproc/mediatek: support L1TCM for MT8192 SCP
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, mathieu.poirier@linaro.org,
        devicetree@vger.kernel.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The series applies after [1].

The series supports L1TCM which is a high performance memory region in
MT8192 SCP.

The 1st patch replaces platform_get_resource_byname() and
devm_ioremap_resource() pairs per [2] suggested.

The 2nd patch enables MPU for all memory regions.  The patch was
independent but merged to this series per [3] suggested.

The 3rd patch adds a new reg-name "l1tcm" for L1TCM.

The 4th patch supports L1TCM in the firmware loader.  Note that MT8192
SCP is still under development.  The patch breaks early MT8192 SCP
firmware which should only break our own development environment.

Changes from v2[4]:
- Rebases the series to [1].

Changes from v1[5]:
- Adds 2 patches at beginning of the series.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=422635
[2]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201214050521.845396-3-tzungbi@google.com/#23879113
[3]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210107023020.3224002-1-tzungbi@google.com/#23879623
[4]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=411065
[5]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=401287

Tzung-Bi Shih (4):
  remoteproc/mediatek: use devm_platform_ioremap_resource_byname
  remoteproc/mediatek: enable MPU for all memory regions in MT8192 SCP
  dt-bindings: remoteproc: mediatek: add L1TCM memory region
  remoteproc/mediatek: support L1TCM

 .../bindings/remoteproc/mtk,scp.txt           |  8 +--
 drivers/remoteproc/mtk_common.h               |  6 ++
 drivers/remoteproc/mtk_scp.c                  | 62 +++++++++++++++++--
 3 files changed, 68 insertions(+), 8 deletions(-)

-- 
2.30.0.280.ga3ce27912f-goog

