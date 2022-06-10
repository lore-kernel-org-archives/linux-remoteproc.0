Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594A7C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Jun 2022 19:23:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237516AbiFJTXg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Jun 2022 15:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233646AbiFJTXf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Jun 2022 15:23:35 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB8E1994BC;
        Fri, 10 Jun 2022 12:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654889014; x=1686425014;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=OEgfxlw7bP1m8m+NqF0CGBsSHqVJi72KovP+YMxw29Y=;
  b=asIYgAEVHnas7AmAcqtPOYqcwlvIhXNP9KwmVA/dtc2i+SEpmFjkpv1c
   FH83Jr0FTqsiSpLadH3KdZIP7xx0HSdPfHWufNtaNKMjytBDfGX0kgTFd
   OfbPSVeXdkyP+Lv6ucgWTBtcTbIvSSfBFiNVMuy+vz/yW6PMc+911UmZz
   Q=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 10 Jun 2022 12:23:33 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 12:23:33 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 10 Jun 2022 12:23:33 -0700
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 10 Jun 2022 12:23:32 -0700
From:   Chris Lew <quic_clew@quicinc.com>
To:     <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_clew@quicinc.com>
Subject: [PATCH 0/2] Introduce helpers for carveout management
Date:   Fri, 10 Jun 2022 12:23:03 -0700
Message-ID: <1654888985-3846-1-git-send-email-quic_clew@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Currently remoteproc exposes APIs for devices outside of remoteproc
to allocate and add carveout resources to a remoteproc. These devices
may support the ability to reclaim these resources from a live
remoteproc. Add two helpers to help cleanup the references to the
carveout resources.

Chris Lew (2):
  remoteproc: core: Introduce rproc_del_carveout
  remoteproc: core: Introduce rproc_mem_entry_free

 drivers/remoteproc/remoteproc_core.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  2 ++
 2 files changed, 35 insertions(+)

-- 
2.7.4

