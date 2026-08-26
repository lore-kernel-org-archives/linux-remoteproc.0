Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5FC3C98BA
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740106; cv=none; b=FJTDCqNx55yo8ZHLqWLpwcNthnUlDVW33Czz29e6EMX2UstMK83fkCLbZ5yCVlxTYtRSlA/3dTsyNs4N/1XeSeS4Dczf34VCzmgW7a20NjRf4pR2wj7ei+OxqJDh7ojnZiO/nr38OBR3rPBySWKmksNXdi0vEMjTX4az1n7Q7/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740106; c=relaxed/simple;
	bh=vN61/FzjeMiTrd9k096ePQGc7+pdAfly5/tEHivPF5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJ3i6N/F+Zz3iTz0KrySMoG10wvqPj0KFzIPmCY2OXj/P6mOEExYbpMmxTgww+Dy+QovUzb6JY+VApuFJK/teeUzyGXhr4Cv4GcGr2puKWQDvtOUf1RRpwUfN4hnA0tY9AFx1duhzhNPuQ7epurbibkvFIQWzDRQFRsclVaR2Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmJUb33w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVRvGxEA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmJUb33w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QVRvGxEA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGRrj017255
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 10:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VSGgkwbGZVC
	GUJBgzUmZwvbwjHmun0ki3hzihfIZ+ZA=; b=cmJUb33wC4Z3reKp9so8LVqyDBa
	vj80nBsihaB1z31K0n24ZNdgfReVI25wbtVZpS7FFFTDc+Jtd2H1kPQ20wvN8eTQ
	yfUuiGV5eBi3qhP2Sy1lKYUOKXSmZdFaifXN46DE6QqzsxPSW4YnJ6Bg5tS5xPUB
	r60zQdo31wN5o4cF3GTRxzwI/8qll7DwjFvnj/zjFuZwlgBseL0LGzjLWYHl0J/g
	IIuLBQlRlkM/imNwG8YefUVRnRU0Ple2FnAifE2QmLCzYWH7wMi/f9jeQmHsKhfK
	olq7SE6GtInDKV40xEa6n1A1bte0/+dL7Hj1H151nwDEwQ9T+7N0wc/Vqxw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn3dxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 10:28:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so204367a91.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 03:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740103; x=1788344903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSGgkwbGZVCGUJBgzUmZwvbwjHmun0ki3hzihfIZ+ZA=;
        b=QVRvGxEAcbuHyUK3UA6LOJkYDmAJXw9SH76jM6u+KNcy0/qDrD77toPGuNngReQcqB
         NvuWIliIIkMOnseXQOEgsH7uNntyiscuhZ0318cVCpc/+nl+5ko3T3ceHXdV/ZVnfydQ
         6LEFZOwmeiWqpqvjuuMNJ5E0nJoKU2INPTJfwqIAPbx/TNRQ1K5Qk5s2X9PoBHWOIJIY
         W5VktQKBvnj6CQo7id6esQhTC1byWYje/riHNH/hUcvZMCe8sbjDkusaw4dxArw6xwCr
         8H8J8wif5qQfaiSHCS4GwkBhy0VD1tw8mdndO4kXuyEIiHOM08jd7nJg6ihl+E7LJFLv
         Oepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740103; x=1788344903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSGgkwbGZVCGUJBgzUmZwvbwjHmun0ki3hzihfIZ+ZA=;
        b=ph1KNFEuz/IiS8q1uTShtukirqIpQ5btYIRc+/k5rgSUlOYtdJqVbJdxqrt57LpRf5
         6FfSlUqnV3yj2QmYElqUJh9rrTHq8WzN4BQtHYiTsdoHUBorgkioM1OFEjMfuPzJPVH3
         0eJciB0fe1fOO4TEa79xgY0at2t06GjtN/TKAnz3godb7/Z3KJs8eucdB9KipjxlXPUz
         hynLfKdkwCkbQF9EnSA+Credc10lImOLdm6FxlpKVZJpIYbr+jpzoQoJBhJt3KHywMJq
         0S6RR2T/XfCVeMMdf4ZCk8AKlR6Yb3xVPtdLBgRhviaDS/6yuvxv1m0/EQkCjKqhBgCl
         O/Fw==
X-Forwarded-Encrypted: i=1; AHgh+RrExYsYVBe1QLLpiuLk5fPSv0xzsxQjZPphhNzugvc716qAX1YvDwa1IHZJvtDrS3VnmjVTDgMRMKnfzg3g0rJ5@vger.kernel.org
X-Gm-Message-State: AFuF++lPro+b34tEuF2R7Z4Mlg0602LtGJ9zSmfLfzX0w3OHTLHKc7Tf
	YWIFYNudXqRuwINdlsl+XYHeuitkSEBGZqOe9kPCx7DjDPMwMwMqe3eQCKvRgbOWc5MP/DLmnDv
	x4hO5wod39iSeZzCru9A0+zhCqDYXjcBfoe6zzPKWG/MR5UJ5AmMWSQO2ZzQld/xys6u3k0Hu
X-Gm-Gg: AR+sD11weg9lA6voPR24adOdYIW05uWCIDxuBVml2lLKyKQBivhtq1AVfqpNFYfaFe8
	YSo/hAzGO2Ncs0iDiYegPasmEMs46o4cVhtHGKyqL2YgW4x/25XmNbjvqeRC2Fxm725dLRNv24p
	E7q2PX5pqWgi/223Wsm/mSnZugOI1poCuSiG1fRfuSzTumXOfpMvR1QwCXX7KBrtYrbZZgTp1gh
	ZyZX8yAOcJNgamxca/uT5tmi4IfwsJQSs/45PHHz8Utf5fAbUD1o1T1nJ153xTvlEoUSraRWqmm
	HerzXitmXTz2FlQXMSDgt/x+ZKWrU2A/C1jwz2ebcFOGHmMIJRBkgrHBJpYSTbCZkbjXTVIlwgO
	IJ0SR4aKVHPsBguxwBRlgg5A1/QFVF6ZpqMsDgXG5zvD4//bg1zvqxi/y16ng
X-Received: by 2002:a17:90b:2ecd:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3966d484a97mr12789378a91.14.1787740103477;
        Wed, 26 Aug 2026 03:28:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2ecd:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3966d484a97mr12789277a91.14.1787740102954;
        Wed, 26 Aug 2026 03:28:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c291sm12935669eec.6.2026.08.26.03.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:28:22 -0700 (PDT)
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
Subject: [PATCH 2/4] pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
Date: Wed, 26 Aug 2026 18:27:44 +0800
Message-ID: <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: M_YSwugnCQCLcIFHHj_ZSZwdGkUAHpe3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX8/7cVSS+dzER
 imt6pCt9+gAxzqI/GkT/Jcbr98O5obwQAJka8Pe+JjC6tfmha+/0BiNa3mpbRsNZ8xLO7JrQgUA
 B1YaTc3Gz7eoAfwVyWJx58uLAsGMAQo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX3YezBNocHFG4
 8eNJIankHEa/QJsHWqcIoDiVLImfXPLdvBb708JPWgl2KMgz1m9GQ6Iny4u6ZTE5nFE8BUq1c+R
 sZRuZ77thBffas++ifnbA/Ljdp6x/6lZn8cfmyv8eTnsp+uHtzjfMUk/B/U8VWOmcZYdhXCPzR4
 BRDT1lRvSVv6ql/OOSU10cxP0AI5hpGUA0voj0e2ob2aU6Szavn8qERCYUgQhU6g8TY1r6yWKK3
 4tMDmyDgko1Iiv7kdr2MpEmCC/KtGZa5dihCRiGhTQyE6frQSFSJoLrzyR3dmp3mgezlxvdw6Kr
 +DmGOLw7jO4GuAyv5xf1o2iXnIxpy2wFcdb9YwhsqrbjwVxsCGM4XDEsj2+BZjg+QJsKvKEiPCB
 rVe6kBjpA9BBMPe0+mZ4Ptw0wnJ8nEpL3/WpwnIBMggpH0pw2GTmQ6m5XGGNgfNGozxLd+4kYBS
 PPheICaPw+gOP3H1/lw==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8ebfc8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lHabChWoiVafOPoG-uEA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: M_YSwugnCQCLcIFHHj_ZSZwdGkUAHpe3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Add the nmxc.lvl RPMh resource and register it in the Nord power domain
table. Nord supplies the NSP memory rail from this dedicated resource
rather than from the shared MX rail, so consumers need it exposed as its
own power domain.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5a14..717c44d1c39a 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -198,6 +198,11 @@ static struct rpmhpd mxc_ao = {
 	.res_name = "mxc.lvl",
 };
 
+static struct rpmhpd nmxc = {
+	.pd = { .name = "nmxc", },
+	.res_name = "nmxc.lvl",
+};
+
 static struct rpmhpd nsp = {
 	.pd = { .name = "nsp", },
 	.res_name = "nsp.lvl",
@@ -331,6 +336,7 @@ static struct rpmhpd *nord_rpmhpds[] = {
 	[RPMHPD_MX_AO] = &mx_ao,
 	[RPMHPD_MXC] = &mxc,
 	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_NMXC] = &nmxc,
 	[RPMHPD_NSP0] = &nsp0,
 	[RPMHPD_NSP1] = &nsp1,
 	[RPMHPD_NSP2] = &nsp2,
-- 
2.43.0

