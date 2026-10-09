Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11EE3E9C3C
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 Oct 2026 07:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530308; cv=none; b=U3dLLcuUuRDeSmJ4rKdi+UdK8rAE189mKJh6R//oUiK9BAZAfpk82CFoTUV/SM2MyAHSmIYi36dD9iaHuOu/X7RSF1r4syF8uoxmjwXsgT/KQOofynqASkmTkxpi3h5GixFdBTbyD+fPg/WDLCNItAiDVBsQxDXh/AoJR1UAJUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530308; c=relaxed/simple;
	bh=/14AnJdOv4/OEFenFmduUhdKSTi1qNrHOpbR7trhU+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TLHaZbmlI3lyolb+O83tEVVgwe/rx7CbRO9P7oG1I7gwirRheFxj1mlaahvmJWlEpQOZAimjQB/zsWIi4R7A69+GnyC6VhzNVKCsgFHq4QOdJTqGN87t5KXJlJy47b77v8S7kUMaMNAB/Wcm4tpAGJiY2M3oixg/vBSrdoMTjTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2IDGUmS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T2uKt2i1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2IDGUmS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T2uKt2i1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HTie966602
	for <linux-remoteproc@vger.kernel.org>; Fri, 9 Oct 2026 07:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7xgNPSz/n74rOyYTi8h9utgmI2XeMg441HRWzmFXDU=; b=m2IDGUmS6ss8/8NB
	Gty7yCiiYn8caavze+l9ibSDgV78admb17PgJMdvBhoisXbOugNlSUcppq/F7T7e
	GPah92bVlhJARJY2mNat+yD9zaEH8/bkuRkNlRjzsHmifjSwJVLAhpkEWJmPGKeL
	LNsotoorkANJtwfNCIyBJXYkt2hg+oGmWSVDqSlvy9TOSVtntqGkurWWorDMzPNS
	HtWPS2Q6s/EueUq1RTEsnjKff1E0kQEgHASSlM+4XkqH3b/wnYZZpfBQLPVdY+lh
	gCMhsJ1akzg0kcf/Q5S0RjYnQqHkb86B1yCRUvldHSYjWqrQXpxvjUojKPGRWi0B
	KPbMRg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj2cyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 07:18:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e605efae40so35746185ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 00:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791530303; x=1792135103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7xgNPSz/n74rOyYTi8h9utgmI2XeMg441HRWzmFXDU=;
        b=T2uKt2i18q2JqpBFZ9kJ4Cg8a/j9B/XZ2KrMZRHF+b+2TxqpYXcoD1lq8FgCCg/FkI
         JKf+UA9G982/xOXItqK5To2uHax9SA20IF/E/ZvZC2sedKY8pAmgfEI2L3EF1jcX4OS8
         KprG++M2izjwhJpBSkAOvRLeB5lJE5SYdYlxtIf4EsY/JnOwDFrHNm2B8WhjCgnJ0SHO
         TU4UvPx1ElaWZ0NFju5cwI1Vvdk4rR6XPt9YqyRrMlAx3pTgPQMXvqEJ7RlR3fnymDpH
         ATO4tTuAdbAejYVJayvDNLtPbzhQsgBWG6ElVunl0nZZMRhsw5EbzQvLCMsDonhRQEhn
         +b0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530303; x=1792135103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x7xgNPSz/n74rOyYTi8h9utgmI2XeMg441HRWzmFXDU=;
        b=YS+YPq6YQx7R3G65ntPoBYSy+S1okoWLWXNvi7/hL0Sm2rNpZHReJNt2EETWVWCYM1
         dk+rCr+IbQKtIJtwhyxNimPgcqxccfH3Vq8XcI9MLEhuhVoOBZwQe+51r72gi7OiHkwe
         8PLQPaIxJhoLizDircjJ3yrRs39W+t9D9jgSYZfFEcHKW6X/LT0MZlKhD/9s1Na2ERKb
         E+8Gw40ja2XeNDZIML5zgABktWhV4LAbWAmDPfAgPEjHCJMKOuiVb33oycDgIeUW9U8g
         ru9/xojhdgbPvq/E+cgxNae+tjrWJte2pac620VUk4KnlvbdT6iy8gNC0FefTCHb82zM
         Y7/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzHi7yG/Aj5xLEqB0uF9lttao1V3NkyDpQyZCO2ABijFLrdXepWmGerqylclDF+ijbjcKgdxVyHA+LUnWxDW3Lp@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+dP2DrpRjwFzkLH4C6lLtd7cNJVCBPDPCvEMIhEoH7z0p+cFq
	g46RqulQSDNpCjw3fDWxK2effUqe9oBecQU50izTlhoXdaJfSIvTq6s1ZaaCgIJPouRC2jkwJXz
	e6yNJUxToNTQAzLE2PjcPsQ/bbkR2OeSIGHcaCjt+0B/rPiOjFsfdEDwZvPj38EevYHBxjFyE
X-Gm-Gg: AYBFou1Zo6jmeym5i1pV1S3GQwHS85A71uW0W7vAL1v6vlIUki29NJ+QTeidEc5DNxB
	1+nNrT+g1tuNEuniW2dE7OxKTQn4mPBCdHtuunx+VGA+nwuzHsbByh8EeYhvmz4WDygRkqcEfIs
	DPuVPiqpKxJE7zFZcFQ4fyqgNUe+vZVYbqC94rinJmWEbgKcqXYzRJGaMHBZ7fWwqVPCevoqhmG
	GkglfiwxOYpma/pr88X1HenkCi2jd2RKHZSDmJmFlz8hJgNXEj4aTPwD7DRiidZFrQVavQ8sKZ2
	UH1Dsn3/2K3DoBnW+xaSHvwhG7QJ+CNbzD9TkwI1Die6rL2GPBay1Ccyb0RK9w+kxoA/i/VRA5A
	/SoKRKrXLD8GeffadVpRIftn8AbyzuWTkNC/MjyysegiKvYKUfrOhzzK5m88ysNRS+I0Tr7xEdD
	Ch/s66sy3Kw+wJ
X-Received: by 2002:a17:90b:3b48:b0:3a8:3597:44fc with SMTP id 98e67ed59e1d1-3ab3a8d4cedmr1187646a91.53.1791530303260;
        Fri, 09 Oct 2026 00:18:23 -0700 (PDT)
X-Received: by 2002:a17:90b:3b48:b0:3a8:3597:44fc with SMTP id 98e67ed59e1d1-3ab3a8d4cedmr1187630a91.53.1791530302668;
        Fri, 09 Oct 2026 00:18:22 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e1d287sm494387a12.13.2026.10.09.00.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:18:22 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 12:47:40 +0530
Subject: [PATCH 2/4] remoteproc: qcom: pas: Support secondary images
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-oob-support-glymur-v1-2-96cc8ffcced3@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
In-Reply-To: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791530288; l=14963;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=/14AnJdOv4/OEFenFmduUhdKSTi1qNrHOpbR7trhU+U=;
 b=BEGpdj2kUAaVymrOaU/7NMCK8Pb0IuxpVeUYE3ya/CdxrSk3x0/N9j3kDAIKS3yc8uxbryTCU
 /HwATDtBMrlDaIF3T/I4qQQdrRy5zT38Bticq7UCnjOAyH5LTDJLpB2
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac89540 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WQtI_U3e13HlgX_oKn0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: RAVmiryPy1RZrBo2by_n0bg27gV2AeIq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfXwBnKZc6Fw+OS
 EPxIKTJLVT5Eo42HxRMOKmS9UWlGaJPyuQrxUnTzo5iH6UbtwX24tBmlLrghIV+L7BZ81VjKWEW
 6I55me4EPdWc02qO3m+ZRyXBanBt8E7yq+mexvAlCh7fspbWlM0P00OYnvKDqU7x4rY18GXsi8T
 wfb2eXpFbnC+znKtMwM6Ba0sxeR53k0gXsqZZsNk9CGxnqExROddVP/w8O9TSiCJiFSEEXBEv7y
 v8jQI7qaWkHlJrDh2DPHK9TZj9mtBz0zTAcYTJM+v2MzS5bBRy1g3e+UkF1jh3aOGgmJUsOzAOP
 WUNqeNwxkZUJv5GKgG9Q8jtFEnMfGJ7UDT5RiGBnnMKMcGdmGlr2H8lsj+pH9X77UmPAA3BPAop
 BIBU8Yp0E3U3AhlNbWu7HdSW4fVGmy4N5ohMHAE6ZHvQREsUbrAumVCsM+sj9gmfe5IxwSl57el
 3E4wb99Sp8cRlN3iwWg==
X-Proofpoint-GUID: RAVmiryPy1RZrBo2by_n0bg27gV2AeIq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX+5LI//oPzIni
 NYzEXeWZzUHx+DCwpPJFt7h88vfatMfZX47CCCrodjr4x1CtOLqqRyxfWMzJt/mwzEHAwUmREhs
 yxigwDmwSN5jx/A8Vq6JkgYkLDOAzp0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1011
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090028

The Out-of-Band Management Subsystem (OOBMSS) is managed by a common
remote processor and consists of two Zephyr subsystems:

+----------------------------------------------------------+
|                         OOBMSS                           |
|                                                          |
|  +------------------------+  +------------------------+  |
|  | OOB-TEE                |  | OOB-Non-Secure         |  |
|  | Primary processor      |  | Auxiliary processor    |  |
|  | Primary image and DTB  |  | Secondary image and DTB|  |
|  +------------------------+  +------------------------+  |
+----------------------------------------------------------+

The primary processor is the Out-of-Band Trusted Execution Environment
(OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
that depends on the primary processor and cannot function independently.

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts.

Add generic PAS support for loading, authenticating, and mapping a
secondary image and its DTB, then shutting down and releasing both while
keeping the existing primary-image lifecycle unchanged.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 235 ++++++++++++++++++++++++++++++++++---
 1 file changed, 218 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..604dfa947340 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -42,8 +42,12 @@ struct qcom_pas_data {
 	int crash_reason_smem;
 	const char *firmware_name;
 	const char *dtb_firmware_name;
+	const char *secondary_firmware_name;
+	const char *secondary_dtb_firmware_name;
 	int pas_id;
 	int dtb_pas_id;
+	int secondary_pas_id;
+	int secondary_dtb_pas_id;
 	int lite_pas_id;
 	int lite_dtb_pas_id;
 	unsigned int minidump_id;
@@ -83,8 +87,12 @@ struct qcom_pas {
 	int proxy_pd_count;
 
 	const char *dtb_firmware_name;
+	const char *secondary_firmware_name;
+	const char *secondary_dtb_firmware_name;
 	int pas_id;
 	int dtb_pas_id;
+	int secondary_pas_id;
+	int secondary_dtb_pas_id;
 	int lite_pas_id;
 	int lite_dtb_pas_id;
 	unsigned int minidump_id;
@@ -95,17 +103,25 @@ struct qcom_pas {
 
 	const struct firmware *firmware;
 	const struct firmware *dtb_firmware;
+	const struct firmware *secondary_firmware;
+	const struct firmware *secondary_dtb_firmware;
 
 	phys_addr_t mem_phys;
 	phys_addr_t dtb_mem_phys;
+	phys_addr_t secondary_mem_phys;
+	phys_addr_t secondary_dtb_mem_phys;
 	phys_addr_t mem_reloc;
 	phys_addr_t dtb_mem_reloc;
+	phys_addr_t secondary_mem_reloc;
+	phys_addr_t secondary_dtb_mem_reloc;
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
 
 	void __iomem *mem_region;
 
 	size_t mem_size;
 	size_t dtb_mem_size;
+	size_t secondary_mem_size;
+	size_t secondary_dtb_mem_size;
 	size_t region_assign_size[MAX_ASSIGN_COUNT];
 
 	int region_assign_idx;
@@ -123,6 +139,8 @@ struct qcom_pas {
 
 	struct qcom_pas_context *pas_ctx;
 	struct qcom_pas_context *dtb_pas_ctx;
+	struct qcom_pas_context *secondary_pas_ctx;
+	struct qcom_pas_context *secondary_dtb_pas_ctx;
 };
 
 static void qcom_pas_segment_dump(struct rproc *rproc,
@@ -198,19 +216,37 @@ static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
 	}
 }
 
-static int qcom_pas_shutdown_poll_decrypt(struct qcom_pas *pas)
+static int qcom_pas_shutdown_poll_decrypt(int pas_id)
 {
 	unsigned int retry_num = 50;
 	int ret;
 
 	do {
 		msleep(QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS);
-		ret = qcom_pas_shutdown(pas->pas_id);
+		ret = qcom_pas_shutdown(pas_id);
 	} while (ret == -EINVAL && --retry_num);
 
 	return ret;
 }
 
+static void qcom_pas_release_firmware(struct qcom_pas *pas)
+{
+	if (pas->dtb_firmware) {
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
+
+	if (pas->secondary_firmware) {
+		release_firmware(pas->secondary_firmware);
+		pas->secondary_firmware = NULL;
+	}
+
+	if (pas->secondary_dtb_firmware) {
+		release_firmware(pas->secondary_dtb_firmware);
+		pas->secondary_dtb_firmware = NULL;
+	}
+}
+
 static int qcom_pas_unprepare(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -224,6 +260,10 @@ static int qcom_pas_unprepare(struct rproc *rproc)
 	qcom_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
 		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+	if (pas->secondary_pas_id)
+		qcom_pas_metadata_release(pas->secondary_pas_ctx);
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
 
 	return 0;
 }
@@ -241,19 +281,29 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	if (pas->lite_dtb_pas_id)
 		qcom_pas_shutdown(pas->lite_dtb_pas_id);
 
-	if (pas->dtb_pas_id) {
-		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
+	if (pas->secondary_dtb_pas_id) {
+		ret = request_firmware(&pas->secondary_dtb_firmware,
+				       pas->secondary_dtb_firmware_name, pas->dev);
+		if (ret) {
+			qcom_pas_release_firmware(pas);
+			return ret;
+		}
+	}
+
+	if (pas->secondary_pas_id) {
+		ret = request_firmware(&pas->secondary_firmware,
+				       pas->secondary_firmware_name, pas->dev);
 		if (ret) {
-			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
-				pas->dtb_firmware_name, ret);
+			qcom_pas_release_firmware(pas);
 			return ret;
 		}
+	}
 
-		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
+	if (pas->dtb_pas_id) {
+		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name,
+				       pas->dev);
 		if (ret) {
-			qcom_pas_metadata_release(pas->dtb_pas_ctx);
-			release_firmware(pas->dtb_firmware);
+			qcom_pas_release_firmware(pas);
 			return ret;
 		}
 	}
@@ -310,10 +360,51 @@ static int qcom_pas_start(struct rproc *rproc)
 			goto disable_cx_supply;
 	}
 
+	if (pas->secondary_dtb_pas_id) {
+		ret = qcom_mdt_pas_load(pas->secondary_dtb_pas_ctx,
+					pas->secondary_dtb_firmware,
+					pas->secondary_dtb_firmware_name,
+					&pas->secondary_dtb_mem_reloc);
+		if (ret)
+			goto disable_px_supply;
+
+		ret = qcom_pas_map_carveout(rproc, pas->secondary_dtb_mem_phys,
+					    pas->secondary_dtb_mem_size);
+		if (ret)
+			goto release_secondary_dtb_metadata;
+
+		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_dtb_pas_ctx);
+		if (ret)
+			goto unmap_secondary_dtb_carveout;
+	}
+
+	if (pas->secondary_pas_id) {
+		ret = qcom_mdt_pas_load(pas->secondary_pas_ctx,
+					pas->secondary_firmware,
+					pas->secondary_firmware_name,
+					&pas->secondary_mem_reloc);
+		if (ret)
+			goto unmap_secondary_dtb_carveout;
+
+		ret = qcom_pas_map_carveout(rproc, pas->secondary_mem_phys,
+					    pas->secondary_mem_size);
+		if (ret)
+			goto release_secondary_metadata;
+
+		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_pas_ctx);
+		if (ret)
+			goto unmap_secondary_carveout;
+	}
+
 	if (pas->dtb_pas_id) {
+		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
+					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
+		if (ret)
+			goto unmap_secondary_carveout;
+
 		ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
 		if (ret)
-			goto disable_px_supply;
+			goto release_dtb_metadata;
 
 		ret = qcom_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
 		if (ret) {
@@ -326,7 +417,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
 				&pas->mem_reloc);
 	if (ret)
-		goto release_pas_metadata;
+		goto unmap_dtb_carveout;
 
 	qcom_pil_info_store(pas->info_name, pas->mem_phys, pas->mem_size);
 
@@ -351,6 +442,10 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
 		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+	if (pas->secondary_pas_id)
+		qcom_pas_metadata_release(pas->secondary_pas_ctx);
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
@@ -361,12 +456,27 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 release_pas_metadata:
 	qcom_pas_metadata_release(pas->pas_ctx);
-	if (pas->dtb_pas_id)
-		qcom_pas_metadata_release(pas->dtb_pas_ctx);
-
 unmap_dtb_carveout:
 	if (pas->dtb_pas_id)
-		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
+		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys,
+					pas->dtb_mem_size);
+release_dtb_metadata:
+	if (pas->dtb_pas_id)
+		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+unmap_secondary_carveout:
+	if (pas->secondary_pas_id)
+		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
+					pas->secondary_mem_size);
+release_secondary_metadata:
+	if (pas->secondary_pas_id)
+		qcom_pas_metadata_release(pas->secondary_pas_ctx);
+unmap_secondary_dtb_carveout:
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
+					pas->secondary_dtb_mem_size);
+release_secondary_dtb_metadata:
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
 disable_px_supply:
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
@@ -413,7 +523,7 @@ static int qcom_pas_stop(struct rproc *rproc)
 
 	ret = qcom_pas_shutdown(pas->pas_id);
 	if (ret && pas->decrypt_shutdown)
-		ret = qcom_pas_shutdown_poll_decrypt(pas);
+		ret = qcom_pas_shutdown_poll_decrypt(pas->pas_id);
 
 	if (ret)
 		dev_err(pas->dev, "failed to shutdown: %d\n", ret);
@@ -426,6 +536,27 @@ static int qcom_pas_stop(struct rproc *rproc)
 		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
 	}
 
+	if (pas->secondary_pas_id) {
+		ret = qcom_pas_shutdown(pas->secondary_pas_id);
+		if (ret && pas->decrypt_shutdown)
+			ret = qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
+		if (ret)
+			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
+
+		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
+					pas->secondary_mem_size);
+	}
+
+	if (pas->secondary_dtb_pas_id) {
+		ret = qcom_pas_shutdown(pas->secondary_dtb_pas_id);
+		if (ret)
+			dev_err(pas->dev,
+				"failed to shutdown secondary dtb: %d\n", ret);
+
+		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
+					pas->secondary_dtb_mem_size);
+	}
+
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 
 	handover = qcom_q6v5_unprepare(&pas->q6v5);
@@ -740,6 +871,42 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->dtb_pas_ctx))
 		return PTR_ERR(pas->dtb_pas_ctx);
 
+	if (!pas->secondary_pas_id)
+		return 0;
+
+	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 2, &res);
+	if (ret)
+		return ret;
+
+	pas->secondary_mem_phys = res.start;
+	pas->secondary_mem_reloc = res.start;
+	pas->secondary_mem_size = resource_size(&res);
+
+	pas->secondary_pas_ctx =
+		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_pas_id,
+					    pas->secondary_mem_phys,
+					    pas->secondary_mem_size);
+	if (IS_ERR(pas->secondary_pas_ctx))
+		return PTR_ERR(pas->secondary_pas_ctx);
+
+	if (!pas->secondary_dtb_pas_id)
+		return 0;
+
+	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 3, &res);
+	if (ret)
+		return ret;
+
+	pas->secondary_dtb_mem_phys = res.start;
+	pas->secondary_dtb_mem_reloc = res.start;
+	pas->secondary_dtb_mem_size = resource_size(&res);
+
+	pas->secondary_dtb_pas_ctx =
+		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_dtb_pas_id,
+					    pas->secondary_dtb_mem_phys,
+					    pas->secondary_dtb_mem_size);
+	if (IS_ERR(pas->secondary_dtb_pas_ctx))
+		return PTR_ERR(pas->secondary_dtb_pas_ctx);
+
 	return 0;
 }
 
@@ -823,6 +990,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	struct rproc *rproc;
 	struct device_node *node;
 	const char *fw_name, *dtb_fw_name = NULL;
+	const char *secondary_fw_name = NULL;
+	const char *secondary_dtb_fw_name = NULL;
 	const struct rproc_ops *ops = &qcom_pas_ops;
 	int ret;
 
@@ -847,6 +1016,24 @@ static int qcom_pas_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (desc->secondary_firmware_name) {
+		secondary_fw_name = desc->secondary_firmware_name;
+		ret = of_property_read_string_index(pdev->dev.of_node,
+						    "firmware-name", 2,
+						    &secondary_fw_name);
+		if (ret < 0 && ret != -EINVAL)
+			return ret;
+	}
+
+	if (desc->secondary_dtb_firmware_name) {
+		secondary_dtb_fw_name = desc->secondary_dtb_firmware_name;
+		ret = of_property_read_string_index(pdev->dev.of_node,
+						    "firmware-name", 3,
+						    &secondary_dtb_fw_name);
+		if (ret < 0 && ret != -EINVAL)
+			return ret;
+	}
+
 	if (desc->minidump_id)
 		ops = &qcom_pas_minidump_ops;
 
@@ -868,6 +1055,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->pas_id = desc->pas_id;
 	pas->lite_pas_id = desc->lite_pas_id;
 	pas->lite_dtb_pas_id = desc->lite_dtb_pas_id;
+	pas->secondary_pas_id = desc->secondary_pas_id;
+	pas->secondary_dtb_pas_id = desc->secondary_dtb_pas_id;
 	pas->info_name = desc->sysmon_name;
 	pas->smem_host_id = desc->smem_host_id;
 	pas->decrypt_shutdown = desc->decrypt_shutdown;
@@ -879,6 +1068,14 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		pas->dtb_firmware_name = dtb_fw_name;
 		pas->dtb_pas_id = desc->dtb_pas_id;
 	}
+	if (secondary_fw_name) {
+		pas->secondary_firmware_name = secondary_fw_name;
+		pas->secondary_pas_id = desc->secondary_pas_id;
+	}
+	if (secondary_dtb_fw_name) {
+		pas->secondary_dtb_firmware_name = secondary_dtb_fw_name;
+		pas->secondary_dtb_pas_id = desc->secondary_dtb_pas_id;
+	}
 	platform_set_drvdata(pdev, pas);
 
 	ret = device_init_wakeup(pas->dev, true);
@@ -925,6 +1122,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 	if (pas->dtb_pas_id)
 		pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
+	if (pas->secondary_pas_id)
+		pas->secondary_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
+	if (pas->secondary_dtb_pas_id)
+		pas->secondary_dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 
 	if (desc->early_boot)
 		pas->rproc->state = RPROC_DETACHED;

-- 
2.34.1

