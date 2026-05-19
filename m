Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9427E3CF032
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175213; cv=none; b=tQEBObkNQEniILZElcFp4Wp2pRxDhSIybeHGn6VOhe+V/v6hPGCiIKygNV+3TjyrbeIJYPAut1tr0XbCW++p0qfNPowv9JWzbin8xE49jAsVdEVufit3MY+ZzowvdcBxUDpP8F7cLc9/vlBfrmLoKbz7pHJwyAZwtrwrSqRRrq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175213; c=relaxed/simple;
	bh=5/YYTLp1zAR4H3spzhY8pV6SUs8HH6oSJSjbicSvo6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UcXeVC2+JXa5UxoK/9tLXfABMquovUDit+NSvIZvVKzQvWKkBB4LjMtkesuKbwa59td/lDQqodMee6tv/t5+tI7Lgz3wb2v1PrXwGyE3WQSg2+rS2clRP0Blb2HPTMxctSA8ci/jctWcXuc+uJwFgBoYg6l/QARaJ3oACWqVOrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbTe3uNa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bITmxeyV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbTe3uNa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bITmxeyV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5FSxN2700955
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21K8Mc/xhIM1en5LPTDDB47G9k6kQVJxaoQeABOBpdo=; b=mbTe3uNasYNaDbAy
	OVoWHJcC++oGkcW7eEUtnPmVrJJDvxJZxtfKHc5kXf3pwcT3KxuRwZDhBFf7tbvX
	9RYZ9/pzjqMmXJxTZTozJUthmjaqpcOFLR3g66e9QScBVMnYcOScGF4hZtosYPUw
	7j8JC9lQ6cj7tqm7dMwkdKXi9Cvfes8lLHd1DnuBIJEd3ow75tNKyZgcOtfEPsKc
	6Vr80mHhrRp/kZmi3vgtqX9niRcJRASauqTOCwPKall9HgwNX7dbvwdMG/i5fgGD
	jGhMvEMfGe7wFpU3ShGkM97u12daqYe7saqZfHknvT78G2h1upO+tnsn5rxiMk+y
	64XoDw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82mekrdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:20:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so4400927eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175209; x=1779780009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21K8Mc/xhIM1en5LPTDDB47G9k6kQVJxaoQeABOBpdo=;
        b=bITmxeyVC2HXI6JtAeaqLkRilEco/zszBlzDaVI0/E6VmHF5y+9CDQdWm18ZUvxFUV
         QxDTufLoNtl8gOYa8ED3+5Ug+5bFjm48T/eqZf23c4MhLLRjwaWmRNjhRFOBa0kvsDsP
         xp34hA0BaYwIisqByJLUR9efa9YPFnTznsXMT8oVhPrs3EURltodgB/p1FkNhUraEd/M
         DSuMlruNLkymjLvEdEFExVEfgvHBc18Fw10UM/YJaUF7GzoYOr3qZHXqlB4/KAEpCiD9
         iT0WkwsJkDtS91PAE5mRouiUtZGHZ25LPXCJNN2SNQm7zhWFY0FKbi91KKQru44HSqXE
         I1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175209; x=1779780009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=21K8Mc/xhIM1en5LPTDDB47G9k6kQVJxaoQeABOBpdo=;
        b=Dy64Alaf4/uIFZ6xZA3dFUICJ7E+52fSCeNq/Ra54MTVWvlDcQ+lqeSTB8evOolNaB
         MPmNS9QDrkddvxLyu+njrD61RNZgyEt/Q36GTL0SpJpJ2/ljj3R0NLjq2tATI/zeLho1
         M6idH25jOTirxND9dyl2jXyjBrhpp1uN6BhcoB2r32V45u8zrmCvHbaU30N78yOxdMdQ
         QIzjeH/KeYRLnO7joYUuBEVQnHT0k8c9hNADDaIlactPQFTW1u7oo6dmB7k3/JkNbZew
         eXK+LqAhxMXE6C0rZ2ekT4faQ32zXvMbw8vvVDex2MKEXQclmhIrT8rm7dwtP8GaDuXa
         8Zew==
X-Forwarded-Encrypted: i=1; AFNElJ/whjU3DF6vHSEqrA695Jz94DzMzbi8HB9BxkY5dY8f6pNEaxpvuTzR3DncMbJG8JblgzLEyLAvQHl/WQ5TE2q4@vger.kernel.org
X-Gm-Message-State: AOJu0YzG7Hu9lYhZ5Bj/WNoPylhsc2hcDPbKtTMuLp6pivdH1PGwq3Kc
	KQE8ewfN7g1lDQNygIJa/xt4cQ0c7cGIFEYM+MI+iMDiseqMGZrHB/4qe2qo2YHM92W2oEAzF6n
	tu30kaGqms8ctpo9EUTJ3rTriT7DdFz6K4Zhr3t09QDf6RdVLntaY0OayZhima+jYw8kBbowN
X-Gm-Gg: Acq92OHj1HjclpEvRtYRQ0sADdCduBKNfLjtbtqTBMeupJFN0T3zVEQwI68k0J5skNm
	x+YFl12Uy6TKL/g445h0JlAMNdF9pzkubhEcTD9skX0S5u5bsSyAMS04m/4LCe5MsT2PMEwn+Bz
	slpT3XpWBRnYxVsC/VAzzbmmYB7sCQplAcY8iSMMXziQm4uqUnWzvQtHqjSwYBC+aWvPUJQh2Qv
	I3sAPBm4e/qKgbXSwv3oSc/3LGh6mEY6OoiP5Y2GWro6TnGP8TWEjvc1wXyOfoBWF5oci3gyJq0
	iORHYAPY8sdWgv/4xFvZhT5UnYKuGzlgFaWAJ6wVodmqw4iAoffdBunc7jbzuxXW0NbX+6nynJA
	YCH1lfeY2ZFgsL1GiNsBzU5UHmBUff8JIqRNYdwqEaaTfp0wrIExgRU9jWjW39YH2KXHkxT2D
X-Received: by 2002:a05:7300:a94b:b0:2ed:a64:a457 with SMTP id 5a478bee46e88-303986552f6mr7933046eec.20.1779175209420;
        Tue, 19 May 2026 00:20:09 -0700 (PDT)
X-Received: by 2002:a05:7300:a94b:b0:2ed:a64:a457 with SMTP id 5a478bee46e88-303986552f6mr7933024eec.20.1779175208899;
        Tue, 19 May 2026 00:20:08 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcd0csm16438595eec.24.2026.05.19.00.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:20:08 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:20:02 -0700
Subject: [PATCH v2 1/3] remoteproc: core: Attach rproc asynchronously in
 rproc_add() path via schedule_work()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-rproc-attach-issue-v2-1-caa1eaf75081@oss.qualcomm.com>
References: <20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com>
In-Reply-To: <20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175207; l=3261;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=5/YYTLp1zAR4H3spzhY8pV6SUs8HH6oSJSjbicSvo6s=;
 b=OLWN+lF0gBUyIbfvyYuyLukLJgISeBoSG+ePG46Mit2Dh7hW+NnhebTUjgHbqXbKIsEJFA2y4
 DQU25JliA+oDU0riUjW4+rSP2YQBUUnPwVhiiLEt7S3I0QZ+fCex/vS
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0c0f2a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SwIuEO_x4BL_LcR9stwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: lq1-EV2qP6gT0GJRh7WWiX2xgo_o4Y5P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MCBTYWx0ZWRfX0YAIYE1WMKOu
 lVjp5KuKpVCduy2dIfnQJOXH3dArPoYSjA4LHjpcSlnqMuIWrc0WgGLo00TAfrq9Mp5a/mTwBPD
 aUMYqSeiWsZO4/lCkgSv7mrpljFR+Amhzb1sPHbsL5bHHrNaon7sQ5ve8tvLoAgxAIcaLXidwg4
 ALdFP3+oIv3GHJHTQ0cJrnqxAp4HJTo7OCtT9/hExN2Pe6MPTbGTM9ze0BdS7GgwP88eOEiSdj+
 omD6Pdn63qYL8QQ/T2DBaZMWhBmd8d5vatgN0FjtMHR8l41s4gL2cAw7CwNQ2NaiLyvBtwerxkf
 3SY/1TaIToKXux5IapkO3th0m/90JIjsEIIr4afMv1u6RCWfrO2MlER+CTppk5t/B8/NiNdsqza
 vuA+oKgXIhSjssjYVv2mSe9s/RverF3s1gs5RlvmW2aeKQlqr+fcODVyyhjWX8cPYQCr71poT4r
 NGWF+P7x+9SUN9zTajw==
X-Proofpoint-ORIG-GUID: lq1-EV2qP6gT0GJRh7WWiX2xgo_o4Y5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190070

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
index b4795698d8c2..580d324a1e8f 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -526,6 +526,7 @@ enum rproc_features {
  * @subdevs: list of subdevices, to following the running state
  * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
  * @index: index of this rproc device
+ * @attach_work: workqueue for attaching rproc
  * @crash_handler: workqueue for handling a crash
  * @crash_cnt: crash counter
  * @recovery_disabled: flag that state if recovery was disabled
@@ -568,6 +569,7 @@ struct rproc {
 	struct list_head subdevs;
 	struct idr notifyids;
 	int index;
+	struct work_struct attach_work;
 	struct work_struct crash_handler;
 	unsigned int crash_cnt;
 	bool recovery_disabled;

-- 
2.34.1

