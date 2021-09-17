Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C41FC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Sep 2021 09:55:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EC1261212
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Sep 2021 09:55:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235124AbhIQJ43 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 17 Sep 2021 05:56:29 -0400
Received: from egress-ip33b.ess.de.barracuda.com ([18.185.115.237]:33816 "EHLO
        egress-ip33b.ess.de.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232046AbhIQJ42 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Sep 2021 05:56:28 -0400
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71]) by mx-outbound47-143.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Fri, 17 Sep 2021 09:55:04 +0000
Received: by mail-pj1-f71.google.com with SMTP id u3-20020a17090abb0300b0019567f8a277so7121976pjr.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Sep 2021 02:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dW2y3JpGEeNTiuBduWiPLB/E/rjHnmG0LPnJjV7yO2Y=;
        b=RKRs78g03q8Sc/JD4MyksBzoFOdBw8ALwTlWHj0Fl//5yxfXzq9jA6EPmU7/oEeqrR
         zWP4uNWt4+pBGSxXOWqapIgg+a1z1w27Ilfw/UYn0Bp1NEcoETrFyh+Ls5AiI/BeQavs
         hYHuSGeXXo1A+XIRjZdOonO4mgJ6lGDDqZuLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dW2y3JpGEeNTiuBduWiPLB/E/rjHnmG0LPnJjV7yO2Y=;
        b=0Auq+7ulgUf+SoYND4u8zPrC+QsMDJvh/CdOeWWYv/k4qaQGnXp9izh3zTtiHfv7eb
         nmO3HYpmgYisaD3CtQarzJX37iuMN7IqfRj0hvLyViCmmoz8DcVk8rdymHArz94oOVQw
         uBkSrmJTZTPrm13g6Qdxqm/SxmafQ4hNSYWmqFb6iEGHHmWe+bYnM/Qcc2VuMuIO8+M/
         qRx3A9pzgSoyJF3jum1VZoWPjy1/xS57NsOTHvaPUNp3vC1+Zu1MehS9yeDzh9AMMAdK
         oZiyLK+sCBNWS/DfBGVgwVCy8ehVDt1NuyuFQSZslHmullNPNsAzFG65issG+J19vhq2
         s9jA==
X-Gm-Message-State: AOAM530mPbO37q6PV0p9jV4lisIn7K6IrmufNaPEAa63/LJs6XTzJ9KD
        F0IsSU9N1tJtp2WpS6PGFE8PTAc4nY9/8pOuYfSLm0KrFj+jDG6j6iEpL0S3b+onqycvs+MPW47
        XWwgIwfNvA/0K2F93v8edthBNNdAM7/LI2I+GD69ZJQ9gBHSmBstPM9WhcViyy/qMXQ==
X-Received: by 2002:a63:6f42:: with SMTP id k63mr9022312pgc.358.1631872503379;
        Fri, 17 Sep 2021 02:55:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGYGkflcekoTfeEFHcJJ244092qVcUgtpuYJ5QZz7acdzg3s1jnSqxXRASV7/bL8hfMIoOKA==
X-Received: by 2002:a63:6f42:: with SMTP id k63mr9022298pgc.358.1631872503089;
        Fri, 17 Sep 2021 02:55:03 -0700 (PDT)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id p2sm6077333pgd.84.2021.09.17.02.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 02:55:02 -0700 (PDT)
From:   Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To:     Suman Anna <s-anna@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Sinthu Raja <sinthu.raja@ti.com>
Subject: [PATCH V3 0/2] dt-bindings: remoteproc: k3-r5f|dsp: Remove
Date:   Fri, 17 Sep 2021 15:24:24 +0530
Message-Id: <20210917095426.19277-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1631872503-312175-5440-1350-1
X-BESS-VER: 2019.1_20210916.2102
X-BESS-Apparent-Source-IP: 209.85.216.71
X-BESS-Outbound-Spam-Score: 0.20
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.234537 [from 
        cloudscan20-104.eu-central-1b.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
        0.20 PR0N_SUBJECT           META: Subject has letters around special characters (pr0n) 
        0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.20 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, PR0N_SUBJECT, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Sinthu Raja <sinthu.raja@ti.com>

Bjorn,

The series of patches are meant to help make the rproc bindings for K3
r5f and dsp support independent of board/platform involved. The current
examples get in the way of the device tree cleanups and new platform
introductions [1].

When applying this series, it would greatly help us if you could provide
us with a immutable tag for Nishanth to merge in and help introduce the
newer platforms that are blocked by this cleanup. See [2] for further
context of why we are requesting for immutable tag.

Changes in V3:
- Added r5f cleanup as well
- Commit message, $subject and simplification of the fixup.

V2: https://lore.kernel.org/all/20210818074030.1877-1-sinthu.raja@ti.com/
V1: https://lore.kernel.org/all/20210817152005.21575-1-sinthu.raja@ti.com/


Sinthu Raja (2):
  dt-bindings: remoteproc: k3-r5f: Remove board-specific compatible from
    DT example
  dt-bindings: remoteproc: k3-dsp: Remove board-specific compatible from
    DT example

 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml       | 4 +---
 .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

[1] https://lore.kernel.org/all/1631794913.472895.1119414.nullmailer@robh.at.kernel.org/ 
[2] https://lore.kernel.org/linux-arm-kernel/20210125141642.4yybjnklk3qsqjdy@steersman/
-- 
2.32.0

