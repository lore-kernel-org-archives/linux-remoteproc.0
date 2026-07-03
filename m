Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1A33D3317
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 12:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081902; cv=none; b=BTsz56oxtxN2q7X/7JYEaUtEy8laLBIJm1igIeiUs9ce1pi7nRpkYFZcQamDQWLj/jhtr1UdwIa2fBhSodV5PgmKwczARIg4G8kmnMQPALO2JkVrRySEpv1QDHD6dKk7ofROTtIFqL/iZ/hiFm5by5QAwBfAAtASMxxNEEgu5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081902; c=relaxed/simple;
	bh=2P2pDH5QM5dOgk99KIQRb6As+6P1qsImfANC1dJZPD4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PxufKUw1F3Uct8TYbH7HzAjROowfEiGgMDnJ8xdy1b5JSOYZVQ7uns4HlSOodXCdYV6s4e/g7kgicIEgfInPF9Dga3rrggRtRzC7mPUprW+YwJL1I1Dl2iwjTNsScM5OvXrqSoaSre+JDdV8C8DaPii0o1BMK8IxUQx35qDug94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DohD7VqE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbUFyFGB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DohD7VqE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbUFyFGB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637Iqbk3195670
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 12:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dh3FdVNPM5hSi+POR8I76m
	MIYHZB2dDIHKfjjUCocxo=; b=DohD7VqEw0G+K9rwMBQ3zXrM4aG/1zLZU98xWq
	aFfJ7uzLVHu2m4DEP0M9Qr35UnmC9qIKYUecUPi6JHhjsw+yOHK/D/FTkFC1CEGa
	0L26XNKqNr2F3A99LEebfG934lsZgF+EirkO+m97OAJ+RaKDThbXk+5/jOXyeMEZ
	VdUgdGTfXhAOvfGWC1ftqzgBnxbTQzMYCio42YcdMZ6pur2AzAna/9qLlCt9H+gR
	SoaNSnWH6ZH17+xuE3auKVJtFbCP9LYrInZIBSHFloZ0wv1LyRzVXEcRDxSwLBTq
	FXF5ai/M/51fPV8WvpYYSOc3P47U7vf6/1gcuz/ucNZpE0bQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jys612-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 12:31:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381d039b797so26350a91.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783081898; x=1783686698; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dh3FdVNPM5hSi+POR8I76mMIYHZB2dDIHKfjjUCocxo=;
        b=bbUFyFGBlIzrUtPxHz+Cqf2m9TxnhJHu0+QFgdbG+2yrJyO2siasjlH8hdpy9uOgYk
         Jj1CapdnDV+ANGau5CI/yhFUrOf9SM50wNniVrWExdy+KJyndCMlgaH0DLxEPrjuO62n
         122iyUPlyx55ZLLehrcV8k7vJXjr/fLOlhX527wmyvXokQlJhGjDsoyd//rIlEr0bcm2
         1O86hyjUBQhfCo2CKPMaAmYlwrjo61LH2DhbTSzUm/xUkonEjj2SUP5SralQNKZPIiCA
         quk628oEjeWi3V3N/gfLdP6zZVZNaZxeSOb2JpPBNJ/7v67MOe7g9NTrVZfcnjJN24+G
         SHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081898; x=1783686698;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dh3FdVNPM5hSi+POR8I76mMIYHZB2dDIHKfjjUCocxo=;
        b=AQLaSZln+QkXT201cizJvWBnPnmXamVUt6cOHO2UBvKz9N014KChtVtki3nYq0a86l
         1JD1kk0UFpbJcnVm+oZK2vlG9SJhTm+FKCB3HV99iMegCcjFVcmpZGa3jM4ZRezrlorH
         lYbmRmMI4ukBWSRFpad4lHDts/UNqLzhsOMSMvJ797XKSASNg+TJoe1aTtUjOg43263C
         csxJb3gyiG1caBzXmiWqdVBLsf3SNF41x8JnFZaQcr/kMn8uR7DOgN7LZIOni0K14xGq
         0RQ6LiLOMauEWhTKg7qWCYoooWuwU+wxNL+QLem6Y1aYkoTIgl2AO5wAJtLBb8n6IFjQ
         YsNA==
X-Forwarded-Encrypted: i=1; AHgh+Rri3dYWetISkZoQUkeuhkWKrDEEcEe+fuVtbzGBLM0Ia9g4v+wjJiO59sTqn3jcDGsg4eULS7lImLWrQJS2pjuX@vger.kernel.org
X-Gm-Message-State: AOJu0YxEitaXcUpoaWdTcw7WMdVnMKC3rHjXmTHnuiOBv/An+lx5OqbE
	rqSylWRZlfDrthzKmghzU6J0f/3qkvaqLRxIB8o+q05R4C6QVJ0oa7+XpEAk0sCd+IT9I+Dae6I
	SrzGcUfGTEAeHLecnVRuA+X4pVFn/QWWsgEd4iPpQoM2qHkJBqiGkyMbW1mbh812CyhbPhFRV
X-Gm-Gg: AfdE7cl6BtJAhSLfLN5iCxzs/mU9M/RzNI3BN2/CIjMx5UQrVXzsrPhvdyk87OJCAcg
	cl5F6Em2ALqGx7J3d17z7OOpCW7p3aQYLx1FEP+zZQgmCl+nuSegSKQRJ2+0uTeoU1m+C8J3kZI
	o6I/qcQ/yH5CufulqICzXj9TzgLVoFAlDQSB0RoDLvW6mV0eaA+MvloM0oIQOOnOmdWfvtzcMol
	83H/otuNd6TOUAUgkIBz2RvyB3CfbfJAIMi86GNXkOnUT2qcyU1op2lruJvt1r2dJcwoYdB+jMt
	r3Rrr37xeAlk4fKHaYaHFO59AxElaXq50NnR6fC4X+RR54RD3X3eQGFGyYXK0Ab0Wn61cN5lRXm
	dPql3rkiFygIGO7nRhITO2LIepywUt25WSrwbDFY7Xm4X2DU+ic0OpgclQtZr
X-Received: by 2002:a17:90b:41:b0:372:b4a1:21d8 with SMTP id 98e67ed59e1d1-380aa0f43d6mr11329170a91.13.1783081897738;
        Fri, 03 Jul 2026 05:31:37 -0700 (PDT)
X-Received: by 2002:a17:90b:41:b0:372:b4a1:21d8 with SMTP id 98e67ed59e1d1-380aa0f43d6mr11329118a91.13.1783081897132;
        Fri, 03 Jul 2026 05:31:37 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd223esm20949375eec.21.2026.07.03.05.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:31:36 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v4 0/3] Add remoteproc PAS loader for SoCCP on Glymur DT
Date: Fri, 03 Jul 2026 05:31:10 -0700
Message-Id: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6rR2oC/yXMTQ5EQBBA4atIrXVSOn7nKmJBq6YmM0gXQsTdN
 Zbf4r0DhByTwCc4wNHKwuPgEYcBmL4eOlLceoNGnWKGWnW//b84JaMxk8ptgm0RZzbFCHwyObK
 8Pbuyei1L8yUz3w84zwt/3wKWcAAAAA==
X-Change-ID: 20260702-glymur-soccp-8f50d947f601
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783081896; l=3797;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=2P2pDH5QM5dOgk99KIQRb6As+6P1qsImfANC1dJZPD4=;
 b=f4vOhL8MpdPbB6P/DtrmC750S3iDUuZXP+DGPaMxQFVCc6tD/kMto5niKqhgwQxAAB9yvbWI6
 LZTLhy/VtagBDIzoS6s/OYJ88QJDwmN7nVtosPYmhGR70jE+WtNQkar
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX3HJD0KIumYWs
 +vc6o0o5nmeukELdQCrMMEDOi2+dpTUMeIO/kooSgrADWxjbWR+P0C2vmZqnGmDjpSr/ag51rXi
 U8cwnxy6+BViYwprf7dYUq/th2Gv7WmS6dz+7jLPyXpbqktvzWVEAqtQ/GxCB+JSarCINvee5Pr
 cdzqNpJJ8wLMWS9z/wLdhTiIyfi0Z8UgfGAr/v4WWsZixNFxPG2ZvFMJm9jxOrR19a/Rn3iF7BX
 4Ab27+eR1GdQpmu0Rt2HmnnpLUIGIJUJoEbdAK3izAbhO+GapGksukPPwtqjQfEi3f9Csr7pRM0
 Nje3gbZy5moK6qe2Y6NB+pQkSEyO1xchYZy5afKhPRTHphidtNclcaH1KVb/4j6/ENpVBCiPzri
 mWbyQEsD+7+pJWiyDRpDdv3/2ypYIT1zCo4jvefTH0YPsoMj/b8O6WZP4UiPBqp34PsdUB3khak
 95JVdAa/yEPpj4HeZmQ==
X-Proofpoint-GUID: vR2ZcSypw2Z3Os7ACtGA2F_usFki6MXu
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a47abaa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PyseVWS9GzFPcPOKfMgA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: vR2ZcSypw2Z3Os7ACtGA2F_usFki6MXu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX6o1THR1QR2Wt
 qvDVNmyPcXqcafiV8O4MblUR0/SovqohsBMQPEF2WHqXnr9d9r6Oz98pdPNzdQJ4ajiuAbaikcz
 Zpz5AF9N4lkbKky3bURRL2eZ2o/jNHg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030122

This series adds support for SoCCP on Qualcomm Glymur/Mahua platforms. It
introduces the needs_tzmem flag to force tzmem usage and subsequent SHM
bridge setup required when Linux runs at EL2 in the absence of Gunyah. We've
been currently relying on the iommu property being present for this, but for
remoteprocs that are already running like SoCCP the memory mappings are
already in place, and any attempt to recreate them would result in smmu faults
and a non-functional remoteproc. This change is required for SSR to work on
SoCCP on Glymur.

For SoCCP SSR verification we've raised two PR's in diag upstream:
https://github.com/linux-msm/diag/pull/23
https://github.com/linux-msm/diag/pull/24

SoCCP SSR on Glymur can be triggered using the following commands using diag:
  error fatal: send_data 75 37 03 152 00
  wdog bite: send_data 75 37 03 152 01
  Software exception (Null pointer): send_data 75 37 03 152 02
  software exception (div by 0): send_data 75 37 03 152 03

/ # send_data 75 37 03 152 03
75 37 3 152
/ # qcom_q6v5_pas d00000.remoteproc: fatal error received: EX:idle:0x0xa90cc050:PC=0xa8eb5d8c:LR=0xa8fe5b3a:CAUSE=0xb:REASON=0x4
 remoteproc remoteproc0: crash detected in soccp: type fatal error
 qcom_q6v5_pas d00000.remoteproc: Handover signaled, but it already happened
 remoteproc remoteproc0: handling crash #4 in soccp
 remoteproc remoteproc0: recovering soccp
 ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI write request: -104
 remoteproc remoteproc0: stopped remote processor soccp
 usb 3-1: USB disconnect, device number 3
 usb 5-1: USB disconnect, device number 2
 r8152-cfgselector 5-1.3: USB disconnect, device number 3
 qcom_q6v5_pas d00000.remoteproc: Handover signaled, but it already happened
 debugfs: 'pmic_glink.ucsi.0' already exists in 'ucsi'
 remoteproc remoteproc0: remote processor soccp is now up

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
Changes in v4:
  - dropped soccp from remoteproc node name
  - dropped status=disabled
  - added a new needs_tzmem flag in qcom_q6v5_pas platform driver, and added glymur_soccp_resource
    which uses the flag
  - dropped qcom,kaanapali-soccp-pas compatible, due to the kaanapali_soccp_resource not having the
    needs_tzmem flag enabled
  - fixed memory region mappings for glymur soccp
  - Link to v3: https://lore.kernel.org/lkml/20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com

Changes in v3:
  - dropped smp2p nodes which are already merged, and adsp and cdsp nodes
  - updated interrupts-extended (dropped  <&soccp_smp2p_in 10 IRQ_TYPE_EDGE_RISING>), interrupt-names
    (dropped wake-ack), smem-states (dropped <&soccp_smp2p_out 10>, <&soccp_smp2p_out 9>), and
    smem-state-names (dropped wakeup, sleep)
  - fixed IPCC names, GLYMUR_MPROC_SOCCP -> IPCC_MPROC_SOCCP
  - Link to v2: https://lore.kernel.org/lkml/20250925-v3_glymur_introduction-v2-24-8e1533a58d2d@oss.qualcomm.com/

Changes in v2:
  - None related to soccp
  - Link to v1: https://lore.kernel.org/r/20250925-v3_glymur_introduction-v1-0-5413a85117c6@oss.qualcomm.com

---
Ananthu C V (2):
      remoteproc: qcom: pas: add needs_tzmem flag to force shmbridge creation
      arm64: dts: qcom: fix SoCCP memory mappings for Glymur

Sibi Sankar (1):
      arm64: dts: qcom: add SoCCP DT node for Glymur

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 52 +++++++++++++++++++++++++++++---
 drivers/remoteproc/qcom_q6v5_pas.c       | 24 +++++++++++++--
 3 files changed, 77 insertions(+), 6 deletions(-)
---
base-commit: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
change-id: 20260702-glymur-soccp-8f50d947f601

Best regards,
--  
Ananthu C V <ananthu.cv@oss.qualcomm.com>

