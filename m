Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA3C3D7D74
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2026 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419185; cv=none; b=YdyTFkfoZM0NufxodBgmEgerRaQ9UQNh1mWD+ngAnFPxd2GKszyRRWgYlCVCBjJfrkJill56n8vGTre9nORwHVxDFFZrgD/93Zjm4P77B2Htn/yXu+gre/Nw9SyiREE9Y6cnw1N/SnRatvupNNGBEGE8+5wHuywGwx4DZboDB2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419185; c=relaxed/simple;
	bh=TU7emUYnOIccgBfK79pdZFOaCbcc5EGUoSDSzUTWuMg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kCK0B9m/RXljxyjndkdH8pftu6vDqINAWZQfmT3Kzlk/1/pHpKWfVVhOZqEdgE1YvTO5jhKmDk3sALRpGoqieGDB3kZbtpchbW3Qjs2cIuxtO10sdMzEAC7nWpO/5u9ZzL2F0QDnJbKTKUNAUhW03IE6yXfiJBDnQQ3HBWeRyhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyFVSw0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KI+PgJx5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyFVSw0v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KI+PgJx5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DwSG3070370
	for <linux-remoteproc@vger.kernel.org>; Tue, 7 Jul 2026 10:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VxbtuvwpRUoGvdivWcnmVF
	8rXncXc4QE+jBcEPyZvS4=; b=KyFVSw0v9tk1MPz429pyJWIcZ59O1REBmp/Skb
	5WvKlzrPhRQxfggRGN8wOvRHfxPwbMsV64PTs2ODF6ld/biu51IZRqz33GdXBN6N
	uAZEYZ9SHOQa/SDRrHzuYznujKt0uwnO9KYaRXsUJxOzn606CVrCV1cCmTiaP1I+
	tOL1QyRCTGfpoWoq2dPZWOTXhf+7rmclxJ308bmGnP768cUaOBQmCRDwuYZA415E
	ipmHkgsbBGZCv4Dhp5nhpnRm+n5uMMGP9uRO/tI0DjZTYPNx7hOKtebay/0bb7gn
	WISAeVxs3QGepTAfx9gZCE72cNaptLF4jrmJuMG6NkbVZ/rg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8hf41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 10:13:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so6741524a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419183; x=1784023983; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VxbtuvwpRUoGvdivWcnmVF8rXncXc4QE+jBcEPyZvS4=;
        b=KI+PgJx5688Fl82SSHtwEXN40Yx9fPtfOlkcZm9I8RbOKtok6AKKsCcE3CX6k4XUnx
         U9X+tKS8h/xeCGDJHElSbbD7NMlRVsrVK4r04AUCLKb3fo46+0KFwg2ocdJlV98Ow7qS
         h964KY/CM5gbyWEUYU8hx5EwgZoPbmiREgc9qQajmUaY4Sj4RhB7N2gE01Ensp3yi6iq
         Jf9WtTBt7g6B5ZlP1d3SKPLVOSG/zwGHSLT6swShkTFdLK4V7xPCNyaPmicFGKvUOz/o
         o4HgU1kpnPniUpVwcxvT1YIH+03zzjKzzXvlrZFRDsL4756LH9bsGBqjYsy7++zURry8
         EaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419183; x=1784023983;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxbtuvwpRUoGvdivWcnmVF8rXncXc4QE+jBcEPyZvS4=;
        b=p04CCsBkS5YbgnXcIFzJMLrhdAFJxU1WHc5aFaJOwWtPj2n8MNq/pQIB0IRQ4nCfM3
         YCcb0o5s7kyoZSF7L0e6r92Rs1zmolU563HuAcuBI6LjCwF3YW2QNThBOI2Ig9rkA2QA
         08HVwHAx0EuEcqbhrjrHR3ICFqAjZnCSPtIIotLB9KBMHuX+GOQj5zdTeYpEsmm7KEse
         8amHAH/YoFbEpTCImQrWKseg/G7er6JVQ5NKoM619sb0Q6XlWuNWjfJgE9XSlP82Ci6h
         1z0DyFMvBS01nCOb1cool8GUFRgZZ47VF+6X7hiKgRtl5VbVJzgrgIDR3cLUXtNicVHO
         VLEg==
X-Forwarded-Encrypted: i=1; AHgh+RoGn7OKJhvoiQ+EXtkg6ZeaukGiCkN5Zytn+YdRAgXBgNy1lQCLU4sKmJ+x4pvK0izfc5jkhd3nZR1Y1SHERh2A@vger.kernel.org
X-Gm-Message-State: AOJu0YwEMgY+YlqY0IG+Auo4orgAfU2qYMxDPt9f38RNj6o+lxmpT5EK
	Es4DVQKYjAZ230PDPOFUNDreYo+4t/TxCzdUXc/jAXYA9fr6Gqy8X3/3RcloI2k1ASDmctRcn7K
	7x0tiw7i9W974ZPGYXK8NBFQEMUykHhTRGFAkOYRvxRuHzCaoYdsPGpaR/xekSnhi6X2BSJMhyB
	fjQUp+
X-Gm-Gg: AfdE7cliWUL084cdNIfE8Bq2rydnQ6sFhqIvSqrbfyuXG5CFHm4iOq2Z27i0lOsJwmW
	/IGtVM+MsK/dLGRvHWqDvfezIn6p1tkyubH8zWsnsHHiyyP5IsAO7qrGGXqB52D9FtRcaES1SJ+
	8i+atNYHL5H243vpduG1s/FzHaEjb80ffqacl0WpiBwnK08I3yvl3kQd7KuhsI6vv0WNs5z/Hk4
	gfAJfmV04pfBWYtDOAUoQgIxHUv0ATfkem002/uKBQqSHZIIMy3TMKiETN3XIXB8PWI0kwfyFgp
	X58jw/g7dHPEVw1xDpOsnR3mQMsVClbbuiB7p9h7s52PxswXsLb0Kwaqj3mxuxqF3mxoKuvojPO
	lrt92s2eaUgFOCr12ZIgxB2asRZsi4u2xaq66nh2h6IwCQMXY0NlvOoWY+dtn
X-Received: by 2002:a05:6a21:e587:b0:3bd:203b:982b with SMTP id adf61e73a8af0-3c08edc9729mr5628893637.16.1783419182800;
        Tue, 07 Jul 2026 03:13:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:e587:b0:3bd:203b:982b with SMTP id adf61e73a8af0-3c08edc9729mr5628868637.16.1783419182252;
        Tue, 07 Jul 2026 03:13:02 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8665sm7098929c88.10.2026.07.07.03.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:13:01 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add remoteproc PAS loader for SoCCP on Glymur DT
Date: Tue, 07 Jul 2026 03:12:43 -0700
Message-Id: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABvRTGoC/1WNwQ6CMBBEf4Xs2ZJaCqgn/8NwgGWBGqDYBSIh/
 LsF48HLJC+ZebMCkzPEcAtWcDQbNrb3EJ8CwCbvaxKm9AxKqkSmUom6XbrJCbaIg7hUsSyvOq0
 SeQY/GRxV5n3oHtmXeSqehOPu2BuN4dG65fib9d77qaN/9ayFFEUqE9R4LSJSd8scvqa8Rdt1o
 Q/Itm37AHKcLzjBAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783419181; l=4007;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=TU7emUYnOIccgBfK79pdZFOaCbcc5EGUoSDSzUTWuMg=;
 b=RalaVswj47OU3zbODi+lYkATnKxEsrWn7lIWLXW4K2yXK4JaMkVZRjWu3TSC06fGglFB7aOte
 APKLXvtCAqaA3OyJJQyG7Bd2X5/6Jb3vMmDTgTBYgD6y8mk4geNjYF3
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfXwAva8AqE0ukg
 4k5iLZ1uRWfIorVHqR4e+RHxywhvmMlyXzJQSzoFZXtWDjvhF6ExSZm7tnibokFUtnUSE5CUQCH
 JGJtc5ix3srI2WMDJ4Et95USRVrfa11kzRhN1g1qvEsWW1AGzRxSYRF2UXPAJ5c2ik9jvPg2wIy
 pL6jABtlES/XoKT9wgoUTObkkrUl0TMEpnz+2tDmvQBiQPj0eqWP4ZAJqxL6Oti2zYgqxjir52t
 N+lGcej7UyH9IL2OLWqjuqYWbBKfnMUSu7vILignpdFpiXp8Un9G8jFIDcdnyJ8cYQ3tmkU/5Ps
 ywLevtnqlTbo1eU4zAuZ9O8WHH7QPu11qygQdBPMuPeAeTNZUkoBjP6/MoXPht4mvCebCwcQHnn
 B56qBjRAcLiRoGDjdUZc8JQyGNLJhSv9nXJsM856oQtaGvQFi7n+MlcQGncrwGgm3qWoa/Lfl0f
 a9z5e/B+eJ5Bk0fdCaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX4BhkCMH/NcaI
 fY+gohYmmn+UhGQK6NAcT4fpof+PpzsLH3GNV1mjN4dNmaekzQ5YJDpixyXpFCG5fXKofdHgXGB
 3riqbTKL6AHs89CAVgoeQTgqCvduFX4=
X-Proofpoint-GUID: dlFBqDBGJ73z2zBI7EV_KR-flnyjpFPw
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cd12f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=PyseVWS9GzFPcPOKfMgA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: dlFBqDBGJ73z2zBI7EV_KR-flnyjpFPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070099

The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
This series add the nodes required to enable SoCCP on Glymur/Mahua SoCs.

It also introduces the needs_tzmem flag which would cover for certain edge
cases by serving as an alternate trigger to the PAS helpers to ensure that
SHM bridge is established on SoCs running non-Gunyah based Hypervisors. This
change is required for SSR to work on SoCCP on Glymur.

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
Changes in v5:
- sorted soccp memory regions in ascending order
- readded qcom,kaanapali-soccp-pas compatible as fallback
- updated commit messages
- Link to v4: https://patch.msgid.link/20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com

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
      remoteproc: qcom: pas: add needs_tzmem flag to trigger shmbridge creation
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

