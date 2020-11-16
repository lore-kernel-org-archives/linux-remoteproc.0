Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11961C55ABD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 09:10:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 992B622240
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 09:10:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nKf4wSaS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgKPIoe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 03:44:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbgKPIoe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 03:44:34 -0500
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B50B2C0613CF
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:44:32 -0800 (PST)
Received: by mail-qt1-x84a.google.com with SMTP id y5so9703125qtb.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=EYm0YpIuSEKXmoOwhp5dqYgsEVKwf0LgB8WVW+JP2iU=;
        b=nKf4wSaSa1Oa8WDBPXVMJS40jcU8haoimLiQE4LfvJHnlVTCGBPYDFtq64KX0dTsOr
         obCVwYpP64WhpR0b9chrWC0mfd4H5bO2PsZl1s7Etb/70r1OgMrFl/R8UFeI2/0wMnEO
         g4wFxUz0iKZ03GJiOe434LYHYNM7zKVuzQPa8861/k3RbQDcbfnPEWeK55g1taexjf4R
         pUTtXwPqyFjRXYBXQbsichx3gtULikKwqPwEPtE1HHC9JJf64SoJ3+aL24QGVJqswkx9
         VY0NY6kk/7z52wHBAFQFqxo7cWHhM5RIGxm2QW/FQcnmRPElsjd4ee/lsZps0rUEJh5y
         qJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=EYm0YpIuSEKXmoOwhp5dqYgsEVKwf0LgB8WVW+JP2iU=;
        b=FlG0GHS2z7H4qmDA+uSKmPwruqPmi6toXRlr4RTswHL0o0CsKNFGwYSdmpE6TQ3I74
         Pw5Zs797ZRKYK9aZMxXeiEeN0/xO1Jvpd9LbUUasBkt6miTCEjyXCfuBd4b/DbJPHTQf
         J5/aX1+TRQsRcVCFfplIZC6nDi4Qz/OGKUhUcB6g85Dvw3Qqm2ju7SwLcs7AVDQq9eqn
         NVTqWLRzdShyBWH5M0S8+JzYveIfMsPtvxnPR26mPAziL4qnmaRmtM+xARoMADKsNmNd
         kaCX8e4brjymx4mB1smvxVDKOZXMt8cC8/ZFcR35auy6kopMUTMWhrqsaB7aTL0tzZx6
         nkMA==
X-Gm-Message-State: AOAM5332fYItdYDu1VzKrXRfflC0I2DRgSIP85PFtXvdn95IMrFJXO/S
        JZwiYsMXVApUGivMTTv1Z+PgdsdGFwqB
X-Google-Smtp-Source: ABdhPJzNwWAgPW2u7kRBv4mmNN2RUlmEWb2T+8MS/r1URNN52cr2jtibw6055Yx7UYTLAjL3HZeWEe5EC4RK
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:df0f:: with SMTP id
 g15mr14565849qvl.19.1605516271856; Mon, 16 Nov 2020 00:44:31 -0800 (PST)
Date:   Mon, 16 Nov 2020 16:44:10 +0800
Message-Id: <20201116084413.3312631-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 0/3] remoteproc/mediatek: read IPI buffer offset from FW binary
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, pihsun@chromium.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This series reads the address of IPI (inter-processor-interrupt) shared
buffer from the FW binary itself.

The 1st patch fixes a boundary check bug.

The 2nd patch skips a program header to parse if filesz is 0.

The 3rd patch parses the FW binary to find the shared buffer address.

Changes from v1:
(https://patchwork.kernel.org/project/linux-arm-kernel/cover/20201113070207.836613-1-tzungbi@google.com/)
- rebase on top of some sparse error fixing
- update 3rd patch's commit message to the latest

The series bases on https://patchwork.kernel.org/project/linux-arm-kernel/cover/20201116082537.3287009-1-tzungbi@google.com/

Tzung-Bi Shih (3):
  remoteproc/mediatek: fix boundary check
  remoteproc/mediatek: skip if filesz is 0
  remoteproc/mediatek: read IPI buffer offset from FW

 drivers/remoteproc/mtk_scp.c | 89 +++++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 32 deletions(-)

-- 
2.29.2.299.gdc1121823c-goog

