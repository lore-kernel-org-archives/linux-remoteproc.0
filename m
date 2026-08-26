Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375DC3C10BB
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 10:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740096; cv=none; b=ixmGPx51rUwhPGcsLH2pg//eHakaRBFXJfO79qihFveFYgKdkKVi1M67UBFCl+AXMzb9jxaTmKjNzJcYF0zf0ot82InUOM/NBcYi/PZnptu/R9U6pGwhxcxnyKtSQ5nRL+BZjjgFyWTfOhHw7o4MbVdKBbpWKjoKerorAzH7XwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740096; c=relaxed/simple;
	bh=S2k3ZhNSQ/vLOZXXH+Z+7+1AZTJCES9Wlt1Lk5LN4Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VllSiufza+Z3Kh77ei17ghJJxZuUR7M9dJM8AtFOFbXIHw/sfZrqqEpXXglONyGnqdUH/WZ7MI1weRyvNHJixxzOyfTxBycRZm8Faj0rDgJeUFo4DS62ri0rUwdJdJNslkphKzEcUqr4kUwrrcxJFyEQ5Aq0UqyGQ8a/TH6cWAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6/gitVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OXR1/ioh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6/gitVG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OXR1/ioh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGdJg630844
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 10:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=97J5N0260/ppHZA5UMH73C5bAHn5Gr8e3Sb
	2NHrXZtM=; b=D6/gitVGtb7mpL83F+9JpDzq1hM7XGt0vcGyYVFFcZe+EhS363I
	Ao/R1azAjetnvAtLq3WaFRYLHum3reSuzKSWfXvBrhon+C341JfIY72ZuvE/NwTH
	5xOQs7rThOdDGw4QvZafwsxynbK4igUXRdBFrc5wzymniI1PfBpNNsVGi7vx5Apm
	Jx92WoNu+YG7sm3VefmW3exv32HgzkblynVPpZ+TtqOCVxf31mwfTMwGjSIwXCCb
	juYKrP00iT2Fgd5uD5bkbw68hlSUAWzEjMiTGODgRLcOQ98jU+RYfo4TgKXpWstz
	RQ40G1Inqq5B13HBlRgvuDjdX/h2zt8nBHQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k1nfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 10:28:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso1084790a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 03:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740094; x=1788344894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=97J5N0260/ppHZA5UMH73C5bAHn5Gr8e3Sb2NHrXZtM=;
        b=OXR1/iohNID6SwYSryqioPu+5K0i6fe3VPmEyAFPs9U9xIg1+JJnTJz4YcHgcDZBPY
         U/IUep2lt3BC0GRJqmLH/qB13Nke7Iap/X2Kmg6rIZidspV/M4AjC7asEt3ib1psY34z
         /61nNne6nknbOzjixlRtes+uPhKyI3CaPh4cMjsXZlpU26sn7ViPlZO1EP1+1RBedFxw
         P7Nbo+pY0nIMGYGKEDvxiVTpl1ERnJU0wxrdMmngxU3Z8/guDRr9eQ6qfxUsfQeHczdv
         9aYcHT3zGKElFzL5SuYGGzO6W16A4rWzdysg2xH3ZzuxNQyyfd2/0TFGyF7uje3Gzskl
         efxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740094; x=1788344894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=97J5N0260/ppHZA5UMH73C5bAHn5Gr8e3Sb2NHrXZtM=;
        b=DCHJLgc5C8zF2uqAkSOHf8aFHQd23sbYAE2/u1oEGBWcwPfrvTIBR487dzSt2OYzBs
         E4i37KGSdjOO7UuAT0JLyuKFBkh8aCxxijs2cKJ0dcdTgxSP8PXYQUMRXcmVFZa9BB0G
         yF5Yq+qY/6zYXAWURrABTdknMhUpj5n/1KsM1pC6tYJRUz8KXvyZHgE8OPWxL1Bib+3R
         WUEPZyi5i6sbyMREilo13HuYaQiy6/EuCgORUu6F9aND4+Z8VjPPAzCZ2TgluTXvAkPC
         tWQ4gBMtECfWSh4Tz5DdpN5gQOMwy/DOFaD2kkrJ7br823MHTFO059xAxsGa+zsADSiq
         AgRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0ou/3r+u4cgh5vRs7bk2mXyXzy+yR1URGTCa6o2n+8tzyaNrUO0Pk2JycUnVE7VOGF2+E45HaJNWw8Kdd7o+m@vger.kernel.org
X-Gm-Message-State: AFuF++mu0mSZr9WG075g5//UO0wRX6Mqm86llINB6ugBNOccOeIvwaQg
	xu0zuDMJ1HKY9YoSIpvLz3An3+e6Fa9U+sbOXO7HckGDSCihFlWa9AF3NasVHS0sHj3fSZofqgH
	6Ku998Pc3tcGKgwQzfM501FdX/1KavjCFUypfrIRpvudQZ9Z64BjI6/OpogCItdYVZPg58FgN
X-Gm-Gg: AR+sD113TU2aAt+Vfs8LKrrQkdWIqJQ3rZuNUIpWpUNv9rJuerV+qak4j4qwRm6aZ1b
	cLoraAmAABuD6SFYupONnjfRheOOPw+OoVVOvmLCx6pttKd3ydICWT8qgzNLysU1xYwgYE2EOYW
	uo30PLKH1+w8PLgID3bMwlqDZZ+LoaLK/u4dkdh+aG1cjGzLZmvemVgZlXoRnMUIohgmEWznsXD
	fEf/fVuEUDQ2x+0prunI77XtVwuMceFenOXlobpY/mr8W7jXT3NQxkNhcauugFBSHrMuE/CPrdk
	2LIZZpRnhBxUXaRMgNotF6yu1tDO/dQ0XMXClrTHDuzBXAPuISMAcamTsBN6mxZVvJW0xmyz2Pp
	b0k8BvhjiomaY4R72coK7M7IV06Qmj9Zy0t0zMFZjC6SJOUrDk24/mTkx2N2D
X-Received: by 2002:a05:6a21:a382:b0:3c8:f342:132c with SMTP id adf61e73a8af0-3cf83b22623mr11070435637.11.1787740093733;
        Wed, 26 Aug 2026 03:28:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:a382:b0:3c8:f342:132c with SMTP id adf61e73a8af0-3cf83b22623mr11070346637.11.1787740093281;
        Wed, 26 Aug 2026 03:28:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c291sm12935669eec.6.2026.08.26.03.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:28:12 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/4] Switch Nord CDSPs onto NMXC power domain
Date: Wed, 26 Aug 2026 18:27:42 +0800
Message-ID: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ebfbe cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KT9lYBbIbgBItZ0vMVcA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfXzterLS/fNuAj
 IwxF0WyV7o1dn3V5lZnNNtOrT/A+ud1XMcH0rWcH0rzlw6UcniVehLkga2pZk7+0P/zRFJhq28U
 wYDCbrQfEg/SYkDGB7cg1g35V/qzGNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfXzdY+Jt8rlqSY
 LmnhY9imFX4lQq2mtcw9SPoC5fur4g4bd8/5XnlikemJpIcL4T8ijvnktJ9K2aAJ7JK5uK59Gbd
 Z3zVT3RxY79PnnOC7T7o/rWDgTc1a4Qqj+BULrQRUXl/oKKri8rmDbzA5oB0iZpJRMzdWB9edEs
 xqc9o+9tFTkWZtliixhUny6oZ4f3e+AVXwJjs1weswB7u7mCTurd/BM6VtEiYXzlwK0ku04WjB5
 BCLfN5pSzLrJdhq5gRjZVZ+5713fvgzv+aVO5jcoxqQhqqJnnqQoeoYE7vBq4US+vp1zY6s5308
 YRw1kHmYoLhRGZkAfRdh9ttBs4/BdABGTB937LvMmAbd0CdZEY1AGaBknzSYIiT84RUgkWpSbCm
 pVkPsMRypfb3VI6hgFLcSksMKgKo7D+Xuut4LMtLJGWNqLfDBPahrqKUFggbsJQl4i3jzLlpHZo
 aHMzAyv4I61RAQ4GPzA==
X-Proofpoint-ORIG-GUID: q5SLwoUuoDHi4HG5CuWqp6IVnDR23f_U
X-Proofpoint-GUID: q5SLwoUuoDHi4HG5CuWqp6IVnDR23f_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

The Nord CDSP subsystems do not take their memory rail from the shared
MX rail like all other Qualcomm SoCs, but from a dedicated NMXC RPMh
resource. Nord's initial PAS support was merged with "mx" in the proxy
power domain list, which leaves CDSPs relying on other components to
vote on NMXC rail.

The first two pmdomain patches add the NMXC domain index and register
the nmxc.lvl resource in the Nord rpmhpd table. The other two remoteproc
patches correct the Nord PAS binding and driver to name "nmxc" instead of
"mx" for CDSPs, so that the right rail is held during PAS authentication
and boot.

The pmdomain and remoteproc changes can be applied independently -- only
the power domain name string changes on the remoteproc side, so there is
no build dependency between the two halves. I send them as one series to
demonstrate this is fixing "one problem". I can split if needed.

There is no ABI concern: no in-tree device tree references the Nord CDSPs
yet.

Anurag Pateriya (3):
  dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
  pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
  remoteproc: qcom: pas: Switch Nord CDSPs from MX to NMXC

Shawn Guo (1):
  dt-bindings: remoteproc: qcom,nord-pas: Switch CDSPs to NMXC rail

 .../bindings/remoteproc/qcom,nord-pas.yaml    | 28 +++++++++++--------
 drivers/pmdomain/qcom/rpmhpd.c                |  6 ++++
 drivers/remoteproc/qcom_q6v5_pas.c            |  8 +++---
 include/dt-bindings/power/qcom,rpmhpd.h       |  1 +
 4 files changed, 27 insertions(+), 16 deletions(-)

-- 
2.43.0

