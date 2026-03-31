Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98853A4F25
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 19:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984359; cv=none; b=usH/ltOFyrHYuN+RTCBqbKUFG8VISeyD6UYcOaab143V47ldUijpKeAGARy6Gy912S1TsUsC3oNqRSju1fDvDrlyGSqOjhWTbquMn2fyvbIJdW6g3nsIYUQlMcpAzMYBZr/tkX0smZ/Qkol7pcU0FcXOEEgXkOUCVM3SgWtVjm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984359; c=relaxed/simple;
	bh=9iCZ6Y9JZJ0ql4zO6g0u40F5yUinWBuqkF9YlqEsXG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKi8PCCEC4vumbwAORrQJRWYKbth0sqRQL+jnWfrd7shbtJvw5O7QI5hxY39G8wsrEkbiQfzdE9iCPNXfEodgLH0+B9OMrq/1RvAXMqWHB327RPrSh9oTyMZyF3YRqI6UQ/KYl6rMtKxhg6jHtJuKtq/cftQaKVbu23+9+BGrjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTC0Qq/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hjm+BDRG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTC0Qq/E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hjm+BDRG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdmNQ3663951
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 19:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gqpEz+RTNlp
	93OOiv3jLTTu56K0Z1MoYtFUupVB0+J4=; b=FTC0Qq/EPFGsi9+vm2F+Zo3I2M8
	maC3yIWhKhGVjMgCvQqr4XIK7gs9ydNHh7FYOzVgUAGZG2HvgAZ75Jq96KClMt6I
	P9B+cv4xTu5QtZY6vXbi1yh8B57QYqXAOzm6Ja9vphsdkdvzRUs/Jcd7VVNwiQdc
	XeIHJsF+aCv04Wud/1MFcZUBxbUqcXYz9DKtN3ujlOrQWVGgjId3TavnBpUECMj+
	ezyshsZgI0TveLaYs5xlnYZLiDYcDpIxPsGmwFXGGZDNjk0CGByM69ND9HY47nhl
	DpQztL7uq7BWBFfuAMoLefVqfnneZXKd9aeAAyhztQqrunHsV5RsZERZ1Lw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga3atj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 19:12:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0c96f5d9aso66336565ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 31 Mar 2026 12:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774984357; x=1775589157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqpEz+RTNlp93OOiv3jLTTu56K0Z1MoYtFUupVB0+J4=;
        b=Hjm+BDRGI4bg6wSDjvTIiSNhahvT3PR3JkAG/mQD4hxZbLpfXTeC1Xh1p5eJcSp9YG
         jIqWxsrUAfm7NSW5xDVFEE4jRS1Q7a2lA2IsUTHtaTfNl4SOl3zAe72oq8ocGTlLnuRq
         O/BuazhswRS91ImVz2oT7L+YhASOkTZSRjN3BqceHL1lw2vzRHzkTlzxorVoDIg99SHe
         C+W2cPZMJhYt91pabKKkOxvpjaGpfokcGSnJjGbMmKQ3P6CPtK6b+mHlCIsGJ9QWlalR
         sLeetAOsJS81rY9/0pXVgavi5mXKQo5IVq8VKVZd2+nPaWZspk9rIYaFpf23t202yMXh
         vlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774984357; x=1775589157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gqpEz+RTNlp93OOiv3jLTTu56K0Z1MoYtFUupVB0+J4=;
        b=L3+0qsaoQR0ECdSMkya6f3Nu7TkmGrWQbuFuGm90046OTq92/lZVPityQojHkZt7Ci
         Ki5z7zNuWkGxsVXxOTciLk9n1GdEF5Umg0VMltK741wtF5soWgZAM6Indrd/u8rJouKk
         d1K+NniFTnlzGy5qLm85LK1I+zhfz/ekzMx6Sv2OicMDQN8XX/fILo+CYYJb30cZs1KY
         6vDNqXjrhJBMlQvjQA/mnpNde8U14qfGBy/Q4wAyg7BgAvL3+vFytXGOLVE7JXoHbcuk
         gqF9xV1gdVu2G8gzpMITA9ohGPVHTt0C6cCtrmDH08dFwD15P0Po3cqB32inthCDQ2ou
         9kBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBediDQomhr2alNkFNxbkxWim0XbZAQTXjYBJo0BsHc3E20RW1UWXM/Os3hONecn1dAYSxR5iPkcqi8NEHrEF/@vger.kernel.org
X-Gm-Message-State: AOJu0YxDCea0MLXgcYGZmHTgPJz5kPZX4nAUJV3CsQ7FuQXRIYBzi+62
	wc7O6AXymBkwKSwIlF3ZHnL0pOGAH1+SG6FQF8dWjVUYAi4vcRD1PJjcF4PjaAslh+LUaHSnkcY
	kfVJSeETIJkL3poerOZFJ42jL+jid0uLJHvAyOjLYti3RcqU0l65zpXG03emYyMTdWO9rr7yT
X-Gm-Gg: ATEYQzy+A1IqIyx0DYStKSxHKJrZMgfCcgrgkpfAjr2mu+dft7TAAiXjpdD7qeRhk6Q
	nPWX7WkWhw4+x3yIVYhltjamnhqRTCZJ6L/BwaF5hLky1OVszGqLKG/bhu5RobTob0+p4BiyJ5q
	wZKkPQB2oOjSui1c3I1ch+Zdj7LuEAq/rCqe/vMVp/4wFEkHmBxIRaM5mzvnIaozoXQVcVW9rvW
	DmRTbPsu+m5le27kO6d1r1IQ5yC9+WBXBPS9CSwyRcgph1uGaRr+vcwQ/xDqK07c+sWdexxif3s
	OWYKuKLU9Krqg7QZReWV8vav3uhghFn3NiiCz5HgIl4gxYxf+427Zr7VMUadlIIoFBCWJrltyL3
	q/y4RXoREueOVQTqk0bO5zPFArdTq8IstI1Cx1xR9xuGh5ycv
X-Received: by 2002:a17:902:d592:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2b269ac58f4mr3535215ad.18.1774984357228;
        Tue, 31 Mar 2026 12:12:37 -0700 (PDT)
X-Received: by 2002:a17:902:d592:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2b269ac58f4mr3535015ad.18.1774984356711;
        Tue, 31 Mar 2026 12:12:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aafbsm152784535ad.19.2026.03.31.12.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:12:36 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 5/5] remoteproc: qcom: pas: Drop unused dtb_mem_region field
Date: Wed,  1 Apr 2026 00:42:10 +0530
Message-ID: <20260331191210.2019758-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com>
References: <20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cc1ca5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FNOO_Oh7U0b_lUwsflcA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: H7j-0eeaxR-d4VRfo6lGx6q--CTtAS0L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4NCBTYWx0ZWRfXznABNXBS84U6
 BuRMUytMkHr3lTRcaUVopvdAX/WLMX3KxA7Y7lL6+D6BRt6/znBD9i3hZZRNV/+izQg1bqCQ5oD
 IgWtc7ADa8dtxTysHgYzdECWaZr6Sw8bEHdpij7n/um87cWnRGb4tnw42j43i7NW606iA6GoKVi
 ZpeJZ6P8FD57/j0qVDNCUi5+r5yhXtv/g1vykgVu+nP5GM+61fOWdLIdM6x4loKQq5GAsp6EsUn
 k8H2L8cSE5kiS1GLErmq7M4Dxs5KZP/e1O4bkFnHidzUkNUUxgPrYa16nTlt9wI/H1QraxgMTSK
 t+OsCxxdKLLgquacUtnR4MqVtD4Es/KpNpTXzjR/Q/6mfmiGQQYsVUTC/E99b0f54MqQMPNbbk8
 EhQ5LYKMI+MTdONxonJxhszXr+rRFYgQTAA2Nrp3FF8+uUF6Hslfi8MqInUccXdnyTXm8AbLEoc
 KGnx6xZ6b813u4t/PdQ==
X-Proofpoint-ORIG-GUID: H7j-0eeaxR-d4VRfo6lGx6q--CTtAS0L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310184

dtb_mem_region is no longer referenced after the ioremap was moved
to respective places where mapping is required. Remove it from
struct qcom_pas.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
changes in v3: https://lore.kernel.org/lkml/20260325191301.164579-3-mukesh.ojha@oss.qualcomm.com/
 - No change.

changes in v2: 
 - New change.

 drivers/remoteproc/qcom_q6v5_pas.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 53780efa8be8..e279f5060e46 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -100,8 +100,9 @@ struct qcom_pas {
 	phys_addr_t mem_reloc;
 	phys_addr_t dtb_mem_reloc;
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
+
 	void __iomem *mem_region;
-	void __iomem *dtb_mem_region;
+
 	size_t mem_size;
 	size_t dtb_mem_size;
 	size_t region_assign_size[MAX_ASSIGN_COUNT];
-- 
2.53.0

