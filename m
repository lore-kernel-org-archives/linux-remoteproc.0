Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCEA38F636
	for <linux-remoteproc@vger.kernel.org>; Mon,  7 Sep 2026 06:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761974; cv=none; b=Gmi0t+G1xm9Pz1XAV8Bv4oApAZ5fEi+0VCxRL8/5UWa2Fr+5zw+3zEm534qfmlgoHv6pF4bYw/4uxH6L5OwGnizwQjoSyBlpEjhUTwuEhdFLoGv2ZPqtfEda7lLi3gO66JMchgcRiOXC84WEXb6SVjzyjkh13V+ro2Mh+vY2O4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761974; c=relaxed/simple;
	bh=ZaSX0pdXEKGGNopYNr78EaARlqdq3R1GfYHHOzopxcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ljH7J4rTJtbRQ4JzpGtCakDBj5vEVyoNmL6+cvnbf7Rf7ENHAyokfKHDzrQ550YQYiQNlVdc1pF8rpHXgaaQah7cUnjWNvSfrzIXP3jkQDMlJRWDC3ajmI1fNlSLbhTAdhlrJU4wmuobKYPMJm3LgcLsN0l39JgUfzKv8utPmu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emWara1k; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emWara1k"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so3461603a91.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 06 Sep 2026 23:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761972; x=1789366772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkwFgba+otptQ7FHpTWiDmTPg7a9k+B/VhEM4eIT7PI=;
        b=emWara1kiHDLa5s/rWfJmP111uBjwIPHJPikp9jCivSxHKyO7R7AhdbYEUAeo3ulUL
         AADl5rq/ACCGxdR5ZYdiuoVcgNEYF2TIqBjpfXV0dyDXsMW6uZkkvZLGOXfT2Jb5JjAm
         HIeDnRNk/Rx60EYf6PuWRmDXAumSrMxEUGaKSg7/FM57kmQ8ecAjy69Kn8UBeqOod1Y8
         WXco5euD7REbIjp9puxCgzwoRGSKOThmA/oO6Jxru8hxRH5HHWzlqvb2LfaAeZ45R+r3
         KTlvXrHND1UYuSbGilnw2TjCN1ixAvgaw+xNx5WQ3J1zigvZc4xjMWJouzFLPbPhjMWX
         85+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761972; x=1789366772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkwFgba+otptQ7FHpTWiDmTPg7a9k+B/VhEM4eIT7PI=;
        b=fOZgPfDXWAkZr7h1ZSlY57IAPJH80M94JAVApMOw1DBFgW//ByCuOerh/12XwFolNn
         e5R6QP2yiM/4Ert5NsRiB3ndPyYmG0oQNb7PdhK2sV8+zBC6TB+Q7Tg1CQZl+MUywoBm
         cVhIclEwCN1VOVWFmu+8gGt1CLWnuTIZMIjV0IiAW3o9ySVsVGBDJpSOYjEs980bGirX
         zCkpMPQrkqFXmGHMhXympps7wNwzDc5vPGRsaNDhqzRLWIUATlLeCExzbWFbvZ/i7xzI
         0p2OUNt9KFjLHNvO4S6pof5e6WAL9g4EOTbvqEVxCneE5O6m8YFXAe8KWL8t7NVvaHyr
         BDYw==
X-Gm-Message-State: AFuF++kdhUtXjxSj+zjoFaRJatwdXmIiQ4idywtLtYCehtERMBzFJ8q8
	JGHyBntbH8x3GYR7NWtuR0ePkAK4QWMHqvMljS16Fl8eszUkYV6P5YLv
X-Gm-Gg: AYBFou0+jkrGSE/EsSF2FtQshobQFDkkmseUdvj9gRTPFTVyBw+uVJxrNmqMCmWzj3j
	kagtYGF/w2bSwePz20EXjSvwmtrGCoTs4l8+ERAfW4fkzc4PK10FlEV/7jgyNrFs/jh+11ch+BO
	uYPqnR8Copg//v+jLA3/qpR+8VBy6ErxOwNPWYXErIFFpEIwhabCQHI8+QOcI2qzPlsagbT2ag4
	pbWSX5MhSwKteCuaZ46lIGTD8JY9tGV0alLywdQejEJbn015vi+MJs3gA5rF5O7wZTlawBQUORX
	UK47RmowM0N/laatGNWtQ2qYWS+hjhqbPkDCLO4Dy99VWvVsXQwXPrlR+Yn69mb0Ad/KRuT68yy
	Qm4bTTdrv0gPTe/iZL2TwYCu+Axypjy2BlVRyetKwh8mxFCoaEmeCZ/WP5r58TdZdlAnh5JP6iw
	qu9LyE6mfin4T9QixkzT94VZhg8ll4fA4oi2DW7AomSo670dqXUuEnrKNNnVVjPPkuYN1V9xkGz
	f3KhmIdYxcH8g==
X-Received: by 2002:a17:90a:c88f:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-39b07f3216bmr29292347a91.3.1788761971819;
        Sun, 06 Sep 2026 23:19:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm27439829eec.30.2026.09.06.23.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:19:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rpmsg: fix typo "upto" in comment
Date: Mon,  7 Sep 2026 11:49:27 +0530
Message-ID: <20260907061927.4585-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 1b8bb05924af..28bef36931e4 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -110,7 +110,7 @@ struct virtio_rpmsg_channel {
 /*
  * We're allocating buffers of 512 bytes each for communications. The
  * number of buffers will be computed from the number of buffers supported
- * by the vring, upto a maximum of 512 buffers (256 in each direction).
+ * by the vring, up to a maximum of 512 buffers (256 in each direction).
  *
  * Each buffer will have 16 bytes for the msg header and 496 bytes for
  * the payload.
-- 
2.48.1

