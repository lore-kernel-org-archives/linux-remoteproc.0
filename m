Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E8F376BD5
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 07:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877672; cv=none; b=O6WXtmQffD3P04iNNCMercvzqWvyJI4A8T5egRlZ5E9MH4ZfZX9PlqoUdyXrPrV7IezrZRKamFIcuizq8hGULZ6nAUdgp3IbX5zUtURfqeLlUz8cEXcAy1gzGu8M7V/dmrnYg447OKjRXr9lTSteEVU5ii3tMxZ4cma/QeTexEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877672; c=relaxed/simple;
	bh=fM/EPSJnhQXQN54E1lhVsHA1GPVlzhP1IEC/erQBVv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o/wwki9onqeKH1rGpdNIKSkVSK+L2UNRTRxTrUEPjxqUdDG0a6t0goXJLwPvuHT6AXtAMXdk0hNMDGsUBXFF/T/qGbtAz/54HGttB0Tq7eD9QesJpK3bxHYy3i7CEf7PCyEoYQiiAc2aAHZ/OL777YWLWZAGAPatp8KaznIWtMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGLSS4n+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGLSS4n+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso23663225e9.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 00:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877668; x=1792482468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98Qa2o/S1XoEMPrlowsac7BQiNC+nqGa1kAsrr8UqXY=;
        b=UGLSS4n+q9WR0nvpar/icwEKrYiTUwrsoFgLot7JOvU/1RQgF37r2KzS+IkSoWAJxD
         QKQBtQIXUz235XOjje+wZR39Y4fQOWoWnAk1whew5LLMeYnKOr+rE9ymkPhkddZGIr8u
         OVbOch2AfzetY9UmBSNU+UhP/1Zy1ID0RNYEFOCBbartvkMZmAhmKF7yg5ns7ZlZXmxX
         4pJ9Vg66IMCuTbM6VtL2AnpPtbXJ9ruZrGpJSNj9HqrlcCro/hiTxa2nLVwQJj2fDrjN
         Uh+WZNvpjyD2rIJV0uUGX56VZG4O9AquW4DWnSd17G1bc5WuJVSphnR043dv0qOcr8hf
         k+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877668; x=1792482468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98Qa2o/S1XoEMPrlowsac7BQiNC+nqGa1kAsrr8UqXY=;
        b=B3fi/yI4nGzP7/9KOa7tc8cwLHpoH4Pd+fV4q9dpKlue4pr1Pdq8iCOosWfji/hNDa
         ViqklCXJvRNm4rMfs5XJ4kL0asBtUFj0XD0LtrrsLg8XzZtBRka5ijrDBxbJCtAtrrAN
         NAGfO1hdcNsjMrDgh7muhxLcEUxLZJIAQ/OVEh9NmCy1Z5O4VRgidrVOExYsbcQ7mmwv
         9MVS7ukfsjus8wUWCmL+Mz6KCHt4+aTDndkP5tjuWjG4VJBsNyGDEVUfur5EmYBDV4uS
         qwCltFEpoPIx+H4zsIq4V0xkDB3ODMA0YTSu9hRoZ7iNPu3+wczLX+yEWR8VpHxettlF
         d8Rg==
X-Forwarded-Encrypted: i=1; AKwUvBzEHENKNVHFYN2HwTJK45YXFFSoacC6zBeB88vIbQyJPX0rHMitT4hlJvO2BYbMldUkCdhKlns+7kqbF7tZ4uoN@vger.kernel.org
X-Gm-Message-State: AFq9FYII1/ZJy+XR8/QRZNv9kfKysE20txdJ4YHDBbZp6BN9HQ+BTkNx
	eEunssSx9VgjkTPl9mx4C5PEQFZ9/85Gp0Oqd5fG/0Vix6GpQAR78/bz
X-Gm-Gg: AYBFou3SAufr0hpmt7kIjYAep6mRvG15kM8jBaKKhhF5zXtTq5MSjKhJcCfwYh8XLDC
	cpHrInLdfQ9k07x8P8+4xNKfLyLrOhp/9Lni17uYbHrEAvloOJ08BBrgETm2jy0tBouuh2mqxxH
	ywT8l1CIlSXz1aMyWYLV2Jsu6aMWmmPcsqHt3APrhQCoI3oD60bT4ZcHmTMDeBAJebVoPp7U2l3
	peHGJa3gWbV6KslOKwWzs9C90p2oosoP0hhX2qPhI2rn0JbCJpQTiQge0aVQxH3TMZQkvZhHylS
	P0zPzxsTf68RaNw2SD3NUJfhJTQBBkcB4SV9ZtQ5j/lZDorkZPMPoPl8Qo28WeQsrLImI1Uq65E
	wxLayqZJtSUVU36N42FNhgVX84u0Cq4bZPlG0LCJ4AO0cf/Icptutc0gXvnqV0JTL/4ye8Xywoc
	Ia3jx4vGn37VNKTOYOEfBlJyHvDFT6Zd7TkgkCjnGP5LPa1zA/eq5jJ3pAwl4IzNKiM1WSdwyfJ
	SJiKQ==
X-Received: by 2002:a05:600c:1c21:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a18e4b6241mr274887295e9.16.1791877668407;
        Tue, 13 Oct 2026 00:47:48 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4778:c500:c7f5:a913:e714:a9c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm274850085e9.3.2026.10.13.00.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:47:48 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pi-Hsun Shih <pihsun@chromium.org>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] rpmsg: mtk: release channel OF node on device teardown
Date: Tue, 13 Oct 2026 10:47:44 +0300
Message-ID: <20261013074744.942560-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_rpmsg_match_device_subnode() returns a referenced OF child
node, which is stored in rpdev->dev.of_node.

mtk_rpmsg_release_device() later frees the containing allocation
without dropping that ref.

Release the OF node when the RPMsg device is destroyed.

Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/rpmsg/mtk_rpmsg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 1b670ed54cfa2..430a9b2aa7bb9 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -168,6 +168,7 @@ static void mtk_rpmsg_release_device(struct device *dev)
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
 	struct mtk_rpmsg_device *mdev = to_mtk_rpmsg_device(rpdev);
 
+	of_node_put(dev->of_node);
 	kfree(mdev);
 }
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

