Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC2840F749
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228046; cv=none; b=JkKNbv/vXwe3I6Qe9OVmyK8fwK8ELcT7VGEPN2f1WNwt3GaQyKo2wsan4M6ueBX3x0VPa+8Ho1+ADV333R6bnDbS4ni6SPvb0uKFG5VMXCUdWvBWmHVv05eJFkJfNHxK/T9Zz2lKGhvthzWn5CmudbzaiEGErZEgZCkHIfv4a44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228046; c=relaxed/simple;
	bh=A+5TRK9EGz9fRh7GbcDS+rgwOlXWbnjXZFW1ALyzjTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bl46msbWLJ0kmohHKhZhPWi0EMQZI++OaUw0EhpCjmPIrYFanrwq2pry1WEmBSW8esG2BLhl96RE9FgnfVMi4v8unYudmKxpLsZhchyEo7F7WZWnwCt3hr9cbXTZl9LxMgL+lTAiyd/FfWfqgzZNf6F7tlse6RQH3j9KL3GHYfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VyiVAlhE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Elab3RL6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VyiVAlhE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Elab3RL6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82D6c2480120
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 08:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FKM8mzcDPeP
	brNMyncwZRP5amm3MqElucl2ZBJ9iPr8=; b=VyiVAlhEJfbPgj2JXw6Yxs51xIn
	v0huU0xmRSQjWR+D3xfKyrVZxbFidOobNHG8uAgiI+A+GTPdJ6pi64WmSOBIQBLj
	BhuZSi+9VsbLeL3qXESAicmifGHSnIsGoR6v/bGXq5JGZmENvbzVqMmqmZq1QJCX
	T2X+hhsMzIlx1VsmoxNtprlDt9CMG0oH1fUSiWDH/kiH+3FdMyIvkn3v2WS8FxjR
	eIiNKpBNz+yY4S7IhCTHKuH3qaCAbUMNoDIi3QiZo7ZhFEMo6SXAsX51XVwoS5be
	dcFVaaoD6ScGPw31UECaPtlbBE4wBu28U0uTNz3GOaQLntBHCtEUPps9UPQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy111c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 08:40:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so8963432a91.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 01:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785228043; x=1785832843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=Elab3RL6A3sEn2iP6E4OcpUJ4ZrGYeglSKBnmE2ropPrwcOzE8FGr1eoL1aSSD8V8X
         XCw1GIIS3fxT/ow1s6cDBo0Vz7Rn7x6l6KNhO3Ijd/1m40yGFWCAIbk9k69hDiOR0/EJ
         oaOOwWW2EcqI3pNS9Ex+7/qAyQDIQ1Zvxy4BLQNLJRW4a/j/L9OUwjFtBrM2KuKvyjqq
         UPOFc+VI/ZDDC3Fx1UgSa9rJB6GmYVoTBpBZ8oAM9Vs1JbnpxOsDrTPcMGUGyOEK4nF3
         3nTFbX7pkQ/WQID7j4Yb+PDu0xoK/mcuVg1QJG+97GbblNYsjziBEiSl7SEeXO+0Rmf6
         UqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228043; x=1785832843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKM8mzcDPePbrNMyncwZRP5amm3MqElucl2ZBJ9iPr8=;
        b=YhdLzCcXef4bls458YWtDtFUpWGjUW46OKRfz98X+oIpuWB1APIChtpDHiRuVszry0
         g9sF/N+mzfAhED/WpjEh8m7L2s8YxEnDyD9ShDYe5e3NYmRrE0raeXd6VkhRMOFcMXa6
         rJMf4DBPpBSdyRYrTL+XCXIFVJUP2lSInGrA4SWpuK3JVDneGooreG41Esf3iqnZo2b7
         qdNPawt9RCwRK3OLdF+GHxiAlyAsBLKMUuBZQOpUXmv3FOD97fFEMSkTOh4CKw6/ZMq6
         pOEwXWJxAFRL+d35u9/NIlQ/JVt/DU3hDVS9SmJ5yil4bKfnLUJn/T6XlYme0G2xxB55
         0P7g==
X-Forwarded-Encrypted: i=1; AHgh+Ro4WLBFbIw2Ta4M9GK44cDmen7c9mz48NmWlpV/EnO4qYt+ptnC3wcGnQ/VIT/vbGF4M8VPoWr5Qk+wmw04nRls@vger.kernel.org
X-Gm-Message-State: AOJu0YxGC9eHJXG/ksj/5no31/A7hPIIL19KzuNEmXHS5+cS1WffJPN2
	33hQUsIU0QKNTX35kGnszU8HE+j2D36zA0asbz01/h0ZV6q7AT+OK/I13sJa4RgndgD4f2mvYpf
	0VNtU9jVilIHrYq5Pl5XU9ulHEcCNx+t+dRDL2PRBVF9JzcDCvI3xQth8BJ16nkvetKHntjgd
X-Gm-Gg: AR+sD1371V9ApnHrGOIdAjbN6zVdxlqV3FNPleVkXJp1Bl7QTM1GaDAuv79DWO/S7VB
	8y85P6IIOQATBKBT+9uFYiNqoHR+nvmdQm/1SWE3faDfh58tKapq72waeDc02iJxC8kl4npzob1
	cqoBmU1V2bNZNrSwblNdLuksk81VIGyAoonyicmrb/rQyszyBa4wjJP0elpHuNVYxzE5wfuj728
	EZjQISDti51ipadgR9Hgvm1Hw4jeS3aPRqUI9DYaQ+tR8v3VpABwgAXZUCXiiCpWe09dmzrkUj/
	oscQh6lDcD8JIhmztpYqGvrs7uPZI/UQky1+7pikU5LolaDk8Bt2KDmwRu31XY2z6KXaLxopPfs
	/GdvTfkzCxIL1szpLOjXlQDzVeKPyUq+9vGJhvP9x+lOOA65Q6STnMd11PXTI
X-Received: by 2002:a17:90a:dfc5:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38f6a43eb79mr1603217a91.18.1785228043372;
        Tue, 28 Jul 2026 01:40:43 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc5:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38f6a43eb79mr1603192a91.18.1785228042873;
        Tue, 28 Jul 2026 01:40:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc66sm916277a91.10.2026.07.28.01.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:40:42 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
Date: Tue, 28 Jul 2026 16:40:10 +0800
Message-ID: <20260728084012.685036-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IHPXWxYTDQ32snb3SYpH49j3eqI47_QU
X-Proofpoint-ORIG-GUID: IHPXWxYTDQ32snb3SYpH49j3eqI47_QU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfX5fX/eqMbN9pf
 rE4L1L/FW0LqYK9iRr1cato6x5er76OiXhmXOjc9VCYZUdqiQeGrMsu8rCtorxLBbf7YE6H0BXM
 ioLvr09e4owt8y7imwCPChKXb4uEMjWhje+AIASCLhAEmeuF2hjPopiPGvqFO2B7LgyskHbgo5H
 vSwLbIn4QLhUQRId7kkOEL69N9oOU6WCvQBSsqVIuzrvr5w5nkozqZLVPukE6IPq3CObfWAtw0R
 G85SfYZbStQKsoRLnDdCk1iEGSFssSOy1BEz60IMusuHJor8Khl/99Rvlnuwn9FoDi1BN59+VvQ
 iWDfqmud45oxsU2BX0OD6g7CXCfHD+iu8jrEH+iYMQXo178Xg4Gt8e/CvaHyeRV+NS2Vg94VCxe
 O+0fohypv5KlQbtl2PhMLYhgRyAtgxWMg2hDHKeTaRodq3tmh/CxQYV5xiDueqoQjTXgpAl52Co
 dn15w9oxGBFSQ8AqyKg==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a686b0b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ubaIkse6WMRjXItqsd4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA3NCBTYWx0ZWRfXynUGVUOp1RVZ
 l7y5GBZIbPLNlVcnZbtjXciGMkXvWO+sa1UOAcPyF/d1/8UHJRe4jVwBLimwpdzQnIJXXiDOj4/
 2lnnUXQrm2Zji6dWZ3krkNT5LLgkFL8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280074

Document Always-on Subsystem side channel on Qualcomm Nord SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 9f9d9bcb66c4..d2ae2ae87a95 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,kaanapali-aoss-qmp
           - qcom,maili-aoss-qmp
           - qcom,milos-aoss-qmp
+          - qcom,nord-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
           - qcom,qdu1000-aoss-qmp
-- 
2.43.0

