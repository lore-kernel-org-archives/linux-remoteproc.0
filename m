Return-Path: <SRS0=mdwO=7H=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FBEC433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 25 May 2020 14:45:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B46012087D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 25 May 2020 14:45:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390995AbgEYOpI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 25 May 2020 10:45:08 -0400
Received: from mga04.intel.com ([192.55.52.120]:34251 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388687AbgEYOpI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 25 May 2020 10:45:08 -0400
IronPort-SDR: aSj6qCMU6QpAaizEQvm4856oAvM5tyujC3/OskY3R+gFxordj4SUU5gjdImhNt/+7EPUpO31Py
 UAPT2edmxJqw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2020 07:45:07 -0700
IronPort-SDR: 6ypkmFTWcIKAHA7Hm8v6dsnGPsORA/xeJdhKTTgXdl/gCm1i5k/AgukMh9D5rTCMzS3x7tNX+b
 YZI4MuMO41nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; 
   d="scan'208";a="266165840"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu.ger.corp.intel.com) ([10.249.41.109])
  by orsmga003.jf.intel.com with ESMTP; 25 May 2020 07:45:05 -0700
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     kvm@vger.kernel.org
Cc:     linux-remoteproc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        sound-open-firmware@alsa-project.org,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 2/5] vhost: (cosmetic) remove a superfluous variable initialisation
Date:   Mon, 25 May 2020 16:44:55 +0200
Message-Id: <20200525144458.8413-3-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525144458.8413-1-guennadi.liakhovetski@linux.intel.com>
References: <20200525144458.8413-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Even the compiler is able to figure out that in this case the
initialisation is superfluous.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/vhost/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 2f4383bb..2b9ad8a 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -895,7 +895,7 @@ static inline void __user *__vhost_get_user(struct vhost_virtqueue *vq,
 
 #define vhost_put_user(vq, x, ptr)		\
 ({ \
-	int ret = -EFAULT; \
+	int ret; \
 	if (!vq->iotlb) { \
 		ret = __put_user(x, ptr); \
 	} else { \
-- 
1.9.3

