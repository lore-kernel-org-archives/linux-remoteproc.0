Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59AD3876A9
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141771; cv=none; b=HmUnA6T67QO4SleS9u/0Wr/1uTaEEe8sz2isrpsrirMgaSfTA+NYmqyszTI1JTa7B4DzcfRDLR5bA2AWLqzMS3ZlWadFj3CzBxegW/+EINRv91z3NNBECmYUVHHq+p2GxvZucZYxkBdFQxrwrsFa1NuxRIHRLPx6o66I0GlykwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141771; c=relaxed/simple;
	bh=4kCGFUerd9XjwVun1nTUlYZGlcZap7SHC0pIvgPDfIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDQ5q0e9sYUBDLiKSn+jG9wqrOou3wVJ1FJ6dv/GbWJ2BcUeHN6F5Hd/rXnQd/Cs8oJIkx3RlWsDx5uR2ITRd+VjT3Yglvsbh9Z9IUkf50Ee/fhnoahj0sSigOB9pbPCwiO3uleuJUh6v2ywhwZLNeYTHgSd65RQEQ0D0FFXW0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXC5niV/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwSLXJtD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXC5niV/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwSLXJtD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A92T78246825
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	20kNf6AjJi8G3MZa9GHdnqNbJyccoW/mMnIokY0W6ck=; b=OXC5niV/J3he/RXV
	HBpr+nDe8/aemQ6+BeRrlf6BTUhi4MbRlVL+gBPWo27/X9tFluI9FqmHL7mPKE4o
	QzY9Xkbb/ZZXBpBnn1bYiEvPn1v87+aiP0rNiRGYdB6MeAwYwa0i0BBG+FXky8E2
	1XO6IYq9lwiKR4ucnNjiXu+/bnpBs7J9/BKn4s6v9B6ngMWo2xZD0FBjynyCChYi
	nGycch2+hmCt8a4PSTN4KrdJM5Cn3imNMfIgWfhPOvYvJM3ovG+Pa3YPu6BL+j90
	vBr65LbveEQwJ1qEqtdXJTnaGL96ziMc1GFm7/CONJmAx1UxJ/k8VGQRNtTY+4QT
	JF09fw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct88027vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:22:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd80c4965aso773065985a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 04:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141768; x=1773746568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20kNf6AjJi8G3MZa9GHdnqNbJyccoW/mMnIokY0W6ck=;
        b=JwSLXJtD/zhzT7dBJn6DJ7xFlwhuXr15lE2YGDO4K0nD9qVf/QhWimCnphy8RZwILE
         vZm9N9FCOmJkHVPSp5YcZo8Nq8QTQYLBPQJEYJyn0BdN5YWMXbYNnh1ZRrb4IaT64u0M
         Jgdo4TCQoB/XzYm6KG0y2GEU0IpwlfRszzIGR9vO/WhaBYtcI9JGe6n37txb499bJ2B2
         xRgv0apIn7d/QNM9CCCwzIR31hVYT9Ex4+Bg7954e21wIDROJeqNz5hf3gdmDk/6ACow
         gBpMZ5jLR5SPl3PMQbyMrn8NfqKMY4je0wLaVsDpDeBaE4XPY7aiu9NQfmnbr0/LDRUn
         j+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141768; x=1773746568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=20kNf6AjJi8G3MZa9GHdnqNbJyccoW/mMnIokY0W6ck=;
        b=tQZkIJnWFt4hn8FoBldgHsx6chYsGhqL5ZG2voHo6RubTIG4a2V4Iz2qEbgHOyMMhV
         pj1z1E20w2VAUUXpI39/PVw9HPzwy5sfRlJquWxlFbOzj7keg6k2XVK39bAeUew7Yxo0
         FOZvkwSI4/ddTVkC3iJ5qRKL+my5IIXfPy1iGRJymhegOf0CcW2wrKZ8FmrF6LmodNYu
         WfSES7iu8jtXoDJkLBht8JQKdKxVBp1XYxxrRNzTo4Xx7QHkLgwULFwgSkqNf3IY4uUG
         R3tXIXphbt7KCqn6YhDAoebZjI64p2hP4KQyBufhaHEJ4/WiTeF5NYp6hEF62VQ7D6a/
         ca3w==
X-Gm-Message-State: AOJu0Yx5FjXHYNNvziy9d5wcS2jCAbsWXHrT3ABCKlnjwJW+HphBtqRc
	hccxTKRUPK4hcnSuQzrp+NiYv8tRPLvji5YI8kVplpG11XQxhkLCo9fBKwXacnbz5OICUnDWAZk
	GcHT8u2gRmPGvbOjpC9mbvt5fmjL043TJ9tEYa+m1hOKr1yFekf2le0n2GDH0+FP40oY2AxOM
X-Gm-Gg: ATEYQzyLfNLglzynQrDt4uJ2vTUHeKV8/TuCLi8fuUFbY2FquezfYXWfNrwV0TPLcBV
	DME9xggzFcKCxZwGtTj7RP6yiYGS7+oJrN1FpxQDmFooZJYAmV043pqwmjJaFfTAJ9zFxS3mBb9
	ltGXcmhlCSdoxTptnChekHV7OD/Nr9LAYrefa49zx0M1pGX3ZR5GMq+6eiSVgNrvBLr7B133Vqm
	En314g9Y6y+4IJRAXZkVMagRfIAlK6YlNRi2VibEzmfWl1ZS8LpqeEI4eOmzhlZTNHR67ao7r+T
	hcE0qvKuEMSXpatNjbpg9b1dp2dTKgFnFtF1AWSOF/gOeV7fa8VNRNEPXNJdGXBJfolEyG4NZiL
	RXE0in3LYXoFhk+mg0BQlSy4kNSRXKMnMRkWwX/FWNRHo
X-Received: by 2002:a05:620a:6c0d:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cd93b5aa5fmr298331885a.10.1773141768254;
        Tue, 10 Mar 2026 04:22:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0d:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cd93b5aa5fmr298328485a.10.1773141767852;
        Tue, 10 Mar 2026 04:22:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:35 +0100
Subject: [PATCH v2 1/5] remoteproc: mtp_scp_ipi: Constify buffer passed to
 scp_ipi_send()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-1-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4kCGFUerd9XjwVun1nTUlYZGlcZap7SHC0pIvgPDfIc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/7+Tx0V/XsD3XPBcWawLv/UH+qV9b41Eo9mZ
 PhOc+cPamCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa/+/gAKCRDBN2bmhouD
 17siEACHdzjRE+5UXVUKCQjtmsjXeQ1XmAMVe185ibjnPxGTUlZVM7o6brVwHHjW5yQlxXVhnE9
 OiEkttDjUGuvEOi3/umPRm/llumQaTLU7hYxz72No2AU0ED+Dra5FJ2C54Uk3BL7ADo9RaGezym
 Dat5knmeLz+H/9HwFjkHVHS1qJwa29wO/X3O3eMBRaagrF/UTZm9zyU8+LVQOWkYDg9wezZWy/y
 uCrOBXO9Bk03hDhoWqnXO8IxB5dmgazfpQjflf0TgE874HJG7CnqMcHC998DsEtytNTLjByOW2n
 zo/3UDqiGLTbo5tLK0NU+dbbaAc+yXcF6uQ4IVh/T9Ox+CugW1eLlJWSU0wiPBEOwuQSyt/J0yh
 XoFLHbdnwJ4ShgTKT8qKV0VRZAsifHzQTtHT0IJWEqaxarseoCA/JZjEjVewt0/oaIiMmwaBGev
 c6s+HtAvQafDzV9b/w215PsFPi+NLjNqWZiRxcFKJJg2SodeJBjdDTnjQvjC04VuRdu7t8q+go4
 H2AdknxoAgj+yomEIbt25lm9IazxGEr33WRfKSjwR9gBiFUBBleKgpl4Fsuhf63WBAbgekWdtHm
 7wPD5hlMrxKgl/MeBE4iz7oJigEgFmEmwEWEnQ/cNPE3iq3tuUX34v/RNn2diRcHHFolSvLtOib
 9luiHafINMvBsOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX+2WUVhsYPg9J
 XhtGcPEbAF0kKdEmF1UI2gzXhrU8CKVT271cQUvyDQvBOhKwkPr4enNWXN4B0eUkseUOeLRko7g
 soqAwELDOIHbkReRtQwhIBAGiqSB6Cfj1eNocPaF+0P78s59F2Aj/IqhXfMhyKgaPIfF5WBYzCT
 gyAcqJ9W0fMjp0FvetzZWnojRIBnbMwRckAMbP+of30IkIsVZpqro6fe4q56XSrlpldqIkln8so
 Qq9JqoE3WvyEQAIdIwDSZXoZRbHDgsAKQCZ+4o7huccce8MybYXnx0gvEJYoXYNh9tKJYrruwnT
 Wxr/aU6Nwm+S+ItBkTa0OHPmLrt/8dqUmY5Rkevej5OMGwiYd8UbrlVacgMbEWhoppmcQjKbkpp
 cF/hoVwdAIWilJTHLdyd5S/QfaXTG1B4du/mgJP2k4/WSchzCmiy9ot40vGWFFKzC5sMBsZGacg
 QNAN37gdSd08V4Q8m9A==
X-Proofpoint-GUID: zeVnafL4-XQ3n-sQSdzWJ43reFZVf2iy
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afff09 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aY2cFw3b1D9xo--RORcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zeVnafL4-XQ3n-sQSdzWJ43reFZVf2iy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098

scp_ipi_send() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp_ipi.c   | 2 +-
 include/linux/remoteproc/mtk_scp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 7a37e273b3af..ee2f1121411f 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -156,7 +156,7 @@ EXPORT_SYMBOL_GPL(scp_ipi_unlock);
  *
  * Return: 0 if sending data successfully, -error on error.
  **/
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait)
 {
 	struct mtk_share_obj __iomem *send_obj = scp->send_buf;
diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
index 344ff41c22c7..4070537d6542 100644
--- a/include/linux/remoteproc/mtk_scp.h
+++ b/include/linux/remoteproc/mtk_scp.h
@@ -58,7 +58,7 @@ int scp_ipi_register(struct mtk_scp *scp, u32 id, scp_ipi_handler_t handler,
 		     void *priv);
 void scp_ipi_unregister(struct mtk_scp *scp, u32 id);
 
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait);
 
 unsigned int scp_get_vdec_hw_capa(struct mtk_scp *scp);

-- 
2.51.0

