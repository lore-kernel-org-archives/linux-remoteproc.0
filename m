Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D9A3DD52C
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 17:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782323650; cv=none; b=OXR4551lgPpeH2egGWNu1lR29FEScyeuXN+QskMIeOBdCG7uQngm8+y4ipC78EE2f89C4VV5qCqVKTl4Sffl/2y2Z5GqkeVmpNRwF16+2yaPLhuSFurSIgMboDV99/3pyvKLNuRmx6Qh9Ewbui6DembTU0Dbbt36xN066du2uuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782323650; c=relaxed/simple;
	bh=zS39eoSU0MQzmQzeMb7eknSjOrzat2yPax7g0/+bddU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qb20JOt3sdbQMF2xGPBdouFHBinOqeLUDRVBTEQucRUZO4kBjr4ToHMnaD3teA14prHusrLOb5dbRWdwbXan1wfc3TF3rSZaE8FPULlZIcNQ7vHkSRk2K3o0TpX0tk+W7m1tMugd6+6raeVMtOvk2G+W/Vr+7jskRXfLYUc+UmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2tyEOMX; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2tyEOMX"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8422a816c89so178302b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Jun 2026 10:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782323647; x=1782928447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anmA2l3MxALUQm7PPnRPt/zM8+X9tbioRc5oCtucAME=;
        b=Y2tyEOMX7zJdGggLPN87Kvsj0sJrKinBXyB7Cvp8a6iGCU2szgUtgG9kV6+gD7AMYw
         i7Pr2cIJ1P0wacjrsQtvS8lXz6MqRsiIRSCTr4t43S0TzfpoE4f+ocWqe9XJS8phCstW
         6A8Ts7J5ciIhwCN0b8f1PfAZPh9Pfkg9xkj4cQxGK2NwO3b/OZNGWAPiSoaBbVNt+Z7H
         I660wwhd4vlz93tOlqdIs4yWgugDPeRzaii4uEAWEmz5i9VH3cXrJE3BDpZMai+wDECW
         39YQHKnJuU9mDRRTr/zBXvp/rWP0h0viv8NEvUA8z+FKWTJceEXPdyKFqIFcMOVB604/
         iQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782323647; x=1782928447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=anmA2l3MxALUQm7PPnRPt/zM8+X9tbioRc5oCtucAME=;
        b=bsBIvOILaAHEIE59l8YLYufO98vNJhZ8bMCoXzDSQcdO25Xedk7GvJjdDNSjX7f2hD
         bM/3wp5Uc8vG98qCCYC91Aq/Aow6EsGDjfT3MZh1xlNV41JUMlXxv+ycuW0Mjf5XhPHU
         Y1fyX949PcvjSPIYHhANx9TojJYuPqAGx+/YRjr9UXRYWRw84J4nSnEccFkKc/Gtw3/N
         5lIVoemaRawx1QjVAuv18OO1Bqg5QrY2Dz2VSoQu7al9+cBBCzeL1nV1Wv0Nxp9vXRJV
         j+ZFW5HGoPiJTfi6cvvl3O0yWlnrPoT0wLgKw9E28stWL9BCYfZa/ZxBqwMlCxpWCDTx
         ErVw==
X-Forwarded-Encrypted: i=1; AHgh+RoFvSa2u1dJL1z49/RPobqat/Fi1vz/e6CIhLVUswXwdFA4w5atbqxAfvKwo7Nz7aiRzZjFa9Gr+4s+mjgFcy/G@vger.kernel.org
X-Gm-Message-State: AOJu0YyinaWgfv4CdS443r8rmrYt6WTwi7kqbeKyRFO+Dy8k6SqbGMBR
	Glmjg7kzFElRvVUuEApvhjE+XfbN58+OxnRAI87hyX+u3s1tpdDnjdJO
X-Gm-Gg: AfdE7clqdETyzhPeWeGoo0Q5ZfsVw+v4ZK+FUlv6bgnjJdTvyHRGQeSxDvrDPXdNdT3
	a6q+YyGUTR6MQycjeoJsa+CZIr528oLiGR/pZqfQiIlb+ELNOT3w9S9iXigAWGQtywzq4z5CYNq
	6fooyouiqVfn6bzu1uWymcS65o+8BuJYVNWb8WwKbz49IxVIPTGzA9yK35n5K3dnGzGKEsmeXQJ
	xCNl+aDb4cOk/Xi/CxN5TPWnBq+fTphJKTDHakBO39/S8pnhRu/NrYBkJZitNeMwcokxw7e22Hm
	GTvE2D6c6zH4BX8bM/OcMQwtSZSh6pnmSqJvvYZo3NGdFqr2G69TtNGDN0QMfCq4oSSekOGjpyy
	kCbfHAG1FdqCrW2qXV6RNNl/+6sin+o9BnYUm3JbLzKzt2UC15fAAnKKL7iI0eFkLDs1llpUzPS
	35zJ4H5KkJfrlEtGPj0xO3AcZB9NNsT6DDHd/Ex4o=
X-Received: by 2002:a17:902:db0d:b0:2c7:f524:a8e with SMTP id d9443c01a7336-2c7f52411f8mr4584005ad.3.1782323647155;
        Wed, 24 Jun 2026 10:54:07 -0700 (PDT)
Received: from localhost.localdomain ([202.164.135.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5afb1e0sm3629865ad.29.2026.06.24.10.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 10:54:06 -0700 (PDT)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	saileshnandanavanam@gmail.com
Subject: [PATCH v2] remoteproc: qcom_q6v5_pas: Fix dtb firmware lifecycle and leak
Date: Wed, 24 Jun 2026 23:23:35 +0530
Message-Id: <20260624175335.22799-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622064141.zfakbyenknx6vbm5@hu-mojha-hyd.qualcomm.com>
References: <20260622064141.zfakbyenknx6vbm5@hu-mojha-hyd.qualcomm.com>
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
v2:
- Move DTB firmware request/load from qcom_pas_load() to qcom_pas_start()
- Fix firmware reference leak across restart cycles
- Handle start() failure paths where .stop() is not invoked
- Ensure firmware is released on all success and failure paths
- Remove DTB handling from load() and drop release from stop()
---
 drivers/remoteproc/qcom_q6v5_pas.c | 54 ++++++++++++++++--------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index da27d1d3c9da..090f1f09dba3 100644
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
+					pas->dtb_firmware_name, ret);
+			return ret;
+		}
+
+		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
+				pas->dtb_firmware_name, pas->dtb_mem_region,
+				&pas->dtb_mem_reloc);
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
 
+	if (pas->dtb_firmware) {
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
@@ -376,6 +372,14 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
 disable_irqs:
 	qcom_q6v5_unprepare(&pas->q6v5);
+release_dtb_metadata:
+	if (pas->dtb_pas_id)
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+release_dtb_firmware:
+	if (pas->dtb_firmware) {
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
-- 
2.34.1

