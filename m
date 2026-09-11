Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4EA4483B7
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Sep 2026 08:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114802; cv=none; b=JoLbJr4Tdix38bRKC0+R6dxtjydNFkxdI9hT3jYTWhmgDKFxCXclTMuMLz2EYCpy96JeNh3Dl9svfyJTGk3EH7Ij5LKKIxEn1zfG68Gm0M5ziak6Dp90Ofvt3+dpHG4Mwvr3s7h/cbEhM/GamBsIkq5KpCjKerQ4zl3hByHsHcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114802; c=relaxed/simple;
	bh=5d+nBMlmkUKKmZzBSr3vTufMhxlvPlbEcm68Z1jOeHs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X4+Orfzniv5z8RG7aSi0oSWboTQgeGBwnpulMVu1HG0v7KQqrmobRm28dYgh5pDydx1e2XaYUVitUWU/i5aAAHaw8FZHdhx0RQ7Q8K1S12f4bvYsSy+k7SanI8j39lxDMAiXheva9+Rw84NhokNorIdwPYpRwRwgbgoDsAYOGMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VN9xZ5NM; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VN9xZ5NM"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4b62d118aso762603a12.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Sep 2026 01:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789114800; x=1789719600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pkkl4LJEG0capi//WgTWNXOHfKwEBVRDjjNXSY4gWOk=;
        b=VN9xZ5NM1TBSsP1VyHXCk9qDmKpJKJFAZoxqjFlE6/9Cin7OYGDIdfyHM+KCtSmz8T
         KRAiJZcDgo3dFSEfb5Q8YX3+FcxgSjF6/7foUTWc2Sh5JXG3I3b34OEXu5sS7oBUd+1U
         5rzaig88hXTZNwQdevqdSdTSAub9R8qBmxH/dm2lB4fHGZ8xKPm5ySdiWBOyf9JXR7Hc
         tsBJqdUBDgE/BvuymESFrhmHHqr6KULjaH/hiPereepSdfDwEGb6VJyxuClbeN20TZv1
         vyoY0a53Gba/wMJYXZAQT4H7vlIaslmMAL1aoO2wmEtHvd/MjXuI0b4Z4ERYHDOvEo+S
         GOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114800; x=1789719600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pkkl4LJEG0capi//WgTWNXOHfKwEBVRDjjNXSY4gWOk=;
        b=lLa9Xl8/ZBQz6uQIkMkBgQgMPJn9g4/uFQLNk74ILyKhoAEg8GMEXMPGVUGB3uic02
         GoxiCmY1AVMBxopGNHMwFiOKKpQEcvWDtjlwY1bzj799comlghLz/dCsGnyd6YU6OyjI
         Pi8viFDPQfD5audT1fVnfRwkBaSRd9Z98e/ig2pMaesPd/eckqIeSiMQ165ruKeG6BH7
         GXS6tPxwhKlhFvo0WhqLjnaM72mNoBVyLWisXTmDuL5Gc73sMbORWXra2ecg6H0vHaT/
         ZDXz2yhuuIixXeCQwtc3foW7bqHLDQT5vX7xcvE5EqQVdQn6SwbxrjauLQUVNY/rAgLL
         KKGA==
X-Forwarded-Encrypted: i=1; AKwUvBwcCYa1hsVE3Y4VZ3Gvt+4PqQo33hXs8rAIu48ZmqvNGKCjkV0KyzWA6fw+dmw34C7Sh3hLCYiIhaWKptZXVoWd@vger.kernel.org
X-Gm-Message-State: AFuF++nkrTPsRYNF8GEHzindZ6saK5L8Za3kQVukWOlUp120QhiYygwk
	FB0pnba8jWbd71cC7S6Po9Z/XoKeVq4Lh1HVB59p9gu+2uQx97QmfGJh
X-Gm-Gg: AYBFou1FUPyGpMDSfkl5pJxattCDrj2lZyIiqrctJcItSJCEkD6uK90100Uph7zx2cI
	KoGfgfDdWCU64RjkGRf1/PxXE5+4DWH1WqyedAAkdxHtJDs0eT1G5EJ2KOdur0Z0sroO4OFhs9G
	nrUSFMB90MyB4T8/SqvPTrTFhoxfJIRmQaaoZSOeCEaLb/U+1DODwBdHCh4v+9wOv2yg9OfGhQE
	Sq5UPoqhPyI8mzF03Khi5HQn/Sl8xlag/55VOj+wI87JpsB9e6BW+9dpmc75zOo7xwDx23Wrgnd
	PkiEwSWQfgVzCAhuqXTsh3wwqiYdRtKWn75WMhz1vegtx8FygX+T/M1Wgqg1Dx1Ec3xMhqubCqW
	DEEOaitWwkrAQZLZuZ774RPJw3LYmH7SngKZ5or0Vq0S6DkKKXplkl8MjdCb0uOw3j8rC3547Mq
	T+37eEs5hCEGVHwH+VAlo9N2q+30gmM94OmUZo5Ar20MDi+rhxRz5q9XcdsZ6ywWtpo9Yc5qw3p
	ID9/GVe8kE2m1JCi+au3QvYccxkGQ==
X-Received: by 2002:a17:90b:574c:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39d9bd99cb7mr5589203a91.7.1789114800368;
        Fri, 11 Sep 2026 01:20:00 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.34.211.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9947b847sm3599006a91.7.2026.09.11.01.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:19:59 -0700 (PDT)
From: Yonghao Zhang <hyz3367@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: loic.pallardy@st.com,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH] remoteproc: core: Set trace buffer name for diagnostics
Date: Fri, 11 Sep 2026 16:18:10 +0800
Message-Id: <20260911081810.740028-1-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rproc_trace_read() (in remoteproc_debugfs.c) prints the name of a
trace buffer whose device address could not be resolved, but nothing
ever assigns trace_mem.name, so that the diagnostics always prints
an empty string:

	Trace  not available

Copy the generated "trace%d" name into the memory entry, so the
diagnostics identifies the buffer failed to translate.

Fixes: a987e6b91a5a ("remoteproc: fix trace buffer va initialization")
Assisted-by: Claude-Code:glm-5.3
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 1ed406714849..263e12f022ea 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -574,6 +574,9 @@ static int rproc_handle_trace(struct rproc *rproc, void *ptr,
 	/* create the debugfs entry */
 	trace->tfile = rproc_create_trace_file(name, rproc, trace);
 
+	/* keep the name for the diagnostic in rproc_trace_read() */
+	strscpy(trace->trace_mem.name, name, sizeof(trace->trace_mem.name));
+
 	list_add_tail(&trace->node, &rproc->traces);
 
 	rproc->num_traces++;
-- 
2.34.1

