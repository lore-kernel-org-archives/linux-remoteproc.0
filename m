Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9FC414A11
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375418; cv=none; b=IN5g8eb7GKi/w3OwwmPGfngkvcKkEFCa4GnpV7PeuUvXl0KkURZQzkYAF8i8qGDB4R7E54rva5+gZPjIpOO0ZNxLIBoajnE9XIKM1Z37ApItnv8Q6IsQMhpsVUp2kq14eDE3UEGByUHVja191sEH7tzCa6rRTCSXkcTofdoSpXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375418; c=relaxed/simple;
	bh=Fk0V5Gn4W98teq44FLwxwMugmmSjf/92S597f3NtksA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XW592eFWaYo2R+S1yUaI604pQgbBZ7SsVRk745P8JwRsWyC2NrjfRArXaPEGMX09dDomVfoXOA47rzXR5eETxnnQfRNfQpdK6Dlm611qk4HCYJTaDFIvtgnZsib01wfihie+p831m6eh5IiN9W+F5+OKcDESI7cDRLuZLMahGYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eI2hIlcb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iikKn2wK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eI2hIlcb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iikKn2wK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iejR3368736
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 08:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8lZ79DvWz2Z
	oVyX5nf93rjrFskS3i8nj6FxH0msqvVI=; b=eI2hIlcbUhmuic8oUVgPdkZdBno
	lfC26gBYU4Ua/CPf/gKx+EcLeePTV8TXGRWLnMNBOiRIHe+CqZCSNW2r6g8+HRVP
	Cfh/CksIerDnVpuwEmwy5Ti7TpHuNyvMELSKinJPpKAhQu3H70tswOidzbo9HzyT
	NYkMP8pUadUC3ooPUDW73j07QsAi9iD4WaJtrOB3Bw8HXWw8ZTPM2p39kldzpR7W
	aK3xAIDOqlaGrz0li01dZIHcRRnph5fsVnUToIst36Gfs2Jz7+ehXkeSCYUUOKow
	FqQb/wGc/oSdwCih+6RUGqYRG1pt0fmtfWN41PfrKnYJ7fAxRhuuxhA5KKA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5suw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 08:43:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so724984a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Sep 2026 01:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375407; x=1789980207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lZ79DvWz2ZoVyX5nf93rjrFskS3i8nj6FxH0msqvVI=;
        b=iikKn2wKr5C8dy9iTyAAQmt3HmMBwmGuXqDHrZ0Zct2xQbOBUZ9bYp0nYlxJGHh8As
         coT9tKDC6x8e35BNT2A5BI53yvvGLBc1xf6XcyWSWAe852qmJ2lRlNUE/wlAtUn4h5Ee
         mAwmW7LN8Zx1GI7Ie3U7rq/4fQ2TU+QoZVBo6TmcTQRf3G36kbpPhcNG8NXF+lBhugbW
         rkVRUknr5vFfyHkw9zzBqGzXQfjM4ci9e0OkjYiizpYb76dqmob11iC9/tpZACCTlOZz
         2zBoXIVVuQA0HEJs46Wfs1DvuSbzqGgOnGEg3PlVQNSEieKOMAIqA9r/JmbcaTIaUpha
         S4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375407; x=1789980207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8lZ79DvWz2ZoVyX5nf93rjrFskS3i8nj6FxH0msqvVI=;
        b=hLYOk5IvPewr7qEHMt1iD3FImepQmlQSZLaP3GMM4GdRFjbAF5uuGzIno+fBxevnJK
         gFTtwbWlHIrt88lS8qfaLkHm9BfSBQXP29P1ZsYNeP2JgHdiTAFqTOnFCvOSodGG62gk
         3w8h/Tb8njRfejHPkcKoRJfvHzwKunIpeIl3dqPJcstJ6OgIhhZ6oY7oC307buqMDUGm
         020uvlIdY8nAWLxIygpm0BN6lPTUv4Qwh1np45VVXnDeZ+q6uZTpc2XSW+LbR8AmaNMU
         3wzCqFciIDDgiUnJQ9ZMyl/dKQxuTyrq7hJZHaLNdQTstxaecx8Yk4FTjEfzwoWX93Ij
         cIog==
X-Forwarded-Encrypted: i=1; AKwUvBwLX6xEdQlsIOtbnyTxYmU0ntZRLHdx8Zr7qSIVhi20hZrxZyBLGWpyrv0CR68AdRBPXSHA/U3JFiTGzokkYMUi@vger.kernel.org
X-Gm-Message-State: AFuF++l9pkb3NEKGl8KDcZjnSIOxeBvD/fNDDeG+3jEkdh3/PRRb02g3
	zkpC68t8zReKB2BqXnFjMXuth5+l6WmZH/yN4YAFUtwswB6EV1CLr9vPKyZPMsDtklv1S0ri4V9
	RKWZ4Wj+3UJhHBmtgoNb07CMRO/WHOAw6qTCRsj112znLk6LONKj/Vqq7W3HthTRcYMsNEVvl
X-Gm-Gg: AYBFou2RklSoHtTwLBM+mKv7wjhFgeYIe6oIsC27b6UW/+WEcJoXig5VNt54ZG2OoAu
	W49uCsRwYXRfySEJQJGCloIPil513LaHC4lpEOhdqikLIiorLZlFfHXBmqc/oN2Hqe/pnrp7Aab
	BtmtHnw0kNKrvfFvK3i8zazvXxmwlBpYPMZy+zA1G/KooAbpl9jv4ZOGqFPk4tLFrd7PcZtrAWt
	p1GD/FyYmHXygK42iAStJ5oVpFWbuq+OQpiFKUH7SQ1ImYEh4MJxyOEKJKCFdtIuEXDRli2mmUD
	kHhkYC2/P02pe+7Vk8n6x1zusEbkLVO2rA0l2IqTSqwWwBux7SA9inX/Zgslh7vA746j6NQswk3
	AkPA7gtlA5QF2ffOw3xYRiZYKTDA=
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39def3e96e0mr2780242a91.10.1789375407411;
        Mon, 14 Sep 2026 01:43:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39def3e96e0mr2780175a91.10.1789375406899;
        Mon, 14 Sep 2026 01:43:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm44692673c88.12.2026.09.14.01.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:43:26 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas standalone
Date: Mon, 14 Sep 2026 14:13:11 +0530
Message-ID: <20260914084312.3812408-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
References: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7b3b0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=nzVwBEjDhxPf8YtRev8A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX885/lIqM0MJ8
 F2+X8MpgoKNvrqT4h/ftrBYjQbK2uBjwrOCTOPDND2dAJD1n/1xv1kFZqhQ9TNjx5+uV0BZ3AY5
 UtQ6enZZ6xWPCLIvwVr7RgjNS4Ae3uiwmEEj/CndzeKvCdrpJTLhYGrLmhx1t45kqO0sgXUsuOJ
 TBAGCnA9O3WNfvzS69CrBrLyum+lPAdf1rr4ulE2ObFRqNrAUeIf20mJR+RrtGsK+oOVogxxwb7
 Ag1/MjG0szMANHknh4r4WZqNV6vgikrXXEJUOYjm070CahVFGXCdz2wwmHTrbMPRC5JPC4SB0vR
 NSjnTNqbd+/hYSCcBTJAiKZyK1rqZzJRYtlInHKSVkv6xUNtRVtEs8AUHStJZ+Ngda3I69J1xSu
 Drqviv7ehv77F6Tbc2a3aiXJy+keat8LOXllKo3RF2xj0SUJSjHZPxuBqkkmmifS69fEwT+MXdf
 w76vsxf0QC4PPpX74wg==
X-Proofpoint-ORIG-GUID: VM93r74rzUs8ypwPUsFwx6n2rCn5W-Cy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfXweB2Xi5xmTMI
 jPjYArXlMJc5dTcJXnQqZfeCgj5FcDpWS1LNbvtud2zI0XJDKnuA1ymb52xJJzfdZ3PaqjQ3tl3
 Wcw9Z3Ad3VIkTHM5LceSgu6MkUQxFjc=
X-Proofpoint-GUID: VM93r74rzUs8ypwPUsFwx6n2rCn5W-Cy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140121

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.
Maili CDSP shares the same NSP power domain topology as Hawi and must
fall back to qcom,hawi-cdsp-pas rather than qcom,sm8550-cdsp-pas to
inherit the correct cx/mxc/nsp power-domain constraint.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly. Move
qcom,maili-cdsp-pas from the sm8550-cdsp-pas fallback to a new
hawi-cdsp-pas fallback items block; it is covered by the hawi
cx/mxc/nsp constraint implicitly via the contains check.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml   | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index f722c55aadf4..99e9aeeb4f62 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,eliza-cdsp-pas
+          - qcom,hawi-cdsp-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
           - qcom,sm8550-mpss-pas
@@ -27,6 +28,10 @@ properties:
           - qcom,sm8750-mpss-pas
           - qcom,x1e80100-adsp-pas
           - qcom,x1e80100-cdsp-pas
+      - items:
+          - enum:
+              - qcom,maili-cdsp-pas
+          - const: qcom,hawi-cdsp-pas
       - items:
           - enum:
               - qcom,eliza-adsp-pas
@@ -39,9 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
-              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-cdsp-pas
-              - qcom,maili-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -278,6 +281,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-cdsp-pas
               - qcom,sm8550-cdsp-pas
               - qcom,sm8650-cdsp-pas
               - qcom,x1e80100-cdsp-pas
-- 
2.55.0

