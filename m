Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7D441BA9B
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800377; cv=none; b=VKMrlhbbkN7aMYAJuQo6yIEm1icAxyCc+zcTW4s1BPXsC4kCgJ47x5psF3IkMpfmZtiF5Jh9WplRraEl5v21Fpa3hnsSd7ctqEEeRmf9DXcdM61TXfAeHfulFJ4Owc4xRJHG34+VaaXdea3Hdq/DRzT8OkNGZfeWJ/qIYtSkPrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800377; c=relaxed/simple;
	bh=V0xJ5rGoDj5iR1dMadfapVH8RgSP9jryHFE8W+hoDXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avtOP1Kgcg7LULaz7kv9MEaqu+ltxVcMMqWZvOHDuqMVcF/1dyHjSKWvKQz8mLaZb/b8s+tH/DjOZ687tTsz1tXK/Z6tda/kn1oM6PVFITKeNHf2q6hOgUfkL35QCf9V9cwYP7c+kfmhB3sTx4/0H1cBWVzVph+UmgxyYBv3TQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dob8upJI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bW2M26/M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dob8upJI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bW2M26/M"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDMbmg219427
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yR1lFmAjTJo
	UnDiSDduEbpWfWkdC6wgUbDXk1v75sWU=; b=Dob8upJI1SVnHglxdW3XAWBnKQ3
	RUSIpoe/icMPvoc6zCUk3tfLVwNmcaZrDWeiydOaycmO+N6sKGn5qgDnGn5Skn2/
	71oUFLgvM5mHZFU/0mJeWu/rDZBdV/rm9/H//9I3Lvoj2fwDEgTqjMEW6k8wVKrY
	P2hqjA9/xlDJsb6KsD18uYKs2gf8xH0L+dfmkw1l4UOi0Kb1e4fVAe2Y01LuV/Ah
	+chIg5fbgv5QXvdZ8GguroN3a2DDe1PeAD3ndLgANSnMoOGkt3eWgptayWD6gXxt
	JODvwTfkZg9+UDkiZKqMHb418EF3P2QfP/5kjNELjy42xBo3fz1nyjHQDFw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7rvrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:26:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso2183752a91.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 06:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800373; x=1787405173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yR1lFmAjTJoUnDiSDduEbpWfWkdC6wgUbDXk1v75sWU=;
        b=bW2M26/Msw8xwVA2y7HBA1yoED8CfeRT/UTEHkT4QEOFCz1YocH6WQgI9vHaPTznNR
         XNAVqz0sJBmW165JdmIzfHBPcNaWLu32BMUOJxUT7frueFRrAA1isfchfzDqDAEj6Mlh
         myRf6hVRIBpENaaNsAlakUYEIS78dG+w+EYOZfQuxCjfKfXPIjVf43FOkATkNh9bmdYy
         6q9ebjpktoiBPzojveVP++vXg2CIaNaAP3RK8R7S52dfVCnsFzHSGVwqeoF/MYMk2oxj
         vbtYxWpecP9oni/ocvnYZmalVHuBOCCeGnfXFR2HAjEJe1WIUXzUwWTeMDhnwu914QpQ
         ts6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800373; x=1787405173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yR1lFmAjTJoUnDiSDduEbpWfWkdC6wgUbDXk1v75sWU=;
        b=Ss9OKy7SKTq/2C5wpv3magOgPZ2X212WofF/xYem9ZE1JJshCzeobEIEmc9ZD8ckSh
         zzirRkmZW8TElxzUqhXX+imRLFeN1CAiw0PgpBp18tW5jTAaRc1Bp19ke11W/sdlYaK9
         D3zQWxR7JjoC2RBwnPSDbD7fBkubL+n4ZfqBcSj6I2xDFP1XPOpWb/+8sKF2klwuzoo9
         e9M5zMRCsBz3qcvDS6tPYGXvg2LXvRQtrVMTXgvWvP2yOCSun+1Pmc8Ug3y1gnLjzrt0
         rEQOqWWseLppqw4nrNQ71esq6SzWFLRKasUl629S5j1S0BVyyQHnVbd/rHHUj+Yw1BrH
         384w==
X-Forwarded-Encrypted: i=1; AHgh+Rryopn78QeJyX0DltZyE6kPjGb1EaSy7z4VGbVnFaF4YYMjxw+gt1tErZ1vIH+AfuV7gh3EX66u8lkp8Pgw1GWD@vger.kernel.org
X-Gm-Message-State: AOJu0YzAQzJXtGc3Qhir1vhCiQDtfJ+Qqgyc5e+S/IOjIdmhIPjnfxPN
	wq9mm4BphiRWRg272LemvusmIIrG2zgv0pc/X8JQsXnGM/O7OQvcMzuoTs4SO2fdPQ81iWfp7te
	BlVDdBDsJpXzmh6CZpOoJXafRLmk4oMkArfvwmbyFG2Rn5oR3NAkWR25D2N07p/jqt0l6jk+h
X-Gm-Gg: AR+sD12qrYu6WUtYHkMMaGyG9ExNLreyHIhXbjp5CdzrLvN6Emc/aBOV4tu7kMqt++6
	+24hiFKWRDhyrU54tiGLMZ5lWLv15qwTvf9n6iZKmxdHuJTwh86vLe1HtNrdzsdyQMTey8TO60s
	YKqPGOnjG3SP5SLgIBq8jx8npxFZufNegbMH7631sHYLqHKjzLKJWE5+pdygBSwSZGZFv8eDr+h
	gVtNuLYGGcY65uJuFyy5VTz+c+mPvHAP6yzUoxQl9z5vXZQ2lW3yHovWju5hbKHbPj7Dq8HbV+2
	loENaXffKJuQerkvGpU0+Dee8GKcWsEYpS9iZ2fAd9AvV2vYYStxXXryOHw/cGeSWpotYEfaRG+
	VwrMO2yOfE0rhAYfqFRM604eUvYziyNa1CmCVOfePevwremjydKniYKsEDAUn
X-Received: by 2002:a17:90b:3889:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-3933b8ace11mr13189672a91.14.1786800373322;
        Sat, 15 Aug 2026 06:26:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3889:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-3933b8ace11mr13189639a91.14.1786800372740;
        Sat, 15 Aug 2026 06:26:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:12 -0700 (PDT)
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
Subject: [PATCH 6/8] remoteproc: qcom: pas: Sequence HPASS ADSP cluster boot root-first
Date: Sat, 15 Aug 2026 21:25:39 +0800
Message-ID: <20260815132541.1575121-7-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfXz7d/dwL9TShP
 NJWm9jMel+YEdnSZ4vkOCcbTCbUnZAIxGFnQD6txAHVbvnw+JGsNFC4ewzJhP3XcrMMfXwhXFn3
 JqvF5Fq0Z1KciOgOYkXss3PB8OcP068jgYI5mQvtYznY+CrNXfBtXcGEmDEEtOlUGUXAwCTYdv+
 a0Go66gZ54sLn60lSOPzFf8VeuvzSzrc97lkva+EKTcapLAQiSaEWmZd/VXT1ZEb2cUrujMf1+c
 y04aRiFLM73s7L2C8hXwJJ9j5iMH9hRswZyJHuG2WNHrcsFQ8gvjE4WT9LEgsqjtfb7YsSbm8Cp
 ID2Ymg4qJBzaoJyDnOxaZ8Yq6XC1/EJMaHDrTIA5EY2ctBTTozVMvWzojg4zf+0ZRp7WKa7QOqq
 OL/XgYUWQWrnZhBEAKM/k0ZpbZ6mOJMmv1E+e0fwxNpngclETPTD6DIvM4JcR67YhlVdmXWEW51
 QW1YKYjSpqext1jULcQ==
X-Proofpoint-GUID: XWIgwFU9AytqEK2boOLrZr_wyteOWOwl
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a8068f6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=NQtoXHyzFVGnf705VfcA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: XWIgwFU9AytqEK2boOLrZr_wyteOWOwl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX9Q7fhG3M1ubF
 yA0KvHGBNzuADbJfkEo3MM3WtECT3wHplIIVuezqbvSkvDs1yRTt+O0FCZHmKoVzonNE+ijvMNy
 F5p8lbl0HgpDcp9xFUJDcsDuwH5TiIc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

The cluster root owns the HPASS resources shared with its siblings and
initializes them as part of its own boot, so ADSP1/ADSP2 can only cold
boot once ADSP0 is up. Booting a dependent member first leaves it
without the clocks, resets and NoC configuration it needs.

Gate a dependent member's qcom_pas_start() on the root having started.
The root being enabled in DT does not imply it has already bound, as
probe order between the two is not guaranteed, so fail the boot if the
root has not bound rather than dereferencing it. If the root has bound
but is not running yet, wait briefly on a completion the root signals
from its own qcom_pas_start(), so that a member racing the root through
a restart does not fail outright.

The completion starts out signaled, since a member may be attached to
already-running firmware at probe, and is only cleared once the root
actually goes down. A dependent member's boot racing the root's stop can
therefore still observe a stale completion, in which case it falls back
to failing on the root's state.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 76 ++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index c8e4230bcf2c..8231f811c568 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -138,6 +138,7 @@ struct qcom_pas {
  * @lock:	protects @members and @root
  * @members:	list of struct qcom_pas, linked via cluster_node
  * @root:	the member whose "qcom,cluster-root" points at itself
+ * @root_booted: signaled once @root has started, cleared when it goes down
  * @refcount:	number of members currently attached to this cluster
  *
  * PAS instances whose "qcom,cluster-root" phandle points at the same node
@@ -150,10 +151,18 @@ struct qcom_pas_cluster {
 	struct mutex lock;
 	struct list_head members;
 	struct qcom_pas *root;
+	struct completion root_booted;
 
 	int refcount;
 };
 
+/*
+ * How long a dependent member waits for its root to finish booting before
+ * giving up, e.g. when it is racing the root through the crash-restart
+ * cascade.
+ */
+#define QCOM_PAS_CLUSTER_ROOT_BOOT_TIMEOUT	(1 * HZ)
+
 static LIST_HEAD(qcom_pas_cluster_list);
 static DEFINE_MUTEX(qcom_pas_cluster_list_lock);
 
@@ -177,6 +186,13 @@ static struct qcom_pas_cluster *qcom_pas_cluster_get(struct device_node *node)
 	cluster->node = of_node_get(node);
 	mutex_init(&cluster->lock);
 	INIT_LIST_HEAD(&cluster->members);
+	init_completion(&cluster->root_booted);
+	/*
+	 * Cluster members may be attached to already-running firmware at
+	 * probe, so the root is presumed up until its own qcom_pas_stop()
+	 * reinit_completion()s this the first time it actually goes down.
+	 */
+	complete_all(&cluster->root_booted);
 	cluster->refcount = 1;
 	list_add_tail(&cluster->list, &qcom_pas_cluster_list);
 
@@ -267,6 +283,51 @@ static void qcom_pas_cluster_exit(struct qcom_pas *pas)
 	pas->cluster = NULL;
 }
 
+/**
+ * qcom_pas_cluster_wait_for_root() - gate a dependent member's boot on its root
+ * @pas:	the non-root cluster member being started
+ *
+ * The cluster root owns the resources its siblings need, and initializes them
+ * as part of its own boot, so a dependent member can only be started once the
+ * root is up.
+ *
+ * Return: 0 if the root is up, negative errno otherwise.
+ */
+static int qcom_pas_cluster_wait_for_root(struct qcom_pas *pas)
+{
+	struct qcom_pas_cluster *cluster = pas->cluster;
+	struct rproc *root;
+
+	/*
+	 * The root's PAS instance is enabled in DT (checked in
+	 * qcom_pas_cluster_init()) but has not necessarily bound yet, and may
+	 * have unbound again. Without it there is nothing to sequence this
+	 * member's boot against.
+	 *
+	 * Note that nothing refcounts members across unbind, so a root freed
+	 * under a concurrent sibling boot remains unhandled.
+	 */
+	mutex_lock(&cluster->lock);
+	root = cluster->root ? cluster->root->rproc : NULL;
+	mutex_unlock(&cluster->lock);
+
+	if (!root) {
+		dev_err(pas->dev, "cluster root not bound\n");
+		return -ENODEV;
+	}
+
+	if (root->state == RPROC_RUNNING || root->state == RPROC_ATTACHED)
+		return 0;
+
+	if (!wait_for_completion_timeout(&cluster->root_booted,
+					 QCOM_PAS_CLUSTER_ROOT_BOOT_TIMEOUT)) {
+		dev_err(pas->dev, "cluster root not started\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static void qcom_pas_segment_dump(struct rproc *rproc,
 				  struct rproc_dump_segment *segment,
 				  void *dest, size_t offset, size_t size)
@@ -424,6 +485,12 @@ static int qcom_pas_start(struct rproc *rproc)
 	struct qcom_pas *pas = rproc->priv;
 	int ret;
 
+	if (pas->cluster && !pas->is_cluster_root) {
+		ret = qcom_pas_cluster_wait_for_root(pas);
+		if (ret)
+			return ret;
+	}
+
 	ret = qcom_q6v5_prepare(&pas->q6v5);
 	if (ret)
 		return ret;
@@ -494,6 +561,9 @@ static int qcom_pas_start(struct rproc *rproc)
 	if (pas->dtb_pas_id)
 		qcom_pas_metadata_release(pas->dtb_pas_ctx);
 
+	if (pas->cluster && pas->is_cluster_root)
+		complete_all(&pas->cluster->root_booted);
+
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
 
@@ -549,6 +619,12 @@ static int qcom_pas_stop(struct rproc *rproc)
 	int handover;
 	int ret;
 
+	if (pas->cluster && pas->is_cluster_root) {
+		mutex_lock(&pas->cluster->lock);
+		reinit_completion(&pas->cluster->root_booted);
+		mutex_unlock(&pas->cluster->lock);
+	}
+
 	ret = qcom_q6v5_request_stop(&pas->q6v5, pas->sysmon);
 	if (ret == -ETIMEDOUT)
 		dev_err(pas->dev, "timed out on wait\n");
-- 
2.43.0

