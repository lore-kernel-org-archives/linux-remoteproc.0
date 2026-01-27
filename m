Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE812D7DED
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510352; cv=none; b=i2aSVp8q6x1N4KDHNV2mSx4wofKbOy+RsCrW4UcBQSumfZ4f+pznzeRnb8qnzP4wEJ745wEsHc90yjqwywxvSuHLEl7CUXUguXbwRjtMvJm5TuEewmF4C85R9LCfO1zT++i3Cf8Dd0pnJNUM62JGrY2Trh59Dj/8y2QUrT9/MyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510352; c=relaxed/simple;
	bh=wP5Up7h8FPoojvpffyb88fLtySJ2TK1DZ09vgxeZucU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tcPr9EwovSOm1qch4PuU4WCtIkZqPjsGbWTrJm4ZqKBsbPhK9+88GLuAAAKnQuDWV2XTiHkWVonIkC99CprjRv91QyWWy4E15dWKydNrT5Q7HFkb4PK2FpIaIatkRmFBs8SYFpZCB/aIpyqou0LKdsGAErwYyHeCFFgG/y2z79o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6UgH/qu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXtuIZ3j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6UgH/qu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXtuIZ3j"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RATCmV3715067
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 10:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8OqrkD7EH6hZmHf/8D2DYd
	YvEGdYfx2hSknKEAnhQ0U=; b=O6UgH/quca++KJUvEDlFxMxFLPo4CW750pE7SF
	GaVEJL3UpEIV3IhK1jibvuFXBjSDq/VUU0jX9svaaJZOvr1w3DEVf53zN3OOqQ+1
	mYGMdYfjsFKLzjsQe92ew7jC1Gpk1LK3QEogO+U2+GzeI7UyPgAizQhAiN7mZrV8
	SAdIxUpxcGUJEsxpiTpLMV0NjI5DFIlOCDJAS3Gzud1kIN3yMYKJ3zi26ZqT5IU+
	3algGO4b1EDpXPB0VNEi8w+1jbzRQdzGa/mnQMnYYyIdDedNHrZ9mRajtiTEYb+w
	z2tfli3lg/gI4aYujuGYFBjmW/Wezn0udnrsS4lpOyGmtLNg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0ankp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 10:39:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a863be8508so25432465ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Jan 2026 02:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769510349; x=1770115149; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8OqrkD7EH6hZmHf/8D2DYdYvEGdYfx2hSknKEAnhQ0U=;
        b=FXtuIZ3jq59rIxq70nIvn5lL65K0+ZlaRoOI2Qg4ExU+G+Eh5/+xaF8RxFsog5WNOL
         tq7AD7p1+XDM7nkMRcAXwKnwpRr49ER78dDxTBiM+4iEjHEm3hVRsBAG9jqM4RDRzGJ4
         kFPiCkjLd1PENJgCyld1AiqfoydtrFPR1ft9jSH116C4UoFk+aUk6i0GY1HzOggJbhuA
         jgx86ofkxi7r5O9sTDLEAzjzottFnCeVcI7P/QFbtpWDYtQrwgIiNRiQ3xKUanWSPoWU
         riDSLYyr/HpfuHcPwjGtmqfIuvxjKe+RFJWEbuYqGwuYDX3pB5ODxLB5arMguCRMSzPc
         ucnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510349; x=1770115149;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OqrkD7EH6hZmHf/8D2DYdYvEGdYfx2hSknKEAnhQ0U=;
        b=fa5XAuhwlC/cq2FBKHT0EWLRMr2q4Gc9DkP6T8OssHDTgYwr0ys+tn2ZxYyDGoyfcg
         fZh35jhT/idv5O9ft9dnyPoTS89YmIiCN9tjTG3yOF9gtb8XmfvmAsAG+5ilinjP3xxt
         CtRPE1S6b8EibkPFQEwh0rnBXzZMQNH/PaH0exCzZ7jH9VZlbb5j6JL6vg5uiHkpcm0m
         Bskl/o/53ZLWbFm+gHYwEd7aIN93TYnYjFjqdUgege0ysvomvGdp1N/b+9pwFKf61OWK
         cLLMOltnrd8wBrZcE7Y6eGe/aRXUP68xTbIVPhex5H6M/XJln/3rECpH0M8Fzy0doJaw
         GCVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7TOYOy2XEOzSL+WaMMkGNlQ4yVSHjSMNsxa8oue6H4fFQSybZcYwoWMmRRTEOcTo083CxLUsfJ84cdr7jXF5n@vger.kernel.org
X-Gm-Message-State: AOJu0YwlUgmi+2GQAbFgiAyNEv7tCGZ2A1i5hZjLSX3otqXnQXT8MrTY
	qS+Aq3504mON1Ak9q1Uco35y2Ug4yGe/zoCx7Zxl3CHZKRzn1n3KE8CF/4rHpxtvxj2sjonuD/O
	J2VgYXV4ojWgfuGdHsGwYvrEKHWvAY1R9cQ273FpmlvDT8HgKvWo+79iUA1ggIfmotTxyYYjh
X-Gm-Gg: AZuq6aK/7QwUcwu6E3rTvGxK2EYtlfhBe6GpjgO1fKPlNXcNy4KyC/QM1R+CZgVm2iM
	6zu77Hz/vYPdW6XMQHWXUPQ6RkT+6mHTCNPUNSsbRJvULntahSyDKtHQDPwLtH2u3KdbNfPwSQ6
	8AZtMZ6VzBsT8Aa2W+lirh5hlT/CYTtqStq5+V4bEMFfVFaIptnvVYcqvBDWfyRvXv64n/ahP1J
	3XAVsbfvbjZDVp8zLcrHLe3MTfojpKaX/P8qYBbf+Ui8JgCI3JH88MUHk88qRWQ2pJGe/XVTxG6
	mp20zeY4+LHT/b6HxeIYDocDjjC1kB24yOGc7YvXwaAAmXi44xjoyO1MYjX6mbSP1xwi0AnR6sb
	YudpGqMPFFbZ/qjsS3GXoSxkPpPx7LS2TrqzccSM=
X-Received: by 2002:a17:902:d4cf:b0:2a7:dd37:6e20 with SMTP id d9443c01a7336-2a870e34d04mr14317865ad.30.1769510349167;
        Tue, 27 Jan 2026 02:39:09 -0800 (PST)
X-Received: by 2002:a17:902:d4cf:b0:2a7:dd37:6e20 with SMTP id d9443c01a7336-2a870e34d04mr14317685ad.30.1769510348687;
        Tue, 27 Jan 2026 02:39:08 -0800 (PST)
Received: from hu-deesin-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa782sm113957055ad.5.2026.01.27.02.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 02:39:08 -0800 (PST)
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: [PATCH v3 0/2] soc: qcom: smp2p: Add support for remoteproc early
 attach
Date: Tue, 27 Jan 2026 16:08:44 +0530
Message-Id: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALSVeGkC/03MwQ6CMBAE0F8he7YNu4CAJ//DeGhhgUZLa1eNC
 eHfbTx5meQlM7OBcHIscCo2SPx24sKaUR0KGBazzqzcmA1UUoNIrRIfKb5JWdt10xFb29gScjs
 mntzn93S5Zk8pePVcEpu/fVlhQz31muqq7hEVqpE5mpsWt87LOYjox8vch+C9zgH7/gXc6a82o
 gAAAA==
X-Change-ID: 20251127-smp2pv2-bb88f617b5b0
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769510346; l=1329;
 i=deepak.singh@oss.qualcomm.com; s=20260127; h=from:subject:message-id;
 bh=wP5Up7h8FPoojvpffyb88fLtySJ2TK1DZ09vgxeZucU=;
 b=XIXR5ZcICW7U41zyirU1OG5IYBTYCBImJueybTx1vqNlLO4LUogtPzp2gWWn4x3qWfRYqOvLp
 ckunCM9cpHOCw51lWzQq4byRCVduVh5Lt8tcdD8MkbmaSgAEgBfGzxl
X-Developer-Key: i=deepak.singh@oss.qualcomm.com; a=ed25519;
 pk=fVTLtknRa0voM2B2QT8dD1HmvNdAnw5PY0XmwOE0ldU=
X-Proofpoint-GUID: 0Cl6WOYVFqXQiq9bwoYDuxyHcGVv3kZU
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=697895ce cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pU1neFI-2OEFmTL_48oA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 0Cl6WOYVFqXQiq9bwoYDuxyHcGVv3kZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NyBTYWx0ZWRfX3Ud2GJAOI5bB
 h1kWlcW6T1Fo35CKPZU3LdQF2UHgSFKF6PxCcQmG7H6QDxBxcnu+Y24VsgHlQEka8kPOobDVorw
 qiVx5xupXtuo2O9FDqBxSorIoqFsIgku6zDgn5M+myt24DoMEtqa+O+d93Zxui1NBwWNguW4ylo
 bBAacLGE7Fab4lROqiz9ZoLb/gtTEpWf0aqpTUFgj1Qm9RSXb5j+pnMPFX5McVvkcwfpwyTkJzK
 V1p7XON+S7PCk61ZE3yT5bLX0D8u1eRs6jupmFWN/Mfpi+H26mGgMcpv6QMJTIv/+EIxxwrvZpf
 8swlFHNR+ClvFtVoy4Q5tDZ4f8KByaY3bMh6r/wM/1XnQjN/hAcT6SO8MkFm9+Vi+gVdnGd7Vow
 HTDKSOG2mT4VNyQZlH2rhNEWyi39lXshD+13Aphk2Eh1GzV784OCxp1nncuDaUG94J73jp0rUFc
 9kbd36KM+Lmmvw2IXpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270087

Some remoteproc will boot during earlier boot stages, add callback
.irq_get_irqchip_state for remoteproc to check the states in smp2p
and mark the state "attached", also add smp2p v2 support.

Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
---
Changes in v3:
- Update commit message.
- Clean up macros for smp2p version.
- Update description for smp2p version 2.
- Update version negotiation to accomodate version 2.
- Address other minor comments from v2.
- Link to v2: https://lore.kernel.org/all/20251103152929.2434911-1-deepak.singh@oss.qualcomm.com

Changes in v2:
- Update condition to check version 2 in qcom_smp2p_start_in().
- Add more comment to describe above condition.
- Add description for version v1 and v2 of smp2p.
- Check validity of in_version.
- Link to v1: https://lore.kernel.org/all/20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com

---
Chris Lew (2):
      soc: qcom: smp2p: Add irqchip state support
      soc: qcom: smp2p: Add support for smp2p v2

 drivers/soc/qcom/smp2p.c | 103 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 99 insertions(+), 4 deletions(-)
---
base-commit: fcb70a56f4d81450114034b2c61f48ce7444a0e2
change-id: 20251127-smp2pv2-bb88f617b5b0

Best regards,
-- 
Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>

