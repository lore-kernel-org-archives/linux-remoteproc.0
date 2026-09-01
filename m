Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966CC339389
	for <linux-remoteproc@vger.kernel.org>; Tue,  1 Sep 2026 11:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261960; cv=none; b=AKOFMb8RyX3ZIH45txebEpDHFVkkxAD4kaOFkFCRrN/hDKZ7NgMb4prgfQ4kDMbavLx4i8UFTFBVQ7IoN2MKaidv5H+DISEDebN88+/Fnp1OBWauWQCAcP/fQInzO82/GLvQTmRvsf+F4DFxXdj7DZr9isNExpYu6O1JK4pbSTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261960; c=relaxed/simple;
	bh=jTp2GntyDIHxjPo3lsbT4RFexVL3HPEV5KbNlfne2PY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tjRUPepK82hxyejrcjR+I0QFLa/5wbBx4BHUIPFwEDUGqMlrMt4uW24w2XhnEdV105pSlegeEOEndHWmglMoIeCrTMno/faPguSA0XJjgsvV1whDQx3RUL5I48nfY7IAU4o/UJv43NXkySgstls90Y5vjjzCYf6+YP4TtNT4ro8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1THN2+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g0k2QBkP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1THN2+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g0k2QBkP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJCAQ1641401
	for <linux-remoteproc@vger.kernel.org>; Tue, 1 Sep 2026 11:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r1OdVL+Tbt9zws2fnd3Nhg
	TB2MVa0oBkflSXJea0/Iw=; b=X1THN2+CbscYwlTY6tBmR8LhY1K72I7TqCBY/u
	NKGkylVZ/IaVU4CwXIDW7cqKyDNkGCESpAE/Cn9wxoynpI1u6wWFq8W41zZ8aWIK
	Kvxtt66vRmAlbvj8NZi5yfNPTBXIaF/7dbtWW6UbZRhYOPEg4r+g3BXxwcNOTw2n
	OEMhLiLf6FNSrhnb6MRv8FaVBV+/dxfpOKGOO7Tl5h1nnc1aYVwMKWg+xhyiVtyw
	aGa2V2qN+8aFYf5sB6zxwYOgoO/yZ0buu5EQ+TA3bq8voiw9Y83RftRgK3H5a2k4
	yi6qONr2yJTzPTh3ooJYu9ZFmzBsz37jurM/7EzI8XQinNTA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8tays-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 01 Sep 2026 11:25:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so1229343a91.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Sep 2026 04:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261958; x=1788866758; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r1OdVL+Tbt9zws2fnd3NhgTB2MVa0oBkflSXJea0/Iw=;
        b=g0k2QBkPK/pnw+TEF8fgn65NlZa7VZlil+A4iOQMaFub8fJTPhMggaLQiOfNouSSlo
         NC/odLRL3g9bHyEWoBUcdNC5RPfOIAO3RWVR5hOxSMa+2RDUs42k4iuF55rZkLxXr9ZY
         ZxAS5ZMGuvHJ7YfYlcL8petikUARtY3OlYbFqx3SW6ghAS/rAywHDk0iK6DU+6BbRip4
         raTUn/razjSALh9RHvGMbB872vA/FiJCFuCCnnd41xgvZockJkDJDxXAft6PW9AoOWy3
         vzDMzlh5KcO4I3gFV3y+6Vne4/dxtCZKHoQ0H2OFff4m/+JMu4UZu51g5dGlmOwHsIbR
         0MFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261958; x=1788866758;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=r1OdVL+Tbt9zws2fnd3NhgTB2MVa0oBkflSXJea0/Iw=;
        b=KctbASP9kH3SwqI/aPDwBreu3Nl4VrGzwWFBByzZSCsNyCohpWGeDGOXbOqFvmh4ca
         WdBZQjjPvtdKlGVHJqylGPFZTZP/3jasRA/6vlG4RDBKw6WbhWcrQY94EKGClz7WbvjZ
         zHvnjjBTittk3yKXHEub0lS+HgaBYe9bylTUaSvqO0KWZu/1jq1vgPNnlB15tzKYXjMK
         j7qGaM3n/qrBJsznWJ1/yqgDtc6k/+QS8wdeWjvfVwti0Uy2ycJZt/MX05E8QbEhUThv
         uWfKSqJIolDCzFBqhSgEqeWfMEBuiL+xqBfF6UgYCfNGxlSryGrkvdBrdtHcT6AZO7nQ
         /JmQ==
X-Forwarded-Encrypted: i=1; AKwUvBycqDD2JjRanLfk8MenPNYrpAsMAxzgQRpkwbqahGfn8FgWku7eBpezE5mKCMAql0pWHP1AKIjWnrg+3MPEf73O@vger.kernel.org
X-Gm-Message-State: AFuF++l4cBy4LRn+vfOXdkRiH2NbiNlkNkII/oOavSErrtN5eqSGimg7
	CdkINb2MWkEjQBEnePGpghB7ubh6eQIZl7OvE9TqTh5DjJZIA93tXqQhojSsSCOTG2qb+uYtbUi
	9RTI/iy9BG3w7hiJ4iRvTLpsvN68WVvAYYbX3+UnYdjvv4eXTjb9pZamI7dUXZH9XQvnXuL5F
X-Gm-Gg: AYBFou3XjlOVxB4qIkcTTac4grJalr50y0t+/m11x0u3n14SFVXH4rhK3ovPZxXyARl
	Scx2pvXjoU64G9hFDZYY2yBlTkEblzh+0tX7pYY3vZ17D7FEMuWG31AtbIumteCVmFlxuCvYiXh
	uF4sDkERxphvmIqsQZB+peARWcnRHYFsbfTQ/qOZUUW3Pit3xjz+n7WUVCE/vQ/vzotJ3G0Xpfe
	lH+iNg9nT7GmwMAijD+qXd9uUNCBabz7XbAb664Bq4Q07deg7Zd0qwiGq1RoMz4ZZuTUCyU5qUy
	sJ32nTyIZ1le4uzLII9DZpwurT9x9IXTqmfiPUBh5S1GVdz9LawnBgNdntOb2U+2J3f0Z6QR1LT
	DfJxP/IZSZw3lfx6mOxgXe/FZjVegfwVjPivnwg==
X-Received: by 2002:a17:90b:1f87:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-396d0a6589dmr51697373a91.0.1788261958023;
        Tue, 01 Sep 2026 04:25:58 -0700 (PDT)
X-Received: by 2002:a17:90b:1f87:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-396d0a6589dmr51697280a91.0.1788261957432;
        Tue, 01 Sep 2026 04:25:57 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1b38esm34685533c88.3.2026.09.01.04.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:25:57 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 16:55:50 +0530
Subject: [PATCH] remoteproc: qcom_q6v5: Fix qmp reference leak in
 qcom_q6v5_init()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-b4-q6v5_qmp_leak_fix_upstream-v1-1-5a2e99187c38@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD22lmoC/yXMQQqDMBBA0avIrBtIJIbaq5QSEjPWsdXGjIog3
 t20XT4+/B0YEyHDrdgh4UpMnzFDXQpoOjc+UVDIhlKWRtZSCa/FZNbKTkO0b3Qv29Jml8hzQjc
 Io1sVvA4arzXkR0yY++9/f/zNi++xmb9TOI4TPLV/0oEAAAA=
X-Change-ID: 20260901-b4-q6v5_qmp_leak_fix_upstream-64f1db4d4e89
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788261954; l=1691;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=jTp2GntyDIHxjPo3lsbT4RFexVL3HPEV5KbNlfne2PY=;
 b=4S1iYk8YbZvpfEE1J6BSuneKHU0FzRW3tXGbE/F7abh6ySZDcF54/Abe6+79qcW4vgL1MTcy6
 UUrwXi5YJGIBEE9rnd4jo2Q2VPhAq6HsD34Ela/4W5whye/1FJXt39g
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96b646 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nqt0n7EWu-dirWW6vCcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwMSBTYWx0ZWRfX5UGfm0EYYD2J
 p2nAgK4bYL1rkbMDlHRUN+vu6LS7q41jYST0tsDlyXN8IAZN/8RIe2kWu1B/z6y7hnlaVF4SQ4a
 EoqZy90z9EXmnGm6D8YA+JmdUwx5UZP8bmXliJvI5s7O9L0zDSG9Pc1LA/c+1hYstfvy3XRpwWL
 Ml889OMC7kZUr8eZFX18hN+9fxUVeS15H85NZrFVNF2HlTthwj2Oxx+lKYKPkElIGn8KsymZ3aw
 O4h2DpdGc12mMrzZkJHR+urpeBCuOPutc7nnIJhc4fYckdZ9htHdZTpDnqjN6aMNCgbHQpgqV1j
 Ws9wDQ4NcapO8BPDujyPQQnYv5lwE0h+/2XkZtJzTVMwszv4C88A6hG+uw6Kc1UI8UIpJ3rzz83
 dLrUYMYS9pUgXBXL/8lsF/3CoROMufg4vYpMjX342LrQ35gLJTiWDn40kLqSO2489JWm7y7xG3e
 Poun10Na2KVYcSSnpiQ==
X-Proofpoint-ORIG-GUID: JXKUVPL_RLjvCV_23J6vefTb6lxg5QhO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwMSBTYWx0ZWRfX1aSOK9FB9BSK
 MLtpCccQWIE8x+sm/XD0RdE9//dK1FDkytR6PnvT0KLjxVXAOy1vyNRzzwB3h8LwKyB7goVjjvV
 +yJp1NaZz/2zH63mEyMQdK/HQ8kgtos=
X-Proofpoint-GUID: JXKUVPL_RLjvCV_23J6vefTb6lxg5QhO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010101

qmp_get() acquires a device reference on the AOSS QMP mailbox
provider. If it succeeds and q6v5->load_state is already set, the
code falls through to devm_of_icc_get() without releasing that
reference -- if devm_of_icc_get() then fails, the function returns
without ever calling qmp_put(), leaking it.

The sibling error path just above (load_state being NULL) already
calls qmp_put() correctly before returning; mirror that here.
devm_of_icc_get() commonly fails with -EPROBE_DEFER during normal
boot, so this leak isn't limited to a hard failure -- it can
accumulate across deferred-probe retries.

Fixes: 8d9be5c6bdcd ("remoteproc: qcom: q6v5: Add interconnect path proxy vote")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index fe148b4b3775..71b79ab827e6 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -372,9 +372,11 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	}
 
 	q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
-	if (IS_ERR(q6v5->path))
+	if (IS_ERR(q6v5->path)) {
+		qmp_put(q6v5->qmp);
 		return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
 				     "failed to acquire interconnect path\n");
+	}
 
 	return 0;
 }

---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-b4-q6v5_qmp_leak_fix_upstream-64f1db4d4e89

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

