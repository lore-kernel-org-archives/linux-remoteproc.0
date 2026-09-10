Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE3149158A
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052831; cv=none; b=rwbzp5KhhStDDkb3OVlt3OUk+Lke6Z+5WtGdiBe1oLRSeoWczWi9fcTDtMSQhQgl/sTVCVboPSoDNBLcxwGSdjPP9eWSlAylnCE6xy+Hzw0Bn3I91OediH/8y2G8H2qGF9OIK0+98vNOcxVN1JenaqtnLuEeAhx+7Y/Izrq4GfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052831; c=relaxed/simple;
	bh=IoRE54hligUVN4gRAMILtyfQYGutGB4mIpeILT7bp4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFw7gC6MEA6T7XsOJ54oPxOPYeiXSt9TNu46zXodC+cVkQ7ajxltAq3iajWqYQX9BTO363/TUmG0TBNuzJQka8+9OMWbWuU4l3n7WEGXBX6S6yIRdD3nwOWzFb0bAGlbYw5Aa6UED+n0jputpQSiKrO3+w5YtqPIpBwALz8QEic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYbUw7tE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GkwuPD9f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYbUw7tE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GkwuPD9f"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4an81186745
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 15:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TtYH6OpyomO
	PlQjGIp+EyoPVGRODOWoTGcxWfigai80=; b=QYbUw7tETNC97VhgOd7fxNH1u0O
	/EwtbChwr/Xcg8IP3g3NIT0/x2y727fuLbzXtM7nzyuZvZNJb+YyXqWA5ciUUb0Q
	iKiwqyHcnd2CFx6lFsYZOPELZj/frzHqK7hA0sBwI7LGEDtbvUnsvUwmNQXdujjD
	czOiM2Tyc+hEwndu1eeqyzDv6oNzoDg3jUzjT7Wz8s+YLorSckq8zaHxLcrXPfDd
	dIQ7sT7BDYnwlEJPLlOx2huub1DvN9/bNPkJReakF71szmDHFGdNOni9BbZMu54q
	1xbgDkuxVFcdKwq5cc8X8WTxAo0fs3sOyLsrtQInHS6H7JhmyWMQIPCRLGw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak9ytf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 15:07:04 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a41f46d629so11976727b6e.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Sep 2026 08:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052824; x=1789657624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TtYH6OpyomOPlQjGIp+EyoPVGRODOWoTGcxWfigai80=;
        b=GkwuPD9fLYqQgp3rUvTxKsJD5oXlHO+/BX9IumRFkRoXaC6SAO6FrpGALz8Gb/UP30
         aP5o3tvlC/oWElRdT4QZjyvHIGeEesSvPLKyLvgrIA2njMzlPnVHijQuINxR20CqDzrM
         gCH9xD0GmcJbNSf9JDxVY/sluQhaHKHsyMdcuHZ+bxZVScqUBEwbW/YTDAPJd4mGCklR
         brHVAMU0xwEgj278qhPY/a3R8SNcT29jRTEXX/a0mws0cJHkeU6YHMETEDplT3/n+6BS
         yLdEie98TSCk4iTzU4lqKpjnCWWbTA7YgBOOk2PXDv7pXipHe37UsSvE2dVhxJuRMetq
         uNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052824; x=1789657624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TtYH6OpyomOPlQjGIp+EyoPVGRODOWoTGcxWfigai80=;
        b=p+WUPjhB2nDsRE9K1+Sm1jTWTngR3P4RQ+bYngO++2KGdZtOYn0rNDxqS8N+wd6NfW
         nMuuLuJJBYqSFIVkpbormQRFc9aidRr0ICg9xzCFkOa6f0vIsHLllOVB2/MmedF2BpBo
         PLYyN61t4tx/fbbvuOxC07HA0fUQsnAAH2CuLwfH+7n3vWx/CliO2+WfveszWXSiLDeU
         Na9UAIFEZNxKvHLfKOsCOcCINSwMSfm3mvqyrkycL5eT15IA0BJo0Vi/1lCbJrG8ZUAc
         74SshNa0c+3hDqihwUXouP2hT7WcOln2kzMmzIr/Nx0VDYnxsfgBst4FxOuytps/ZRvE
         ZFwA==
X-Forwarded-Encrypted: i=1; AKwUvBw5Fw7ViS9n5mHiXa/UdK/ldpFtGMzSVMeUoJbU1anQfXQowsOc5A84UKdvJX2n1RihI2DjB+HLktAsSs/zS4yC@vger.kernel.org
X-Gm-Message-State: AFuF++lOsxte35LMUTzwgqp2VeKS6orARuav3+2Q2ZM8cXgssyJpWqIP
	U8L0zipprmJTN6d1F5ZHSgQWctEwZsP9GfUX/3D76J8WMvFe1zug4h3OuAhCU3p07XRgSyVZjGe
	DIxcq9DpGJwb/4Wgao1oML7g9hMpTm5EpU9dL1HFBkp6KsbVlfsDT4Lyy/h9t3O8/nlopbzSN
X-Gm-Gg: AYBFou0M0ZYGHKtjX+K6LMZaUdDZeItmnN7oj6AysCTOa7dBHqaq0x+bd2hbJIcGQce
	l7O6mOg/sV/MzwTLc2Zj3Wlz2FE3QhbWmUzeVWF93yAKm71GZTyj3aPRxbKClBH13XNRial0YpJ
	jn3OP1oCTHx/oLru/7VyM7jVYIrKnKNVv8EyT6F5c2076qYi77wmWqEBq3ShirfTyzyX/CmGryn
	FIAE+MWcR8p7cTHa3vLoQGJDilkDg07/gd1Dcp3pcVls/L2ffAw5J3glIud98aaecv9yVXo5XQ8
	GsEyKn3G0HgLOCSw3Kj8A4JkC3llCk0+ZOW7iez+B48RB/9tE4r+EKJvGx2USFaV2hRAAyvJiyL
	6LIAbciDWMwakU31tBD3ns+Ixq0w=
X-Received: by 2002:a05:6809:24d:10b0:4c0:12f3:6007 with SMTP id 5614622812f47-4c012f36474mr6689106b6e.4.1789052824067;
        Thu, 10 Sep 2026 08:07:04 -0700 (PDT)
X-Received: by 2002:a05:6809:24d:10b0:4c0:12f3:6007 with SMTP id 5614622812f47-4c012f36474mr6689016b6e.4.1789052823389;
        Thu, 10 Sep 2026 08:07:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b97167bd69sm19340773b6e.13.2026.09.10.08.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:07:02 -0700 (PDT)
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas standalone
Date: Thu, 10 Sep 2026 20:36:37 +0530
Message-ID: <20260910150638.3270162-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com>
References: <20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX+l4YGtxpvern
 Cb9Mhd/W5ecpfA/urJAUSE2lMHOJkw4/Tl6OvC6zdGTxYbujv11DJc4N8LpnmVdb64WqyZuQRFA
 H8Ob3/eju85rcRu+99J0lBe+nAVsltc=
X-Proofpoint-GUID: O-54qiLwvd4dzZ3Lk78-btDoPjF0K74b
X-Proofpoint-ORIG-GUID: O-54qiLwvd4dzZ3Lk78-btDoPjF0K74b
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa2c798 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=nzVwBEjDhxPf8YtRev8A:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfXxLMzKyN5dosM
 nmqk5vgc9tzfHXLDuUSo8BmQUUdHFH2AijiW2IOqyirvI3yTkkby3CVaUqJZUdrpobGhL/vJi1e
 oqosJ3/9DBlN4gw4Ojw271KAUP7hYHmIXWog0EV2hD+HeBErO0P85jYr7HoEfb9Hb8N6TV2tYfF
 XPEmSJrHAorgaKBlRrdBrnr0rOyk3lTX7SQJJXR7Po6uhIe/+1GD3yhiGkOltN9HBwgxG1dIYhd
 yL+GyEoxgsRH1xKALk9qKNJCwhh/+JKpw6A3iNyEL1RDCbLNwgjgwuHVrEQ5C1CvrEH+O7nLvHy
 eSpN+7yfzAxBM+VtHVRsaKDfVeI9HkLm/jtvuz6AROBLF2Dlnez1bf3HszUnSbLt5vv5YzbHjN7
 DA5ankDtLyzmVTGQQjsedH+5LS264Ie8LEbzW4vmeZzFYBq0AcUAnx4mLy6AcdOIttUL4vMS1+Y
 6KFjcV8ET3mTAIol0Zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100182

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

