Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E52364929
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784778772; cv=none; b=M+nIDhT7pqKRA6S8wVyP7NFSu3J/kE4nqvczRt3BR6ESIeBtQA2tZaxx8d58sNZ+CeFiAmgBovSFk3WaZGYRiuuujT3IoqIq1DhqjVt7t/D01AoG1C64mxUsb8aK4qEltm4JzMrBTCCuEmvZMy37xLieTKj6nwg81srove8Iz6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784778772; c=relaxed/simple;
	bh=MB+E++NtDWpIEJ0cfyh4tT6wTk6dSJAMri4GDNAphJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NP45zjFzpTzLQ+BDl+wuviywVp3CJkVJ0cy0qA2uHZP9yAbs1mWku90xsbD1B85LnMnFk2IvWsrS2msP2ZeFNSgou8nNRb3JMVKyhTL6imAva0Yhhju2b87l0YwuPRIkBLGhu5HMHUzLLZPx1pIuHjAWbewUREtGn7QOinABWmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AIFSZbF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DhXPPTBu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AIFSZbF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DhXPPTBu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WxBr2365027
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1W0bEkbJStAZU4NrrFFq8UC5bkGDDtW+lWeoDnscj6k=; b=AIFSZbF+Twm93V5q
	ePXn2w+vFKQwhYGB0uxN/a47vVR3ml6EmWfXogsPYRSUR1rfDO71aUEeiN0kFRCo
	8nxksziEWnDHEwUjQwvXYMOuHbVbbfTLdiEIxLIUPFCXr7LXYLzK/YeEBvZhwz6u
	JKwuLRt4/RaKKLzeQ2Z/BARPi1fJAX3j7v/bIW0ELg4duNfdNxi4ZtmlV4qoWw8K
	DWX4j+E1e/8s3ywaeqfD5+UBnM9rNPyEp+KzBTqP7u+HtDHcp4anTJMkBfHe8wwE
	WTfwRgC2aY95yrTHnAApvG0T3jqvltU2cKkJTqrdYvcizJ+xZdDe0BBuCAs1epoK
	AmGUWA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28vj4q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:52:49 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4488f192768so106570fac.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 20:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784778769; x=1785383569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1W0bEkbJStAZU4NrrFFq8UC5bkGDDtW+lWeoDnscj6k=;
        b=DhXPPTBudPSTrw5H1k1VmMzvYvshaLhA26jHa3hhPJFX33ofbBBq4RWVXzYAdS1Kfg
         ttfxGmEClHfbzLJ8KxoYgUwX1fPsT9aloY6ARK54+6pq7ca0pCrU4Hf8XSJ7F9XwSNap
         dm322qd2l+igbCmLUVPajqx97dMlPUj0loeaBgLz4dGRMAc4H2AuZyWboEAiHWzKcM3x
         mL8ak1PIvnLQop7lVV9joVn+9DVhh2Lll9egg4vQgMH6fYOyWHDW67/cB1wMlkA9d8EA
         KXPJ9zV49owKbYq8fkP3F5XxjlP4ilezz20KOd5MVV6ZNv7NLPUGIKBF6IRiR1iKRPRJ
         gfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784778769; x=1785383569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1W0bEkbJStAZU4NrrFFq8UC5bkGDDtW+lWeoDnscj6k=;
        b=OdrD03U5LiSeGrEIH/0EgE+buXHtU3qNpLNErq4leJtK8Z4VMJvTfjeRxSptE4AGw7
         qoTF3+m8ppu62FiB1Egw0qr+cj+JAv3ph2cFyIBdVAcOfg7Ug7oCXDn1f7vA8rPPWdHN
         /TiMk7XCmrwPqb+ZqlNlWbyvor82dXma1rZKPN66HAjGcJ24HQbtigdP2JBpgu9L/JCn
         +O07ubCXFt3Hy2+CtbZ45Q5rULVEn6fV/0SA70OGuRm9BdTh9kWhj6rl6mGSRePczxc5
         lvvMt9K+iPaDGgyLNKyKoKEwr2ri0Hr1dJV2ZxnIhhKI+XI4ZjyeichxhHJuEbgw7Kj8
         2odA==
X-Forwarded-Encrypted: i=1; AHgh+RoJLzz2jHczHhp8+TDwpfIBlr6j28C0fn7ltvidxsbaBLrPmqViCjtGmDTZrfoIeJkNcHVYgzHd3NDx/NF1PQ10@vger.kernel.org
X-Gm-Message-State: AOJu0Yygw1ZDtvCWBdRfVYKUzMBraIs0pdCeYg+jIYvJXV2f1v3b79Go
	zqaXtHHqKkvxfAIUzOy7qbG76m8heJP05AmI5kGthjzWtgdJGC2Xl33QSz65xri2ahkroHvPJqh
	WpY4WHrdOUSKSUqg10FkG9IHdKN3TXnrn+sj1JgY298EwnNrCuuTykp3VnyE3q9U+3YO2ptlu
X-Gm-Gg: AR+sD10ibQ0vMkQRRx5LZvSiIsWIU9QO57PhHq5s24BTxdi4BFuLTUuam36IrPKURZJ
	7StoOREsWQocWujqHwyrOK+BI8IEbOJk5vh8HcavM9RavBqPXfyiMUV/I5F6LX5g6eBMcCYY2IU
	SMmqDLVSIgAgBWfFDAVzy8EGBXkgPV6IXIe+sikYUTcR1IHbX0fid/OJQCyS8C0hDnaZ6k5Xouf
	E4tP4ZohNLm4UN/xV13pD/aQSNEmbEVC7vaKy/soO4PUCaPnyMTh9WYYXR5qKqIMpHj1aZbuqbQ
	cI4ece+YVoM0EDuScYCjsDbydUq3w7fsIcwJiuqsmkl8nxyCyg/hHkVJgYlu46Zqk1D7IFRuLw/
	W1kcYqrvXz9WCCXpHunc=
X-Received: by 2002:a05:6870:e98b:b0:456:a154:6815 with SMTP id 586e51a60fabf-457a11f537cmr645987fac.42.1784778769046;
        Wed, 22 Jul 2026 20:52:49 -0700 (PDT)
X-Received: by 2002:a05:6870:e98b:b0:456:a154:6815 with SMTP id 586e51a60fabf-457a11f537cmr645971fac.42.1784778768610;
        Wed, 22 Jul 2026 20:52:48 -0700 (PDT)
Received: from [172.17.0.2] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45766f238b0sm3302323fac.8.2026.07.22.20.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:52:47 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 03:52:28 +0000
Subject: [PATCH 2/3] remoteproc: Prevent crash handling to race with
 rproc_del()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
In-Reply-To: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7175;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=MB+E++NtDWpIEJ0cfyh4tT6wTk6dSJAMri4GDNAphJQ=;
 b=owEBfAKD/ZANAwAKAQsfOT8Nma3FAcsmYgBqYZAL9GNcN4KXp9VVHrNzvpawwSgXq+iTXvUw1
 zc839cNE+GJAkIEAAEKACwWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCamGQCw4cYmpvcm5Aa3J5
 by5zZQAKCRALHzk/DZmtxSBUEACAuSIKI2rO2TBbTTi7EYoqw0j+tMvwsduuu/cMYfqPXgthh2d
 y6BpX39ojWk2IU5ziK/oiHoBivUKWl94j9tvNmshFwb0z4mc+PnK1jo3Hgvw+yZhY9lH1fmvr+F
 h7C1EbiZhYgfq3LB3RPav268uS1kdODX7wjuVVulaVh0VuOkOIAk3SbzMN1Zv4SuQP0+9/8Utc9
 K23Uk3v5Yh3qzvwHIAEXgWz1JY5zXPAdVJ9gpNSuhcxvkjXyKFf2B5Hy//B3tZR3Hb5zGxla8UC
 h6AqS3r+0oTsjukIcKE1wu6mchPwV+Sln/xcBq2M5fUVHQHUFFU60iBeFGhgSWKBT+aWLoZN8er
 Gg0LpMwHkSekta2AYb4RI2z3gf7XMYzlwG3QcpNFkkHnBe7MFJ/7nkWGC3odgwWanop/g/+7ycw
 3HAHNRlN1ecHCs4J3MVboguRlfOqCbXtuvhj11ikKOprC+04wunBA1+wScxr8cw3ANyVdQ8rm59
 maeFaVCALuZ4TF9B2E0H8PsGvaCJCWkGCeEMDiEMgfuyDteVZ2eoqQkIIDqdNSPFIQIZoSmWdPk
 +2O9635Gv/r3wypEr1Lpu8VW9G8k5F7IPoo9xeQaHtFpo1VjZV/PEa/HA39JCrJP/sad6KmeiEA
 2W6RTTEzj30j5gvw5iEXPy/OwHXm5xOd3iw==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAzNSBTYWx0ZWRfX3Rpjoko+Usp7
 bPOUosK46BzIBjXoey53yptEQIQBpbBqtEF1BdbfVU4qaJ4zH2iArCjSwpebQHuz0SnIe4e0n39
 k+3aRXKqq7NSjuHJjjpuPSaOLwXriZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAzNSBTYWx0ZWRfX/boobD0+YNko
 ZGQ7/ItO8GZvCzw/zPO28NMPyCIQz8/8eeKbVO+uyIJvYZyvxVf5F8LT23M8DVFDgnaO29QewlE
 wdJTgfjqzZs3iiRy4+E1l1QsJhi4g3msl6Qxj3PMd30i64QzcKQrRXDDtOeSYRld+D3t/Qwh5gd
 IFt2wkGa6JzRCi8/ASONn2XaJHEFdLop+6WmObiazM3Y9wlF3Vohek2nRkj2+6oHtlwCnRoBsoM
 IiYAGJNGrMVrsStdOW2jTXxImctfIWjdo3KS/LwwVKZHtvukhzSTd2+45ed1krwWXmDBzSERt84
 VTFkAkmRm/PviTWAeiglTZP3zhY+gES2rrA1UrO9EoFVc8vjTg/xzzp4dXVXaSF2y0xld5hhkc1
 JVHvlGt65F9jLyyvy3ipvRLnRSZh0fgXQY6v8iWli/HypnR+upLzJOujy9X7CNzhWwgU2jjXGrk
 X3C59Wnezg8PXjHajLA==
X-Proofpoint-ORIG-GUID: YkvGMtLRuL8hvnKL7o7Y4hm0lEqSRrdC
X-Proofpoint-GUID: YkvGMtLRuL8hvnKL7o7Y4hm0lEqSRrdC
X-Authority-Analysis: v=2.4 cv=D4V37PRj c=1 sm=1 tr=0 ts=6a619011 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=13bCvcjworKfepPd0kMA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230035

There's no synchronization between rproc_crash_handler_work() and
rproc_del(), as such it's possible for a driver to be removed while
crash-handler work is scheduled, or even executing - resulting in
use-after-free issues.

To avoid this the scheduled work need to be cancelled and synchronized
against before the removal proceeds.

In order to ensure that this doesn't race with the reporting, and
thereby scheduling new work, a "deleting" flag is introduced. This is
similar to the RPROC_DELETE state that was introduced to ensure that
"start" didn't race with rproc_del(), but the existing mechanism can not
be used as it's valid to call rproc_report_crash() in atomic context -
and the "state" is protected by a mutex.

In the event that work is cancelled the pm_stay_awake() is left
unbalanced and need to be unrolled.

The blocking and cancelling of crash-handler work prior to the actual
rproc_shutdown() call does have the explicit side-effect that crashes
resulting from the shutdown process will not enter the crash-handling
path, and as such will not generate devcoredumps etc. Due to the
existing mutual exclusion between these code paths there's no concrete
reduction in functionality, but further work would be needed to handle
this case.

Assisted-by: OpenCode:GPT-5.5
Fixes: 8afd519c3470 ("remoteproc: add rproc_report_crash function to notify rproc crashes")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c  | 42 +++++++++++++++++++++++++++--------
 drivers/remoteproc/remoteproc_sysfs.c |  1 -
 include/linux/remoteproc.h            | 13 ++++++-----
 3 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3cd4570513c2..899d2058bc45 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1851,6 +1851,11 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	if (ret)
 		return ret;
 
+	if (READ_ONCE(rproc->deleting)) {
+		ret = -ENODEV;
+		goto unlock_mutex;
+	}
+
 	/* State could have changed before we got the mutex */
 	if (rproc->state != RPROC_CRASHED)
 		goto unlock_mutex;
@@ -1883,6 +1888,11 @@ static void rproc_crash_handler_work(struct work_struct *work)
 
 	mutex_lock(&rproc->lock);
 
+	if (READ_ONCE(rproc->deleting)) {
+		mutex_unlock(&rproc->lock);
+		goto out;
+	}
+
 	if (rproc->state == RPROC_CRASHED) {
 		/* handle only the first crash detected */
 		mutex_unlock(&rproc->lock);
@@ -1938,9 +1948,9 @@ int rproc_boot(struct rproc *rproc)
 		return ret;
 	}
 
-	if (rproc->state == RPROC_DELETED) {
+	if (READ_ONCE(rproc->deleting)) {
 		ret = -ENODEV;
-		dev_err(dev, "can't boot deleted rproc %s\n", rproc->name);
+		dev_err(dev, "can't boot deleting rproc %s\n", rproc->name);
 		goto unlock_mutex;
 	}
 
@@ -2533,8 +2543,9 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	INIT_LIST_HEAD(&rproc->subdevs);
 	INIT_LIST_HEAD(&rproc->dump_segments);
 
-	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
 	INIT_WORK(&rproc->attach_work, rproc_attach_work);
+	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
+	spin_lock_init(&rproc->crash_handler_lock);
 
 	rproc->state = RPROC_OFFLINE;
 
@@ -2598,16 +2609,21 @@ EXPORT_SYMBOL(rproc_put);
  */
 int rproc_del(struct rproc *rproc)
 {
+	unsigned long flags;
+
 	if (!rproc)
 		return -EINVAL;
 
+	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
+	WRITE_ONCE(rproc->deleting, true);
+	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
+
+	if (cancel_work_sync(&rproc->crash_handler))
+		pm_relax(rproc->dev.parent);
+
 	/* TODO: make sure this works with rproc->power > 1 */
 	rproc_shutdown(rproc);
 
-	mutex_lock(&rproc->lock);
-	rproc->state = RPROC_DELETED;
-	mutex_unlock(&rproc->lock);
-
 	rproc_delete_debug_dir(rproc);
 
 	/* the rproc is downref'ed as soon as it's removed from the klist */
@@ -2719,18 +2735,26 @@ EXPORT_SYMBOL(rproc_get_by_child);
  */
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
 {
+	unsigned long flags;
+
 	if (!rproc) {
 		pr_err("NULL rproc pointer\n");
 		return;
 	}
 
+	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
+	if (READ_ONCE(rproc->deleting)) {
+		spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
+		return;
+	}
+
 	/* Prevent suspend while the remoteproc is being recovered */
 	pm_stay_awake(rproc->dev.parent);
+	queue_work(rproc_recovery_wq, &rproc->crash_handler);
+	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
 
 	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
 		rproc->name, rproc_crash_to_string(type));
-
-	queue_work(rproc_recovery_wq, &rproc->crash_handler);
 }
 EXPORT_SYMBOL(rproc_report_crash);
 
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 138e752c5e4e..925b0cdbe577 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -168,7 +168,6 @@ static const char * const rproc_state_string[] = {
 	[RPROC_SUSPENDED]	= "suspended",
 	[RPROC_RUNNING]		= "running",
 	[RPROC_CRASHED]		= "crashed",
-	[RPROC_DELETED]		= "deleted",
 	[RPROC_ATTACHED]	= "attached",
 	[RPROC_DETACHED]	= "detached",
 	[RPROC_LAST]		= "invalid",
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 17ed75a11e15..ef711a5b1a7f 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -37,6 +37,7 @@
 
 #include <linux/types.h>
 #include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/virtio.h>
 #include <linux/cdev.h>
 #include <linux/completion.h>
@@ -145,7 +146,6 @@ struct rproc_ops {
  *			a message.
  * @RPROC_RUNNING:	device is up and running
  * @RPROC_CRASHED:	device has crashed; need to start recovery
- * @RPROC_DELETED:	device is deleted
  * @RPROC_ATTACHED:	device has been booted by another entity and the core
  *			has attached to it
  * @RPROC_DETACHED:	device has been booted by another entity and waiting
@@ -163,10 +163,9 @@ enum rproc_state {
 	RPROC_SUSPENDED	= 1,
 	RPROC_RUNNING	= 2,
 	RPROC_CRASHED	= 3,
-	RPROC_DELETED	= 4,
-	RPROC_ATTACHED	= 5,
-	RPROC_DETACHED	= 6,
-	RPROC_LAST	= 7,
+	RPROC_ATTACHED	= 4,
+	RPROC_DETACHED	= 5,
+	RPROC_LAST	= 6,
 };
 
 /**
@@ -261,6 +260,8 @@ enum rproc_features {
  * @index: index of this rproc device
  * @attach_work: workqueue for attaching rproc
  * @crash_handler: workqueue for handling a crash
+ * @crash_handler_lock: serializes crash handler queueing and deletion
+ * @deleting: remoteproc deletion has begun
  * @crash_cnt: crash counter
  * @recovery_disabled: flag that state if recovery was disabled
  * @max_notifyid: largest allocated notify id.
@@ -305,6 +306,8 @@ struct rproc {
 	int index;
 	struct work_struct attach_work;
 	struct work_struct crash_handler;
+	spinlock_t crash_handler_lock;
+	bool deleting;
 	unsigned int crash_cnt;
 	bool recovery_disabled;
 	int max_notifyid;

-- 
2.53.0

