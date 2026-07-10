Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB1F3B2D14
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jul 2026 06:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665594; cv=none; b=N3yqMHkUvMU5kqqg/TSGi50UZIYnkhngOJ7hfiVD9ZP1idq5IluGh3oQsKXFwVtSv7PVZQsSrGx3CxnrtpoMG4rYE6j9dogWRtT3TaR1myIVbOA4xlaPEmgGLAKVV1tbmG6vC95wb863x8NPQoegseuLYALzwgFmVpAsx42xmgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665594; c=relaxed/simple;
	bh=TNDjHf72eISjAnYEKoRmCJwrMZELxE7thLNgJ+GKkIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VvoE+b7b1Zh+PdYIMplHeQJ3sWskIJN9wxUrncbqP3asvKi/lInJsxdqbRB6lisdmAii6a5Yr5V3tDxAuZDLFMtfYqyHp/WYqtBqaGCw7frBeZtxo9mObdLzkFwoGgIVx7UZAaqSTrOj+Cr9DK6P9dyCwvSZnRn7khV/xt/Fbl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZTFp1Iv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeDVzBTb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZTFp1Iv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeDVzBTb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3n5QH3802274
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jul 2026 06:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mna/fkHWXIKmpcsofgqqR3rI9v4BHPRnWlK56+0Y68U=; b=gZTFp1IvrZzl05vf
	uGsK7rLvuZzj6RpVt2TM27INOrnzsTTB4BWi7X/Do0lDECwdwp/vjDwMD+BnsPea
	exBXG4rU2LHRJa6XYjRXPrkKD0nmql7p2jRGjjvnjXchyvycUIIikCgRpNHcmKbF
	uX4MGscAJ68Kuc6BXWJt/bLV9jXqBxr7gcREeVQYncY8WgoeHmuc6A7mr+SzJHr8
	RAjDCvI0R1+Z+Q9YPNR+XISb19t1zrBq7kJQbGkI0X1aDDKfwiXoaJd9wwRTBLga
	i6/lN6ou8uPvX89G9e1yU07H01vQ7zpNxODBi/wu6fiTCyJB2RJ4cT62nXVqn8yd
	1j8mvA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpkqfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jul 2026 06:39:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so447173a12.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 23:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665591; x=1784270391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mna/fkHWXIKmpcsofgqqR3rI9v4BHPRnWlK56+0Y68U=;
        b=aeDVzBTbSHP74XopMuKBn7g/sA/PNy7w+e4cKAfmzxjCHESvPWmKtYXbXwg1J6LrjF
         qa6TYR8GZegW+M2GhmTcp1gO5oRf1RjPn/h/w8a7JEnoyaf/tY29WPR0D0bPrzTQrwq/
         BbQfMtSZiY8XQ2V/2Cy4kD7ARjYbHhxWhGVbrLTAINbQYpqQ4qIgRiO173zXV7KvGp1T
         oF+Ma+jbRxQk2VsXbEAiwgq1dKk6i3PpYpfjnIn1GmSobHNHOq0rQeTfVL0UCksyabuT
         x51suJUacBqsKDgwuW/B82TEWPEOYnQ8MyX6rK1+yR3AcIJvWhZMcWsNYIz8+2ulJ8DK
         dSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665591; x=1784270391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mna/fkHWXIKmpcsofgqqR3rI9v4BHPRnWlK56+0Y68U=;
        b=TzceZjudHL06hg6i+ilOC3phYEhfr/6u1E2qvAlZbpsFll3wv4rZiYNl9qOFHBURdz
         mg1JWdvcaQktMVq4lqc94Eh11i6vwMJNbV6AKzLVrDz/kmoRBDJ/h6vF1+fNIhdU2cMl
         Rbwez8+fq6xx20YPZZXl1/LxqnuAwX4mgfAQLOxTj/BfnuqfLZ8gXwPt90dK/mZqZfQl
         IiBcVfWm0heTOFRXLzVoSs4EmzB2vKG219qIHgKAoN7xJKqev7k9ez2QLQljcUTv2fPV
         +koC61kQklGiyD3yAaBmeLl0HtANu5UdJBPHH3ruCh1YEVKvDxRMW4fh8Liku+GibzJG
         RcBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9XpHLIkK1H4VouYWQGcC/zch6gGGTWf2B5qcjdP3dd/XA/LJKFbrZWNL2Pq41R/pCIG5Fcc16oWZxegMgVs5Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzG3IjuuWucil/beohsZppy6ackRvtPd3JC8mzv6P43il4luMp1
	xdH8Z1FNAu6pUZ7Ol95E8ssYFjuwSCLqP1NFV8fFUsFexYOE/5KNrUbj7PL6xgx/20/b172bS1c
	hCVJuJpLLXvxc5LN4NpiZCYjJEydUzJhZ77g6UG9RkdWZvfxt3edFWwQ+jHm7gq28fgXlpvrw
X-Gm-Gg: AfdE7ckvsui5iZL6UJ5xPNg//mxacGMeUz5ooJt++6CP9Bfi1pPUgd38j4C50tAOTif
	uudOXcfyLgkcV2U4PS4gfs20uPC2NOjhCN7cXCraGDyLjwzL6HiF1pgJXJ3BAN625zQn4fvZMQl
	nMSEPW/gJlhdATkZvTzA7Jc6GSqmZq7ZFjspQbDaTOzz10GW2a8HOHI2fKpbjDaKqKAX/giPncG
	wEW8Y6HK0+ZFA+yecrLJXDaFd1KCjzGVYzIVKCFpvdrv4m8gpZwRuCVWeA2ENf3cOj3SdvT4fI6
	0RXNBaf7YMCpP2f2oPxmOgOvUDOyl/EGFBhmJ+L3m8rBdTZR9CYsNvBon/OYtcC9225aGeDHBlh
	oNlLTrqMx3khZ8AXsTmUtCzoLfv318I0SuXpFoNOVFBSM+xK6jF+vLtyocccR
X-Received: by 2002:a05:6a20:6a24:b0:3bb:2883:a723 with SMTP id adf61e73a8af0-3c0bd0f9e23mr12570891637.35.1783665590730;
        Thu, 09 Jul 2026 23:39:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a24:b0:3bb:2883:a723 with SMTP id adf61e73a8af0-3c0bd0f9e23mr12570855637.35.1783665590233;
        Thu, 09 Jul 2026 23:39:50 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm3578090eec.16.2026.07.09.23.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:39:49 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 23:39:44 -0700
Subject: [PATCH v6 3/4] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-glymur-soccp-v6-3-16f70227547d@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783665586; l=1207;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=TNDjHf72eISjAnYEKoRmCJwrMZELxE7thLNgJ+GKkIM=;
 b=nTYSLoBrORkvTjxlyrSovaqsBDKV9aKIq6/mUJ6OImquQW/C7l2zIAW0N2igzBG035v3RGL2P
 b/Fx8Gkw9TrAbZCfi/CofNtexbsF2r6olmX72R6XWWTr4EFoti9SwDE
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX8QkqfLL2q1+C
 WS2ZuJwrqmPN6+IrDOLIw1WsUNfokdgKx76ne7bUtn3v3tVq26IO4nd73aDwGPUnM7Kq0rG1yzX
 pkZGpKW9c+1D/0uBVVYZrJe7eXPzNRR8QippqPVz5OkXnIji5wNRU6RxSxpCGbPTAku3MBCtu9d
 IZK6sZkEnzDZLdUyezfpuhLact65VA33GqYgIKdx4CMy8EXuCp6S8pCX6e2sp+48OdcIUgc2V75
 co+2HtkPuxAbIGn8nB+/65sw4MZS7MaG60ald3ChjaobegfHuA31uWaRO3gnEoKeVhmrRpWWC3/
 sLZEwbPZQ2Q6PLrsE1Nty9WkMS/EtZdfIOXN7r2aBU5imPXUwt90IMWDeSaSUw5f7lFdc5+7uMy
 HdHiwVGXs/OpjM252ZffW+p3YFxJcdaKNrMa/HXWbhFy2qhI0FYIcOn/rtwREC6XYopfnsw2brQ
 vUdWONG0GY+UDw4yIuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX19GwMDGmZI+Z
 NQM+HhgcTIagxIRHJzqRYZOPoMUTtpGnvs0TFJ8m/0r9GNh0Qeueh++Ct/ogIPrFqh4tGR66cpK
 Zde9V11lOmAjy+Ne7LRAC3f32FeBoyU=
X-Proofpoint-GUID: TOlaAvdz2G_O-1SLyepqfZeS3mROiHrV
X-Proofpoint-ORIG-GUID: TOlaAvdz2G_O-1SLyepqfZeS3mROiHrV
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a5093b7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cmxGNSBqaG227vPgA-oA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100062

The currently listed SoCCP and SoCCP DTB reserved memory regions
don't align with the memory requested by the SoCCP Firmware. Fix
this by updating the SoCCP/SoCCP DTB memory regions to reflect the
memory region requirements of the SoCCP firmware, as described in
the Glymur v21 memory map release.

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..9ec7c256b80a 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
 			no-map;
 		};
 
-		soccpdtb_mem: soccpdtb@892e0000 {
-			reg = <0x0 0x892e0000 0x0 0x20000>;
+		soccp_mem: soccp@88e00000 {
+			reg = <0x0 0x88e00000 0x0 0x400000>;
 			no-map;
 		};
 
-		soccp_mem: soccp@89300000 {
-			reg = <0x0 0x89300000 0x0 0x400000>;
+		soccpdtb_mem: soccpdtb@89200000 {
+			reg = <0x0 0x89200000 0x0 0x20000>;
 			no-map;
 		};
 

-- 
2.43.0

