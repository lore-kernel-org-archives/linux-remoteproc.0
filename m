Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B325EC4
	for <linux-remoteproc@vger.kernel.org>; Tue,  8 Oct 2024 00:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728345809; cv=none; b=XPl0+ap5/J0K7j5FAUNsZBfUHclGf8hlddenuhwQqs3EXvhEISz09XHLqwxvfI2miY8uC3ypMJ0WF34mwZgo/PNtAe1woWOOWTuUeEzP0wNYKH4TE7/hSO8HbmivDf3IoyPhxvZIs01quHpQS7a+PUH4rmVp6R34/jhwxHFaeSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728345809; c=relaxed/simple;
	bh=v/cGjRKPEtXmv7RwDeyzOSBu/wmVaWL2ZuBnO42bLf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YimUK8HtcF9lJbauGYJsWGITwCvYokT/yoPoQC7IYIcQers7axPq1WtJzTpr9JPxGdffpEsLTZHNgWi0gfp5IvPtUmIeOyOzwtKKChDpC0Wbn+yNH32PqmWVRhFmsqahMQBHRxc4eNJ4PgCxyG05uWQSnqUml+EkeLdHCaOafVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=AJaihXU3; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="AJaihXU3"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6cb2aaf4a73so52352286d6.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Oct 2024 17:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728345807; x=1728950607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bUhSEJ0yAaeMQ5+BVSRaapV0sFetukkSF95MlT02JR4=;
        b=AJaihXU3hl1mR+ywM7s4r6oByM0BQgArnjAk3i+CnTU47w0hIYmKtyCD9mlzd0+PF3
         D/CbI52KSpx2weCNeJ06HWdBLnQid8BYkBnuJJarzo587M5sSfgUT0GegHkHWt7yk29d
         EnWglgIXffkjmK33zQPqHdsKtfiTtHl3n9Aof0Cw33zMIQJ37YdfLTO0PEgH0zDnYncP
         dZIehlt92SBzHC4mBzwYrIKrAVfgTziXaIlPgjWJDJ1qABm2aU/KC/bHrER2jP1VhqES
         MTxpMnnzW1TOTfShcmpd24EWqBc/K0R5r4Z57wIoFnl3Xx08EfrJlIIFtgknRTPBKGKb
         UafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728345807; x=1728950607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bUhSEJ0yAaeMQ5+BVSRaapV0sFetukkSF95MlT02JR4=;
        b=l9QOxUALNvGf8WfFlw6Pw1pTa+qvktBDXVYHKPsX4z729kymfL/lnx8/tANo+fA/MC
         k8n/U+kYfc8sC+N+rCXNuSbRcf7pvMMvV4EVocytGLCJJWuMSla+KqHJeviUX/LKV1Nt
         IOnRVES1eUBF+ECsi1uqb/pbyTufGunLMFsb0hCFpjn7BA/Fa/3PPzgl5EX0tAoCFjc+
         PVGs+bJrB4dcgt25Lm8wr8YbrFIImVqolVepJe3twqXDUHXq6/sgSEIxKTh6TPc3ktTg
         TEagnX6ZtPejjlSvneKynVibXboqEHr0ytf/IvVfaY3YUBE6WTCBWBF7BpSL9OP6zIye
         JnMw==
X-Forwarded-Encrypted: i=1; AJvYcCXDtxaI0x+/FfSFf1gLAYBwx7x2jhUNvRFH1LxYWRlIdCqNbtxqU/GdnA83OLz/I27nkjpMiuVIBcSg5jFB5HuJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4slcRILESzg2fJ8W+ma+QW9nCO1d4h8WPL+Lm/uaDWpGVr/W/
	xuktE09MmnqMEeTrnmJGdVNlJSpxIJYSdxkrJ2RvYaaDaLB/iV/sYUzmc3XBD2c=
X-Google-Smtp-Source: AGHT+IEx3bklsQStYmee6ZmH3DEMApP2qVX1WSbpsnNhNBWyboJaq2oNlhHvvvoCROpV/zglNNL0Ew==
X-Received: by 2002:a05:6214:3386:b0:6c5:8ab0:60cc with SMTP id 6a1803df08f44-6cb9a472824mr193319236d6.40.1728345806863;
        Mon, 07 Oct 2024 17:03:26 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba46cad28sm30487096d6.18.2024.10.07.17.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 17:03:26 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] rpmsg: glink: use only lower 16-bits of param2 for CMD_OPEN name length
Date: Mon,  7 Oct 2024 19:59:35 -0400
Message-ID: <20241007235935.6216-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name len field of the CMD_OPEN packet is only 16-bits and the upper
16-bits of "param2" are a different "prio" field, which can be nonzero in
certain situations, and CMD_OPEN packets can be unexpectedly dropped
because of this.

Fix this by masking out the upper 16 bits of param2.

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/rpmsg/qcom_glink_native.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 0b2f290069080..b534b88db3f8e 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1204,7 +1204,8 @@ void qcom_glink_native_rx(struct qcom_glink *glink)
 			ret = qcom_glink_rx_open_ack(glink, param1);
 			break;
 		case GLINK_CMD_OPEN:
-			ret = qcom_glink_rx_defer(glink, param2);
+			/* upper 16 bits of param2 are the "prio" field */
+			ret = qcom_glink_rx_defer(glink, param2 & 0xffff);
 			break;
 		case GLINK_CMD_TX_DATA:
 		case GLINK_CMD_TX_DATA_CONT:
-- 
2.45.1

