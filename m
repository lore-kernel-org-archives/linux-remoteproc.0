Return-Path: <SRS0=Vkxm=5Z=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA62C2BA19
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Apr 2020 21:11:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F62C2072F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Apr 2020 21:11:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QFB1UIkF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbgDIVLD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Apr 2020 17:11:03 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34080 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727001AbgDIVLD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Apr 2020 17:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586466662;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=RtBDKwbJtd92jp7E6LtBd9yu+eRXqfVPRMTN3swQKxo=;
        b=QFB1UIkFbxcY4nktaOyKhTCnu1faqjo9nO+7+yOceW9ocSaKOlTvXezi3bRsh/dqjxzeWq
        PcExdp1HiRUl9V/JJVgaDrSV5MLhFvQAkc7AG2AJVrPaW8Kmeuz9k9ajb7W99bKtnM6KM1
        TI4pdnnKREntu/BfNZ1qwm20o2xgpUA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-Ikk1ydJJN52bvj_8O9PWTA-1; Thu, 09 Apr 2020 17:11:00 -0400
X-MC-Unique: Ikk1ydJJN52bvj_8O9PWTA-1
Received: by mail-wr1-f70.google.com with SMTP id 91so9774wro.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2020 14:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=RtBDKwbJtd92jp7E6LtBd9yu+eRXqfVPRMTN3swQKxo=;
        b=FeliDL4Roc1rbbS6t1MUOqCFNXnGUH6ssGK7Ub1aIFk5OVeL9c4aziHKItwW28uBec
         eVZT0jdDSVY89LRAnpst4Uwu75UfC39z5ltGkHLZGUEtqsUXtV/k2boJSmtx3C0MXBzn
         dI2jl0F4PO9xgIesWSr6avK3AcjABhy1rehL+rHUajwQOg73qlElB6xbjeJ5Gpw0eMdX
         3GvXEuTmhbx75Ioe0b8MeBnOz+nn9g59+aDcAxhz1ommaID8EUJ2kJngtQW4uKwGovoQ
         bho4t+jmm5Yzr4oW5jPyEUOpkxalaOUULR47QdOHAnGi5v1hjcufLQBnNoatdxA7i6pD
         W98g==
X-Gm-Message-State: AGi0PuaNB9I1x9gIHwkDTDpj0nsZOxpC8S55L9PunnJ1tHvGZjsBRACj
        jUZcnjsROd49CkqZc1WEDN3witzQbE13uuuULmfwW99tLyRW4VgbDaNMsC+VC9yrIhG+QsaGqQg
        /ZPxzH9vaia6JDU4F3eHeiWODDXR+sg==
X-Received: by 2002:a5d:4011:: with SMTP id n17mr1132444wrp.104.1586466658690;
        Thu, 09 Apr 2020 14:10:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypJabTxDz0WDx3biZbaja84PLZF34ZKZYgpYhxA8C4IQqw2wzmtgimWKqtv+yfhnsaBo2HvboA==
X-Received: by 2002:a5d:4011:: with SMTP id n17mr1132435wrp.104.1586466658564;
        Thu, 09 Apr 2020 14:10:58 -0700 (PDT)
Received: from redhat.com (bzq-109-67-97-76.red.bezeqint.net. [109.67.97.76])
        by smtp.gmail.com with ESMTPSA id o67sm5411345wmo.5.2020.04.09.14.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 14:10:58 -0700 (PDT)
Date:   Thu, 9 Apr 2020 17:10:56 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] remoteproc: pull in slab.h
Message-ID: <20200409211054.12091-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200409211056.vAlauhkdvx6twldQesCRcXMj21sPAKUNGbYodNEeCAk@z>

In preparation to virtio header changes, include slab.h directly as
this module is using it.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/remoteproc/stm32_rproc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a18f88044111..7ef931e9605c 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -19,6 +19,7 @@
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
+#include <linux/slab.h>
 #include <linux/workqueue.h>
 
 #include "remoteproc_internal.h"
-- 
MST

