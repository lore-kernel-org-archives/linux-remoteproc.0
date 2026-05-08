Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01C537E2F2
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2026 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224846; cv=none; b=k3jcG0+BcSdXPm1EJ8/ieE9D9FuQ1UuD/4wYMgiKzJQsCHWVKRVV/ezVaK9YLsur4Oi7urEb0xFIWqLsFoYVH87J79Du07fC5F4+x+EMWaM0TDjFbknJpMg6COXBiQz4TlPXZk6WeBc0MlNNzRC7f9tAx8hOaiaBGAahG7j7ACg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224846; c=relaxed/simple;
	bh=u9UYAcBfPm+Cjij/4yHsiT59K7r+ruo3k0BHpFBTT3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9PVaqKTnL88oBKtBWpTU8/YAyHeSIiRirlx1n4fTm2f7sIOsCLzDvQlZb+Y7TWEzJ2YxpAs9UcW4ttVf5COB7L4Hfu0q9jNTusqKiFTRND/BD9+kk9J1NN5EO0UGfm8cjh/+Ety3NetK5x2GGuz+zFpOZqzQiNZ5AnfzbJnYpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBPAc+7h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABfHGis9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBPAc+7h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABfHGis9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485b5rw2199402
	for <linux-remoteproc@vger.kernel.org>; Fri, 8 May 2026 07:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=; b=VBPAc+7h/Sx2KpVC
	c1AOX2zwrX+UavVJb/7CiJoyy36KcMqyViGhYdHGLOy/Xfx/SK+IiJHyUFU3D4xA
	uVYmV617SNPSF1N1f8NoKfJ7Taq7q9NSRzBtbAfcEizipnCKKxmBZ+ObXaXMFw5+
	NUqwweKNgjDGxxhQ2BcYoNmYhtTfF2MFbS0tH//4JE8axmI56ZUuKAFfOVdt4wDl
	UpKhu2tdAyDkOIcmtlEAbHTqGHa9dWKaOxAjt2YH4s5HePnRm95KmOL9WVsVgFEg
	muS4JnuulMwY8hLdfAc4GTM/rg/TiZ3qqJR3lpld9PXX1zgAdedyvmGDEnonwzt2
	FRMl7g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sj3vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 07:20:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-836d0184333so1676275b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778224840; x=1778829640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=;
        b=ABfHGis903TlkEsHK0c8Di8VxmOK2cvUl/v9NPDz89x/y1O+U9A+/+MqXZJuC+c8d9
         iQzytF/ukgCnREqxeFVGffA9v/KpaA9KKPUCnMaIn1aOdzFKsfNrvPy0R67ES0/CiYS8
         4+cLi2HvcLFHYPpxC/PJCR2L0gvLd223nsZCd8O3RdlSkTs83TmofTkEw+lL/NEvQ1vB
         Znb0TojWAwqmubJwwWWfG4ewQJYBUUStmvHRq4kMOvk7tjYXxTFa4AxW8vapVXAQFhI1
         lTnRTfCyFgFEJWHwQgXaHCc70Tox0o3t4Gj45b24yBQ/aMiDNyPKWHG/VjtAdZ0urIQQ
         314g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224840; x=1778829640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L53kthztgvDO0gpZ7CrzJcti9CkeL2yF+aYSX5DyYaU=;
        b=b5Cglgx1iGm8KFp2/d0kfnqzF6M0Vl65SFnUpr9kUtIInOTEMelwE05H/0k/yyVdCn
         nLJdThsx6moNpa2ESwYzSt7M8ehpO17BnOTgUEOWEgtlPqQches9tdNyHgZfeBN/dw0C
         7j2ikTSMlXJ6ieT3J0vmZ/xkyGc23lsaGfPp7/7xdtRPX1LGpYj57GczlAlq784nOM7L
         YULZ8P/4eLfr36wi6JMVTULVkJQ3q4e5Wz/k/QjfWs4aLUqYWmiVlOt5fFFWx/kHA9a7
         JvaaVonFovPyVuSGm/ymbhTkd9AqcMgeewtIbhvbYO9/gGXUl2x9ZTKu/4TfcAbLMXil
         mwVA==
X-Forwarded-Encrypted: i=1; AFNElJ+MvG66xJQ1W06db9aq7AaX4KjXGxFErfzsWGrlMnFZhCPiaPCL8bNxczlJo992n9nSeRN+ztxmBsilCbd7ik96@vger.kernel.org
X-Gm-Message-State: AOJu0YyxCINaxv7kPQb9i2+KoDz6WDyiCh9Z/ItDTZy/w85mTvTu0ZeT
	0VwYZRBDd0SFufWlxvVg6ydA1mvlD+k2xcrbWBYy4j7b0NhP0kGKQDNU9TIeinSIY1dEpbUC4Xo
	qHMluNIxoi7FVMG0+VZkqPzPlx2F+uGPq3HVLlaUFgYNAGQkVxP18kTVkX3jQgxVh10tlRsuD
X-Gm-Gg: AeBDieuibrNV1uehKTBaH0YpiC1ilmjJMIPCEloa4t5nkiuGY20KnyHWd6vHXyBMkRq
	JjlgMwEt/aXRUifFDo4utxL3iQqsaqK76wrd7M8lKRL0iu3O4pDVg7B2emD2EG6XwV3UGzmhaar
	n9roLycsTqIi/VZpU1FxkFQC1YyEjkRZ/H2eP17urou3F+MYKFsnNDV2TKk0VM45sbvOe61fgaQ
	3Niks4E1qM76juAo1FrzepORSCxWJQEB+nu+ib/RfuhPcnvGWhGrMPt0+Y7vRXNTMzf/UfwKGUI
	T86j7O1EmrRFyySUFXeKVlMWxek8F74pshD73myScp90V3Obz0xLPGHzQYNoZz1l2sARBVGjwhK
	YYrapqikPBLoJWuirB+q90uyNsrsTlck5FHujLvvn4DSAZDm3Jss=
X-Received: by 2002:a05:6a00:1ace:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-83a5d873226mr10911681b3a.30.1778224840144;
        Fri, 08 May 2026 00:20:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ace:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-83a5d873226mr10911652b3a.30.1778224839633;
        Fri, 08 May 2026 00:20:39 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm14566685b3a.17.2026.05.08.00.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:20:39 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 12:49:50 +0530
Subject: [PATCH v2 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v2-4-ab76fd9e71de@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778224815; l=1107;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=QPOvZ4FdMA2wnx84lf4VqyIVMhJ9E7QIKahaQXRd0/E=;
 b=82mwbwOr0ZKBOub5kRgRJXn9IsEfwKmYiz5+sD7tYbxZTcQyYwvEdscH+tBgld5nw6LmwxhW1
 FDTx/jmeahiCMiCrcsedzSemJKuw79zp0z59UNIybMKRkrrIgF2nNyR
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA3MiBTYWx0ZWRfX+8KbeaRXhYYI
 wlpIcZDvXRQzMXbtSST14vdhD0kis7xMGDSRGQRsaCxjU0aVtwk7esWX8RJzZXuLePYTvlwqLVu
 Pli5MxWrwKfBO2OkLgMvc/EOFSbHR1Uo9I4n+ENldj6nuuw/yCwimIjZn9D9mXRrtXd6hW4bP4q
 ebul/v2Aol08KthcclQSGMvc3c9kHw1x0bE56WN0I64nzgHpGsBNyZTAyA1xXIIYmz2S5TcnAFd
 8PHGC/6cDeMLdDTD2uRGyA+u6+EKFHB8IhksLu/F4QkfH0RuyBeIB+jOXoiI8Im/lkfGmhhFSr4
 G7YrvQ4xiz0Hl9ekVIxNjtjmsY6vKeGlIAqeZyY9EePvH2+OW9FImdcNYBeQVAjnFIVbwLsDWKd
 qW+6ngYCpt5Zj+LVlGXz36u8e/qtARHNh9sXU2Wmln2Vz9gQgqhQ/Ktypz3xGGNH6FWMP9jVosN
 tiKyb/Fz4cqUNGkDLgA==
X-Proofpoint-ORIG-GUID: o5Nv4fCr8K9LdVeeTJVv28c8Y4fpoIqi
X-Proofpoint-GUID: o5Nv4fCr8K9LdVeeTJVv28c8Y4fpoIqi
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fd8ec9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3n6LiYR9N_aqWDaFmTgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080072

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Enable Shikra APCS IPC support by adding the compatible.
It reuses apps_shared_apcs_data.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
 	{}
 };

-- 
2.34.1

