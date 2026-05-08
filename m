Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6884837C920
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2026 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224836; cv=none; b=M6cWEnZo0Xujaf5DHYbQZKdZU/Z1FG4qDNHUX4vtHJtvdhfmtt5DDQa99G5MCt7SOXKuJ53emGE3OENmXTFEbfUtRdj4zbxcLe5Dfn+1ZaAOWAn9QrmxFbSQQ0Rv3svE1sPV/4umjWIOjGYJBUI+DSJ5K79FCcp5/4wFvC90GeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224836; c=relaxed/simple;
	bh=vcmzycQO+v5rtn0fILDKSKDqMmq9F3JiK93nKYTWSPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNL2LRYyoSfydmMDI194od1Dyi714l4aRpTHeLU/gWRf1TtS0o1Sr9f88HZiWMEADbHS4GW0RBBRvvDi44ziktlASaTv9CfCaq0QLFXwDMzyHM/7Ad+DcjWbd33peYzp/tnUe/fr4VHHoGT5y1fseBff+0pAMa56I/DKzWkOKcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxB9+MJl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kC08qaK1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxB9+MJl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kC08qaK1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648508pO2183134
	for <linux-remoteproc@vger.kernel.org>; Fri, 8 May 2026 07:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=; b=QxB9+MJljPVnawdG
	M/+h4hAmLTG4cOd9pwv4H+jiRNAQsDgZpMctJ/KAp3wcFmpPZp6QZTCfWBP3KM1C
	2E6Fkz6Uiyc+lVz7veLs9lYp/kDnC6XEIBvK55eCulVfSGG5oY+aEgTVsqyhBv7e
	Gx7spt8ehYmWnP/rpRiJSLP3nstDTCn2wqGYyvCBN+9eO7uCbdFG8xO4OEstb60X
	54QV2d7ThLR3tv9S335XoTYcyqLgmtp91C3yo15CyZ7ykpRejbQf2sAdvSxdA0aa
	yd9CQcYlCH9Q5Lnil95GmQ5oL4caF1MrF5u/fAaeW1sErwWUqLfSfKyH7n0X100b
	hgCL0g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pya6yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 07:20:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso1109035b3a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 00:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224831; x=1778829631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=;
        b=kC08qaK11GVt6Odi0iwFikWRSatymGBdYx9DXcjo30S5EwbmmVHlorvWPjjTaTG245
         7F18IckJ9YOWsGLXoDtWyMuA19Ve7HEAVw1WqWAFPEjMG+o9UV6WA+z56/fhWyuFcgWs
         VsXbVQ5eFRicNNODw1BKuuyXMaM8JOmKgfVimMo9cV0x2824FAEYm/qZV11QKdGLCIte
         9jlVYpndjR8h8EQIXifVUb557heRiw2g6eAscsvmZVcwqehq23wykQ1/4CNsPJA2gKj4
         lZqdeYQmloUZpaFi3oiFc14snU7wNCyutG89uAwDw2Hhwv/G4bMQP/gXbMNgXNEYBvz8
         pKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224831; x=1778829631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EpBiQeCF/UatV61wkP3xdgpGyKhTq/2Y2paFFNVQZnU=;
        b=ZIJJuu9AQfWT+w3g6H5k6geh3wSYImP58LPSq7GQitkQXo5gE/qvdE+b8Av53dPaxe
         w35IevEB6LMNTDP2V+nNR+EE2+Qs/OPdOhuoT2ayjIx0dHz9XfvSAXGBuFtjdieTNV3L
         MV64llAMqDElUDigWPszJ3q8hLoXOnsKSlMC1ohRbFdfZ8o30RbkKUSYXZ7AqR/6LuRR
         FVHhyh2Qg5CaTjvAsTaSxlGTxk0FSc05GCI9iL6yk3A/IFfAXglhiwmUAYFOoNsXeUL1
         g1SvuJxOxdjXVivWeXmrozXsj3QJTL1kHkC+TjLMaFBn4Rj4YdPLPKZB524cnLU8gMl3
         JQdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/egrt4WuNoor3L7bvCuHHGedkrk2MMIwCdTQtqttu8qmikWe1U0go5K+pcuvo9IaiUgfecEwW7ztl9zdvq0aiI@vger.kernel.org
X-Gm-Message-State: AOJu0YzvXMZAQf9hl3ujc0T2EzGcGQ67eUidvmRdeawY2prYhXChq0B3
	PKffAl0O6ByJmLkx9TwHpmbTRTAKhH0OJSDh0V4rO+E/401ZDm58WAdYRMeSVgO95i2Bv6JcUc0
	gT4CQD2S0dqBN8fYSOzMVJQD/FNfRZxD9aJHZDqvbnZFyqtANo7ecFXeCJW60+bd7F5tAyO1G
X-Gm-Gg: AeBDieuDPm1+cI1jDq7SOlDiKeSw8vCHPeRP1CqoG8/Dqdk3/lgsVuto2OPw7V5+8YS
	WujOeqh/ujubyEiv3EI610S+WOrqqk8HP5tJ/RiepjKfRP5a3SsVIbGI0qhYrl9i02ZPwJlClgE
	Vzz7M/GpNcy70o3ggjs1+xQ5BwYVc2j9LEnXwCmHlHz8ZfBqKqDWdCip/XBrr4S1HTPdJj2i9kH
	vmruvCZi4F+8xnkGtUaEuo4xuvTenUbq+a5xWIz1wnj3J4N1Ki8ZCZ9ZVMArk40rVLxLltckzBI
	0CfFOnly8ny2B4UbJeiE3LxmL2yIkyNt+khRlXdu0sY/oRsy9mTRfRkxd6fv1Bv+gbGkt1flUZM
	hQW0f6nOrqX3rF+9luUKRx4KtQUpvM1oWN8mo1B0OZYJby6qUrGA=
X-Received: by 2002:aa7:88d6:0:b0:835:3f51:730e with SMTP id d2e1a72fcca58-83a5b8d9aa3mr10154897b3a.13.1778224830497;
        Fri, 08 May 2026 00:20:30 -0700 (PDT)
X-Received: by 2002:aa7:88d6:0:b0:835:3f51:730e with SMTP id d2e1a72fcca58-83a5b8d9aa3mr10154858b3a.13.1778224830011;
        Fri, 08 May 2026 00:20:30 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm14566685b3a.17.2026.05.08.00.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:20:29 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 12:49:48 +0530
Subject: [PATCH v2 2/4] dt-bindings: remoteproc: Add Shikra RPM processor
 compatible
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v2-2-ab76fd9e71de@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778224815; l=962;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=8hvVNB5nM53jnXbcU14D0R9X7GK1i2upQQ1liBM2/Vw=;
 b=SY7al+FzmbPqgtxIw2UZvFg+y6TYh8haznJV5nPQYrC/lu9u+AiqG1GcsIUfdIc344Ccg/C6Z
 pk0q7bV+pkACvQuykoOcx0Oc7FOR7nb3du/r/S0/p20QmB/EPOVCefb
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fd8ebf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zr5sphF6OBxrw6KR-80A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: -VeaLaTC8AzIJDXuIsK_IY-zbdmJRGmA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MiBTYWx0ZWRfX4l7+SKWarl8f
 QkQErTJ9gxh91TQrU/mY04jFcnK6d4fM00R7GSN2kG137HD6UjJLLO6W3CYnhR4wJTwQyNhK6eE
 0ZcoxqTyidHb9nf63rmObJ8xhFHNwCAKuVOoX3q9lFCOs9jDg5SHTWMMU4wEQbHL4VXNyg6WCq+
 p1chzb7sEhWbXagPNpoRpMOb6xDMRT9FaE2SrOrQMmLS0ODHfMA135ifrhVHRCv4XWQuuu06426
 yvMWRJDuQMrHaUwTeH2NnEnud2bQRbLeRlM0P3Xbzf+LMm+mBNSMfI6DfbMCeiZ4/eFXZ9Q1aRl
 MxSsoM4Vu2lvYqQ5Wx9dImup8CefaCFDMck+mo1NjhV8PW6qBzdlzgJ57zK1bf68WtpdBFuPeHG
 LcKWlpXuefZa/xawXkj5gPW39Mk7lXstCLFppfvbo6OTLWSDnKDyGLDRZg9cP4KCDPa64J38VU6
 WrfEi+ZyWfUx/Tw+c3w==
X-Proofpoint-ORIG-GUID: -VeaLaTC8AzIJDXuIsK_IY-zbdmJRGmA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080072

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra RPM processor.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
index 540bdfca53d97d9c18fefeb50fa68fe704b2008c..823304afaa98f8acd67667c6aa3e36ed743ef554 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml
@@ -87,6 +87,7 @@ properties:
           - qcom,qcm2290-rpm-proc
           - qcom,qcs404-rpm-proc
           - qcom,sdm660-rpm-proc
+          - qcom,shikra-rpm-proc
           - qcom,sm6115-rpm-proc
           - qcom,sm6125-rpm-proc
           - qcom,sm6375-rpm-proc

-- 
2.34.1

