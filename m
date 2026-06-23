Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A391E374178
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209147; cv=none; b=vFSkNHkAD6QfHd9MurkhjBcCvJyHcIJStnf2P8w34I92CjnyqUHK06o/5xEH4rrvcngOKq9UTCt9Tu6zimfGxbAfe9hNR+IdPczqbbLzBaKRbyNn3FDFFBK6X10hCxpPYnxSW8cjAk5Feec6bE9fHsw2SB2t+HwSNs9UeNDuDV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209147; c=relaxed/simple;
	bh=LDEf1yOnCnDfS3qRRj2JXTv0cT4mYQsmy7cmAYMnlvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gQ0Cy6I/cuoSH+ZYfhXrV0+fFYh2tylRcJ0jak1K57bszlQ+oYpbmE4ew8OaMwicUiGYCJOUn/DoEhEG+karlB/8Oui7HVsRBkqnrri6PgtJkXhv2IdzUQr5fajr5XfZG7Lfe2vGUik0wJsSHOrbaOfHTyOYaTt1xdmxKLglEQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIc/eZuB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gu/H6D9O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EIc/eZuB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gu/H6D9O"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cYR43338347
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bc9Gq1dJvi12WTS3VXEXEna53dTCi3FoTXBLlw5ECQk=; b=EIc/eZuBoQ5off6L
	+3KENKfJgfxyncCdNG2ZQsxcLeFCT61zX8R+H0rGeUEYjNjKbv7m80ykC2UGR0IP
	vjZKvsTDSXaHJVHdr5//HOIm5HejKJPIiFDo2mQ8fFF3ah5gD7d/AeTuSdf/TVKo
	zBQFbeegNVmPREPcqXMCLk/C4y/nU9TlLfJjv68UFX2uvQm/fCvS9mpWOisvQgDy
	AN53AVXoxUqr/bKogMKFxc9HIVXU/AMeMBue4trMcJWH8UHY3Rh5d+VxNW6grAWw
	cEzGwb/EHrXoJy9Vl/PqiBmirPwOieRqdvuVhr1/QWr7IRFexfjSs9kMyTJekt1G
	3gpYKw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjhs3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:43 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1394c3ee7f2so1323729c88.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 03:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209143; x=1782813943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bc9Gq1dJvi12WTS3VXEXEna53dTCi3FoTXBLlw5ECQk=;
        b=gu/H6D9ONx+pf0ZrOFr34fXV9BETZH/NZHtlkD1d/fnuYErsCglaK0fW17T5OmyLz8
         5H0EpsAcKaTAS5oXgfSRvbBK30M/QaXot4zHs8nIdhs7ZKLp6C0+KXlqMfDr+8yAnx4T
         sn5pqSSuRioAy1AePTfNqkRTWegl9RmAdpQrVzpjMKX/kEjZlj0uhrPKYT5TCUiYQtr7
         jwvn5QP4DW6R+dwT2hM9QLqVVctnJcJJZYcNjrnGMhl32z7Uek4ouibFeWYHDE1FC3BT
         aUxzomR+0Q7PoVDYTEgaGTJnYT6wnHilHSMN77+JcgpkeWCeiYEf8RrZlVQFVKkfaLuF
         L8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209143; x=1782813943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bc9Gq1dJvi12WTS3VXEXEna53dTCi3FoTXBLlw5ECQk=;
        b=CKDWInQgOTQTTLT77am0vWp89DG6OfOB1iCTuBQohXKDDSmC/LaZgwi8fFWxIISYYa
         3CBqa8euBQug5rHFGaNqXedC30UmlgYP5r2ExiMuZLyMAg5KxBp+FN8RkZleF7HToxqn
         DqnTOmBtBFWzRVHqxxrRjCfY/mz/J/jzVPC/YLcTiTOX9I1ertR+5X0rurIL1b+WOt8y
         0un94DUEwX8oG0D8BUYDDc8+bCW3Lfkn165+Y3Ahm7iZ0/ItvZZt25fv5TlNeZCpOCz5
         E30luspoUqUq0xrfq8zug9XX1mzBYvetZbXeBxH4hKfB8gjLpnTR31GI53VEEzwqmNk5
         XxKA==
X-Forwarded-Encrypted: i=1; AFNElJ+4w8daeK81FybLwCaWmmnf+hSfKOY2/24cetsapP4xFTYX18Uweq/Iy6uDrCPoe0daf8Go3ntXfT6VuQDa0UEf@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZddk3w1okYdesVvFJ2DQ5yZeFc4DnAcGtPpopBWilYebOhzu
	hP0oDz9bRekcHaYynbeSuK7J+6csap1ufpE02TutKV/yV+A8sZqOio/j5o0KyF5U4rtX0bDPbpX
	LnJdUfTs2RkPpMOsvGHGbH1NY7SFUTmW8H9xm8F+/V84HdNh+mCyvaZvtuDn6vZW0+8HDY2H1
X-Gm-Gg: AfdE7cnH1JVmEyh/J+Upa4SpJW7kFhnFYA2FlVNJP2g31jyo4Fg53C68Qe2g1GILmv8
	dxVSOidHgBm8LNWJrb91E+cZFUwQ2/YlElNIVai04o9ERMGbO+Vfxpvt0fFjR9/+wqylhgcrwAB
	DnAxM8iarIPnOj44uLK5nZ5haPmnCm+8DXUe7r3F3DJUQSGYy0jBmO1AccCBB2J8Sj5Fto3xc6g
	tcl172IE79q2U+4vFHud2qadpAbgTMYNPJapk20LdiUqNv7BHnl4A0MPoNDY7RmXX6UmlSRjL4w
	1SzemkV7uKi4Oj8esWYQLjZ4MU8/W1zq/YG+T6RQ/jG0r237yf/ZrL31zwShDgMUvSLyAZCaRMi
	pRgZtl2Onql3Hl1SefzkpRCrYRl2XVw92kZpgKFRyL9oX0YaaCH2DjPHRmEeO6g==
X-Received: by 2002:a05:7022:68a7:b0:12d:de3e:cbfe with SMTP id a92af1059eb24-139c706ea53mr1092604c88.37.1782209142706;
        Tue, 23 Jun 2026 03:05:42 -0700 (PDT)
X-Received: by 2002:a05:7022:68a7:b0:12d:de3e:cbfe with SMTP id a92af1059eb24-139c706ea53mr1092577c88.37.1782209142231;
        Tue, 23 Jun 2026 03:05:42 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5824csm11607495c88.10.2026.06.23.03.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:05:41 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 03:05:22 -0700
Subject: [PATCH v7 6/6] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-knp-soccp-v7-6-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
In-Reply-To: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782209135; l=1799;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=LDEf1yOnCnDfS3qRRj2JXTv0cT4mYQsmy7cmAYMnlvs=;
 b=jBTzlXgMEO3PsYRFMkLFIM5mxg4TQqAHerJESxOUtX6wbodiMs+tDzr6BXBWY/awIxcwKxASn
 l85DSFQBVP5DqOgTuF6szzSF4lmuhF4QhkhHizfDYL88dBEas1w4V/f
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX/oDWKoMq4tYf
 5eyg8mRMGIAH88lOgTjNxTgfSP0ZYxYdL05F7JQ2N1AAMknOxuy9xFRxpP9snpxtWm430SjbWxJ
 JdZ+/QK+tlHfwE4r9f7LGkZLTWsDt55wDUH+kI2Ax6FkXSEFPDSsIsOrfjttpAFWkHES6oSjkMk
 l0fS21xQhFnkfc++mFOo1q6kG2mO03SoVnacJfA5lhgadli/nbUZDlIujuOo5qGHA9wIHJoJSDd
 THwdrg3a44KpDUohDxDul36n7+u8XOvCLPtzR/WcE+nCDnQY852AGanXbuf+z9TcS/aQhkcQEKq
 1DIu8fxF8gJjvoKafXvMMpP6cEA/y3CMV4EVoT6iERNnWJKE8trZzPjJWBiRv5TSb/KlobporZM
 KyRJWM7yhQXcSr1Utvoag5B9/voM4NFpaFgy1ULeBmXnoa5j18NlfDHW8pjxpTTmqkDyoeBWyms
 v158hsGc4jFgKDc7hkg==
X-Proofpoint-GUID: 1EWzlVirpi1e270nPdplGLvGkvneCzZ2
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a5a77 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-54vo4t_4OUFHp6kYXwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfXyKNLjTK9Crat
 kJE2/AfKVUxXaJtClCkdpBjyf9ciiaUmfQ5lzI0T0IRHTJI+AMmssVRA+2Wt5wD3fJBkz/PL9Ax
 55dnPhiCtf1C684CsLtXbgsM6erws8o=
X-Proofpoint-ORIG-GUID: 1EWzlVirpi1e270nPdplGLvGkvneCzZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230081

The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 8a0bb4b2e71c..60a4337d9e51 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1640,8 +1640,26 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct qcom_pas_data kaanapali_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.dtb_firmware_name = "soccp_dtb.mbn",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },

-- 
2.34.1

