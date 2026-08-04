Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDB73E1D1D
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Aug 2026 18:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867603; cv=none; b=YvpzoMTs3L4NaI7HPAbxpqqXaj2N519X1DzFEMLSkqLRtkosImJtZfkKu8MC+tB4VbNmPZuabuKL5SiIPlCkIUXVf2CqCG2YX+vDWnYLJTmoAXPxFA0vGsw+eFsnpbw2haBvym5KRUFzQyOvDx+30a/taiB1rWLS33AbCBbhI64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867603; c=relaxed/simple;
	bh=PtRqzhQRb7bU7mah6yGiifES/yEQ4XiEOjC7ACQkKnQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s/pZQ6fpSDusLaUgNtR2RokroiOKfQOeZCXoBlGYWz5aNzAucC/6kCqRvMwmS3kWu7VJJrWQPl1RReTaR5j9sjE97pom9JhvaR/R/VhQHheVPkO1TtL90XUODD1dB68EHUFAGDDJYUMvcjQ+vSeIHXUZrHsnT0tyG2WlzKTzjRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOZkSBS9; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOZkSBS9"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dd1cc8dc8so19810a91.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2026 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785867601; x=1786472401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jw7e5Rfr9nTLu9Xi7DMR9VP2hbwdbhAjZW2kw4eVdlQ=;
        b=HOZkSBS94JF7pNhIcibw0zVV1uPoLMNsSB1b28wUWyRBIWgCTAlib3GyFEDp1ZaMi+
         PIx1iGaHBaXR7sSX2Xk3zSk1Ik6SouVh42HrmExX3+8YasT7axsDjG4jnryYzpw17btN
         CDX8TzKQxPDene03awLrz8PpijfJSPCory9DWiaQrTOeuN4lGkcjiUaumtRYrB7zQSJP
         3ggXgJh6XAUvclu103+0ZnCeaWlcWaewcDa0T6UBt3soBZz/ZJiHwvZmmGHWB8kVn0tN
         Fgg9Pr7lqOfjD6JIUuWiJQlKqa8w3Y4ntnk6UBqeysRUblY/nvDdJ9Uu9Vbc3BUcC/Qy
         aysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785867601; x=1786472401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jw7e5Rfr9nTLu9Xi7DMR9VP2hbwdbhAjZW2kw4eVdlQ=;
        b=oLz+jNSot0ji5EHKH4CePJWYQVU0KJ4sDkHittpiSPmgjI6X2ucdmnzXjj4d1h01Y7
         vTpMyVNobtgKUppMBqPt70s6Ys5PLVDknai9vaqJlan2HogC0u2Fs96mMNOe4/FANid+
         0DLhMk+xzlNRIYRcf6WsRf8F1sJZkoRC21jXSeePcFjpaaopoaUjFNmkG2M02pQTUPan
         jfiRjE+y+ed62vdY7dfI6tuNaIICQT54TzKFCmOVlwHICvO1B5tfpPK8zyMjL8lK+QXc
         bNmLc1ODBIpe05Kuk/4noYm9n1MHr9nvFtcREEF6mlW2dAHAHH5Hoa+Y4SMVa3hG1cJi
         Sa1w==
X-Forwarded-Encrypted: i=1; AHgh+RoOXnfwznDvhl/pFq81FHKgKPvlTedzWWTrt1di3cvvWAlQsvGVXfbzquUvmnBSNGYRA0kEVVVmXdN7uFB+2zAw@vger.kernel.org
X-Gm-Message-State: AOJu0YzoHhqNIerP7NH/FWpYIxSdwdZo0ZTFboOh52v8yebtf/iDt4U7
	HHKT7KV2GAubQmta55KanDrOEmih/XmqD7q9IgSVKy5JfrUBynVq7jtl
X-Gm-Gg: AR+sD10Se0pGUJG0cBv0GkK9DNq4InPpd7yMYItSA1PNrfBGcOFq9lTG6h1BV9pfIVb
	5DKAxtn/MDGaJ9BIoyvjli0yZwrSRoZfcE8QZ9WN5ENMX0nLkM8SpEmd0GB0mt9i+IpJDvrsejw
	ycMiTLu6oStyIJlzKYXyYo0l6Zk/b2UEaYzdeXsUgG1jqO02RZEgF2kfDZf3JPvSe0+9+T57zIQ
	m18IasnzANeVGst5UBc92izGhteZQhiDlUQ2WA03GDlf0joz2bVB238dyqAjtrgtjR4S+amlyI4
	7cHRr1p3lLbRcsx47s9STQQpzC/ilBAyi0+UsIqX4ztY8jJzvHT9sANSg6bp9iqwzsVUWHdkzVM
	eIrcKeVduy695WJeeinarb5YMMCt/XX/idLAq1Mf8UpDv/OO5Jp0t5MYfc2eFtOarHEWNzTWBR+
	E73hBANFcL86fQbH7Ebi0W8LjR4pjpBqmxsFY96w6iJl3ETzNz+rh6DJePopZ4K5EOoz716gKrb
	m8Mg9Zcy1GpAkk=
X-Received: by 2002:a17:90b:4410:b0:38e:6d4c:14df with SMTP id 98e67ed59e1d1-3903c5bff9dmr807451a91.1.1785867601383;
        Tue, 04 Aug 2026 11:20:01 -0700 (PDT)
Received: from localhost.localdomain ([202.164.135.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca8e969esm4967976c88.10.2026.08.04.11.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:20:00 -0700 (PDT)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [PATCH v4] remoteproc: qcom_q6v5_pas: Fix dtb firmware lifecycle and leak
Date: Tue,  4 Aug 2026 23:49:51 +0530
Message-Id: <20260804181951.5206-1-saileshnandanavanam@gmail.com>
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
v4:
- Rebase onto linux-next
- Remove unused int ret from qcom_pas_load()

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
 drivers/remoteproc/qcom_q6v5_pas.c | 47 +++++++++++++++++-------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..864446a484f1 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -231,7 +231,6 @@ static int qcom_pas_unprepare(struct rproc *rproc)
 static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_pas *pas = rproc->priv;
-	int ret;
 
 	/* Store firmware handle to be used in qcom_pas_start() */
 	pas->firmware = fw;
@@ -241,23 +240,6 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	if (pas->lite_dtb_pas_id)
 		qcom_pas_shutdown(pas->lite_dtb_pas_id);
 
-	if (pas->dtb_pas_id) {
-		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
-		if (ret) {
-			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
-				pas->dtb_firmware_name, ret);
-			return ret;
-		}
-
-		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
-		if (ret) {
-			qcom_pas_metadata_release(pas->dtb_pas_ctx);
-			release_firmware(pas->dtb_firmware);
-			return ret;
-		}
-	}
-
 	return 0;
 }
 
@@ -282,9 +264,23 @@ static int qcom_pas_start(struct rproc *rproc)
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
+				pas->dtb_firmware_name, &pas->dtb_mem_reloc);
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
@@ -352,6 +348,11 @@ static int qcom_pas_start(struct rproc *rproc)
 	if (pas->dtb_pas_id)
 		qcom_pas_metadata_release(pas->dtb_pas_ctx);
 
+	if (pas->dtb_pas_id) {
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
+
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
 
@@ -361,8 +362,6 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 release_pas_metadata:
 	qcom_pas_metadata_release(pas->pas_ctx);
-	if (pas->dtb_pas_id)
-		qcom_pas_metadata_release(pas->dtb_pas_ctx);
 
 unmap_dtb_carveout:
 	if (pas->dtb_pas_id)
@@ -381,6 +380,12 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
 disable_irqs:
 	qcom_q6v5_unprepare(&pas->q6v5);
+release_dtb_metadata:
+	if (pas->dtb_pas_id) {
+		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
-- 
2.34.1

