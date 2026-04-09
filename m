Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED12346E4E
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Apr 2026 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724400; cv=none; b=YnpeG261hjYo6ZhUD4F+wy9DaS4yyQnbKjasMBiglHtKOpNd2aI+mPuoKprSYhgbyXUlnvcKH5Ek7iBvrnEFbPfWVBquuEvadKRcDgo+xdpecjlzxzJNgxFZ286sFwGC7UJ3JoNi4veFS9D+S834gVbEzNyGUIeggtiJ2n7XT7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724400; c=relaxed/simple;
	bh=LILZ401zz4H4PYaJRtQNOEsPKwxxLyAST3STgzRbi68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pIkH6B/qkwE06wYD5xvYdvfnsQ7/xq7aJS3qa+4ouoytDCelgIWujqhiqL9Dw0T2p7suSCQNJ6e3dHRlu17S3o2z3sV5Qzg2gmrEtAJ3p7hQJfA1f1597n2wloR7mWJDSZtQwS1jbZl7NPwR3IoZzWWwBmUPSxDXZ+HcKmzj6Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8CnON4u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMc1u06c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8CnON4u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMc1u06c"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6393CLaG1727432
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Apr 2026 08:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Irp+xgmj9Ik34RHCahjt5RaucthCedcYg4gNt6nNrw=; b=N8CnON4uIERbWLMl
	w9fK/vSu1ncvMdTgo9FcHm51bTsDYrLBJKpRnN3gPG8jY6B2q3p5pPFmRJ9U5gP4
	zICdkso2gBKmIAVnyn1UpV6/tilCesggfTAxHMN8aGSh2+Rq9+T6rzjswe77C4OM
	9oImUIJ+hhCg2VzoSHZ+jfBM6jZhOBJ7Tp854GLypZBhgdL05AE+Yx+L9akkyqsd
	E0fBlaw7dcT1I9Nf3RqUNEwLHzIgPZe28vdrE/YBblV64N+C4RQTCcjpucozmc7W
	eP9y9n/uU/3Pa7XdtFgewNB98Lgb/b55239DcE4uRrCZ3cGRZZvaZaP5oqVdQ6c7
	V5m/BA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddwcrtcs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2026 08:46:38 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12711ec96fbso2794476c88.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Apr 2026 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775724397; x=1776329197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Irp+xgmj9Ik34RHCahjt5RaucthCedcYg4gNt6nNrw=;
        b=fMc1u06c47erWy7664ZqzsoePxG4gCaW0baXmBkICiHI9nW33LX59tTT4Xk+3Uv99N
         j/59zDSem7JxZ/29jnKSHMuGVGGxh6DiJhUZlSIXDbsT9LwfpXs6vlITTHmTuDXBir1+
         ARX6/z02csIw2PKpOgC0EzpOYpk9kZOQ1OmOec035w8PNCiWyExGlyTYEbx/mTgcLzX9
         Vb3Ylt5oSsNoubeFm/eII195Bq29JuaRRBk9uicn017gHzWkPOfWWPisXo5O1S7iLYUw
         7SAJOI8iUZJeemFyQWrbn2FHV15NEFRmGxa4PN7E96lCB0N+v0gE/E5KNlyFWF6NggoK
         lPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724397; x=1776329197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Irp+xgmj9Ik34RHCahjt5RaucthCedcYg4gNt6nNrw=;
        b=psh/GHD18QuZR8aG5x4mYy7v97Hv/Ray1GujGAVPCDbKEzNGfPQKL09nrSIFwD6yI2
         inqr+/7HNegHVDMQcD7sw0sghJvxezw+MZJ0zPhcCUec8z5b4VfQcv5UQV2vqt41s1LP
         itwuQrVklpB16JO55xCGn8zF0J96zn1JCAujbCZki4osPyYP7BtOcx6NJ5gql+kMeBcC
         gP5pMaHgC0pti3HCF6Xn4EydLmmkewNCemJD9SyLYhEjfPxwMc7Z3RKOdBAKdX4G/IGh
         YGnce8ywF/A5vddNo5+MKA+SkRxetsS5+H5BxDS/EsQFmuwXsGM28y38o8qt8hnHHzM0
         tiRg==
X-Forwarded-Encrypted: i=1; AJvYcCX+NlwsG+/EEovFO9mbfB4Ebu97LguQBiu7OxzQM2UR0iItEw4NWo1HgTJdEMf90NE2U6DRVepqLwuiPtJl2AG7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsvol6+C9DFiNRY7NSKNBynwwu7xaGZGBXAVs8QAYe29VDKuGN
	3x+3HKyETYobLEonc2SCTb8iP1xrYdJYqTSitNlKBxquJgjs47CjtMIvTrKymMZ9KYY1kDjDZre
	In5ho+ntKubfZg5vWQLRML4TRdUFkQzRaHI8aLIv4YZnQXpCZMDPpuswa7cKLpLn4d4d8tXx9
X-Gm-Gg: AeBDietM605WysHVPGEGnMgwhyYhfqLFyKt5WIJjYBktZHL9ua7pcw9/jIvDmrrTGNo
	9+f/x4RUChGJvj3d+NITiGcW0x0tSlFkgOCRVf46/1EGUzBdqCWxrfzFz2VOTLifM+MYxdWrifL
	gW32BG7KzyG9wg5bEzOOSzAalLc5TwDuZiUnTs2urEUAnp0EkPMiLPlZGCg7Mj0T7Mxyz4hPhxt
	nKOI9lZmhCO9Hptm92OEd1B7hjZCkXpypbSZcHKNhGkhucQ1qjqYZt5aEI8Ym3W6PDlrTzD99ML
	0GCLjY+e5qJ6MhOaqVndMZMUk3QVeAiESQ2bBk7qqBOgtBGxpBE96MYa/khftMo38pY1L95BSKR
	v7dBn97JqE/ZVzpn/lUcMU0tBYtZrd1thoTxiKfdhSFgZkmd9QUOIyz6S1NGug1bxoj26sfr0
X-Received: by 2002:a05:7022:4381:b0:11d:e40f:ee69 with SMTP id a92af1059eb24-12c28c179dbmr1491441c88.36.1775724397046;
        Thu, 09 Apr 2026 01:46:37 -0700 (PDT)
X-Received: by 2002:a05:7022:4381:b0:11d:e40f:ee69 with SMTP id a92af1059eb24-12c28c179dbmr1491413c88.36.1775724396463;
        Thu, 09 Apr 2026 01:46:36 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm28451931c88.10.2026.04.09.01.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:46:35 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 01:46:21 -0700
Subject: [PATCH 1/2] remoteproc: core: Attach rproc asynchronously in
 rproc_add() path
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rproc-attach-issue-v1-1-088a1c348e7a@oss.qualcomm.com>
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
In-Reply-To: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775724394; l=2493;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=LILZ401zz4H4PYaJRtQNOEsPKwxxLyAST3STgzRbi68=;
 b=qPNHNb8mVXkDQ+pA4e1qin4F/5ybw8Ks5xZVj0AN7q3zBfhv66RDYgyVzURhJMeRihMAnAemM
 KjmNghF9PTOD3B8IIGNwsc5SpHkIyUpjAZlldVTBwCzEAPrHS60ZsGD
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NiBTYWx0ZWRfXyNfVtP7Dx1vl
 cL0BFS8hOr3n+TZQ0vke1B8wu6u4CndwpnftxpYDjrUO8rPHPjgOAnx+EOcApjKZwkqgDhfVkVr
 2+eBHm5TdRWnMY8ZQmlIsHUiCsJIM5WHN6i2mDF9N3vGZjWnqtjv8cHskyE+4m+eipE2sXYvMeY
 bp4QlPbOpcQOmqeo316PWs+VreCrNH9p2v+H9fvCamH88vxejrQbXOQ4b5a2QVKg0chfzxgfjj8
 QLURsXtdiZyH4ny9672OdGqes1Oe8IdrpglZlBaeJWCFVRffnp3uStTTi6GcxHWN5pDw2Ee/GGI
 9Je0zYm6IEx6uOGPi9Vbss4TCxt+KuoWrLJbpX8DhBoc04Z1dmPcWUcV7JODzyWU522WvUpnpMZ
 Ij4dvSg00hmgyAbKLEO9z00RM0/EvCokFN7Qj2ocHAwgyAjhtnbDwnLUyEW+RYMr0Zr9m9CEM8p
 8rh3X7sYZQ1yV09i3LQ==
X-Authority-Analysis: v=2.4 cv=SsWgLvO0 c=1 sm=1 tr=0 ts=69d7676e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=k_JL0JQvz4wm1xcudgQA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: dsYcKsgRuxMEf3R9QZ9_6lXc3P0k7ubN
X-Proofpoint-ORIG-GUID: dsYcKsgRuxMEf3R9QZ9_6lXc3P0k7ubN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090076

For rproc with state RPROC_DETACHED and auto_boot enabled, the attach
callback will be called in the rproc_add()->rproc_trigger_auto_boot()->
rproc_boot() path, the failure in this path will cause the rproc_add()
fail and the resource release, which will cause issue like rproc recovery
or falling back to firmware load fail. Add attach_work for rproc and call
it asynchronously in rproc_add() path like what rproc_start() do.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 20 ++++++++++++--------
 include/linux/remoteproc.h           |  1 +
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b087ed21858a..f02db1113fae 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1673,18 +1673,21 @@ static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
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
@@ -2512,6 +2515,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	INIT_LIST_HEAD(&rproc->dump_segments);
 
 	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
+	INIT_WORK(&rproc->attach_work, rproc_attach_work);
 
 	rproc->state = RPROC_OFFLINE;
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..9b3f748e9eca 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -568,6 +568,7 @@ struct rproc {
 	struct list_head subdevs;
 	struct idr notifyids;
 	int index;
+	struct work_struct attach_work;
 	struct work_struct crash_handler;
 	unsigned int crash_cnt;
 	bool recovery_disabled;

-- 
2.34.1

