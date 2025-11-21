Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492E834B1AD
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722919; cv=none; b=BpTqSosv0T0jYqp88nRv/zFW796MBzen8pli11RCzLIuNIEaQ3Tr92O1X+3z0psJYT+oE/mV2ByLckGM1xAQTXNzI6KUDbxNjeGeb+cx78eslI+VT8PWIla1aNGvRP/77ToU8qYHb89TSY2lA6RBR6ksAy9BC6zKVaWOYfv3mfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722919; c=relaxed/simple;
	bh=UqFfKH9OQZ2/b4o5VCHbeXo4Mslpo8i6J1vh9DY1woc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZK+snN/DA/Vib0leYrQlvz09dU+2gqtJ2L8+CbYyadAFZGaOFPAtOsil2d1EFF7JnNv1CmCnxB4VdMqQRByt+Zzh2GhIpmWfpmIpiFsRQ7PEQRsx63UxznO85IylSdQpBKp9lpaSpc0nM/NoHe+vC+i3lDVzJduxJAN2Sp0BA2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MmM115u6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAW0TW08; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MmM115u6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAW0TW08"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8Yu7k3139652
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TxCwmKSgjjNw13n9fGKA0+T8D45i0tXimnQWF4HRz2g=; b=MmM115u6Ax2YZ09J
	ImgNd+vp2INJTy5BY/6aFzyQxcU7j9zApMVFBwqLTE3Tx4/D2Nfsp+xeRO8+iDS2
	VEWVf7UntSY2XjI/gGiV7pWZI6zt+K5udT+BkBwvQbYwLPqKgj7gbvQi7Iu/Vfci
	NQIpOCqNqZ035Cd5oEL6jY/o0YAdj4uajBAr6CniLmrJWtIXS0WohNfA79HV/FtF
	0M3ajDz/CsijM9xXYvX/AslhJ/XperAn9ZpIUVzuzUhOk2Vi4Pbz72JHcDvi64yE
	sDuWtH3JiZmlLU7qBCuT4JDyHJzS+KP5boX9P56wX1DQIU8HjsjpEDNKKrmzU86W
	zQU7kQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmppgm2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:01:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34374bfbcccso2062012a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 03:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722916; x=1764327716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxCwmKSgjjNw13n9fGKA0+T8D45i0tXimnQWF4HRz2g=;
        b=RAW0TW080HXmRVEwKBWmCav88Q9kACR4QXqiotBLuqR8z3IOCn3GK65HufxMR6ReLd
         Kn4VYONBWKtj29UIJQQvzDSGhhKcBvERbSazaalN0p/gOSekFJBQqsIHnOuq32jQ4OTT
         RTTow+JFtYqM7xbZl6IDXnRxBSlbrIG5MVwr+Gu7Luy9DFdkyLWwHxJeHpN7AKG360gK
         5kxu6+q6/OUvSLDWtDVLHx7o/nN8Zc1LywIy3U0kOzKOt76vqKBg5E57CqbCIk8rVwd4
         RrUl+bNi5b7zdZaX+cQ0t1dV9dOhdCFwW8uUZhnYxes71BkIuSrra+wnH7KrjelBoG/I
         QWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722916; x=1764327716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TxCwmKSgjjNw13n9fGKA0+T8D45i0tXimnQWF4HRz2g=;
        b=b34BQBiTdaT3sUs4rJhKyWFWhGbfIz9OeJw6o2EPn9ftlkcu5G2VEGkz+JVUhxeZXY
         v4dzuQoGELFRI7lxvyXNaOMmH9F2lbjsftKTdaBMF9dqrFWpSbtNtNjeTr+peZOVCwj8
         coGMpeqS5zr7v5mXAH+fm+tNYTerpmKl6koir19h/AY2QsRvhW8Xui7VKx+H1/Dfivsp
         9YP72a8Cfipmem11K17dlC7Os30hFodNo7gbeTP8Cl1oSbNW7o3T5wwGrkXzAwFJgGZ5
         FELPjrDQv+A32FAlLM1NR+6y5TBM4cPTCERE5zcXU4KZcRuk6qrlI2xwobb57/SIiO15
         SNMw==
X-Forwarded-Encrypted: i=1; AJvYcCUTL23Pt35UP9poW85vVoU2joPwxPtRq+q960d2radGvUKwS61ckgKlvFkbtbVKXmMkFCFTYGrTRBY/IFJX9IOy@vger.kernel.org
X-Gm-Message-State: AOJu0YwU6l/ekZpDuc7zaCvOTmZE5ktabl4Erx/5zd40Bo4UWjVPEwSZ
	hBAof3g7QouPxlB+nYZs3xI6/jZ8/kl3KEWH3rkG+lW7ujfJH7EQNBowf2y5O19lyjwavdEeNz4
	ylQOHoPS2GZJUDUHYojveuL27BIox5jEuTCap3Pvv29DZgkuNvHr13gGjdVFEASR4VUgDGQDS
X-Gm-Gg: ASbGnctKdQ0C2YBexdPGkzXzuBLlR4v7REY2I5UG9W/36talc6+veNaACvSx7yLCVGi
	P87bPVqKeOpzZ9YeLH1Bx/4+OI6vkxDT35iiJ1lza3tsdosINYp8poZkgMPs372YvqO4bWv+uQZ
	a9LW+YQG4nXPI7c2ZS2Eg3RzbAw6JQCnO4Io/IoT8DvdgZffRwK/rqnU6xjgNVxmanOHYI51OnL
	M9A+JMjlhcZj+Sx587o4UOfliE+SpOAxOaoIPmxe3sIm8sVmVpSnbGSD0+c1zqbwbLKWcFSrEYY
	hjPZrYu80+t1f+oWkh8EAHZ/V2v7xHWOlgw7VXgZxDp2IWx0jiyjDoqdyEVIRLQe8niDma898aM
	R/MKxS3/S0XakhQeTgyz0f8FPIoX89/gTFOxZ
X-Received: by 2002:a17:90b:1d8e:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-34733e6ca89mr2344635a91.9.1763722915440;
        Fri, 21 Nov 2025 03:01:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAU6fbd4UxdagtjFdeI2dmaV9rageThqIRRP4Uav4AtmbuVsJdn1nDo65ZeIRX/2x0AU6DnA==
X-Received: by 2002:a17:90b:1d8e:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-34733e6ca89mr2344579a91.9.1763722914733;
        Fri, 21 Nov 2025 03:01:54 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:01:54 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:10 +0530
Subject: [PATCH v8 08/14] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-8-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=4464;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=UqFfKH9OQZ2/b4o5VCHbeXo4Mslpo8i6J1vh9DY1woc=;
 b=/o8Qqz1ez1O2tJ0tSsDVKo5DEBeDJX5QdQsu0WqNFMhFto83aKEJFMHfxcLiefKgjNnPcw0Bf
 si6feT076I0DmwytTosjLJW8EKRZIMvpdMBz2ofYVUZRzLAbVONy2OZ
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: 0d4LPMPqkYoSFP9WDkhAmtlK3E0a_dYQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX9kxIG/PItLSj
 J9TIaw57upoaPfjfSlNKnPfvhhudOhiEe7xL+DZkOWbjw8VXdxU7tCJSWSz5kUyzOL9uAmvjt91
 Gy7GVW1rTAFiHaNSXPe/8BtTLxiw2lzN4YC3E3a3LbhmYBb0ZIid5MczDk3ZlYPKBwntwkEZDIl
 Yn5HglsiG8UpnoCINo0+RFT7F727PVPK6vbVWozj/wXAmgz3lE81z3ENG+xWwM11l4Nr2+ewo/y
 VdH6D9fKp2TqF/bDTBBmpTm8c1Dl0XymnptOY3OzzL+yh0yBYTOFvl/VUVsXcokHchb6qzPe8bR
 TM5+41GUIul/0T28Li2iFdFMOoB5Xa8NCciksYgn/bQYJtaAiEVtJMkb3oag9QFKgsSDLiEvBTM
 gwqSjanDmNoOqJ7ulMH1vLKac60Euw==
X-Proofpoint-GUID: 0d4LPMPqkYoSFP9WDkhAmtlK3E0a_dYQ
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=692046a4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XGel9bHSJmg9pP0w-tEA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210084

For memory passed to TrustZone (TZ), it must either be part of a pool
registered with TZ or explicitly registered via SHMbridge SMC calls.
When Gunyah hypervisor is present, PAS SMC calls from Linux running at
EL1 are trapped by Gunyah running @ EL2, which handles SHMbridge
creation for both metadata and remoteproc carveout memory before
invoking the calls to TZ.

On SoCs running with a non-Gunyah-based hypervisor, Linux must take
responsibility for creating the SHM bridge before invoking PAS SMC
calls. For the auth_and_reset() call, the remoteproc carveout memory
must first be registered with TZ via a SHMbridge SMC call and once
authentication and reset are complete, the SHMbridge memory can be
deregistered.

Introduce qcom_scm_pas_prepare_and_auth_reset(), which sets up the SHM
bridge over the remoteproc carveout memory when Linux operates at EL2.
This behavior is indicated by a new field added to the PAS context data
structure. The function then invokes the auth_and_reset SMC call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 48 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h |  2 ++
 2 files changed, 50 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 5fa974683ee0..fdb736d839db 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -765,6 +765,54 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
 
+/**
+ * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
+ *					   remote processor
+ *
+ * @ctx:	Context saved during call to qcom_scm_pas_context_init()
+ *
+ * This function performs the necessary steps to prepare a PAS subsystem,
+ * authenticate it using the provided metadata, and initiate a reset sequence.
+ *
+ * It should be used when Linux is in control setting up the IOMMU hardware
+ * for remote subsystem during secure firmware loading processes. The preparation
+ * step sets up a shmbridge over the firmware memory before TrustZone accesses the
+ * firmware memory region for authentication. The authentication step verifies
+ * the integrity and authenticity of the firmware or configuration using secure
+ * metadata. Finally, the reset step ensures the subsystem starts in a clean and
+ * sane state.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
+{
+	u64 handle;
+	int ret;
+
+	if (!ctx->has_iommu)
+		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
+
+	/*
+	 * When Linux running @ EL1, Gunyah hypervisor running @ EL2 traps the
+	 * auth_and_reset call and create an shmbridge on the remote subsystem
+	 * memory region and then invokes a call to TrustZone to authenticate.
+	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
+	 * subsequently call TrustZone for authenticate and reset.
+	 */
+	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
+	if (ret) {
+		dev_err(__scm->dev, "Failed to create shmbridge for PAS ID (%u): %d\n",
+			ctx->pas_id, ret);
+		return ret;
+	}
+
+	ret = qcom_scm_pas_auth_and_reset(ctx->pas_id);
+	qcom_tzmem_shm_bridge_delete(handle);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
+
 /**
  * qcom_scm_pas_shutdown() - Shut down the remote processor
  * @pas_id:	peripheral authentication service id
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index b10b1aeb32c6..ccb8b2e42237 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -74,6 +74,7 @@ struct qcom_scm_pas_context {
 	void *ptr;
 	dma_addr_t phys;
 	ssize_t size;
+	bool has_iommu;
 };
 
 struct qcom_scm_pas_context *devm_qcom_scm_pas_context_init(struct device *dev,
@@ -87,6 +88,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.50.1

