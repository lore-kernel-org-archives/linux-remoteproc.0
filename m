Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95DE351C06
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 04:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782100903; cv=none; b=T7wdVj3fhuYWLHi3fGAmqAZsf6EgvLiL1ck9QCw1TPezgsLjgBXUjg7sKOhPsM8OixC9lgBHo0pD/UpUdYYpFsIfSVVCgFcybdJT9LaPnIiBGPzRgiQhw6dtZX6uLaHpIW51i6y2rZAHyTaom/xng1leaNkn8mhlDFPko8k5Y1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782100903; c=relaxed/simple;
	bh=6pFNLpuLug7O+tfXSFxSsEKPBIXycCEnudrnGEpJF8o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iaIQQ7QFwkRwawe/quOvA9g7TYEKOAM+pnMJADUlZdpyuvYm/DqHDe37o97IDL51NmSEBw+hlalpntYDwayv+3Q2bYA0iIRHVTOy6fCk6yCnmBtnwtqhg1teaHUlthjJROIGjii4l+TCbLI/s4QIiXVhM4Q+A98A+HZp6BSqPbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTTxz6b0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTTxz6b0"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c6d06e1a59so10520555ad.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 21 Jun 2026 21:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782100901; x=1782705701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=opbavV9WMk/II6cyX6sw7s9bgwRaNlObVyJZX7PV6k0=;
        b=VTTxz6b0Xz0f9KjipD0w/x7a3khfAHSBo4Ap4+JpxgWeCYA8IT1j7teqfW5yuEkUZ5
         ND5qYM35pZ2ab+KBIzA9h/oCNgn79p3bT804cs2OVrV6A28gWKTVfE8I9Py7gQWXxGa0
         G48QP6wBFhJlHqO0gtxPFI2GicEw9Os+B/Nu5jl9Olrz/Cdp6gJVozB5jgyi63CLlgu/
         fGweXq23jfEiIRkPpGGJR+oNjSpseUPlYzLwuMoZnr8vAOLILobWB+HAsXGURuBoSLMD
         r7OQmWw65YH2EJO3+vrMekcjq3vaRzTpmNBVxp8YcBSxNpQy+urg0S24kOmwppALvk0G
         iy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782100901; x=1782705701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opbavV9WMk/II6cyX6sw7s9bgwRaNlObVyJZX7PV6k0=;
        b=GbZoiHpQw/jY0EDAzwt8rndu9MikP7+0e+Ghsl6vXTBA7mWKSQwTtkvJchxojBAbnK
         aKMf9xbp6WO8iRFTvbeL/Cp9FwCEovrloU+2G3n9a7c3v33h0EXgH2zgs4F9nY+PG26x
         E4SnxKj/Qs4qOmCTWdlKmEQVKbAuBhq3OOv+0LZLJtnO0T46WcaJkP9Ek3E8p497WnOt
         gd5DMcSgUqkP2DSY2l6mNn0lPQy3hoFN4+VAA+INYx69eFfsI0XVX3v5JIrpXxHGqqdo
         dJM6lxjfTSCkcDxecXHqRQRRCGy2BAuPncdbiZ5XhhrKPi1aihnag3634ARwZ1Q9Qzco
         nYCg==
X-Forwarded-Encrypted: i=1; AHgh+RqsUSVwP7MeUgh+1SAW5ES8zi0u7s5vEBw3sgfyYMSCMnJ8BiJ/napMR61ZXxclF+4UxavBqaNLJTnqPM3NPISS@vger.kernel.org
X-Gm-Message-State: AOJu0YysWMuLcqcm0tcBumbdjfDWFzZjsdBQsZVNreLPMXgB/G+pLIRk
	4fJWomqBZZ8S6vbUFppFcjfHC2/+9SX3RwbZSu3mwIS7WOUu7xed8x/U
X-Gm-Gg: AfdE7cnHPzAVoUFzCyUqUP3MYwXspwGnmxXVe7aH/znBb1QL0VCSHBoQ5o+95sNf4mZ
	vr7ueRNB3F5Cs3OSkDKlbc86yucbxGtlEkEV4zJHTlWF8Bk4YLF7tx8YVDdPB892U7n67l07AID
	NO87HNc+YZtMZdn4LyZBpUYPV0BKPaSc6Q3bA0rbb18MfXYYSxULtHfR68q0C4AfYr1ZyQGD8vH
	UHdYvnA82hVxUKcv4fGOdAtS83AqeLXJm8ESQIzOMq+O+obo3KVWiw5NVPhk/wN/gdER3Lk8nGa
	dtDeU//MbWiyUPxs1ixMD+ySFqPifquTzGaDDT1LN3gka02QauGD5NzKRuYFYzGwr6l5yGIA/h0
	uGOgf4G/ht0gO/ax3Umvh+Qo6EecqTsWA397MKFG55OrHAHBYz6D1HAU38Rf+A+nVfZxc3Fn1CZ
	pUATOYhxII+iU5WxQBLeONPVo1gjP0IjENyuaG+GE=
X-Received: by 2002:a17:902:f545:b0:2c6:a45a:4f85 with SMTP id d9443c01a7336-2c7190134e0mr68990495ad.3.1782100901072;
        Sun, 21 Jun 2026 21:01:41 -0700 (PDT)
Received: from localhost.localdomain ([202.164.135.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfdad0sm71907115ad.63.2026.06.21.21.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 21:01:40 -0700 (PDT)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Release dtb_firmware on stop
Date: Mon, 22 Jun 2026 09:31:14 +0530
Message-Id: <20260622040114.17128-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_pas_load() acquires a reference to pas->dtb_firmware via
request_firmware() whenever the platform defines dtb_pas_id. This
reference is only released on the error path inside qcom_pas_load()
itself, when qcom_mdt_pas_load() fails.

On the success path, pas->dtb_firmware is never released by
qcom_pas_start(), qcom_pas_stop(), qcom_pas_unprepare(), or
qcom_pas_remove(). Since qcom_pas_load() runs on every load/reload
cycle, including subsystem-restart recovery, this leaks a firmware
reference on every successful boot of remoteprocs that use a DTB
co-firmware image (e.g. ADSP/CDSP/MPSS on SM8550, SM8650, SM8750,
X1E80100).

A second, narrower leak window exists if qcom_pas_start() itself
fails after the DTB carveout has been mapped: the remoteproc core
does not invoke .stop for a remoteproc that failed to start, so
qcom_pas_stop() never runs to release the reference in that case.

Release pas->dtb_firmware in both qcom_pas_stop() and at the
unmap_dtb_carveout label in qcom_pas_start(), alongside the existing
teardown of the DTB carveout mapping, and clear the pointer to avoid
holding a stale reference into the next load cycle.

Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")

Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..040aabbe5860 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -360,8 +360,11 @@ static int qcom_pas_start(struct rproc *rproc)
 		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 
 unmap_dtb_carveout:
-	if (pas->dtb_pas_id)
+	if (pas->dtb_pas_id) {
 		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
 disable_px_supply:
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
@@ -419,6 +422,8 @@ static int qcom_pas_stop(struct rproc *rproc)
 			dev_err(pas->dev, "failed to shutdown dtb: %d\n", ret);
 
 		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
 	}
 
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
-- 
2.34.1

