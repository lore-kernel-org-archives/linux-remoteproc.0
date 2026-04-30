Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204F63AEF27
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542346; cv=none; b=eA5pyX7yYdy3xtau7X0ejJWOTLDyaboxQPY6NACgPxamPRxWssKa9jJz25MYuD5oLdf+Y6DaYVcCf4OgjbXX+ukWrMJbivWHMwdf9N8TVJtqHgY8QdEuczjuFtb/+AZHFPWwuoti8wGZKYtf09SWTOwcJgw+2hHqLeWcbwJeUEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542346; c=relaxed/simple;
	bh=MSsuyX7kuGk37NXM51O1GO4ffCLlI00kBU5NRA/D9vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lL+qDYB4c58lhmLt6mVOll7ZnRtwcSjedAutbhpVqYWUqEE8UtfCczVyNFluyrXkyrETGYMIFy8JU2J9kUPWgnWxE7RM+aJa2miKfA8QRzSfkUqp3ER1J1Uung1MEINHrC+cPPpLBFPOX2n21m54uLJRUGFT2vw2gnTfWJOUosY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mTxq+ay8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5pmcIjg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mTxq+ay8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5pmcIjg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U6lINR3886227
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/cAO1EL26dlRh42EDv7JJSDTJA1vZfPlEFwSCvRAApE=; b=mTxq+ay8uRBlPnPZ
	QteNsP5S6e5XuftAqHU7FpsGLYMxEDGH+KzPzfxyjVLgcjx/xD0fsxTu5r975mc3
	Il4AX+640fvAkkb+pm2fr7Di+n8ClgpPe5nTODV4RRClVZKBnBIJuoBr7xIKNnFI
	cYNlnxq/QLy36EEKX8bUf55UaB0IO7Se/FdezSSjd7PVN9b/bGUc+7kr2xALaFhM
	NhEZmsVUE7Btv7wQ03R7D0cOcV0aNkK2JbdItB9DRf95DYd7ThFoPmZGAFkOlxT3
	8KO+34FVaZzssuCkqbOjmEcl7+SiuK3Siqdn2IdwX9M3B/WC0NFdJs5LMJOooCtn
	/xP69Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dutmaj3fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 09:45:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f780a13c9so543366b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 02:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777542333; x=1778147133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cAO1EL26dlRh42EDv7JJSDTJA1vZfPlEFwSCvRAApE=;
        b=h5pmcIjge55y2ZLupUp9UI4bCsYUHYaE/PGE/rn97tNj71Hmgk81yj8b7oYU6FSx/9
         Uh0Q+cB6UJkkQm8OueGcf6Kkjv0ScTAnJo78YkQ2b7zwDvd5WBQBXXHmheD4NueLBYY5
         YCck1xYshPrCoPVljfJhhYQ8ttzeSPvMX5C7mosudAZ/gfcoUOpz3yfbcu2cGuH0ORsp
         QhY8yyEc6BF0jQW1auWt+oLTqEcQKShY7FaFM0hlEonVOGFT4ZZQVyhVjmsEiofsXZcA
         nMDzTiReVqFfS+DKyPhBdQx+138iZOgj+d7MNzBEb7ckn0cLBnEzkvXQXfrhVvb7jk7G
         nxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542333; x=1778147133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/cAO1EL26dlRh42EDv7JJSDTJA1vZfPlEFwSCvRAApE=;
        b=haHxpG5cdgKeMgkrntHS5FAciWJAzbzVmrZeStjA2ttbbwzlOUNLypQrLd9Up1pY+5
         JowpOC1/H8o5e8nx2C98qRRki89hHRi5I7kvdaYseyXikN2TDh4NLDXvgph5rF3WGGrH
         KfY3pjdhcuoHxtgTUjjZEcqulwkoA7XW3sKNtGpmZ0jXLVApeAXu0jo53nkBBuuRB1Yx
         tlLBr28abQlm1G1Urhjr20InhI0zIo1WD2om9sc7J8pJR/5tT3JHZkNhiINlrRehLeH2
         1MCUy53pjNHqn+wP/r0nNYGpT7C9Xp6/NmVaECzyHD/yvSMrPPguT576fs2d9xr3RxA2
         vaYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Q0EzAkBtxpYUzIFgT3ZUl0YaqfFbzH0fQ3UeL6dVZppxyJBiF8GE7ORdG5eBSdUnJTV09/FXrmnTwvbl6RYv7@vger.kernel.org
X-Gm-Message-State: AOJu0YwH7ckj88Gbz0mxmdbTwxo/ROF5Mhu9I3DFxC26LBRyxm06sNpO
	fzTZ0Qh9ysl1xLzXMI9eJtUjUcIEnZuOcetAsDd2c/CjX7/SUTL4ry01ukEHHnyJ0vMf3gmY+3B
	qe74mxyf0SC6m5VQnahbLrVhYZ5BTRbwaeMgTkbczmdTjorua7wxonaCbzV0l1kUwE/LbJGHO
X-Gm-Gg: AeBDievEJG76b6LL2EYYScfHdGLsnFVfLJTYR2vzS8N6otmPYnK6CSPwxGIOKp0vuQx
	0f891leQcA94tnJqkO4p6c3t/YoW1jgzO3OmUfihGYI/SOwvps3D97e1lS8zZt89mZWl+Q/3E5t
	aiGPnOzyYnLl0Wty+wsLPKHgerZKgJAC/E/cxoPj+7zdZDCClGwCIry99tNFM7TBGYpfh9Mfklo
	Zp6uudi1U+o6bJbpd0z4oa6lFwuC+eS94Pwvtb17iVwv0V/O/exReWDq2G33Kte+5+fFsyc0Wg9
	4YQex9CsiVvnlftBSrmXuvRfORhuVxtVHZQAagApDbtGkg03CqrGMu1mkB65j4CAKAAeFzIsIzF
	stLJiUdSw6IoArInAV3LmYO/EUIZFK+hKtRdcSKWU7W352EU0qYpKsAoEQ/l9sQ==
X-Received: by 2002:a05:6a00:9507:b0:82f:53f1:1937 with SMTP id d2e1a72fcca58-8350014fe66mr1805262b3a.27.1777542332653;
        Thu, 30 Apr 2026 02:45:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:9507:b0:82f:53f1:1937 with SMTP id d2e1a72fcca58-8350014fe66mr1805243b3a.27.1777542332202;
        Thu, 30 Apr 2026 02:45:32 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4718937b3a.48.2026.04.30.02.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:45:31 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 15:14:58 +0530
Subject: [PATCH 3/4] dt-bindings: mailbox: qcom: Add Shikra APCS compatible
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra_mailbox_and_rpm_changes-v1-3-61ad7c57ef27@oss.qualcomm.com>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777542312; l=1198;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=a/F71uL8BlYVHt5572G7k860jwl4RJiexWiY4A6ZqIc=;
 b=orZngModJ0uSGvNPHFHBZGxcX7qljzqhiGxI5xuHxsPuL0HDEW4CMBNWPSQCW8oDGHuynra4U
 F0XqjlMIetqAYOVHpTIqCuDMUhkFAaDOsXOU+GNfnRVySCFNOFHVxsI
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: 7lEAotK3oGfY0ZEeID1Tdw21c5eUTvMa
X-Proofpoint-GUID: 7lEAotK3oGfY0ZEeID1Tdw21c5eUTvMa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5NiBTYWx0ZWRfXwDbAvPf1p6Fu
 qjvLln6JA7zdbMoLYxnbEk3aP0AyWqksiEKukyzatPBUm2KZbuWHz7ARsYwX5JTPfJhh9cttK7S
 Qv/shC2Val9LG6GEv+M46GUzauGycV8dPjAUmAlB6mIDi+7LMNldLrrprqRc9T2Gvu+UBbpuanc
 JrtGbRgEOh4PJTO6OHL+aCfueK9oOSwW4Px5bXfSwiBu/vLmnUsmYj+4MtxnBBlp/9JfSdgl6EP
 gt9hpIdCmfoJ+hPBTO/5nOly2d5i7+CbEcjLIMaXdIPu/i58JCAhgnYOUsY1608Nr9YOcWlkzQX
 VfKRWEsSEVjm2dJWss9tG9cpR2YHkAKH6QU+qiSqBpuUn2nz0g3ZDycJvG8qL5D5ub8tLhm21+0
 zPh1pfrC0x8fN/tBP2dE0Wy0WDhPXIqwj4qX2Hr2uToZkd2E8cqTgTH/WSQk0rcTnxD86kEv01M
 RVi5tJsGCm/5EGdKIcQ==
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69f324c8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_6-gM951qmUW0LqwlVEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300096

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra APCS block.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index f40dc9048327298c6e78d4327bbd5f530a013604..f22729a493f2dbc8ec2d189db84f5435a80fede2 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -65,6 +65,7 @@ properties:
           - qcom,msm8996-apcs-hmss-global
           - qcom,qcm2290-apcs-hmss-global
           - qcom,sdm845-apss-shared
+          - qcom,shikra-apss-shared
 
   reg:
     maxItems: 1
@@ -238,6 +239,7 @@ allOf:
               - qcom,msm8996-apcs-hmss-global
               - qcom,qcm2290-apcs-hmss-global
               - qcom,sdm845-apss-shared
+              - qcom,shikra-apss-shared
     then:
       properties:
         clocks: false

-- 
2.34.1

