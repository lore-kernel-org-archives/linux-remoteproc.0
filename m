Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1AF2DC328
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Jan 2026 06:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459388; cv=none; b=ScN+b/34uEPYCcrHddkL2OQc3t3Pjrq6ABShcDbumznd6AnJyMeAjDjjzAkty3/b961sFnH5Z2Zyl88tyBnK2pXthWa2qc75mk0Ag+SELzi3/fzTw/5vk4twKv+S+AXvkAmkM173KVtTYn9aSMcczqFdWgiYf5JC/H8QvRbn/Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459388; c=relaxed/simple;
	bh=+aFW6EH9TJ0AOZQTB+GWz9NqX5sXiGDNwhsnV/Xf3jk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i5rurxWmpQZ1PnxU/qhpCeM5NCzFjrWtg9Qv/y74DCb+N4iwWk4T+/k0NkvSbMmHkJ6bgm8sMM9IZ2sl6veGtdCPsQ+SG13HQ7oHqVZOyyIGxE8m61Xv+ZwPgmy0W17snEMmXrcykAv3SQouCYD+Dta9SqfIS5Iwn+jD9kI24FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYEweG3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WqYmvxiQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYEweG3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WqYmvxiQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g2XA783439
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Jan 2026 06:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MrtIlupneZwT0y08AelsrV
	YE3mbEdWwQW/NPCjWwFkA=; b=dYEweG3Vb5ShsFhmAVh+82W5UK1TFT+bJumgfk
	7LKi7VW/viA1xHXgOH9z9iJq1HICK1cl4UU9mjJUoyom2YtGVkzHcmfR12ncomSW
	w5GcoJisy5tOZ7+URr5UPzWZAbupXzYJ9iE/bcpQudUFkYHWPGCghajsvZ5EJONZ
	ole8GYnftHZ2zxpNpbRcyMsxteBKjldJP+L2X9lqDyg3BDL6xWo1f00oMeiwd2BJ
	m2mOf3tOKPqp4C4RmDv/13KcEo7mp18Mt1YIL46URYMC9BxZyrJuz8MGGmkg1lTL
	JAs/wB4RKWeFCjeP7tZQCIqi4R70jdRbHbimYD6/kurTb//A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5jum6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Jan 2026 06:43:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ae32686ed0so4693002eec.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 22:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768459385; x=1769064185; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MrtIlupneZwT0y08AelsrVYE3mbEdWwQW/NPCjWwFkA=;
        b=WqYmvxiQH6Wy1u946iYl2nkdWrAMnqvgT4MCzabQWmQf3PZQyBlw8utlleBHtrA3J4
         CLtdA77wzbcXs9kUFnxFlgPCU7B5uofllGpJMnWmTgHl7pHnqnKoFGQ2ZHTjYH4K7Hvv
         T4qdfWr2cinXXqt4QU5mH5rl80iFIYijA1LJTyLu/06/ZSoXTzw8ltXZyQiA8NnwIcCH
         Aw3EWxBtuv7aeCEFvdSPYuqfOaiCTIeatBzl1FFoc4kl3pdvFozidmCCXy2nc+0PXXkn
         NzEgFMM1lqWKs4tih5KcMzPwsyIkgdobwN1I9BZWSlzp6ew9SvfkRTycoGa/APjo7WJN
         kusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459385; x=1769064185;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrtIlupneZwT0y08AelsrVYE3mbEdWwQW/NPCjWwFkA=;
        b=UEZibjiieT9ohSprAYXEJhA3kLdxOkWDmqAZ4Yh3ncNxbmVqp0A3tTFM3+bDWtkKrt
         IqntHDmQesBkdohDEVzolkZceCPFhtJquwi/HPToETJIUTglVU2rCWs9MGgR9FAs6ue1
         7sV3VwcUzlz5Xhm/r7ClpoTe8T50i8EJP1Fdu8U2wCKnEiFBVRNGrkip63pFIid7fGob
         N4Z1vbkw0cINkd9OezV92jt+SSsL/D+vCXTpVIGr89Crf9bKh/xnvQ/JSjerQAVCa2JC
         0MZx0W2ds2MTOM8RVd8yi6j9GZyEEke1Chv4/grlltMkEWcn1LP3s+uy+uUgAAzO65fa
         cJfg==
X-Forwarded-Encrypted: i=1; AJvYcCXlE2ZuOUifP9bo6JEd7WCkSt9nJhV6oOrtu35zJ6znd8Sw+Oxyo9qh5bWmZy10v1a2yg4I3/Q/dOh4mTTeQEHi@vger.kernel.org
X-Gm-Message-State: AOJu0YyXLJttKC23aKYeHWZn1msNsjRKCjbl5vV8qT/DRBOUhhQmdzbf
	8W9tXPFHjL12lcToERQKcfGbydQjt3ISFNnYdLfm+Shsfgqw9uYFbUfxn0L1hJkGUFJvFVaGFw0
	Yb2lqq3YtOMdDdDIN/nnHr28abJQgvQAzJZ9xVvenm6HGaTCzYENgrx0iQZst9BCTJvQExaKE
X-Gm-Gg: AY/fxX4aZ3lAA2CuG3OovQyiFOB1g8da7MHTGac2iiEbaJBnRZLErYT8rhjEio/OuAw
	MRTztDSItS77O/lb656hZNL0/+eKthCnurqCzW/do8L2zwPTIVKFdy74kNtzu9PkOjKNemPvkzi
	n8NRWcKNHg+sO3s2N0V2w1RM6RtBVdoCp+kM2KByjtHP/urzfCr4n3A+n7wQ3IkQhArD0yFjFS9
	GTl3kcfYZzxBSOYI03wb2Nsjv3OrZFdGlydUVElBPiNue7B6iGC5vhM09mUAqLahoBH4XEoJ385
	TmNkUwmcutPk3phpX4+7cHPwBnxu645yR+5m2CugVy+TfkJjfGN4O5r0xhTmhE+elA7F4tYPWg0
	+1GxngsJUYbftWd/Wvd0iZNQ2CCBYT0GXcxRwWIUsF/HFIpjYTbqcQf8TQqpR
X-Received: by 2002:a05:7301:6589:b0:2b0:3d03:37d4 with SMTP id 5a478bee46e88-2b486b7592bmr6935081eec.3.1768459385141;
        Wed, 14 Jan 2026 22:43:05 -0800 (PST)
X-Received: by 2002:a05:7301:6589:b0:2b0:3d03:37d4 with SMTP id 5a478bee46e88-2b486b7592bmr6935051eec.3.1768459384593;
        Wed, 14 Jan 2026 22:43:04 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1775fe27dsm18986471eec.29.2026.01.14.22.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:43:04 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add ADSP and CDSP support for Kaanapali SoC
Date: Wed, 14 Jan 2026 22:42:54 -0800
Message-Id: <20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6MaGkC/22OywrCMBBFf0WyNiUPUxpX/oe4mKRTG7RNTWpQS
 v/dtC4E6Wbgwr3nzEQiBoeRHHcTCZhcdL7P4bDfEdtCf0Xq6pyJYEJxISS99QMN2PkRh+AtbUo
 DkhkAVtYkj4aAjXutwPMlZwMRqQnQ23bBcMH1UmtdHH14r9rEl/LXwIT+NyRBGS1txbWWRgmEk
 4+xeDzhbn3XFfmQRZTkj7LxZ5KZogzTVaWsUqA2KPM8fwDDlJwMEAEAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768459382; l=2092;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=+aFW6EH9TJ0AOZQTB+GWz9NqX5sXiGDNwhsnV/Xf3jk=;
 b=rfZlxL+eGHQOPkyW984bYJlowSGdXedygxgCnbFIxoXxjQfH+MuD/fHxey50XhXASw3OW4dpc
 7lGvovuJhgyBs149Vhgt5ANe1tnZcsXlqkYvUfjoJlrKW5VE9/MiScK
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0MiBTYWx0ZWRfX5tPBBhGio1sW
 Y2I1OJxXr3eWThoTKdAFZWXc2B0Z9iCdsO5B9uoO1/zmzTC/10qDMvO/YsBMxXubI+PmNTldb7u
 ku+E/Q+FLUZt0UyLHK6bAulHvpQQbDPeuswFj/OU6VowoVVrZrDx5wC2xD1YweRfzxmxE4GmuXD
 1wAnayxr9Q3CGRpSchmYeGp+FKJSziKVKxshbAJGh6j8UZ5y4py/mxQTSbyHrRvbAGesPWixsgj
 CuMstatGLlyKuFZ/f0yaaVOb1X3hiTPX0U+JmwPHTd5+KXZW16yeE4l1GZ7Oh+P3kD0/5SIrY6U
 gE8Y2nQnFo54WS8xOxl0UrvEMTjZ2bq0yvFaeSKMRx/2DgqsYpnfA4wdzqNqZGdS4YRmx3IovvM
 I/ezjrbrdITmngcMSPLcIniXOMQxyrJH5u7JVPT9Gmf36s1F2Tt0UoPO47sxl/nhQCTu3rngaAm
 TBrtuhUuVB3NnlyJmGw==
X-Proofpoint-ORIG-GUID: _x2406hofYmzmk-y0VL5UsZKkzwqXbj2
X-Proofpoint-GUID: _x2406hofYmzmk-y0VL5UsZKkzwqXbj2
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=69688c7a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wiK5Jlmr689xq3VXDD8A:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150042

Add initial support for remoteprocs including ADSP and CDSP on Qualcomm
Kaanapali platform which are compatible with ealier Platforms with minor
difference.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v4:
- separate adsp/cdsp and soccp, pick adsp/cdsp in this series to unblock other feature
- fix node order
- add reviewed-by tag
- Link to v3: https://lore.kernel.org/r/20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com

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
Jingyi Wang (2):
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali ADSP
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali CDSP

 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251223-knp-remoteproc-f6ba30baa06d

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

