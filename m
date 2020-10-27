Return-Path: <SRS0=NYIK=EC=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A8AC4363A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Oct 2020 17:52:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8E00206DD
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Oct 2020 17:52:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ma8MrtpK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1822786AbgJ0Rw3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:52:29 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37775 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1822758AbgJ0Rw3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:52:29 -0400
Received: by mail-pf1-f193.google.com with SMTP id 126so1354381pfu.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2020 10:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=807sOLdqwgnAyj71IoZ5gIos6+0azuDGDEd483PBBLI=;
        b=ma8MrtpKWnvLHz9JdBhZmp3Bb1x9dZ9VDEljydi7sbfA58vIxGmi/rJR7xGJh34A9t
         2di7lSTtL/p3h3Y/vNXK0DfOBD5QUj6IG9C2+TINopx6/RGrbnl5/4WV+j7j854Gkwyb
         FOTbHpvQq/wJx0NGKTTbcpVF0N5s5omoG3hBW3EpDj3kmtqO0qmdE3CdgaFBFF32nDi+
         wIXADSibPCcXIYrScuFOZa75PAQc6XD/zzEjawwyhJjiB5UOAWbu5RVzPOiiezftYU1j
         XOevQ22B+EjBFLiNhfVaQPU87ADom08sCBlAyB+pabn6BhRT1jSuag4YTUIhqC0YNc6k
         fjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=807sOLdqwgnAyj71IoZ5gIos6+0azuDGDEd483PBBLI=;
        b=WQI4rHRtT3/1tg1wmPDYit7XY+P1V7dV6Hz2+OoVtBlPNCBSACRXFVeTUV7eGQCxaC
         y7DBV1LOvnP1PKqqi5tS9VtTWMBemk+rN+/Y3aod4h/4ZzLDn3PxZKYUu+Jz33uVEgq6
         FInrDdoDX00dnd1UxFliGToc6Uyx7JaYlVBJmnmgvZ01c5wD2gUI8iMY9qgwymacCJM8
         Nf/c1Skxgb3cYGzud3BPlru77dEekVitLV3NxtgRtc4ULnIgBmBnuDrTw9cck+30WFGQ
         JNBdlXzdt4EB8dzvbjgA67JAGExPX6i1KZ/KXgpf7RG3QIfa0VPRKWgh+5PLvnBc3GV/
         +mYA==
X-Gm-Message-State: AOAM533HBIDzNq8z3zbuNXiINEiSFDNgVZrvaHNwshUSOmYZPtIbc696
        EzX1Yg6nNQyQ7ailGlrvk+Uk2A==
X-Google-Smtp-Source: ABdhPJw6GaFY7swybF+dTqPUmiaT1hhGvUuDyS8QpPNK2sJv0otV705hGsfD2LEhNN0dgDxs97dxrg==
X-Received: by 2002:aa7:9192:0:b029:15c:ebd2:971c with SMTP id x18-20020aa791920000b029015cebd2971cmr3489331pfa.33.1603821147934;
        Tue, 27 Oct 2020 10:52:27 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r8sm2761225pgl.57.2020.10.27.10.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:52:27 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/8] rpmsg: virtio: Add rpmsg channel device ops
Date:   Tue, 27 Oct 2020 11:52:16 -0600
Message-Id: <20201027175218.1033609-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
References: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Implement the create and release of the RPMsg channel
for the RPMsg virtio bus.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 01f05bc570a4..ff8afee807cc 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -151,6 +151,8 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
 				  int len, u32 dst);
 static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
 					   u32 dst, void *data, int len);
+static struct rpmsg_device * __rpmsg_create_channel(struct virtproc_info *vrp,
+						    struct rpmsg_channel_info *chinfo);
 
 static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
 	.destroy_ept = virtio_rpmsg_destroy_ept,
@@ -255,6 +257,24 @@ static struct rpmsg_endpoint *__rpmsg_create_ept(struct virtproc_info *vrp,
 	return NULL;
 }
 
+static struct rpmsg_device *virtio_rpmsg_create_channel(struct rpmsg_device *rpdev,
+							struct rpmsg_channel_info *chinfo)
+{
+	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
+	struct virtproc_info *vrp = vch->vrp;
+
+	return __rpmsg_create_channel(vrp, chinfo);
+}
+
+static int virtio_rpmsg_release_channel(struct rpmsg_device *rpdev,
+					struct rpmsg_channel_info *chinfo)
+{
+	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
+	struct virtproc_info *vrp = vch->vrp;
+
+	return rpmsg_unregister_device(&vrp->vdev->dev, chinfo);
+}
+
 static struct rpmsg_endpoint *virtio_rpmsg_create_ept(struct rpmsg_device *rpdev,
 						      rpmsg_rx_cb_t cb,
 						      void *priv,
@@ -347,6 +367,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 }
 
 static const struct rpmsg_device_ops virtio_rpmsg_ops = {
+	.create_channel = virtio_rpmsg_create_channel,
+	.release_channel = virtio_rpmsg_release_channel,
 	.create_ept = virtio_rpmsg_create_ept,
 	.announce_create = virtio_rpmsg_announce_create,
 	.announce_destroy = virtio_rpmsg_announce_destroy,
-- 
2.25.1

