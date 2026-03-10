Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8C93B95E3
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113819; cv=none; b=eAz+c3INT3C2QfDxh0UstgtGip9liy6Pjf3SDZ7FM0PlyDz/BTVtUzHUdFtjjUIzyH231JeedqZDg0JQHrvw2zr5Q4cLnc5/2ywGhRfz7hWI3B7IyBTv3IICSYdaCIP5xZ2EyEdbW9J83Sp4VcGRMvxcBVI6yNp4fRzCqpjDe6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113819; c=relaxed/simple;
	bh=TbZHaA5vOn1udlECRr5ebxVlfa8fzityrbwOFQl8KJE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nRmN2HaKaqe3HFGn2pNVp7L3x2UxapUpdZA/eKcvFaOH2i1YQunDpyDcRQMK6YCtfKxZSb+c9cX382wJ0MloUnH+HArNuiXYXG2B1Fhib4JJwk8tVtdCB4STGCNxiXTBZ+JEGn5qQJ/iObeuHErFCmrXbxxNj6I/r/8WDIOzyTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRUdaScD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ul0DReJN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRUdaScD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ul0DReJN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EYB73754878
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bP04qDOHi3y
	ZSiapxHxzYhZg7ajf2prSRAxjflLSrgM=; b=MRUdaScDWaToasLA2a8qIBEZEb0
	T3dmSarh/Qab9LQTkhUj8dn1f8UZKEUnFL5pthZSLErFtgzLtq+4B9tHll9IObwJ
	ymoodQnMhUo3owG0fUBJftcLlGUcaeczgX6w8Xn7yqDemQ9ORWf1jS4jQn63LlMZ
	t1qMnO1/8DWAdiuKYEF14UzbVcRTWtV4SjwcCXF6KBHhA4Y0sJ5HWdipULZzq4E3
	roMbx5JEGdCmQR0uFTXKBzBxprCaJu1an/E9qeUDMiBXowslkkvIiFWaKcdQS0g7
	T++acx3u/LPIgk3r6k7WRPfKeaxonszNOb36dc+Z8Zs6ek20/WVACh9it/A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477hafd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c73939e0314so2476860a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 20:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773113816; x=1773718616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bP04qDOHi3yZSiapxHxzYhZg7ajf2prSRAxjflLSrgM=;
        b=Ul0DReJNuU29vZh5L01jJPgdIUav+vhNgyGVJyBbFjGZxcHb2z+7RywQtvHTqxcA8m
         swgKMUzeiyHSK6ZK5srYqMN9nrjWe2lubwj5+egxYZHDWDVDMAcHOLDjfRYW+xk7bcsR
         UvgjT8nludYWGQUcYuIGdP7+n8qoh4hxQogqnkT7lwgc2ISHV3GyPbHLklVIy/l5T0Oq
         kCAd3FzA7TSyXIcU96VkiWgvHlah+zF2+0GrwYdI6D2rLy0pA9UBNMDc9/f08mGJad83
         KsB37My8qvs/UKpKqQiyMGPK7BxceFN0MwsUcVP4d+JJbCUyQhP9Tra3R/pnaON/nzF5
         1wDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113816; x=1773718616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bP04qDOHi3yZSiapxHxzYhZg7ajf2prSRAxjflLSrgM=;
        b=LU+PrRUIt/IHJBNpntW8bt5nB/JECSMf6nkiLP2hK4j2s22TIJHGHNDk3DcBX9kLCJ
         8ebuFi4NCQSOR3e6MhH8xhKeESkHgy7C/9y8Lc1YySFUdD5P/LVufZiOOyo4bSPEpYC9
         7O8xecqzMQRlOLKugY7tudvaK5HVqlmshVdw9y8W3Hgr/jNYcNp8vvZyv+Kmluc+h3CR
         XqZyaI5UTnuD7cOIqpOMn0zl7dqBk9PgzzzbMXYbKxWJecNf4BaVX5HsAN2VNmIsGbIe
         5L0xlJ0rA0p5ZMSltFqsFatKfKKAoRnXSc8CeN6qGyXZmUQj4YiPT+PTbE8fp42Z4LtR
         38ag==
X-Forwarded-Encrypted: i=1; AJvYcCVbi92IwjWP0HC6YprETE+26jI+2ovV1e+8O7pggXE/nksu4i8nZHip80htHwl0IdIKFnLsnZX9E5QTUZcbgQOR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9tQfN1xVxccIa4RXDPvk5tzWeuKliPY76qaOB7FXVKiLyNGBL
	B132atvsH8GXAEdvkSnHjpABmQbtDPPG0qSrBeuq57VT8X0eRtics/Bgh8Mr3efQZMQ0rlPzdUM
	9SaZq1ZY/nE3KXYaTK7V83dzofKGhQ1u0YxT6+mtfIiv5f4HatkLLePA6vCaItTmZrhQezql4
X-Gm-Gg: ATEYQzwZ+BJ/b7IlBDdZrwG02L8T2dYG30cLxgAyiKh1tYUfm57KuB2bLQBmzTRiEbk
	w63u2V1f9facnzxJZuCLGxKWEzXPW8yT0rO7dbKGhtW0BTHvHGdy+L0GHPhRlbxHIo0udAUIX05
	iJM/6V+eg9X9stB/LdBWFtlA4PRbgQsc1Jljv4zRO7kjK547NU47XYxcEwZ91PR6z8ZapGi1Xfu
	0n714FC17A9U2u0jbxfV72SOyYI22pSNSIZf6tCQEfiMknMDh31okqL6iCKFBx8FIkvlBUNUtAv
	iusK6eTC5G9X7Oo9dKvdFEPEMa2b+QknXTb5J/QBs17nJk5HypH9jSj1hWWYvIeViVYtOgJjlHd
	qUC5L2Xw7Fgbxhp8TjzK5as7sOm9njcUHJ8D4NQm4HlFW7PyFyKdyBj/lJtpOAuRBk7cbfZMtBU
	IOgix3+Z8bvP9pjmD68IE/9eGHMm95+J/BBrAo
X-Received: by 2002:a05:6a20:c786:b0:398:a216:2425 with SMTP id adf61e73a8af0-398a2163a0dmr3300658637.65.1773113815905;
        Mon, 09 Mar 2026 20:36:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:c786:b0:398:a216:2425 with SMTP id adf61e73a8af0-398a2163a0dmr3300625637.65.1773113815445;
        Mon, 09 Mar 2026 20:36:55 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm10272923a12.25.2026.03.09.20.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:36:55 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V4 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Date: Tue, 10 Mar 2026 09:06:17 +0530
Message-Id: <20260310033617.3108675-6-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
References: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNSBTYWx0ZWRfX62J18tq4SjL+
 FE7HrJP2dnhlpVp9zL0xB1rPAYirMavZl9uJjxA2eW2fAD7ErkzBOx4kPUNMiKzLyMl8+QV9ilm
 BtnhO/j80EDO1gWV1mur4jVp1A+lN1dQZac0wQYetqJeF7hSHGOU21S1/qMZFIiCfE9m/uHY3tU
 tErDy77KI0QvewLz/3O7XcWFOcXnWxIywGSOAMN5Qhw8/mjXfTr+4YMn5fegJeVpZypVhDe2KPx
 YYJLxyjouks2t+5rVK2Ciibt1htHiqYSLk6LONvOF57F6BoL3cdu/mrEt+8QI1ll+ybOoDJSBss
 1efaQWYFg5mkHhvRJH+f+UU22hvBlSJzGGtLFdWQa5m6StXGFGZhhbRfZSKjQsPQlsQFBfPjFGj
 F/J/xUi7W/yPyuPzP9pRSwFYc/puAJRx8x6zjQ8AdW1m9cou+8c2ClZxhCWcLwYAL+r1Juitj9n
 UDLLaQAWaBUJAhnM+0A==
X-Proofpoint-GUID: 0rN9_4lQlaSY0LEmitdF3Dfsr86GlW7f
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af91d8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ePUXPMwdJMzpUIYWY5YA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 0rN9_4lQlaSY0LEmitdF3Dfsr86GlW7f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100025

Enable ADSP and CDSP on Glymur CRD board.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 877945319012..6b7f91a3a968 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -485,6 +485,20 @@ &pon_resin {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/adsp.mbn",
+			"qcom/glymur/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/cdsp.mbn",
+			"qcom/glymur/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
-- 
2.34.1

