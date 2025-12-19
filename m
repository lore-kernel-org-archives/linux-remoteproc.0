Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D14529A9C9
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 04:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118886; cv=none; b=MogeHr+is7Kpb6ePY1GoKCwFZWV+pyFv7qmTiQWMk9WFWpPwTE9wVP+xxI58XU+wy012tAqkR6d2QHmnwThB1gLJPJDGDllA9mkigd5WenK87PV61CUozYXEKYCzuGb2tFqoecglvRiAkF9L+k2PfWtGVVdKF7/fEbXTALyV0dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118886; c=relaxed/simple;
	bh=u29hxsmwPhk1UQfB0/YVquWdqacle28E3i8SiHCXV3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkhoIIY5qmHkoPvCXZn+aQ6qRQvCXvzGEivkR0wsHLxN0DzkKsNDFHcLr/sLhneM5XV4bfhrPv9oyLAHNb1D6WUVyFsL90zJkkZko8AySCjfacSg9+fRNT7PDA1KRphbs65zcBEEBIFZPXHQ07I2Rir5pIo0ofN+80U7KB3FVGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHQgA1LB; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHQgA1LB"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-640d4f2f13dso1400451d50.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 20:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766118882; x=1766723682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+vTKBtx//vjYt+XiBbUDqLER0bvuALHZQ3ubeKSjpI=;
        b=gHQgA1LBPot6Oz+dj0Msbmx4jbWkQVi8nS0DyltAg/lM0Pk73DMYcOYIhU/qQHynol
         64StaJFIzcfvHmwngk9A3oqKSD/6modJklfE0fq9AdEDLzGWQnA0Fki8gQ4GVan8ALnW
         PFfZLkzeqXmfHcRlKXBu6/DNT4KmzzOANI+BKEa82+hFrYDGApjM6EXMVlBccFLG7bu0
         NVyVIC5J4dD9l3RMmoK4NYjCXtsyhL4+uT7FdmE07VDJgE3k0jYWvIKf2zHk016K3U9I
         0GrkbOfp59C2fE8KwzVsthus79zgjfCx3QVguedxbpnma/IR0tSu04EaZcrYsZKlT4pJ
         yKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766118882; x=1766723682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y+vTKBtx//vjYt+XiBbUDqLER0bvuALHZQ3ubeKSjpI=;
        b=XnQQ/PKYUZP6L2XXQb+kECDR79k6Ow3hwCJOLVMSJuX5Ly8JND65ZW2WTyaomhkDue
         pGsNPmeyZ9rOdoEomQMv9yNI0SwqDO3aq7vwci0Bq++2h3hxNAdftzNOFxnoLGm2w7WM
         TNBpQHKrXpOX3NoTKrC/4oENKgMIblOAGNuHMMdDUedAICKK4O+rGuEqRZP9PvsBA69p
         KSWW+bBmlq5BVbFbtDDCSKFUZ307sR/+bdBvywhv0soHRCH6HovljKbGnhlnqUdzforV
         nQ+mgyRSV87+P2AboaBlNydue/AUbVEQbZ47DG5Ulc2ZDOR1Sa+U1/PU0UxQsKR1aikI
         0VxA==
X-Forwarded-Encrypted: i=1; AJvYcCXb1nSA58X/VmdYOl89eqb647ncRTodgETaf4Dj3/I+cQBarREWWro/QJOyjXG9y8jx+nTrDQAfvjkV8DCgBFtI@vger.kernel.org
X-Gm-Message-State: AOJu0YylxtD3RcRKKeJ6knVHSMIk6xa3CZTHRHMQdyzQ/mb7IV2YmOcB
	LQSewguuX2DX5CItX9uhGcPwsc1H1ifXGI5hrF1RYr1evVelmlf6kCxb
X-Gm-Gg: AY/fxX4Iz9iQd10o7pwfnKrXoEKey2DjNs2UpE3U3cs41KgeM3i9PckV4fA58D/a46v
	yjDH7SENo086eaahwTTlGlmFFhViPyvlrc6qCKeFiaU9y1gG2JfH+g5pK/X3rH1vxL/Rn8UYN/S
	9ZsG2nPpB77skt42cSVonmc2twCBykoCJHBq8Z9gSz4tBbaniGM62Hr43j3jL3rFPqT2xXe4uwO
	qPnVuDvrK6tXOyKPn+LrI6B2h4++uy0XCRQ9s9lIbGLCh/doKNvxnzD0nuAExskXqkh3G40R7Bf
	UYFjij6QfHHRSaYjSEZG9xHTLWGQ5L5ChMLfZerC9SYs9U0E/kMJO5yecJmwAuSv+kflI5RniUO
	6hX+gBP1hp4+4Ksk1vGl1VCh2YiWO8RO8aZsM86aFDE/72A7Tm3oJU2J2VrqLeYy+vsiGQupsK7
	YN0dTaP7Q1HzLR3oB+13U8uWwk2oj1AYp5sf3Y8f2yqTeNGgH5SK8A+vg+I6/ZnkntAwAx8+oqY
	ICT5wzV5li+4IKM3ZniUJKc14gM
X-Google-Smtp-Source: AGHT+IG1tDqxMlHlyXUpMvdAU1tHnKILoSJHXFoLrENw914cxBK1DHdwCiFGlWBPuQgZrvuvRbIuDA==
X-Received: by 2002:a05:690e:1348:b0:63e:3b29:f1d7 with SMTP id 956f58d0204a3-6466a85e44dmr1325144d50.42.1766118882495;
        Thu, 18 Dec 2025 20:34:42 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb452c441sm5610227b3.46.2025.12.18.20.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 20:34:41 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	krzk+dt@kernel.org
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
Date: Thu, 18 Dec 2025 22:34:15 -0600
Message-ID: <20251219043425.888585-7-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251219043425.888585-1-mr.nuke.me@gmail.com>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPQ8074, IPQ6018, and IPQ9574 support an m3 firmware image in addtion
to the q6 firmware. The firmware releases from qcom provide both q6
and m3 firmware for these SoCs. Support loading the m3 firmware image.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 44 +++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index b62e97c92d058..265010c5c82cb 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -101,7 +101,8 @@ enum {
 };
 
 struct wcss_data {
-	const char *firmware_name;
+	const char *q6_firmware_name;
+	const char *m3_firmware_name;
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool aon_reset_required;
@@ -161,6 +162,7 @@ struct q6v5_wcss {
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool requires_force_stop;
+	const char *m3_firmware_name;
 
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_pdm pdm_subdev;
@@ -922,11 +924,40 @@ static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
 	return wcss->mem_region + offset;
 }
 
+static int q6v5_wcss_load_aux(struct q6v5_wcss *wcss, const char *fw_name)
+{
+	const struct firmware *extra_fw;
+	int ret;
+
+	dev_info(wcss->dev, "loading additional firmware image %s\n", fw_name);
+
+	ret = request_firmware(&extra_fw, fw_name, wcss->dev);
+	if (ret)
+		return 0;
+
+	ret = qcom_mdt_load_no_init(wcss->dev, extra_fw, fw_name,
+				    wcss->mem_region, wcss->mem_phys,
+				    wcss->mem_size, &wcss->mem_reloc);
+
+	release_firmware(extra_fw);
+
+	if (ret)
+		dev_err(wcss->dev, "can't load %s\n", fw_name);
+
+	return ret;
+}
+
 static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
 	int ret;
 
+	if (wcss->m3_firmware_name) {
+		ret = q6v5_wcss_load_aux(wcss, wcss->m3_firmware_name);
+		if (ret)
+			return ret;
+	}
+
 	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
 				    wcss->mem_region, wcss->mem_phys,
 				    wcss->mem_size, &wcss->mem_reloc);
@@ -1187,7 +1218,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	rproc = devm_rproc_alloc(&pdev->dev, pdev->name, desc->ops,
-				 desc->firmware_name, sizeof(*wcss));
+				 desc->q6_firmware_name, sizeof(*wcss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
 		return -ENOMEM;
@@ -1198,6 +1229,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 
 	wcss->version = desc->version;
 	wcss->requires_force_stop = desc->requires_force_stop;
+	wcss->m3_firmware_name = desc->m3_firmware_name;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -1275,7 +1307,8 @@ static void q6v5_wcss_remove(struct platform_device *pdev)
 }
 
 static const struct wcss_data wcss_ipq8074_res_init = {
-	.firmware_name = "IPQ8074/q6_fw.mdt",
+	.q6_firmware_name = "IPQ8074/q6_fw.mdt",
+	.m3_firmware_name = "IPQ8074/m3_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
 	.wcss_q6_reset_required = true,
@@ -1284,7 +1317,8 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 };
 
 static const struct wcss_data wcss_ipq9574_res_init = {
-	.firmware_name = "IPQ9574/q6_fw.mdt",
+	.q6_firmware_name = "IPQ9574/q6_fw.mdt",
+	.m3_firmware_name = "IPQ9574/m3_fw.mdt",
 	.version = WCSS_IPQ9574,
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
@@ -1295,7 +1329,7 @@ static const struct wcss_data wcss_ipq9574_res_init = {
 
 static const struct wcss_data wcss_qcs404_res_init = {
 	.crash_reason_smem = WCSS_CRASH_REASON,
-	.firmware_name = "wcnss.mdt",
+	.q6_firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
 	.aon_reset_required = false,
 	.wcss_q6_reset_required = false,
-- 
2.45.1

