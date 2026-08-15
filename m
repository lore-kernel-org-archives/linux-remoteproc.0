Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F9641B8FC
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800381; cv=none; b=jS9bArGDZcmrREY3L4J1OkGYwlAubyTkZKV2P7uVxK7EFMsBurG5HeSN8dRmMYBDdvz22FtvHSdKBziSFnHrOlp3OD0No0Wemp2d/cnekUicp6eSBhtURCL/xLjqRKd13HEof3swH3oEozKUJPfupEl+KG2L2fkFQGoYuxexDKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800381; c=relaxed/simple;
	bh=6hJ2Neyqt1yVgVG8m5IVPz9TrIU+IS9JiugWuvi5OwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k0m3Wabd4DbZREg2UwtwUlVhZBQxouBf+ERZwwLJ2AkWv9Lu72aPy/aH1AluSnxQ7msmoEujk9Csj+Cz5mehIETPfe11W4XTu8ePPQ1iyQdbFpZae1pyUHQbFJchvu1rr2+ZeC09EUgd6JZD4hkjxBo6UfNYy9jYQ2bYyTuT4F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUImqM+0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bLVfzZqN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUImqM+0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bLVfzZqN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDN5Xl3618104
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N4+eWqDVlwc
	2a+HPK4I95r2SqBK3eqf9vIWPB4YE/ts=; b=hUImqM+0waN1BmC6MGKR9Yc/4tP
	ZMyQGeZUCg/SQ9TsB5CPc+vbnklqFtxKqGOr1qvyGalGwbCZBc7JDuqyc6gUolwb
	nQrVmwBmUAfMYKe7rFOPmRWPs29qjMoxgUpw1R9IpkfJwCAdgIVVzp/jOBl9ZO0Y
	l5NMiyRiochYNbL2A+OqxkT8HCBT5d8u0o/tZOf9Rg6vboMxsuM+eRY7KLFcApYB
	GaA6mmcMdvViA/eqcuzTHeVp23p204ndmaRLRQrjJOKtFreyD4EOW5erd23S/pAH
	izjqDzkQMKC9LCPHFDWUueWrFTiaZFdPZaFwrBYVHoKYVL+UzEuNYEh3F4g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghq11t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:26:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbee8d434b8so1347783a12.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 06:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800377; x=1787405177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4+eWqDVlwc2a+HPK4I95r2SqBK3eqf9vIWPB4YE/ts=;
        b=bLVfzZqN0zKSLsQs+bwJOHIISg1tRK/yMIl0SbsJoMMEs+odlhPM9RTc2ayrJ7H7qE
         bu+pvU5ejCHUh9JVqI8YYT27xzcAAN4rM2axngyzt4QJIz7sD24kJsRPBYbG15UnNUkW
         hRipoS4YFEl16rT0aWqQFG2hZ6ws7zCr/2/B+YNA8ahtoyCCYunn1zGhCfIm9zHInCKa
         cbKMi0+h+kLaGLG6EkAL+rlBPtdj7H26jur9DY4bXREU0HrZoVbBBd+mKh79LPiHw7kb
         btIOs+yfSePgIYC6fotKze01waWdHx6MjSYMaosgtXPsz66CUpfSz8K8MB8ZI3kIYeAD
         HJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800377; x=1787405177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4+eWqDVlwc2a+HPK4I95r2SqBK3eqf9vIWPB4YE/ts=;
        b=iM6OdrTvPuVohmtiX5QT4Jo443UAeKzg+THA0YTwcUaWuITaufpOGsitmZqmQ+faPO
         XXPa3YqgPfd0PFCpfaztKzAeKoS/tESpI9pCFixvWdKOOTy0LEGbYjWsC5toLIXFqlL+
         o95Hhr80VOTxn0/AASlDA0Uz60pUiZ2Q8/oC0xBajQOHOxU1aQKVVxs04vOdS3iPP+ZA
         91XEFdTBEn+nXG+k4mp27ccvSgxl9/LXpQQKEYk4Nbv/uonLHUEoAE3N+mYAB8EfDicD
         H0bxABEML6Yd6MiarYbzEL52JGQXehE8H477uDaHNXDHIbVnmOxMm0GCRiWXmsXTaqR3
         lKFw==
X-Forwarded-Encrypted: i=1; AHgh+RpTXqup4XUQBOqDEN9sRlMsewj6hTGKW94ifzP8EZQQSBijCRgk85koLe8ABl2kD3uHO+TolAZmabk1a72L+TH3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Wvo0QkANanRqWlcRnterwymmV/VVujvdA69rJs2tlWYPoUD2
	aqlmPbX2XY/0q4yqrnMC3sr81XlhncWO822hvSnsEOOsnAYDNXYKLzS2edT7c/c2EMxsv9mZzv2
	7Ss0xAiM/x1tExCCyu0bme8qxB3W13aI864HDKIaU0H3zl8mSx2oKF3wsAbDpihzDYJ0Kp1oi
X-Gm-Gg: AR+sD10flVuKyQwZVtAgU8j/4TAQTjuOQ4Y0vVSJiQ/MSExz6aPQTOmAYrneMLEL3Qj
	+zRBYxmU4eDX8aZ9LCZVVPH62x0mg/AYvuvVHxIJvAHinLoz45gh16b8C0XtnO30PsFtq+K1aVd
	9X773JkHy6clvZ4dVqE2B+UJQQus3OoOaf25R+YqhJbvs5AoZblLt58nqTnHV1lveRq7kv7EKVM
	ci1Mt2wlmSJjXo3lSCOfKrMXyP/ELIkanl5C2t+Fu97vVPmc5sn7S9BUgmlH8m6GHzycFoaf0Tp
	GCZknRg7btAWxlOM0ov53LvlOqKUNay/336jdGcrivwxUrrL3BnLysgaqgdhhrSyWZ1VjLGKZt7
	ZKKpSlFKjhFzgHQ5AD7QWrRfs1f4xPcheddFVZ5xC3G7l6YP6ruJAkhVVai/G
X-Received: by 2002:a17:90b:54c3:b0:387:d9cc:7dc3 with SMTP id 98e67ed59e1d1-3931f61cca5mr17122557a91.21.1786800377077;
        Sat, 15 Aug 2026 06:26:17 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:387:d9cc:7dc3 with SMTP id 98e67ed59e1d1-3931f61cca5mr17122503a91.21.1786800376529;
        Sat, 15 Aug 2026 06:26:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:16 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 7/8] remoteproc: qcom: pas: Enforce coupled stop/crash for HPASS ADSP clusters
Date: Sat, 15 Aug 2026 21:25:40 +0800
Message-ID: <20260815132541.1575121-8-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX8dpyeCBuAd/+
 wKL2NURA93HknAw03q3hIe6YN935pVLKbEMTa1UQNlZP8j8TzMjOUtlg/CChmOrLiZHjdUIWbCs
 ZvmcjBNODMRs2/CmzFaVmlPaxRvXBZ9wvR4A2dcr2sAeaDiFW9o8QQzpcTbSOxGVPtsHBpffUZ8
 Ri59cEEcaBFikYGqP6VrL2TNnhLt1S2ikjDt4fQGy/dAhtYBGtswZsj2Ln/VWNl/PzFrUmYLcS4
 JwZMw2qxMo/jcg3/D5v5Rm4/RVPqiA5PF+KuC+ijFs7w8tv1x3ckHyNEYg0+H/PetoGpNruspp6
 bdsBlPloulDAAJstajR+PB/Ygd4wyrHlwU4FZlO9D9fAy6Z0Tx2+eN9D2qzxBwcVP3BCdgAWPow
 uCmBLUU80m+gg20hkGS7OorE2ZJvzjEz6ReKy8OqJbD+Xd30eOQaoqcO6jM8q5npIbmEO/W89PO
 1zvFip2pZKW37GZaa0w==
X-Proofpoint-ORIG-GUID: DtrBiMBrZtEx-3vTcM4zNZzktjiWaPFu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX4e3O9IaVeL0z
 wT3bAlDAeSc+X7zlPcnbUW6DxEB2XqFhNDRZB265Vev6Z1pmH0P3xWM8Tbc+X6NJg4VVd2d9yWt
 w/HFhyxaJM+LwfiUx5F/9t3wUI4bML4=
X-Proofpoint-GUID: DtrBiMBrZtEx-3vTcM4zNZzktjiWaPFu
X-Authority-Analysis: v=2.4 cv=dvHrzVg4 c=1 sm=1 tr=0 ts=6a8068fa cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ECmFLyrvDWV1PkQpWfkA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

The firmware of a Nord HPASS ADSP cluster cannot tolerate one member
being stopped or restarted independently of the others: doing so leaves
sysmon/glink_ssr notify requests to siblings timing out, and the whole
cluster unable to recover without manually stopping all three and
restarting them in dependency order.

Coordinate an explicit stop or crash of any member across the whole
cluster in two phases, since hardware testing showed that whichever
member's PAS/TZ hardware power-off happens chronologically last always
fails its own graceful shutdown ack (both the sysmon SSCTL QMI ack and
the SMEM-bit/IRQ ack), regardless of whether that member is the cluster
root.

Phase 1 fans the stop out to every participant concurrently via a
per-member work item and waits, at a barrier, for every participant to
finish requesting and awaiting its own graceful ack while the whole
cluster is still fully powered. Only once every participant has cleared
the barrier does phase 2 let each of them proceed to its actual PAS/TZ
hardware power-off, so no member is ever asking firmware to ack a
shutdown after a sibling's hardware is already gone. The fan-out has to
be deferred to a work item rather than calling rproc_shutdown() inline,
because qcom_pas_stop() runs with the remoteproc core holding the
stopping member's own rproc->lock, and reaching for a sibling's
rproc->lock from inside that critical section would risk an ABBA
deadlock against a concurrent operation on that sibling.

Membership in a round is decided once, by
qcom_pas_cluster_member_stops(), and recorded per member, so that the
participant count and the two counters it seeds can never diverge. The
crashed member that triggered the round is a participant even though its
rproc->state is still RPROC_CRASHED -- the core only sets RPROC_OFFLINE
after ops->stop() returns -- while a sibling crashing concurrently is
deliberately excluded, being already torn down by its own recovery.

On a crash, cascade the stop the same way but also auto-restart the
whole cluster root-first once every participant has fully powered off,
reusing the root_booted completion to keep non-root members'
qcom_pas_start() from racing ahead of the root's boot. An explicit stop
leaves the ordered restart to users or higher-level policy.

Devices without "qcom,cluster-root" are completely unaffected, since
qcom_pas.cluster stays NULL for them.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 252 +++++++++++++++++++++++++++++
 1 file changed, 252 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 8231f811c568..0cf0a31f1f1d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -28,6 +28,7 @@
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
+#include <linux/workqueue.h>
 
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
@@ -128,7 +129,9 @@ struct qcom_pas {
 
 	struct qcom_pas_cluster *cluster;
 	struct list_head cluster_node;
+	struct work_struct stop_work;
 	bool is_cluster_root;
+	bool in_cluster_stop;
 };
 
 /**
@@ -139,6 +142,13 @@ struct qcom_pas {
  * @members:	list of struct qcom_pas, linked via cluster_node
  * @root:	the member whose "qcom,cluster-root" points at itself
  * @root_booted: signaled once @root has started, cleared when it goes down
+ * @cascade_work: deferred work that restarts the cluster after a crash
+ * @cascade_origin: member whose stop or crash triggered the current round
+ * @cascade_crashed: true if @cascade_origin crashed, rather than being stopped
+ * @stop_in_progress: re-entrancy guard: a coordinated stop is in flight
+ * @stop_pending: participants still owing a phase-1 graceful-ack attempt
+ * @stop_barrier: released once @stop_pending reaches 0
+ * @stop_done_pending: participants still owing a phase-2 hardware power-off
  * @refcount:	number of members currently attached to this cluster
  *
  * PAS instances whose "qcom,cluster-root" phandle points at the same node
@@ -153,6 +163,15 @@ struct qcom_pas_cluster {
 	struct qcom_pas *root;
 	struct completion root_booted;
 
+	struct work_struct cascade_work;
+	struct qcom_pas *cascade_origin;
+	bool cascade_crashed;
+	bool stop_in_progress;
+
+	int stop_pending;
+	struct completion stop_barrier;
+	int stop_done_pending;
+
 	int refcount;
 };
 
@@ -163,9 +182,78 @@ struct qcom_pas_cluster {
  */
 #define QCOM_PAS_CLUSTER_ROOT_BOOT_TIMEOUT	(1 * HZ)
 
+/*
+ * How long a member waits at the phase-1 barrier for the rest of the cluster,
+ * in case a participant never reaches it at all (e.g. rproc_stop() bails out
+ * before calling ops->stop).
+ */
+#define QCOM_PAS_CLUSTER_STOP_TIMEOUT		(20 * HZ)
+
 static LIST_HEAD(qcom_pas_cluster_list);
 static DEFINE_MUTEX(qcom_pas_cluster_list_lock);
 
+static void qcom_pas_stop_work_fn(struct work_struct *work)
+{
+	struct qcom_pas *pas = container_of(work, struct qcom_pas, stop_work);
+
+	rproc_shutdown(pas->rproc);
+}
+
+/**
+ * qcom_pas_cluster_cascade_work() - restart a crashed cluster, root first
+ * @work:	the cluster's cascade_work
+ *
+ * Only ever scheduled from qcom_pas_cluster_stop_complete(), i.e. only after
+ * every participant has finished its own phase-2 hardware power-off, and only
+ * when the round that just finished was a crash; explicit stops never
+ * auto-restart.
+ */
+static void qcom_pas_cluster_cascade_work(struct work_struct *work)
+{
+	struct qcom_pas_cluster *cluster = container_of(work, struct qcom_pas_cluster,
+						       cascade_work);
+	struct qcom_pas *pas, *origin, *root;
+
+	mutex_lock(&cluster->lock);
+	origin = cluster->cascade_origin;
+	root = cluster->root;
+	mutex_unlock(&cluster->lock);
+
+	/*
+	 * Membership is stable here: qcom_pas_cluster_exit() always
+	 * cancel_work_sync()s this work before touching cluster->members, so no
+	 * member can join or leave while this work item is running.
+	 *
+	 * If @origin is itself the root, its own crash-recovery thread
+	 * (rproc_boot_recovery()) is already booting it directly -- never call
+	 * rproc_boot() on @origin from here. The root has to be booted before
+	 * any other member, since a dependent member's qcom_pas_start() blocks
+	 * on cluster->root_booted: were we to boot it first from this
+	 * single-threaded work item, it would wait out its timeout on a root
+	 * boot this same thread has not issued yet.
+	 */
+	if (root && root != origin) {
+		int ret;
+
+		ret = rproc_boot(root->rproc);
+		if (ret) {
+			dev_err(root->dev, "failed to restart cluster root: %d\n", ret);
+			return;
+		}
+	}
+
+	list_for_each_entry(pas, &cluster->members, cluster_node) {
+		int ret;
+
+		if (pas == origin || pas == root)
+			continue;
+
+		ret = rproc_boot(pas->rproc);
+		if (ret)
+			dev_err(pas->dev, "failed to restart cluster sibling: %d\n", ret);
+	}
+}
+
 static struct qcom_pas_cluster *qcom_pas_cluster_get(struct device_node *node)
 {
 	struct qcom_pas_cluster *cluster;
@@ -187,6 +275,8 @@ static struct qcom_pas_cluster *qcom_pas_cluster_get(struct device_node *node)
 	mutex_init(&cluster->lock);
 	INIT_LIST_HEAD(&cluster->members);
 	init_completion(&cluster->root_booted);
+	init_completion(&cluster->stop_barrier);
+	INIT_WORK(&cluster->cascade_work, qcom_pas_cluster_cascade_work);
 	/*
 	 * Cluster members may be attached to already-running firmware at
 	 * probe, so the root is presumed up until its own qcom_pas_stop()
@@ -256,6 +346,7 @@ static int qcom_pas_cluster_init(struct qcom_pas *pas, struct device_node *np)
 		return -ENOMEM;
 
 	pas->is_cluster_root = is_root;
+	INIT_WORK(&pas->stop_work, qcom_pas_stop_work_fn);
 
 	mutex_lock(&pas->cluster->lock);
 	list_add_tail(&pas->cluster_node, &pas->cluster->members);
@@ -273,6 +364,9 @@ static void qcom_pas_cluster_exit(struct qcom_pas *pas)
 	if (!cluster)
 		return;
 
+	cancel_work_sync(&pas->stop_work);
+	cancel_work_sync(&cluster->cascade_work);
+
 	mutex_lock(&cluster->lock);
 	list_del(&pas->cluster_node);
 	if (cluster->root == pas)
@@ -328,6 +422,153 @@ static int qcom_pas_cluster_wait_for_root(struct qcom_pas *pas)
 	return 0;
 }
 
+/*
+ * A member takes part in a coordinated stop if its hardware is still powered:
+ * either it is running or attached, or it is the crashed member that triggered
+ * the round, whose rproc->state is RPROC_CRASHED and only becomes
+ * RPROC_OFFLINE once its ops->stop() has returned.
+ *
+ * A sibling that crashes concurrently is deliberately not a participant: it is
+ * already being torn down by its own recovery, and pulling it into this round
+ * would leave the two rounds fighting over the same counters.
+ */
+static bool qcom_pas_cluster_member_stops(struct qcom_pas *member,
+					  struct qcom_pas *origin)
+{
+	if (member == origin)
+		return true;
+
+	return member->rproc->state == RPROC_RUNNING ||
+	       member->rproc->state == RPROC_ATTACHED;
+}
+
+/**
+ * qcom_pas_cluster_trigger_stop() - begin a coordinated cluster stop
+ * @pas:	the member that is being stopped or has crashed
+ * @crashed:	true if @pas crashed, rather than being stopped explicitly
+ *
+ * Marks every member whose hardware is still powered as a participant of this
+ * round and fires off each *other* participant's own full stop concurrently
+ * via its stop_work, instead of one after another. This lets every
+ * participant's phase-1 graceful-ack attempt (see qcom_pas_stop()) run while
+ * all of them are still fully powered, so nobody is asking firmware to ack a
+ * shutdown after a sibling's hardware is already gone.
+ *
+ * A no-op if a coordinated stop is already in flight, e.g. when @pas is a
+ * sibling whose own stop was itself triggered by this same round: @pas is
+ * already marked as a participant and just goes on to take part in it.
+ *
+ * Must not call rproc_shutdown()/rproc_boot() directly from here: this runs
+ * from inside qcom_pas_stop(), which the remoteproc core calls with @pas's own
+ * rproc->lock held, and taking a sibling's rproc->lock synchronously from
+ * within that critical section would risk an ABBA deadlock against a
+ * concurrent operation on the sibling.
+ */
+static void qcom_pas_cluster_trigger_stop(struct qcom_pas *pas, bool crashed)
+{
+	struct qcom_pas_cluster *cluster = pas->cluster;
+	struct qcom_pas *member;
+	int active = 0;
+
+	mutex_lock(&cluster->lock);
+	if (cluster->stop_in_progress) {
+		mutex_unlock(&cluster->lock);
+		return;
+	}
+
+	cluster->stop_in_progress = true;
+	cluster->cascade_origin = pas;
+	cluster->cascade_crashed = crashed;
+
+	list_for_each_entry(member, &cluster->members, cluster_node) {
+		member->in_cluster_stop = qcom_pas_cluster_member_stops(member, pas);
+		if (member->in_cluster_stop)
+			active++;
+	}
+
+	cluster->stop_pending = active;
+	cluster->stop_done_pending = active;
+	reinit_completion(&cluster->stop_barrier);
+
+	/*
+	 * Fan out while still holding the lock, so that membership cannot
+	 * change between counting the participants and scheduling them, and so
+	 * that a stop_work running immediately blocks in
+	 * qcom_pas_cluster_stop_barrier() until the counters above are in
+	 * place. schedule_work() does not sleep, so it is safe from here.
+	 */
+	list_for_each_entry(member, &cluster->members, cluster_node) {
+		if (member == pas || !member->in_cluster_stop)
+			continue;
+
+		schedule_work(&member->stop_work);
+	}
+	mutex_unlock(&cluster->lock);
+}
+
+/**
+ * qcom_pas_cluster_stop_barrier() - wait for the whole cluster's phase-1 ack
+ * @pas:	the member calling this from inside its own qcom_pas_stop()
+ *
+ * Blocks this member's own hardware power-off until every other participant
+ * has also finished its phase-1 graceful-ack attempt (see qcom_pas_stop()).
+ * Bounded by QCOM_PAS_CLUSTER_STOP_TIMEOUT, proceeding to phase 2 anyway
+ * rather than hanging forever.
+ *
+ * A member that is not a participant of the current round, having already been
+ * powered off before it started, has no ack to contribute and must not touch
+ * the counters.
+ */
+static void qcom_pas_cluster_stop_barrier(struct qcom_pas *pas)
+{
+	struct qcom_pas_cluster *cluster = pas->cluster;
+
+	mutex_lock(&cluster->lock);
+	if (!pas->in_cluster_stop) {
+		mutex_unlock(&cluster->lock);
+		return;
+	}
+	if (--cluster->stop_pending == 0)
+		complete_all(&cluster->stop_barrier);
+	mutex_unlock(&cluster->lock);
+
+	if (!wait_for_completion_timeout(&cluster->stop_barrier,
+					 QCOM_PAS_CLUSTER_STOP_TIMEOUT))
+		dev_warn(pas->dev, "timed out waiting for cluster stop barrier\n");
+}
+
+/**
+ * qcom_pas_cluster_stop_complete() - record this member's phase-2 completion
+ * @pas:	the member calling this from inside its own qcom_pas_stop()
+ *
+ * The last participant to call this, i.e. the last to finish powering off its
+ * own hardware, ends the round and, if it was triggered by a crash, schedules
+ * the root-first restart cascade.
+ */
+static void qcom_pas_cluster_stop_complete(struct qcom_pas *pas)
+{
+	struct qcom_pas_cluster *cluster = pas->cluster;
+	bool crashed;
+
+	mutex_lock(&cluster->lock);
+	if (!pas->in_cluster_stop) {
+		mutex_unlock(&cluster->lock);
+		return;
+	}
+	pas->in_cluster_stop = false;
+
+	if (--cluster->stop_done_pending != 0) {
+		mutex_unlock(&cluster->lock);
+		return;
+	}
+	cluster->stop_in_progress = false;
+	crashed = cluster->cascade_crashed;
+	mutex_unlock(&cluster->lock);
+
+	if (crashed)
+		schedule_work(&cluster->cascade_work);
+}
+
 static void qcom_pas_segment_dump(struct rproc *rproc,
 				  struct rproc_dump_segment *segment,
 				  void *dest, size_t offset, size_t size)
@@ -625,10 +866,18 @@ static int qcom_pas_stop(struct rproc *rproc)
 		mutex_unlock(&pas->cluster->lock);
 	}
 
+	if (pas->cluster)
+		qcom_pas_cluster_trigger_stop(pas, rproc->state == RPROC_CRASHED);
+
+	/* Phase 1: request and await this member's own graceful ack */
 	ret = qcom_q6v5_request_stop(&pas->q6v5, pas->sysmon);
 	if (ret == -ETIMEDOUT)
 		dev_err(pas->dev, "timed out on wait\n");
 
+	if (pas->cluster)
+		qcom_pas_cluster_stop_barrier(pas);
+
+	/* Phase 2: the whole cluster has acked, power the hardware off */
 	ret = qcom_pas_shutdown(pas->pas_id);
 	if (ret && pas->decrypt_shutdown)
 		ret = qcom_pas_shutdown_poll_decrypt(pas);
@@ -653,6 +902,9 @@ static int qcom_pas_stop(struct rproc *rproc)
 	if (pas->smem_host_id)
 		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
 
+	if (pas->cluster)
+		qcom_pas_cluster_stop_complete(pas);
+
 	return ret;
 }
 
-- 
2.43.0

