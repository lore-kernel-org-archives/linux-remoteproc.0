Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A370137F723
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 08:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546485; cv=none; b=d1XA5oHCuLDH/Jl35Rqf1VLiBvhAJbrc0oj4YpFvhcEvTUIYlcfU4Nr/d7ZXvmURIZpRcy8UM0x5Rs5GXnxUOe3SC+ItjEI8ejvyDw+ZqNwCxreblHcYWGxROEqQt/cCqGYBdHeKcbsPWfFcR7iMEtIPRu421oazOoX6sBlkgC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546485; c=relaxed/simple;
	bh=x1vhhVD+EuvAa4tTslqnDNk7SPeox8b2RX+e5N5FKM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qY+CKZJKAgSK7vtMkUbccuaRDkdeaCb3Sh3PJ/VnOUFDdegk2Yf3A3MLBsekUxUQ6VMAbxY2xBprGglwPXzH1aIYeYNvzZ/hWFakVJPn6s//aNABsLKBGLepKyt3+kNpSn+pti2/S7RAjcrYtc6skYvyV8jtCCSE/FZatLkAMNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nfMLhjpz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtJrmawF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nfMLhjpz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtJrmawF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68nrH2085101
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 08:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bHxC3t0bD0slbmkhbjDTNk
	yF+TrRMkmAt/z97iqNV0o=; b=nfMLhjpzNLfHQB59gmW6t13cPpfIdEZlpoKtem
	ZZaLxdcranDf5X3UUKsfF2kjvq2fIX2R9ZIwce4/x/GyrGEvLmRmqagz069pwXCE
	dsfmKw1tR6/+wkoiAXwMiYT5TX0nDZgctytbSepmPOeIl9VFjrtWKXH9Zrz0r7kP
	KTCETlDnResYygLt/nC+eCGmnqHq4dXKjqZ/y5g34o54NhVYlfbwL2MO1icvOs5P
	9R/vb3kAhTeWsksLoZ1tuZwKOc8p+WEJQmDaL7fyhWvUN9/1OsIVwxDjtPis6ZHa
	UZ1hgwiYszaIERFZzoyU5WZtMb6L/OOd7v4xwxJclJHV2qwA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksa5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 08:14:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso6227506a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2026 01:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789546469; x=1790151269; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bHxC3t0bD0slbmkhbjDTNkyF+TrRMkmAt/z97iqNV0o=;
        b=NtJrmawFoEY2waT6mlxiNqBNwb9Oo/jMYFHoishLeRbTozT9jCdcxNlD6pWOH8T32m
         8hsvx4XmWwiIqzuUju04VeJlnA1pROjTJtlyMiRyGVavKu5R9paWLYsaycnibdW5CREK
         gKts8goo2FipulL0HssQ4ls4dKrmZcDBcXEW9qTncv0iRQ+7Ng2MY6103ubbrU76thKG
         ds41Ra6gfZozAnwQWwZ1SE7+toaA5Th244F5wWpbEaeVhxg9IKNv1SjWrC7FKmSKwnua
         PzESLlufLw3x3afJIvLJ4Yhmdv/nobGQJGcWa8uiZcR1JC8L7KfRMGImxqzz2ITT3TLB
         16Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546469; x=1790151269;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bHxC3t0bD0slbmkhbjDTNkyF+TrRMkmAt/z97iqNV0o=;
        b=DH8dKfsAsxraIpIKxlkXLNgymtZeEc5WMiadu7H4SlkGGEucWJ/Qyd/6/4PN2x9iML
         gP+GJalO8KDPTQIkxcMuP3vBHdwjJLKc9t0yqZHgxKvqTDNJ1hp3HE0+6A5W7ZuwfIar
         P/p5G2IY/E9/e8+cx/Ou27U1eEY/0+0brj3CmHgYpg61uspwEjGlb/NyvG9LrJp+26md
         Hl1U8NDPzpaOiVDw1c0zIfGb6+LkC9l0wa4n+1rQ9LA8A9xDB/vflxfnBGrejPPcLwsz
         V8Ahl9YJ9cyXzSrxMBv1UHrPfxXURH9H1kSJ0LyK/ShS9jdFbIxYcGLW+xuKCWNTe5Fs
         tyJw==
X-Forwarded-Encrypted: i=1; AKwUvBynO1cYcZcSZSnmDqN7ob20TX9NM1WOXvfP8kf7GBa4yRuqCK28hLIeNvYLCabcssmLCzBLzpLHOydEMKtVqIve@vger.kernel.org
X-Gm-Message-State: AFuF++m8Sox6S0IieVwSWlP2gul+hieVC5aRViPmbW9nDqRKmRr9X1AK
	GqBSS38lxAA1lPGdo7eI3SjN42F4ZTRadRD+22N2bJ2pb0aX6gu3nTQ2bnMS8KCTRcnbAq+x7Gv
	+8JasoYR8WM88ew7IRBEihy7vfU9p8EBJW3WmJclEy1zFxk1yBL0qdvC/Lp5K8IZj65xzSTJm
X-Gm-Gg: AYBFou3swJ78nl//QwVv9ot/JrkUZn9yAzYSDAyt1insloyK9z4nBBEcG/mcDqu3xJ3
	V2bsJ6kYVX7VDtJ38MMR4d7G/5iynDbaz0iLh2YpSN9Jbbs+b+u4ommhux8mmEbpDDbUWZX5JFO
	B0FtZzNNkal/gWHYq4X6UsNnifPO+PF6L5dL3iO727OSti2kmiY9N8RwtcySy/ZTnKdnXm7YjWL
	5xYMEqbyKhkO9sPUy1w9rRIXTtb3p/yaDiz9BgF736wuvFYv1agZoRxbjpUCUbxeN+Y7uTY1oGv
	zd/dScdXi7gm2PvIVw2a14/f0BFYod31OWJpk+Ql2e/uafv5hqk90MdAJP93SVoR+wgte8Q2fgc
	FYN6K4aXuN4BWfb2pFtB6mIk3z/MSBKQROUBYlg==
X-Received: by 2002:a17:90b:4cc8:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39e1e330a2dmr4483266a91.10.1789546468765;
        Wed, 16 Sep 2026 01:14:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc8:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39e1e330a2dmr4483195a91.10.1789546468238;
        Wed, 16 Sep 2026 01:14:28 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm11734328eec.31.2026.09.16.01.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:14:27 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:44:22 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Fix off-by-one in regulator
 enable error unwind
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-q6v5_mss_regulator_enable_unwind_upstream-v1-1-858e8fb0c279@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN5PqmoC/yXNTQ6CMBBA4auQWduEAjbRqxjT9GfAMVCg06IJ4
 e5WXX6b93ZgjIQM12qHiBsxzaFAnipwDxMGFOSLoakbVV+kErYTq9rOemLWEYc8mjRHjcHYEXU
 OLwpe54VTRDMJp2TrW9s1DnsoySViT+/f7nb/m7N9okvfBxzHB1C+W5GQAAAA
X-Change-ID: 20260916-b4-q6v5_mss_regulator_enable_unwind_upstream-c613d3b42cef
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789546465; l=1782;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=x1vhhVD+EuvAa4tTslqnDNk7SPeox8b2RX+e5N5FKM0=;
 b=/cvYCXeQ33IK95EIknj/fLHqdm4Wcbp76X5qJGdZcyxvEdg4SJ72QDSiZ3x9cDK3aCQFt++KL
 l2/90qQEEFuBmQ+aT6CvdARZotA4bJjlkhbhSzKdSYmp1Rf4B76HEY/
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEwNiBTYWx0ZWRfX5pLFpundNucC
 n0+FhsLNTaDNoAyr74n/snS/Kxhkp7JeDsBEDsgc/XH/4tznzCNJMNAHhWXb5K4Daj4yQVKPOXR
 huFbUynrxn27AjrvAIt1EiJYQ2K2lbg=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa4fe5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SFYdgmKYQZucr7GQzh0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 4vex5mmav703k56SpPLG7VO6vONAJUwl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEwNiBTYWx0ZWRfX4Bduc7hNOVcr
 3TQdPIctKecpxUA4eZX0QSorINLJJhbbXUfC7zryDt9kKpDU49V/hfY5e5xWXRIlIn6Ozat/ecy
 rNjQegcDOJNaffDdeAEE5ydKITLv6AMoNr0IF9/qJCQwmoyqzpWStT8M20AoqT30JouD1htrcUi
 Xvtl2gm3RmeLn4TVLR50015j/U+F4e/NcAq3ObMoNNDlACkwx8cZRcNb8bV2ezsa+E0VCUFzMfK
 rEbHIRKPjiFXtRAlsKpTop3vcRJO+O2ZN7GowuV+znfvVnqVPRXOR5y/7cJ77wHQj2isy22s4PG
 fLZcBMq93eqEbXXrk1XPIGf/iazcxRiNIVHDz5te35new3WtXZZnGthicvtRZmfJdA+wjt67TgQ
 neH7npaluB98f8AB30ndXzaunYJl3ts3C98C6YDmw2NqRZ4wwcD6NkRBFRgi18NxS/FAtjmCR8d
 UdlRZYeelv71FFvOBPA==
X-Proofpoint-GUID: 4vex5mmav703k56SpPLG7VO6vONAJUwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160106

On failure inside q6v5_regulator_enable()'s enable loop, the err:
label's unwind loop starts from the same index i that just failed,
calling regulator_disable() on a regulator that was never
successfully enabled by this call (and may not even have reached
regulator_enable() if the failure was in regulator_set_voltage() or
regulator_set_load()). This can trip the regulator core's unbalanced
disable warning, or spuriously drop another consumer's vote on a
shared rail.

Fix this by decrementing i before the unwind loop, so it only
disables regulators that were actually enabled. The current index i
may still have a voltage or load constraint applied from before the
failure, so clear that explicitly ahead of the loop rather than
dropping it along with the erroneous disable() call.

Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff6..a40a8614758e 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -336,7 +336,13 @@ static int q6v5_regulator_enable(struct q6v5 *qproc,
 
 	return 0;
 err:
-	for (; i >= 0; i--) {
+	if (regs[i].uV > 0)
+		regulator_set_voltage(regs[i].reg, 0, INT_MAX);
+
+	if (regs[i].uA > 0)
+		regulator_set_load(regs[i].reg, 0);
+
+	for (i--; i >= 0; i--) {
 		if (regs[i].uV > 0)
 			regulator_set_voltage(regs[i].reg, 0, INT_MAX);
 

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-b4-q6v5_mss_regulator_enable_unwind_upstream-c613d3b42cef

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

