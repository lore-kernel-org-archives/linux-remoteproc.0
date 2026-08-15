Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283F441CB5A
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800373; cv=none; b=XW/DA7MfNEFlu/dDFQQCft2LpRoxaJueD82K57L8nmVthr6TqzjPo1myTUHALBHI1ODFmSfjpbVohadW1aYIqePKCwLBx2MgV6fRRUQJpGwA1RHK/q+J6QS2ueR64wHvq+res24zDUundPx+RT/iyWc0Kbhw/8P0jFgmO5toS+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800373; c=relaxed/simple;
	bh=y7ar12FG8BENdZ3ityGYZ36lZ87KzzyCCpI/by79cdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBnTXFwWZ4nwHMHTE/dzVvoqkgFqCbJiHPoCCOSu0EFitoCiFVoU7T2nkGaofLOJyPzuBfgSJ/CgO5V2VjnP9fRaG1RW2nJlKwEYgDKqf1z2N91yOkcveMgxVACdptdIpXBPjoB/h6AiFtDocptoy8Gko52zprqb1DclsI427ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkteGfss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8Sh98gr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkteGfss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8Sh98gr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDN7me1715076
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zOFtAZ+E2b5
	BkVLywK82W0fnJDTIl5z2YkSwRx/DLF0=; b=MkteGfssnE62uvp8ajwUd7R2Una
	Bm3gGBTlVPrQYjGaKyMgrapFRb02w8mNtSSM3oHrCh1ChhbPtXSXbiWZdcZ3WPrj
	uF+cDDqOGGFNDj5exIZVcSMEvYPdRihk2gK66+3IvvP/JqHBWwqslj9uVOrTGhdR
	A7tBSQB1h/kammS/if/330DL5ZWbdWpkqUdwt4nudHTKg31G82lor7NgMKZBWZC7
	T85/9oumqaL1XASNl9J9CNI04LEkzNn+bOshrbqWY5zx2b8wDxHuKJMcx0KjnuuP
	WoeOSUQM8Mc3C6BKunRtAOhESeyWUaFveiFi55N1RvOAJV5ehVHafgBSzrw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghf9006-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:26:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2275347a91.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800370; x=1787405170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zOFtAZ+E2b5BkVLywK82W0fnJDTIl5z2YkSwRx/DLF0=;
        b=Y8Sh98gr6GpnPw6OhwyY89CgIgs9X9/S0utDaeoRBDQjr4DV44zoXmlJ22ZASyTg0y
         uClt3c3srJn7llFlYmPnyWu4LUCEwC9Bncks2FIX/2X4KVjuE3j2RY6zQcuyLq9+AM2N
         jbcQcD+0pfLTDZB0ewLoadfss4v836aT1K91cdlSdnzRvpcepAQq4xlHrPqRI8TA1/Ed
         gotzV/fHh1oO78K4GW9FltlJRQOuizlwkPIJ5wQ55sRV1qf1AErHOmBn0hCK//3TnYLr
         5gSAhI70osx7NZ+q31y/IPnkOsviIlwFD6Ciii+bvdiRByXTRSWSmUT4TggyOgqQzg1H
         gwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800370; x=1787405170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zOFtAZ+E2b5BkVLywK82W0fnJDTIl5z2YkSwRx/DLF0=;
        b=l9J9D039nwtMajEtb7dkQqsHx5IOCUoaZVRFA+swvy122SAmfJBRfqzspaDAPTlYRX
         ztlEw0pIns1fq9k0YkUaIfLsizgZpbaRJ4ctCIW+mQwWBZwX6gDfYGawjh74Ss2hwn9X
         F5Z5MCHOeIBCOVIqQqLQfscz4IyQlSDCmAfTYxPLhN7Y9tqjdSelqASl42fPFowstHaB
         sBlL3ItURYHg3ERv4UTg0bYdLrn9gPtimPVjLN0us+YSOYfM872QBvXn/j9WAGXN+gC3
         wX5TrFwajUEFjYFsioEt/BJBtoOojlZ7UtGHGhjL9p7+ju3OshNJgMXoMuJGAe4Npb17
         RzsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGVHn3KvqpSwDFeUu+hH1qY5XDmjHcfmKABXG/zZrG2iGpSXDekBIwxr1BKZzAYOn5QVF6M3DJeVMnCp7OZ2mP@vger.kernel.org
X-Gm-Message-State: AOJu0YybwcoIn1SjTIEnszSQIBod7tPN3OK9d0EAcyP87fF73e1E0hxh
	weVzNDtCRR2J5bwa14uc8LGq1Jw6Fwty2gMZFoe9ZwpnpbcXtqZzZNs752ekKjSEmuVG0yJyG5S
	fv9WZ0arCfzQT/wpVYrQtuYCIR6KGNnFRrfL2F/6s1PJ8bEy3VEMMzJxfLaHI/CY3OUwk8g6l
X-Gm-Gg: AR+sD12MovYEQENZeFNN6Rd+lb7Z1CC3SLC69RWpQZILRqbeDK8DF19O7ipfSAb79Yi
	eXEry856xEjkygn7qafTDkTo1oj842veQGCUt635t3Y1Xja5Cp0tiUt/QEFEryIW0cf7hHTyOlC
	QGQjUpOJes3zS75EHDf2V3S0nPel6duC9vDJhnpBzX/cEL5HvIWRH4yRC4A1KSKQISig9R+93UX
	eCi+zPMl97wFd89boNO1rZh7Tct+H4fgZWoNnqeGifiBiEL9XnMnhU54NFaDIi+U85MauOUFdFa
	Ff+krmr7Z2e1Gc3PIJJNKelDj8TnBD3L5NEQgF64/l1uhot4Z+ZLZKiwTL5wr6459asVh4ZieF9
	D3vovxbjMRCr5MAjReHd3K/yZNCl6WDuCErwUnDONJUCNZ5q4n7U0XdciV3fk
X-Received: by 2002:a17:90b:1806:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-3933bd0f310mr14071498a91.3.1786800369586;
        Sat, 15 Aug 2026 06:26:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1806:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-3933bd0f310mr14071440a91.3.1786800369057;
        Sat, 15 Aug 2026 06:26:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:08 -0700 (PDT)
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
Subject: [PATCH 5/8] remoteproc: qcom: pas: Track HPASS ADSP cluster membership
Date: Sat, 15 Aug 2026 21:25:38 +0800
Message-ID: <20260815132541.1575121-6-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OZ6oyBTY c=1 sm=1 tr=0 ts=6a8068f2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=tpIsOtObft-OYHULcT0A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 0fssXeR0lget3KIU6Hfk_QeeFJZ5z3ta
X-Proofpoint-ORIG-GUID: 0fssXeR0lget3KIU6Hfk_QeeFJZ5z3ta
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX2n5gerfO40c9
 WXCVmWWijM7tooqG+vdgY9vq46LptuTvzBWZZ9tdtPMPEfeAKsTbsK9s8haO8fjrWiOwVrEikH6
 CNIRGLNa1huqFWbOxXFwY8dzeEzbWbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX2rL6AgUQ/DbY
 iLO8S1OZpq8Dt4IMjArNodGKnCJb6GmTeGG81a8Ea4BoyQZZaA2LJ0x68BL3zXp5vdGEJIT+dQP
 tKKx1BXavqbzZLV2lLH2MvcSGLpz79jrEeXI0N3kh6j6kSzJVYevcs2oiYBvAezgaV1hr0h80c5
 5kJXq6ena7hra7cPxj54q4bM/61By2K9dknjSVrPOOKbz1uOFFXJtF5UVP6LBt/vyh7yWI5hx66
 jrDaVZxFZwBGjtssoJ66Sv7YuOnA9ccW6NHBEHq9sdzES0jxQmnviZpnWtNzhLwtBec+cULfcrK
 g77Rvd/zUPwCLz9vEgpwjRMae7kSXBakYcAtMm1gItwWyZ3BNtzKOugobbVp2f1pYxdqW4CeEkr
 7/4v+qqN/hQpEAUbd+rgIjCyslJtTqniHjOJfqqVt0PL2KZ0jf7BnTWejaFVUA2fJKeipcY+bvh
 M8470oqAAH1t9fVn2mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608150096

On Nord, ADSP0/1/2 share HPASS-domain resources (PLLs, AG_NOC, RSCp,
CESTA, THROTTLE, QTMR) owned by ADSP0, and their firmware cannot
tolerate one member being started or stopped independently of the
others. Modeling that requires each PAS instance to know which other
instances it is grouped with.

Add a small registry of clusters, keyed by the device_node every member's
"qcom,cluster-root" phandle points at, and join it at probe. Membership
is answerable from the node being probed alone: every member carries the
property, and the one referencing itself is the root, so there is no need
to search the device tree for nodes referencing a given instance.

A dependent member is rejected at probe if its root is disabled in DT,
since its boot could never be sequenced after a root that will not bind.

Publish the cluster in rproc->cluster, which is all sysmon and
glink_ssr need to stop notifying siblings of each other's SSR events.
The cluster is left only after rproc_del() has stopped this member, so
that the suppression is still in effect for that stop, and is unwound on
every probe error path, since a member freed while still linked into the
cluster would be walked by its siblings.

Instances without "qcom,cluster-root" are completely unaffected:
qcom_pas.cluster stays NULL for them.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 152 +++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 8cff0684fe2f..c8e4230bcf2c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -66,6 +66,8 @@ struct qcom_pas_data {
 	bool needs_tzmem;
 };
 
+struct qcom_pas_cluster;
+
 struct qcom_pas {
 	struct device *dev;
 	struct rproc *rproc;
@@ -123,8 +125,148 @@ struct qcom_pas {
 
 	struct qcom_pas_context *pas_ctx;
 	struct qcom_pas_context *dtb_pas_ctx;
+
+	struct qcom_pas_cluster *cluster;
+	struct list_head cluster_node;
+	bool is_cluster_root;
+};
+
+/**
+ * struct qcom_pas_cluster - state shared by clustered PAS instances
+ * @node:	device_node of the cluster root, the key into the global list
+ * @list:	linkage in qcom_pas_cluster_list
+ * @lock:	protects @members and @root
+ * @members:	list of struct qcom_pas, linked via cluster_node
+ * @root:	the member whose "qcom,cluster-root" points at itself
+ * @refcount:	number of members currently attached to this cluster
+ *
+ * PAS instances whose "qcom,cluster-root" phandle points at the same node
+ * share one of these.
+ */
+struct qcom_pas_cluster {
+	struct device_node *node;
+	struct list_head list;
+
+	struct mutex lock;
+	struct list_head members;
+	struct qcom_pas *root;
+
+	int refcount;
 };
 
+static LIST_HEAD(qcom_pas_cluster_list);
+static DEFINE_MUTEX(qcom_pas_cluster_list_lock);
+
+static struct qcom_pas_cluster *qcom_pas_cluster_get(struct device_node *node)
+{
+	struct qcom_pas_cluster *cluster;
+
+	mutex_lock(&qcom_pas_cluster_list_lock);
+
+	list_for_each_entry(cluster, &qcom_pas_cluster_list, list) {
+		if (cluster->node == node) {
+			cluster->refcount++;
+			goto out;
+		}
+	}
+
+	cluster = kzalloc(sizeof(*cluster), GFP_KERNEL);
+	if (!cluster)
+		goto out;
+
+	cluster->node = of_node_get(node);
+	mutex_init(&cluster->lock);
+	INIT_LIST_HEAD(&cluster->members);
+	cluster->refcount = 1;
+	list_add_tail(&cluster->list, &qcom_pas_cluster_list);
+
+out:
+	mutex_unlock(&qcom_pas_cluster_list_lock);
+	return cluster;
+}
+
+static void qcom_pas_cluster_put(struct qcom_pas_cluster *cluster)
+{
+	mutex_lock(&qcom_pas_cluster_list_lock);
+	if (--cluster->refcount == 0) {
+		list_del(&cluster->list);
+		mutex_unlock(&qcom_pas_cluster_list_lock);
+		of_node_put(cluster->node);
+		kfree(cluster);
+		return;
+	}
+	mutex_unlock(&qcom_pas_cluster_list_lock);
+}
+
+/**
+ * qcom_pas_cluster_init() - join the cluster referenced by @np, if any
+ * @pas:	PAS instance being probed
+ * @np:		of_node of @pas's platform device
+ *
+ * Devices without a "qcom,cluster-root" property are not part of a cluster;
+ * @pas->cluster is left NULL and this is a no-op (e.g. cdsp0-3). Cluster
+ * members all carry the property, the root included, whose phandle points
+ * back at itself.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int qcom_pas_cluster_init(struct qcom_pas *pas, struct device_node *np)
+{
+	struct device_node *root_node;
+	bool is_root;
+
+	root_node = of_parse_phandle(np, "qcom,cluster-root", 0);
+	if (!root_node)
+		return 0;
+
+	is_root = root_node == np;
+
+	/*
+	 * A non-root member is useless without its root: it can never be
+	 * booted, since its boot has to be sequenced after the root's. Reject
+	 * it here rather than at first boot, so that a DT enabling a dependent
+	 * DSP but not the one owning the shared resources fails loudly and
+	 * early.
+	 */
+	if (!is_root && !of_device_is_available(root_node)) {
+		dev_err(pas->dev, "cluster root %pOF is not enabled\n", root_node);
+		of_node_put(root_node);
+		return -ENODEV;
+	}
+
+	pas->cluster = qcom_pas_cluster_get(root_node);
+	of_node_put(root_node);
+	if (!pas->cluster)
+		return -ENOMEM;
+
+	pas->is_cluster_root = is_root;
+
+	mutex_lock(&pas->cluster->lock);
+	list_add_tail(&pas->cluster_node, &pas->cluster->members);
+	if (is_root)
+		pas->cluster->root = pas;
+	mutex_unlock(&pas->cluster->lock);
+
+	return 0;
+}
+
+static void qcom_pas_cluster_exit(struct qcom_pas *pas)
+{
+	struct qcom_pas_cluster *cluster = pas->cluster;
+
+	if (!cluster)
+		return;
+
+	mutex_lock(&cluster->lock);
+	list_del(&pas->cluster_node);
+	if (cluster->root == pas)
+		cluster->root = NULL;
+	mutex_unlock(&cluster->lock);
+
+	qcom_pas_cluster_put(cluster);
+	pas->cluster = NULL;
+}
+
 static void qcom_pas_segment_dump(struct rproc *rproc,
 				  struct rproc_dump_segment *segment,
 				  void *dest, size_t offset, size_t size)
@@ -862,6 +1004,12 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas = rproc->priv;
 	pas->dev = &pdev->dev;
 	pas->rproc = rproc;
+
+	ret = qcom_pas_cluster_init(pas, pdev->dev.of_node);
+	if (ret)
+		return ret;
+	rproc->cluster = pas->cluster;
+
 	pas->minidump_id = desc->minidump_id;
 	pas->pas_id = desc->pas_id;
 	pas->lite_pas_id = desc->lite_pas_id;
@@ -951,6 +1099,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	qcom_pas_unassign_memory_region(pas);
 free_rproc:
 	device_init_wakeup(pas->dev, false);
+	qcom_pas_cluster_exit(pas);
 
 	return ret;
 }
@@ -964,6 +1113,9 @@ static void qcom_pas_remove(struct platform_device *pdev)
 
 	rproc_del(pas->rproc);
 
+	pas->rproc->cluster = NULL;
+	qcom_pas_cluster_exit(pas);
+
 	qcom_q6v5_deinit(&pas->q6v5);
 	qcom_pas_unassign_memory_region(pas);
 	qcom_remove_glink_subdev(pas->rproc, &pas->glink_subdev);
-- 
2.43.0

