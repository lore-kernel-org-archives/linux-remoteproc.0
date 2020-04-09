Return-Path: <SRS0=Vkxm=5Z=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F07C2BA19
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Apr 2020 21:10:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DAA82087E
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Apr 2020 21:10:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EVa4ckVb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbgDIVK5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Apr 2020 17:10:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28025 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727001AbgDIVK5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Apr 2020 17:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586466656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=77s3qEqZUXwYYItZCoNg0WQiFcIAKlBUF4mxWQL3Gog=;
        b=EVa4ckVbB/EyyUtshFDvrV2HC6d4324bq8phTl0VUquJv+RHjzpR/KfCg2/gGybS7lxzGx
        46tO5C8vt6aHtUIhz/mLhlUMVEae0W/GruxPjyUd1UB1kecNzIZS8ilcU3alxk3Sl7RhXy
        kPKlP77siYyHcnSxtLpnaOSqi7MiMf4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-Jh1Gd7D9Oh6D8g_iScxilQ-1; Thu, 09 Apr 2020 17:10:52 -0400
X-MC-Unique: Jh1Gd7D9Oh6D8g_iScxilQ-1
Received: by mail-wm1-f72.google.com with SMTP id 2so71843wmf.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2020 14:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=77s3qEqZUXwYYItZCoNg0WQiFcIAKlBUF4mxWQL3Gog=;
        b=sZjFTSpNIXwaUJyMCWknfAZgptwhnEtIQ0+dsE21Yyr++Yf/Q5lyaiCijXtlpmHW8a
         RUmXKLN2LPkhnjN7hAGc4D971ODvdFOVwujYWtnd0ufF9QuhWgnub+T0tU0ZZ501fDSS
         3Hi4QzSYmuLng4xYb3Rr8Gykx4qdu7ot7Ocjpf5GIW7nNh0IBGVVJjCqEtcH0LPumYD4
         CZQSC1QW+vGxWNJadhNWcXHNMOIExz5Ize439j7fA6yrPQxK23jOUjVbNAcwyHBII+qY
         mL5lRc6fX0A4KdOXhjvlwh8w3Bq+0vlMP4K/kGy4htZhkkI7jvrNg0jvAsqGHP8EiBiA
         A+CA==
X-Gm-Message-State: AGi0PuYHMZ7ydQk5mtxYGAMC8pIfvZZKPGC9cbS6JPM2bGej3C1m+jbO
        +2PTN05djSEV/m+6lA9E941VQFF6bA2yd1max+FQT9v/uOTBS+RBdsIU1Tm7BSHvfCif5Z/kWP2
        SGKFg9HyKbjcUgXbcMDk45motcdmL9w==
X-Received: by 2002:adf:e409:: with SMTP id g9mr1046822wrm.51.1586466651230;
        Thu, 09 Apr 2020 14:10:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypLy4PXbKq8mbP7kwgtN1Q+giosGvjsros8EbCALYN5EyYBQyGeYWvZCX+ftIrPSN/+taBS7uA==
X-Received: by 2002:adf:e409:: with SMTP id g9mr1046809wrm.51.1586466651031;
        Thu, 09 Apr 2020 14:10:51 -0700 (PDT)
Received: from redhat.com (bzq-109-67-97-76.red.bezeqint.net. [109.67.97.76])
        by smtp.gmail.com with ESMTPSA id f2sm6047650wro.59.2020.04.09.14.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 14:10:50 -0700 (PDT)
Date:   Thu, 9 Apr 2020 17:10:48 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] rpmsg: pull in slab.h
Message-ID: <20200409211045.12025-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200409211048.wTGYamRYEKgy9KPd5adjb78ebtQcIDXfK39Mxex28x8@z>

In preparation to virtio header changes, include slab.h directly as
this module is using it.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/rpmsg/mtk_rpmsg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 232aa4e40133..83f2b8804ee9 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -8,6 +8,7 @@
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
 #include <linux/rpmsg/mtk_rpmsg.h>
+#include <linux/slab.h>
 #include <linux/workqueue.h>
 
 #include "rpmsg_internal.h"
-- 
MST

