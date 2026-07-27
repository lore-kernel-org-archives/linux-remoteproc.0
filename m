Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FA3377EC6
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162189; cv=none; b=qo5jtICtoACgsm6CDokFzB2MLWHVVdICJneIu/8pX1qUa7u8LfeeIUI2Mwwy261hAGmPkRwR0Q15mgkDaIWApFfh3FzhD64bocHOv3XSpU9a7ZrGzsmdWnkgsMiWWTTGywLA2jVP8C7y07C1+A0a8T753I2ACrXiGrLEV+a4U3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162189; c=relaxed/simple;
	bh=p26hkJMnKcRFLs5ipRmXr4XqieWePR0t00FLwh0vx9g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OOKd7WaW8cutI2VfeqJ9PdEGbvucKN3dllPobEkhd4maNWqKjXXyIhuC2SGJSRrvBAylSoKAKV1DhxYXR9sFRP1abrqKMtssYp4NYLWU3YVps2dLOBXohKBAQz3tw/PD5bGs9my6LYXDUsuJ2zDxRoRYjlHdxEu2nlNcksTTXCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Md5lPWF5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DlwOWvvk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Md5lPWF5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DlwOWvvk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlbI13663522
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rqa+sLlZRDQpbkUsREMfAl
	gFOkeKz/1NIPIXFuNFxMw=; b=Md5lPWF5jrGvQCeQDriKS0dmd5zoQBmIoMNoAk
	XTBe6i4ZwBsFTz4XgplnLHo+25FNOnmObLQ6PU2U/xVgY/VB0M2aZKRNZJWVUINd
	tM9jNxCCeRRDfPmW5l9x5OIGiNLbz1EwL4e8/Vq6aol5qpMfQYIkux0XlRX6gjUM
	CLWwK44OCJXlV/dHutCieAOQH6ZDrfN+NqrYt7YoERmBjLex2GsBNEj36Q9zftmS
	k0ychlVg+hz5MWcQbbu+AMoQMzw7xy/mNouc3La0kh2hIJNLxiMG/Yinz2EWY0+a
	A71EHfplL/2GWcFVfDFZOZhoVHiBC4QMSs1H0JnUPEcrOEug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp2ashub6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:23:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so59865935ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162186; x=1785766986; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rqa+sLlZRDQpbkUsREMfAlgFOkeKz/1NIPIXFuNFxMw=;
        b=DlwOWvvk03fsJgi+TX7r7L3VS5zBPq0SVZuYs+pwelZGOrLKKbW5F43GjyVqZR1kS/
         zjN42YO781YKHyqnWN7ElJnt645qeDX+dHY0s/AGfNrrHjszcO9G4QpTONZ9RnrLngQ1
         DxQCZ1F4ByBAO2XiKH44kpPy0PD/5GnfyX3q/62kOBofqZXm983nsabFaWAvOofuP7U4
         tbz715wGKhEVGWtSYwxyy9GHNN0GzyWUy6ljUNfYrzY6sot4EdIkVy7Nv0srVl/5161I
         7RnkYuagt2wgoYVhnro7hW/e0NV/NCo1/UFwVRu2ZHKRzc6DuOE1jfMt2u6U0cEEiZcU
         JokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162186; x=1785766986;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rqa+sLlZRDQpbkUsREMfAlgFOkeKz/1NIPIXFuNFxMw=;
        b=GxDGHT/LIOXR1eFCq2p9acX4C0+HVWfEgjhrPsnOgJbiWEJ5QbYbyIoM0Ats04pKPB
         32ctNbZpC+wL1OFv+7XfNKh35WIZRtlUT+LDW+HKgwMZ8MGMe/mkWtWbqTdDV3vwsPgN
         +j3B2uZTgaHzNevaKLOez6k5qNIUrwVWSVTLCjfu74W+soKybV2xAk8s4vjo1FQW0ZLK
         kqfVMWsPXTMeBpTzTenM4DsVNtf5T8gkZ+Dx3hRNT30LbJOAz4t7wz00hvf1RSdcrDRF
         vNFTllouS8Ucnp8QSX+mjxVq1pBABzGyQn4fb2zrb7XIK841W8sKB0nUrE2Wk2BgV79E
         CcbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr82AMDyxzigWXujq65hfBrr0F3vP1DcLpbqOu+ziblIdUR+/WvVrkRPDvIsG3N89F5dPyrUSbLhhUVepEIUYPl@vger.kernel.org
X-Gm-Message-State: AOJu0YwwA1adzN5W72ifD54YGjTIcY0+ttc1ECzPRS9u5x5Cu/hHM71X
	CYZtuo3oiMj8D2uLX95lF/63iINziEThSyOVOKBdIrFR9MRz2Cs+wBFIRIYUan7Z/9Cz4inT6SS
	+hK8KdwQHBzQhxZndOM4WhSQRcbWtBnNhC3LwVdhgAu+/WT70CWlqIWx5Dl46lMtCRz/VPGxR
X-Gm-Gg: AR+sD136YrqGbz0/Tmd1TjOeU2Ce3WpNZMvdDwg3NPeGjfCGhoTtZjcJiywt5Ib4zWY
	IBnOdEFGFFtNVsnHdwj2kEAJOPM5Pm3rVNGnrAhB8EQGQFXza/Trlt+oY/olJyMTOK57CCqtQGj
	EoFXGwVXJAX/aM0C4gR2ke0qXVqsmHDlmoYfogktF1JcYNXiSDirmhcuQnwtUGMGpHWZr1XMpKR
	EB+LrFo3fisF2xKnacXj9dxQrJQ2G6rKj7sd8E9uPI3CNwOelFsxMbBEib+j/oZQqSnBy7QAlOn
	ckEqtWy52Jnz0nI+crS60yeJuaEOZA+TDibQC3vy1tR0vMo4WWRjyRCmViPo/SJuMb0+a5hs+B9
	/yCuR2jk9EZL2b+xPxXy/aT/YlZj0WQ==
X-Received: by 2002:a17:902:f602:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d008939be5mr8967945ad.9.1785162185746;
        Mon, 27 Jul 2026 07:23:05 -0700 (PDT)
X-Received: by 2002:a17:902:f602:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d008939be5mr8967685ad.9.1785162185260;
        Mon, 27 Jul 2026 07:23:05 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81d7f5sm36608755ad.83.2026.07.27.07.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:23:04 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH v6 0/9] Add support for Qualcomm remoteproc subsystem
 cooling
Date: Mon, 27 Jul 2026 19:52:17 +0530
Message-Id: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJlpZ2oC/23O0QqDIBQG4FcJr2foMct2tfcYu6jUJcwsbbIRv
 fssxuhiNwf+H/6Ps6CgvFEBnbMFeRVNMG5IoTxlqOub4a6wkSkjIFCSinLcFniyBs9WYglMCal
 pCwJQGoxeafPasest5d6E2fn3bsdia78MYT8jFphgJgRQUXdUC3ZxIeTTs3l0zto8HbRRkR/mQ
 I9fRJ6Eui6BKFJpTvgfYV3XDz0/6l7qAAAA
X-Change-ID: 20260715-b4-qmi-tmd-d23e8df1b282
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
        manaf.pallikunhi@oss.qualcomm.com,
        Casey Connolly <casey.connolly@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785162177; l=6830;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=p26hkJMnKcRFLs5ipRmXr4XqieWePR0t00FLwh0vx9g=;
 b=+6ozM/Abx+Z41tD84XX3Nt9eIDUYQkvUyg9x1LvXsOlQzqcvu5or6ITFjG0QMCVkzJ8tgdD8T
 JclBEtPrh+6Dj6vcCEDKTTxt0F+/+ixKgTdLBy2oek0NoIXNq7g9OKG
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfXxniiOIuPbgGV
 AEAXEQiwPVAWDvOQl4J55BCsQoWXdpX0DUicwBhCr9gHpEpMoahIE0p34mJhWbavusrkQyzkRE5
 IOz7vEYINRVeL7O/OkJlsOfamhFmgXc+e17I9GX830119ypW6gtqNUj2NzXkgIP9Ib87A3L4JV9
 ZgJHmvclIxaMluWAFqkCcJ2ZwIiPvNQWTPDKc1xxD17P2zIX38X2Bz/pQCGqZCg13I/+pZTzJiF
 js+6PSaS9tTW4ZotBo/I812k+poyyi1xJN7aMp6EHXdiwLAJv0g4/uN8mRWvdIrlkOaoaCB94z/
 pbHSAFZRBpcPcuSo5rAgQqaDXSDhS3iJjBGSdw/7dAlcOX33BIdWtAWLFDfMxMyCD4gk5bxj4oA
 z28Z/v8BNYoZLBfIDaMq3XZ3g36G+0LhQNV06FDA8BjNvfUsTQTg1bgOuHLaSNJBb1W9Lm9P5uq
 LevyfjPFNSG12NQZh5Q==
X-Authority-Analysis: v=2.4 cv=UPbt2ify c=1 sm=1 tr=0 ts=6a6769ca cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=myz9wP-PkEfKd50XNCIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX+4bA3R8sePKS
 e8Wk/YL6bfEyuc92KCYPBC6Gxgly0ZBOYGyppkS6XHAAg3sMI/H+T7JxBNYlzNqUzkYdUYvDnmn
 7e3Naq4wADHHN2n1CFhoCn4m3WdVfUU=
X-Proofpoint-ORIG-GUID: piowTMRHndZ1dVn3MyPwoRegxrv8QBCg
X-Proofpoint-GUID: piowTMRHndZ1dVn3MyPwoRegxrv8QBCg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270136

This series introduces Qualcomm Messaging Interface based Thermal
Mitigation Device (QMI TMD) support to control thermal mitigation
on remote subsystems such as the Modem and CDSP.

The QMI TMD is an interface that instructs a remote subsystem to adjust
the performance level of the devices it manages, reducing power consumption
in response to critically low battery charge, overcurrent alerts, or
overheating conditions.

The series is organized as follows:

 - Add a shared dt-bindings header mapping TMD device indices for use
   in DT cooling-maps, ensuring a consistent binding between the thermal
   zone and the QMI TMD driver.

 - Extend the remoteproc PAS binding with the optional #cooling-cells
   property to allow remoteproc nodes to be referenced as cooling devices.

 - Add QMI TMD support in the remoteproc PAS framework, hooking into
   the probe/unregister lifecycle to register and unregister cooling
   devices with the thermal framework.

 - Enable CDSP and Modem cooling on kodiak, lemans, talos, monaco and
   hamoa platforms using the new binding.

Not all TMD endpoints advertised by the firmware are wired into kernel
thermal zones. Endpoints such as BCL (battery current limiting) and cold
temperature protection are handled from userspace via qmi and do not
require kernel thermal zone bindings.

The constants defined in this series cover only the endpoints actively
used for thermal mitigation in the kernel thermal framework on the
currently posted targets: cdsp_sw (CDSP software thermal limit), pa
(modem power amplifier), and modem.

This work revives the earlier QMI cooling series by Casey Connolly [1],
with the following key differences:
 - Uses an id based API for cooling-device binding
 - Integrates QMI TMD directly into the remoteproc PAS framework and
   hooks into the probe/unregister lifecycle.
 - Removes unused code and cleans up macro names

This series depends on cooling device id support from Daniel Lezcano [2].

[1] https://lore.kernel.org/linux-devicetree/20230905-caleb-qmi_cooling-v1-0-5aa39d4164a7@linaro.org/
[2] https://lore.kernel.org/all/20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com/

---
Changes in v6:
- Added Reviewed-by tags from Dmitry.
- Kodiak: delete MPSS cooling maps by label on non-modem boards. (Dmitry)
- Renamed qcom,qmi-tmd.h to qcom,pas.h. (Krzysztof)
- Made QCOM_QMI_TMD tristate to fix unmet dependency issue. (Sashiko)
- Removed redundant negative TMD id check in qcom_pas_setup_tmd(). (Dmitry)
- Fixed QMI_DATA_LEN type issue by using u32. (Sashiko)
- Link to v5: https://lore.kernel.org/r/20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com

Changes in v5:
- Added Reviewed-by tag (Daniel Lezcano)
- Squashed dt-bindings header patch into the yaml binding patch.(Krzysztof)
- Renamed constants: QCOM_CDSP_TMD_CDSP_SW -> QCOM_TMD_CDSP_SW,
  QCOM_MODEM_TMD_PA -> QCOM_TMD_PA, QCOM_MODEM_TMD_MODEM ->
  QCOM_TMD_MODEM.(Krzysztof)
- Replaced dev_err() with dev_err_probe() in qmi_tmd_init() (Krzysztof)
- Fixed qmi_tmd_exit() teardown order to prevent cancel_work_sync()
  re-queue race.(Krzysztof)
- Removed only MPSS maps instead of entire cooling-maps node.(Dmitry)
- Added cover letter note clarifying TMD endpoint selection rationale.(Dmitry)
- Added NET dependency in Kconfig.(Julian)
- Link to v4: https://lore.kernel.org/r/20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com

Changes in v4:
- Drop the tmd-names DT property.
- Move TMD instance id and tmd device name into PAS platform data.
- Add a shared dt-bindings header to define numeric constant for TMD id. 
- Add mutex documentation comments for get/set state callbacks.
- Link to v3: https://lore.kernel.org/r/20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com

Changes in v3:
- Removed the remoteproc-cooling abstraction approach.
- Integerated QMI TMD with remoteproc core framework.
- Cleaned the macro names and removed unused code.
- Switched to index-based thermal_of_cooling_device_register() api.
- Link to v2: https://lore.kernel.org/linux-devicetree/20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com/

Changes in v2:
- Update Remoreproc thermal config to tristate and removed unnecessary NULL checks.
- Fixed dt binding file format and added generic name support for cdsp.
- Fixed memory leak and cleaned up qmi-cooling driver file.
- Corrected DT formatting errors and commit descriptions for all targets.
- Link to v1: https://lore.kernel.org/linux-devicetree/20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com/
---

---
Casey Connolly (1):
      soc: qcom: Add QMI TMD support for remote thermal mitigation

Dipa Ramesh Mantre (1):
      arm64: dts: qcom: hamoa: Enable CDSP cooling

Gaurav Kohli (7):
      dt-bindings: remoteproc: qcom,pas: add #cooling-cells property
      remoteproc: qcom: pas: add support for TMD thermal cooling devices
      remoteproc: qcom_q6v5_pas: enable QMI TMD cooling support
      arm64: dts: qcom: kodiak: Enable CDSP & Modem cooling
      arm64: dts: qcom: lemans: Enable CDSP cooling
      arm64: dts: qcom: talos: Enable CDSP cooling
      arm64: dts: qcom: monaco: Enable CDSP cooling

 .../bindings/remoteproc/qcom,pas-common.yaml       |   9 +
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  32 ++
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  63 +++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 125 +++++
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 125 ++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  99 ++++
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |   8 +
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |   8 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |   8 +
 .../boot/dts/qcom/qcs6490-vicharak-axon-mini.dts   |   8 +
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  10 +
 .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |   9 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  19 +
 drivers/remoteproc/Kconfig                         |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c                 | 117 +++-
 drivers/soc/qcom/Kconfig                           |  12 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/qmi_tmd.c                         | 595 +++++++++++++++++++++
 include/dt-bindings/thermal/qcom,pas.h             |  20 +
 include/linux/soc/qcom/qmi.h                       |   1 +
 include/linux/soc/qcom/qmi_tmd.h                   |  36 ++
 22 files changed, 1301 insertions(+), 13 deletions(-)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260715-b4-qmi-tmd-d23e8df1b282

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

