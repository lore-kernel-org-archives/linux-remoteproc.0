Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C9B435EF3;
	Fri, 21 Aug 2026 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300155; cv=none; b=RniJTy4keUQMGw/PdxXTVrCTiypKTgGC7lsSO0vUlK0O/8XfTO7hYaAAOQmP/H4bVc/lFU5/piHkMcGFL+XQYC1uM6sAIToeC4R7eQe0D3nHkmGqynb8Xotu+Y5GzxfBAg7p+EF2bIx5W4usVCcPx3rrKfzsx9vaiFUYZCua/cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300155; c=relaxed/simple;
	bh=jOyVG+WwPv372q41edGqCQq4qsPqPMvY/811tMjqsHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tf9oqQwns2/NISupp84hrNi46fD2L/FFSB6yCeNpFLj1qSl+ZsfFaT5C7imz6AGjP70vwdqqEz9iQxuSUcG7V9s0KJLMnBLjUAKeGHkYnBHo7utU3lNE5VvNqGMxhNvJ9tnwFC/eTP4gmub0HRnfDbnVobM0n0rmWuhkEkr+1vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=holtechnik.com; spf=pass smtp.mailfrom=holtechnik.com; dkim=pass (1024-bit key) header.d=holtechnik.com header.i=@holtechnik.com header.b=Sgi9kcL7; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=holtechnik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=holtechnik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=holtechnik.com header.i=@holtechnik.com header.b="Sgi9kcL7"
Received: from localhost.localdomain (192-184-175-24.fiber.dynamic.sonic.net [192.184.175.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: phollinsky@holtechnik.com)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id 358BB485B9E;
	Fri, 21 Aug 2026 08:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=holtechnik.com;
	s=default; t=1787300154;
	bh=tplTwxBcQnlsHR+fiXgn8x5nZCtSC7P4+/RRAZuGJ20=;
	h=From:To:Cc:Subject:Date;
	b=Sgi9kcL7wLv6JovvbJTawUcGyeMTIGb0CnEQ9rli0XoKU5X6glKOO10J9eoFm1CGh
	 k6qnDP6+H4En9boxaxkbRUQDoH04Rz8o5YgeVK7kWvXQF1yc4o6w/YYoKsBOsjFhAQ
	 ofsHDuHXt/tUsBekU7xjnEA8wKW1FkIjvYhPt7sA=
From: Paul Hollinsky <phollinsky@holtechnik.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Konrad Dybcio <konradybcio@gmail.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Paul Hollinsky <phollinsky@holtechnik.com>
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Don't require PAS for memory protection
Date: Fri, 21 Aug 2026 01:15:40 -0700
Message-ID: <20260821081540.89137-1-phollinsky@holtechnik.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS
TZ APIs") changed the probe-time gate for need_mem_protection platforms
from qcom_scm_is_available() to qcom_pas_is_available(). Memory
protection in this driver is implemented with qcom_scm_assign_mem(),
which is a TZ service distinct from PAS. The only PAS call in the driver
is qcom_pas_mem_setup(), and it is already guarded by need_pas_mem_setup.

No descriptor sets both flags: sc7180, sc7280, sdm660, sdm845, msm8996
and msm8998 set need_mem_protection only, while msm8937, msm8940 and
msm8953 set need_pas_mem_setup only. On TrustZone firmware that does not
implement PAS - for example SC7180 Chromebooks, where call-availability
queries report every QCOM_SCM_SVC_PIL command as unavailable - the modem
consequently never probes:

  platform 4080000.remoteproc: deferred probe pending: (reason unknown)

On those machines the modem is also what loads the WLAN firmware, so
ath10k never receives QMI and wifi does not come up either.

Gate memory protection on SCM availability as it was before, and require
PAS only where a PAS call is actually issued. Keeping the SCM check
matters: qcom_scm_assign_mem() passes __scm->mempool to
qcom_tzmem_alloc() without testing __scm, so dropping the gate entirely
would allow a NULL dereference when qcom_scm has not yet probed.

Fixes: f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs")
Link: https://lore.kernel.org/r/20260808034716.58888-1-phollinsky@holtechnik.com
Signed-off-by: Paul Hollinsky <phollinsky@holtechnik.com>
---
Reported and analysed in:
https://lore.kernel.org/linux-arm-msm/20260808034716.58888-1-phollinsky@holtechnik.com/
Konrad agreed with this shape in
https://lore.kernel.org/linux-arm-msm/b63e93e4-2f4c-4cad-b726-e1b0565379d7@gmail.com/

f3b1357673dd is not in mainline yet, so this is based on
remoteproc/rproc-next; it would be good to get it in before that branch
is sent on.

Tested on a Lenovo IdeaPad Duet 3 (sc7180-trogdor-wormdingler) on
next-20260805, which carries the same code: with this applied the modem
probes, mba/mpss load, and ath10k_snoc gets its QMI handshake so wifi
comes up.

 drivers/remoteproc/qcom_q6v5_mss.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index bef198b9ee63..2f71ed2feff6 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2079,7 +2079,16 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
-	if (desc->need_mem_protection && !qcom_pas_is_available())
+	/*
+	 * Memory protection is done through qcom_scm_assign_mem(), which needs
+	 * SCM but not PAS. Only the memory setup path issues PAS calls, so
+	 * requiring PAS for every need_mem_protection platform prevents the
+	 * modem from probing at all on TZ firmware that offers no PAS.
+	 */
+	if (desc->need_mem_protection && !qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
+	if (desc->need_pas_mem_setup && !qcom_pas_is_available())
 		return -EPROBE_DEFER;
 
 	mba_image = desc->hexagon_mba_image;

base-commit: bb840ea69347aff7bde5a208e7b5b180669a7656
-- 
2.55.0

