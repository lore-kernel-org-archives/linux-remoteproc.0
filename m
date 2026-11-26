Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677366;
	b=vFZsED94oeBdyTTQjBw0vtI5wsTdw1QNVh0wHtcvCkJX1Wzc5QYFCZFdLlELkzpLNzXH
	 dEs4pIqV/Jb6etIQQg0+VgsX5tV4WBC/NsvPA0gab3k0lWTToR4qtS79IKbswBIaMQk4T
	 69/g7TlDCH7pfnXA/dOu4HsBWfPKS1opCDM7IGGTWItqeadxDruA4r7yMEIgY3zYU2yRA
	 CBfprriIEUJVxOKVDEwcjLXKLmAdaFUoGzmNeyhU7D6wtCTdkHo8H7J5ShnRkkf4qZF5p
	 Lv29OlRYC7L7mNrUJt1Tqz9+fFA88jWr3DsJydGpwzbnxtnMIJqcYaEP375FS9QlQnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m/bQgmd/vUejP6sBgcLNcqArO+xp1RGwNeN439T0HTs=;
	b=Px/AgEgWUaZB9jitcFprgkLvbcgdaFQJwAn9M7snKzwSj4+5e4qD8EDzAMdkT1iSw/tq
	 GBcguEZmZEnljyUTQ0XMNSXGDH7aXl3GqxFI5OR5pS4sKcALG2Nz0p3WLqnfFr/ZWZtk6
	 My+y7THiyjY373PdR8qGi7xrr17QGy1IAY/aQ+DnLkBxXUjLmL9tcugPzfACP/JuCt9Oc
	 vzP4O/H+8l1Wm23+qKixXqppMpQZPdRFW0v7bl9I2R2EZk6gAY+QljAkjA7df6LnocZ0L
	 Ot5Z/e2/sFEMz8KJv342ORUijRP+Vr9OxwwBrTYa2nKgjQ8v0Jnsex1g3MWAXt5tS9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C0OAzXWR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jgC4jWQj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38262606A31E
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 07:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38262606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C0OAzXWR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jgC4jWQj
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7ArXD2885419
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 07:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/bQgmd/vUejP6sBgcLNcqArO+xp1RGwNeN439T0HTs=; b=C0OAzXWRnDod0gow
	VRitZOiIHJU/ESyS65l1lV55fu+1B/K7v5I4d7WNEkCNf5fL42a2Zwrm2CrpiOzj
	b+9BoyFQ3JFxduUqsBNpLcxHkDSEb1p+lNM2IbGArcEi/9kSmnuKZqj6mJTuhkKB
	gEV1FNkuAc2vLNVIRBhO5gpfpFH94l0B9X8gltXyyK79pBu4jD+2PKWeoSJbq/pV
	JziPTQJR/Ww4f1KkFGNn450j7nNtlfysBuBDNoFyhW5+Vra21duIlkTE8ESAsy99
	Ss66sYm0t5A//f1SL/vatLgxpOAzY1pUoYS1FbdNbUcu+eaDVGmv2isn0VNjx0kh
	s6dDKw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rg7su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 07:16:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so5440367b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2026 23:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795677365; x=1796282165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/bQgmd/vUejP6sBgcLNcqArO+xp1RGwNeN439T0HTs=;
        b=jgC4jWQji26ojfqkHiuStwL5Bk/mpYpS/MCreCXVFcQGbVCy/l4SFuqUO6qMzz97fp
         d/QOZiQmjIc1npLVCVzITYHaXT3ZgxVNGjZ6v0wQypTRJiiit+5FsG1Wxfq+tKR8aq+4
         tjh6YHI7Q252IxKbiVn8Tv+RG9eQgA8/exuf6CGQqgRzc9aH5n+F5r0GJwqc7Ptd19vN
         srAP/NBLR/oq+Taou1iuPCeXnQobA9TH2WBdxhnO6gAQiNqo6GD5E2UoCE8fKyVTEiAJ
         9UE+Q9LtgkaSDEKzXUcettNQUh39mvhN0+gKv/Aiedtawt8doGjku/sYpXvos7z1sPFt
         lUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677365; x=1796282165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/bQgmd/vUejP6sBgcLNcqArO+xp1RGwNeN439T0HTs=;
        b=KGjHhEikLqnQ6IS065CmrLUg4Eq/oecKETDqaKi/6CqP+dnrNbCk6qv3DIxXExH0BH
         yZFGiYt75EMSJ01OtsT1HjPDBOZZku/3hgS8jjrMXBI/qYqZ33tKF1yH9XvvzDSZha0+
         y4aez9vsAX+AO50oEgNulnzrxAqKj03ov79woKQI22WfNwbLCo6um9LdehNPeQzcE4ug
         OXUabMSw+25yMWWTEuiVju5Ya+dAQUNkz241CTQ0eDiWVijw2LcAaGVH+J/Ia8OWuu/n
         J1EiyTcVjs0FWCCiPaSQLFD+JffmvlvwnZi05q2tDHdNUopiSjQtStcoXRwxs+zwa0ST
         v+dA==
X-Forwarded-Encrypted: i=1; AL+hErEVTHvJJ/ECz/txuXywLjHOQg89EWB/lmGMpuBS5j1j4epGTGcL2PpXBLY1ZxAnELwWzxHlYpSdyu4AdBBEkpWx@vger.kernel.org
X-Gm-Message-State: APuU4Z/DaXfA8BFAJEQmceC3JRNBhfETRqqqJ2cFZ3HY/8cxZ+tDVyrd
	6pmdNTTFjbFeuFiEAXUwzJMaH/VB3ILsgEzzdszPD7VfJGiqpczvTRDn+W1ojWH88+OWSJ6UcwM
	mwL9pTheOj9qvtJ4LCy7OePzIOpxysAdiy1WFYvqTI/Jmy8DrInlBicJgGyosvGpCUzF9ScLM
X-Gm-Gg: AZFdTZedIBKZG+Xl6NWGTTWcgWT1vVDWtn/c3wpNQoTVA7fi4arBrcJxdoGDs4EV1V1
	QEgul/Z/zLrHe7FxjtJf1ey51QZ09xLH/KmxgTTNU2YRgsX43ib9dgqbuPlSAQjmELfTvhWDUe1
	qMY+XHipnL03v4/z92zexRqnhI28yKoFeO03XirKgW4Wl+jPyravnS4u8ZnPw5BB9rTEreYZIrg
	YJgI/9pkoZeOpC6KL/VU460OLeq5stGHiHM4p5kE41DFIc6qIdJ25OZAY60BbpQN+0UEJBi3F9+
	XPkAHodSNtLW2/L6eP+W5IVegecyG3qoOljPdvVwelWRPXl8uvB6qsH+q19kG4ymrdJTnCCeI/2
	UkgXsiZbK/P1X068/bbT0oWy0o/IrMuuvzpYKXeYWL3ScxezaXPCM8nS/kNswY2eSuyGivQE9+L
	hBs4hp0SWCzCRUcqAtde+IS5FWLtp/KRnmawjgbybUp3wvZAF/WHWEmlFzNssw
X-Received: by 2002:a05:6a00:14cc:b0:89f:9ea6:1ddb with SMTP id d2e1a72fcca58-8c87c09e5c9mr17652895b3a.23.1795677365012;
        Wed, 25 Nov 2026 23:16:05 -0800 (PST)
X-Received: by 2002:a05:6a00:14cc:b0:89f:9ea6:1ddb with SMTP id d2e1a72fcca58-8c87c09e5c9mr17652873b3a.23.1795677364557;
        Wed, 25 Nov 2026 23:16:04 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm10050690b3a.26.2026.11.25.23.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:16:04 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:43:57 +0530
Subject: [PATCH v4 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-oob-support-glymur-v4-4-ad4ec5dd4b0a@oss.qualcomm.com>
References: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
In-Reply-To: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795677341; l=2115;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=l2ZRGdD/hkxUWu9DS2Den2yezAc1vs2xMObet20VF6Q=;
 b=2yP8ClsGLqAuDX096d0TXlew5Ny/bhOObqHCSoBjBK3tfVMzSLR9bNgM2Fy536jirSGnlxDwL
 rE0Si5ShcSKB2DCU35xgtMJ+AHyHeIvY14NMChAoMAf6AiUV+273AvV
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX/SMoFXDbrsgj
 4cDcHmE6PU7euQJv+fPCy9VAsLuLcsuq+kjTRS79z/qj0o107I6wuj0bjxu/Yjn0BWOBX2hzO6T
 SE1d5KOozSkWFl+05K0fiyodC/viWhIpD5u3715zuXsVXYG/vLozpiXrQS+58qT/LA/o/Y3gODd
 +veOWh2NgIEHzaVrMEAzXTFozxLF58w9MPLAde29kk95vVBv6mNQCNOpRXYZ4aGgmIjo2zg3yXd
 snIaVsoU8cu/lSjxPdbn0djLvNwAo07hLoHlc13V1+0abB2x9+ovDsOokwtqJcC3zzhLxWVoUTp
 HrunNKgofqG20lDF3mPunW5d3DLWk4aZbixL9ai0WJj1glt3dCuOKx6k5g2gxMeBjqRUXC+qIfC
 XFNjWLGz8WwD/UTDmbT651jT4/2EjngiW74HkPyiDiLNPgfdfXnGrId6e7WANshC7gX/GXH344N
 FuTj7N2BJmqtgOvDt5w==
X-Proofpoint-GUID: LvKFUi4MmIkHsLkkepL4tscyxoukNNHV
X-Proofpoint-ORIG-GUID: LvKFUi4MmIkHsLkkepL4tscyxoukNNHV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfXyIQKgm65irBt
 MFdIYLweIcenyhCXrgM1SDz9F57ebeMHo7ug+XWnw1Dvp2dxx8cpX90iSM1sEUrbjuZw267JOYq
 TyOelRWsIRnZqCZILzJdf1bs6Pb93eA=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b07dcb5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PB0afdDVj_GKkQGSUhQA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260027

The OOBMSS consists of separate OOB-TEE and OOB-NS Zephyr subsystems,
each with its own firmware, DTB, and dedicated PAS ID. Add support for
the OOBMSS PAS loader on Glymur platforms.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 1e55b00357c8..a0807615b0e7 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -2194,6 +2194,30 @@ static const struct qcom_pas_data kaanapali_soccp_resource = {
 	.early_boot = true,
 };
 
+static const struct qcom_pas_data glymur_oobmss_resource = {
+	.crash_reason_smem = 669,
+	.firmware_name = "oobmss_tee.mbn",
+	.dtb_firmware_name = "oobmss_qc_dtb.mbn",
+	.secondary_firmware_name = "oobmss_ns.mbn",
+	.secondary_dtb_firmware_name = "oobmss_oem_dtb.mbn",
+	.pas_id = 0x42,
+	.dtb_pas_id = 0x43,
+	.secondary_pas_id = 0x44,
+	.secondary_dtb_pas_id = 0x45,
+	.proxy_pd_names = (char *[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "oobmss",
+	.sysmon_name = "oobmss",
+	.ssctl_id = 0x21,
+	.auto_boot = true,
+	.early_boot = true,
+	.needs_tzmem = true,
+	.decrypt_shutdown = true,
+};
+
 static const struct qcom_pas_data glymur_soccp_resource = {
 	.crash_reason_smem = 656,
 	.firmware_name = "soccp.mbn",
@@ -2267,6 +2291,7 @@ static const struct qcom_pas_data eliza_cdsp_resource = {
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
+	{ .compatible = "qcom,glymur-oobmss-pas", .data = &glymur_oobmss_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },

-- 
2.34.1

