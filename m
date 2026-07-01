Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CC017C203
	for <linux-remoteproc@vger.kernel.org>; Wed,  1 Jul 2026 17:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782928679; cv=none; b=uTN99R8lb0spLoaKyz+qA5o1S9FQgg7HmGz1dlNpKkxgMQiFj37HHYAOwMb/Db++wlm8KskOwvNkeTkiYVhicO2F2RBlzi68OHJ4lnnI4ZnZhymAHORb6f36Ztsz6HhWIzkgx8fza5fnZhIcQQrvVfjZHB4Jvzf+dTZXlZLL090=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782928679; c=relaxed/simple;
	bh=ESOuRtHjZy1hXdzAjoIyMynANTOZhaenHIm2iySL/XA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L774yjjp1tgH0cz9mP9kJwxl6SWaCRxEGSBW+U++iREKnp2/MGq9hcmqqQcR80KOonKQSItYI62HLf0bkSxXEFUyH3EaJZbyTnJbx6KwPmLSzMqFJLgiZsiyzn9aIHSeSsNiPs5F+PHGZqu/fyGTBT7ik/zrsbQJV02cb0bmx38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvl4pc0e; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvl4pc0e"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c887ad05211so111611a12.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Jul 2026 10:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782928677; x=1783533477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xabEEnPMeAsxiMp/uB8gvGoQlGBh1rxYbqUQL864RtQ=;
        b=nvl4pc0e/cZbbBGrJMUptrhiTDSrZgpHjjTbhcwaSj3FcDStWTEF8pk9RgezFYO3QR
         xSl1FByqST8J6lPcoCbmdAbsQoRwDa8DGavhZnV74jz96yr20np6W+O0E/tmMjM5M/sB
         7oAXsBT1SCOkB1iz+ms/PqeLy+pwkocANy7x5oRzLrZAfm62QFEsseW3QEluHjGhr7S+
         Q/7kepGxsGdItJK/TWQPhP2J4c6QdKPZ3wb1qraN6YicKM4tCXZCIyjyjyffvMuN447/
         m9Qux2Apjub6tPkZLJrHdeNjefVuZeqfsYtQ8nINKhK26ndts0ojOe/qL/28hhYOf66b
         LZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782928677; x=1783533477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xabEEnPMeAsxiMp/uB8gvGoQlGBh1rxYbqUQL864RtQ=;
        b=AG+AKhMjnagEPrpwUIJoDAzzYYMRjdSK7gaevTNg20mKDGIWQwn0Yniz9nuyqmsb1h
         NKWmRmNDHuKfG5Cm0Adu5qArwPVCPeTDLWGC8uh+zkEKRhg4h0KaqxD6Uex9du5Z6IVu
         HQh5WfoYQYJbWz4EXOaYO0E7h0FeZD6GOg2dW0G4SDMQ/LGdwpRfAaV+Wd/gghIPyx2y
         4Ff7XZajjX/pSb3r+3MlvYgRRPOBYMyPmdsQk+UezR5zzqyjad3qb45dG1HzfoK/m/2v
         29OXXcX9yoik6l4u9iWfMnh4o1mW5BDmC2Hb0nJ1E31m7fIB91/w8PoSmhU5OS6mU0x3
         6kRA==
X-Forwarded-Encrypted: i=1; AHgh+RqW0D9nUirjezjkfywgW6mS9Lp9gCvL6SVgTGjJCVEwdtMZP6RI35LNbrIjRDljEtpkWMTaAJFBGnIIkOGwr9+8@vger.kernel.org
X-Gm-Message-State: AOJu0YyWXEJtkOLIpgHFbDaAAJTnbqlCnZ7K5ZCJGlHfdIcvEhYtDW3W
	Lesx4KvP5vWl3GzDjf4wTSldGcrN12MRH3jmmU+wBuTeOaNXd7idtet9
X-Gm-Gg: AfdE7cmpH4ZGcn3vab697Z/IV/40pGiS6jHrpEG2T2zMrhnIKGgOqi03Xxwvjn2ejhD
	kLDtq7gTzsbnFX70c8zFCIvOYeMYqSvSNobJfJt3NfAxC4AKHjvYMB6wiHAu6Q0RBzGaxwsaDPu
	n7Wcom0y5Kk8Q5tny8EmAKNdsQjnTziJm6v02Z0KUK09T/2RnEqvuWF0QhbN64032wpSJ+ZH+Ob
	SDw73uc20aRWNHhieVw9nAKNzrHY4hKyzfsthGZwkFTreq9nV+SSkRWjSfnN8dY/Kz4or+5Y3LM
	eFY4G1sXnj1xo1OMWwfqDAI34upNHoW7MGZf69VShz4TvDyMP0CVJWrNVWikxrL+XTaIt9lq1LP
	MrBfAv6Y5wdBp0SNkz2xjJSKZnaRpUHmvFGmdQEkg+cKTfYyCDoVhWPnazzb8CRdDCQYTUYXJ24
	ElcySZuqPJ1qq/5LyQ/bsxdmLjeBPbECGcZeL5K6w=
X-Received: by 2002:a17:902:fc43:b0:2c9:f73d:4b48 with SMTP id d9443c01a7336-2ca7e912984mr17893065ad.6.1782928677045;
        Wed, 01 Jul 2026 10:57:57 -0700 (PDT)
Received: from localhost.localdomain ([202.164.135.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85bde6sm145394c88.9.2026.07.01.10.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:57:56 -0700 (PDT)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [PATCH v3] remoteproc: qcom_q6v5_pas: Fix dtb firmware lifecycle and leak
Date: Wed,  1 Jul 2026 23:27:24 +0530
Message-Id: <20260701175724.1972-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTB co-firmware was previously requested and loaded in
qcom_pas_load(), but its lifetime did not match the actual
start/stop lifecycle of the remoteproc. As a result, the firmware
reference could be retained across restart cycles, leading to a
leak for each successful boot.

Additionally, if qcom_pas_start() failed after loading the DTB
firmware, the remoteproc core would not invoke .stop(), leaving
no opportunity to release the associated firmware reference.

Fix this by moving DTB firmware request and loading into
qcom_pas_start(), so that its lifetime is strictly tied to the
remoteproc start sequence.

Update qcom_pas_start() to ensure proper cleanup on all paths:
- release PAS metadata on failure
- release DTB firmware on both success and failure paths
- unmap DTB carveout where applicable

Remove DTB firmware handling from qcom_pas_load(), as it does not
match the correct ownership and lifecycle model.

With this change, request_firmware() and release_firmware() are
properly paired within the start path, avoiding leaks and ensuring
consistent behavior across restart and failure scenarios.

Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---
v3:
- Remove the unused release_dtb_firmware label
- Release DTB firmware under the existing dtb_pas_id check

v2:
- Move DTB firmware request/load from qcom_pas_load() to qcom_pas_start()
- Fix firmware reference leak across restart cycles
- Handle start() failure paths where .stop() is not invoked
- Ensure firmware is released on all success and failure paths
- Remove DTB handling from load() and drop release from stop()
---
 drivers/remoteproc/qcom_q6v5_pas.c | 52 ++++++++++++++++--------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..d0a12e5b2ff7 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -232,28 +232,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	if (pas->lite_dtb_pas_id)
 		qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
 
-	if (pas->dtb_pas_id) {
-		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
-		if (ret) {
-			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
-				pas->dtb_firmware_name, ret);
-			return ret;
-		}
-
-		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, pas->dtb_mem_region,
-					&pas->dtb_mem_reloc);
-		if (ret)
-			goto release_dtb_metadata;
-	}
-
 	return 0;
-
-release_dtb_metadata:
-	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
-	release_firmware(pas->dtb_firmware);
-
-	return ret;
 }
 
 static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
@@ -277,9 +256,24 @@ static int qcom_pas_start(struct rproc *rproc)
 	struct qcom_pas *pas = rproc->priv;
 	int ret;
 
+	if (pas->dtb_pas_id) {
+		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
+		if (ret) {
+			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
+				pas->dtb_firmware_name, ret);
+			return ret;
+		}
+
+		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
+					pas->dtb_firmware_name, pas->dtb_mem_region,
+					&pas->dtb_mem_reloc);
+		if (ret)
+			goto release_dtb_metadata;
+	}
+
 	ret = qcom_q6v5_prepare(&pas->q6v5);
 	if (ret)
-		return ret;
+		goto release_dtb_metadata;
 
 	ret = qcom_pas_pds_enable(pas, pas->proxy_pds, pas->proxy_pd_count);
 	if (ret < 0)
@@ -350,15 +344,17 @@ static int qcom_pas_start(struct rproc *rproc)
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
 
+	if (pas->dtb_pas_id) {
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
+
 	return 0;
 
 unmap_carveout:
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 release_pas_metadata:
 	qcom_scm_pas_metadata_release(pas->pas_ctx);
-	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
-
 unmap_dtb_carveout:
 	if (pas->dtb_pas_id)
 		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
@@ -376,6 +372,12 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
 disable_irqs:
 	qcom_q6v5_unprepare(&pas->q6v5);
+release_dtb_metadata:
+	if (pas->dtb_pas_id) {
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
-- 
2.34.1

