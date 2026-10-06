Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30841340283
	for <linux-remoteproc@vger.kernel.org>; Tue,  6 Oct 2026 03:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791257800; cv=none; b=hSVnOjfqqW6Ll6JqEh1h5NTSMaXmabpIPPb4hSWKPDP/xCkvwb1JbiG6OYJyGYl/VAQyGEGLL0BA9xcy3jllA0Wii3f4ZzjTZokPtiN95AIfkbVotWhoSty3OX1HbR8g594mMPrqcdGd5pEXGjTlIzfFVJF7kAUtjCpeGsY2X38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791257800; c=relaxed/simple;
	bh=h0nWXhKY9t2Fj7gupgLtNSERpFTp6IVroebKjR1xLnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKlbBLQwRfw3b+wcJ4aYUj4pcqFNvDoTURJde4GLszEvTJGoeWq2p70BzDIe8QJshHZn3xPRr/JSp9IbFosKN5MW3KNjRMswM8uuZ2VUMMK76pjKO6bwaEJs953vhln6UGdssUgf/ev+Ef3A0JoJWqj8GHKlStgC66W79ERMQaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0c6KxEX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1rZQXCU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0c6KxEX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1rZQXCU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963AQGg3210470
	for <linux-remoteproc@vger.kernel.org>; Tue, 6 Oct 2026 03:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o+HNJj3V/gQ
	7ZI+UzIbijjdSZZ3RGHDWXuoW7x3+Cis=; b=F0c6KxEXQDXXfZmoVO9I//bWdmI
	NlRWQXG3QyT94sKRprpbbjI5WcZIk1fds4jnmfI7xU5QRHfPLaCwJ6Zu+yq9WZSz
	xMx0nypq9nbKZFk2KPkpjJhX0FugLzT2YksqGSH/fgw9iH3nVsKHVUsnHIiX8hZF
	AgrEXqchw08m1MDL7810OcODk2qHZ6W2nN8zhEuGPGk7AYoNYXReQsZCKuYdDhS7
	eqjXgaB6co1UEQBaqOdaE5Aqn2YIwhBtuMWPtT1mjwtQZ9VwSqg/Z1wyQOFcBZMG
	Yuf84qSIwRCDIWX+6rWRBYxCjJYgg5sQK7zVPsJ7WxWmgcvsf2PfStmUohA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4j1nsdv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 06 Oct 2026 03:36:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510a481ae9so4405016eec.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 20:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791257798; x=1791862598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+HNJj3V/gQ7ZI+UzIbijjdSZZ3RGHDWXuoW7x3+Cis=;
        b=c1rZQXCUMI2gvgoxlBokcCOLfVbimQISozSYPJ8VYmDWljb8i1td3p8spfWMjBd4ph
         osxhsYEuzHqlq0G7k6otSm/V91LBz7VWBx99ZcjQ6eLTnj0mNpqYvxhr2LJv1FSlEDt8
         WipkAxKCZ70jAfzew2plFAj2rKxjnhYZg8EtwNruhKjDAYnOuOfQFrANmSRFcNab4CB/
         xzaCl/WVzzkX1ArI/ICuDVsU9/xpB7JMWrRb/0xAUjdLDkXG8JLtMnIdFBrxcLONOp9H
         Cjuay0Zt2SYvepmnyCaBKw7JyVKmDuSI/4AanXVqFHA6Xp5bJn8Ye1MZXMDMVrZu0Y7v
         v5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791257798; x=1791862598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o+HNJj3V/gQ7ZI+UzIbijjdSZZ3RGHDWXuoW7x3+Cis=;
        b=bHfrfT3v7xKz56MZsk0vOt42gje7LtjSRrsNsIiaGq2+iwv+qkK9bDFVl2zAcNkYRn
         f2VjaCMBbkdJ6G4AAgAVjTLxiCy6oB4RyBvMhSJqPdOijfTs2DybqMgjE9L0L4/4gm1U
         /OsiKg0gaLuRK0x18IsDWSD9sgLRl0AX/qbNp0ufKjhuwov4BJPchlGCIQvv8d7W1zm5
         anrhZgA/N24oOuqSUF3lRH59X3yUO84jEITO5BAsSE/Bnn95ZGAKgNznRdmwryRfFsqE
         GrthpAMRKErT0cFNhK907xSPMsOtCU/KGdc3IOdZIds2F6UP9kTbzXpRDexkhFDndgnq
         Rqig==
X-Forwarded-Encrypted: i=1; AKwUvBxOrqJV1WJvqLfUW1Dou14k5JTjfZhgBis6Q6JyBMizdiA8l+mFJMVWDRInhWhMzJM64EthzUHyAAs6B9XztkWL@vger.kernel.org
X-Gm-Message-State: AFq9FYIbEPsT3mMSw/OP4OY5gMtK9REYBxAeVc7R8PpGQTwcnXtW4x7o
	tQ/WfSVuGUhoYHrYEHNi8MrptWK8I/a2QID3Owv4AemaIxZnxm+RVFUXKtvb8c5mJhvIzNZCt7d
	v4vToC33RNqs2xGxlVAawsmBkoMMtPBcVPgBu88moua3QrS2cgwGtXXISrhha6TiGY4dxI/6H
X-Gm-Gg: AYBFou0VSYu5Dgq2JhczjAGVXyGHz3w9yeQTyrMJtQlCSRO/7C3/Uqei9IiSZ+WoKAn
	PxQmMrG5VlMGroCWclatiVWlJInn/uCZs1V608JSmGwAnBNJpj/j0Y8vaedokQ+FUje7f6lj2Bu
	eAkjEdTnnxs//2jgc/L8HsmACyY2J4gQgK8zBm+PD/+yyWZPy7VnhxK5jo4Bcc7XWIZz4CvoTGn
	ETMD3shJomL0cgbEm8UOR3UnNIaH86FzXd+/Mo3/zoIjeIGekKc2P1vwrjxkHCfkY2KgWLBo8h8
	QaPl3LpxW9cKd+3mKDiFKZsW5iVySXQEU7QI6N7HN6As5YA0dWsglKQ2dQv8T9zhNI2Sb17RsSv
	+MgLaYjoL4mYPMTsn2gAr482z0C7yjIbyWg9/SlS0eRuH0OJdMo5CXWa3r+Q=
X-Received: by 2002:a05:7300:1c13:b0:351:672:6803 with SMTP id 5a478bee46e88-3514e2a84abmr2942eec.22.1791257797606;
        Mon, 05 Oct 2026 20:36:37 -0700 (PDT)
X-Received: by 2002:a05:7300:1c13:b0:351:672:6803 with SMTP id 5a478bee46e88-3514e2a84abmr2905eec.22.1791257796801;
        Mon, 05 Oct 2026 20:36:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469fa189sm3279736eec.6.2026.10.05.20.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 20:36:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] remoteproc: qcom: pas: Don't fail attach if the remote has crashed
Date: Tue,  6 Oct 2026 11:35:50 +0800
Message-ID: <20261006033550.2726451-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
References: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAxNCBTYWx0ZWRfX33vb/Vu1An3l
 BvtWVvae2tDCf16ojcjOkNtbFm0H/yWahmxinUfqLJYakZeeIiJ+fMS6ZhxkQeh5Fm3IREUJK/S
 4MpPmOe83p8tAnP7W2tcIMAb+zvwXPQ=
X-Proofpoint-ORIG-GUID: jasxbk7fp9mz1xVmei7_mImnTbwD63w4
X-Proofpoint-GUID: jasxbk7fp9mz1xVmei7_mImnTbwD63w4
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ac46cc6 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=UG7d_Sik5HcDt_3cTb0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAxNCBTYWx0ZWRfXzZ1W8OAFnNhy
 3rHH9T30tW8dUv3TlRUen1NsMmGeyteLLF6Qh+uQO4u7dN/0QH/Kx4GVlWwqE2nc8xZv853lCBB
 QQ/Zr1fpYIQYom86hK7q3BiwWbIVLoZeWD5qUMqT+NSoWXy3Xm3KPT8moKOu4KLArj+iOr13MSN
 nag+x4hax76aHtirFSjbo84drkopf1AOFXYzojYi8jWQpu0/U+6fGXWGiFMmNbZxXvlx41/wDoY
 1O4/577uS5oYYv7xvvhn57xJh9rZYzR46bWtqCWmPEwefmlzfNi+g3dw4LC+4WPkjj1UjrGBN7M
 UxWJ9dwoCCPpo0p1xbDi8dFFxEX42+pxCWoy0N2Db2T3YOWEOZzchAjcJpZ4b+n0j2Xg0W4egmD
 XLQ4gIb3KyHP20IUUaW/XaUjg7diePGDsNkPnrMqrX21LCZ0elbjFiphM0yu0y1l/MffTmYB/K9
 WcDtHnfqefV/r5RlDlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060014

When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
a crash and then fails the attach. The core unwinds the attach while the
crash work is queued: rproc_boot() drops the power refcount back to 0,
and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
the resource table and disable the IOMMU. Once rproc_boot() releases
rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
torn-down state:

 - the subdevices are unprepared a second time by rproc_stop(), so SSR
   and sysmon notifiers see a duplicate shutdown;
 - qcom_pas_stop() and the subsequent rproc_start() operate on resources
   that rproc_attach() already released, e.g. iommu_unmap() on a
   disabled domain for rproc->has_iommu;
 - recovery leaves the rproc RPROC_RUNNING with power == 0. A later
   "stop" via sysfs takes power to -1 and returns success without
   stopping anything, so the remote stays running. A following "start"
   then boots the firmware again on the running remote and fails to
   re-add the still registered subdevices:

  sysfs: cannot create duplicate filename '.../qcom_common.pd-mapper.0'
  remoteproc remoteproc0: failed to prepare subdevices for adsp: -17
  remoteproc remoteproc0: Boot failed: -17

A crash found at attach time is no different from one reported by the
fatal interrupt right after attaching. Treat it the same way as
q6v5_fatal_interrupt() does: clear q6v5.running, report the crash and
let the attach succeed. The core completes the attach with balanced
bookkeeping, and the crash handler then recovers the subsystem through
the regular RPROC_ATTACHED -> RPROC_CRASHED path.  With running cleared,
qcom_q6v5_request_stop() does not wait for a stop ack the dead remote
cannot send, and handover_issued already prevents a spurious handover
on stop.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 8f3d45c604c9..0ecd7688a54d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -562,10 +562,14 @@ static int qcom_pas_attach(struct rproc *rproc)
 		goto disable_running;
 
 	if (crash_state) {
+		/*
+		 * Complete the attach and let the crash handler recover the
+		 * subsystem from the attached state, as for a crash reported
+		 * by the fatal interrupt.
+		 */
 		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
+		pas->q6v5.running = false;
 		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
-		ret = -EINVAL;
-		goto disable_running;
 	}
 
 	return 0;
-- 
2.43.0

