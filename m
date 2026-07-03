Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D773D25D0
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 12:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081904; cv=none; b=MVStB//ivDHD1nIwYmVL1FTSkta0hrP8acdAPfjMLHROdcSaoINLjomnlh9pqbDoU9JgaffiEKiuVmIiQjA3yhZ1AB6WoI+jRJROh0GNjkRCzTv1WWwApgiXman5mYuoHa9h0eNVpgnOdkBO3fRYdHvMF67JrHNOgCRiIRPXg0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081904; c=relaxed/simple;
	bh=LbAzKcdJBSlOlhXn/vOOmm76Btm7euyS6SXySF62Bss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kl+i/tRYoDgx1hrowyjAVKAAR9Zs7JGwlagQu+oxd+vWQj5p3d66EeOTaIuNAn9TNuj6e46eauaVRq8hoVwNTqi745exkwfnIl6FRSwJLfc1jlztRDP8foXyHeGhkFUPrHoBj7SyHlM/khrogWLYAiO67k7mCjdjp9OF4rbDSZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nz0ocbTq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MSbj/KaI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nz0ocbTq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MSbj/KaI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Bqnqj4091189
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 12:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qb9ueB3lM6PN4mzsHtBWDVS6JjZvkFZ5R22Y/sH94zw=; b=nz0ocbTqEJlTzI2r
	qHSi/PjppUSV7QdD3ApQHTLojLuR2Kg1JaX08g6j8SjDroaECfmYNyksO+XNC1s3
	+6N+ZNqphmWzi3SXXyVAckAOBGXwcBxHob7S0fe3xkzfUxH5OAZOR0FO6bJI6y6G
	XdN8Bu6Oqz41ZMfUOrnkhVpyOhV+AjHxvHY95hqqZV2OX70IWSv7Djf2nqMKMMM/
	J42riUGU06Ql7pCNH0N52wPSdo8DgaUvZ1nBWXUg/dAq+qAIHKegYqqA4VBYXUzb
	D3RQVN06MLHNtFP+Ls470plr//Nk2VoJIKIzSebxdANLGLBq7HaRekVtOyS2Qb/Z
	BxrUlw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj058d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 12:31:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so657681a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 05:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783081899; x=1783686699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qb9ueB3lM6PN4mzsHtBWDVS6JjZvkFZ5R22Y/sH94zw=;
        b=MSbj/KaIMfzphIrbu/7HmndCZMcqTZxbtIffhGNa4i3RlsrLDvYLDaAF/Rgtf/HhbB
         rMXugKYh3HZ/hjVjDZyZ/od+B/kmpk2xp4vO/NW3QVhtS/S5BPp0hqQ44D1yzO8beii/
         5Zca0Ggas7dHuSDTfXO1+LT26uHLGrUFbJ3B6W9GnAunPDbcdywdUGJlA2gbKP/6QFn7
         NyPVfCYq3zGJ1Kh7Yqt5TUDW6T8lW72xGMn2pA81i4ggg6blkxYXZPKyN/2hJPIaW9Z1
         baTD72LSvI3/2vjc1/QKKfHgH5JdS1j45jcnX1xBX1UyEPlzgt8g7RrPC7HOEIEQq99g
         tOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081899; x=1783686699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb9ueB3lM6PN4mzsHtBWDVS6JjZvkFZ5R22Y/sH94zw=;
        b=I2dK6ewiGsN1YvOksWSWSwBQd429XKAaLvC6u2X2fb1ZYHceOCM8Rf2aMrnSrBaBFE
         mwvesi+L+qoMPdW1LsXVLCKbt2d33u0L3RInawp1CA1tfBi4XtpxXEOwEI0iu3ZdoEjh
         e/QWUmQPtQsmeyxCV9Veu+u4rRWJPgm+4Cc8IjUEgJg23YdV0ZTgpu6UulYLWsgj97yn
         IJTC4MyrrXPuTAqYj6g3C7NgCRv8il6OPQDNqxAGaASC/IYkD6Lt3SV/u4gkheJMEPS/
         gyvpngvwQ8hyw7Vw6vUkFu8TjUUuRlt/Wjokx/+6kDKsKAVZXDxM312NZpUA/QFnPgSf
         9efw==
X-Forwarded-Encrypted: i=1; AHgh+RqXyembidd4pHS3DzQNqtXo6k5Ok27ktq1UQTie2oT7wBIIicnES48hxFxzk2tN8s5o1K2ibxsnl/vGPQ5jqiP3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9bguGIBjyqCTCYpM0CukQWAU3zCjWCDxlJ1Z6a+u8nXI6HZuZ
	QTCO6slQdNry+hztDHV44rANxju4weErBtuqJOxDljsS3TowdHULUiQlkjaoNoh6Dm1+NIyyAOt
	06vNr0re4FsVw28ipGSXuzk+oa/h3G9ME5Q7vGE5gV3ShplE1NnOJXmJCtHtivT51ee6fSNjm
X-Gm-Gg: AfdE7ckqXxRhK3/PHwglo+s5XTeKfTgfkWi8JekbJS6bvqD3X1FqkF6wMxq93r7hHQs
	ty2D9tm6jhm8h2miCa/U9qJ6e6rlJ/mZrB8PLW0AHY2RyRKvfRa5o+7agQkCEpgO06qIcuD+ETp
	SXhaN8jAM+GnNVq2HzIqlDVS5FAb6SGC6jevFWiSZK/zPAwjlcubDY0QUZ6n/W+JgzboNlhNWf5
	Z+Z0J/8veC5OppfoDmITsUlMJM0prSxv0h2DhdZPdpQWPvpWggBmOTArCikb1IrYlfPWRdIcd/E
	KYtYuTe7LDBHnGRjgoyTZqoP9FLFKptgM0FW4ubxbxbN19UnI8I7ZHbJELStTvbbqiVCtk60Ayj
	Eucc75YML9gCe/H/jZDCAiNAkSrEIb6EJnUcaj7+5vEUS93Zu9qhWombB7TyL
X-Received: by 2002:a17:90b:4c03:b0:381:973e:fa08 with SMTP id 98e67ed59e1d1-381973f01admr862671a91.18.1783081899300;
        Fri, 03 Jul 2026 05:31:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4c03:b0:381:973e:fa08 with SMTP id 98e67ed59e1d1-381973f01admr862632a91.18.1783081898755;
        Fri, 03 Jul 2026 05:31:38 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd223esm20949375eec.21.2026.07.03.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:31:38 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 05:31:12 -0700
Subject: [PATCH v4 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-glymur-soccp-v4-2-b706c4c9b3e2@oss.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
In-Reply-To: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783081896; l=994;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=LbAzKcdJBSlOlhXn/vOOmm76Btm7euyS6SXySF62Bss=;
 b=uflIOkkR8d8djFm0ntwlMcSZF/HQx9zJJjSop7On1AKvtbsEOh/Bq6lLibTVc7KN5PzKTVPbi
 AjfvKmcOz5jC6p+hWtNYFd/8Bax1jtyFFlqwWAaAA4mvybBRziP5fHC
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfXy4f3NYMPtskw
 UgnwFjL/19fR09lrZ0UrLg7dqZiEknYWhFkUvrpgKq07Pj2i6gzkadZ/Y08+c1LY87t6q/FCFSt
 VFjaezT/yePCBDn+GWVd6qK0wW8RUkE=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a47abac cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gkKWERduQOovxkfYEQ0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: _n73GyhKou3g3FpvdbHeKdqeSPiw0Umv
X-Proofpoint-GUID: _n73GyhKou3g3FpvdbHeKdqeSPiw0Umv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX37RNX2zkvvAu
 QcKp/wtRQgmwq9L6qLBQ50vpPNGknjacCzQlC0iQkgZSvbyhr9PP0JTYu87WIqMi6yx/RnUM85F
 yeTZLDj5YN1JT+Ged4Cnji6ClfFkNxCZB08MG2HVIyKFD57VEGAim2lXM7YRvnlQcnLs22yYHYl
 AmGZTCaML9uf9TurMoXkHRAD3PoyXwCGlmdU1LndBiFzyjujbaizyB7IzXHbb5VovSpoUhaLwRR
 fGQq5bVjlemm8Ri+W9AiufGoyyOGKHj5VeAw+KEp2qJfDggCCOQecnLu6xyBhPREPy2Bkc++Ub8
 4/XraF2os7mXGEaSMRQezEpqksJgnGCdCMAJJskbtITlGSY3DWcMcBNLLAaxDlcYUN87cd3z9TD
 7SX7fP5Arjc4oQQBaTlNG5fA5E+fgtOvTUDkacsRzbJY8f3XRsvL46LcbPTYjIZVuBu0YOUiEy9
 /h4rtzRXA7oAXezTmTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030122

Fixup the SoCCP/SoCCP DTB memory regions to reflect the memory
region requirements of the SoCCP firmware, as described in the
Glymur v21 memory map release.

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..5f44f68efde2 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
 			no-map;
 		};
 
-		soccpdtb_mem: soccpdtb@892e0000 {
-			reg = <0x0 0x892e0000 0x0 0x20000>;
+		soccpdtb_mem: soccpdtb@89200000 {
+			reg = <0x0 0x89200000 0x0 0x20000>;
 			no-map;
 		};
 
-		soccp_mem: soccp@89300000 {
-			reg = <0x0 0x89300000 0x0 0x400000>;
+		soccp_mem: soccp@88e00000 {
+			reg = <0x0 0x88e00000 0x0 0x400000>;
 			no-map;
 		};
 

-- 
2.43.0

