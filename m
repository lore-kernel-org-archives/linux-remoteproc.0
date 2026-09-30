Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0A136167E
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 02:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790734079; cv=none; b=b8inCl45MilHnvFm8SuR5mgEJUni6OtUoSqva0Jq3+v8d7/qN1BN5xLXD8q45nGiYs9Y0+39cd7JMqz+kZLwrXC18XZQHHObi1aqt3aOfSjLTxyGPyagslHFch9pjq+YYTET3tiWNqRMM8kPHx2YygsTCAh4CGxdtld6nO1zKmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790734079; c=relaxed/simple;
	bh=j1Ni7tBKh1a7tkJJg9B48MG5RjW+DM36zVpSIvXS8uk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q8ZfyyB1ZU2xNspdGitj88qE3XyI1sPSPGZKkfUUhdRcMuzUQolb0kIjSZ78rrSDtBLd0LwuTsKWFQSvVFH9ZebOxIqTkJ7iqj3ySOytMkfEw72gkslghx5p5d+9Q4PKkkKB4cc9FrCcThBTlmjfJrp9xLT8UoSgmoC9SLxMzvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pewoM4yg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SovKqDFO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pewoM4yg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SovKqDFO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNProK1352973
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 02:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WTItptXsNpsX0KmzqsHPB3FdHZtYdhRX31N
	Ltm42Hns=; b=pewoM4ygPb/I45bHNgJYykTXzvNTWt5Zxt8UcyMTfJZFLWWii4Y
	oy9gpfZC4P9ac3eBOQX6FHyvyrDt0yWJFMcme1L08sHeC9iwwAmmYQC7ICoNnk6x
	ryLjo8MSNdnHfJJ+cTXVcewlrHfFMGjfwlvQXCBqmWr120zhRVPP+7Rbhi9rltgS
	6M5YzNF2LePH3QR8swRYKPobgvPP6AlXrRY3Kk34qQimiOEshKlJ9hD/8EcssSsl
	Hut64VYYhTI5Bn3Byd1f8JezYxuvYJKiP/HcmqE9xON9e3kEpuKH6+Tvn7AZ2h5v
	OdmrxjLcAB2kAGoWpP76fwjIF5oUetxvS5g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0eswjtr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 02:07:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-342138eeff2so1150891eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Sep 2026 19:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790734077; x=1791338877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTItptXsNpsX0KmzqsHPB3FdHZtYdhRX31NLtm42Hns=;
        b=SovKqDFOqsVsDY9adgUuKgA5CJ6JCoIpZfK7SVEowcVQdUZW9deMyLU1R17qsKRuM8
         vYOthmDSe5e3eN66zolkr675EZqLTYln1hAKXPX4Pr7mlq7/FEoRIY7WcNTMI5fs7Wum
         BWP+KOiK2RG3fT9BFYCUQvNeXgc9b5vEHGcnWQYh8iSWwdibhQlvcsC3GCGtp72E9ckU
         21T0uuoHNTm+YCH7q3WpT3+74uOFDnfiL/22XqkWWQLpXjQ5BgQtVuQucYHugL4H16Ju
         4IQOgqMJgMmuQmbjwS9ozpKxBJnOH9m85nnVI0WiQ4LenQXt0iZaEi9R+W6vZPTKZs5g
         6s9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790734077; x=1791338877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTItptXsNpsX0KmzqsHPB3FdHZtYdhRX31NLtm42Hns=;
        b=zREUr8PQEBHj5Ps3rkrkErVCCqFmnaw1PX7yCwUp/yYT9LCPUSrAFXN02U+V9sVZf4
         DsD10h+C8kKCEkeTSqr+FoSRdy45ch9zA8/tLVMNwsAL/HljYdziNORvQfNqGhI5ZSoA
         LWp/RtjBIZQaFjjK8NYujnu6INcUeiBAyRzE5T0Y958cNO1MP1VBv2nv1PhgRnbPdK8Y
         vtWX8Om5dZKp76bLGBkKFch4hKz9G0qWZDlNg6rf5DEgw4pY7OCHSAi07V9tqC+jpHy7
         Ig/EXePkPzsLEkKumpbG0QtzjrV2Siqgq68LN0oNxfLsLucARUIqdOn8Mr2d7goBzk25
         Z2Dw==
X-Forwarded-Encrypted: i=1; AKwUvBwCvqBZmBjnxCXDnPE7xiz5nYKdR7TH2xve6QZTmw9OILBXOvVZvIuH64b3Lwiaefez1oPxzfjVlMprkLUqScjD@vger.kernel.org
X-Gm-Message-State: AFq9FYKaaqCrYJ9Gs71I5yPVfBcL12QD7H/uFNH4uz+UKqY31lJjeKEI
	+cYFu//Zhuz6kBP5HqcGVJjNs/EeSfDe/97XXoJR+5W4pofWppJuFArNdMBREUgn85cq1dAjX8o
	Ak2QdnNDy9K9WSkgEEpqIARLussXLsuD7cLlMaRg5YddNtDAtv59dzrcl14fQVn8ThCZeWt9j
X-Gm-Gg: AYBFou1ouOCOMh5VrzrlUIbyZptdJIPZS8dsJrJUTpgsjjGXY8U8NbiftnQsxvm0lqW
	HbOqkN/+6q5AErgitA8wu7BX/PR6hbGI3PDBuioJK/x2AeLLav/6j+2B7yVvP04USF4g/f8tNFS
	SyoSQ6Il/cydipii2mlK/25w2TRGO9as0oI2rr6TqsX1gMwrWc6MUUNCM8dOdCT+mngiQ1DTrtQ
	jX2s5b3SHUf3Juc0zJwYXBm0wmowhvcSI7p1Y+82Xpmx43H+UhEZHdfi99/ErJsOi+l95UrVRjs
	SZWiY6IWWd4FSNbpYc3fGH94oq+Yk/TEpr+ZouneWq5Q5x7+x9J6949cuodZmgc+sNOIEE9y9Nv
	0X66vZV5efiUokudVu/L2iJvWpaBHN14gMU0AKwGw7H7qIpyrzIq2obLlES8=
X-Received: by 2002:a05:7300:2143:b0:340:e422:fd3d with SMTP id 5a478bee46e88-34cdbad6906mr196173eec.17.1790734077112;
        Tue, 29 Sep 2026 19:07:57 -0700 (PDT)
X-Received: by 2002:a05:7300:2143:b0:340:e422:fd3d with SMTP id 5a478bee46e88-34cdbad6906mr196126eec.17.1790734076558;
        Tue, 29 Sep 2026 19:07:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c386b6bd9sm2782812eec.16.2026.09.29.19.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 19:07:56 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Drop early_boot flag for Nord ADSP
Date: Wed, 30 Sep 2026 10:07:45 +0800
Message-ID: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAwOCBTYWx0ZWRfX/HWhf4j1fx3N
 Z3p9yUQZopEU1Z2TaeuwDmGOw2A2oj0m92SU0lwMwgR8QKsiVslRj3T5ZRK/ZN3l8NX45yMBDhZ
 IPfKmUv2DYfyV7PGJVyk0po6JAEvrmt66pNhiY4bZrAuYvlGkGkQCA7f7qIBPeXUXYVJ/jG8cMZ
 FY020K+iKEBljghcVjzMpm8gKCmTKHpNw4VnXKTkGw9Z70qZoViNRTCC4v/4h3QitCq5JwJVqUj
 908iJISrAiO3uuCKqG1+Bpybrf38IhLTG+Vwg1RzUL5txtdB+S1m50f7WWqhy043JZtebFd6HbV
 G5aF7sGmpFYsC/rnibyOMgZA4b5iS+2B4dHD3mR/M4R00LRL+UIslIC8DDXdcebpG3ozr3NfiDt
 TUKL55bVf5+3Y4Q+lR8K2QushGlReNCEog5MAnXf4nH5FwdWGmQEq34TZVVnAW3lfMQKrupdoH8
 GGpkWuTLk0l33HKBgtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAwOCBTYWx0ZWRfX6j4jgfpiTAck
 yloILFOmsniuhFToKyEXJLFH4ARiBS2Z/nks6793jrgWfJnAIWxX10391a3pkWEhPNMDR4TipHZ
 Qt7LcQljZdD4YqL/nVU+S8zAUHatePg=
X-Authority-Analysis: v=2.4 cv=LaWpeTfi c=1 sm=1 tr=0 ts=6abc6efd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=sh0ooE54KQypwE_MK_IA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: pukro6r7AuBv0bJe5ZdZLjeaI6ozqFH1
X-Proofpoint-ORIG-GUID: pukro6r7AuBv0bJe5ZdZLjeaI6ozqFH1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300008

Qualcomm NHLOS team changes XBL for Nord IOT/Embedded variant, leaving
ADSP to be powered up by Linux remoteproc, so that Nord IQ10 Qualcomm
Linux (QLI) behavior gets aligned with IQ8/9. Drop early_boot flag from
Nord ADSP for that purpose.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2e1e39826ffa..9e7fb5c5610e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1582,7 +1582,6 @@ static const struct qcom_pas_data nord_adsp_resource = {
 	.dtb_pas_id = 36,
 	.minidump_id = 5,
 	.auto_boot = true,
-	.early_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",
 		"mx",
-- 
2.43.0

