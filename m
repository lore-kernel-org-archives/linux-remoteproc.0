Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869F923C4FD
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 Aug 2025 07:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754552608; cv=none; b=EDkyP4Pa2Z9GL+wVFdameL3sAK+1ASZOX85GlwVv193vigqd3yXKai3QjrdR1eqfl0TUQRY1BhrJn+mBstWPidkacd8LQEl8ZzEZBePVjbqt9IgE1bBbCGlWZVx70E+2daoRVopibxpD7W4+T6m71rMm0yLpyXmuw0gQdpKSe68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754552608; c=relaxed/simple;
	bh=aJf8dgH4dYz4FeXdIaB9wlD7Vgy/o7rrXh0zl/XsgWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I0Qz63KVW+BY5ZccRMEyuAv6EYh4W9u201WfG+YIncrbq4Aa2WM2MDQF49gQpU26gfScG6RlNAyb4oMRVsjXDnxsK/W2pakfJxBNl4XRUStIaMasoTma0gPp8fNaSZwKbaRNTi8ZKvycNtyJ3/zadaJj8B8v/pdBV611WIueNrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBdaCbm5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBdaCbm5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5776h5QZ032281
	for <linux-remoteproc@vger.kernel.org>; Thu, 7 Aug 2025 07:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SdrbuuxHkEeQigeY7KFKAwRwQZ1v06KXS3A
	qG305+AI=; b=nBdaCbm5x8LI4sQsiTXL6sdEItOKhtIwIR4NWJd9vFS8SIpVBAM
	N+RzVIvi2W0ZmCoak2/+cJO/0KH4qzIviQZcXra7qc69fbVc0UvuiCCKqItUzlJQ
	lvH2/THLqc1P9DInQse5YBUs7Mwn/9M+ee90lRJf0VOkfeP+F5mY47BPHZNsR1u0
	m11Eu2vVsTZN8DvVRq4qAkIz7AP3hjqbalATTEHHqiQJnU98uVpT8pTkaR359kTF
	bKnwshfhDwMFwaFbPMHaraW6/UMZYEpWB2g9JXAqKgvnJqp2UTW+JQqVG4C/HkD4
	KzwjHLWvZkAqXuwWUzb0VxGNfJcqkgaqWGQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2whma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 07 Aug 2025 07:43:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b321087b1cdso1091756a12.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Aug 2025 00:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754552604; x=1755157404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdrbuuxHkEeQigeY7KFKAwRwQZ1v06KXS3AqG305+AI=;
        b=eDHnnkcvc3A29xPvTj38GAMkSMxhwnWvRXqFtboQyk7UvBFrBQbNkQGcrv/BzqK/E8
         d8E90JW8JMqywIZykPzj6WpTndWsf+R5jUq5nkA0ukVFHzb5OgDrlPdW529OWgfXnh7A
         vModsliJGb4uCgUIzAZXLWM/wTXOsFBU9cPZDUhj1e/LHptvS8uGUDqOlhDeTAnS6FQ+
         TqWzMLwVVMw/J1cuL5De3EJxiq2qsCD5BFlI24jwEtRMusdPJMBbKL+OjBvmenRAGZbO
         3vN9VDnP9UzIxHAatpWBLUFyycb6FKe8np0xVOYM68vSvh4LivMRyU2jjAVDR5Agzw/v
         C3Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUQk0Pvi5a1fHDGylEBpO9otp20qRINoZvTd4qW3/PLCLwRJ2Ah841CdaDf6ZUkbyUDDjeKo3ojdxYEA225dlDB@vger.kernel.org
X-Gm-Message-State: AOJu0Yykf+nfF4JOulPFpAemUihyj0r6TqNm1oDOYSFFJttZjO4FmSeP
	/NkReRiPkQTfsKUI+l3eTNIYgZhGnYdPp+i2znawptPbQMveYLaeM4Bu2q0tgTQREmYse8cQu+s
	djW1eRLypAkR4CY303q2DTQ6luq/ROr8C79uzDKa2+n2dIJUoMvigSONS3xf+PZrc3XLoyI3u
X-Gm-Gg: ASbGncvBNuv8HXUgrRCj1OjS+YgnqXkpwUgQPnxOentyTGahggMMjuG1CVqnjwRrNwn
	9Dy/yLQWuFaPv7CPeUtJzhPJ40HZgrcxs5G+mZn8QAQReM8cPMJ2E/fC/TwxWZC1Msxaea9XTS8
	m030bQ18b/kpEeDHLP91GtM7Q7j1HiJN9fYrX+UVzm/z4KKBxYwzMDKUCsv5IAwf6DOEHKiZg6j
	bh6ztZDyhLm/Ea/bQv1haJwfrhCI+Q6IsZiGo/YjXNmYYrCoL7dR35s8tieAOKixL2MLLFHqaiV
	BK8pB7CUU10cF5wtkuGQ8inbrEOqPDaea8GIlN9VpPFcxpux2hKxfShJOGcjH4Siv8s=
X-Received: by 2002:a17:902:d2c2:b0:242:9bca:863f with SMTP id d9443c01a7336-2429f5bbc5fmr72030945ad.57.1754552604354;
        Thu, 07 Aug 2025 00:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHANSCJfj5IWevcX9I21BsXg/+4n+zB41jVKkCMdFHRNuqkAEqf/i9yKeqzmpgMCnYVJaYulg==
X-Received: by 2002:a17:902:d2c2:b0:242:9bca:863f with SMTP id d9443c01a7336-2429f5bbc5fmr72030435ad.57.1754552603705;
        Thu, 07 Aug 2025 00:43:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm178166395ad.39.2025.08.07.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 00:43:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [Patch v3 1/3] soc: qcom: mdt_loader: Remove unused parameter
Date: Thu,  7 Aug 2025 13:13:09 +0530
Message-ID: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=6894591d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qLU0tmo_xPokh9XVZMUA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: ZDZbWxHWkmNsaaxZT8d6BFkqJeCfplwR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfXwYon1924KBRB
 /R16wwtug4PJeGhQpngg0ede8+XW+WXm+CdJesv/McepXnIMH6F6SotT6f9eWZnA3jT8Nyf/mGF
 aWMh15xFpBs10sSoyC/a0Ry3NjkoL4yzXON2c9wsbE4Xwlbww1oh7lmvNbHKJ6TsyrvT1xy6kK8
 bruF0Z59sJuj6BOmSyx9/Qr20W8KZ31MSNoT7JkbUo1nye5g77JASkYq3rosp96IgTw10coekg4
 NmFwoboKDQWcb2EBov0Qhnx7PWbvSpYdtkI92oxkc1ESZQTTL6wc663zSx6Jc/Q+6UZcmSuiiC1
 Ez4Nl/1aJVkse75KvE45bobfy43gLw2ClA611ZPCM/KvPul0HdR0NS59+iQIRXsD6j7TigE1Ipy
 AtvA3eR6
X-Proofpoint-GUID: ZDZbWxHWkmNsaaxZT8d6BFkqJeCfplwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
 operations") move pas specific code from __qcom_mdt_load()
to a separate function qcom_mdt_pas_init() after which the
pas_init variable became unused in __qcom_mdt_load().

Remove pas_init argument from __qcom_mdt_load().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3: https://lore.kernel.org/lkml/20250806172531.1865088-2-mukesh.ojha@oss.qualcomm.com/
 - Because of the drop of 1/4 in earlier version this becomes first
   patch.

- Changes in v2:
 - Added R-b tag and its order in the series.

 drivers/soc/qcom/mdt_loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0ca268bdf1f8..dfd15d189087 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -333,7 +333,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			   const char *fw_name, int pas_id, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
-			   phys_addr_t *reloc_base, bool pas_init)
+			   phys_addr_t *reloc_base)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -459,7 +459,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		return ret;
 
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, true);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load);
 
@@ -482,7 +482,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  size_t mem_size, phys_addr_t *reloc_base)
 {
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, false);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
-- 
2.50.1

