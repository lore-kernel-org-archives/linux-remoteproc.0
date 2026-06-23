Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6C12C21EE
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 09:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205546; cv=none; b=O1jUA6ld/yi2xLCH3etUywqBLoorF5Uhl1Mpn/oHb8o8vVZzvUZfJCZaLiDpFb6KuSTuPR7KpVMwO7OMJKm28Te9dhPHsEQPgqu04yyqHS0KxmThm09C5FFkfAvgVY4fXppT3zNe1PBXaeEMn8HKLjUzatOxDhiR4na1EDSphCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205546; c=relaxed/simple;
	bh=pu8w4P/nDuTNTkmnEBp8F0iOVLXwB6GH7+/giUwGfHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LELlr0f1Z7Uf+XP+RZQUCr27q58fU5jEItQzw0DyPJ/VlR9YzEdRgsYmxsDNa1GszgIlQ6inBui8e0sVIic32x6SLDtvuWVzPms1+l97NFnIHnfVYT7W4XMMbN22dA52yWmGO17tJFqFpxYg52HyavyUCZZxPcdKdw8u3EAUAW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SE32l5HH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZeU4sKjt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SE32l5HH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZeU4sKjt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8V3n03245013
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 09:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPLVsIWGYT3KSHtHr/4l9zFWb2GHXl0qHsEEPe9Dyfw=; b=SE32l5HHs2A7Ohz6
	XL8BoQRdNrcOBJBZvuczAW2lVnP8Co1+ElVrSsaESurJwqA45zIUWcAoIpe6ZLji
	Xj0dtXYARWTYTiTwOOYhoSj3jv0ClFwMLZTKqnCVetfWbhoIPxXdeg/VGQmM6Mhp
	jNrm80mlYU0Ku7n7asKfuCpb65AiNg8Vh0jZeaBPciwu+k7IUvIDbykKLm2z9A1M
	wc/CozAPl6teJbLjTg1v7O1m/2BD/Ieuu7UR/tpB3TQ4u7cQBVE/2yyNYY2Y8OTq
	CJ8et922sEeZCTKXYBpYmkfH1Yr0GDKqUd95l4jFkxVkamOpB/O5kx11NVeJqGPg
	ty0EGw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyg452-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 09:05:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso9844285eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 02:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782205543; x=1782810343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPLVsIWGYT3KSHtHr/4l9zFWb2GHXl0qHsEEPe9Dyfw=;
        b=ZeU4sKjti8lJ6ujHBidLAi/1fAiqrb37jthvcLWzGg6qjWJ8HB4KtCOiT7RxU0UNcg
         AICFKePwd04VtGfQiyIEf3tKRrru3IYYoFaPIKs/8fiJFMpUNPYdijCEyghs7Y0qof7M
         xlQpcxDaTZBjTo8wDJpiNNS52DiDQNpZnIToXkYMaLsQ/ttuyFuaA8wi9h3UIYWbFHkD
         lkQrJVdqKtD37cYMSDmse4cfoeGXRZ/WPa1fMiSCCsQofMoZv3mBmUw7EX+Br+CYi4xR
         pwPBSjBnfeXNk5jPvZChjeQiW1RBzKOtGDSc5m0cPnp8rtG+j9tUDQo8dj/0y0EJGYAB
         m8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205543; x=1782810343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FPLVsIWGYT3KSHtHr/4l9zFWb2GHXl0qHsEEPe9Dyfw=;
        b=jWz5S0kXFHLLXb/yKBT7oX45DjlptfFMZKqkrN2E6G6K7P6WJmadn6INfPQXEQ0KlI
         HK2qEs+zz+HLlWBhU5u8vvfK/pkwQJ3q469n++CmdketnrIKD9C0AHzmlRR95kyxHODe
         l1HGHQP7xFX9TTGPRE/t5h+II6QmGLdHQwXxv8B9r4+K2m/UfGmTFgEqrrCanNETfFPe
         fEDLocUoaZ4dH/eSsJrLSoC+5bAvc0r6F0I3f//uZFMwv0aoxT3ISXh1yJHS/y0YMLpI
         Bb704BHw6fdvpyF2FRwVBnuQq0yQsrNrtGfQuNhBtiFbva3WSHFClDHOBS/UbOLYyOv1
         A1Tw==
X-Forwarded-Encrypted: i=1; AHgh+RoupN4bJq9foQMFQRa4QOiSWaV7+9zxtVi5/DWm9Pyf0vxdr8nX2lCM89IPJuRxBQnOEGrVi29i89Uh+OE68SCP@vger.kernel.org
X-Gm-Message-State: AOJu0YwmqanIQxqiB6wCtZcpp+ZCc/X7952Jw4NVStdS5S1gxni9og38
	Il63WpISo6BFhQQ6+Mkbjk1nqC+e5+iEik76hBiwjHAl0PmqQDPTU4LNxOJ3r0HJ10IHjN3AZT0
	zow6jS0cs/apFLsuON5rYOanqAGIG+eoMmV3hDFVX1heufr8EJk+xTriz/Tigyf2qswwapNOHJq
	FXGbninHg=
X-Gm-Gg: AfdE7cmhtE3piW+p7Zl+kj8KtULbBJcTRKcLXzqbgUwZcohJA6QMVnOM/fA+wQWpsKW
	9QBO6cvE74uGXftfLiLAN/oQNyNo/T+ykxT7QjVYNfpwDFXovG89qmhoEsVkHDKtbpA97cRhWuZ
	9k5MlRNXJRAGOYmbkgGCNx3reHh+HWpgn7Sl9/5eQszzzozGLGxapiLXmCq3bPomZY+ZCmGK859
	/M8cfmxOVKxQKR+Ji3TD0h8afzLo4rtsEgIi2NVFQZA9lP6kj+q51uwE26skEypSQKlHN0ftFPx
	6zcNkERbE1rWAHfiMyt1U39zMiAsR7yUQqpSG5QV3V32ZtWG82GReGQKwimIL+Qz65HP1I/Zo8x
	WbpZMA11a0vdh3ddTLguULfBIcg46ZXN0+BHfwzozuhcRsG6ASk8rtrBicp73JA==
X-Received: by 2002:a05:7300:ca7:b0:30b:8893:8788 with SMTP id 5a478bee46e88-30c58ae0f2fmr1643879eec.13.1782205543298;
        Tue, 23 Jun 2026 02:05:43 -0700 (PDT)
X-Received: by 2002:a05:7300:ca7:b0:30b:8893:8788 with SMTP id 5a478bee46e88-30c58ae0f2fmr1643861eec.13.1782205542828;
        Tue, 23 Jun 2026 02:05:42 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be5c5desm15202122eec.28.2026.06.23.02.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 02:05:42 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 02:05:34 -0700
Subject: [PATCH v3 1/3] remoteproc: core: Attach rproc asynchronously in
 rproc_add() path via schedule_work()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-rproc-attach-issue-v3-1-8e24310707ce@oss.qualcomm.com>
References: <20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com>
In-Reply-To: <20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782205541; l=3261;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=pu8w4P/nDuTNTkmnEBp8F0iOVLXwB6GH7+/giUwGfHk=;
 b=cLt+gooL3il/Tf1xqEhCZdB+z5FNWEQe1EGC6YjEQjK4GvUhtA2qsG8OOBMCmKcqIw2Y7XZmg
 3uUe3eDS8YGDMltQHDZxjJC8Ic1u43ucKdnl9ZgXOF+SDQDm47KV9MH
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfX2JL48KzTHZQ+
 iVvHKms3XR9V7EBF9l6eDOeQJFPnaHUtGC12BRvBQjqPzDYDVhROG3sQQ2KzuWaO8xeEU7ygyYP
 HMDOUKZS3BsjOpXY7a+jz4dgdbHbYdYLaBrbBtRj9a+fRtrqn8AbRf9A0bVgvVMt8HwV8+9wh1Q
 rj9/pokGqESLx0VviGIGRGLdmMGCt/PEMw3JfhOJjP3GEIZn0dnWwMILF4gwMWdbY2kr3sjxDS8
 pwb7nsYQYFIhlvVoeMhbaAy0kNAYR0MvpXJJ52QRZB90uHYY+iwCMu0+broeftdiRbEkeHY5ayM
 56Dl2Wb2ZwoufhVeNujpsj6ovWqhlzDQ2CWIbV9HAfIu80oZnl2DCYUnRX9QswIXjCasejE1rs3
 3Pq1QBA2+I9dDamornUhM+OrjhA0NFHRZgVkGHgXApAcSO3neUVd14KCvo28YSfRZjs71vvk7qP
 hUsmEtiZmEzjhcdl60w==
X-Proofpoint-GUID: DGGgd5jGwuhGRb4viy5KgIrE79wHVPTD
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a4c68 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=SwIuEO_x4BL_LcR9stwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfX8RKJIHCdRB8o
 fRrMW+yAcG9spfOfYFETV1rvVhIl9SSKovY8Kkh1nUn2ofE6aEVqfIZIFgDmwzS+Lh0v+avt4Ho
 UPHaNySm/ePf2djX82aZT3Jvk6EOFCQ=
X-Proofpoint-ORIG-GUID: DGGgd5jGwuhGRb4viy5KgIrE79wHVPTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230072

Unlike the remoteproc firmware load path where rproc_add() call
rproc_auto_boot_callback() asynchronously and ignores the return value of
rproc_boot(), the attach path calls rproc_boot() synchronously and
propagates its return value back to rproc_add(). This means a failure
during rproc_attach() causes rproc_add() to fail and triggers resource
release, removing the remoteproc from sysfs and making it unavailable for
recovery or further boot attempts.

Align the remoteproc attach path with the firmware load path by
introducing attach_work and scheduling rproc_boot() asynchronously via
schedule_work(). This keeps the remoteproc registered and available in
sysfs even if the initial attach attempt fails, and avoids blocking
rproc_add() on the attach result.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 20 ++++++++++++--------
 include/linux/remoteproc.h           |  2 ++
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f003be006b1b..50f754e27d1a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1668,18 +1668,21 @@ static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
 	release_firmware(fw);
 }
 
+static void rproc_attach_work(struct work_struct *work)
+{
+	struct rproc *rproc = container_of(work, struct rproc, attach_work);
+
+	rproc_boot(rproc);
+}
+
 static int rproc_trigger_auto_boot(struct rproc *rproc)
 {
 	int ret;
 
-	/*
-	 * Since the remote processor is in a detached state, it has already
-	 * been booted by another entity.  As such there is no point in waiting
-	 * for a firmware image to be loaded, we can simply initiate the process
-	 * of attaching to it immediately.
-	 */
-	if (rproc->state == RPROC_DETACHED)
-		return rproc_boot(rproc);
+	if (rproc->state == RPROC_DETACHED) {
+		schedule_work(&rproc->attach_work);
+		return 0;
+	}
 
 	/*
 	 * We're initiating an asynchronous firmware loading, so we can
@@ -2507,6 +2510,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	INIT_LIST_HEAD(&rproc->dump_segments);
 
 	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
+	INIT_WORK(&rproc->attach_work, rproc_attach_work);
 
 	rproc->state = RPROC_OFFLINE;
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 7c1546d48008..f1d14d075bf3 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -259,6 +259,7 @@ enum rproc_features {
  * @subdevs: list of subdevices, to following the running state
  * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
  * @index: index of this rproc device
+ * @attach_work: workqueue for attaching rproc
  * @crash_handler: workqueue for handling a crash
  * @crash_cnt: crash counter
  * @recovery_disabled: flag that state if recovery was disabled
@@ -301,6 +302,7 @@ struct rproc {
 	struct list_head subdevs;
 	struct idr notifyids;
 	int index;
+	struct work_struct attach_work;
 	struct work_struct crash_handler;
 	unsigned int crash_cnt;
 	bool recovery_disabled;

-- 
2.34.1

