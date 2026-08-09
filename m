Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968D63839AA
	for <linux-remoteproc@vger.kernel.org>; Sun,  9 Aug 2026 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278610; cv=none; b=XIIYoie9/8ZPjojlhQmiUU2mC9I3f77IMFikHIYoOW6qwhHwaPU5Fqx/vyKIBHKAKJmt4UtgiVkYDZP6B6bFORnhz6G48MWabQHYLct64vjIsVlIkFSUUKfE4weBgdg5idKJBBQLvRSOQvylxXeaDZtjmHNDqET0UUK2Fvo8nCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278610; c=relaxed/simple;
	bh=hzPQLN63RPYnyfObu7brSbD/mhgt2WOI5UXVe/9Briw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lMgMGxt4In1k/mJX2A/G+aMZV+Q2XsFh1XH4tgrcWMp7dIkCUWikBz8Ec56kQSrO0fg6ZfJYDcDovnFvWANzPYGZ37BkT6bkULMmCcYDiAZilFCOTqF/V5tRZMXrEBvsnJOOEhJqZ8+arPAo7uTmodrGmSnEzu1qtpUfGHH9OGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BeK5uPSZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATtWQzrL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BeK5uPSZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATtWQzrL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C26t12624605
	for <linux-remoteproc@vger.kernel.org>; Sun, 9 Aug 2026 12:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2uXTcBY6RMD7wk2WeucsBK
	SRnENcqgsHAYonN0T9jMg=; b=BeK5uPSZJSN/9j6juLcwLKOXXcHtst2O7tQp/Y
	sqLvC0a5+GAB3li2xC6wO/ePVQUwSJ0w2BM3+4yJpDgCO8UvjNgj7BFgGgb7Sbag
	R3qJ4MrW8fy1msT5CmZBfCyMEIDempMqO4XWkUEqyLMw0ifdGsMtIMntz3HUC92X
	5s7378vP4UQk5Zz3EeVeFhMLDPDH77JHo7qlj0uJerXDHJc5LLk8mA5Z7WyUvkw+
	OZoitmdENQiDPhmMdKL3Lm05w6P7ToLLQWvbMYejwI7EL5spkI0MUUbuswAnwq0Q
	FPdghbfA2Lh1yl8KNfxJDMbtuUpM8h4++0SOJxWdpOqdXqMA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwush2w82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 09 Aug 2026 12:30:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so1420612a91.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 09 Aug 2026 05:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278606; x=1786883406; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2uXTcBY6RMD7wk2WeucsBKSRnENcqgsHAYonN0T9jMg=;
        b=ATtWQzrL3XIbbmqSDwjh5P/bZEPuz6fja6kwo7shaZzsxe9lXR1G5pLTro7m5DMRQS
         KPm2cfm+r5GmmLfI+JsYLRQm3emnCO0mP1e6T7QNiYT41zjaBxXT1koDRcEU3sSq48Nc
         qFrH7OOcpMEH3pB0/2Kc3kXUz67O3PLrJ+kPZZ+IfLAY01Lppa5w89ZNDliwaZ5uN46K
         Hh21IKCRfJkGROtCHPcX68SgDYcOvVQChrD52DczrE6pNVYGjTPF0el4KxJo8pkUhwZW
         V2Trjj3aOvYKIYJjFu5rYlsY+vg3zi7uwGHWeA1OzwVykIBjCsr6U3R/YeUcr0v3qlvT
         WXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278606; x=1786883406;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2uXTcBY6RMD7wk2WeucsBKSRnENcqgsHAYonN0T9jMg=;
        b=EFf7ZMsxeq9fPDmsQCoYj1aZiRsRfjFyQZXsCgyNc/Kx+QLOwLnt7cdxRMXc/mSWbY
         cNkdl6Mw4SJlegK+gutl6g8JNzBWmKIl/18JsYirJssT7a3rCSGerY9/AS6lxa/FtVVS
         embuTxS4oh68Uin5hXQmwZQITlmxngh/3AbZXB4XXYx7v4FHtDR7Y/wh3yULRPpX0c1W
         f/AoPgvX39To9fmsQVF5ZPB8VEfNFQ5oCQQs9yguu9xPE0iOGDppltG/2DK78N6eifd8
         ACUh/F+FL8frjhf2EtHrJTIyEjrZvn0Xlr21dhca5BXp3nRCxHINyW9KEz/7yHIpwT5G
         kgbA==
X-Forwarded-Encrypted: i=1; AHgh+RozZFt6oM7Mx5Y4UoOIsiDPn9T535I6cZIR0mN0YKJDV6EuspJhEVhXrMKC2cGVNfyEKs4dt+HBe48eoRqMhDfT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5bO8iy+Skgp4s5nEJq5BGOTU4buAriGf8OibUwC+X91Yl29yh
	i8pkzWacR3HctseZnM+FuNhIMa2nF3iZ/ilrtW0UErmckJaYKm3sTOwsnqvSluTlJNYsK098Qt5
	UTTcFvUp0MKfsgnPSmKHpvVmgT1mqpXinTCFKigUAXDwiI0NgfhHKkAr8AJXTAjh1bMPFi3RA
X-Gm-Gg: AR+sD13tKR7l8GBDPXv50sQ7CbGl6zq2XFd928KDRZg7wqBCvpxkHdRDtBKuZQcWV5S
	QVZAiMehLM/y8Z2Es7E5cjbPbyLK5hBb0rnxOjfSFD9N/Dlfvi8JLuh4zDRWtVEpKE7TuEZ9569
	ihPDFNFDnbKsaNy1XA78LpKZRDDA5fdDv5QU2mLAvPPXSjGNjpWkVAsxlKbJqQuJJo788MzTRSY
	Afn6TO7rYMjNhCSsOr+tYfbC+8F0Hp36uWlU7KOamm1KTNXsrW3Xps+ASpBnCKAD/OG+PWK8a9X
	y5iTWoslEfEvNwWafIGqsdGk+kHksMjf0+I99HT9G+7ecvjEJY8ofc9FWfOIcO1OWfyY9vXuYsX
	+S4rY/wxoai7pJH+8I5c2JMEw6HIxNw==
X-Received: by 2002:a17:90b:3b89:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-392822bf798mr11202232a91.4.1786278605785;
        Sun, 09 Aug 2026 05:30:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3b89:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-392822bf798mr11202149a91.4.1786278605157;
        Sun, 09 Aug 2026 05:30:05 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm51842997eec.18.2026.08.09.05.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 05:30:04 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH v8 0/9] Add support for Qualcomm remoteproc subsystem
 cooling
Date: Sun, 09 Aug 2026 17:58:56 +0530
Message-Id: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIhyeGoC/3XP3wqCMBQG8FeJXTfZzv7aVe8RXajbapCZzkYhv
 ntTIhTy5sB34Pz4zoCC7bwN6LAbUGejD765p6D3O1Rdi/vFYm9SRkBAEkUFLjlua4/72mADzGr
 jaAkaUDp4dNb514ydzilffeib7j3bkU/bL0PYz4gcE8y0BqrzijrNjk0IWfssblVT11kaaKKiW
 JwDXbaIIgl5LoFYopwgYkOQS0GtBDkJilWGFQCycBuCWghs3UFNX5TWGc45YeZfh3EcP4CbPxN
 uAQAA
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786278595; l=7336;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=hzPQLN63RPYnyfObu7brSbD/mhgt2WOI5UXVe/9Briw=;
 b=ii605iPjxbrIBcD4pby6KYd3D8u9H0d8UT9iH9sCiFVjdioFPUVroMe7OqRb7ad8FLmgxQaUh
 NSDZlTYqiarCCfyAx3EKLsEvomFT1dTJ2/r8QQdUqq3in5K1aK/9joY
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: cAgrE9jIsNnyYNHSLHWIS7FgIjb2k4z6
X-Authority-Analysis: v=2.4 cv=GvpyPE1C c=1 sm=1 tr=0 ts=6a7872cf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uM_Z6P9mi9P6D6jF0MIA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cAgrE9jIsNnyYNHSLHWIS7FgIjb2k4z6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfXzBE75Iwn/gMB
 zcbBGz4OoY+v4PVsLiGKEVevsACGpl8A5uxbk7yLsd1yE7eje0PfJ5ig/aTu6Hf9/4+Mji0Ee5/
 MsYc5cfoQVKKhIi1nC3XEqc8n1xBzuRsrDbPJAQXuUm367O2xMDZ65JevJV4gUclFqg9IVZzKsa
 08DOf3vkmaEozzE3L9M9ueuHbyhqBG9M3huzG7Kg5cocQVc+fsSRfnpKplpiwyfSM1CVblQE1bX
 Z7zrNZVYpsCB544h1OBz/VN/xmdBOPWHk4t8XVuNifrR9M1L/oboqaqTs3DBA+IHFi55Uw2by2q
 PD2NrN1CbsaizuBpFPsKvXmQnW10eU4F+hG2Fpvo3tGK0M2zt+vLajbC4MmWMC0cXrDQAUbpJhZ
 YB4YvTukvVg/svdkOaRGBy+fmzmqMoBi4v6TXQANhZw7n0i3+2p9wKKF9q4IzdTxPsSu0FbF7wN
 F1bC8rR2HvaGUmX+AYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfXyT3QGD0dZXfi
 g4DCeg0B8kTbk8LFOLihuyAhgYjaxyoDvn5znjhhFQ6/lge/jT0XnrKOok0jRLvPRe5qiIDpgLW
 LxP2oUnBeK+XOsDxqr+q7gy5Te6GyKI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090110

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
Changes in v8:
- Added Reviewed-by tags from Abel and Krzysztof.
- Return -ENOTCONN when QMI TMD is disconnected.
- Use label references for Hamoa IoT NSP trip overrides. (Stephan)
- Link to v7: https://lore.kernel.org/r/20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com

Changes in v7:
- Added Daniel's Acked-by/Reviewed-by tags.
- Serialized cur_state update with QMI state request. (Sashiko)
- Link to v6: https://lore.kernel.org/r/20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com

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
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  16 +
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
 22 files changed, 1285 insertions(+), 13 deletions(-)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260715-b4-qmi-tmd-d23e8df1b282

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

