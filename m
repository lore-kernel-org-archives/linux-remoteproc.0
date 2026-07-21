Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7CE408630
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 06:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615391; cv=none; b=jbbDFHIzpuFnvKrlYhLR9ofCakyVSPNou+UBq98Fh+F8igpcwb3tSPQpgLQK+JPbWImEpAzbvmSeKt3RKChNkEm8xQojY4kzpo2eAmkkmoflCnugksK+faDxU3hQIKP1KHlnRp/N3DcSbibgm2cuInMAXqKWYV8tiHHHIMZWPnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615391; c=relaxed/simple;
	bh=GONTJSYcNvJs7QEMLgaR+oUX4qDBOmqUBB2BocJpUds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XPh4UBzidzaehHYAyNhvrTnZDpG9Ed+1/8BcSILtUIxYIBm9h/l7NCsYHivNiVg7AZ75GxZMI/9sAhFSzVIw9yndlooeX5oZvypMMkuJGcAXNUjBeSO/ymmvBl4AESXx8yNhGM5O9Hv4Ujw7+X+IYz1W4uU3LgbnDpBpLdt7oYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxGbqdaZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iAC43HDy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxGbqdaZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iAC43HDy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6QD4I3884180
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 06:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2cDFJuefHfzoEFQ+pZuZu+bCX06c3eux2xACecFGf1A=; b=GxGbqdaZ/olVd+em
	7zZlkM/L3gam7eL4iXvXk5ztYsycsw+NCwPM8Ta3BQgsqKLsO7hWJpCkMNV8ld7i
	7ApX3NBSnkOilXfYSfUc4wJziHRwKo3b1434j94LC3Ly/eaGt52WQyI/FH/yYrbY
	Gcb0LmyIpvQ5GYg+hWULDT7OGIcdyidvVCJdCGgf4XFogrUULi4NZneMH2Q0Vo+z
	/pVSBmXC+JesHFa88OCLoVLOQL8dMrvzOvjtTO0pbwhPqOEgg3AbVZEOWAJim2nT
	GTIeS52CHBvtHxhYKbFh7arGK+cQGcQFvA69qSA3PoNBif7Z3M9vx/RJwZ5Xa5N5
	5M+v9w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcardj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 06:29:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so39161365ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 23:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784615388; x=1785220188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2cDFJuefHfzoEFQ+pZuZu+bCX06c3eux2xACecFGf1A=;
        b=iAC43HDyVE0+7Xfmy87VJGKYVNP8fAIY5HUIelRYT29ZeNfSlGM+4ez9JYgv1bz+Qn
         9AlbGrjvyC1fW2O7o9izv68XIEQgqXV7GZ0qIUhhLdT9ON7W7gjeixLFjKafZgdJgVqb
         TUA17lhrKZ1COydSYXxOm6xz41ezAI0zhZk6uiUMryjW+OuBCo4Tkg+GT4U33VjyKcDk
         YhVrlNJft69kjCtuVsVmxDvWknX/LTMONUAYk4nZEcK5CC4OXG6b2abZnmyiHP3bu3fU
         aSyI4HDRhpAXpEAl6MRDeutzvIFFcJdIJJclPdRndBoSW9GRooCDT7ZwAXyi2m0dY4dO
         LJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615388; x=1785220188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2cDFJuefHfzoEFQ+pZuZu+bCX06c3eux2xACecFGf1A=;
        b=L/dWX0tu71vaCxEojCO2qfiKLidE17FNPNGNGcdkbGRmS7X3BLE5BCiJr8zCR+Nuow
         92MdmEumqpd3jEv1yuL6B/0G9x4QDnW1UZcOXWH+ZLZViX9UuauOkHUYbqvof1ak0W2k
         oDHmaXelrFA/Xn6qknN9agIYgyHroanMbLoMXxa9Wwqi0sG1mp/j23hGJFBkyIVRK0D7
         ySNRvKBdL0mpI0TSN4bXmw6LtIs/SylUkdqroiNVlnQP2J1L3HJKpakMh1ejIXPcNy5x
         9QftWoGxHORpLxiu03T9L6RNzcbn5daRID0UoiUBmtywe/0DYvXZJGeFi/LcHHlSn4Zq
         dr1w==
X-Forwarded-Encrypted: i=1; AHgh+RrHCIAac7ybF9WypfFHwpkC+jOahfVt6IfCFRxs/Zz7x++wIiNO5jSiEL5BMIAYZzNaakUHW6vUhtoo2WvPp3mV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+0rkMXkRCb3H7ZLbHF4iXvjsBIf8ImsPKteYPSZ7xVs2ODdDP
	oXGnUYxR0iBVMnXm2g+F8C9SYkq1GGjDFaDPN/7YiCuvLiQbGvHgrMR3kU26qKslE1nwxW2TC3Y
	0fQP/oJ/TJOtgkBdFPJIVGwd4sXre4wbv76CYRTrI6vtHLxoGz2PnQN7ZVCFiPyFbV+n1xki9
X-Gm-Gg: AR+sD13oEJ8DIcjkBVkbhdCUetUg0CRnBUlZ9C/a0kdwXRQmezVParxi2soo6f/W5Qz
	Ta0APbQ/2xgAct9R55mqO0EmesK7NMACaf0HrzTUetEgI8XBSKIkna71yY+DVHyjRGyjqeDpvfe
	MHD6IdZqnrsuBJukw0iuvOkrSsDpNGE2AhAj7y0xN9yKe0lJMORXMFVFCVB/D7BUziUMImxuWw+
	60sFFZ0jk2Q2j6fb79Uxm5wTE4WkHLSV0MJUVVY/3DOU8MTeChRn8SR/nPNZJTeQ8R1t8vCFPDI
	N61ngV4Q6U8rsZYHa8zO9dWvwh/+AUnYcaSzvURpw0ae9J3ftvpABCBw6VM5YR8qmBfPQ7O5tu2
	VfaRPIPaVr9ZclWXhnpaW3SPpfm/Kiw==
X-Received: by 2002:a17:902:dace:b0:2ca:c847:8e41 with SMTP id d9443c01a7336-2cf349776aemr186656785ad.11.1784615387491;
        Mon, 20 Jul 2026 23:29:47 -0700 (PDT)
X-Received: by 2002:a17:902:dace:b0:2ca:c847:8e41 with SMTP id d9443c01a7336-2cf349776aemr186656425ad.11.1784615387041;
        Mon, 20 Jul 2026 23:29:47 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347a1201sm69376505ad.81.2026.07.20.23.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:29:46 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:59:01 +0530
Subject: [PATCH v5 4/9] remoteproc: qcom_q6v5_pas: enable QMI TMD cooling
 support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-b4-qmi-tmd-v5-4-99620e07f505@oss.qualcomm.com>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
In-Reply-To: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784615351; l=3908;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=GONTJSYcNvJs7QEMLgaR+oUX4qDBOmqUBB2BocJpUds=;
 b=BwrCwaSCqBPUWGlnTL2wsEEb+Jau6H/89XXTF3ADd5CjoiwlARMFX7VspHoYS97DU8RHHTXSR
 dqTcROa0xcgBm6MNvhG5KHElrRJHgOTVv1vnuU2fICDU1zNKzKcB4n5
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX7ble8146bxiZ
 QqM7wBkyIH/o1xCJfbkevQvaZhSSvlJWYX33c+gzyNC+/me4oVh7qCMenfNzd43tbAYYClpOo8M
 KcH3km6AA+7lUM3s61SPSwn/ZT6Eu6E=
X-Proofpoint-GUID: I-6yk1UvjppULDSxNxk7MJy0QEH6O9zn
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f11dc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=j6jQExit_mXiN_RbaP8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: I-6yk1UvjppULDSxNxk7MJy0QEH6O9zn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX8VuBXR935ktT
 Aa2yDmp9Oy1r/EtGC6reyiKV3H6mBfeN8bn8RULYMe26Z7Xf7it90lk6QLqEGiykfAQaCeh+ouS
 XUxu5geExtg5SlT7aEDdaMX5HimtLDkDOYXH8DzeWzssC1KPa9hw8yIEoEkVdFMa5sGTjA6+L+G
 ksAOYzw6wUJSHMkuCAn8j/6XAjYO+isCrrDnzoicwyA5S90LB3jVNtkWqq3+ZeX86bti2zm9JmS
 EVU18wUzG236byM9Ar8w3DRebfw9TyFidLFCPCREZuH7owrdF/wDLKRDaHTTbboLdtC7s0T0cqU
 I3flzZqcwlTuWTL09OiNVKRn0q4asvhHxwS33azoDscG/4tJcKwAex9iQdiIwuvrbUQcnK0q7vZ
 MfIZ0ZHx2c5cpLpFzW0dnyBab+HLNxMvPdL3HiA3Vv5RPZlBg7xe1WNg7vNCIEIhS8Yy1hZ3bCx
 lgkqojtjhGEoRpd4Zzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210065

Enable Thermal Mitigation Device (TMD) support for PAS-managed CDSP and
modem remote processors on platforms that expose the QMI TMD service.

This adds per-platform TMD configuration in qcom_q6v5_pas for:
- Hamoa (X1E80100) CDSP
- Kodiak CDSP and modem
- Lemans (SA8775P) CDSP
- Talos CDSP
- Monaco CDSP

For each remoteproc, the configured TMD QMI instance ID is used to bind to
the TMD service running on that subsystem (e.g. CDSP: 0x43, modem: 0x0).
The driver then uses the corresponding TMD endpoint names ("cdsp_sw",
"pa", "modem") for cooling-device registration.

QMI TMD identifies mitigation endpoints by name, while DT thermal bindings
reference cooling devices by id. This change provides the mapping
between DT cooling indices and QMI TMD names, allowing remoteproc nodes
with #cooling-cells to act as cooling devices in the thermal framework.

With this in place, thermal policies can request mitigation from CDSP and
modem subsystems via QMI under thermal pressure.

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index dc5be2c030cf..b7fb4326ada8 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1061,6 +1061,15 @@ static void qcom_pas_remove(struct platform_device *pdev)
 	device_init_wakeup(pas->dev, false);
 }
 
+static const struct tmd_name cdsp_tmd_name[] = {
+	{ .name = "cdsp_sw", .id = QCOM_TMD_CDSP_SW },
+};
+
+static const struct tmd_name modem_tmd_name[] = {
+	{ .name = "pa", .id = QCOM_TMD_PA },
+	{ .name = "modem", .id = QCOM_TMD_MODEM },
+};
+
 static const struct qcom_pas_data adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -1218,6 +1227,9 @@ static const struct qcom_pas_data sa8775p_cdsp0_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sa8775p_cdsp1_resource = {
@@ -1236,6 +1248,9 @@ static const struct qcom_pas_data sa8775p_cdsp1_resource = {
 	.ssr_name = "cdsp1",
 	.sysmon_name = "cdsp1",
 	.ssctl_id = 0x20,
+	.tmd_instance_id = 0x44,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sdm845_cdsp_resource_init = {
@@ -1263,6 +1278,9 @@ static const struct qcom_pas_data sm6350_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8150_cdsp_resource = {
@@ -1278,6 +1296,9 @@ static const struct qcom_pas_data sm8150_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8250_cdsp_resource = {
@@ -1362,6 +1383,9 @@ static const struct qcom_pas_data x1e80100_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8350_cdsp_resource = {
@@ -1430,6 +1454,9 @@ static const struct qcom_pas_data mpss_resource_init = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.tmd_instance_id = 0x0,
+	.tmd_name = modem_tmd_name,
+	.num_tmd = ARRAY_SIZE(modem_tmd_name),
 };
 
 static const struct qcom_pas_data sc8180x_mpss_resource = {

-- 
2.34.1

