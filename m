Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8E62AD3C
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935172; cv=none; b=XKnNMO16IJfGW/BZhcyvjxyR+16ArLWo3MJzb6TeCtH73G9/VlaMGh4dgG4Btj3iO5zC4/N8tmTRoofiK4us+Yg7qt+15XMltMSwg5h3DUADLuY44hMjiZKef/Y2gApcG7//Ark0BILDAE30EKFjX7UfkcfWwG+EC6Ns65Oat6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935172; c=relaxed/simple;
	bh=AjxkvIb6V5Pdicpp5GVvYOxfo4QZxwGgvJjkCpdDa9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qx+AhV9aVibwhBKv6PFffp+uVsQdfjZu7mrJZISn8E6Bco6RrqmlwCKxaXTstG75o9i/sekewf/Qe29BTiqA+iw0wrsEqlunB8oUtPhDgTlhuaD4cXbsuFvqlXQG3VsfSID+PdKYwEKHJNAl3ghy/y12N48nmPrXdDEdXnxhsw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6A68yAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtRDkBD/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6A68yAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtRDkBD/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D994Lk793548
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 09:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=o/JP7kV5x+wObsGf+L8F0Qi1bG2iO6rzs3e
	co8f1bVg=; b=L6A68yAE9/hE0Yai7d+ysTDY2z9kADomlCdLquLd21b6xTorifa
	ddfZbuhfdYvXuClVl9kPxIv7IPlfxX2sYZVcABoxsMS65GIAtxNyp87AQH7J85Fu
	mmTujDMOwVgi3rNl5Ww6KmTqwp4TI+8DB/xFotFqdxfNfWQFIfZ6GvCMR3N/B7l9
	BQSJiII9RTWz7rIzsx+NI4x6Of4Y02URmI1PRWtAihDg76xCqLniNrP1QTGUEgRC
	aQaJ5z/6ldaVWauUV43lLa4VTHptzOT8lhJ73Grws7XgsIHRJexJzOerUk/mXv2C
	NA37a5gutwlsYsPPH7eTI4YoDPYjgLpagsg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qr2uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 09:32:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848551b54f5so5815859b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 02:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783935170; x=1784539970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o/JP7kV5x+wObsGf+L8F0Qi1bG2iO6rzs3eco8f1bVg=;
        b=KtRDkBD/g7kUuCK7V9RlfQtKu8+QrGBMqKqt2xUOFUA8vyP5hTgLHoTe9PiJ81C/Rj
         o9cxDJ64914SfhXdK3L1Y3q4cYHKI+GQs1XBgVf0QmUSaA31K++GPV/0zcL49f4RY/U4
         tjD6L9RQkzbSc+ANx7cjSBUh5kdlvD7hlQMbJTgTajofeQnEbSLYxfTl89xB46xgakiN
         mlGgzM9MtIX343Yq++OdDTKwlciW9SfOU1HIl2NInaIpigi7X90qkSwycvaLbXzo7egN
         NX037rfwAvYQa4rhDp4kLunPeJ5rAKONtZsIXmdPygm8F62tRezrn9McDIh55Eu8d73F
         n/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783935170; x=1784539970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/JP7kV5x+wObsGf+L8F0Qi1bG2iO6rzs3eco8f1bVg=;
        b=XLLQ2ocU6BtIbhovbshRLARXS5a1E/PpDzxNgwyTQGmoavh9hw/2nb4UARuFDAI2KH
         /+DW15y6BacB7g5eKeYT3ofe8CaNP5jszWu6+UQi1h4UHH+/vdKvpCXn4/ar40LBMHCx
         cZzlnA2UjPFuPM+6Rzjs5535DQ5fNEjNpSbSRcCHVFj4kEGXg/hQeTapZVZuzlnwEGZe
         wizf2TxvuYp//fm+/MEu/gTn+C58pKWyBi8xEFVUPRIgOnMkEbgaJlmokQq6yCF8cfHx
         VzS0e/NCDAzSl9SSzVYe0wi6RTRmO8Yjiej8CcGV5sX/DTM29y8M4HM767sPO3OdTuO7
         4iVg==
X-Forwarded-Encrypted: i=1; AHgh+RoRNyNiZ2Z0BOL1xUt3vUeBOmlAyEAw5yHY2oTo/a/z+wfnNDc/uaidORZfZpbRYrWgRPu/n9GSruTSx6EW5SDo@vger.kernel.org
X-Gm-Message-State: AOJu0YwgV98JZtnNQHvJW2HpbODzmu++dF+1PfCrkX27AWL3YfH1H5K0
	JFToDEV+SWUWQlyXf/WKbwIu8n7wYC4Ld4MPUHXj4CT5HGSCLrTIfbHnXsJXfeg7MAyaa2sZOiB
	sDAm+Ofv49v4NDyhBp5CnAFppz0QtBBwaHuuLMWCYOCNxLqGtMT84hGNxx5trDGfCM6GZmgzP
X-Gm-Gg: AfdE7cn3LIlYHAUS9iIcq79TI86pzi35Uz+3hvC3CDDnNteSKmA9beHMcK3lIwRZ6vE
	vI6DSbkD4Op+qx4c7jXW06RxjKay14puBgO5Oo908xhq0718CuQQFfMVbqQ4E0zelzgafHfDda6
	q7KeOTJUDR2as3CORkkrMWqsZ0i05Z77GoBqmZ5ffXQgLP6kh/0tOQflUmPkmTWCxzkXelIHf9C
	8pWwisciUY/DMtsvC3ryBA47E93cQbwIAmsG/Lnc42wdmrQCBnZSpJvek915jfpmeOBtRz7Gqqp
	56Ec+wpXhW6UQW08zsPDOmZLCUrn6v5LpF7zFMs+ToMX1inXKd7TlKAY/8w0HGdNAqkVJOzH+pb
	z4D/xHxnUrayll1NG9R7CimLF41L9KYMXwmPTaA==
X-Received: by 2002:a05:6a00:4b4e:b0:848:2f7a:2e5c with SMTP id d2e1a72fcca58-84889763ab2mr7070305b3a.75.1783935169536;
        Mon, 13 Jul 2026 02:32:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b4e:b0:848:2f7a:2e5c with SMTP id d2e1a72fcca58-84889763ab2mr7070281b3a.75.1783935169034;
        Mon, 13 Jul 2026 02:32:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b5e566sm13856577b3a.3.2026.07.13.02.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:32:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and Maili MPSS compatible
Date: Mon, 13 Jul 2026 15:02:37 +0530
Message-ID: <20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfXwVm4mllXRf/S
 K3uO4K0agQN01/97HWXo8ktBiBpT0/TqIpAzm6JIyhy9Yltg23omNcAilMLor3lDcBd0Icy+dL9
 /PYttlfArCTiT/1kiIUaabjwHFDcOwO/A2pPS8rk6MMLxoaS3Ni076ZsHLn79iuayUgAi8GZ90c
 AIxR4az9mO9FBXgzGn2AFZi+gcWgy12lKkTC1aAYqhGvKILlQaPO5riyVQR6PMCPcDvnQf+nuyW
 DvId204N5ToXzWdBXShdHFTFBLEo4w2jNdekpvuH7OUGNvhygnxg3uMlpHV7nOotW9J3Hx6Ssfo
 zHmGdqxs+yMDztzGF8UqlbPAGlZXDZANVzEqN25RfkaInOhYTAmsW9MOye5BXfwjHtXtCZT2SjC
 a+tLdZkd88AN5+PkNZotdlF8TkZmIUyAyRCFbzbUdeqEQG62rXX/qBpP/tApUw136116QivGmzG
 e7mo5tasCwFerqwI1MQ==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54b0c2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BoWwrvf6mM8Tp1CBcy4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: qtnLmLI_rLWEM27Vie3sM3gxoH2vcpkb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX3eSO/UyfDLdE
 bwptnPfhO9Cko7O0fp/JV0k59obQhayjY0W+S0MI38yI0GfHz9Eg/jerMk0WyIZSVHgcPR37igE
 reZvOfkwlbvBVKFDCEsqEIFgI2N/pyQ=
X-Proofpoint-ORIG-GUID: qtnLmLI_rLWEM27Vie3sM3gxoH2vcpkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098

Document compatible string for the MPSS Peripheral Authentication
Service on the Hawi and Maili SoCs. The Hawi and Maili MPSS is
compatible with the SM8650 MPSS (six interrupts, CX and MSS power
domains, memory region).

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index faf7b2890de8..0d9fd1598b5b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -17,6 +17,8 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-mpss-pas
+          - qcom,maili-mpss-pas
           - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
@@ -196,6 +198,8 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,hawi-mpss-pas
+            - qcom,maili-mpss-pas
             - qcom,sdx75-mpss-pas
             - qcom,sm8650-mpss-pas
     then:
@@ -246,6 +250,8 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,hawi-mpss-pas
+            - qcom,maili-mpss-pas
             - qcom,sdx75-mpss-pas
             - qcom,sm8550-mpss-pas
             - qcom,sm8650-mpss-pas
-- 
2.53.0

