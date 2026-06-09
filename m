Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036623F076D
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 10:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000613; cv=none; b=GtIMHYnM793hTm66qBwiDZDPcchHsfowaqFf0T6fCz6qOZsEJ9fHFOPY61JoTAcZEMfFfA5281Zjf+dYM8PrpNzb1BpqFtqQOADF1Xx/NwghK92MqAqJ0f+Tr6FRf5PaTkzBa28g9Njyz/id1l0sPSuvGbXyVW7lS9W0sfh9BWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000613; c=relaxed/simple;
	bh=BvxkuRTTc6RczDjBRdbesg57KP2U9uES1GTmsj/95pw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJ0fv/RAEp4ySbv8k+mqTuPFUbtKGgA7kxqzRvHeSvrBm/ghoIX1Bdhj3QCh1EL5B9Y4BUNM0cUH0HyPc7KHLXvFhA05QQWBFZif9vPnPyJ3Agoi7eVPlwx3DCggilKKZp3bwDWO0A7rWhYMle/meAjHmDIKhOWnK7sQ7um2fs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPWiBrBF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O6kJfgRX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPWiBrBF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O6kJfgRX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vDdp1800490
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Jun 2026 10:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CBp4YmVCo2tb2Dr4iSGajxExEgZ8osIa+4o52mx3Le0=; b=BPWiBrBFvdZFMzqd
	M/VOxLgQdF8PrCjGF1Ze0JNiqNrUrXbJNc0JuA4f6kme1EV1kVsxX1flis6JtOMN
	9ysY4ztqq00nV5hhpBwfOpIo8+JTOS9Uug5KDD/f7iHfPNIk6bwHbmLhMEGh2q0/
	PSkTkcja0NaugZ9KByw92J+MhULXVW8/WElVOkwakAjsx1SgnEzLNF36YV0RXn89
	It1NLK8L0dgK/+AihUKV+8hMQm1N0otd1OuSTO2HiutD2MztsFLAHgZ6qFFII6rO
	UfKW2mCweQzleyF4kjlzuzHKqlLw4pB7J4xLQhISIkAtqvoHOeFQi09IDNLbS0HA
	12EhoQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr8n4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 10:23:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c3315d31so58956175ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 03:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000608; x=1781605408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBp4YmVCo2tb2Dr4iSGajxExEgZ8osIa+4o52mx3Le0=;
        b=O6kJfgRX2WfYLqOViFyBJO5ps9jbx2i7lxDoNrM4RzhoG44utgDq729E3Dqg2NecWT
         iOW2/N4opyU1viyosBorLfcbNpt/1bHmGFqcUSxT0l3iDIYIqQimugXmoywazveSuOFA
         xHrBJR3cB59PI33/Fs7tkMj8MSKkFrYEjbsJc/+nWO84ZW2TVm7PJlO1sfG1lE8OfnXA
         t72Ieli1Pviqj0O1qWNZnev8PlEE86wpPhRVR45RkfWYw1lfvWr8xRQ+caNg0xAapmO4
         VcMOukaw6qDtUGFvzvgipq6/xXKen240AriwyDk/RhBk3LNoS7b3FT4QGv9ocNQyR2uN
         8pUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000608; x=1781605408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CBp4YmVCo2tb2Dr4iSGajxExEgZ8osIa+4o52mx3Le0=;
        b=K3vxG2l3tA2XO6r5Sh3Y4B2KjFRQZFZ8Esy2lXzw/JohXt3WF6QWrgvDnyUvrn5Jsa
         dZGtDAOHuVFfNQbRGV3NTtLDIMbs4rS/2hjAVqocAyDedoSXYJ41IVDQxw7nh23LnQLj
         TK9RRPrxKSMdkWygD715fsDBpmxfPQxqbQttGcFBLCnVud1Te1hZx4eSFjuxPo1ZTRnv
         Jt8wmYbEvpnZ+uQJBnukUOW1MGB0rjI5hQfHqhSHG83AmIjNZEg32EZ+eGkh6geHUnvt
         uLUk4hX4bn5JPaI/BB16jC7v+WVUC6zIs0IKILENiEPgRsqcW1L5GV6g3yEds+otRbFJ
         A3hg==
X-Forwarded-Encrypted: i=1; AFNElJ8k88cW3bO0s5wCJSqOLCDgTD7pVXn/Vz6hUEJvYEJedd3MZtFRzXiEBtsHX23YCBrkzLHiEai1gdK7QtuYOiOw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6aEo/bUwLJExF1jktbtghqwiGtUPUlNVmmK2dCJ9NPPL1Pfu1
	4nhZamz38vTDkRqbYCLu4Y1tUtfCPjKWcu2zLtVwbT5xc6qHQqq/osetp/+M9G1M7iKmMgVINcY
	LyAgDvMjIHNKeDpJTFLjCuIO68/0ecT5Soq7Xd8FCt/YpxglNSwXvHjm83h6qUziP6hczvZT7
X-Gm-Gg: Acq92OEGSfhEId4ogbM48LQTj/0rxkkpAsD8CajDmj55EdIYoGiZD4Gf6hZl46MI798
	T3cvOrsCUw3GgPvzmR8UBwNpoO6z6JtNlsQKczBxYQd3DZRVKVPBnQMN6T++LuYDYQ+vYlIJ8tU
	APcDkW/s/koUfsiI6kEOE99nKLKap1v0R6eB+soa8kWEv0IxtwUckblKsb2pBsyiYVwCs/irvo1
	uVNhixrpoXY1TtLWxz+BvlInJpYroJJmw5Iin9BEYLKuHbLuX+a9gX+i1bCqDJUvyvqooxjF5P8
	XjtLWb2bewmNYiCsm4Ufe2Aq36sHh7CXX36DaxlMGYPgEOBbYkvZUySrzTH/04lNHC0Pm+3jrnY
	SOSvv6JuHD5xhyA4WKmEtKu6psIYzKKxS75JDYN3qkU5+Ljsdj0vUxj75ujKJMQ==
X-Received: by 2002:a17:902:f745:b0:2c2:2a8a:af69 with SMTP id d9443c01a7336-2c22a8ab1a9mr170322285ad.9.1781000608109;
        Tue, 09 Jun 2026 03:23:28 -0700 (PDT)
X-Received: by 2002:a17:902:f745:b0:2c2:2a8a:af69 with SMTP id d9443c01a7336-2c22a8ab1a9mr170321755ad.9.1781000607575;
        Tue, 09 Jun 2026 03:23:27 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm14738915ad.61.2026.06.09.03.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:27 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 15:52:57 +0530
Subject: [PATCH v3 2/8] soc: qcom: Add support for QMI TMD cooling devices
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qmi-tmd-v3-2-291a2ff4c634@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
In-Reply-To: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781000588; l=20731;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=LfLWpK6/5X04uNpHzv0+wA4kNUoD/RsII6vsCeiT7gA=;
 b=bWTaM49xEAb7+3xnTjmu30tAPAMX4m+oZQhK4J44CiSEFRkAphFWDOb5qDb4SUuwJG80ZUFzJ
 9q4FRid1kVTB+aj4l+62r7BtzCgkSC5Enz5V4Joo+FV8MsUEgkedJVM
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: p1n3jaQPVz2vx4w0SAFlierY5UslacLZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX1MrbZRv71NC4
 u8JOotlfGiYYR6bYE/9wvuuCNeNYj2xOMmKH3dGQiPgZxaynIr6mMcfOguU8VoaJ2ttnVIB/Fr0
 LNzIRIBvC1FKv+WbaXTMNDH6bUtehWymbcGTNmwOSn2I5r+l6ULvwmVZxcxxLMdy5kSoe+ZYIUj
 G0j0xQg/bC7zO4l0gNe2RrfU0McJ01JdtWFhTOfMSPVGY/zbugWjCSuDcUGijE7OcIBE2lrH27H
 uZXm3dZNdKTIZREedW1AvclE/6FSLMvrvRkVAXyIyxEjKviyQl8cRSYRT2zS9F4Lq3+ZKr+mkq+
 sB9/N+o+0WT2jEUBw/var4wOGwnYsGTcQDeWAyh1n/N8tbOZ45SZjRv2r9o/MlpHB7ey7NsXSKt
 ubjgeQ2q4S6qUMgYUeK0cS7+0F4zz/cFhWne5s9K9IzKBc8ICqBHq6hoMmkbbSdr+1+lf3q/kQ9
 qWG82SLVdyH0XEWkhkA==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27e9a1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=gbibrS9mvRCYIXANk9gA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: p1n3jaQPVz2vx4w0SAFlierY5UslacLZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097

From: Casey Connolly <casey.connolly@linaro.org>

Add a Qualcomm QMI Thermal Mitigation Device (TMD) to support thermal
cooling devices backed by remote subsystems.

On several Qualcomm platforms, remote processors (for example modem and
CDSP) expose thermal mitigation controls through the TMD QMI service.
Client drivers need a way to discover that service, map DT thermal
mitigation endpoints to cooling devices, and forward cooling state
updates to the remote subsystem.

Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 MAINTAINERS                      |   6 +
 drivers/soc/qcom/Kconfig         |  10 +
 drivers/soc/qcom/Makefile        |   1 +
 drivers/soc/qcom/qmi_tmd.c       | 604 +++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/qmi.h     |   1 +
 include/linux/soc/qcom/qmi_tmd.h |  23 ++
 6 files changed, 645 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 57656ec0e9d5..3d60702a655a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22286,6 +22286,12 @@ F:	Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
 F:	Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
 F:	drivers/net/ethernet/qualcomm/ppe/
 
+QUALCOMM QMI (REMOTEPROC THERMAL MITIGATION) TMD
+M:	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	linux-pm@vger.kernel.org
+F:	drivers/soc/qcom/qmi_tmd.c
+
 QUALCOMM QSEECOM DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
 L:	linux-arm-msm@vger.kernel.org
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2caadbbcf830..a292ce57fd4a 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -128,6 +128,16 @@ config QCOM_QMI_HELPERS
 	tristate
 	depends on NET
 
+config QCOM_QMI_TMD
+	bool "Qualcomm QMI TMD library" if COMPILE_TEST
+	depends on ARCH_QCOM
+	select QCOM_QMI_HELPERS
+	help
+	  This enables the QMI-based Thermal Mitigation Device (TMD) library
+	  for Qualcomm remote subsystems. The library manages TMD messaging and
+	  handles QMI communication with remote processors (modem, CDSP) to
+	  exchange mitigation state and apply thermal mitigation requests.
+
 config QCOM_RAMP_CTRL
 	tristate "Qualcomm Ramp Controller driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index b7f1d2a57367..4544e61c74e7 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
 CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
+obj-$(CONFIG_QCOM_QMI_TMD) += qmi_tmd.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
 obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
new file mode 100644
index 000000000000..9d88ae48c864
--- /dev/null
+++ b/drivers/soc/qcom/qmi_tmd.c
@@ -0,0 +1,604 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Linaro Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * QMI Thermal Mitigation Device (TMD) library.
+ * This library provides cooling device support for remote subsystems
+ * (modem and CDSP) running the TMD service via QMI.
+ */
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/net.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/qmi.h>
+#include <linux/soc/qcom/qmi_tmd.h>
+#include <linux/thermal.h>
+
+#define QMI_TMD_INSTANCE_MODEM	0x0
+#define QMI_TMD_INSTANCE_CDSP	0x43
+#define QMI_TMD_INSTANCE_CDSP1	0x44
+
+#define QMI_TMD_SERVICE_VERS_V01 0x01
+
+#define QMI_TMD_SET_LEVEL_REQ 0x0021
+#define QMI_TMD_GET_DEV_LIST_REQ 0x0020
+
+#define QMI_TMD_DEV_ID_LEN_MAX 32
+#define QMI_TMD_DEV_LIST_MAX 32
+#define QMI_TMD_RESP_TIMEOUT	msecs_to_jiffies(100)
+#define TMD_GET_LEVEL_REQ_MAX_LEN 36
+#define TMD_SET_LEVEL_REQ_MAX_LEN 40
+
+#define TMD_GET_DEV_LIST_REQ_MAX_LEN 0
+#define TMD_GET_DEV_LIST_RESP_MAX_LEN 1099
+
+struct tmd_dev_id {
+	char mitigation_dev_id[QMI_TMD_DEV_ID_LEN_MAX + 1];
+};
+
+static const struct qmi_elem_info tmd_dev_id_ei[] = {
+	{
+		.data_type = QMI_STRING,
+		.elem_len = QMI_TMD_DEV_ID_LEN_MAX + 1,
+		.elem_size = sizeof(char),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0,
+		.offset = offsetof(struct tmd_dev_id,
+				   mitigation_dev_id),
+	},
+	{
+		.data_type = QMI_EOTI,
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+struct tmd_dev_list {
+	struct tmd_dev_id mitigation_dev_id;
+	u8 max_mitigation_level;
+};
+
+static const struct qmi_elem_info tmd_dev_list_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof(struct tmd_dev_id),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0,
+		.offset = offsetof(struct tmd_dev_list,
+				   mitigation_dev_id),
+		.ei_array = tmd_dev_id_ei,
+	},
+	{
+		.data_type = QMI_UNSIGNED_1_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(uint8_t),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0,
+		.offset = offsetof(struct tmd_dev_list,
+				   max_mitigation_level),
+	},
+	{
+		.data_type = QMI_EOTI,
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+struct tmd_get_dev_list_req {
+	char placeholder;
+};
+
+static const struct qmi_elem_info tmd_get_dev_list_req_ei[] = {
+	{
+		.data_type = QMI_EOTI,
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+struct tmd_get_dev_list_resp {
+	struct qmi_response_type_v01 resp;
+	u8 mitigation_device_list_valid;
+	u32 mitigation_device_list_len;
+	struct tmd_dev_list
+		mitigation_device_list[QMI_TMD_DEV_LIST_MAX];
+};
+
+static const struct qmi_elem_info tmd_get_dev_list_resp_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof(struct qmi_response_type_v01),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct tmd_get_dev_list_resp,
+				   resp),
+		.ei_array = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type = QMI_OPT_FLAG,
+		.elem_len = 1,
+		.elem_size = sizeof(uint8_t),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x10,
+		.offset = offsetof(struct tmd_get_dev_list_resp,
+				   mitigation_device_list_valid),
+	},
+	{
+		.data_type = QMI_DATA_LEN,
+		.elem_len = 1,
+		.elem_size = sizeof(uint8_t),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x10,
+		.offset = offsetof(struct tmd_get_dev_list_resp,
+				   mitigation_device_list_len),
+	},
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = QMI_TMD_DEV_LIST_MAX,
+		.elem_size = sizeof(struct tmd_dev_list),
+		.array_type = VAR_LEN_ARRAY,
+		.tlv_type = 0x10,
+		.offset = offsetof(struct tmd_get_dev_list_resp,
+				   mitigation_device_list),
+		.ei_array = tmd_dev_list_ei,
+	},
+	{
+		.data_type = QMI_EOTI,
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+struct tmd_set_level_req {
+	struct tmd_dev_id mitigation_dev_id;
+	u8 mitigation_level;
+};
+
+static const struct qmi_elem_info tmd_set_level_req_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof(struct tmd_dev_id),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x01,
+		.offset = offsetof(struct tmd_set_level_req,
+				   mitigation_dev_id),
+		.ei_array = tmd_dev_id_ei,
+	},
+	{
+		.data_type = QMI_UNSIGNED_1_BYTE,
+		.elem_len = 1,
+		.elem_size = sizeof(uint8_t),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct tmd_set_level_req,
+				   mitigation_level),
+	},
+	{
+		.data_type = QMI_EOTI,
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+struct tmd_set_level_resp {
+	struct qmi_response_type_v01 resp;
+};
+
+static const struct qmi_elem_info tmd_set_level_resp_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len = 1,
+		.elem_size = sizeof(struct qmi_response_type_v01),
+		.array_type = NO_ARRAY,
+		.tlv_type = 0x02,
+		.offset = offsetof(struct tmd_set_level_resp, resp),
+		.ei_array = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type = QMI_EOTI,
+		.array_type = NO_ARRAY,
+		.tlv_type = QMI_COMMON_TLV_TYPE,
+	},
+};
+
+/**
+ * struct qmi_tmd - A TMD cooling device
+ * @name:	The name of this tmd shared by the remote subsystem
+ * @cdev:	Thermal cooling device handle
+ * @cur_state:	The current mitigation state
+ * @max_state:	The maximum state
+ * @qmi_tmd_cli:	Parent QMI TMD client
+ */
+struct qmi_tmd {
+	const char *name;
+	struct thermal_cooling_device *cdev;
+	unsigned int cur_state;
+	unsigned int max_state;
+	struct qmi_tmd_client *qmi_tmd_cli;
+};
+
+/**
+ * struct qmi_tmd_client - QMI TMD client state
+ * @dev:		Device associated with this instance
+ * @handle:		QMI connection handle
+ * @mutex:		Lock to synchronise QMI communication
+ * @connection_active:	Whether or not we're connected to the QMI TMD service
+ * @svc_arrive_work:	Work item for initialising when the TMD service starts
+ * @num_tmds:		Number of tmds described in the device tree
+ * @tmds:		An array of tmd structures
+ */
+struct qmi_tmd_client {
+	struct device *dev;
+	struct qmi_handle handle;
+	/* protects QMI transactions and connection_active */
+	struct mutex mutex;
+	bool connection_active;
+	struct work_struct svc_arrive_work;
+	int num_tmds;
+	struct qmi_tmd tmds[] __counted_by(num_tmds);
+};
+
+/* Notify the remote subsystem of the requested cooling state */
+static int qmi_tmd_send_state_request(struct qmi_tmd *tmd, int state)
+{
+	struct tmd_set_level_resp resp = { 0 };
+	struct tmd_set_level_req req = { 0 };
+	struct qmi_tmd_client *qmi_tmd_cli = tmd->qmi_tmd_cli;
+	struct qmi_txn txn;
+	int ret = 0;
+
+	guard(mutex)(&qmi_tmd_cli->mutex);
+
+	if (!qmi_tmd_cli->connection_active)
+		return 0;
+
+	strscpy(req.mitigation_dev_id.mitigation_dev_id, tmd->name,
+		QMI_TMD_DEV_ID_LEN_MAX + 1);
+	req.mitigation_level = state;
+
+	ret = qmi_txn_init(&qmi_tmd_cli->handle, &txn,
+			   tmd_set_level_resp_ei, &resp);
+	if (ret < 0) {
+		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn init failed for %s ret %d\n",
+			state, tmd->name, ret);
+		return ret;
+	}
+
+	ret = qmi_send_request(&qmi_tmd_cli->handle, NULL, &txn,
+			       QMI_TMD_SET_LEVEL_REQ,
+			       TMD_SET_LEVEL_REQ_MAX_LEN,
+			       tmd_set_level_req_ei, &req);
+	if (ret < 0) {
+		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn send failed for %s ret %d\n",
+			state, tmd->name, ret);
+		qmi_txn_cancel(&txn);
+		return ret;
+	}
+
+	ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
+	if (ret < 0) {
+		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn wait failed for %s ret %d\n",
+			state, tmd->name, ret);
+		return ret;
+	}
+
+	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
+		dev_err(qmi_tmd_cli->dev,
+			"qmi set state %d failed for %s result %#x error %#x\n",
+			state, tmd->name,
+			resp.resp.result, resp.resp.error);
+		return -EREMOTEIO;
+	}
+
+	dev_dbg(qmi_tmd_cli->dev, "Requested state %d/%d for %s\n", state,
+		tmd->max_state, tmd->name);
+
+	return 0;
+}
+
+static int qmi_tmd_get_max_state(struct thermal_cooling_device *cdev,
+				 unsigned long *state)
+{
+	struct qmi_tmd *tmd = cdev->devdata;
+
+	*state = tmd->max_state;
+
+	return 0;
+}
+
+static int qmi_tmd_get_cur_state(struct thermal_cooling_device *cdev,
+				 unsigned long *state)
+{
+	struct qmi_tmd *tmd = cdev->devdata;
+
+	*state = tmd->cur_state;
+
+	return 0;
+}
+
+static int qmi_tmd_set_cur_state(struct thermal_cooling_device *cdev,
+				 unsigned long state)
+{
+	struct qmi_tmd *tmd = cdev->devdata;
+	int ret;
+
+	if (state > tmd->max_state)
+		return -EINVAL;
+
+	if (tmd->cur_state == state)
+		return 0;
+
+	ret = qmi_tmd_send_state_request(tmd, state);
+	if (!ret)
+		tmd->cur_state = state;
+
+	return ret;
+}
+
+static const struct thermal_cooling_device_ops qmi_tmd_cooling_ops = {
+	.get_max_state = qmi_tmd_get_max_state,
+	.get_cur_state = qmi_tmd_get_cur_state,
+	.set_cur_state = qmi_tmd_set_cur_state,
+};
+
+static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
+			    const char *label, u8 max_state)
+{
+	struct device *dev = qmi_tmd_cli->dev;
+	struct qmi_tmd *tmd;
+	int index;
+
+	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
+		tmd = &qmi_tmd_cli->tmds[index];
+
+		if (!strncasecmp(tmd->name, label,
+				 QMI_TMD_DEV_ID_LEN_MAX + 1))
+			goto found;
+	}
+
+	dev_dbg(qmi_tmd_cli->dev,
+		"TMD '%s' available in firmware but not specified in DT\n",
+		label);
+	return 0;
+
+found:
+	tmd->max_state = max_state;
+
+	/*
+	 * If the cooling device already exists then the QMI service went away and
+	 * came back. So just make sure the current cooling device state is
+	 * reflected on the remote side and then return.
+	 */
+	if (tmd->cdev)
+		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
+
+	tmd->cdev = thermal_of_cooling_device_register(dev->of_node, index,
+						       label, tmd, &qmi_tmd_cooling_ops);
+	if (IS_ERR(tmd->cdev))
+		return PTR_ERR(tmd->cdev);
+
+	return 0;
+}
+
+static void qmi_tmd_unregister(struct qmi_tmd_client *qmi_tmd_cli)
+{
+	struct qmi_tmd *tmd;
+	int index;
+
+	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
+		tmd = &qmi_tmd_cli->tmds[index];
+
+		if (!tmd->cdev)
+			continue;
+
+		thermal_cooling_device_unregister(tmd->cdev);
+		tmd->cdev = NULL;
+	}
+}
+
+static void qmi_tmd_svc_arrive(struct work_struct *work)
+{
+	struct qmi_tmd_client *qmi_tmd_cli =
+		container_of(work, struct qmi_tmd_client, svc_arrive_work);
+
+	struct tmd_get_dev_list_req req = { 0 };
+	struct tmd_get_dev_list_resp *resp __free(kfree) = NULL;
+	int ret, i;
+	struct qmi_txn txn;
+
+	resp = kzalloc_obj(*resp, GFP_KERNEL);
+	if (!resp) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
+		ret = qmi_txn_init(&qmi_tmd_cli->handle, &txn,
+				   tmd_get_dev_list_resp_ei, resp);
+		if (ret < 0)
+			goto out;
+
+		ret = qmi_send_request(&qmi_tmd_cli->handle, NULL, &txn,
+				       QMI_TMD_GET_DEV_LIST_REQ,
+				TMD_GET_DEV_LIST_REQ_MAX_LEN,
+				tmd_get_dev_list_req_ei, &req);
+		if (ret < 0) {
+			qmi_txn_cancel(&txn);
+			goto out;
+		}
+
+		ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
+		if (ret < 0)
+			goto out;
+
+		if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
+			ret = -EPROTO;
+			goto out;
+		}
+
+		qmi_tmd_cli->connection_active = true;
+	}
+
+	for (i = 0; i < resp->mitigation_device_list_len; i++) {
+		struct tmd_dev_list *device =
+			&resp->mitigation_device_list[i];
+
+		ret = qmi_tmd_register(qmi_tmd_cli,
+				       device->mitigation_dev_id.mitigation_dev_id,
+				       device->max_mitigation_level);
+		if (ret)
+			break;
+	}
+
+out:
+	if (ret)
+		dev_err(qmi_tmd_cli->dev, "Failed to initialize TMD service: %d\n", ret);
+}
+
+static void qmi_tmd_del_server(struct qmi_handle *qmi, struct qmi_service *service)
+{
+	struct qmi_tmd_client *qmi_tmd_cli =
+		container_of(qmi, struct qmi_tmd_client, handle);
+
+	kernel_sock_shutdown(qmi->sock, SHUT_RDWR);
+
+	scoped_guard(mutex, &qmi_tmd_cli->mutex)
+		qmi_tmd_cli->connection_active = false;
+}
+
+static int qmi_tmd_new_server(struct qmi_handle *qmi, struct qmi_service *service)
+{
+	struct sockaddr_qrtr sq = { AF_QIPCRTR, service->node, service->port };
+	struct qmi_tmd_client *qmi_tmd_cli;
+	int ret;
+
+	qmi_tmd_cli = container_of(qmi, struct qmi_tmd_client, handle);
+
+	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
+		ret = kernel_connect(qmi->sock, (struct sockaddr_unsized *)&sq,
+				     sizeof(sq), 0);
+	}
+
+	if (ret < 0) {
+		dev_err(qmi_tmd_cli->dev, "QMI connect failed for node %u port %u: %d\n",
+			service->node, service->port, ret);
+		return ret;
+	}
+
+	queue_work(system_highpri_wq, &qmi_tmd_cli->svc_arrive_work);
+
+	return 0;
+}
+
+static const struct qmi_ops qmi_tmd_ops = {
+	.new_server = qmi_tmd_new_server,
+	.del_server = qmi_tmd_del_server,
+};
+
+static int qmi_tmd_get_instance_id(const char *remoteproc_name)
+{
+	if (!strcmp(remoteproc_name, "modem"))
+		return QMI_TMD_INSTANCE_MODEM;
+
+	if (!strcmp(remoteproc_name, "cdsp"))
+		return QMI_TMD_INSTANCE_CDSP;
+
+	if (!strcmp(remoteproc_name, "cdsp1"))
+		return QMI_TMD_INSTANCE_CDSP1;
+
+	return -ENODEV;
+}
+
+/**
+ * qmi_tmd_init() - Initialize QMI TMD instance
+ * @dev: Device pointer
+ * @remoteproc_name: Remoteproc name (for example modem, cdsp)
+ * @tmd_names: Array of TMD names
+ * @num_tmds: Number of TMD names
+ *
+ * Return: Pointer to qmi_tmd_client on success, ERR_PTR on failure
+ */
+struct qmi_tmd_client *qmi_tmd_init(struct device *dev,
+				    const char *remoteproc_name,
+				    const char * const *tmd_names,
+				    int num_tmds)
+{
+	struct qmi_tmd_client *qmi_tmd_cli;
+	int ret, i, instance_id;
+
+	if (!dev || !remoteproc_name || !tmd_names || num_tmds <= 0)
+		return ERR_PTR(-EINVAL);
+
+	instance_id = qmi_tmd_get_instance_id(remoteproc_name);
+	if (instance_id < 0) {
+		dev_err(dev, "Unsupported remoteproc name '%s' for TMD lookup\n",
+			remoteproc_name);
+		return ERR_PTR(instance_id);
+	}
+
+	qmi_tmd_cli = devm_kzalloc(dev, struct_size(qmi_tmd_cli, tmds, num_tmds), GFP_KERNEL);
+	if (!qmi_tmd_cli)
+		return ERR_PTR(-ENOMEM);
+
+	qmi_tmd_cli->dev = dev;
+	qmi_tmd_cli->num_tmds = num_tmds;
+	mutex_init(&qmi_tmd_cli->mutex);
+	INIT_WORK(&qmi_tmd_cli->svc_arrive_work, qmi_tmd_svc_arrive);
+
+	/* Initialize TMD structures */
+	for (i = 0; i < num_tmds; i++) {
+		qmi_tmd_cli->tmds[i].name = tmd_names[i];
+		qmi_tmd_cli->tmds[i].qmi_tmd_cli = qmi_tmd_cli;
+	}
+
+	ret = qmi_handle_init(&qmi_tmd_cli->handle,
+			      TMD_GET_DEV_LIST_RESP_MAX_LEN,
+			      &qmi_tmd_ops, NULL);
+	if (ret < 0) {
+		dev_err(dev, "QMI handle init failed: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	ret = qmi_add_lookup(&qmi_tmd_cli->handle, QMI_SERVICE_ID_TMD,
+			     QMI_TMD_SERVICE_VERS_V01, instance_id);
+	if (ret < 0) {
+		dev_err(dev, "QMI add lookup failed: %d\n", ret);
+		goto err_release_handle;
+	}
+
+	return qmi_tmd_cli;
+
+err_release_handle:
+	qmi_handle_release(&qmi_tmd_cli->handle);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(qmi_tmd_init);
+
+/**
+ * qmi_tmd_exit() - Deinitialize QMI TMD instance
+ * @qmi_tmd_cli: QMI TMD client to deinitialize
+ */
+void qmi_tmd_exit(struct qmi_tmd_client *qmi_tmd_cli)
+{
+	if (!qmi_tmd_cli)
+		return;
+
+	cancel_work_sync(&qmi_tmd_cli->svc_arrive_work);
+	qmi_handle_release(&qmi_tmd_cli->handle);
+	qmi_tmd_unregister(qmi_tmd_cli);
+
+	scoped_guard(mutex, &qmi_tmd_cli->mutex)
+		qmi_tmd_cli->connection_active = false;
+}
+EXPORT_SYMBOL_GPL(qmi_tmd_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm QMI Thermal Mitigation library");
diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index b9dcb437a0be..683d27cee413 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -96,6 +96,7 @@ struct qmi_elem_info {
  * Enumerate the IDs of the QMI services
  */
 #define QMI_SERVICE_ID_TEST		0x0f	/*   15 */
+#define QMI_SERVICE_ID_TMD		0x18	/*   24 */
 #define QMI_SERVICE_ID_SSCTL		0x2b	/*   43 */
 #define QMI_SERVICE_ID_IPA		0x31	/*   49 */
 #define QMI_SERVICE_ID_SERVREG_LOC	0x40	/*   64 */
diff --git a/include/linux/soc/qcom/qmi_tmd.h b/include/linux/soc/qcom/qmi_tmd.h
new file mode 100644
index 000000000000..75373eb09d61
--- /dev/null
+++ b/include/linux/soc/qcom/qmi_tmd.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025, Linaro Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * QMI Thermal Mitigation Device (TMD) library header.
+ */
+
+#ifndef __QMI_TMD_H__
+#define __QMI_TMD_H__
+
+struct device;
+struct qmi_tmd_client;
+
+struct qmi_tmd_client *qmi_tmd_init(struct device *dev,
+				    const char *remoteproc_name,
+				    const char * const *tmd_names,
+				    int num_tmds);
+
+void qmi_tmd_exit(struct qmi_tmd_client *tmd_cli);
+
+#endif /* __QMI_TMD_H__ */
+

-- 
2.34.1

