Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5D2424D41
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 10:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889569; cv=none; b=tpblSJJYenSFUAORSeLYeu/Z3PRz57+CHExpZWW7KzUsf8qcEcJ7Qz/g+lt0wUZD68nKzrG7tW0AFcOJODOazBagd7eSe4OUVDsnH51BgHf/UHVfG/oYVemd8RJBq/5YxRTZAR0cVPi6K9T/8wB+5hVgI2Q6nuIOjsOdd9qB5uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889569; c=relaxed/simple;
	bh=hIzDAOSQ7K838svGBBJ9JCf98cNZaQNoCPCfM0iswxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ptt2rORMBeT6sCmG9/pqei8782u4F+bJvz9A/o6RfRsSiqvC2kqPdrmisxknH1pn8eCvln2mYcVXUqkiT1Iz3mHvescO/7SkPoayYWOXsnUNFxEBeSx4RieL8btvpO2vLVmq4HNI0vjgA1JlHSEwJ5V5yiPOCAUjwjKedP3vJ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=faw/uyNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZH7eFoR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="faw/uyNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZH7eFoR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADw8G2917015
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 10:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h6cnqFci2JIxJz7KmTSqiWOSZITGQx+tRol
	KDqfOfCg=; b=faw/uyNlvL4vwvTBqFW/8y1jnsrOOeBp8pMgAIfZueDX9M0XZIN
	YMeg4pHJAGvSZTMJYawI6uvhR72l7yaFXJ12dCRgWjbHkFurZnNFGHOH0ADj/mgT
	e+L6IeXxiiNpOX3j2hpoJiUgbTJJqyN3TXH/4ftWCbH3NPi/LC41usfI19tzLsqq
	N48O0iSiuGZohuxw7VqtMH7awE5kpg1n6UcjvNQ+9tkVRari1Ouo3CMX56QCQ4si
	dc3cYks0HAdWAl+YkL/h7/fyBgZDyK8jyE13snTjTobdAYdcS5tc82hmOYYzLRCL
	IBxYS+x1+bzR6K+1fkLsWWqP6XwzKBJyPww==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vksdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 10:39:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb733fc5024so473293a12.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 03:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889563; x=1785494363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6cnqFci2JIxJz7KmTSqiWOSZITGQx+tRolKDqfOfCg=;
        b=YZH7eFoRSqBaJQHWipQeCEkvURZW5q+zfDStIsV4w1as2anUjvZZNGqxBG7rWe8I6X
         h9IBjxjqcfdhamjY1+2aOJUK2RkZMkhVtarjbQ+kOJrc38Aqlu6HKfVt2B1MXpWlP9ja
         94I3bGWjocWvIAJDL6D9oqMNzZgOQTFiUlhNGV74qoI/kmr4FjM+3GF2ToynsDWn738o
         G9gm6iQ8mgl31erWtslCkoVlgfw0KMAnkVpYxxcMNzIlM3ub4McSmP4vlSDcwLvPeUiu
         DiLvDDmrYZLTqk60xwtEkNxJaT61J0pQu11PL1b4yA6BU1ZoemMk9eH4sCCjvDL4hjmh
         ozwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889563; x=1785494363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6cnqFci2JIxJz7KmTSqiWOSZITGQx+tRolKDqfOfCg=;
        b=l+d1bgwZGM16w1KaRpIpTYaHypUi1ASC2wL1Y0h9kXJcZtfkoRsZ+lpiHuGgKHhJDr
         Hhpn1yBJokfzLWiI4vlIBKll0l/6XE1hqg9bNRGvHqeIzhHQRK/IDW3RtG3nx4pByXB+
         /CRU5iqjJw63HQn5achra7I1+CdbvC2GLrAHvz/Y6fFEQ5UbQDBb3qa+2XLPGj8MEWlw
         Xoj5EC4k6AMcoZY/5vVLvuo2+v/k+UJaMDgu+nBfWo7hhEfL1g/7z8ir2/MXnvW514Bj
         VGSdnoP55OTc+P0DXOH1A8EmUHbRBhYHpsJL5silnqyNtgdc81v6/DbIcBNbLmflcq7B
         Pb6w==
X-Forwarded-Encrypted: i=1; AHgh+RoeGlVoPTq1iK+1h3/hEJWmdNLRplCzn8KV+HO/glAeUUoB2KXzKo6ZmNTNvb+mXWynzesOrShI2OXcrymuBzaq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ND5ZlLTImpv+u2wBT4XWZrBiwe61KW6HFxRd9t44bKtlqKCX
	b5IEbqSpLSkhroU6RFEj6SV8m63X5FrQ5mkPwW6j6eJeX58KkAF7tPKe99w4dI90WH29Zif5lMu
	Np2Vw8jE+3knBk14Nn8FsP7CUi4E68bBU0PcoVcrLW3R1ZD26fNt3IObv42jxQBF7OCYl9zWw
X-Gm-Gg: AR+sD11dlF9mfP4rUd+BSaozB9xRvQhsHTqISBKH6go9j2zt4unO+RI5VLdDVkdDX6E
	KE9A8fUPe8AdJCGJMsrLQk30JH6y8FNRWvWeldB+64HEJKk+v0J1OrZZ/B8nBGDDc5GFfFZUl3w
	HUJccTozaTWI1y2zIMqdIqmOeej2mj22LoV+toJd1dWdTMmbY1Mkuu+T3UUAmGV14WMwMP6av06
	9puytGk/rTEVCS5IO1xrmIwI6l9Fw3LClUtZfUjKBaLOXcpN+8tD2OjPRVK8iyGtKTZQpeMLtiz
	wjqIfartI3W7C4YOWvBTR/qOc3y1GHxKre1CHz9c+va34uyC5RkVpFzOHj3exH6acTfjTtiXjNi
	SnKu1J5mbLKqFAqFXUnwspwdry+MY84mXR09ZBiDIEuUuL5nJzX4gDJfND6s9
X-Received: by 2002:a05:6a21:391:b0:3c4:34db:9fbb with SMTP id adf61e73a8af0-3c44b21d7b5mr7507734637.57.1784889563167;
        Fri, 24 Jul 2026 03:39:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:391:b0:3c4:34db:9fbb with SMTP id adf61e73a8af0-3c44b21d7b5mr7507707637.57.1784889562765;
        Fri, 24 Jul 2026 03:39:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm22495290c88.7.2026.07.24.03.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:39:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add ADSP and CDSP support for Nord SoC
Date: Fri, 24 Jul 2026 18:38:45 +0800
Message-ID: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX1QX9K89Ouq0h
 KsoziPTo3lYL1C5wYgMNsookYz0xWi7F2HnF1YjSJ8zCZxkXbDGTbTgfaS3wIiMxKzSO3HY2T0q
 hyjZZ+Sq3DpUhKdzcoLyvThee8oI23k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX+ScABooTYLgh
 7oHLULHWOcG0yL//VLGDkQceonS46FLLpsgGDPIdI/nxo2S/SsAPBAsjtPluQXhN6tSAb6biedm
 aT5CCZo0aF2yS+Avc/9ff1xL0w2IbeYlQ2uuHvqaIohtYXCEj6sIOLrSpfO3EmK3aInUWuBYFN+
 OcQwMIM7luIzWot3LVhwpKEi5AAiWpdjBD9d+yd5+AUCtPZ3bjnkALky4kqrv6Nw+sCZbMecGii
 y5UFRFLTBHlJMXXB10Iw+Islx1DXKPZtqw42lYSOqub+ZAqKr7E+JKAQD3krpPwTaLqRVuW6Biv
 qWbv9zQag+TMVRj+M761rEwOGwAi17gFg+7jKam495Vnm0XaF7sP4FzqV1WOE3EnwhXNX7H5V3Z
 /MO/u9ElYKi1q4iajlZGyg4tRwlyveOc1IP0khmJb6PWiyxnXhx3sY/IoNsVX09IISNxoyQQpZL
 a6hmD8EaDE+jiMW1bmA==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a6340dc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YTZeY_j4NDz4IKi_2jwA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: nja2JGJdeKeQkJtm3pZJDf7kWwHgJ6XN
X-Proofpoint-ORIG-GUID: nja2JGJdeKeQkJtm3pZJDf7kWwHgJ6XN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240096

The series documents AOSS side channel, adds ADSP (HPASS DSP) and
4 CDSPs support for Nord SoC.

Nord SoC actually have 3 ADSPs. This series only enables ADSP0 which
can work independently. The rest two instances have dependencies on
ADSP0 regarding start/stop and SSR. And remoteproc framework doesn't
seem to support such "slave" instances yet.

Changes for v2:
- Create a new qcom,nord-pas.yaml to cover Nord ADSP and CDSP
- Include CDSPs support into the series
- Link to v1: https://lore.kernel.org/all/20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com/


Shawn Guo (3):
  dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
  dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
  remoteproc: qcom: pas: Add Nord ADSP and CDSP support

 .../bindings/remoteproc/qcom,nord-pas.yaml    | 167 ++++++++++++++++++
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c            | 110 ++++++++++++
 3 files changed, 278 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml

-- 
2.43.0

