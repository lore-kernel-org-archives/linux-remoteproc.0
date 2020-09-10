Return-Path: <SRS0=MIpW=CT=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4804C43461
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Sep 2020 11:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E01B206BE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Sep 2020 11:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730082AbgIJLkX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Sep 2020 07:40:23 -0400
Received: from mga01.intel.com ([192.55.52.88]:26478 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729779AbgIJLOk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Sep 2020 07:14:40 -0400
IronPort-SDR: LGPPkhLH79C9yO2XvH+Mse9InR04ZMuiOmST0BngJ+ZjhCA1wOg/ldX9DNNLrB+rkV5Rez+Bap
 lT8xHJ0b3kjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="176571453"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; 
   d="scan'208";a="176571453"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 04:14:03 -0700
IronPort-SDR: XtgEWbX5vEGvUv2ceRqhLfJyQwJyzCzTXVPYYvbq5WWT6UqVYbUxIYcUSgWLsPopogA1/pfSNH
 e80Jvvq1Epew==
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; 
   d="scan'208";a="286530921"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu.ger.corp.intel.com) ([10.252.39.14])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 04:14:01 -0700
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
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH v7 1/3] vhost: convert VHOST_VSOCK_SET_RUNNING to a generic ioctl
Date:   Thu, 10 Sep 2020 13:13:49 +0200
Message-Id: <20200910111351.20526-2-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200910111351.20526-1-guennadi.liakhovetski@linux.intel.com>
References: <20200910111351.20526-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

VHOST_VSOCK_SET_RUNNING is used by the vhost vsock driver to perform
crucial VirtQueue initialisation, like assigning .private fields and
calling vhost_vq_init_access(), and clean up. However, this ioctl is
actually extremely useful for any vhost driver, that doesn't have a
side channel to inform it of a status change, e.g. upon a guest
reboot. This patch makes that ioctl generic, while preserving its
numeric value and also keeping the original alias.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 include/uapi/linux/vhost.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
index 75232185324a..11a4948b6216 100644
--- a/include/uapi/linux/vhost.h
+++ b/include/uapi/linux/vhost.h
@@ -97,6 +97,8 @@
 #define VHOST_SET_BACKEND_FEATURES _IOW(VHOST_VIRTIO, 0x25, __u64)
 #define VHOST_GET_BACKEND_FEATURES _IOR(VHOST_VIRTIO, 0x26, __u64)
 
+#define VHOST_SET_RUNNING _IOW(VHOST_VIRTIO, 0x61, int)
+
 /* VHOST_NET specific defines */
 
 /* Attach virtio net ring to a raw socket, or tap device.
@@ -118,7 +120,7 @@
 /* VHOST_VSOCK specific defines */
 
 #define VHOST_VSOCK_SET_GUEST_CID	_IOW(VHOST_VIRTIO, 0x60, __u64)
-#define VHOST_VSOCK_SET_RUNNING		_IOW(VHOST_VIRTIO, 0x61, int)
+#define VHOST_VSOCK_SET_RUNNING		VHOST_SET_RUNNING
 
 /* VHOST_VDPA specific defines */
 
-- 
2.28.0

