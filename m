Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA9B319858
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 17:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977172; cv=none; b=m47HBN7ZIyK4q+YoRA1e+xBN4jO7ZiWOLltCxi4aimsmfVK34YXRoFS1uFgapNGQKARcMzMhNO+sMmcorj9mMzanepNg1++pFiho2Q/YkYcxlRQSDwFTEKmsuCgjUrVGUPg+i+KGCv+ubxAAA3ES654zYaRUlw3y6hd3Wez3s7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977172; c=relaxed/simple;
	bh=E80RH1g6+XmtOt05VuW8EQSwyqUGmVWXM3zADBQrnQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T9h7QVU+2p7bihl9GK4OOUhL3Xj0cGkL23H+JVNMyT/sU1+kWnqeCEVrGoPV9jnO59LdXgr/Jg+z1BrDI4qNn1gmU3szPFp6vfWJPU5Vpmw8l6dOcxjg8jMw+OwuHCG4AJye/eNBd8ooHKkwSj9nAIjvP8Rs0r/X4ATi5ogKk3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2C81cwd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEAWNqX1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2C81cwd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEAWNqX1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdHhM1831867
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 17:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JEf1zqA7HQYkJuYe1UvKDxOfM4VJ0k2jxtE
	W6JLvxpw=; b=Q2C81cwd1QfS97JShr7yx+PFI6uTDkCMTGxY/YhxiU+pFPZVOyf
	Blu9HAIIsNfYnlJiOl6PZSXVZmbvzIoo6yxu+93L81usTrq5JB0tzQvY/jiJqKyV
	Neh5KA37ZFU+2Nh3IEj67nzYfrHIbNfUrPacXimm0b+gvwjeVmSzZseTMnWMFONH
	VXpHdiXqsneWI2+zt0n76mVsZwmTnY+qW9KZcixsaFQe1kHQcNbGWvkJ37MH6eNe
	WyqNhK7u9cSuaD8XrkPs1TZB93CyMY2jW1YGXDmvHawoY7iuTcHhwbJUvH3vg/LX
	ZvKIMYoQM9sJh6as6hQRossdnfaq2WMuZww==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ9b2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 17:12:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so3735974a12.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 10:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774977170; x=1775581970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JEf1zqA7HQYkJuYe1UvKDxOfM4VJ0k2jxtEW6JLvxpw=;
        b=FEAWNqX1U14QwsWJrz4IQjEt12SEWZlJQ8++QvbHZVofT70Fyr9VXwdy1YAnr8zl4f
         Z/i84sPP4wfk7/oaqKwS/F/Z/AV8xdWQpapKb13mfiVVSPoN1OZ0lLsaxfO36lvjUkLK
         f4BifPG3y2trDQpFSJhv48fpS52ggq/qI6KvQxTj/TX1lw+ovx8xogkopG5/xy+GWGo7
         fZREGF3xNz+pSdT0n5LFteyTSGtCfkeTTAf5KwiRvY084HwQtJBw0OWB75WqRpgi5hxx
         qCFYifL6XVE3XIUrjta2BdPdaaIZVbe47o7WwIDtmeJlzLCB3iiV5Fz9leBDIIJ5mp1v
         3mfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977170; x=1775581970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEf1zqA7HQYkJuYe1UvKDxOfM4VJ0k2jxtEW6JLvxpw=;
        b=fCYgcTQmgFEkELvTPlm91LvlDzpjGTM8zgWNDlxsniDfbPpoX/cgR1qzNKe0SemFgZ
         Hj0bXEeMassIEXtYXqg/Jg82DcUGE0pgflSYjVCd0vfyCC7R5XzNa1Dxa/7lRy+LpGMA
         QkOQsiy8DAvDcoqqnyVOMjHnl+4nNt6J2JP4ENj7trkPioaiswiUEFcyXkLN0bHUY3+n
         wp/s8gMeoqg2JC2bOyBoRB+fx33Mo+ojIv9FAlfLbzGZP1Tu+FznrYCTadSN63UTe1jo
         yX1CmpwVo4djWujnVykLyofiGjcGNnrggI3DXt2Ee9AgPXGKYCxbTvkOwqfOp+a/ggwk
         ErTw==
X-Forwarded-Encrypted: i=1; AJvYcCUe1f5R0ep/IvwIkjlt6NX4XJbJ4zgcR8gbLNN4ps488/tmfCMzmN/hWxkA6bcqMGrL4K2M/Z2bgtK65RMWXiIE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyags6daYI5w98HPM7dHaAVCEhAZrmtra2/fWD4RS7UUKuw8hwl
	oCU8KdAW9pinU2bS+YXCm7b+96WZHpSiFFHU21Trc8uJGFGoq49zwhNZrCMNTk+4U3e96Y3sJx2
	2tVkk3UJz3qGnjZK+Y3UhnRsg3Gd+6MIVmyH9yH4dFj9/MTKTfNbjXv3QVSA2rlHvwA0LDE0FHZ
	F4bkdR
X-Gm-Gg: ATEYQzwETixEIvzDdcVx/pabZjAAEp+neNBTemVk7tlTdoFdb+NzL+sGrlctODBA3Wl
	Lra4uGLkkHVu644R/phe0fadc0cOPOjgpENGktN1XtrmFzXbs2IICrMeqNavwCzvVEM+Pe6mXQQ
	ClQ2H3rMwb2EYUPBgds6MeXEbyqq/jwsEnGAc4V2iQ2T/ZePuHDZ8gcSEShC0ZqPJYILtKS8ANP
	2Mt/By/4Op81jS1RM6Lg3nULow5a1Pmt2fGyiwhx/62svKbGiTmr5ZEBT4+wzn4p9V9tv64jWlz
	7WwTSD3mB3ieqQvfz3lYJM/q7mc5hrMN3k/FXRCzFkSSJoSas1eWFX9yQrthDzCSEyV57z2eB7X
	b2tpJka/lqOd9f9GstMSIFuJq46I27RxFGl0e9F2KxHY7MnR2
X-Received: by 2002:a05:6a00:230b:b0:82c:9126:31f1 with SMTP id d2e1a72fcca58-82ce891032cmr414757b3a.14.1774977169648;
        Tue, 31 Mar 2026 10:12:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:230b:b0:82c:9126:31f1 with SMTP id d2e1a72fcca58-82ce891032cmr414722b3a.14.1774977169025;
        Tue, 31 Mar 2026 10:12:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca84644d9sm11362062b3a.13.2026.03.31.10.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:12:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2] remoteproc: qcom: Fix minidump out-of-bounds access on subsystems array
Date: Tue, 31 Mar 2026 22:42:43 +0530
Message-ID: <20260331171243.1962067-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE2NCBTYWx0ZWRfXxgRmIcyLJyF8
 OUCercT2oUBwnHPQyRPAui8Q+R+9AElQ38eMszngIChGl6ltB7OK1zAmPkjivrq/aExxDIX3Lbj
 PS5JA0DSwYTjJiwBlqFMtRmefOQPF/4N9puZttbz2fyPaZrTb3/y/cDwenDCoRl8AlizgHV7lMZ
 x3S1x35fvIwGLO3QMMt72ijD3m0wtVZD/6Kqzoa29lgy58Yl88X8R1KqPrlGTRE2vDF3avu32r3
 1yVANn9nOEKiCmgXYu3EKcOXjZ2nLuKEmyotxV8kGRTh896ifu6FRMFUG4on8I3SsZZ216f92PZ
 bTkUo6zvz1c6Pcaf98JgTtzbkJ/GgiTnI49sCwxP3wC44BvFMOGnz3r3Md9b/nVnv7H+xUhUqmq
 j1cQimPdXs+d7tLuHVSdk7UNIUt5azIAbzQs3MKJtxgGNkMiZEnBv1XaxECcbJcuyh5al/YTwcK
 MKhDPdH6+gjpob+NGFA==
X-Proofpoint-GUID: X5DyDThyIPvEBS2L-MyaR58rBkFZKsei
X-Proofpoint-ORIG-GUID: X5DyDThyIPvEBS2L-MyaR58rBkFZKsei
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cc0092 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BG4z5P5NB9rwbtz6RWcA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310164

MAX_NUM_OF_SS was hardcoded to 10 in the minidump_global_toc struct,
which is a direct overlay on an SMEM item allocated by the firmware.
Newer Qualcomm SoC firmware allocates space for more subsystems, while
older firmware only allocates space for 10. Bumping the constant would
cause Linux to read/write beyond the SMEM item boundary on older
platforms.

Fix this by converting subsystems[] to a flexible array member and
deriving the actual number of subsystems at runtime from the size
returned by qcom_smem_get(). Add a bounds check on minidump_id against
the derived count before indexing into the array.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2: https://lore.kernel.org/lkml/20250808164417.4105659-1-mukesh.ojha@oss.qualcomm.com/
 - Converted subsystems as flexible array and derived the no of
   subsystem entries from the size returned from qcom_smem_get() to check the
   validity of minidump index.

 drivers/remoteproc/qcom_common.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 6c31140268ac..fd2b6824ad26 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -28,7 +28,6 @@
 #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
 #define to_pdm_subdev(d) container_of(d, struct qcom_rproc_pdm, subdev)
 
-#define MAX_NUM_OF_SS           10
 #define MAX_REGION_NAME_LENGTH  16
 #define SBL_MINIDUMP_SMEM_ID	602
 #define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
@@ -80,7 +79,7 @@ struct minidump_global_toc {
 	__le32				status;
 	__le32				md_revision;
 	__le32				enabled;
-	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
+	struct minidump_subsystem	subsystems[];
 };
 
 struct qcom_ssr_subsystem {
@@ -151,9 +150,11 @@ void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
 	int ret;
 	struct minidump_subsystem *subsystem;
 	struct minidump_global_toc *toc;
+	unsigned int num_ss;
+	size_t toc_size;
 
 	/* Get Global minidump ToC*/
-	toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, NULL);
+	toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, &toc_size);
 
 	/* check if global table pointer exists and init is set */
 	if (IS_ERR(toc) || !toc->status) {
@@ -161,6 +162,16 @@ void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
 		return;
 	}
 
+	/* Derive the number of subsystems from the actual SMEM item size */
+	num_ss = (toc_size - offsetof(struct minidump_global_toc, subsystems)) /
+		 sizeof(struct minidump_subsystem);
+
+	if (minidump_id >= num_ss) {
+		dev_err(&rproc->dev, "Minidump id %d is out of range: %d\n",
+			minidump_id, num_ss);
+		return;
+	}
+
 	/* Get subsystem table of contents using the minidump id */
 	subsystem = &toc->subsystems[minidump_id];
 
-- 
2.53.0

