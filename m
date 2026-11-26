Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696939;
	b=wcumvyP3GJ9HkocKd4flGiESOwRR7HB+F4uAJw+bLhgbSIW5EzBOpt4h2wCe4/xlCxs3
	 MABD6tFF64PUGFWpnmeVrhb/WomdjPFOYfLiDKiE76/neDXlFYLVqGWFEXs8hbq3tNCWE
	 zSwt8HN9xBMIWu0G3tIh/eoX64AB3P1SNv3MqliIsSYP6PWGyoOQzSUkLQ9zLuwBw8GXq
	 FvPzoKd2dRQLaUy4QXPYQZlP5yzT3DtM67+Zz2sw2qK/6D/vuVDEnZcTyx132+GDPzSbc
	 elAV+X+U+GuNn+7vYuCaLaGCxikAiw7L4cC0tYc3KgLVPYA0pqJptaa87DZNwQ/oI7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=buMeQQDfJsDcXVlRtFz7hMPHQNqj9L9yHfXuPxjS13o=;
	b=iphsHdqSmHlSUOocLCgQH/CaTTItBYK7F6fvotMhFPBL1loZujPp0qPoFMpqsXAiFe4l
	 VRLk7m+1iNZ73008fY9CWT9RG0UF7XPNse5RsLtyGW/fH4pq4kwfYxW3ItpaVnBu2u+YQ
	 XVZ4fa6mK2HNh2bsAp3BvSuL33icOS3wphp/Z4y0yMfHVYKXyn1m5vqGRBUb7adHPOnG/
	 AHuiy85Yb1/NejGoJjERASzvozcNeDGafHkdYWHyaH/ehlu1uYZvKkum7vNmDP1NIO5ld
	 7bRszVq0+7h6LKx6XTDOosQpYyM3wC1yxLVUv6Xx4Vgzy89hdlVifDutlc1nCtmGwIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=luxonis.com;
	spf=pass smtp.mailfrom=luxonis.com;
	dkim=pass header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=OL0iv+DM;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD416606A321
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 12:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD416606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=luxonis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luxonis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=OL0iv+DM
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so74299455e9.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 04:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=luxonis.com; s=google; t=1795696937; x=1796301737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=buMeQQDfJsDcXVlRtFz7hMPHQNqj9L9yHfXuPxjS13o=;
        b=OL0iv+DMJtRYNrKRLTgwyzvZiNBVu+BWNFIAfYe+IKgR0EZaoGmpN3LiYHfjG+tVMP
         jSe/aO5M7YDNLxTllDcGo3AvlABhGT2r3CmP3GaYqHf7/9O1T292d9sFhMlyZtOvCWjA
         YhLwEuOz176lrq7NvXEDNZqECY1LbeJGdSp7sRhu6XsbCOap1KtJBEJw6ckl90DtiuUO
         Ajn66NTPyTYn/7bBkivQ8az3R1aNAjhBOlZS3mVbhRyxdC1pm2mXdTuz/w11LXrxmsoa
         f/Wiqp2vGnSpDCOzYGdf2h9SEqtuLrwE5BLqfVd1QmpKmvxg1grJ1/2Jp2GhyjKJwo/c
         NZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696937; x=1796301737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buMeQQDfJsDcXVlRtFz7hMPHQNqj9L9yHfXuPxjS13o=;
        b=O0aDlPdrpxzOPYIcm0OhbYu1wpNa/pGYoUwGJ8k4qm5isUy0OObw6iKtZmxeRYDSOZ
         Me6/uqb7L4bvOkqo0m/p7wWcH+zPUr/LuYr4HHh7llkmsZAuVoD7/ybs4yEMRjreD9PV
         HsqcYmjGxqFqHG3bXAw/rm4VcjnZOq4sK4e5w1rEAig/VEz011NAqulGIzI+w4jxwkSE
         SjJlVJoWOXXCn3fAr9+oWGPU5CJnJwqqVyTyiV+99+byXpI+xRseLQlKYNZD1DNY+oE+
         oOcyOs9lMDSpC5+VmZfD7ksd8TGb2jKKAjBdCfolpSsRgtGRfyCsrWUleTJozR5njlno
         gVHQ==
X-Forwarded-Encrypted: i=1; AL+hErE7PVge1jmXpv2DH2SJZDBVvfu4tZ8Lg4YbFougBDDBjmszGW1NtsLKPcgXaFg7Gbm+4T1DYs13X7ycc0hwz1oZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9L83xWso+PI0hugPkF1t1IJ7wDdyrqsAoxajT5OUdV0UvdxVgh
	3wGwjsr4tInQstSBiE1/I+SZx5HMA8JooiwJfLM4NK4BDzl92vlznLgQ0TgLR/8Hzqw=
X-Gm-Gg: AZFdTZf/EIIHddGF/dDXuFXLLkmUrUgSB4sv96hB+SWou0jBfP8v3diA1Eh1kza9jLo
	POBXiy++05laJncp0D5hrx5Grpq8AAR0e/poDjAqD3ECyJkK2Re26bzvEOGn27SEv1A7Cp9T1aQ
	+I04KVWd8wwSa2dpN4f2JIXJqcw3llo1+zmwKuCpjW4sK5z9Qnc/C/Rqq7D9ED0I6WBiyJDr4Wq
	vAgwRVkYbDmp53CZzaR62P10QRELAwwqFs/QpJuSGKmyDmQB0TnUCSOQ9hh0iAEdx29YRTpOKZb
	nhpe7uB58MZjKnALMRndEgrGcEWG4Y8JLFj7ux/tHnvVMeqUFvXNFUYMLTFqTVbm8FHO2lAPkNO
	bg5JY0UYwfYjmsoNY9SEL3eq16CQTozQMRZ6FTARrG3F9Zg5bCfYejRGmTW02zoYOxXxPs8BALy
	t1CrWEsbUvudQeEvyMJ1+KHTK4ei4cIuJyU2G4Ztg/HN/KCZDYWAzdDD5S4NdR7dymAyC0B9GBZ
	FLcmFGFynQ6E6PVHdSIzg6ZmZwIFNs8gmn6ompjIqt5yF7emLn5k6T0dIFLg/ES3UZa0I6IYM4E
	JrilVbBmQkUdq/zawqOUmSbiHAvmnWkLUWnT1eH2SWdzWfASSe12lmWoh7qDu0wo0gUVEQ==
X-Received: by 2002:a05:600c:64c8:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb88819be1mr398470945e9.16.1795696936947;
        Thu, 26 Nov 2026 04:42:16 -0800 (PST)
Received: from JureBuildPC (46-150-36-237.static.telemach.net. [46.150.36.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm577708965e9.8.2026.11.26.04.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:42:16 -0800 (PST)
From: Jure Rebernik <jure.rebernik@luxonis.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: konrad.dybcio@oss.qualcomm.com,
	mukesh.ojha@oss.qualcomm.com,
	val@packett.cool,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jure Rebernik <jure.rebernik@luxonis.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] remoteproc: qcom: pas: Request stop before tearing down GLINK and SMD
Date: Thu, 26 Nov 2026 13:42:07 +0100
Message-ID: <20261126124207.2665762-1-jure.rebernik@luxonis.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On QCS8550, a crash of the ADSP that the host reports, for example
through the remoteproc debugfs crash file, can reset the whole SoC
instead of restarting the ADSP. On two QCS8550-based boards, crashing
the ADSP about 4.5 seconds after it had started reset the SoC in 19 of
42 tries. The system stopped right after the recovery started, nothing
more was logged, and the SoC was reset 6 to 7 seconds later.

Since commit 0ea50486978f ("remoteproc: qcom: q6v5: Request shutdown if
crash is triggered host-side"), qcom_q6v5_request_stop() sets the SMP2P
stop bit also for a crash that the host reports. It is called from
qcom_pas_stop(), which runs after rproc_stop() has stopped all
subdevices, so the GLINK and SMD edges to the DSP are already gone. The
QCS8550 ADSP firmware treats the stop bit as a fatal error and runs its
error handler without those links.

Request the stop from a new subdevice that is added before sysmon, so
that it stops after sysmon and before SMD and GLINK. The firmware then
handles the stop request while its edges are still registered. Crashes
that the firmware reports and graceful stops that sysmon completed are
not affected, as qcom_q6v5_request_stop() still skips the request for
them. The call in qcom_pas_stop() stays for a stop without subdevices.

With this change, none of 104 host-reported crashes on the same boards
reset the SoC, 24 of them CDSP crashes.

The problem was found and this change was written with the help of an
AI coding assistant. The change was tested on QCS8550 hardware, and I
reviewed it and the test results.

Fixes: 0ea50486978f ("remoteproc: qcom: q6v5: Request shutdown if crash is triggered host-side")
Cc: stable@vger.kernel.org
Signed-off-by: Jure Rebernik <jure.rebernik@luxonis.com>
---

Notes:
    Changes in v2:
    - Shorten the changelog and move the test details and the tool-use
      note below the --- (Val Packett).
    - Rebase on rproc-next f39ba58941ef. No code changes.
    
    v1: https://lore.kernel.org/r/20261109175752.793130-1-jure.rebernik@luxonis.com
    
    Testing: Luxonis OAK4-S boards (QCS8550) with a kernel based on v7.2.6,
    which has 0ea50486978f as stable commit 0dc9e289bbb5. Crashes were
    triggered through the debugfs crash file. Without this patch, 19 of 42
    ADSP crashes 4.5 s after start reset the SoC. With it, none of 104 did:
    40 ADSP crashes at 4.5 s, 20 at 4 to 15 s, 20 while the ADSP was
    streaming IMU sensor data, and 24 CDSP crashes. A crash that the
    firmware reports could not be injected.
    
    On v1, Val noted that a subdevice for the stop reads a bit oddly. The
    alternative is a hook in the remoteproc core that runs before
    rproc_stop() stops the subdevices. That changes the core for every
    driver, so I kept the change in the PAS driver, but I'm happy to rework
    it if you prefer the core hook.
    
    qcom_q6v5_adsp and qcom_q6v5_mss also call qcom_q6v5_request_stop()
    from their .stop callbacks, after the subdevices have stopped, and
    qcom_q6v5_wcss does when requires_force_stop is set. I have no hardware
    for them and left them unchanged.
    
    Built for arm64 (defconfig, drivers/remoteproc/, W=1) on rproc-next
    f39ba58941ef, without warnings. Not done: sparse and runtime tests with
    lockdep and the other debug options.
    
    Tool use: Claude Code (Anthropic) ran the investigation and the tests
    on our boards, found the ordering problem, and wrote the code and the
    changelog. Its first fix skipped the stop request for a crashed DSP; I
    asked for the request to be sent before the teardown instead, which is
    this patch. I reviewed the code and the results.

 drivers/remoteproc/qcom_q6v5_pas.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 57a111a0d7..ddbffe45d9 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -138,6 +138,7 @@ struct qcom_pas {
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_rproc_pdm pdm_subdev;
+	struct rproc_subdev stop_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
 	struct platform_device *bam_dmux;
@@ -429,6 +430,14 @@ static void qcom_pas_handover(struct qcom_q6v5 *q6v5)
 	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
 }
 
+static void qcom_pas_stop_subdev(struct rproc_subdev *subdev, bool crashed)
+{
+	struct qcom_pas *pas = container_of(subdev, struct qcom_pas, stop_subdev);
+
+	if (qcom_q6v5_request_stop(&pas->q6v5, pas->sysmon) == -ETIMEDOUT)
+		dev_err(pas->dev, "timed out on wait\n");
+}
+
 static int qcom_pas_stop(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -1012,6 +1021,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	qcom_add_glink_subdev(rproc, &pas->glink_subdev, desc->ssr_name);
 	qcom_add_smd_subdev(rproc, &pas->smd_subdev);
 	qcom_add_pdm_subdev(rproc, &pas->pdm_subdev);
+
+	/*
+	 * Subdevices stop in the reverse order of addition. Request the stop
+	 * after sysmon has asked for a graceful shutdown and before smd and
+	 * glink are torn down.
+	 */
+	pas->stop_subdev.stop = qcom_pas_stop_subdev;
+	rproc_add_subdev(rproc, &pas->stop_subdev);
+
 	pas->sysmon = qcom_add_sysmon_subdev(rproc, desc->sysmon_name, desc->ssctl_id);
 	if (IS_ERR(pas->sysmon)) {
 		ret = PTR_ERR(pas->sysmon);
@@ -1049,6 +1067,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
 	qcom_remove_sysmon_subdev(pas->sysmon);
 deinit_remove_pdm_smd_glink:
+	rproc_remove_subdev(rproc, &pas->stop_subdev);
 	qcom_remove_pdm_subdev(rproc, &pas->pdm_subdev);
 	qcom_remove_smd_subdev(rproc, &pas->smd_subdev);
 	qcom_remove_glink_subdev(rproc, &pas->glink_subdev);
@@ -1081,6 +1100,7 @@ static void qcom_pas_remove(struct platform_device *pdev)
 	qcom_remove_sysmon_subdev(pas->sysmon);
 	qcom_remove_smd_subdev(pas->rproc, &pas->smd_subdev);
 	qcom_remove_pdm_subdev(pas->rproc, &pas->pdm_subdev);
+	rproc_remove_subdev(pas->rproc, &pas->stop_subdev);
 	qcom_remove_ssr_subdev(pas->rproc, &pas->ssr_subdev);
 	qcom_pas_pds_detach(pas, pas->proxy_pds, pas->proxy_pd_count);
 	device_init_wakeup(pas->dev, false);

base-commit: f39ba58941efa63e6c7d10d53d183d6077524bdb
-- 
2.56.0

