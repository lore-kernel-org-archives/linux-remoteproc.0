Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C50931960B
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918503; cv=none; b=r55f1bRezeFN9DmJW80Y9XbdiSaGv3aUvFXujbTTt5HSMJTlRyO4aVWCkq+6UnW6yh+eLLyyuLIyMpufLSfJx7ye9rohbX4xHWzfTl959YuyEJmfMssBv0YOx8TQtdm5/MKySQrfjp7cBIu9WBJymJlcg5P/xN10bo82cAsSAf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918503; c=relaxed/simple;
	bh=imhsACg2tl4grlcYJZgwszEyfjp9N3dcHiBfOlNydnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=niFSLL7yX9nQ+ptOr3hl0+htL7Uw4EW2QrNNCOWU+cyea+7+7y7/78Cp2nPaOl2vm6vR1QVmkBJOWOIDvOIk4ddSrABzZ5dK2X1qtuOkXMvi9puExbwpnrcw5jZ73CuzRehUnPF23dELseyRnTCrqRLDtG51gSnUyu1+kaPS6hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W21WGo+D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCzJcag5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W21WGo+D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCzJcag5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGrAEw3157587
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uW+oEaf1UfNyA3EzunMlRWYM3eq+mUms5oV
	7OfOtFOE=; b=W21WGo+DnXMDFiETkAkQdeh0m/VBVcFsTtFcD/jkHywQId9FZhb
	QJaejLX37ZKdb/QHbQpiPjymbTL83L2QxWBX5dZBdp7+4SFlCsnJgVDl0/hhqhPO
	CAu8wW0MSArmhLuIkPgizbikri25RTIItGP37I9EViMBko4/cAB33+56XlMtJDZ5
	bcnHXt2ExwjGMNxQUSc3z8aYIUnyi4unkSo6ddvVhnXwgZO5VOX8/jBFI8cWYigm
	XvpVdPVF8pgC6HDBVd/Tsil0wc0EkQ35GKf+5R0qaq+IuKGE5IDwMyUR36lZkzzb
	7rzbtXDnlSvWgh9o7vg9ZnmWxw+WepXamnQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgh8ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso940948a12.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 11:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784918500; x=1785523300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uW+oEaf1UfNyA3EzunMlRWYM3eq+mUms5oV7OfOtFOE=;
        b=SCzJcag50g18DPZ4nePDdWA7Rn4ps02ngwpFn/EqOBhemH5qWhDAElGjiuj1dQHgTT
         yzI0UUu954pdZ4KTFk9fE2mth96h6PYLoxereE8Byh0ynSAIq/B5zoohuTyKzzZ5ht4o
         T6KtD+yI6+40w+9YkggISKs0ccxl+Ak1edsqDcOAc56GL0ceAyoDibnVy7Pv4pvljDF9
         pTIHQH43tDi2nsHy/hKJlS1l0PT8fOb//UAYUvDWO0PkMG2+i1VXIxeNgDUrtS6dTT+D
         ja/O+r8XxzSeyGjRTYRMgtmcz2CsnmE5TnFjp+issIcCgcW51OvFQDLKsxoe5VLlNG9l
         2GFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918500; x=1785523300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uW+oEaf1UfNyA3EzunMlRWYM3eq+mUms5oV7OfOtFOE=;
        b=j4AiX+uRqzAmd9JddXqJ5RFZqN3/607PzfkQhQ/+UDFgs+sjHpDEH4UiAWq1c1+nJ+
         cQXhziUkmBjrU3sT34W2MUavSp+rISzL0EPCLgHmsvjyva/1DDmqK6+fm0w+oliBxjaE
         JaZjtogsZhvpxxyxP3R7FUGG0QXAqn5BVGdlmnbG5C/w9sWSwJsb8esM2+YPwZek0x0p
         IA1oGOhW5EyIOaMGKbUYPtnZqV5DsFP2DLkXay1IPzua/foCFnS6x2kQzRDbDJ+h2/y8
         HIEdzGXtDuMkmpQ4NsaN5+DPaiGceW+J2GwROCmBmxK0tKS66UvMEjoYvfZLSXur2psB
         heYw==
X-Forwarded-Encrypted: i=1; AHgh+RqjS3g3U7hM/xux7BHwo+H/zlLDj5EFX3ahmmvTjUGOR2Vn8KusSut6dhmgGJ0RSinQfukLK9dYtxIsC+R5GGND@vger.kernel.org
X-Gm-Message-State: AOJu0YzOlTMchr0H2MKqoAvG613qFa2nrz9l1xa2Vd0ZbjuA4naSXjkY
	CIg4xSMQF19euuSnL1NyxnfcIowWuSOffPToE9aXY49X6Km9POT80gS88gXpiBU7iLchEVuRg+p
	Tum/zuup/daOBuD8PMAQJQJlcxbS6zzuc9TUEtk4++ggeWc5kNRBQSQRGvDsPVAxArGGmgYLx
X-Gm-Gg: AR+sD11ZlqB2ZterXyAizDdyOaa3zg9jsSpZGfpVuAaN2dva3b4cyFbRW8gUAEZwq9V
	u7BqPVnnNaluF/WYIZMArcIlRWRG1dePkAh9dXiFs/h0zQTBakxK8oxjVpChEZz3t0UFtwXmOm+
	hDWqAoBy2L5LhN6BOQgcINE83g6crUHp1erged2DC8sS2UPzANNaHdFMj+gWUx6GbFkUlyQl/BE
	0wSSKvB4zHJ/B1WN9wDVdR6ahbYSEmq6V6yWphyQmP/4QSxPWKw4ozy2onxi+aH/Z1b/mxgQkgw
	yGOdj30uOzC33kkNwMtuxKftzGD8VUH+tLjeqw2XG7RDvMcnsJrzHpdrZjXCmYMT1yTaKuno3ww
	MGyUTjR9q3oTWC1IbA4B5rbO1VnA=
X-Received: by 2002:a05:6a21:648b:b0:3c3:89cf:f43 with SMTP id adf61e73a8af0-3c44b040654mr9139483637.30.1784918500065;
        Fri, 24 Jul 2026 11:41:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:648b:b0:3c3:89cf:f43 with SMTP id adf61e73a8af0-3c44b040654mr9139455637.30.1784918499585;
        Fri, 24 Jul 2026 11:41:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5cb670sm2222283eec.31.2026.07.24.11.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:41:39 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Misc. RSC table changes
Date: Sat, 25 Jul 2026 00:11:27 +0530
Message-ID: <20260724184132.1878077-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JOMLdcKb c=1 sm=1 tr=0 ts=6a63b1e4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dZbOZ2KzAAAA:8 a=BsngTe4QfkoBfTB3_7UA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: P9_mkp5XXyExFOnmSuVvNpyG8iNwG6N_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2OCBTYWx0ZWRfX2/a8Z6sUWDGB
 fZIhxIMSMdleVsKkifiuuD+A+Hmt0+SYDLJa6qN6NTS6S1T3oPEU0obF75OkCVhyO4Jxn6Y+8la
 tU2BfcwSOJFyrxwvCxEuCFpf4zfT01o=
X-Proofpoint-GUID: P9_mkp5XXyExFOnmSuVvNpyG8iNwG6N_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2OCBTYWx0ZWRfX3OvPV3pX4O3s
 S+jyNR0ez1bRT/Bo4FyR5MdHFlCmnCNDIjBZwc+XPdn0HOPk1Mn8CVxp7Aq9eepnnATl7wbMoAy
 a/gTepukxgw/vZGTfavpfvb7bgyzX7QPGX5iqj6E4xyQmiLpYGvCk5Si4acG5KVgEo4n1MiyqOL
 i17Gw2DfBSkkq4oNa72i40ZBSTTyCwiF1F4Ifx0GD6GQ7hOOyb9H12QuykJ0TENc3kR5wQ4aiIW
 zprc2crmM2OB8BDYX0hgUHm3Y6Ca5Mmxx/VNAVtnDg1KIhO4PZPEylZBAVvmCKS9SNHwrch0AvB
 n66R8/op7jfKTRdH3S7DHuX3eXRZ9z9B3MhNf4O8lbLsMGjMbMB+ChsRWj4egGbwjd3aTAMiSuV
 V8MJiVF3ViZK7peg4NlGsvOwP9++5agElIEISn76HSyNqId1JNqqo+aUEDQ+XsLPVgRWrPI8t85
 3VrclotHqKS/0xCwAfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240168

Integrated multiple separate as one series.

1/5 was part of https://lore.kernel.org/lkml/20260506050107.1985033-6-mukesh.ojha@oss.qualcomm.com/

2/5 to 4/5 was here https://lore.kernel.org/lkml/20260611180550.2442641-1-mukesh.ojha@oss.qualcomm.com/

5/5 was reported as a part of https://lore.kernel.org/lkml/tencent_53F3322FDEB2E45D6412C427B8D1C6081407@qq.com/


Changes in v2:
 - Rebased it on next-20260723
 - Integrated multiple singleton into this series.

Mukesh Ojha (5):
  MAINTAINERS: add rsc_table.h to remoteproc entry
  remoteproc: fix coding style issues in remoteproc.h
  remoteproc: add SPDX-License-Identifier tag to remoteproc.h
  remoteproc: add SPDX-License-Identifier tag to rsc_table.h
  remoteproc: fix OOB read via signed offset in
    rsc_table_for_each_entry()

 MAINTAINERS                |  1 +
 include/linux/remoteproc.h | 10 +++++-----
 include/linux/rsc_table.h  | 18 ++++++++++++------
 3 files changed, 18 insertions(+), 11 deletions(-)

-- 
2.53.0

