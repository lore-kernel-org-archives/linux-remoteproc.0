Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431113C060B
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776846821; cv=none; b=XjXxTubA3ZvxD30afI6xo9QXyqwWXjGTlLP+ht84slOdn6lmxrVFxKlbK0oCGM9aaBtuGxa8ljGdvI5pCU2Sn1fK40k07pQKssNqep9psUF6/qBcNeoFZdcrK3TMZqTpuGdSQ8O7a8A3u/sic9eH2YRXewuFxC9aCQPkccJXn3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776846821; c=relaxed/simple;
	bh=EZfodb3V9xhPDIXJ+omKEw8OXKrA8oHNo8LouqMb9NY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YsNZ9G+ab9U23WkW0FHICB+zv5YwtU+7VUy7iarlS1DkO6M2pgK86Dx6DVtGkwm+21w8blNPbcozG6QOCLWfqWYMHvBGjfJCoqbK8Q/dUhgybvp8vqZzDkJE2iXWySI+eD1+Tkp+1R6De+m8+fEyXVleMZRrdttBz28vihuXVbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2r3S5JO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7pGIeML; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2r3S5JO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7pGIeML"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M4jP9M4051042
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 08:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q5iZv5/Lp+zXQTNRWA2cAlbkpTK2f0JjgEP
	2tReXIyY=; b=G2r3S5JO4U+Qram8VCjo+bb4Oyz5GgUtTchUATnUP2cFhWJIvTU
	NrFGInx0S9UAXhM4lsl3cFlTVEHcOwoIB3SZu8kkDqfOAIuGsGCRHEbqnJkXJLaD
	Io2+OmRtpCdwl+8l3stn36PKJ4dyRemDqtsmqTInLSswvPXphQRK/URXY4rYlIJr
	dIMVW8/A4BUAZ+u24VRx7Y0UCRvlVB1VmQ230Hw0mYf/lxMQ+TyGoIk6ZLnpF7rk
	536SGIIbGxGrQKmvnxSBxUDFVlPzgyRu0UTTw4hLh1TlqoVdSCEwpOFOqHMqiJAX
	DGcJPFm4Ipo7EoLl0CJS+Ta6Q2YXQlWKYNg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfjhy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 08:33:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4b81c632so119677321cf.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776846818; x=1777451618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5iZv5/Lp+zXQTNRWA2cAlbkpTK2f0JjgEP2tReXIyY=;
        b=G7pGIeMLBcwBEIgoy+gSQajgwF/vPVd32kiLIaBgUKof6Gh6KWsiQHN0AeWY6CNk5t
         tPUGKYxMVHawGGWHb7bHApt41RJyLV9NCekgT/KLGAmaDgifam/OdvfXWBQscuisVDjB
         jte2naZ4BMF+z0qL6+BwwcDX7s9vJqOj7Eyid5XglhUgFz7aYiI3sKNIz22tiwc7ekQl
         jPUD/dxXANKJ/xDynisKVCXWKKVMaioSEICS4Pi5GYKsh/sJXrAvdlHaKRjDiaibjZ3c
         NtNzVjLGko9Lm2GTAjdGx4GOcyHE/UZmVN/5JfnAVGAYYz+PpRoFmPuLNnbX7rOyYAUy
         v63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776846818; x=1777451618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5iZv5/Lp+zXQTNRWA2cAlbkpTK2f0JjgEP2tReXIyY=;
        b=I7b0ZPknDokNt3mmcN+l4xIEZg2e/HNzcsBlJdEURdM4jPzJuzwNIF+BWfBygas1Gf
         y2LE9p7YYk/zMeyFaz9nNBR6YI67RXbd05lo3Wzgf6mtcrsN+iVZEG4Y4jjStpUiM+UM
         P5L0OPoc8ZA+YSuPHQy1WcH7xds/vK1pSy0ImhqakWSGlxXVv09UWZWD/YlxITlYWm5d
         9h6rv1Pqxn5J5DnmA8AbVodh6oTCrmfWw+tqzFAQZIU0lDT55ZUiTA2PvXWXqDm6jQWG
         kyGZ0r1N5BHDlJUlFXHnNXVA2t6uJm1sMk1sPQ0XQOV87S4NNiKQnNEbnjyR4TaUChbx
         ZqAw==
X-Forwarded-Encrypted: i=1; AFNElJ/wBmqpWplZzZMY8dtgN6Nyy1HNJGMNKu1xIbGwUOVyvdBHbPmtqGCi6m34bpw6UqGZBPmlwM+MPGoOqjxmGNmY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8IK+TRyTBcBPWseAjGrVrAMV9VLnQZZVl9cti1PFV2v0Rzb2R
	tDm/HgcNOesTf/p8D9OSyzTe5H3c78R9GXLvngKDp34VrTMGQVTmEIeJFIvRBqn6HsEn6Hosxv7
	ln5jU3QBe5Pkx+Ook4YVJwnEUAh/zGdVVHWuEDTxkN4nEpO760JmFMqac4g+FG3cOBgruXbhW
X-Gm-Gg: AeBDieskaPF2ZtoshPBIRz1WJm0YjkG8/frBUT8g54wpzsHU6/+1JQFeRZb2MnbGZ4W
	mDrzvzHicytBM0MRPNr5j+aQMqTX2WKH+IYBmq9PC2wsvbUbft6GJ38Mzp1bZZfnV6b2aGu175h
	WKcMsIi5xS3YLx91rP7ZBSX1sICymGx6vOM82bAbcqtoxUOSXhNz45ggXYirM20byhez35WSIyp
	pB51cM2ZJTSBPQV4n433SGComVERyIHaUSwRJPmvyQoWg/1T+dgnwMgAcUL3KceJ4QuRjR2ECe4
	SmhKUQd3U5taaGAIXV6MVeWT3TVLVyhBUhTK4YwSOb0ZMXU1glXFzM8l4EJbiYQkzybsfnN/vPY
	mue2hCd6Du+nUaXao8mwD8qxJ3SYZFsxOwkQtJ66gK+cZHFc=
X-Received: by 2002:a05:622a:10e:b0:50d:6ef4:b3ae with SMTP id d75a77b69052e-50e3681eff7mr321417391cf.7.1776846818260;
        Wed, 22 Apr 2026 01:33:38 -0700 (PDT)
X-Received: by 2002:a05:622a:10e:b0:50d:6ef4:b3ae with SMTP id d75a77b69052e-50e3681eff7mr321417081cf.7.1776846817828;
        Wed, 22 Apr 2026 01:33:37 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc177dafsm531454115e9.4.2026.04.22.01.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:33:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom: Unify user-visible "Qualcomm" name
Date: Wed, 22 Apr 2026 10:33:35 +0200
Message-ID: <20260422083334.84294-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=EZfodb3V9xhPDIXJ+omKEw8OXKrA8oHNo8LouqMb9NY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp6Ife9nxoQ5sxaZf5yynx+iMg3mP0F/S4VJ23V
 TH5Pf4fpnOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeiH3gAKCRDBN2bmhouD
 17nwD/9MlQGTC62fXav7Fogkt1NHdQfseLH+Htd0raylM4QoSglfMYnur6Em3g4CuNts9U4jKog
 5uVvLIiGMKTxbqSwAuz9i0w5sr/Oo3HQohR+e2i/d8Fp6eXvXDdoci2gWimKfEBCTQY3suVqpBo
 xm5E0tHMAeC8D0CmRdxvoJp8cjrV3pfoArS9btqNEkV9qpFj1wtT2vNNIHaisjvDmGeOsgLq76b
 VZG9vEnZ6IZvZWtSQjuzdD5UWp8FDUJLD5n/8BA3fmbpZ2qRR47v+cXZcUqqPloVtaN/dSTzKQ5
 OFKJR+uC9szV82zx9JoRbkmimHED2P+j94LOiwfHF4r+8B8ZlvCWKoxgpf2MJ9hsjAwOLdZn75N
 /vJmZ566I8baT+QpqZSMtWWAmLN5xBpy0zXAK8cOvftPuJtB9ooVyhybC58FiJ64/knWnOn/i2o
 zzUAMCODHapCAksH2zI0zdHjzW6yKBWiC6zh08RWNDMlIZAAiRxXJKae/gpIHZ0FzCdf99+2Y9l
 sxwccH18qGlxgPUnj4LPOxAteeMxqeOVnkmaT8vkrvOtNFDduDj+5AV7+EXYwRQVLzdng9UFaGv
 uD4j3j3PIDoy/UX2dCyuXJkeT6T/7Yntasl590b7FJcfa00/yjmrjVOZU6V54zAVXRm/U6+FcVo 7YWaDuUA4qHzS/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4MCBTYWx0ZWRfX0edBJKjWuR/7
 RkqNMV7CLyZX4ltlyNh6EJbsDU1w1jKxONjmLEEVgxjaGbQGEti//AsDBv5xnE/1ZPzFEtp0iKh
 SBcy8WZupChGM93On6axiWwwFSLhKbZ7x9gzz4aKT6MtJixX3gO7WAqjdP1WRg5Ql+X67n2GdIO
 vTGKZ1nAKG93e2zocVUGeYFEMi0iQonN1FQAjCtBPXZtBHg7+3IhO7IyWpKQniK23Abvd2oFa0h
 Q8eg5CzjHYmkJrcwE/2EatBUO3NjLKXZj6wGtMHaBx1m+H9GAojPwCpfAkbIWTIX9tq2ofo5p7h
 F9AdYG5I1GuIZa0bvtLxvPxj5hGdwvc1/m+lQNx+1A47hC0vyxj6QS6BmnReISbqnoXHrdQ5OF0
 7nARAzwOXEhnI0SQaR0x4DLQgyl8JaTFObDJ8eis/+tHlmwvXQKuThnOGK7c/gAyXCJTfz85kFt
 ZF/JuG9VAHKmqqQOpqg==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e887e3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jZsdTjkLNt5nVvcnXIMA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: dzPCVTYre0Ip2y4smdR2m8N970ySqz0h
X-Proofpoint-ORIG-GUID: dzPCVTYre0Ip2y4smdR2m8N970ySqz0h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220080

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/remoteproc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index ee54436fea5a..6b4104fe66a6 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -176,7 +176,7 @@ config QCOM_Q6V5_COMMON
 	depends on QCOM_SMEM
 
 config QCOM_Q6V5_ADSP
-	tristate "Qualcomm Technology Inc ADSP Peripheral Image Loader"
+	tristate "Qualcomm ADSP Peripheral Image Loader"
 	depends on OF && ARCH_QCOM
 	depends on QCOM_SMEM
 	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
-- 
2.51.0

