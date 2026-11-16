Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846136;
	b=vApL+i607FgWaGkycIOHfwIB2bM+9TylFKELH7Asi5KdrXanZ6ZyoDwYRMlv+4yJK8lw
	 Q/tMT4REEhPBBEc9RvmmFC4Mh64RywakFkZHVjm/JgVCyJPbhSMODS+UMObjt3eiUsSu4
	 QhaHt2sPE5f/Q+mm1zALl43f835SjyIsAwAfJgFA03O6AEthGYUB4CMs5FnDIs6iRlgNO
	 C+XnbPPgeTKlSJ6ujkgQ5RKuIn54fdg7BW3CDK5GndMT/XUWFR6D1RUvnn8LXQhYpJwyx
	 XilG5HLPYa/LOAJRhSbBEIK9IMMD+ESHM7FPrksJ2PfWummKO2X51Ijz7dJ/x5phN6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k5XQA/BMzueiAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=;
	b=1pD3JivOhr6Set6CNNOm8fSBOD7bP3FDM6OrHdv07Osq2IBZg9ErKYeDzDmUWSUftJPH
	 EhrP9PR2ibYRlYtu82F2IpSe1ZV0kYzhUdPRlNhDISkBaTBExeqyDQfM4g3Cku4cJxfaV
	 5/MYLQWHnCDse6cCfty/1GwmLGrtxmDMg+g7YAxWszf20gdf1h4mTLWAlOudqEdJn7glx
	 aa1gPw5cU8UL+0YJyd7ZBHBH3GG5ZmO/2HiX3VF5/E5ZSzPbbkKaGoGOHtC0JEanvujXo
	 +IjNwei5jcbjfP9H3U708mPE95iWWPl/A0Y+YhlBmcrYo7Txjaoe/M3NbZ7ZZsEjtnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iaOQbQ/V";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idBLOiMA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CA1606A32F
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19CA1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iaOQbQ/V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=idBLOiMA
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIG2u2126182
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k5XQA/BMzue
	iAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=; b=iaOQbQ/VnwK28Q7DB7onLCF1Vyv
	PQESzDoSFO1a/4RMUY/krilKAOkTsodyyfsg7daDC6nWKq9wBQINmJI4VospHbQu
	v4AvglZihlgUcqU0u8uidncVsg//B3evdhwddZuDa2qW8Sl/Ydbslys2C7JihE9b
	Ehd4oFDFdgQGVzgVIGxsKlcnIhBP9OljwUArJxBY53yks6K/IVXxiKaBrnsV5g0V
	+jBey2O14f2+UkW6oAtbZttFS9buS3FX5nOhyFT0AbtX0kepV8qrBdWEXTnO2m+b
	3o3dBNvbZgBtrcbRlwaXQan6GqLEDs/0yFEA3NOfdGK6LczaMljfKnoYqQw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2hnnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:22:14 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b45597c7so1916846c88.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846134; x=1795450934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5XQA/BMzueiAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=;
        b=idBLOiMAfkhXVjCCt2oOtWQV2K22SbQ94vCrOVFdEWNLgR/9Zn0MHMeKRBW5MAuUKr
         GFtqMH/OOsH0Q/vhhGt7X9KbQ+lhtXMqXKWeZkPVaqc871X0wNtzF0YILFycRxMP0RM1
         IypFac2P+tdGIa7auuHFK6N9eP/rv1DD/yu/EAPhL21jm85IGGEvWqnTx39qvhoBEKwm
         E1GBU6XUI++otMmK8omq55WCxq4jxFXnKGjuQe+omGw9uyyB2e6PhZaJzHcjfklb7XLx
         gSg2UjdJUro6IPcGi6mi+pmRThpGzObfzzyV8S774E8HiHRF7xWN0S1R8tKRYFoXqgNm
         N7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846134; x=1795450934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5XQA/BMzueiAfY2ScGRfdX/31fwXQIQ8yG08xIXEKI=;
        b=wB17gDZSqmKLc32AXRqXKDt1AXiu2dlYaJyyvqSPZZk34bEADOmsqfbnPxrewk+Fdi
         2qdvTEd7UDbQCgs8QmJ5UPN8nA6Jt9TKy8jDN3sY8KN2TWhFJuICq5M0E6hDlTFRPF9L
         QPYhkIkCFrttNOHXy47W2NKb17yPTrr9TVcgrQwuHP/diYQ/RKt5Fm0WnihK5m5mN5Zw
         /eGy5YQ0SDwCYWoGMWT7QeF6evodUoC6r1HfezlahYgW6KZkHENihUZC2+rdpKf5cBDv
         duIcCVZV7edZL2QFAjdoKTYU7wYqp9y8V2SBsulzummAqnplFIxrOH07QH7F39Hb4NJs
         19/w==
X-Forwarded-Encrypted: i=1; AL+hErGadtF19lxDeesvkGgCSLyKZ5Cq0ZRoD7xDHrCjsTEFfZ6sPstF6jCA2epRlqIuF9Um7F7XcYDGr7N6EdWxMMeb@vger.kernel.org
X-Gm-Message-State: APuU4Z8Srx9t9YNRqSETILdwGYD2zc94EdesyCf7ej3+W/Ui1+X88bBk
	J0sYXPKsL07OaQWwZ4dZFt1tSHLD0Va1GvkLg0L6OFkO/D4Ihxvl1/a77gqYCzovF4qbVa3xKFD
	FUmdSMumvQZaXraTBv/s79ai/fTk+ijReaDkfnUJ1MmnfJqez8OlMuu97TFIfeM5GN/K35NzX
X-Gm-Gg: AYBFou1fqMfV+FZiWPq4KKzJJM3YUzu9VwKC4FCFd+cZOtqeE+ylUVFHXZD+DU9ZXXs
	xnENOWTITZk+YtQN/ZJ2mA7JfaI1j+Y26F4jNt4whoF4kBKOhJ2bUoco/RDn1oZfSSiGjA8eIAo
	NeiOvHISIZH+g2pfNBmng7K+HdtUqJPH9dqKaE81vKC3n4LAjPMZy4wY2xPZPy79f5gj6C1stbA
	SsU1/VEZZMKABakMPlZ+ipE9UNqUqjK8M+SU8notW3V4/xjpd3Qvt50rrqKPkkITGbkeuMSYQFr
	TdBa97XP8eb3QyMBJFaSo9nveII51Fek/UnZyX54PEg5IkHcP8sdms+gerJU+qD2jdNuXhS83PI
	W+9fJmkLOE00HHcifV4FRd1T9FiubXL7kulUS14mB1NawK72JMESbpETa85L9/fzStjMp1WCHgR
	dZ
X-Received: by 2002:a05:7023:a4b:20b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b5030fb74emr12065904c88.19.1794846133557;
        Mon, 16 Nov 2026 08:22:13 -0800 (PST)
X-Received: by 2002:a05:7023:a4b:20b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b5030fb74emr12065862c88.19.1794846132861;
        Mon, 16 Nov 2026 08:22:12 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:12 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
Subject: [PATCH v3 1/9] firmware: qcom: pas: add qcom_pas_context_init() for pre-allocated context
Date: Mon, 16 Nov 2026 21:51:40 +0530
Message-ID: <20261116162148.2864501-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afb2db7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=A8JJMgtFIkyHT4jqAlUA:9 a=Fk4IpSoW4aLDllm1B1p-:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX9Sb1BPKEcU6L
 SvLWLNvnI+W5IDNrDQKJwIE0JYk8DfV2MPKzMrO3+42Y7q19cSoOPUsec1J4Yii/YH9HMVrB3Dt
 SDgc4ACfKp7cWz2+a//o74RaTeZ3WVY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX7dYWc6S4w8G9
 Mj7zS3fx4vRXTDGlsjsukwrn2i8O/nDuqsUFy2P3AmPoWJvajQ3oXI3U4YIoanWTZB7lgo9/ltJ
 UwRvKvh9+uAeujYMiC7n2+yCOw8kJ9K1M6We1YRkAeZYoNHetj49tm5t5sIVw+hIKXuIW+ECtGp
 EnPMjBIk+yXGyqfgMJS1nfkavDOzpz7zEgmcsq65pdOcqiJsv5nQSez+51AhCBTqR7oYzzQCjLK
 ZCUPI7qhFjJMHHB5sw/gu8VEu/7V+lwM5pSRarBO0ElPnQQk7HgZTq++9mN9715HyyQFDwB2qIq
 lYuHo/KSsaiZkWuZmlAlKlA6pAuoEeOpZRb5Ue64tAqu1qeyaeGQLBrK6ssGvXsuSShkjh/MMaE
 cwrU0qPksuqEUhd1I2oypxgCi0LABElWpPRKjcvcEUzt4B+M6+4kErSYgntzRsvmMxMCvIKzkLm
 tPW6bp3VWTb0Tn+bf9w==
X-Proofpoint-GUID: KWjv5hfxKKBTx_Mqtv-dBnbzv7Mb3f8O
X-Proofpoint-ORIG-GUID: KWjv5hfxKKBTx_Mqtv-dBnbzv7Mb3f8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

devm_qcom_pas_context_alloc() allocates and initializes a struct
qcom_pas_context using devres.  Several callers, however, either live
entirely on the stack (short-lived helper functions) or embed the
context in a larger structure that is already managed by other means.
Forcing those callers through the devm allocation path is wasteful and,
in the case of functions called on every power cycle, causes a devres
entry to accumulate on every invocation.

Add qcom_pas_context_init() that initializes a caller-supplied struct
qcom_pas_context in place using memset + field assignment, with no
allocation at all.  Rework devm_qcom_pas_context_alloc() to delegate
to qcom_pas_context_init() after the kzalloc, so both helpers share
the same initialization logic.

Update the kernel-doc for qcom_mdt_pas_load() to reflect that the PAS
context may now be initialized by either qcom_pas_context_init() or
devm_qcom_pas_context_alloc().

Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_pas.c       | 26 ++++++++++++++++++++++----
 drivers/soc/qcom/mdt_loader.c          |  4 ++--
 include/linux/firmware/qcom/qcom_pas.h |  2 ++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
index d74dd7b4f332..fdf62003fbf1 100644
--- a/drivers/firmware/qcom/qcom_pas.c
+++ b/drivers/firmware/qcom/qcom_pas.c
@@ -14,6 +14,27 @@
 
 static struct qcom_pas_ops *ops_ptr;
 
+/**
+ * qcom_pas_context_init() - Initialize a peripheral authentication service
+ *			     context for a given peripheral
+ *
+ * @ctx:	  Caller-provided PAS context to initialize
+ * @dev:	  PAS firmware device
+ * @pas_id:	  peripheral authentication service id
+ * @mem_phys:	  Subsystem reserve memory start address
+ * @mem_size:	  Subsystem reserve memory size
+ */
+void qcom_pas_context_init(struct qcom_pas_context *ctx, struct device *dev,
+			   u32 pas_id, phys_addr_t mem_phys, size_t mem_size)
+{
+	memset(ctx, 0, sizeof(*ctx));
+	ctx->dev = dev;
+	ctx->pas_id = pas_id;
+	ctx->mem_phys = mem_phys;
+	ctx->mem_size = mem_size;
+}
+EXPORT_SYMBOL_GPL(qcom_pas_context_init);
+
 /**
  * devm_qcom_pas_context_alloc() - Allocate peripheral authentication service
  *				   context for a given peripheral
@@ -39,10 +60,7 @@ struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
-	ctx->dev = dev;
-	ctx->pas_id = pas_id;
-	ctx->mem_phys = mem_phys;
-	ctx->mem_size = mem_size;
+	qcom_pas_context_init(ctx, dev, pas_id, mem_phys, mem_size);
 
 	return ctx;
 }
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0d55e9e0af3f..c6ec67e1da09 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -476,8 +476,8 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * firmware segments (e.g., .bXX files). Authentication of the segments done
  * by a separate call.
  *
- * The PAS context must be initialized using devm_qcom_pas_context_alloc()
- * prior to invoking this function.
+ * The PAS context must be initialized using qcom_pas_context_init() or
+ * devm_qcom_pas_context_alloc() prior to invoking this function.
  *
  * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
  * @fw:         Firmware object representing the .mdt file
diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
index 1d132e89536e..458075868bf5 100644
--- a/include/linux/firmware/qcom/qcom_pas.h
+++ b/include/linux/firmware/qcom/qcom_pas.h
@@ -36,6 +36,8 @@ static inline void __iomem *qcom_pas_ctx_map(struct qcom_pas_context *ctx)
 }
 
 bool qcom_pas_is_available(void);
+void qcom_pas_context_init(struct qcom_pas_context *ctx, struct device *dev,
+			   u32 pas_id, phys_addr_t mem_phys, size_t mem_size);
 struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
 						     u32 pas_id,
 						     phys_addr_t mem_phys,
-- 
2.55.0

