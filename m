Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3651DC433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Jan 2021 08:18:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D678A235DD
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Jan 2021 08:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbhAHISe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Jan 2021 03:18:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbhAHISe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Jan 2021 03:18:34 -0500
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D716EC0612F4
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Jan 2021 00:17:53 -0800 (PST)
Received: by mail-qk1-x749.google.com with SMTP id i82so8674963qke.19
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Jan 2021 00:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=h/f0Sezv5E7gowm2IVkdW/Hc+xS2w4KSaSPNUtJ3G4s=;
        b=NdP6wNH+93ntnELzijpUGrug3vc8TILMasJEq8bChHTeLhS9+UCzjJK/7ml/Y3BCI6
         zwBOso7tmkzW9SJtT4qx3fX3ljnozs0XQ1q/2McWW/WODq81JIxFWFgCbe3dDCwP3QIi
         SVMvmPLsmJCtAjPYWk/dife/BGsLOzS566JmI/Uxr6RaMPiPrY4GD4WLmn6QEVKSYFCl
         ukm0Ax08crXpSFYtS2HYyvSdt9sV+D+zjDgcBDmx3kLwSa6XrvnnWGiMOOSZFGre0rvW
         CxMpYZRAeTn69paSaaIVBTtLawZWZ7vOvACeG78GcYI0nUKAcTFboARmlbyz24/Skk2o
         XKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=h/f0Sezv5E7gowm2IVkdW/Hc+xS2w4KSaSPNUtJ3G4s=;
        b=qR5XWElFrD+WLl2I4YpaeYz4Y2GzfAJ61afZoACe/cDbvCKPEo9xptJTi5uMODC68A
         QVrwQbBGU1eaDUd9wxlVhcMo7AJ1OA4uCwJSduJNa1B2EMfTrp5R8uZMR2j/29EB/jK+
         HMRmu66pUqAxa7eapoQulNNE2tO/ls2OVaDslA65o7r/27klZjhyWtzKUNPp3Ft+l/JQ
         1PJvX9IFD2WWSmSavCTXNRNU2KdMDMx30mfx1J4FwDEWMZTUEWc7MmY5cD1HlNSe1Ihc
         4E/I/VHGj/0yisivLZ70oTnakTS/cwDaYXkU84UXYwfNglxGmyyO5IPhzuWV3codqBHt
         WjMg==
X-Gm-Message-State: AOAM532shSCGe9zRBf3qj+SgufEBpbYOtNgUUuOhPGMw4yeyvUUCBSU3
        thWMVzDNITw2C+9Vz4mTmWvM47WzKZ4O
X-Google-Smtp-Source: ABdhPJxH+xzloJvfPk+mEmyk1fhEyLc3F/iKaV5CFbzljxIu7V5/Ld0yM+l56aUf/z1P6Lnk5AWbn2pG4FLo
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:cb:: with SMTP id
 f11mr2346237qvs.15.1610093872893; Fri, 08 Jan 2021 00:17:52 -0800 (PST)
Date:   Fri,  8 Jan 2021 16:17:34 +0800
Message-Id: <20210108081738.2175224-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v2 0/4] remoteproc/mediatek: support L1TCM for MT8192 SCP
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, mathieu.poirier@linaro.org,
        devicetree@vger.kernel.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The series supports L1TCM which is a high performance memory region in
MT8192 SCP.

The 1st patch replaces platform_get_resource_byname() and
devm_ioremap_resource() pairs per [1] suggested.

The 2nd patch enables MPU for all memory regions.  The patch was
independent but merged to this series per [2] suggested.

The 3rd patch adds a new reg-name "l1tcm" for L1TCM.

The 4th patch supports L1TCM in the firmware loader.  Note that MT8192
SCP is still under development.  The patch breaks early MT8192 SCP
firmware which should only break our own development environment.

Changes from v1[3]:
- Adds 2 patches at beginning of the series.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201214050521.845396-3-tzungbi@google.com/#23879113
[2]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210107023020.3224002-1-tzungbi@google.com/#23879623
[3]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=401287

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
2.29.2.729.g45daf8777d-goog

