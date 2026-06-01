Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A885D3E1201
	for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2026 18:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338775; cv=none; b=Wkc+sT5qz+mgMJc3iWqv6WJuTU6WXlKHzDoXkruY2ozADNGzuJpjLzmkEw4UrIXHtBsdZTeREf79PAzkHlmOiVBPyUwlYPPSHwjjFFeAdrT4T0Z7MMKeBhV4hlrj6qbqpACECH7sRRFWwCIkGM7W72Gdwo9OLsj60JjvFgamLtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338775; c=relaxed/simple;
	bh=Y7RUPn+bAvsmJ/8/BG0ZaBGJijmKLA+fSDhd8Z8WAVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TMU3mvWDJSqF4yR+ATMLTJBs2C45PlGltVTrlN3fc78Ur3JCmBB5ilPAPx72jOZPdIXOmb+cHcrFVrsZmT1+czT1mRriLC3jUoNdjOME/MY7PiraGmPbr6BB3rzzd1IrgACem5AuE4BD8mk3m+zz0pxQC5QJoehymr54KuCA/pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mj+fMJJL; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mj+fMJJL"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9154ca1aa1dso229822385a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2026 11:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780338774; x=1780943574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDSNkPnmmQDSy+EDLfUh0gYRkI6FbvhYsuUIdnXlfv4=;
        b=Mj+fMJJL2e1wBG1Nt/cJW/4Z+iVrPBR+JngnZ1+kOrOIzTkG5jceEbVrVjZV5P04lB
         NkZxnd27sX+L29/htWIIh0DAvCx8yoXjdEcnUFr7PiyiPaW50UMZ24xV8kfIzDpPm0bU
         ntr1S/IiTyBSgnlyOw/u7gezVi9SiAHlWi6wdH1cXF7uS5gt0V5y0yv5gYmJoWvSRA0m
         nIdxHmUDIqLCicfylIIFg8b0yiESZRc9qKMmflAMemZ1ESyJTMJlZgU2P1SS+P8jaFQe
         aiR8f5cSh0dkbEuMhQehgzJy1JgXSKq+2U4KiWBmp3QxE+l5trpKCAG0ORlxu8XJh9EP
         FH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338774; x=1780943574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDSNkPnmmQDSy+EDLfUh0gYRkI6FbvhYsuUIdnXlfv4=;
        b=gtuAq6+MRnQ52FqMCa5WMwTu7sN9Y6Vk83RHJJxfqSSy52ZcS1dSPvOvX+HzjxJ/Ew
         /8QeVtDTJ5dkocrQ8F1ulIF6e1zKnoy+1qsp86tNhnZxoGP4d8daAATu8lVXmPwPJgO2
         1QhFkYjjzGnus5r5vzOLJMCVNpIGhF+cn7Fb9q2Rv7q/dXJe336gZjmeOCY9uEOKf91q
         LxUEjCoCjHF3BSqn3tmyDgzRZsED9NldVO0E1Clrzgt/16HTMvs2B2kLJsPHqAvFViLf
         4OiixQpPFopggih1q9FDOsT4acCXGQnqiOV/3N0v0Pe+YVxkOG+Aww5Oph5na0rNQUyo
         SvJg==
X-Gm-Message-State: AOJu0Yyna8Sf8yPo8cOsqmH4XAo4NYm4JjkO/LQsWogxP3Vu0CnV1lRd
	BBjolPUs8jMIA2ElNpUKmzINIhyhyxZlBvAn62s35KY+1KStWghqSm6shE5q58cEKOY=
X-Gm-Gg: Acq92OHk7H0rdCrrEGW86dpU0CD+9Lu7+kgbe8H5TW2s99oq4DaJJFRxv1E+QIIptxH
	VgX6xW1gSZkHBtcesFW9k5ffo5vuqayo4PshrXwMXQELczkkQhq1RpDtPhkrH9lfGHvDPIR43VH
	HYreutcAqrh/En/80zT973dZyRigmZTHCpxjjye4fubQxw5XPdQA3T1q8KDff+OiFsJdSjYy1oF
	PEpZwsOCD7W+TyCAyorvpFrF25mmqW3Uj2ZE9xzyh6uPBNpKO9fanxpJKTZA+bhoDvbjy8zWE9p
	9F3vwLje/+f+1XnhxKODqw12yHc5IejHnp+eGGbsJujsVGQzy5XktNIielAOqP33euswClGD9Iw
	cIfzNE6DxoJ9esnwpEFGnFr6zU/yndEz7vc/9vfszJCjQC4eCdcexpd5Mt6sew+pna3Q6hT4fgT
	XG37t8aNOzgHdeB9/qhXCyF1QTS43X7p6+cqLEG/6p1uEpkRAk0MQ=
X-Received: by 2002:a05:620a:254a:b0:90f:9d1d:7031 with SMTP id af79cd13be357-91577e80441mr118173285a.17.1780338773559;
        Mon, 01 Jun 2026 11:32:53 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915721f7d75sm141863385a.18.2026.06.01.11.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:32:53 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v2] rpmsg: char: fix use-after-free on probe error path
Date: Mon,  1 Jun 2026 14:32:47 -0400
Message-ID: <20260601183247.1962010-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpmsg_chrdev_probe() stores the newly allocated eptdev in the default
endpoint's priv pointer before calling rpmsg_chrdev_eptdev_add(). If
rpmsg_chrdev_eptdev_add() then fails, its error path frees eptdev while
the default endpoint may still dispatch callbacks with the stale priv
pointer.

Avoid publishing eptdev through the default endpoint until
rpmsg_chrdev_eptdev_add() succeeds. Messages received before the priv
pointer is published should be ignored by rpmsg_ept_cb(). Flow-control
updates can hit rpmsg_ept_flow_cb() in the same window, so make both
callbacks return success when priv is NULL.

Fixes: bc69d1066569 ("rpmsg: char: Introduce the "rpmsg-raw" channel")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
Changes in v2:
- Use a 12-character Fixes SHA.
- Drop the unnecessary asm-generic/rwonce.h include.
- Handle NULL priv in rpmsg_ept_flow_cb() as well.
 drivers/rpmsg/rpmsg_char.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index ca9cf8858a5e..bff5aefee212 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -104,6 +104,9 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
 	struct rpmsg_eptdev *eptdev = priv;
 	struct sk_buff *skb;
 
+	if (!eptdev)
+		return 0;
+
 	skb = alloc_skb(len, GFP_ATOMIC);
 	if (!skb)
 		return -ENOMEM;
@@ -124,6 +127,9 @@ static int rpmsg_ept_flow_cb(struct rpmsg_device *rpdev, void *priv, bool enable
 {
 	struct rpmsg_eptdev *eptdev = priv;
 
+	if (!eptdev)
+		return 0;
+
 	eptdev->remote_flow_restricted = enable;
 	eptdev->remote_flow_updated = true;
 
@@ -490,6 +496,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	struct rpmsg_channel_info chinfo;
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev = &rpdev->dev;
+	int ret;
 
 	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
 	chinfo.src = rpdev->src;
@@ -502,13 +509,17 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	/* Set the default_ept to the rpmsg device endpoint */
 	eptdev->default_ept = rpdev->ept;
 
+	ret = rpmsg_chrdev_eptdev_add(eptdev, chinfo);
+
+	if (ret)
+		return ret;
 	/*
 	 * The rpmsg_ept_cb uses *priv parameter to get its rpmsg_eptdev context.
-	 * Storedit in default_ept *priv field.
+	 * Stored it in default_ept *priv field.
 	 */
 	eptdev->default_ept->priv = eptdev;
 
-	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
+	return 0;
 }
 
 static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
-- 
2.43.0

