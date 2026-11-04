Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801045;
	b=OWnrj6ZP/1N8uJv9cjRgxhv8+N8dxlMXFgtnxGeIUyEfxOKGsq7qjdVaM6sJjya1O1E5
	 dLHkPuUALj7Pzrl/R9Vrw83jzQeSnWqKrqY122k0IZt3QzYtdlTlbrb4B9w2CzBjtLl6p
	 AcggvgxO96uIaBVXUhBTEIKY9hmlBO7fcYUTS88igxStLS5ukjMAiU13YXYpxEVfZBngA
	 k5C5xCyB6VfZ1JATwHlAMs1VkNPgSVPHPeVgt0vp7VpI8rsT/KK583B5nNuAmMb6xIJyP
	 mwVSxnyVnNls93dwyffj0oomNtayCCBEVBPgPi0pwWmPNm53ZGU6LUlqBkbhYKZMZ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n7bjoyrxZoYtQrZTxc8zsqxKbrtUXzCZG9Tyxf4ymGE=;
	b=j1lmezt3f3foN535oTt51bRAWuKE/7iQM+oYGwKSUJX9xJ7sJ8WkyuMEbkhVJIiTx70w
	 SMphkyCLgHe/QFRd7r6H9iFZbQxWNxDzXR+MYjQSCtgIqZs627r546QR5Evz8A/eaLsZq
	 brz0PkmliC8xG6qKEUT7xntXuPzXTEbspvhiDIqjdYcJ/zY4+YISKfA9AtqW/YOPgVX6g
	 9NpZX4lqriB8MpV0MXSJqb3sVztc/L978f81j+Y1gU7Q1owNB3s0IQ372YBJOPlWHmW45
	 E0Dnhjzo+xbCA1DaAmCctZShxzCUonv4C9BAtPCWaIiJYsxPuIvtup8+9VOjWhrkJDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fJDnJMKw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CyEzTuMG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E320606A31B
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2026 14:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E320606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fJDnJMKw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CyEzTuMG
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZoEJ739132
	for <linux-remoteproc@vger.kernel.org>; Wed, 4 Nov 2026 14:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7bjoyrxZoYtQrZTxc8zsqxKbrtUXzCZG9Tyxf4ymGE=; b=fJDnJMKwHqs7JmwK
	gv6Qc0q3t+WowQeXu1/FEXltFj00DY3/nS7CwajYbCyNotHw8V4kjjXIC9UQAbA4
	APZZM1ASPA7jIzd7DqCa9UHRMa1a4IUkTCjLOB6ZlMaMV3UHtwHvfgMLYK+vX7IY
	CXSNLydtMCy0mz27fzkUMS7ZFm70bIhmOb/2zffTh7xS4mtqofQgUlfV5nOMDgXE
	xIM7Eirrn5s/KaTedvDm3Wa2j7PJ3sSo3yI6lJOaw5WNr6Qps1JLHoOn1RayFxpN
	5Zn9on48tCiTbgVfXm0HV9k42svPKjg0Soz6yjgGMY5qrQIYZDImlSDt4uLUGvjp
	5CPg8w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163hafk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 14:04:04 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1af203073e0so1376989c88.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2026 06:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801044; x=1794405844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7bjoyrxZoYtQrZTxc8zsqxKbrtUXzCZG9Tyxf4ymGE=;
        b=CyEzTuMG5QIEQJ7CrMTk26qQF8A/wBuJCAXWeO1u8IqXkjO4u20lqZBGcYfed6CiNo
         bcY95YUCZpCoO7oRJDXy7GHpZUk5uK4oc1l3wCHEfo+QCr+NHYJTDn7Jj8NxClFazjeN
         Gn9p9X0mCcwxwFRmlPL4IaKLnD4vVJIp4gyF2yx3g3NRgyrsfFmrr/O99wu22uiKzNQa
         rKjZAAFLcQODP96O0fxjrpy2V2ZHaScooMHd4JgxQOT7vu+YBcvV182ZPaBS70F6wHlo
         s054dXn2ooOjCOzFc6tCTV+x/uxgp8RjW4+Yd+7cHA4kZvqnQmp1Te+3Di3hTh1VTnkW
         FVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801044; x=1794405844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7bjoyrxZoYtQrZTxc8zsqxKbrtUXzCZG9Tyxf4ymGE=;
        b=I2O6JHrwtTBry37s85EZ9AMHlRf2414gWp6bW0XJ1Q4l/qfZfgNH2nkUgjC5kG6Erk
         tt6tBrYBl74qzQCK7samWVxdMhYB1MBOJyUi9zbKxp+z7HyUcnyZDCppEw8ToFyGxUKM
         iV04s+j+gsYNb2tZTcAWBK+noI+u1Fqq6lacvgmw3ZNfvk/EAokmxm098iLaek6zckGd
         5CkE/pa2NDDiFz0ozl4dVRZBYuGnXKcXANlKvW9KMMIx7cvLkXoUM5fTrpPn7QBrF+eF
         J205835zP/Bzqtg0VEO2888030kSgeSnc1tKYZCyDCVxzWwKceuPRCQm2IwooLLpbO8V
         knPA==
X-Forwarded-Encrypted: i=1; AKwUvByt1XDj0pf4wWgShp95/IW7TchXoJ06N3pNpGBM9FONng3T/M1ZVJxBjqHtJZvpE7oUlKtWSBF6HFmFjtdwLJZR@vger.kernel.org
X-Gm-Message-State: APuU4Z/k2rXQaxrUT3LZpEfOKfFUihsmfv1ubjBW7u4i2tnClFezoLUJ
	1f6Gz19zDKTojX+qLMIqns8VBkGpbacXFi1VH/zvnasedK4tzgvP0tveQV0ySfsKT2CHNZyJch5
	VNLVRRGR7B3lvWFC750s1APdkmPc9Es8TAdR0GuH1XrXyVXXHq7nMej6WjGLo2mpeOJr50wdq
X-Gm-Gg: AYBFou2t3ArpqgfhaLFnkKh1jT6fKibXdqWGPhMiotn4N6tuIrJJknVRAsyg2V3hNbY
	GpNvoNgf2UWhM2UF46+AhhqUVoXd46yRtWmVb71aTXrXVoNa0A0kKp24anrlmG5bFQGd8tIGxF3
	zBZ8pfMlFIyEwRwvrDKz0S8KIO0PI217y1Vj+GmhO23Qrvosz0vXQvxQ+zJ51JTzH+lz6/Tzlpw
	+WT5AF2MTBpf3u2K2W1lBSxNpnsbPAM0w4dUprCfgVwfU5LN/XkNE9L7qQwYNj/j1ZjpRuIbTR2
	pjjLMzVhSdJJE2aZi9YrJPV0CMKjxPoamlTAvQ3fGB1aDulK6PwvL8bG47P4rCvdVPf/VGqF40f
	8cJEVtDvqzBxx1f2FBR85AU2VuJNcu9Wlq0PUMeMoA4+48KBRbrC4H7R0c3ITsjD1
X-Received: by 2002:a05:7022:7f0f:b0:1a7:d426:6dd2 with SMTP id a92af1059eb24-1ac5e31fb9dmr22418042c88.26.1793801043566;
        Wed, 04 Nov 2026 06:04:03 -0800 (PST)
X-Received: by 2002:a05:7022:7f0f:b0:1a7:d426:6dd2 with SMTP id a92af1059eb24-1ac5e31fb9dmr22417986c88.26.1793801042475;
        Wed, 04 Nov 2026 06:04:02 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm10195570c88.15.2026.11.04.06.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:03:59 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 19:33:32 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
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
Message-Id: <20261104-shikra-el2-v4-3-97e7019debff@oss.qualcomm.com>
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
In-Reply-To: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793801016; l=2957;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=V+g7leQcmnlIV8Qt5zWXgn65YJDFlC3n3CeEUkL0o78=;
 b=M3F0GbXbdYaQHG9r5s3wKbedbhn4mEcw04cjPDtL9RiuhDdgQnilvbi/fCiJIfsd0NwLzsyZe
 0zxmfYkYXIvCxwYJvc9mKb/va0ISvZYS8NJlKacvJ9/8LO1SeBI9ACn
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: 2C7VzIOO77Jnwy8HxvjpH0xrqRHUAbuH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX2kbRrqTqkQYA
 ss1wRo7yOsKZSwDY3yyNx4Coalbu6OPmkz1MxEYFdDMY1sFY7/i5+uAbfpgAXXieoYBkZ1XbIRT
 A/DGkWtQyTdoraa5bj/EUFtuGq3p3L8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX6bg/r6uBQ+7E
 w8LEbHpp521KVg9BTVYOSEIt0d+bvGta7N2TIoXCU2sSWy8gdoN7zBUp5u9MLNAQH7GUzCV3XWq
 VgVqGze8wExDQZJRmrlA1osFmVVEuC6GDvmEIgJvXzRc8zfN9xrC4xsXFfSZ4s2goCOzNc5LBIY
 oqdG05J18Xg/rjCqczteZaG0vAKTHaeisGxLG0NhHoLbAYR5zmYDfvT1dO+moSAYN/Nx9BTMrXB
 VjAcm9nUHJvj/3b2C5G8mSgtrGPOTtbfP5LwKQvqvqXRAmclUYV66X4nfikdsKfZ2xWLBle33ue
 CHkChTba89lfDZGBJ3eOzaVZrZzTJ9kONsk/lCAIpFZanPORI3z2h8Dm8DCA9N1VByuuRK/Ospr
 oR5KFpXhddntOWrTVDpBnmmtvQEAwImMaT3g9BVr8TDa2Qd5Q2koY0l9hqgtcncqOxhLIMfY+fM
 9powBgFtY0X+Fm2u2Ng==
X-Proofpoint-GUID: 2C7VzIOO77Jnwy8HxvjpH0xrqRHUAbuH
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb3b54 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ieEIU8YVhEgz5sbSP_EA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

Shikra boards currently boot Linux under a hypervisor, where the
remote processor firmware IOMMU streams are managed by the hypervisor.
When booting Linux directly at EL2 without the hypervisor, the IOMMU
is instead managed by the consumer of this DeviceTree, so the firmware
streams for each remote processor need to be described explicitly.

Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
devices to produce an -el2.dtb alongside the "normal" dtb.

Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 29 +++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..296c53b82687 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -373,9 +373,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+
+shikra-cqm-evk-el2-dtbs	:= shikra-cqm-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
+
+shikra-cqs-evk-el2-dtbs	:= shikra-cqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
+shikra-iqs-evk-el2-dtbs	:= shikra-iqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-el2.dtb
+
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
new file mode 100644
index 000000000000..a0f7c4a635ad
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Shikra specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0200 0x0>;
+};
+
+&remoteproc_lpaicp {
+	iommus = <&apps_smmu 0x0360 0x0005>,
+		 <&apps_smmu 0x0366 0x0000>,
+		 <&apps_smmu 0x00e7 0x0000>;
+};
+
+&wifi {
+	wifi-firmware {
+		iommus = <&apps_smmu 0x01a2 0x0001>;
+	};
+};

-- 
2.34.1

