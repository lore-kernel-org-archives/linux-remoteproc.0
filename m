Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40CC3D16EC
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175469; cv=none; b=DLcOfos7x5wvPfIpXJTQl1KkCI4Bj9zgLr+ta+ljOgmhiY8XNfgZCv5UMN8pbympUnNoTyJwOoF7eRycVZUFBWv3A0xKPKm51awaQ4urQctB9FPa5XYWPYZFH0DCbP6JfLmpPQIAid7gOBbHlFsuxY4C7gG1qQ3d7PX5llrEqBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175469; c=relaxed/simple;
	bh=TRdZJGL9EF3Ajo6Y98unsizaJ1+MqHdtyxCFx35XUyg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FGIP4I4+GLHFv6M/kjynnApQnDGlApvX01c0QxFp/qbIhX54ldp4cTKSNr6yD7vISKdTt7pjwsV01HLHWti/WgspnXtrV2Vtic+PYlW5EQgPxf8l15eSFH5UP3RsJy7+JswNuzn9G42Hr9x2UzhRa3IFecPzd+maviEpamkLwbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkVcxoaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c590TDHf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkVcxoaR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c590TDHf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J6C2ma2438195
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vI72ozYDgrs1FdXLZkGrWA
	JtfR6YM+4nOxk99e5pYXg=; b=dkVcxoaR3hnlExcu+2niWKy7H9HUKdKzViV/Xw
	qYzTtEzhu/tAST3DQZCKv2Ph3qG5/ZNWK9ccRnEBaLqwbOH3U7iekf4YY4xlRmB4
	d/x3M+Z7p0eW6N3TnFPSJ49Hq8OF7H1bWx/vWmKhTqwbLxfPMhBLc31IAOmOm+vh
	2nFJS7il9Mtmp01Iy173smnwY68Qxe2qeqbhxU5hCLDfeDMCQO9wlRVShMJzpskt
	przSTNiMmRMqsUHvEcu4jWiY4enL+U2F6dXHbEhiHcGfWtflCmvOvk6LBJgVkz2z
	P4DK31KRVpMLJ4WmnV3TqJNhryov6hrGQ9arGKo3btTFmxSw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v3qef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:24:26 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12dece274b1so4599179c88.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 00:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175466; x=1779780266; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vI72ozYDgrs1FdXLZkGrWAJtfR6YM+4nOxk99e5pYXg=;
        b=c590TDHfJHQxPrAbedH3nQVVIWPlB58qzCH64Scq6Pi9ChwprR9uxSRYYdaQ6CO/Uf
         pu0U0XjGkpK88cn3K+rnTGlDJ2aAp0NT/1RXkaDdTufQIpkdI0wvZpV9LWbHpFkOcJmP
         mJqA+AaA+T6KTgl6oZx02YcnsKt4PySXT6PCoPnfZMY4rdF/XEYHImrV9OtLD7PlRTvO
         uYd5WEVr5xsQ36ZJBEMujrxwS6lFcnoGTpNtKc155GFZB/Ln+BD/wkm75YiC03WI5ILD
         cOCainOA0BQUvURVHLmp67Q01GekbgEDF6IxMergLMzqYh5M2ISa+XaSZVjJKqGuSizQ
         nvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175466; x=1779780266;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vI72ozYDgrs1FdXLZkGrWAJtfR6YM+4nOxk99e5pYXg=;
        b=qVarWtPMFP7nKmLAnkOLwDy+JOKbfg2J0BLV4yCKd539p2IX1Ef4N1fMjFPbXQJQvf
         EKlpKLobyU1/sGwjVlzCM2JnnP4Gt5XEgWk7eU0OK2q63AJz2eJFiwXgxb4/ZXsMfcBt
         ZDOhlQ85bW7lFEmL9fRla9NYfykpNWmcmcVeaZ0cajeVcntFZeh+vOu3+Tc08rvlFHYl
         a05ym+CyR495QoWIwS4CXSzsNmX7P94UjdFY5QI88mECxm9nPUId2BG1Z9ymNsQS+q4N
         TT9CfP1MLX/2iBdu5BI/29LX3Up78cwrQALIH87ZKNSvXoRg4XcOQj5PMSaZ+j7/pdBN
         LSQA==
X-Forwarded-Encrypted: i=1; AFNElJ++Kg0lqZ5UDjphzKt1FciZZtni3QH5cOJ+u+5+2eNRH+9670HxHM/gvp78zPw5S7y87IZSkm2mAdO9WmUhCOYB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr8N3xYiiZ0DFAlgZ3MFRip2vvzVEzwLfMkqtsy37tNpkG0riO
	kKy7wOfUGpW5DoX40U8wfkJBrBMpY6aHgn5JvZwzEvQAH7xYuUY21UtXua3kkpxfF2B83YLuYmW
	R03dMevrhpc/vQT4UMLNg40SLBxP2Jw5gIQ+7I+gEJnW3EycbSptLVt/bQLoQthpE+Eiqymgf
X-Gm-Gg: Acq92OG/I1yHHYIbtp3iQ2Um78NUvXkV3vpB+PrFmNSeOtiiZOkitFAI/K2Y7JTAq8U
	32Wbr9/mpVUgEOoC2qx7NtyFtPDY3Ig3LdXfqV3KuP6RMEifTTfSuAzwGCsUIFOZpfS9HLKjRNw
	q5qlqQz5ddKCIo1vde2LCkSqKLCLsv1PannKEtl9uAe+RKI2t+fmsjn11megO76IVhSUYm4JCuq
	mDgRt+W6PHRETjiZCuMg3xUtEz7CwSBpg6uQnVVY36Nw/cUu7Ts7xBiRMzT7+6tpAW1ZAQz09xI
	jbWmYr0J4ZhG2kSQBCCaJUs7bIG9wzVWZgemNHOV6/ID7WCCWTD6HeAOgDYDCybFI3rS2O3ajjk
	UeIBkmiPdMQCLIH13Kf89fwwL2In5ICIVovVtLKVhpV6Phtr6sF8abmawDBWE+4i0/uYGNyv7
X-Received: by 2002:a05:7022:f9d:b0:135:46f1:6290 with SMTP id a92af1059eb24-13546f16347mr4761283c88.25.1779175465963;
        Tue, 19 May 2026 00:24:25 -0700 (PDT)
X-Received: by 2002:a05:7022:f9d:b0:135:46f1:6290 with SMTP id a92af1059eb24-13546f16347mr4761266c88.25.1779175465385;
        Tue, 19 May 2026 00:24:25 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm23337779c88.7.2026.05.19.00.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:24:25 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v6 0/6] Add binding and driver for Kaanapali SoCCP
Date: Tue, 19 May 2026 00:24:18 -0700
Message-Id: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMQDGoC/02NwQ6CMBAFf4Xs2SVtQyt44j8Mh7ZUaZQWu0o0h
 H+34MXLSyaZzFuAXPKO4FQskNzsyceQQR0KsIMOV4e+zwyCCcUkr/EWJqRo7YRHo7gxQhnONWR
 /Su7i33vr3GU2mhyapIMdtgKTrN60wdMzps/+OPNN/sUr1vzFZ4kMayZ11Qguql63kah8vPTdx
 nEs80C3rusX1Za2U8AAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, shengchao.guo@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175464; l=5017;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=TRdZJGL9EF3Ajo6Y98unsizaJ1+MqHdtyxCFx35XUyg=;
 b=bWdmRcv2ZnGM/ClnayZ8xUQ2Z/ORTkRBRqd9VK5Wxl44J06Izr/FyBOGaGcoJd3AOqvrmx9Zb
 ecrXPMbnffoBLfK7+S3SBOLKLHU/EsJ9dSysfFxRgBJtlHXOVAyrwHU
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c102a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WeUGynHAJ14ZQk6zy-QA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: krICvZCB42GiVChVVsjR_RgWaoaozYlI
X-Proofpoint-GUID: krICvZCB42GiVChVVsjR_RgWaoaozYlI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MSBTYWx0ZWRfXxK0Is0OfYjzc
 R1Ktl1zZEOtiRlGx8+dywvCFU56S818DCoRhr/Oq5nFd1llSEylFZqybaFqfRgy4YfV5X0Etjxm
 UYiwJhZLwfnj4qpjnUwbqi5DrLO6WOZ77W3KZjT5FDsp6NfPQV4o5CuJik6nftZ75vsKXkWUBnl
 lcaj5+wB7EQGo9q5A/bUxBbrXXBEX9Akeq9KARBup3zVpRVhkM9YJrHdwUGz1pDdeos0lUS4XVf
 d6DbbpzVmIro/YazxgduT0HIL/RegxjPpaZZKUc1+lDQcyAcvCx7ZnRnVgYcqw+RPjzaWqclpmZ
 kqOXZnYov1Ge9DMm6C8mfclma24ldrAjEXPheWv47RQh1ndsTEjCxPJ4O98pLEqiiGByRgr9sJv
 Yf+AaCEOonRCtkVU5x+ijPVIGcjjp3P6OjcoXxCP4NP9YgmuVySfc81f4WDoxhNNyyMcQ4LtzP8
 aNPz3QKMo0HJE+zwrkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190071

Add initial support for SoCCP on Qualcomm Kaanapali platform. SoC Control
Processor (SoCCP) is loaded by bootloader on Kaanapali. PAS loader will
check the state of the subsystem, and set the status "attached". As the
interrupts are redefined differently for Kaanapali SoCCP, list for the
interrupt properties are moved out of pas-common.

When we return fail in the rproc attach op, current remoteproc core cannot
handle it correctly for further recovery/firmware loading, which should be
generic problem shared across all remoteproc drivers that do attach and
not mandatory for normal bring up, a separate series is used for resolving
this:
https://lore.kernel.org/all/20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v6:
- remove ping-pong in the attach workflow - Bjorn
- fix handover_irq imbalance - Stephan
- add attaach callback to minidump ops table - Jie
- pick binding for Hawi SoCCP
- Link to v5: https://lore.kernel.org/r/20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com

Changes in v5:
- squash "qcom,smem-states" patch with the change changing pas-common
- drop the patch that set recovery_disabled
- remove the 5 seconds timeout in qcom_pas_attach and related logic
- patch rebase and add reviewed-by tag
- Link to v4: https://lore.kernel.org/all/20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com/

Changes in v4:
- drop adsp/cdsp binding that have been applied
- move interrupt list out of pas-common yaml
- add constraint for smem-states in each file
- "wake-ack" interrupt and "wakeup"/"sleep" smem state have been deprecated in design, drop these
- coding style fixup
- add a patch to disable recovery during rproc_add to make sure rproc_report_crash can be called correctly during qcom_pas_attach
- update the handling for irq_get_irqchip_state -ENODEV in attach path
- skip qcom_q6v5_unprepare if the state is RPROC_ATTACHED
- Link to v3: https://lore.kernel.org/all/20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com

Changes in v3:
- Drop Glymur ADSP/CDSP binding 
- Extend the "interrupts" and "interrupt-names" properties in the pas-common
- add missing IPCC_MPROC_SOCCP definition
- fix complie err caused by qcom_q6v5_wcss.c
- code clean up for late attach feature
- call rproc_report_crash() instead of set RPROC_CRASHED state
- fix q6v5.running and q6v5.handover_issued state handling
- if wait_for_completion_timeout return 0, set RPROC_OFFLINE for PAS loader
- Only ping the subsystem if ready_state is set
- Link to v2: https://lore.kernel.org/r/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com

Changes in v2:
- Drop MPSS change
- pick Glymur changes from https://lore.kernel.org/linux-arm-msm/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com
- Drop redundant adsp bindings - Dmitry
- Clarify Kaanapali CDSP compatible in commit msg - Krzysztof
- include pas-common.yaml in soccp yaml and extend the common part - Krzysztof
- Clear early_boot flag in the adsp stop callback - Dmitry
- Use .mbn in soccp driver node - Konrad
- Link to v1: https://lore.kernel.org/r/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com

---
Jingyi Wang (5):
      dt-bindings: remoteproc: qcom: cleanup qcom,adsp.yaml
      dt-bindings: remoteproc: qcom: move interrupts and interrupt-names list out of pas-common
      dt-bindings: remoteproc: qcom: Document pas for SoCCP on Kaanapali and Glymur platforms
      remoteproc: qcom: pas: Add late attach support for subsystems
      remoteproc: qcom_q6v5_pas: Add SoCCP node on Kaanapali

Mukesh Ojha (1):
      dt-bindings: remoteproc: qcom: Document pas for SoCCP on Hawi SoC

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  82 +++++------
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 155 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,milos-pas.yaml        |  26 +++-
 .../bindings/remoteproc/qcom,pas-common.yaml       |  22 +--
 .../bindings/remoteproc/qcom,qcs404-pas.yaml       |  22 ++-
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  22 ++-
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |  28 ++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml        |  24 +++-
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  28 ++++
 drivers/remoteproc/qcom_q6v5_pas.c                 |  76 ++++++++++
 16 files changed, 578 insertions(+), 75 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260518-knp-soccp-7b61bb26b11a

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

